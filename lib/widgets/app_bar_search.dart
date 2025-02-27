import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SearchAppBar extends StatelessWidget implements PreferredSizeWidget {
  const SearchAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Color(0xffFFFFFF),
      ),
      child: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 8.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Expanded(
                child: TextField(
                  style: TextStyle(
                    fontFamily: "Graphik",
                    fontWeight: FontWeight.w400,
                    fontSize: 16,
                    decoration: TextDecoration.underline,
                  ),
                  maxLines: 1,
                  keyboardType: TextInputType.text,
                  textAlign: TextAlign.left,
                  textAlignVertical: TextAlignVertical.bottom,
                  textInputAction: TextInputAction.done,
                  scrollPadding: EdgeInsets.all(8.0),
                  decoration: InputDecoration(
                      prefixIcon: Icon(Icons.search),
                      prefixIconColor: Color(0xff000000),
                      border: OutlineInputBorder(
                        borderSide: BorderSide.none,
                        borderRadius: BorderRadius.circular(8.0),
                      ),
                      hintText: "Search your list",
                      filled: true,
                      fillColor: Color(0xffF4F4F4),
                      hintStyle: TextStyle(
                        decoration: TextDecoration.none,
                        fontFamily: "Graphik",
                        fontWeight: FontWeight.w400,
                        fontSize: 16,
                        color: Color(0xff8C8E8F),
                      ),
                      enabledBorder: OutlineInputBorder(
                          borderSide: BorderSide(
                        color: Color(0xffE3E2E2),
                      ))),
                ),
              ),
              SizedBox(width: MediaQuery.of(context).size.width * 0.01),
              TextButton(
                onPressed: () => Get.back(),
                child: Text(
                  "Cancel",
                  maxLines: 1,
                  style: TextStyle(
                    color: Colors.black,
                    fontFamily: "Graphik",
                    fontSize: 16,
                    fontWeight: FontWeight.w500,
                    letterSpacing: 0.4,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  @override
  Size get preferredSize => Size.fromHeight(65.0);
}
