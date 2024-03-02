import 'dart:io';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:provider/provider.dart';
import 'package:todo_app/app/extensions/context_extension.dart';
import 'package:todo_app/app/resources/icon.dart';
import 'package:todo_app/app/resources/resources.dart';
import 'package:todo_app/ui/auth/auth.dart';
import 'package:todo_app/ui/auth/widget/auth_layout.dart';
import 'package:todo_app/ui/component/button.dart';
import 'package:todo_app/ui/component/divider.dart';
import 'package:todo_app/ui/component/input_field.dart';
import 'package:todo_app/ui/component/text_span.dart';
import 'package:todo_app/utils/alerts.dart';
import 'package:todo_app/utils/loading_handler.dart';
import 'package:todo_app/utils/validators.dart';

part 'login_provider.dart';

part 'login_view.dart';
