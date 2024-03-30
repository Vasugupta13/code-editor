import 'package:flutter/material.dart';
import 'package:flutter_highlight/themes/androidstudio.dart';
import 'package:flutter_highlight/themes/dark.dart';
import 'package:flutter_highlight/themes/dracula.dart';
import 'package:flutter_highlight/themes/github.dart';
import 'package:flutter_highlight/themes/lightfair.dart';
import 'package:flutter_highlight/themes/monokai-sublime.dart';
import 'package:flutter_highlight/themes/xcode.dart';
import 'package:flutter_highlight/themes/xt256.dart';
import 'package:highlight/highlight.dart';
import 'package:highlight/languages/dart.dart';
import 'package:highlight/languages/go.dart';
import 'package:highlight/languages/java.dart';
import 'package:highlight/languages/javascript.dart';
import 'package:highlight/languages/python.dart';

String selectedTheme = 'Dark';
String selectedLanguage = "dart";
Map<String, TextStyle> currentTheme = darkTheme;

Map<String, Mode> languageMap = {
  "dart" : dart,
  "java" : java,
  "python" : python,
  "javaScript" : javascript,
  "go":go
};
Map<String, Map<String,TextStyle>> themes = {
  "AndroidStudio theme" : androidstudioTheme,
  "Dark" : darkTheme,
  "Dracula":draculaTheme,
  "Github-theme" : githubTheme,
  "Light" : lightfairTheme,
  "Monokai":monokaiSublimeTheme,
  "xcode" : xcodeTheme,
  "xt256-theme" : xt256Theme
};