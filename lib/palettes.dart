import 'dart:ui';

class Palette {
  final Color textColor;
  final List<Color> gradientColors;

  const Palette(this.textColor, this.gradientColors);
}

const palettes = [
  Palette(
      const Color(0xee000000),
      [
        const Color(0xffffffff),
        const Color(0xffffffff)
      ]
  ),
  Palette(
      const Color(0xffffffff),
      [
        // const Color(0xff2b1d42),
        const Color(0xff4a2f48),
        const Color(0xff8f3d4b),
        // const Color(0xfff3b88d),
        // const Color(0xfffceccb),
      ]
  ),
  Palette(
      const Color(0xee000000),
      [
        const Color(0xff978e7a),
        const Color(0xffcacdc7),
        const Color(0xfff1d7c3),
      ]
  ),
  Palette(
      const Color(0xffffffff),
      [
        const Color(0xff403f85),
        const Color(0xff754382),
      ]
  ),
  Palette(
      const Color(0xffffffff),
      [
        const Color(0xff20115b),
        const Color(0xff7232f2),
        const Color(0xffc876ff),
      ]
  ),
  Palette(
      const Color(0xee000000),
      [
        const Color(0xfffd6051),
        const Color(0xffff8967),
        const Color(0xfffec051),
      ]
  ),
  Palette(
      const Color(0xffffe9ad),
      [
        const Color(0xff24344b),
        const Color(0xff7597c5),
        const Color(0xfff7c3da),
      ]
  ),
  Palette(
      const Color(0xffede5ce),
      [
        const Color(0xff002b44),
        const Color(0xff004972),
        const Color(0xff016d9c),
      ]
  ),
  Palette(
      const Color(0xffffffff),
      [
        const Color(0xff6c554f),
        const Color(0xff8c7871),
        const Color(0xffa99c8b),
      ]
  ),
  Palette(
      const Color(0xffffffff),
      [
        const Color(0xff811d5e),
        const Color(0xfffd2f24),
      ]
  ),
  Palette(
      const Color(0xee000000),
      [
        const Color(0xff57619c),
        const Color(0xff7fa8d4),
        const Color(0xffe1e0f0),
      ]
  ),
];
