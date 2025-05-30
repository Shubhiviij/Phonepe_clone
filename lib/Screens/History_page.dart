import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

void main() {
  runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
    home: HistoryPage(),
  ));
}

class HistoryPage extends StatelessWidget {
  final List<PaymentTransaction> transactions = [
    PaymentTransaction(name: 'Rahul Sharma', amount: '1500', date: DateTime(2025, 5, 28), status: 'Success', type: 'person'),
    PaymentTransaction(name: 'Electricity Bill', amount: '850', date: DateTime(2025, 5, 27), status: 'Pending', type: 'bill'),
    PaymentTransaction(name: 'Zomato Order', amount: '399', date: DateTime(2025, 5, 26), status: 'Failed', type: 'food'),
    PaymentTransaction(name: 'Airtel Recharge', amount: '299', date: DateTime(2025, 5, 25), status: 'Success', type: 'recharge'),
    PaymentTransaction(name: 'Flipkart', amount: '1200', date: DateTime(2025, 5, 24), status: 'Success', type: 'shopping'),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: true,
      backgroundColor: Color(0xFFF5F5F5),
      body: SafeArea(
        child: Column(
          children: [
            // Header Row
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 16, vertical: 12),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'History',
                    style: TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                      color: Color(0xFF4A148C),
                    ),
                  ),
                  TextButton(
                    onPressed: () {},
                    style: TextButton.styleFrom(
                      backgroundColor: Color(0xFFEDE7F6),
                      padding: EdgeInsets.symmetric(horizontal: 12, vertical: 6),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20),
                      ),
                    ),
                    child: Text(
                      'My Statements',
                      style: TextStyle(
                        color: Color(0xFF7B1FA2),
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ),
                ],
              ),
            ),

            // Search Bar
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: Container(
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(30),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.grey.shade200,
                      blurRadius: 6,
                      offset: Offset(0, 2),
                    )
                  ],
                ),
                child: TextField(
                  decoration: InputDecoration(
                    hintText: 'Search transactions',
                    prefixIcon: Icon(Icons.search),
                    border: InputBorder.none,
                    contentPadding: EdgeInsets.symmetric(vertical: 14),
                  ),
                ),
              ),
            ),

            SizedBox(height: 16),

            // Transaction List
            Expanded(
              child: ListView.separated(
                padding: EdgeInsets.symmetric(horizontal: 16),
                itemCount: transactions.length,
                separatorBuilder: (_, __) => SizedBox(height: 12),
                itemBuilder: (context, index) {
                  final txn = transactions[index];
                  return GestureDetector(
                    onTap: () {
                      // Navigate to detail screen with transaction data
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (_) => TransactionDetailScreen(transaction: txn),
                        ),
                      );
                    },
                    child: Container(
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(12),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.grey.shade200,
                            blurRadius: 6,
                            offset: Offset(0, 2),
                          ),
                        ],
                      ),
                      child: ListTile(
                        leading: CircleAvatar(
                          backgroundColor: _getStatusColor(txn.status).withOpacity(0.15),
                          child: Icon(_getIconForType(txn.type), color: _getStatusColor(txn.status)),
                        ),
                        title: Text(
                          txn.name,
                          style: TextStyle(fontWeight: FontWeight.w600, fontSize: 16),
                        ),
                        subtitle: Text(DateFormat('dd MMM yyyy').format(txn.date)),
                        trailing: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.end,
                          children: [
                            Text(
                              '₹${txn.amount}',
                              style: TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.bold,
                                color: Colors.black,
                              ),
                            ),
                            SizedBox(height: 4),
                            Text(
                              txn.status,
                              style: TextStyle(
                                color: _getStatusColor(txn.status),
                                fontWeight: FontWeight.w600,
                                fontSize: 13,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  );
                },
              ),
            ),
          ],
        ),
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
}

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
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(20),
          child: Container(
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
                SizedBox(height: 20),
                ElevatedButton.icon(
                  onPressed: () {
                    // Add download receipt functionality here
                  },
                  icon: Icon(Icons.download),
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

class PaymentTransaction {
  final String name;
  final String amount;
  final DateTime date;
  final String status;
  final String type;

  PaymentTransaction({
    required this.name,
    required this.amount,
    required this.date,
    required this.status,
    required this.type,
  });
}
