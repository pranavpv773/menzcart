import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:menz_cart_app/constants/colors.dart';
import 'package:menz_cart_app/home/view/widgets/carousel_banner.dart';
import 'package:menz_cart_app/home/view/widgets/circle_dot.dart';
import 'package:menz_cart_app/home/view_model/shirts.dart';

class ShirtScreen extends StatelessWidget {
  const ShirtScreen({Key? key, required this.string}) : super(key: key);
  final String string;
  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    final height = MediaQuery.of(context).size.height;

    return Scaffold(
        body: SingleChildScrollView(
      physics: const BouncingScrollPhysics(),
      child: Column(
        children: [
          HomeCarouselBanners(
            width: width,
            heights: height / 2,
            list: shirts,
          ),
          const DotIndicator(),
          ShirtCategoryCards(
            width: width,
            height: height,
          )
        ],
      ),
    ));
  }
}

class ShirtCategoryCards extends StatelessWidget {
  const ShirtCategoryCards({
    Key? key,
    required this.width,
    required this.height,
  }) : super(key: key);

  final double width;
  final double height;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        ShirtCategories(
          width: width,
          height: height,
          image:
              'https://getketchadmin.getketch.com/product/8905040617459/660/HLSH011581_1.JPG',
          caption: 'CASUAL',
        ),
        ShirtCategories(
          width: width,
          height: height,
          image:
              'https://5.imimg.com/data5/IN/BF/MY-5837050/men-formal-shirt-1000x1000.jpg',
          caption: 'FORMAL',
        ),
        ShirtCategories(
          width: width,
          height: height,
          image:
              'https://rukminim1.flixcart.com/image/612/612/kpodocw0/shirt/s/q/u/l-ronit-ap001-pushya-original-imag3uwarrta9bdy.jpeg?q=70',
          caption: 'PARTY',
        ),
      ],
    );
  }
}

class ShirtCategories extends StatelessWidget {
  const ShirtCategories({
    Key? key,
    required this.width,
    required this.height,
    required this.image,
    required this.caption,
  }) : super(key: key);

  final double width;
  final double height;
  final String image;
  final String caption;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        ContainerImage(
          width: width,
          height: height,
          image: image,
        ),
        Text(
          caption,
          style: TextStyle(
            fontWeight: FontWeight.bold,
            fontFamily: GoogleFonts.abhayaLibre().fontFamily,
          ),
        )
      ],
    );
  }
}

class ContainerImage extends StatelessWidget {
  const ContainerImage({
    Key? key,
    required this.width,
    required this.height,
    required this.image,
  }) : super(key: key);

  final double width;
  final double height;
  final String image;
  @override
  Widget build(BuildContext context) {
    return Container(
      width: width / 4,
      height: height / 6,
      decoration: BoxDecoration(
        image: DecorationImage(
          image: NetworkImage(image),
          fit: BoxFit.cover,
        ),
      ),
    );
  }
}
