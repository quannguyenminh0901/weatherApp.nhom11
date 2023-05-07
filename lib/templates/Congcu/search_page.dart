import 'package:flutter/material.dart';
import 'package:weatherapp/templates/Congcu/list.dart';
import 'package:weatherapp/templates/Congcu/love.dart';

class SearchPage extends StatefulWidget {
  @override
  _SearchPageState createState() => _SearchPageState();
}

class _SearchPageState extends State<SearchPage> {
  String _selectedProvince = 'Hà Nội';
  double _selectedPrice = -1;
  final savedDestinations = <Destination>[];


  @override
  Widget build(BuildContext context) {
    final List<Destination> filteredDestinations = destinations
        .where((destination) =>
    destination.province == _selectedProvince &&
        (_selectedPrice == -1 || destination.price == _selectedPrice))
        .toList();
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: Text('Địa điểm du lịch'),
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(3.0),
          child: Column(
            children: [
              Container(
                padding: EdgeInsets.all(10),
                child: Row(
                  children: [
                    Text('Tỉnh: '),
                    DropdownButton<String>(
                      value: _selectedProvince,
                      onChanged: (String? newValue) {
                        setState(() {
                          _selectedProvince = newValue!;
                        });
                      },
                      items: [
                        'Hà Nội',
                        'Đà Nẵng',
                        'Hồ Chí Minh',
                        'Hải Phòng',
                        'Hải Dương',
                        'Hà Giang',
                        'Cao Bằng',
                        'Lào Cai',
                        'Lai Châu',
                        'Điện Biên',
                        'Sơn La',
                        'Yên Bái',
                        'Hòa Bình',
                        'Thái Nguyên',
                        'Lạng Sơn',
                        'Bắc Kạn',
                        'Bắc Giang',
                        'Phú Thọ',
                        'Bắc Ninh',
                        'Thái Bình',
                        'Nam Định',
                        'Ninh Bình',
                        'Thanh Hóa',
                        'Nghệ An',
                        'Hà Tĩnh',
                        'Quảng Bình',
                        'Quảng Trị',
                        'Thừa Thiên Huế',
                        'Quảng Nam',
                        'Quảng Ngãi',
                        'Bình Định',
                        'Phú Yên',
                        'Khánh Hòa',
                        'Ninh Thuận',
                        'Bình Thuận',
                        'Kon Tum',
                        'Gia Lai',
                        'Đắk Lắk',
                        'Đắk Nông',
                        'Lâm Đồng',
                        'Bình Phước',
                        'Tây Ninh',
                        'Bình Dương',
                        'Đồng Nai',
                        'Bà Rịa - Vũng Tàu',
                        'Long An',
                        'Tiền Giang',
                        'Bến Tre',
                        'Trà Vinh',
                        'Vĩnh Long',
                        'Đồng Tháp',
                        'An Giang',
                        'Kiên Giang',
                        'Cần Thơ',
                        'Hậu Giang',
                        'Sóc Trăng',
                        'Bạc Liêu',
                        'Cà Mau',
                        'Hưng Yên',
                        'Hà Nam',
                      ].map<DropdownMenuItem<String>>((String value) {
                        return DropdownMenuItem<String>(
                          value: value,
                          child: SizedBox(
                            width:
                                130, // tăng giảm kích thước chiều rộng của ô hiển thị
                            child: Text(value),
                          ),
                        );
                      }).toList(),
                    ),
                    Text('Giá tiền: '),
                    DropdownButton<double>(
                      value: _selectedPrice,
                      onChanged: (double? newValue) {
                        setState(() {
                          _selectedPrice = newValue!;
                        });
                      },
                      items: [
                        -1.0,
                        0.0,
                        200000.0,
                        300000.0,
                        400000.0,
                        500000.0,
                        1000000.0,
                        7000000.0
                      ].map<DropdownMenuItem<double>>((double value) {
                        return DropdownMenuItem<double>(
                          value: value,
                          child: Text(value == -1 ? 'Tất cả' : '$value vnđ'),
                        );
                      }).toList(),
                    ),
                  ],
                ),
              ),
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                  primary: Colors.blueAccent[500], // đổi màu nền của nút
                  onPrimary: Colors.black, // đổi màu chữ trên nút
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8.0),
                    side: BorderSide(color: Colors.black), // đổi màu viền của nút
                  ),
                ),
                child: Text('Địa điểm đã lưu', style: TextStyle(color: Colors.white),),
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => Love(
                        savedDestinations: savedDestinations, onDelete: (int ) {  },
                      ),
                    ),
                  );
                },
              ),
              Expanded(
                child: filteredDestinations.isNotEmpty ? ListView.builder(
                      itemCount: filteredDestinations.length,
                      itemBuilder: (BuildContext context, int index) {
                      final Destination destination = filteredDestinations[index];
                      bool isSaved = savedDestinations.contains(destination);
                    return ListTile(
                      title: Text(destination.name),
                      subtitle: Text(destination.price.toString()),
                      trailing: IconButton(
                        icon: Icon(
                          isSaved ? Icons.bookmark : Icons.bookmark_border,
                          color: isSaved ? Colors.green : null,
                        ),
                        onPressed: () {
                          setState(() {
                            if (isSaved) {
                              savedDestinations.remove(destination);
                            }else {
                              savedDestinations.add(destination);
                            }
                          });
                        },
                      ),
                    );
                  },
                )
                    : Center(child: Text('Không có điểm đến nào thỏa mãn điều kiện', style: TextStyle(color: Colors.red),)),
              ),
            ],//children
          ),
        ),
      ),
    );
  }
}
