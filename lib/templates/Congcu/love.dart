import 'package:flutter/material.dart';
import 'package:weatherapp/templates/Congcu/list.dart';

class Love extends StatefulWidget {
  Love({required this.savedDestinations, required this.onDelete});
  final List<Destination> savedDestinations;
  final Function(int) onDelete;

  @override
  _LoveState createState() => _LoveState();
}

class _LoveState extends State<Love> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Địa điểm đã lưu'),
      ),
      body: ListView.builder(
        itemCount: widget.savedDestinations.length,
        itemBuilder: (context, index) {
          final destination = widget.savedDestinations[index];
          return Dismissible(
            key: Key(destination.toString()),
            background: Container(color: Colors.red,),
            onDismissed: (direction) {
              widget.onDelete(index);
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(content: Text('${destination.name} đã được xóa khỏi Yêu Thích')),
              );
            },
            child: Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10.0),
                color: Colors.white60,
                border: Border.all(
                  width: 2,
                  color: Colors.greenAccent
                )
              ),
              child: ListTile(
                title: Text(destination.name),
                subtitle: Text(destination.price.toString()),
                trailing: Icon(Icons.delete),
              ),
            ),
          );
        },
      )

    );
  }
}
