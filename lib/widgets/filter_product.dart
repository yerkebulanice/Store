import 'package:flutter/material.dart';
import 'all_categories.dart';

class FilterProductPage extends StatefulWidget {
  final List<String> categories;
  FilterProductPage({this.categories});
  @override
  _FilterProductPageState createState() => _FilterProductPageState();
}

class _FilterProductPageState extends State<FilterProductPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          'Уточнить',
          style: TextStyle(
            fontSize: 22,
          ),
          textAlign: TextAlign.left,
        ),
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: Icon(
            Icons.close_outlined,
            size: 35,
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
      body: Filtering(categories: widget.categories),
    );
  }
}

// ignore: must_be_immutable
class Filtering extends StatefulWidget {
  final List<String> categories;
  Filtering({this.categories});

  @override
  _FilteringState createState() => _FilteringState();
}

class _FilteringState extends State<Filtering> {
  int index;

  void _chooseCategory(BuildContext context) async {
    final result = await Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => AllCategoriesPage(
          categories: widget.categories,
        ),
      ),
    );
    setState(() {
      index = result;
    });
  }

  RangeValues _values = RangeValues(0.3, 0.7);

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Container(
                color: Colors.grey[200],
                height: 30,
              ),
              GestureDetector(
                onTap: () {
                  _chooseCategory(context);
                },
                child: Container(
                  padding: EdgeInsets.only(
                    right: 14,
                    left: 14,
                    top: 6,
                    bottom: 6,
                  ),
                  child: Row(
                    children: [
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'Категория',
                              style: TextStyle(
                                fontSize: 18,
                                color: Colors.grey,
                              ),
                            ),
                            SizedBox(
                              height: 4,
                            ),
                            Text(
                              index != null
                                  ? widget.categories[index]
                                  : widget.categories[0],
                              style: TextStyle(
                                fontSize: 22,
                                color: Colors.black,
                              ),
                            ),
                          ],
                        ),
                      ),
                      Icon(
                        Icons.chevron_right_outlined,
                        size: 35,
                        color: Colors.grey[350],
                      ),
                    ],
                  ),
                ),
              ),
              Container(
                color: Colors.grey[200],
                height: 30,
              ),
              RangeSlider(
                values: _values,
                activeColor: Color(0xFFE98E34),
                onChanged: (RangeValues values) {
                  setState(() {
                    _values = values;
                  });
                },
              ),
              Text('Цена'),
              Text('Сортировка'),
              Text('Только с фото'),
              Text('Сбросить фильтр'),
            ],
          ),
        ),
        Positioned(
          child: Align(
            alignment: Alignment.bottomCenter,
            child: GestureDetector(
              onTap: () {},
              child: Container(
                height: 60,
                margin: EdgeInsets.only(right: 6, left: 6, bottom: 6),
                child: Center(
                  child: Text(
                    'Показать 2522 объявлений',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 22,
                    ),
                  ),
                ),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(52),
                  color: Color(0xFFE98E34),
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
