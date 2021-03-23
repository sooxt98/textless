library textless;

import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';

class ThemedText extends StatelessWidget {
  const ThemedText({
    Key? key,
    required this.data,
    this.style,
    this.extra,
  }) : super(key: key);

  final String data;
  final TextStyle Function(TextTheme)? style;
  final Map<String, dynamic>? extra;

  @override
  Widget build(BuildContext context) {
    return Text(data,
        style: style!(Theme.of(context).textTheme),
        overflow: extra?["overflow"],
        maxLines: extra?["maxLine"],
        softWrap: extra?["softWrap"],
        textAlign: extra?["textAlign"],
        textScaleFactor: extra?["textScaleFactor"]);
  }

  ThemedText textless<T>(T v) =>
      (v is Map) ? styled(extra: v) : styled(style: v as TextStyle);

  ThemedText styled({TextStyle? style, Map? extra}) => ThemedText(
        data: data,
        style: (tt) => this.style!(tt).merge(style),
        extra: {...?this.extra, ...?extra},
      );

  ThemedText get lineThrough =>
      textless(TextStyle(decoration: TextDecoration.lineThrough));

  ThemedText get underline =>
      textless(TextStyle(decoration: TextDecoration.underline));
  ThemedText get overline =>
      textless(TextStyle(decoration: TextDecoration.overline));

  ThemedText color(Color v) => textless(TextStyle(color: v));
  ThemedText backgroundColor(Color v) =>
      textless(TextStyle(backgroundColor: v));
  ThemedText size(double v) => textless(TextStyle(fontSize: v));
  ThemedText height(double v) => textless(TextStyle(height: v));

  ThemedText get italic => textless(TextStyle(fontStyle: FontStyle.italic));
  ThemedText get thin => textless(TextStyle(fontWeight: FontWeight.w100));
  ThemedText get extraLight => textless(TextStyle(fontWeight: FontWeight.w200));
  ThemedText get light => textless(TextStyle(fontWeight: FontWeight.w300));
  ThemedText get regular => textless(TextStyle(fontWeight: FontWeight.normal));
  ThemedText get medium => textless(TextStyle(fontWeight: FontWeight.w500));
  ThemedText get semiBold => textless(TextStyle(fontWeight: FontWeight.w600));
  ThemedText get bold => textless(TextStyle(fontWeight: FontWeight.w700));
  ThemedText get extraBold => textless(TextStyle(fontWeight: FontWeight.w800));
  ThemedText get black => textless(TextStyle(fontWeight: FontWeight.w900));

  ThemedText get solidLine =>
      textless(TextStyle(decorationStyle: TextDecorationStyle.solid));
  ThemedText get dottedLine =>
      textless(TextStyle(decorationStyle: TextDecorationStyle.dotted));
  ThemedText get doubledLine =>
      textless(TextStyle(decorationStyle: TextDecorationStyle.double));
  ThemedText get wavyLine =>
      textless(TextStyle(decorationStyle: TextDecorationStyle.wavy));
  ThemedText get dashedLine =>
      textless(TextStyle(decorationStyle: TextDecorationStyle.dashed));

  ThemedText lineColor(Color v) => textless(TextStyle(decorationColor: v));
  ThemedText lineThickness(double v) =>
      textless(TextStyle(decorationThickness: v));

  ThemedText get alphabeticBaseline =>
      textless(TextStyle(textBaseline: TextBaseline.alphabetic));
  ThemedText get ideographicBaseline =>
      textless(TextStyle(textBaseline: TextBaseline.ideographic));

  ThemedText fontFamily(String v) => textless(TextStyle(fontFamily: v));
  ThemedText letterSpacing(double v) => textless(TextStyle(letterSpacing: v));
  ThemedText wordSpacing(double v) => textless(TextStyle(wordSpacing: v));
  ThemedText locale(Locale v) => textless(TextStyle(locale: v));
  ThemedText foreground(Paint v) => textless(TextStyle(foreground: v));
  ThemedText shadows(List<Shadow> v) => textless(TextStyle(shadows: v));
  ThemedText fontFeatures(List<FontFeature> v) =>
      textless(TextStyle(fontFeatures: v));

  ThemedText softWrap(bool v) => textless({"softWrap": v});

  ThemedText get overflowVisible =>
      textless({"overflow": TextOverflow.visible});
  ThemedText get overflowClip => textless({"overflow": TextOverflow.clip});
  ThemedText get overflowEllipsis =>
      textless({"overflow": TextOverflow.ellipsis});
  ThemedText get overflowFade => textless({"overflow": TextOverflow.fade});

  ThemedText maxLine(int v) => textless({"maxLine": v});
  ThemedText scaleFactor(double v) => textless({"textScaleFactor": v});
  ThemedText get alignLeft => textless({"textAlign": TextAlign.left});
  ThemedText get alignRight => textless({"textAlign": TextAlign.right});
  ThemedText get alignCenter => textless({"textAlign": TextAlign.center});
  ThemedText get alignJustify => textless({"textAlign": TextAlign.justify});
  ThemedText get alignStart => textless({"textAlign": TextAlign.start});
  ThemedText get alignEnd => textless({"textAlign": TextAlign.end});
}

extension ThemedTextStyle on ThemedText {}

extension TextLess on String {
  ThemedText style(TextStyle style) =>
      ThemedText(data: this, style: (t) => style);
  ThemedText get text => ThemedText(data: this);
  ThemedText get h1 => ThemedText(data: this, style: (t) => t.headline1!);
  ThemedText get h2 => ThemedText(data: this, style: (t) => t.headline2!);
  ThemedText get h3 => ThemedText(data: this, style: (t) => t.headline3!);
  ThemedText get h4 => ThemedText(data: this, style: (t) => t.headline4!);
  ThemedText get h5 => ThemedText(data: this, style: (t) => t.headline5!);
  ThemedText get h6 => ThemedText(data: this, style: (t) => t.headline6!);
  ThemedText get s1 => ThemedText(data: this, style: (t) => t.subtitle1!);
  ThemedText get s2 => ThemedText(data: this, style: (t) => t.subtitle2!);
  ThemedText get b1 => ThemedText(data: this, style: (t) => t.bodyText1!);
  ThemedText get b2 => ThemedText(data: this, style: (t) => t.bodyText2!);
  ThemedText get btn => ThemedText(data: this, style: (t) => t.button!);
  ThemedText get cap => ThemedText(data: this, style: (t) => t.caption!);
  ThemedText get ol => ThemedText(data: this, style: (t) => t.overline!);
}
