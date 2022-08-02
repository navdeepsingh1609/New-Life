import 'package:flutter/material.dart';
import 'package:new_life/utils/global_variables.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../utils/colors.dart';

class WebSreenLayout extends StatefulWidget {
  const WebSreenLayout({Key? key}) : super(key: key);

  @override
  State<WebSreenLayout> createState() => _WebSreenLayoutState();
}

class _WebSreenLayoutState extends State<WebSreenLayout> {
  int _page = 0;
  late PageController pageController;

  @override
  void initState() {
    super.initState();
    pageController = PageController();
  }

  @override
  void dispose() {
    super.dispose();
    pageController.dispose();
  }

  void navigationTapped(int page) {
    pageController.jumpToPage(page);
    setState(() {
      _page = page;
    });
  }

  void onPageChanged(int page) {
    setState(() {
      _page = page;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: mobileBackgroundColor,
        centerTitle: false,
        title: SvgPicture.asset(
          "assets/NewLife.svg",
          color: primaryColor,
          height: 32,
        ),
        actions: [
          IconButton(
            onPressed: () => navigationTapped(0),
            icon: SvgPicture.asset(
              "assets/home.svg",
              height: 40.0,
              width: 40.0,
              allowDrawingOutsideViewBox: true,
            ),
          ),
          IconButton(
            onPressed: () => navigationTapped(1),
            icon: SvgPicture.asset(
              "assets/search.svg",
              height: 40.0,
              width: 40.0,
              allowDrawingOutsideViewBox: true,
            ),
          ),
          IconButton(
            onPressed: () => navigationTapped(2),
            icon: SvgPicture.asset(
              "assets/add.svg",
              height: 40.0,
              width: 40.0,
              allowDrawingOutsideViewBox: true,
            ),
          ),
          IconButton(
            onPressed: () => navigationTapped(3),
            icon: SvgPicture.asset(
              "assets/icons/Chat.svg",
              height: 40.0,
              width: 40.0,
              allowDrawingOutsideViewBox: true,
            ),
          ),
          IconButton(
            onPressed: () => navigationTapped(4),
            icon: SvgPicture.asset(
              "assets/profile.svg",
              height: 40.0,
              width: 40.0,
              allowDrawingOutsideViewBox: true,
            ),
          ),
          IconButton(
            onPressed: () => navigationTapped(5),
            icon: Icon(
              Icons.messenger_outline,
              color: _page == 5 ? primaryColor : secondaryColor,
            ),
          )
        ],
      ),
      body: PageView(
          physics: const NeverScrollableScrollPhysics(),
          children: homeScreenItems,
          controller: pageController,
          onPageChanged: onPageChanged),
    );
  }
}
