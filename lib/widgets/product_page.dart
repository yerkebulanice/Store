import 'package:ads_smartapp/model/products.dart';
import 'package:ads_smartapp/widgets/location_of_seller.dart';
import 'package:flutter/material.dart';

class ProductPage extends StatelessWidget {
  final Product product;
  ProductPage({this.product});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          product.id.toString(),
          style: TextStyle(
            fontSize: 24,
          ),
          textAlign: TextAlign.left,
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
      body: ProductDesc(product: product),
    );
  }
}

class ProductDesc extends StatelessWidget {
  final Product product;
  ProductDesc({this.product});
  @override
  Widget build(BuildContext context) {
    final int price = product.price;
    return Stack(
      children: [
        Container(
          margin: EdgeInsets.only(
            bottom: 80,
          ),
          child: ListView(
            scrollDirection: Axis.vertical,
            children: [
              Image.network(
                product.image,
                height: MediaQuery.of(context).size.height / 2 - 50,
                fit: BoxFit.fill,
                width: MediaQuery.of(context).size.width,
              ),
              Container(
                padding: EdgeInsets.all(20),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      product.title,
                      style: TextStyle(
                        fontSize: 28,
                      ),
                    ),
                    SizedBox(
                      height: 15,
                    ),
                    Text(
                      "$price ₽",
                      style: TextStyle(
                        fontSize: 28,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    Divider(
                      color: Colors.grey[400],
                    ),
                    GestureDetector(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => LocationOfSeller(
                              latitude: product.latitude,
                              longitude: product.longitude,
                              address: 'Актобе, проспект Абылхайыр хана, 25',
                            ),
                          ),
                        );
                      },
                      child: Container(
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Icon(
                              Icons.location_on_outlined,
                              size: 35,
                              color: Colors.grey,
                            ),
                            SizedBox(
                              width: 12,
                            ),
                            Expanded(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    'Актобе, проспект Абылхайыр хана, 25',
                                    style: TextStyle(
                                      fontSize: 20,
                                    ),
                                  ),
                                  SizedBox(
                                    height: 6,
                                  ),
                                  Text(
                                    '12.6 km',
                                    style: TextStyle(
                                      fontSize: 17,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            Icon(
                              Icons.chevron_right_outlined,
                            ),
                          ],
                        ),
                      ),
                    ),
                    Divider(
                      color: Colors.grey[400],
                    ),
                    Text(
                      'Описание',
                      style: TextStyle(
                        color: Colors.grey,
                        fontSize: 22,
                      ),
                    ),
                    SizedBox(
                      height: 8,
                    ),
                    Text(
                      product.description,
                      style: TextStyle(
                        fontSize: 20,
                      ),
                    ),
                    Divider(
                      color: Colors.grey,
                    ),
                    Column(
                      children: [
                        Row(
                          children: [
                            Expanded(
                              child: Text(
                                'Категория',
                                style: TextStyle(
                                  fontSize: 20,
                                  color: Colors.grey,
                                ),
                                // textAlign: TextAlign.center,
                              ),
                            ),
                            Expanded(
                              child: Text(
                                'Одежды',
                                style: TextStyle(
                                  fontSize: 20,
                                  color: Colors.black,
                                ),
                                // textAlign: TextAlign.left,
                              ),
                            ),
                          ],
                        ),
                        SizedBox(
                          height: 12,
                        ),
                        Row(
                          children: [
                            Expanded(
                              child: Text(
                                'Размещено',
                                style: TextStyle(
                                  fontSize: 20,
                                  color: Colors.grey,
                                ),
                                // textAlign: TextAlign.center,
                              ),
                            ),
                            Expanded(
                              child: Text(
                                '10 июня 2021',
                                style: TextStyle(
                                  fontSize: 20,
                                  color: Colors.black,
                                ),
                                // textAlign: TextAlign.left,
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
        Positioned(
          child: Align(
            alignment: Alignment.bottomCenter,
            child: Container(
              padding: EdgeInsets.only(bottom: 0),
              margin: EdgeInsets.only(right: 6, left: 6),
              height: 80,
              decoration: BoxDecoration(
                color: Colors.grey[100].withOpacity(0.8),
                borderRadius: BorderRadius.circular(10),
              ),
              child: Container(
                margin: EdgeInsets.only(right: 10, left: 10),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Expanded(
                      child: Container(
                        height: 60,
                        decoration: BoxDecoration(
                          color: Colors.lightGreen,
                          borderRadius: BorderRadius.circular(4),
                        ),
                        child: TextButton(
                          onPressed: () {},
                          child: Center(
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Icon(
                                  Icons.call,
                                  size: 30,
                                  color: Colors.white,
                                ),
                                SizedBox(
                                  width: 4,
                                ),
                                Text(
                                  'Позвонить',
                                  style: TextStyle(
                                    fontSize: 18,
                                    color: Colors.white,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                    ),
                    SizedBox(
                      width: 14,
                    ),
                    Expanded(
                      child: Container(
                        height: 60,
                        decoration: BoxDecoration(
                          color: Colors.lightBlue,
                          borderRadius: BorderRadius.circular(4),
                        ),
                        child: Center(
                          child: TextButton(
                            onPressed: () {},
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Icon(
                                  Icons.message,
                                  size: 30,
                                  color: Colors.white,
                                ),
                                SizedBox(
                                  width: 4,
                                ),
                                Text(
                                  'Написать',
                                  style: TextStyle(
                                    fontSize: 18,
                                    color: Colors.white,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                    )
                  ],
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
