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
  int minPrice, maxPrice;
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

  bool poUmolItemSelected = true;
  bool poDateItemSelected = false;
  bool deshevleItemSelected = false;
  bool dorozheItemSelected = false;
  RangeValues _values = RangeValues(0, 500000);
  RangeLabels _rangeLabels = RangeLabels("0", "500000");
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
                                fontSize: 20,
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
              Container(
                padding: EdgeInsets.only(
                  right: 14,
                  left: 14,
                  top: 6,
                  bottom: 6,
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Ценовой диапазон',
                      style: TextStyle(
                        fontSize: 18,
                        color: Colors.grey,
                      ),
                    ),
                    RangeSlider(
                      divisions: 100,
                      values: _values,
                      labels: _rangeLabels,
                      min: 0,
                      max: 500000,
                      activeColor: Color(0xFFE98E34),
                      onChanged: (values) {
                        setState(() {
                          _values = values;
                          _rangeLabels = RangeLabels(
                            "${values.start.toInt().toString()}\₸",
                            "${values.end.toInt().toString()}\₸",
                          );
                          minPrice = values.start.toInt();
                          maxPrice = values.end.toInt();
                        });
                      },
                    ),
                    SizedBox(
                      height: 12,
                    ),
                    Text(
                      'от $minPrice ₸ до $maxPrice ₸',
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
              ),
              Container(
                padding: EdgeInsets.only(
                  bottom: 14,
                ),
                color: Colors.grey[200],
                height: 70,
                child: Align(
                  alignment: Alignment.bottomCenter,
                  child: Text(
                    'Сортировать',
                    style: TextStyle(
                      fontSize: 20,
                      color: Colors.grey,
                    ),
                  ),
                ),
              ),
              Container(
                padding: EdgeInsets.only(
                  right: 14,
                  left: 14,
                  top: 6,
                  bottom: 6,
                ),
                child: Column(
                  children: [
                    GestureDetector(
                      onTap: () {
                        setState(() {
                          poUmolItemSelected = true;
                          poDateItemSelected = false;
                          deshevleItemSelected = false;
                          dorozheItemSelected = false;
                        });
                      },
                      child: Container(
                        height: 50,
                        child: Row(
                          children: [
                            Expanded(
                              child: Text(
                                'По умолчанию',
                                style: TextStyle(
                                  fontSize: 20,
                                  color: poUmolItemSelected
                                      ? Colors.lightBlueAccent
                                      : Colors.black,
                                ),
                              ),
                            ),
                            poUmolItemSelected
                                ? Icon(
                                    Icons.check_outlined,
                                    size: 32,
                                    color: Colors.lightBlueAccent,
                                  )
                                : Container(),
                          ],
                        ),
                      ),
                    ),
                    Divider(
                      color: Colors.black,
                    ),
                    GestureDetector(
                      onTap: () {
                        setState(
                          () {
                            poDateItemSelected = true;
                            poUmolItemSelected = false;
                            deshevleItemSelected = false;
                            dorozheItemSelected = false;
                          },
                        );
                      },
                      child: Container(
                        height: 50,
                        child: Row(
                          children: [
                            Expanded(
                              child: Text(
                                'По дате',
                                style: TextStyle(
                                  fontSize: 20,
                                  color: poDateItemSelected
                                      ? Colors.lightBlueAccent
                                      : Colors.black,
                                ),
                              ),
                            ),
                            poDateItemSelected
                                ? Icon(
                                    Icons.check_outlined,
                                    size: 32,
                                    color: Colors.lightBlueAccent,
                                  )
                                : Container(),
                          ],
                        ),
                      ),
                    ),
                    Divider(
                      color: Colors.black,
                    ),
                    GestureDetector(
                      onTap: () {
                        setState(
                          () {
                            deshevleItemSelected = true;
                            poDateItemSelected = false;
                            poUmolItemSelected = false;
                            dorozheItemSelected = false;
                          },
                        );
                      },
                      child: Container(
                        height: 50,
                        child: Row(
                          children: [
                            Expanded(
                              child: Text(
                                'Дешевле',
                                style: TextStyle(
                                  fontSize: 20,
                                  color: deshevleItemSelected
                                      ? Colors.lightBlueAccent
                                      : Colors.black,
                                ),
                              ),
                            ),
                            deshevleItemSelected
                                ? Icon(
                                    Icons.check_outlined,
                                    size: 32,
                                    color: Colors.lightBlueAccent,
                                  )
                                : Container(),
                          ],
                        ),
                      ),
                    ),
                    Divider(
                      color: Colors.black,
                    ),
                    GestureDetector(
                      onTap: () {
                        setState(
                          () {
                            poDateItemSelected = false;
                            poUmolItemSelected = false;
                            dorozheItemSelected = true;
                            deshevleItemSelected = false;
                          },
                        );
                      },
                      child: Container(
                        height: 50,
                        child: Row(
                          children: [
                            Expanded(
                              child: Text(
                                'Дороже',
                                style: TextStyle(
                                  fontSize: 20,
                                  color: dorozheItemSelected
                                      ? Colors.lightBlueAccent
                                      : Colors.black,
                                ),
                              ),
                            ),
                            dorozheItemSelected
                                ? Icon(
                                    Icons.check_outlined,
                                    size: 32,
                                    color: Colors.lightBlueAccent,
                                  )
                                : Container(),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              Container(
                color: Colors.grey[200],
                height: 30,
              ),
              Text('Только с фото'),
              Text('Сбросить фильтр'),
              Container(
                color: Colors.grey[200],
                height: 200,
              ),
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
