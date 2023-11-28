// import 'package:flutter/material.dart';
// import 'package:provider/provider.dart';
// import 'package:world_news/controller/news_api_controller.dart';
// import 'package:world_news/screens/home_screen/widgets/tabBars/widget/custom_Container.dart';
// import 'package:world_news/widgets/shimmer/shimme_loading.dart';

// class SearchScreenOne extends StatefulWidget {
//   final String searchQuery;

//   SearchScreenOne({Key? key, required this.searchQuery}) : super(key: key);

//   @override
//   _SearchScreenOneState createState() => _SearchScreenOneState();
// }

// class _SearchScreenOneState extends State<SearchScreenOne> {
//   @override
//   Widget build(BuildContext context) {
//     return
//         // appBar: AppBar(
//         //   centerTitle: true,
//         //   elevation: 0,
//         //   leading: IconButton(
//         //       onPressed: () {
//         //         Navigator.pop(context);
//         //       },
//         //       icon: Icon(
//         //         Icons.arrow_back,
//         //         color: Colors.black,
//         //       )),
//         //   backgroundColor: Colors.white,
//         //   title: Text(
//         //     widget.searchQuery,
//         //     style: TextStyle(color: Colors.black, fontSize: 24),
//         //   ),
//         // ),
//         FutureBuilder(
//       future: context
//           .read<NewApiService>()
//           .searchNews(searchQuery: widget.searchQuery),
//       builder: (context, snapshot) {
//         if (snapshot.connectionState == ConnectionState.waiting) {
//           return ListView.builder(
//             itemBuilder: (context, index) {
//               return ShimmerLoading();
//             },
//           );
//         } else if (snapshot.hasError) {
//           return Center(
//             child: Text('Error: ${snapshot.error}'),
//           );
//         } else {
//           final searchResults = context.watch<NewApiService>().apidata.articles;

//           if (searchResults != null && searchResults.isNotEmpty) {
//             return ListView.separated(
//               separatorBuilder: (context, index) {
//                 return SizedBox(
//                   height: 15,
//                 );
//               },
//               itemCount: searchResults.length,
//               itemBuilder: (context, index) {
//                 return Padding(
//                   padding: const EdgeInsets.all(8.0),
//                   child: CustomContainer(index: index),
//                 );
//               },
//             );
//           } else {
//             return Center(
//               child: Text('No search results found'),
//             );
//           }
//         }
//       },
//     );
//   }
// }
