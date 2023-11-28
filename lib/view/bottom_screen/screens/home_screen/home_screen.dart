import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:my_news/constants/constants.dart';
import 'package:my_news/utils/image_constant.dart';
import 'package:my_news/view/bottom_screen/screens/home_screen/customtabBars.dart';

class HomeScreen extends StatefulWidget {
  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 5,
      child: NestedScrollView(
        headerSliverBuilder: (context, innerBoxIsScrolled) => [
          SliverAppBar(
            flexibleSpace: Padding(
              padding: const EdgeInsets.all(10.0),
              child: Container(
                height: 270,
                child: CarouselSlider.builder(
                  itemCount: ImageConstants.newschannels.length,
                  itemBuilder: (context, index, index1) {
                    return Container(
                      margin: EdgeInsets.all(8.0),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10.0),
                        image: DecorationImage(
                          image: AssetImage(ImageConstants.newschannels[index]),
                          fit: BoxFit.cover,
                        ),
                      ),
                    );
                  },
                  options: CarouselOptions(
                    height: 250,
                    enlargeCenterPage: true,
                    autoPlay: true,
                    aspectRatio: 16 / 9,
                    autoPlayCurve: Curves.fastOutSlowIn,
                    enableInfiniteScroll: true,
                    autoPlayAnimationDuration: Duration(milliseconds: 800),
                    viewportFraction: 0.8,
                  ),
                ),
              ),
            ),
            toolbarHeight: 200,
            backgroundColor: whiteclr,
            elevation: 0,
            floating: false,
            snap: false,
            pinned: false,
          ),
          SliverAppBar(
            toolbarHeight: 5,
            backgroundColor: whiteclr,
            automaticallyImplyLeading: false,
            elevation: 0,
            floating: true,
            snap: true,
            pinned: true,
            bottom: TabBar(
              indicatorColor: Colors.blue.shade900,
              indicatorWeight: 5,
              indicatorSize: TabBarIndicatorSize.label,
              isScrollable: true,
              labelStyle: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
              labelColor: primaryClr,
              unselectedLabelColor: Colors.grey.shade500,
              tabs: const [
                Tab(text: 'Trending'),
                Tab(text: 'Health'),
                Tab(text: 'Sports'),
                Tab(text: 'Politics'),
                Tab(text: 'Business'),
              ],
            ),
          )
        ],
        body: TabBarView(
          children: [
            CustomTabBarView(category: "trending"),
            CustomTabBarView(category: "health"),
            CustomTabBarView(category: "sports"),
            CustomTabBarView(category: "politics"),
            CustomTabBarView(category: "business"),
          ],
        ),
      ),
    );
  }
}
