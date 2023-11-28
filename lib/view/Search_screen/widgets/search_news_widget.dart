// import 'package:flutter/material.dart';
// import 'package:provider/provider.dart';
// import 'package:world_news/controller/news_api_controller.dart';

// class SearchNews extends StatelessWidget {
//   SearchNews({
//     Key? key,
//   }) : super(key: key);

//   TextEditingController searchcontroller = TextEditingController();

//   @override
//   Widget build(BuildContext context) {
//     var providerWatch = context.watch<NewApiService>();
//     var providerRead = context.read<NewApiService>();
//     return Container(
//       height: MediaQuery.of(context).size.height * 0.5,
//       child: Padding(
//         padding: const EdgeInsets.all(8.0),
//         child: Column(
//           crossAxisAlignment: CrossAxisAlignment.start,
//           mainAxisAlignment: MainAxisAlignment.center,
//           children: [
//             Text(
//               'Search News',
//               style: TextStyle(fontSize: 24),
//             ),
//             const SizedBox(height: 5),
//             Text(
//               'News from all over the world',
//               style: Theme.of(context).textTheme.bodySmall,
//             ),
//             const SizedBox(height: 20),
//             Padding(
//               padding: const EdgeInsets.all(10.0),
//               child: Container(
//                 decoration: BoxDecoration(
//                     border: Border.all(color: Colors.grey),
//                     borderRadius: BorderRadius.circular(20)),
//                 child: Padding(
//                   padding: const EdgeInsets.symmetric(horizontal: 12.0),
//                   child: Center(
//                       child: TextFormField(
//                     autocorrect: true,
//                     cursorColor: Colors.grey,
//                     onFieldSubmitted: (value) {
//                       providerRead.searchNews(
//                           searchQuery: searchcontroller.text);
//                       // providerRead.isLoading = true;
//                       // providerWatch.searchcontroller.text = value;
//                     },
//                     controller: searchcontroller,
//                     decoration: InputDecoration(
//                       suffixIcon: Icon(Icons.search),
//                       hintText: "Search for news",
//                       border: InputBorder.none,
//                     ),
//                   )),
//                 ),
//               ),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }
