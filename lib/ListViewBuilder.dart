import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';

class ListViewBuilder extends StatefulWidget {
  const ListViewBuilder({Key? key}) : super(key: key);

  @override
  State<ListViewBuilder> createState() => _ListViewBuilderState();
}

class _ListViewBuilderState extends State<ListViewBuilder> {
  List<String> icontext = [
    'Sort By',
    'Filter',
    'Compare',
    'Price',
    'Processor Brand'
  ];
  List<bool> fav = [];
  List<IconData> icns = [
    Icons.keyboard_arrow_down_outlined,
    Icons.tune_outlined,
    Icons.pause_outlined,
    Icons.keyboard_arrow_down_outlined,
    Icons.keyboard_arrow_down_outlined
  ];
  List<String> names = [
    'MOTOROLA G62 5G',
    'MOTOROLA G62 5G',
    'MOTOROLA G62 5G',
    'MOTOROLA G62 5G'
  ];
  List<double> _width = [95, 95, 105, 90, 160];
  bool _tapped = false;
  List<double> _rating = [4, 4, 3, 3];
  List<String> color = [
    '(Frosted Blue,128 GB)',
    '(Midnight Gray, 128GB)',
    '(Midnight Gray, 128GB)',
    '(Frosted Blue,128 GB)'
  ];
  List<String> image = [
    'https://motorolaroe.vtexassets.com/arquivos/ids/156899-800-auto?width=800&height=auto&aspect=true',
    'https://motorolaroe.vtexassets.com/arquivos/ids/156890-800-auto?width=800&height=auto&aspect=true',
    'https://motorolaroe.vtexassets.com/arquivos/ids/156890-800-auto?width=800&height=auto&aspect=true',
    'https://motorolaroe.vtexassets.com/arquivos/ids/156899-800-auto?width=800&height=auto&aspect=true'
  ];
  List<String> buy = ['(587)', '(587)', '(143)', '(143)'];
  List<String> ogprice = ['21,999', '21,999', '24,999', '24,999'];
  List<String> discprice = ['15,999', '15,999', '17,999', '17,999'];
  List<String> discount = ['27% off', '27% off', '28% off', '28% off'];
  List<String> spec = [
    '6 GB RAM | 128 GB Storage',
    '6 GB RAM | 128 GB Storage',
    '8 GB RAM | 128 GB Storage',
    '8 GB RAM | 128 GB Storage'
  ];
  List<String> exchange = ['15,400', '15,400', '17,000', '17,000'];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.white,
          iconTheme: const IconThemeData(color: Colors.black),
          title: const Center(
            child: Text(
              'Moto G62',
              style:
                  TextStyle(color: Colors.black, fontWeight: FontWeight.normal),
            ),
          ),
          actions: const [
            Icon(Icons.search),
            SizedBox(
              width: 20,
            ),
            Icon(Icons.keyboard_voice_outlined),
            SizedBox(
              width: 20,
            ),
            Icon(Icons.camera_alt_outlined),
            SizedBox(
              width: 20,
            ),
            Icon(Icons.shopping_cart_outlined),
            SizedBox(
              width: 20,
            ),
          ],
        ),
        body: Container(
          width: MediaQuery.of(context).size.width,
          child: ListView.builder(
            itemCount: names.length,
            itemBuilder: (context, index) {
              return index == 0
                  ? Column(
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(left: 10,right: 10),
                          child: Container(
                            height: 45,
                            child: ListView.builder(
                              scrollDirection: Axis.horizontal,
                              itemCount: 5,
                              itemBuilder: (context, index) {
                                return Padding(
                                  padding: const EdgeInsets.only(left: 7,bottom: 5,top: 5,),
                                  child: Container(
                                    height: 65,
                                    width: _width[index],
                                    decoration: BoxDecoration(
                                      color: Colors.white,
                                      borderRadius: BorderRadius.circular(25),
                                      border: Border.all(
                                          color: Colors.black, width: 0.4),
                                    ),
                                    child: Row(
                                      mainAxisAlignment: MainAxisAlignment.center,
                                      children: [
                                        Text(
                                          icontext[index],
                                          style: TextStyle(fontSize: 15),
                                        ),
                                        SizedBox(
                                          width: 3,
                                        ),
                                        Icon(
                                          icns[index],
                                          size: 17,
                                        ),
                                      ],
                                    ),
                                  ),
                                );
                              },
                            ),
                          ),
                        ),
                        Container(
                          height: 255,
                          width: MediaQuery.of(context).size.width,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.zero,
                              border: Border.all(
                                  color: Colors.black26, width: 0.4)),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Row(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Container(
                                      height: 160,
                                      width: 150,
                                      child: Image.network(image[index])),
                                  Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      const SizedBox(
                                        height: 15,
                                      ),
                                      Text(
                                        names[index],
                                        style: const TextStyle(
                                            color: Colors.black, fontSize: 17),
                                      ),
                                      Text(
                                        color[index],
                                        style: const TextStyle(
                                            color: Colors.black, fontSize: 15),
                                      ),
                                      Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.start,
                                        children: [
                                          RatingBar.builder(
                                            itemSize: 13,
                                            initialRating: _rating[index],
                                            minRating: 1,
                                            itemCount: 5,
                                            itemBuilder: (context, _) => Icon(
                                              Icons.star,
                                              color: Colors.amber,
                                            ),
                                            direction: Axis.horizontal,
                                            onRatingUpdate: (rating) {
                                              print(rating);
                                            },
                                          ),
                                          SizedBox(
                                            width: 5,
                                          ),
                                          Text(buy[index]),
                                          const SizedBox(
                                            width: 10,
                                          ),
                                          Container(
                                            height: 30,
                                            width: 50,
                                            child: Image.network(
                                                'https://www.adgully.com/img/800/68264_fl.png.jpg'),
                                          ),
                                        ],
                                      ),
                                      Row(
                                        children: [
                                          Text(
                                            ogprice[index],
                                            style: const TextStyle(
                                                decoration:
                                                    TextDecoration.lineThrough),
                                          ),
                                          const SizedBox(
                                            width: 5,
                                          ),
                                          const Icon(
                                            Icons.currency_rupee,
                                            size: 15,
                                          ),
                                          Text(discprice[index]),
                                          const SizedBox(
                                            width: 5,
                                          ),
                                          Text(
                                            discount[index],
                                            style: const TextStyle(
                                                color: Colors.green),
                                          ),
                                        ],
                                      ),
                                      const SizedBox(
                                        height: 5,
                                      ),
                                      const Text(
                                        'Free Delivery',
                                        style: TextStyle(fontSize: 12),
                                      ),
                                      const SizedBox(
                                        height: 5,
                                      ),
                                      Container(
                                        height: 17,
                                        width: 75,
                                        color: const Color.fromRGBO(
                                            216, 184, 238, 100),
                                        child: const Center(
                                          child: Text(
                                            ' Sale Price Live',
                                            style: TextStyle(
                                              color: Color.fromRGBO(
                                                  174, 39, 246, 10),
                                              fontSize: 10,
                                            ),
                                          ),
                                        ),
                                      ),
                                      const SizedBox(
                                        height: 10,
                                      ),
                                      Row(
                                        children: [
                                          const Center(
                                            child: Text(
                                              'Upto',
                                              style: TextStyle(fontSize: 11.5),
                                            ),
                                          ),
                                          const SizedBox(
                                            width: 3,
                                          ),
                                          const Icon(
                                            Icons.currency_rupee,
                                            size: 12.5,
                                          ),
                                          Center(
                                            child: Text(
                                              exchange[index],
                                              style:
                                                  const TextStyle(fontSize: 13),
                                            ),
                                          ),
                                          const SizedBox(
                                            width: 3,
                                          ),
                                          const Center(
                                            child: Text(
                                              'Off on Exchange',
                                              style: TextStyle(fontSize: 11.5),
                                            ),
                                          ),
                                        ],
                                      ),
                                    ],
                                  ),
                                  Column(
                                    children: [
                                      const SizedBox(
                                        height: 10,
                                      ),
                                      Row(
                                        children: [
                                          const SizedBox(
                                            width: 5,
                                          ),
                                          GestureDetector(
                                            onTap: () {
                                              setState(() {
                                                _tapped = !_tapped;
                                              }
                                              );
                                            },
                                            child: Icon(
                                                _tapped
                                                    ? Icons.favorite_outline
                                                    : Icons.favorite,
                                                color: _tapped
                                                    ? Colors.black
                                                    : Colors.red),
                                          ),
                                        ],
                                      ),
                                    ],
                                  )
                                ],
                              ),
                              Padding(
                                padding:
                                    const EdgeInsets.only(left: 10, top: 7),
                                child: Container(
                                  height: 20,
                                  width: 160,
                                  decoration: BoxDecoration(
                                    border: Border.all(color: Colors.black12),
                                  ),
                                  child: Center(
                                    child: Text(
                                      spec[index],
                                      style: const TextStyle(
                                          fontSize: 12,
                                          fontWeight: FontWeight.w300),
                                    ),
                                  ),
                                ),
                              ),
                              Row(
                                children: [
                                  Padding(
                                    padding: const EdgeInsets.only(
                                      left: 10,
                                      top: 7,
                                    ),
                                    child: Container(
                                      height: 20,
                                      width: 215,
                                      decoration: BoxDecoration(
                                        border:
                                            Border.all(color: Colors.black12),
                                      ),
                                      child: const Center(
                                        child: Text(
                                          '16.64 cm (6.55 inch ) Full HD+ Display',
                                          style: TextStyle(
                                              fontSize: 12,
                                              fontWeight: FontWeight.w300),
                                        ),
                                      ),
                                    ),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.only(
                                      left: 7,
                                      top: 7,
                                    ),
                                    child: Container(
                                      height: 20,
                                      width: 65,
                                      decoration: BoxDecoration(
                                        border:
                                            Border.all(color: Colors.black12),
                                      ),
                                      child: const Center(
                                        child: Text(
                                          '5000mAh',
                                          style: TextStyle(
                                              fontSize: 12,
                                              fontWeight: FontWeight.w300),
                                        ),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                              Row(
                                children: [
                                  Padding(
                                    padding: const EdgeInsets.only(
                                        left: 10, top: 7, bottom: 5),
                                    child: Container(
                                      height: 20,
                                      width: 120,
                                      decoration: BoxDecoration(
                                        border:
                                            Border.all(color: Colors.black12),
                                      ),
                                      child: const Center(
                                        child: Text(
                                          '50MP + 8MP + 2MP',
                                          style: TextStyle(
                                              fontSize: 12,
                                              fontWeight: FontWeight.w300),
                                        ),
                                      ),
                                    ),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.only(
                                        left: 7, top: 7, bottom: 5),
                                    child: Container(
                                      height: 20,
                                      width: 120,
                                      decoration: BoxDecoration(
                                        border:
                                            Border.all(color: Colors.black12),
                                      ),
                                      child: const Center(
                                        child: Text(
                                          '16MP Front Camera',
                                          style: TextStyle(
                                              fontSize: 12,
                                              fontWeight: FontWeight.w300),
                                        ),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                      ],
                    )
                  : Container(
                      height: 255,
                      width: MediaQuery.of(context).size.width,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.zero,
                          border:
                              Border.all(color: Colors.black26, width: 0.4)),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Container(
                                  height: 160,
                                  width: 150,
                                  child: Image.network(image[index])),
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  const SizedBox(
                                    height: 15,
                                  ),
                                  Text(
                                    names[index],
                                    style: const TextStyle(
                                        color: Colors.black, fontSize: 17),
                                  ),
                                  Text(
                                    color[index],
                                    style: const TextStyle(
                                        color: Colors.black, fontSize: 15),
                                  ),
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    children: [
                                      RatingBar.builder(
                                        itemSize: 13,
                                        initialRating: _rating[index],
                                        minRating: 1,
                                        itemCount: 5,
                                        itemBuilder: (context, _) => Icon(
                                          Icons.star,
                                          color: Colors.amber,
                                        ),
                                        direction: Axis.horizontal,
                                        onRatingUpdate: (rating) {
                                          print(rating);
                                        },
                                      ),
                                      SizedBox(
                                        width: 5,
                                      ),
                                      Text(buy[index]),
                                      const SizedBox(
                                        width: 10,
                                      ),
                                      Container(
                                        height: 30,
                                        width: 50,
                                        child: Image.network(
                                            'https://www.adgully.com/img/800/68264_fl.png.jpg'),
                                      ),
                                    ],
                                  ),
                                  Row(
                                    children: [
                                      Text(
                                        ogprice[index],
                                        style: const TextStyle(
                                            decoration:
                                                TextDecoration.lineThrough),
                                      ),
                                      const SizedBox(
                                        width: 5,
                                      ),
                                      const Icon(
                                        Icons.currency_rupee,
                                        size: 15,
                                      ),
                                      Text(discprice[index]),
                                      const SizedBox(
                                        width: 5,
                                      ),
                                      Text(
                                        discount[index],
                                        style: const TextStyle(
                                            color: Colors.green),
                                      ),
                                    ],
                                  ),
                                  const SizedBox(
                                    height: 5,
                                  ),
                                  const Text(
                                    'Free Delivery',
                                    style: TextStyle(fontSize: 12),
                                  ),
                                  const SizedBox(
                                    height: 5,
                                  ),
                                  Container(
                                    height: 17,
                                    width: 75,
                                    color: const Color.fromRGBO(
                                        216, 184, 238, 100),
                                    child: const Center(
                                      child: Text(
                                        ' Sale Price Live',
                                        style: TextStyle(
                                          color:
                                              Color.fromRGBO(174, 39, 246, 10),
                                          fontSize: 10,
                                        ),
                                      ),
                                    ),
                                  ),
                                  const SizedBox(
                                    height: 10,
                                  ),
                                  Row(
                                    children: [
                                      const Center(
                                        child: Text(
                                          'Upto',
                                          style: TextStyle(fontSize: 11.5),
                                        ),
                                      ),
                                      const SizedBox(
                                        width: 3,
                                      ),
                                      const Icon(
                                        Icons.currency_rupee,
                                        size: 12.5,
                                      ),
                                      Center(
                                        child: Text(
                                          exchange[index],
                                          style: const TextStyle(fontSize: 13),
                                        ),
                                      ),
                                      const SizedBox(
                                        width: 3,
                                      ),
                                      const Center(
                                        child: Text(
                                          'Off on Exchange',
                                          style: TextStyle(fontSize: 11.5),
                                        ),
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                              Column(
                                children: [
                                  const SizedBox(
                                    height: 10,
                                  ),
                                  Row(
                                    children: [
                                      const SizedBox(
                                        width: 5,
                                      ),
                                      GestureDetector(
                                        onTap: () {
                                          setState(() {
                                            _tapped = !_tapped;
                                          });
                                        },
                                        child: Icon(
                                            _tapped
                                                ? Icons.favorite_outline
                                                : Icons.favorite,
                                            color: _tapped
                                                ? Colors.black
                                                : Colors.red),
                                      ),
                                    ],
                                  ),
                                ],
                              )
                            ],
                          ),
                          Padding(
                            padding: const EdgeInsets.only(left: 10, top: 7),
                            child: Container(
                              height: 20,
                              width: 160,
                              decoration: BoxDecoration(
                                border: Border.all(color: Colors.black12),
                              ),
                              child: Center(
                                child: Text(
                                  spec[index],
                                  style: const TextStyle(
                                      fontSize: 12,
                                      fontWeight: FontWeight.w300),
                                ),
                              ),
                            ),
                          ),
                          Row(
                            children: [
                              Padding(
                                padding: const EdgeInsets.only(
                                  left: 10,
                                  top: 7,
                                ),
                                child: Container(
                                  height: 20,
                                  width: 215,
                                  decoration: BoxDecoration(
                                    border: Border.all(color: Colors.black12),
                                  ),
                                  child: const Center(
                                    child: Text(
                                      '16.64 cm (6.55 inch ) Full HD+ Display',
                                      style: TextStyle(
                                          fontSize: 12,
                                          fontWeight: FontWeight.w300),
                                    ),
                                  ),
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.only(
                                  left: 7,
                                  top: 7,
                                ),
                                child: Container(
                                  height: 20,
                                  width: 65,
                                  decoration: BoxDecoration(
                                    border: Border.all(color: Colors.black12),
                                  ),
                                  child: const Center(
                                    child: Text(
                                      '5000mAh',
                                      style: TextStyle(
                                          fontSize: 12,
                                          fontWeight: FontWeight.w300),
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                          Row(
                            children: [
                              Padding(
                                padding: const EdgeInsets.only(
                                    left: 10, top: 7, bottom: 5),
                                child: Container(
                                  height: 20,
                                  width: 120,
                                  decoration: BoxDecoration(
                                    border: Border.all(color: Colors.black12),
                                  ),
                                  child: const Center(
                                    child: Text(
                                      '50MP + 8MP + 2MP',
                                      style: TextStyle(
                                          fontSize: 12,
                                          fontWeight: FontWeight.w300),
                                    ),
                                  ),
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.only(
                                    left: 7, top: 7, bottom: 5),
                                child: Container(
                                  height: 20,
                                  width: 120,
                                  decoration: BoxDecoration(
                                    border: Border.all(color: Colors.black12),
                                  ),
                                  child: const Center(
                                    child: Text(
                                      '16MP Front Camera',
                                      style: TextStyle(
                                          fontSize: 12,
                                          fontWeight: FontWeight.w300),
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    );
            },
          ),
        ),
    );
  }
}
