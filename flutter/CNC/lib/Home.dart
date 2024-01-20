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

class TableList extends StatelessWidget {

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
          
          //Stop
          child: Card(
            color: Colors.green,
            child: ListTile(
              title: Text('CNC ${index + 1}'),
              subtitle: Text('Status: Available'),
              leading: Icon(Icons.table_chart),
            ),
          ),
          //Stop



        );
      },
    );
  }
}

// class TableDetailScreen extends StatelessWidget {
//   final int tableNumber;
//
//   TableDetailScreen({required this.tableNumber});
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//         appBar: AppBar(
//           title: Text('Table $tableNumber Details'),
//         ),
//         body: Column(
//             mainAxisAlignment: MainAxisAlignment.center,
//             // children: [
//             //   Text('CNC $tableNumber'),
//             //   SizedBox(height: 16.0),
//             //   Text('Status: Available'),
//             //   SizedBox(height: 16.0),
//             //   ElevatedButton(
//             //     onPressed: () {
//             //       // Add logic to handle table reservation or order
//             //     },
//             //     child: Text('Reserve Table'),
//             //   ),
//             // ],
//             children: [
//         TableRow(
//         children: [
//         TableCell(
//         child: Center(child: Text('Ngày Sản Xuất')),
//     ),
//     TableCell(
//     child: Center(child: Text('Tổng Sản Phẩm')),
//     ),
//     TableCell(
//     child: Center(child: Text('Thành Công')),
//     ),
//     TableCell(
//     child: Center(child: Text('Hư Hỏng')),
//     ),
//     ],
//     ),
//     TableRow(
//     children: [
//     TableCell(
//     child: Center(child: Text('${currentDate.day}/${currentDate.month}/${currentDate.year}')),
//     ),
//     TableCell(
//     child: Center(child: Text('$totalProducts')),
//     ),
//     TableCell(
//     child: Center(child: Text('$successfulProducts')),
//     ),
//     TableCell(
//     child: Center(child: Text('$defectiveProducts')),
//     ),
//     ],
//
//     ),
//     );
//   }
// }
class TableDetailScreen extends StatelessWidget {
  final int tableNumber;
 int totalProducts = 3;
  int successfulProducts = 2;
int defectiveProducts = 1;
  TableDetailScreen({required this.tableNumber});

  @override
  Widget build(BuildContext context) {
    DateTime currentDate = DateTime.now(); // Define currentDate

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