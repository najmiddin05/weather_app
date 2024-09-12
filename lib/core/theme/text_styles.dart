// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';

class TextStyles extends ThemeExtension<TextStyles> {
  final TextStyle poppinsRegular18; //

  const TextStyles({
    required this.poppinsRegular18,
  });

  static TextStyles textStyles = TextStyles(
    poppinsRegular18: TextStyle(color: Colors.black, fontSize: 18, fontWeight: FontWeight.w400, fontFamily: FontFamily.poppins.name),
  );

  @override
  TextStyles copyWith({
    TextStyle? poppinsRegular18,
  }) =>
      TextStyles(
        poppinsRegular18: poppinsRegular18 ?? this.poppinsRegular18,
      );

  @override
  ThemeExtension<TextStyles> lerp(ThemeExtension<TextStyles>? other, double t) {
    if (other is! TextStyles) {
      return this;
    }
    return TextStyles(
      poppinsRegular18: TextStyle.lerp(poppinsRegular18, other.poppinsRegular18, t)!,
    );
  }
}

enum FontFamily {
  plusJakartaSans(name: "plus_jakarta_sans"),
  rubic(name: "rubic"),
  inter(name: 'inter'),
  poppins(name: 'poppins');

  const FontFamily({required this.name});
  final String name;
}
