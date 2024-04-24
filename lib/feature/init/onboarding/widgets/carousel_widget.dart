import 'package:carousel_slider/carousel_slider.dart';
import 'package:dots_indicator/dots_indicator.dart';
import 'package:flutter/material.dart';

import '../../../../core/ui/utils/paths/colors_utils.dart';
import '../../../../core/ui/utils/size/size_config.dart';

class CarouselWidget extends StatefulWidget {
  final Widget item1;
  final Widget item2;
  final Widget item3;
  const CarouselWidget({
    super.key,
    required this.item1,
    required this.item2,
    required this.item3,
  });
  @override
  State<CarouselWidget> createState() => _CarouselWidget();
}

class _CarouselWidget extends State<CarouselWidget> {
  CarouselController controller = CarouselController();
  int currentIndex = 0;
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Column(
      children: [
        Container(
            alignment: Alignment.center,
            child: CarouselSlider(
              items: [
                widget.item1,
                widget.item2,
                widget.item3,
              ],
              carouselController: controller,
              options: CarouselOptions(
                  initialPage: 0,
                  enableInfiniteScroll: false,
                  reverse: false,
                  autoPlay: false,
                  autoPlayAnimationDuration: const Duration(milliseconds: 200),
                  scrollDirection: Axis.horizontal,
                  viewportFraction: 1,
                  onPageChanged: (index, reason) {
                    setState(() {
                      currentIndex = index;
                    });
                  }),
            )),
        SizedBox(height: 1*SizeConfig.heightMultiplier,),
        Container(
          alignment: Alignment.center,
          child: DotsIndicator(
            dotsCount: 3,
            position: currentIndex,
            onTap: (index) {
              controller.animateToPage(index);
            },
            decorator: DotsDecorator(
              color: colors.neutral300,
              activeColor: colors.primary500,
              size: const Size.square(9.0),
              activeSize: Size(6 * SizeConfig.widthMultiplier,
                  1 * SizeConfig.heightMultiplier),
              activeShape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(5.0)),
            ),
          ),
        )
      ],
    );
  }
}
