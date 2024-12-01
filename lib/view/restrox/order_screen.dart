import 'package:flutter/material.dart';
import 'package:restrox_demo/models/order_item.dart';
import 'package:restrox_demo/models/table_model.dart';
import 'order_card.dart';

class OrderScreen extends StatelessWidget {
  const OrderScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final List<OrderItem> items = [
      const OrderItem(name: 'Mid Steak', quantity: 3, color: Colors.green),
      const OrderItem(name: 'Mas Pizza', quantity: 2, color: Colors.green),
      const OrderItem(name: 'Taco', quantity: 1, color: Colors.orange),
      const OrderItem(name: 'Chi Burger', quantity: 5, color: Colors.red),
      const OrderItem(name: 'Wine', quantity: 1, color: Colors.amber),
    ];
    final List<TableName> tables = [
      const TableName(name: 'Table 1'),
      const TableName(name: 'Customer'),
      const TableName(name: 'Pokhara'),
      const TableName(name: 'Table 4'),
      const TableName(name: 'Random'),
      const TableName(name: 'Pokhara'),
      const TableName(name: 'Table 7'),
    ];

    return Scaffold(
      backgroundColor: Colors.grey.shade50,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 16.0),
          child: GridView.builder(
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 3, childAspectRatio: 0.62),
              itemCount: tables.length,
              itemBuilder: (context, index) {
                return OrderCard(
                  items: items,
                  totalDishes: 15,
                  totalAmount: 150.0,
                  time: '12:30 PM',
                  table: tables[index].name!,
                );
              }),
        ),
      ),
    );
  }
}
