import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:my_news/controller/news_api_controller.dart';
import 'package:provider/provider.dart';

class NewsFullScreen extends StatefulWidget {
  NewsFullScreen({Key? key, required this.index}) : super(key: key);

  final int index;

  @override
  State<NewsFullScreen> createState() => _NewsFullScreenState();
}

class _NewsFullScreenState extends State<NewsFullScreen> {
  @override
  Widget build(BuildContext context) {
    var providerwatch = context.watch<NewApiService>();

    return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.black,
          centerTitle: true,
          title: Text(
            "NEWS",
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
        body: CustomScrollView(
          slivers: [
            SliverAppBar(
              automaticallyImplyLeading: false,
              stretch: true,
              flexibleSpace: Container(
                width: double.infinity,
                height: 350,
                decoration: BoxDecoration(
                    image: DecorationImage(
                        fit: BoxFit.cover,
                        image: NetworkImage(providerwatch
                            .apidata.articles![widget.index].urlToImage
                            .toString())),
                    color: Colors.black.withOpacity(0.04),
                    borderRadius: BorderRadius.only(
                        bottomLeft: Radius.circular(20),
                        bottomRight: Radius.circular(20))),
              ),
              toolbarHeight: 350,
              backgroundColor: Colors.white,
              elevation: 0,
              floating: false,
              snap: false,
              pinned: false,
            ),
            SliverList(
                delegate: SliverChildBuilderDelegate(
              childCount: 1,
              (context, index) => Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 15, vertical: 15),
                child: SingleChildScrollView(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Text(
                        providerwatch.apidata.articles![widget.index].title
                            .toString(),
                        style: GoogleFonts.robotoSlab(
                            fontSize: 20, fontWeight: FontWeight.bold),
                        textAlign: TextAlign.justify,
                      ),
                      SizedBox(
                        height: 15,
                      ),
                      Container(
                        decoration: BoxDecoration(
                            color: Colors.grey.shade200,
                            borderRadius: BorderRadius.circular(20)),
                        child: Padding(
                          padding: const EdgeInsets.all(10.0),
                          child: Column(
                            children: [
                              Text(
                                providerwatch
                                    .apidata.articles![widget.index].description
                                    .toString(),
                                style: TextStyle(fontSize: 16, height: 1.8),
                                textAlign: TextAlign.justify,
                              ),
                            ],
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 20,
                      ),
                    ],
                  ),
                ),
              ),
            ))
          ],
        ));
  }
}
