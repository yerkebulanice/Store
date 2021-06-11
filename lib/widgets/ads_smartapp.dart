import 'package:ads_smartapp/widgets/filter_product.dart';
import 'package:ads_smartapp/widgets/product_page.dart';
import 'package:flutter/material.dart';
import 'package:ads_smartapp/model/products.dart';

class AdsSmartApp extends StatefulWidget {
  @override
  _AdsSmartAppState createState() => _AdsSmartAppState();
}

class _AdsSmartAppState extends State<AdsSmartApp> {
  int _selectedIndex = 0;

  List<Widget> _widgetOptions = <Widget>[
    Avito(),
    Mine(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          'Торговая площадка',
          style: TextStyle(
            fontSize: 24,
          ),
          textAlign: TextAlign.left,
        ),
        leading: Icon(
          Icons.arrow_back_ios_outlined,
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
      body: _widgetOptions.elementAt(_selectedIndex),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _selectedIndex,
        showSelectedLabels: true,
        showUnselectedLabels: true,
        onTap: (index) {
          setState(() {
            _selectedIndex = index;
          });
        },
        items: [
          BottomNavigationBarItem(
            icon: Icon(
              Icons.storefront_outlined,
              size: 30,
            ),
            label: 'Все объявления',
          ),
          BottomNavigationBarItem(
            icon: Icon(
              Icons.add_business_outlined,
              size: 30,
            ),
            label: 'Мои объявления',
          ),
        ],
      ),
    );
  }
}

class Avito extends StatefulWidget {
  @override
  _AvitoState createState() => _AvitoState();
}

class _AvitoState extends State<Avito> {
  final List<String> categories = [
    "Все категории",
    "Услуги",
    "Недвижимость",
    "Электроника",
    "Дом и сад",
    "Мода и стиль",
    "Детский мир",
    "Транспорт",
    "Животные",
    "Отдам даром",
  ];

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: <Widget>[
          Container(
            // color: Colors.teal,
            height: 60,
            padding: EdgeInsets.only(left: 16, right: 16, top: 10, bottom: 10),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Expanded(
                  child: TextField(
                    style: TextStyle(
                      color: Colors.black,
                    ),
                    onChanged: (value) {},
                    decoration: InputDecoration(
                      fillColor: Colors.grey[300],
                      hintText: 'Поиск',
                      contentPadding: EdgeInsets.all(10.0),
                      labelStyle: TextStyle(color: Colors.blueGrey),
                      suffixIcon: InkWell(
                        child: Icon(
                          Icons.search_outlined,
                          color: Colors.grey,
                        ),
                        onTap: () {},
                      ),
                      enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                        borderSide: BorderSide(
                          color: Colors.grey[350],
                          width: 1.0,
                        ),
                      ),
                      filled: true,
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                        borderSide: BorderSide(
                          color: Colors.grey[350],
                          width: 1.0,
                        ),
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  width: 6,
                ),
                GestureDetector(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) =>
                            FilterProductPage(categories: categories),
                      ),
                    );
                  },
                  child: Icon(
                    Icons.sort_outlined,
                    size: 30,
                  ),
                ),
              ],
            ),
          ),
          Container(
            padding: EdgeInsets.only(bottom: 10),
            height: 60,
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: categories.length,
              padding: EdgeInsets.only(right: 16, left: 16),
              itemBuilder: (context, index) {
                return GestureDetector(
                  onTap: () {},
                  child: Container(
                    child: index == 0
                        ? Card(
                            child: Container(
                              decoration: BoxDecoration(
                                color: Colors.grey[200],
                                borderRadius: BorderRadius.circular(4),
                              ),
                              width: 40,
                              child: Center(
                                child: Icon(
                                  Icons.apps_outlined,
                                  size: 30,
                                ),
                              ),
                            ),
                          )
                        : Card(
                            color: Colors.grey[200],
                            child: Container(
                              padding: EdgeInsets.all(8),
                              child: Center(
                                child: FittedBox(
                                  child: Text(
                                    categories[index].toString(),
                                    style: TextStyle(
                                      color: Colors.black,
                                      fontSize: 18,
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ),
                  ),
                );
              },
            ),
          ),
          GridView.builder(
            padding: EdgeInsets.only(left: 16, right: 16),
            scrollDirection: Axis.vertical,
            shrinkWrap: true,
            physics: NeverScrollableScrollPhysics(),
            itemCount: products.length,
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisSpacing: 10,
              crossAxisCount: 2,
              mainAxisSpacing: 15,
              childAspectRatio: 8 / 10,
            ),
            itemBuilder: (context, index) {
              int price = products[index].price;
              return GestureDetector(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => ProductPage(
                        product: products[index],
                      ),
                    ),
                  );
                },
                child: Container(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                        width: MediaQuery.of(context).size.width,
                        child: ClipRRect(
                            borderRadius: BorderRadius.circular(10.0),
                            child: Image.network(
                              products[index].image,
                              height: 150,
                              fit: BoxFit.fill,
                            )),
                      ),
                      Text(
                        products[index].title,
                        style: TextStyle(
                          fontSize: 20,
                        ),
                        maxLines: 2,
                      ),
                      Text(
                        "$price ₽",
                        style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      Text(
                        products[index].date,
                        style: TextStyle(
                          fontSize: 18,
                          color: Colors.grey[400],
                        ),
                      ),
                    ],
                  ),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),
              );
            },
          ),
        ],
      ),
    );
  }
}

class Mine extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Center(
        child: Text('Mine page'),
      ),
    );
  }
}
