import 'package:flutter/material.dart';
import 'package:my_news/constants/constants.dart';
import 'package:my_news/controller/news_api_controller.dart';
import 'package:my_news/view/bottom_screen/screens/home_screen/customtabBars.dart';
import 'package:provider/provider.dart';

import 'package:google_fonts/google_fonts.dart';

class SearchScreen extends StatefulWidget {
  const SearchScreen({super.key});

  @override
  State<SearchScreen> createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {
  TextEditingController searchController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final providerRead = context.read<NewApiService>();

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
            onPressed: () {
              Navigator.pop(context);
            },
            icon: Icon(
              Icons.arrow_back,
              color: Colors.white,
            )),
      ),
      body: NestedScrollView(
        headerSliverBuilder: (context, innerBoxIsScrolled) {
          return [
            SliverAppBar(
              backgroundColor: whiteclr,
              toolbarHeight: 180,
              automaticallyImplyLeading: false,
              flexibleSpace: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Container(
                  height: MediaQuery.of(context).size.height * 0.5,
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Padding(
                          padding: const EdgeInsets.all(10.0),
                          child: Container(
                            decoration: BoxDecoration(
                              border: Border.all(color: Colors.grey),
                              borderRadius: BorderRadius.circular(20),
                            ),
                            child: Padding(
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 12.0),
                              child: Center(
                                child: TextFormField(
                                  autocorrect: true,
                                  cursorColor: Colors.grey,
                                  onFieldSubmitted: (value) {
                                    providerRead.onSubmit(
                                        searchQuery: searchController.text);
                                    setState(() {});
                                  },
                                  controller: searchController,
                                  decoration: InputDecoration(
                                    suffixIcon: InkWell(
                                      onTap: () {
                                        providerRead.onSubmit(
                                            searchQuery: searchController.text);
                                        setState(() {});
                                      },
                                      child: Icon(Icons.search),
                                    ),
                                    hintText: "Search for news",
                                    border: InputBorder.none,
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ];
        },
        body: searchController.text.isNotEmpty
            ? CustomTabBarView(
                future:
                    providerRead.searchNews(searchQuery: searchController.text),
                category: searchController.text,
              )
            : Center(child: Text('No')),
      ),
    );
  }
}
