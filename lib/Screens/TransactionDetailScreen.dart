import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:phonepay_clone/Screens/History_page.dart';
class TransactionDetailScreen extends StatelessWidget {
  final PaymentTransaction transaction;

  const TransactionDetailScreen({Key? key, required this.transaction}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final formatter = DateFormat('dd MMM yyyy');

    return Scaffold(
      appBar: AppBar(
        title: Text('Transaction Details'),
        backgroundColor: Color(0xFF4A148C),
        elevation: 0,
      ),
      backgroundColor: Color(0xFFF5F5F5),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(20),
        child: Column(
          children: [
            Container(
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(16),
                boxShadow: [
                  BoxShadow(
                    color: Colors.grey.shade300,
                    blurRadius: 10,
                    offset: Offset(0, 4),
                  )
                ],
              ),
              child: Padding(
                padding: const EdgeInsets.all(20),
                child: Column(
                  children: [
                    Icon(
                      _getIconForType(transaction.type),
                      size: 48,
                      color: _getStatusColor(transaction.status),
                    ),
                    SizedBox(height: 16),
                    Text(
                      transaction.name,
                      style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                    ),
                    SizedBox(height: 8),
                    Text(
                      '₹${transaction.amount}',
                      style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold, color: Colors.black87),
                    ),
                    SizedBox(height: 16),
                    Divider(thickness: 1.2),
                    _buildDetailRow('Status', transaction.status, _getStatusColor(transaction.status)),
                    _buildDetailRow('Date', formatter.format(transaction.date)),
                    _buildDetailRow('Type', _capitalize(transaction.type)),
                    _buildDetailRow('Transaction ID', 'TXN${transaction.hashCode.toString().padLeft(6, '0')}'),
                  ],
                ),
              ),
            ),
            SizedBox(height: 20),
            ElevatedButton.icon(
              onPressed: () {
                // You can add download/share/print functionality here
              },
              icon: Icon(Icons.receipt_long),
              label: Text('Download Receipt'),
              style: ElevatedButton.styleFrom(
                backgroundColor: Color(0xFF4A148C),
                padding: EdgeInsets.symmetric(horizontal: 24, vertical: 12),
                shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(30)),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildDetailRow(String label, String value, [Color? valueColor]) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10),
      child: Row(
        children: [
          Expanded(
            flex: 3,
            child: Text(
              label,
              style: TextStyle(fontSize: 16, color: Colors.grey[700]),
            ),
          ),
          Expanded(
            flex: 5,
            child: Text(
              value,
              textAlign: TextAlign.right,
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.w600, color: valueColor ?? Colors.black87),
            ),
          ),
        ],
      ),
    );
  }

  Color _getStatusColor(String status) {
    switch (status) {
      case 'Success':
        return Colors.green;
      case 'Pending':
        return Colors.orange;
      case 'Failed':
        return Colors.red;
      default:
        return Colors.grey;
    }
  }

  IconData _getIconForType(String type) {
    switch (type) {
      case 'person':
        return Icons.person;
      case 'bill':
        return Icons.lightbulb;
      case 'food':
        return Icons.fastfood;
      case 'recharge':
        return Icons.phone_android;
      case 'shopping':
        return Icons.shopping_cart;
      default:
        return Icons.account_circle;
    }
  }

  String _capitalize(String value) {
    if (value.isEmpty) return value;
    return value[0].toUpperCase() + value.substring(1);
  }
}
