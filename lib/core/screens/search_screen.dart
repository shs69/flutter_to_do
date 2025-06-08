import "package:flutter/material.dart";
import "package:to_do_app/core/widgets/app_bar_search.dart";

class SearchScreen extends StatelessWidget {
  const SearchScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xffFFFFFF),
      appBar: SearchAppBar(),
    );
  }
}
