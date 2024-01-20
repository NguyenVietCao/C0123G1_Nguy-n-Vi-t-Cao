import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class CNCApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: CNCScreen(),
    );
  }
}

class CNCScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('CNC Management'),
      ),
      body: TableList(),
    );
  }
}






class TableList extends StatefulWidget {
  @override
  _TableListState createState() => _TableListState();
}

class _TableListState extends State<TableList> {
  List<bool> isHoveredStates = List.generate(20, (index) => false);

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: 20,
      itemBuilder: (context, index) {
        return GestureDetector(
          onTap: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => TableDetailScreen(tableNumber: index + 1)),
            );
          },
          child: MouseRegion(
            onEnter: (_) {
              // Sự kiện khi chuột vào
              setState(() {
                isHoveredStates[index] = true;
              });
            },
            onExit: (_) {
              // Sự kiện khi chuột rời đi
              setState(() {
                isHoveredStates[index] = false;
              });
            },
            child: Card(
              color: isHoveredStates[index] ? Colors.yellow : Colors.green, // Thay đổi màu nền tùy thuộc vào trạng thái hover
              child: ListTile(
                title: Text('CNC ${index + 1}'),
                subtitle: Text('Status: Available'),
                leading: Icon(Icons.table_chart),
              ),
            ),
          ),
        );
      },
    );
  }
}

class TableDetailScreen extends StatelessWidget {
  final int tableNumber;
  int totalProducts = 3;
  int successfulProducts = 2;
  int defectiveProducts = 1;
  TableDetailScreen({required this.tableNumber});

  @override
  Widget build(BuildContext context) {
    DateTime currentDate = DateTime.now();
    return Scaffold(
      appBar: AppBar(
        title: Text('CNC $tableNumber Details'),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Table(
            border: TableBorder.all(),
            children: [
              TableRow(
                children: [
                  TableCell(
                    child: Center(child: const Text('Ngày Sản Xuất')),
                  ),
                  TableCell(
                    child: Center(child: const Text('Tổng Sản Phẩm')),
                  ),
                  TableCell(
                    child: Center(child: const Text('Thành Công')),
                  ),
                  TableCell(
                    child: Center(child: const Text('Hư Hỏng')),
                  ),
                ],
              ),
              TableRow(
                children: [
                  TableCell(
                    child: Center(child: Text('${currentDate.day}/${currentDate.month}/${currentDate.year}')),
                  ),
                  TableCell(
                    child: Center(child: Text('$totalProducts')), // Make sure totalProducts is defined
                  ),
                  TableCell(
                    child: Center(child: Text('$successfulProducts')), // Make sure successfulProducts is defined
                  ),
                  TableCell(
                    child: Center(child: Text('$defectiveProducts')), // Make sure defectiveProducts is defined
                  ),
                ],
              ),
            ],
          ),
        ],
      ),
    );
  }
}

