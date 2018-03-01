import 'package:flutter/widgets.dart';

class ThemifyIcons {
  static final String fontName = "themify";
  static final int ti_user = 0xe602;
  static final int ti_close = 0xe646;
  static final int ti_bell = 0xe6b8;
  static final int ti_plus = 0xe61a;

  static final IconData user = new IconData(ti_user, fontFamily: fontName);
  static final IconData close = new IconData(ti_close, fontFamily: fontName);
  static final IconData bell = new IconData(ti_bell, fontFamily: fontName);
  static final IconData plus = new IconData(ti_plus, fontFamily: fontName);
}

class PixedenIcons {
  static final String fontName = "peicon";
  static final int data_close = 0xe680;
  static final int data_note = 0xe69d;
  static final int data_search = 0xe618;
  static final int data_newspaper = 0xe62e;
  static final int data_chat = 0xe66d;

  static final IconData close = new IconData(data_close, fontFamily: fontName);
  static final IconData note = new IconData(data_note, fontFamily: fontName);
  static final IconData newspaper = new IconData(
      data_newspaper, fontFamily: fontName);
  static final IconData search = new IconData(
      data_search, fontFamily: fontName);
  static final IconData chat = new IconData(data_chat, fontFamily: fontName);
}