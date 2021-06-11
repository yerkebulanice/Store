import 'package:flutter/material.dart';

class AllCategoriesPage extends StatelessWidget {
  final List<String> categories;
  AllCategoriesPage({this.categories});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          'Все категории',
          style: TextStyle(
            fontSize: 22,
          ),
          textAlign: TextAlign.left,
        ),
        leading: InkWell(
          onTap: () {
            Navigator.pop(context);
          },
          child: Icon(
            Icons.chevron_left_outlined,
            size: 40,
          ),
        ),
        flexibleSpace: Container(
          decoration: BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.bottomCenter,
              end: Alignment.topCenter,
              colors: <Color>[
                Color(0xFFE98E34),
                Color(0xFFD3452F),
              ],
            ),
          ),
        ),
      ),
      body: Categories(
        categories: categories,
      ),
    );
  }
}

class Categories extends StatelessWidget {
  final List<String> categories;
  Categories({this.categories});
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        itemCount: categories.length,
        itemBuilder: (context, index) {
          return GestureDetector(
            onTap: () {
              Navigator.pop(context, index);
            },
            child: Container(
              height: 55,
              padding: EdgeInsets.only(right: 12, left: 12, top: 8, bottom: 8),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    categories[index],
                    style: TextStyle(
                      fontSize: 24,
                    ),
                  ),
                  Icon(
                    Icons.chevron_right_outlined,
                    size: 35,
                  ),
                ],
              ),
            ),
          );
        });
  }
}
