import 'dart:async';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:permission_handler/permission_handler.dart';

import 'package:shared_preferences/shared_preferences.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:url_launcher_platform_interface/url_launcher_platform_interface.dart';
import 'package:url_launcher/url_launcher_string.dart';

import '../dialogs/confirm_dialog.dart';

/* Utils */
part 'utils_launcher.dart';
part 'utils_strings.dart';
part 'utils_location.dart';

part 'theme_provider.dart';
part 'user_preferences.dart';
