import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:gap/gap.dart';
import 'package:provider/provider.dart';
import 'package:todo_app/app/extensions/context_extension.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:todo_app/app/resources/resources.dart';
import 'package:todo_app/ui/auth/auth.dart';
import 'package:todo_app/ui/auth/widget/auth_layout.dart';
import 'package:todo_app/ui/component/button.dart';
import 'package:todo_app/ui/component/divider.dart';
import 'package:todo_app/ui/component/input_field.dart';
import 'package:todo_app/ui/component/loading.dart';
import 'package:todo_app/ui/component/text_span.dart';
import 'package:todo_app/utils/alerts.dart';
import 'package:todo_app/utils/constants.dart';
import 'package:todo_app/utils/loading_handler.dart';
import 'package:todo_app/utils/validators.dart';

part "register_view.dart";

part 'register_provider.dart';
