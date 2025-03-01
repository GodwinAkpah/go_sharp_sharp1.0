import 'dart:async';
import 'dart:convert';
import 'dart:io';
import 'dart:typed_data';

import 'package:another_flushbar/flushbar_helper.dart';
import 'package:device_info_plus/device_info_plus.dart';
import 'package:file_picker/file_picker.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'package:image_picker/image_picker.dart';
import 'package:intl/intl.dart';

import 'package:permission_handler/permission_handler.dart';

class MainUtils {
//----------------------------DATE PICKER------------------------------------
  static Future<DateTime> selectDate({
    required BuildContext context,
    required DateTime initialDate,
    DateTime? minDate,
    DateTime? lastDate,
  }) async {
    if (Platform.isIOS) {
      DateTime? selectedDateTime;
      final DateTime? picked = await showCupertinoModalPopup(
          context: context,
          builder: (BuildContext context) => CupertinoActionSheet(
                actions: [
                  Container(
                    height: 216,
                    padding: const EdgeInsets.only(top: 6.0),
                    // The Bottom margin is provided to align the popup above the system navigation bar.
                    margin: EdgeInsets.only(
                      bottom: MediaQuery.of(context).viewInsets.bottom,
                    ),
                    // Provide a background color for the popup.
                    color:
                        CupertinoColors.systemBackground.resolveFrom(context),
                    // Use a SafeArea widget to avoid system overlaps.
                    child: SafeArea(
                      top: false,
                      child: CupertinoDatePicker(
                        onDateTimeChanged: (newTime) {
                          selectedDateTime = newTime;
                        },
                        initialDateTime: initialDate,
                        mode: CupertinoDatePickerMode.date,
                        maximumDate:
                            DateTime.now().add(const Duration(days: 365 * 20)),
                        minimumDate: minDate,
                      ),
                    ),
                  )
                ],
                cancelButton: CupertinoActionSheetAction(
                  child: const Text(
                    'Done',
                  ),
                  onPressed: () {
                    Navigator.of(context).pop();
                  },
                ),
              ));
      if (selectedDateTime != null) {
        return selectedDateTime!;
      } else if (picked != null && picked != initialDate) {
        return picked;
      }
    } else {
      final DateTime? picked = await showDatePicker(
          context: context,
          initialDate: initialDate,
          initialDatePickerMode: DatePickerMode.day,
          firstDate: minDate ??
              DateTime.now().subtract(
                  const Duration(days: 365 * 10)), // 10 years before today
          lastDate:
              lastDate ?? DateTime.now().add(const Duration(days: 365 * 10)),
          builder: (context, widget) {
            return widget!;
          });
      if (picked != null && picked != initialDate) {
        return picked;
      }
    }
    /*final DateTime? selected = await showDatePicker(
      context: context,
      initialDate: initialDate,
      firstDate: DateTime(2010),
      lastDate: DateTime(2025),

    );
    if (selected != null && selected != initialDate){
      return selected;
    }*/
    return initialDate;
  }

//------------------------------TIME PICKER ---------------------------------
  static Future<TimeOfDay> selectTime(
      {required BuildContext context, required TimeOfDay initialTime}) async {
    final TimeOfDay? selected = await showTimePicker(
      context: context,
      initialTime: initialTime,
    );
    if (selected != null && selected != initialTime) {
      return selected;
    }
    return initialTime;
  }

  // -------------CROP IMAGE FUNCTION --------------------

  static Future<String?> pickImage(BuildContext context) async {
    try {
      final String? selectedImagePath = await showModalBottomSheet<String>(
        context: context,
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.vertical(top: Radius.circular(20.0)),
        ),
        isScrollControlled: true,
        builder: (context) {
          return StatefulBuilder(
            builder: (BuildContext context, StateSetter setState) {
              return Container(
                padding:
                    const EdgeInsets.symmetric(horizontal: 24, vertical: 24),
                height: 290,
                width: MediaQuery.sizeOf(context).width,
                decoration: BoxDecoration(
                  color: Colors.white,
                  shape: BoxShape.rectangle,
                  borderRadius:
                      const BorderRadius.vertical(top: Radius.circular(20)),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text('Upload Image',
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.w600,
                        )),
                    const SizedBox(height: 4),
                    Text('Choose your image location.',
                        style: TextStyle(
                          fontSize: 13,
                          fontWeight: FontWeight.w400,
                        )),
                    const SizedBox(height: 30),
                    ListTile(
                      onTap: () async {
                        Navigator.of(context).pop(
                            await _pickImageFromSource(ImageSource.camera));
                      },
                      leading: CircleAvatar(
                        radius: 20,
                        backgroundColor: HexColor("#F5F5F5"),
                        child: SizedBox(
                          height: 24,
                          width: 24,
                          child: Center(child: Icon(Icons.camera)),
                        ),
                      ),
                      title: Text('Take a picture',
                          style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.w500,
                          )),
                    ),
                    Divider(color: HexColor("#6060604D")),
                    ListTile(
                      onTap: () async {
                        Navigator.of(context).pop(
                            await _pickImageFromSource(ImageSource.gallery));
                      },
                      leading: CircleAvatar(
                        radius: 20,
                        backgroundColor: HexColor("#F5F5F5"),
                        child: SizedBox(
                          height: 24,
                          width: 24,
                          child: Center(child: Icon(Icons.camera)),
                        ),
                      ),
                      title: Text('Select Image From Gallery',
                          style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.w500,
                          )),
                    ),
                  ],
                ),
              );
            },
          );
        },
      );

      // Return the selected image path or null if canceled
      return selectedImagePath;
    } catch (e, s) {
      debugPrint("Error in pickImage: $e");
      debugPrint("Stacktrace: $s");
      return null;
    }
  }

