import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

sealed class AppIcons {
  AppIcons._();

  static SvgPicture cloudWithSun = SvgPicture.asset("assets/icons/cloud_with_sun.svg");
  static SvgPicture cloud = SvgPicture.asset("assets/icons/cloud.svg");
  static SvgPicture fog = SvgPicture.asset("assets/icons/fog.svg");
  static SvgPicture sun = SvgPicture.asset("assets/icons/sun.svg");
  static SvgPicture thunder = SvgPicture.asset("assets/icons/thunder.svg");
  static SvgPicture locationIcon = SvgPicture.asset("assets/icons/location_icon.svg");
  static SvgPicture feels = SvgPicture.asset("assets/icons/feels.svg");
  static SvgPicture wind = SvgPicture.asset("assets/icons/wind.svg");
  static SvgPicture humidity = SvgPicture.asset("assets/icons/humidity.svg");
  static SvgPicture search = SvgPicture.asset("assets/icons/search.svg");
  static SvgPicture sunUnder1 = SvgPicture.asset("assets/icons/sun_under_1.svg");
  static SvgPicture sunUnder2 = SvgPicture.asset("assets/icons/sun_under_2.svg");
  static SvgPicture sunUnder3 = SvgPicture.asset("assets/icons/sun_under_3.svg");
}

extension ExtSvg on SvgPicture {
  SvgPicture copyWith({double? height, double? width, Color? color}) {
    return SvgPicture(
      bytesLoader,
      height: height ?? this.height,
      width: width ?? this.width,
      colorFilter: color != null ? ColorFilter.mode(color, BlendMode.srcIn) : colorFilter,
    );
  }
}
