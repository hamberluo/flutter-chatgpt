import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:quiver/strings.dart';

class CImage extends StatelessWidget {
  const CImage(
    this.url, {
    super.key,
    this.height,
    this.width,
    this.color,
    this.fit,
  });

  final String url;
  final double? height;
  final double? width;
  final Color? color;
  final BoxFit? fit;

  @override
  Widget build(BuildContext context) {
    assert(!_checkNetwork, 'Network image is not supported');
    if (_checkSvg) {
      return SvgPicture.asset(
        url,
        height: height,
        width: width,
        colorFilter: color == null ? null : ColorFilter.mode(color!, BlendMode.srcIn),
        fit: fit ?? BoxFit.contain,
      );
    } else {
      return Image.asset(
        url,
        height: height,
        width: width,
        color: color,
        fit: fit,
      );
    }
  }

  bool get _checkSvg => equalsIgnoreCase(_urlSuffix, 'svg');

  bool get _checkNetwork => url.toLowerCase().startsWith('http');

  String get _urlSuffix {
    final list = url.split('.');
    if (list.length < 2) return '';
    return list.last;
  }
}