// Helper function to pick image
  static Future<String?> _pickImageFromSource(ImageSource source) async {
    final ImagePicker imagePicker = ImagePicker();
    final XFile? image = await imagePicker.pickImage(source: source);

    if (image != null) {
      return image.path;
      // Crop the selected image
    }

    return null;
  }

  static String formatDate(DateTime date, {String format = 'yyyy/MM/dd'}) {
    final formatter = DateFormat(format);
    return formatter.format(date);
  }

  static Future<PermissionStatus> _getImagePermission() async {
    // Check current permission status
    PermissionStatus permission = await Permission.photos.status;

    if (permission.isGranted) {
      // Permission already granted
      return permission;
    } else if (permission.isDenied || permission.isLimited) {
      // Request permission again
      PermissionStatus newPermissionStatus = await Permission.photos.request();
      if (newPermissionStatus.isGranted) {
        return newPermissionStatus;
      } else if (newPermissionStatus.isPermanentlyDenied) {
        // User must enable permission in settings
        await openAppSettings();
        return newPermissionStatus;
      } else {
        // Handle other statuses if needed (e.g., restricted, limited)
        return newPermissionStatus;
      }
    } else if (permission.isPermanentlyDenied) {
      // Permission is permanently denied; redirect to settings
      await openAppSettings();
      return permission;
    } else {
      // Handle edge cases
      return permission;
    }
  }

  static Future<String?> getFile(BuildContext context) async {
    try {
      // Check if permission is granted
      PermissionStatus permissionStatus = await _getFilePermission();
      if (permissionStatus != PermissionStatus.granted) {
        await _getFilePermission();
        _handleInvalidPermissionsFile(permissionStatus, context);
        return null;
      }

      // Permission granted, proceed with file selection
      final FilePickerResult? result = await FilePicker.platform.pickFiles();

      if (result != null && result.files.isNotEmpty) {
        // Capture the selected file path
        final String filePath = result.files.single.path!;
        return filePath;
      } else {
        // Show error message if no file was selected
        FlushbarHelper.createError(message: "Permission Denied" ?? '')
            .show(context);
      }
    } catch (e, s) {
      debugPrint("Error: $e");
      debugPrint("Stacktrace: $s");
    }

    // Return null if no file was selected
    return null;
  }

  static bool isImage(String filePath) {
    final imageExtensions = ['jpg', 'jpeg', 'png', 'gif', 'bmp', 'webp'];
    final fileExtension = filePath.split('.').last.toLowerCase();
    return imageExtensions.contains(fileExtension);
  }

  static Future<PermissionStatus> _getFilePermission() async {
    PermissionStatus permission = PermissionStatus.denied;
    DeviceInfoPlugin plugin = DeviceInfoPlugin();
    AndroidDeviceInfo android = await plugin.androidInfo;
    if (android.version.sdkInt < 33) {
      if (await Permission.storage.request().isGranted) {
        permission = PermissionStatus.granted;
      } else if (await Permission.storage.request().isPermanentlyDenied) {
        await openAppSettings();
      } else if (await Permission.audio.request().isDenied) {
        permission = PermissionStatus.permanentlyDenied;
      }
    } else {
      if (await Permission.photos.request().isGranted) {
        permission = PermissionStatus.granted;
      } else if (await Permission.photos.request().isPermanentlyDenied) {
        await openAppSettings();
      } else if (await Permission.photos.request().isDenied) {
        permission = PermissionStatus.denied;
      }
    }
    return permission;
  }

  static void _handleInvalidPermissions(
      PermissionStatus permissionStatus, BuildContext context) {
    if (permissionStatus == PermissionStatus.denied ||
        permissionStatus == PermissionStatus.permanentlyDenied) {
      // Handle the case when the permission is denied or permanently denied
      FlushbarHelper.createError(message: "Permission Denied" ?? '')
          .show(context);
    }
  }

  static void _handleInvalidPermissionsFile(
      PermissionStatus permissionStatus, BuildContext context) async {
    if (permissionStatus == PermissionStatus.denied) {
      FlushbarHelper.createError(message: "Permission Denied" ?? '')
          .show(context);
    } else if (permissionStatus == PermissionStatus.permanentlyDenied) {
      FlushbarHelper.createError(message: "Permission Denied" ?? '')
          .show(context);
    }
  }

  String colorToString(Color color) {
    return color.value.toRadixString(16).padLeft(8, '0');
  }

  Color stringToColor(String colorString) {
    // Remove the '#' character if present
    if (colorString.startsWith('#')) {
      colorString = colorString.substring(1);
    }
    // Ensure the string is a valid 8-character hex by adding 'FF' for full opacity if needed
    if (colorString.length == 6) {
      colorString = 'FF$colorString';
    }
    // Parse the color string as a 32-bit integer
    return Color(int.parse(colorString, radix: 16));
  }

  Uint8List decodeBase64Image(String base64String) {
    return base64Decode(base64String);
  }
}

class HexColor extends Color {
  static int _getColorFromHex(String hexColor) {
    hexColor = hexColor.toUpperCase().replaceAll("#", "");
    if (hexColor.length == 6) {
      hexColor = "FF$hexColor";
    }
    return int.parse(hexColor, radix: 16);
  }

  HexColor(final String hexColor) : super(_getColorFromHex(hexColor));
}
