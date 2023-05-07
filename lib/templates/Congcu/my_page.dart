import 'package:flutter/material.dart';
import 'package:weatherapp/utils/color_utils.dart';
class MyPage extends StatelessWidget {
  const MyPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
        height: double.maxFinite,
        width: double.maxFinite,
      child: Stack(
        children: [
          ClipPath(
            clipper: MyClipper(),
            child: Container(
              height: MediaQuery.of(context).size.height *0.4,
              width: double.maxFinite,
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  colors: [
                    hexStringToColor("CB2B93"),
                    hexStringToColor("9546C4"),
                    hexStringToColor("5E61F4")
                  ],
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                ),
              ),
            ),
          ),
          Positioned(
            top: 150,
            bottom: 30,
            right: 30,
            left: 30,
            child: Card(
              elevation: 8,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10)
              ),
              child: Container(
                height: double.maxFinite,
                width: double.maxFinite,
                padding: const EdgeInsets.only(top: 90),
                child: SingleChildScrollView(
                  child: Column(
                    children: [
                      //Text data
                      Padding(
                        padding: const EdgeInsets.only(top: 10.0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            Column(
                              children: const [
                                Text(
                                  "1.6M",
                                  style: TextStyle(
                                    color: Colors.black,
                                    fontSize: 18,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                                SizedBox(height: 5,),
                                Text(
                                    "Likes",
                                  style: TextStyle(
                                    color: Colors.black,
                                    fontSize: 16,
                                  ),
                                ),
                              ],
                            ),
                            Column(
                              children: const [
                                Text(
                                  "4.5",
                                  style: TextStyle(
                                    color: Colors.black,
                                    fontSize: 18,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                                SizedBox(height: 5,),
                                Text(
                                  "Total Point",
                                  style: TextStyle(
                                    color: Colors.black,
                                    fontSize: 16,
                                  ),
                                ),
                              ],
                            ),
                            Column(
                              children: const [
                                Text(
                                  "7.6M",
                                  style: TextStyle(
                                    color: Colors.black,
                                    fontSize: 18,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                                SizedBox(height: 5,),
                                Text(
                                  "Viewers",
                                  style: TextStyle(
                                    color: Colors.black,
                                    fontSize: 16,
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                      SizedBox(height: 25,),
                      //Personal Info
                      Text("GROUP 11",
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 20,
                        ),
                      ),
                      SizedBox(height: 5,),
                      Text(
                        "Nguyễn Minh Quân - 21010617",
                        style: TextStyle(
                          fontSize: 16,
                        ),
                      ),
                      SizedBox(height: 3,),
                      Text(
                        "Lê Đức Cường - 221011582",
                      style: TextStyle(
                          fontSize: 16
                        ),
                      ),
                      const Padding(
                        padding: EdgeInsets.only(
                          left: 20,
                          right: 20,
                          top: 30,
                          bottom: 20,
                        ),
                        child: Divider(
                          thickness: 0.5,
                          color: Colors.blueGrey,
                        ),
                      ),
                      ListTile(
                        title: Text("History"),
                        leading: Icon(Icons.history),
                      ),
                      ListTile(
                        title: Text("Address"),
                        leading: Icon(Icons.location_city),
                      ),
                      ListTile(
                        title: Text("Privacy Policy"),
                        leading: Icon(Icons.security_outlined),
                      ),
                      ListTile(
                        title: Text("Setting"),
                        leading: Icon(Icons.settings),
                      ),
                      ListTile(
                        title: Text("Share"),
                        leading: Icon(Icons.share),
                      ),
                      ListTile(
                        title: Text("Logout", style: TextStyle(color: Colors.red),),
                        leading: Icon(Icons.logout, color: Colors.red,
                        ),
                        onTap: (){
                          Navigator.pushNamed(context, '/');
                        },
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
          //Image

          Positioned(
            top: 75,
            left: MediaQuery.of(context).size.width / 2 - 75,
            child: ClipRRect(
              borderRadius: BorderRadius.circular(75),
              child: Image.asset(
                "assets/img/profile.png",
                height: 150,
                width: 150,
                fit: BoxFit.cover,
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class MyClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    Path path = Path()
        ..lineTo(0,size.height)
        ..lineTo(size.width, size.height - 30)
        ..lineTo(size.width, 0)
        ..close();
      return path;
  }

  @override
  bool shouldReclip(covariant CustomClipper<Path> oldClipper) => true;
}