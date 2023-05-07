import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';

class Test extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: NetworkImage(
                'https://img5.thuthuatphanmem.vn/uploads/2021/10/20/background-du-lich-bien_110851075.jpg'),
            fit: BoxFit.cover,
          ),
        ),
        child: Column(
          children: [
            SizedBox(
              height: 700,
              child: CarouselSlider(
                items: [
                  NetworkImage(
                      'https://aphoto.vn/wp-content/uploads/2019/02/avata-16.jpg',

                  ),
                  NetworkImage(
                      'http://media.vietq.vn/files/tranthanh/2016/09/05/du-lich-Vietnam-Holiday.jpg'),
                  NetworkImage(
                      'https://taybacsensetravel.com/view/at_nhung-hinh-anh-du-lich-dep-me-hon-cua-vung-dat-tay-bac_019194d3614616680f8a580c1f6a964e.jpg'),
                ].map((imageUrl) {
                  return Container(
                    margin: EdgeInsets.all(5),
                    decoration: BoxDecoration(
                      image: DecorationImage(
                        image: imageUrl,
                        fit: BoxFit.cover,
                      ),
                    ),
                  );
                }).toList(),
                options: CarouselOptions(
                  height: 450,
                  autoPlay: true,
                  enlargeCenterPage: true,
                  aspectRatio: 16 / 9,
                  autoPlayCurve: Curves.fastOutSlowIn,
                  enableInfiniteScroll: true,
                  autoPlayAnimationDuration: Duration(
                      milliseconds: 3000),
                  viewportFraction: 0.8,
                ),
              ),
            ),
            SizedBox(height: 50,),
            Center(
              child: Text(
                'Welcome to the Weather App!',
                style: TextStyle(
                  fontSize: 30,
                  fontWeight: FontWeight.bold,
                  color: Colors.white
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
