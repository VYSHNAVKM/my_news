import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:my_news/controller/news_api_controller.dart';
import 'package:provider/provider.dart';
import 'package:intl/intl.dart';

class CustomContainer extends StatefulWidget {
  CustomContainer({super.key, required this.index});

  final int index;

  @override
  State<CustomContainer> createState() => _CustomContainerState();
}

class _CustomContainerState extends State<CustomContainer> {
  @override
  Widget build(BuildContext context) {
    var providerwatch = context.watch<NewApiService>();

    return Container(
        decoration: BoxDecoration(
            border: Border.all(color: Colors.grey, width: 1),
            borderRadius: BorderRadius.circular(15)),
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            children: [
              Container(
                height: 150,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(15),
                        topRight: Radius.circular(15)),
                    image: DecorationImage(
                        fit: BoxFit.cover,
                        image: NetworkImage(providerwatch
                            .apidata.articles![widget.index].urlToImage
                            .toString()))),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  children: [
                    Center(
                      child: Text(
                        providerwatch.apidata.articles![widget.index].title
                            .toString(),
                        style: GoogleFonts.robotoSlab(
                            color: Colors.black, fontSize: 20),
                      ),
                    ),
                    SizedBox(
                      height: 15,
                    ),
                    Center(
                      child: Row(
                        children: [
                          Text(
                            DateFormat.yMMMEd().format(providerwatch
                                .apidata.articles![widget.index].publishedAt!),
                            style: GoogleFonts.robotoSlab(
                                color: Colors.grey, fontSize: 18),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    Text(
                      "Read More",
                      style: GoogleFonts.robotoSlab(
                          color: Colors.blue, fontSize: 17),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ));
  }
}
