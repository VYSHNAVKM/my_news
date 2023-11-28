// import 'package:flutter/material.dart';
// import 'package:my_news/constants/constants.dart';
// import 'package:my_news/controller/bottom_controller/bottom_controller.dart';
// import 'package:my_news/controller/bottom_navi.dart';
// import 'package:my_news/controller/news_api_controller.dart';
// import 'package:my_news/utils/color_constant.dart';
// import 'package:provider/provider.dart';

// // ignore: must_be_immutable
// class ScreenHome extends StatefulWidget {
//   ScreenHome({
//     Key? key,
//   }) : super(key: key);

//   @override
//   State<ScreenHome> createState() => _ScreenHomeState();
// }

// class _ScreenHomeState extends State<ScreenHome> {
//   @override
//   void initState() {
//     context.read<NewApiService>().getdata();
//     super.initState();
//   }

//   @override
//   Widget build(BuildContext context) {
//     var providerRead = context.read<ButtonActionController>();
//     var providerWatch = context.watch<ButtonActionController>();
//     return Scaffold(
//       bottomNavigationBar: BottomNavigationBar(
//         backgroundColor: Colors.black,
//         currentIndex: providerWatch.currentIndex,
//         onTap: (value) {
//           providerRead.bottomOntap(index: value);
//         },
//         showSelectedLabels: false,
//         showUnselectedLabels: false,
//         selectedItemColor: primaryClr,
//         unselectedItemColor: Colors.grey,
//         items: [
//           BottomNavigationBarItem(
//             icon: providerWatch.currentIndex == 0
//                 ? Container(
//                     decoration: BoxDecoration(
//                         color: secondaryclr,
//                         borderRadius: BorderRadius.circular(15)),
//                     child: Padding(
//                       padding: const EdgeInsets.all(8.0),
//                       child: Icon(Icons.home),
//                     ))
//                 : Icon(Icons.home),
//             label: 'Home',
//           ),
//           BottomNavigationBarItem(
//             icon: providerWatch.currentIndex == 1
//                 ? Icon(Icons.search)
//                 : Icon(Icons.bookmark),
//             label: 'Bookmark',
//           ),
//         ],
//       ),
//       body: providerWatch.screens[providerWatch.currentIndex],
//     );
//   }
// }

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:my_news/controller/bottom_controller/bottom_controller.dart';
import 'package:my_news/utils/color_constant.dart';
import 'package:my_news/view/Search_screen/search_screen.dart';
import 'package:provider/provider.dart';

class BottomScreen extends StatefulWidget {
  const BottomScreen({super.key});

  @override
  State<BottomScreen> createState() => _BottomScreenState();
}

class _BottomScreenState extends State<BottomScreen> {
  @override
  Widget build(BuildContext context) {
    final providerread = Provider.of<BottomController>(context);
    final providerWatch = context.watch<BottomController>();
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.black,
          elevation: 0,
          centerTitle: true,
          title: Text(
            "My News",
            style: GoogleFonts.robotoSlab(color: Colors.white, fontSize: 24),
          ),
          leading: IconButton(
              onPressed: () {},
              icon: Icon(
                Icons.person,
                color: Colors.white,
              )),
          actions: [
            IconButton(
                onPressed: () {
                  Navigator.of(context).push(MaterialPageRoute(
                    builder: (context) => SearchScreen(),
                  ));
                },
                icon: Icon(
                  Icons.search,
                  color: Colors.white,
                )),
          ],
        ),
        body: providerWatch.screens[providerWatch.selectedIndex],
        bottomNavigationBar: BottomNavigationBar(
            backgroundColor: ColorConstants.primaryBlack,
            selectedFontSize: 20,
            selectedIconTheme:
                IconThemeData(color: ColorConstants.primaryWhite, size: 40),
            selectedItemColor: ColorConstants.primaryWhite,
            selectedLabelStyle: TextStyle(fontWeight: FontWeight.bold),
            unselectedItemColor: Colors.grey,
            unselectedLabelStyle: TextStyle(fontWeight: FontWeight.bold),
            items: const <BottomNavigationBarItem>[
              BottomNavigationBarItem(
                icon: Icon(Icons.home),
                label: 'HOME',
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.person),
                label: 'PROFILE',
              ),
            ],
            currentIndex: providerread.selectedIndex,
            onTap: (value) {
              providerread.onItemTapped(value);
            }));
  }
}
