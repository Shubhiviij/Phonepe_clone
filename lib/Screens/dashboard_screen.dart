import 'package:flutter/material.dart';
import 'package:phonepay_clone/Screens/History_page.dart';

class DashboardScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [Color(0xFF4A148C), Color(0xFF7B1FA2)],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          ),
        ),
        child: SafeArea(
          child: Column(
            children: [
              _buildTopBar(),
              Expanded(
                child: Container(
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.vertical(top: Radius.circular(32)),
                  ),
                  child: SingleChildScrollView(
                    padding: EdgeInsets.all(20),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        _buildMoneyTransferSection(),
                        SizedBox(height: 30),
                        _buildRechargeAndBills(),
                        SizedBox(height: 30),
                        _buildFinanceButtons(),
                        SizedBox(height: 30),
                        buildManagePaymentsSection(),
                        SizedBox(height: 30),
                        _buildSponsoredLinks(),
                        SizedBox(height: 80), // To avoid bottom nav bar overlay
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
      bottomNavigationBar: _buildBottomNavigationBar(context),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      floatingActionButton: _buildFloatingQRButton(),
    );
  }

  Widget _buildTopBar() {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 20, vertical: 15),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          CircleAvatar(
            radius: 24,
            backgroundImage: AssetImage('assets/user.png'), // Replace with your asset path
          ),
          Icon(Icons.help_outline, color: Colors.white, size: 28),
        ],
      ),
    );
  }

  Widget _buildMoneyTransferSection() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Money Transfer',
          style: TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.bold,
            color: Colors.black,
          ),
        ),
        SizedBox(height: 16),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            _quickButton(Icons.phone_android, 'To Mobile\nNumber'),
            _quickButton(Icons.account_balance, 'To Bank\nAccount'),
            _quickButton(Icons.person, 'To Self\nA/C'),
            _quickButton(Icons.account_balance_wallet, 'Check\nBalance'),
          ],
        ),
      ],
    );
  }

  Widget _buildRechargeAndBills() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Recharge & Bills',
          style: TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.bold,
            color: Colors.black,
          ),
        ),
        SizedBox(height: 16),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            _quickButton(Icons.phone_android, 'Mobile\nRecharge'),
            _quickButton(Icons.tv, 'DTH\nRecharge'),
            _quickButton(Icons.lightbulb, 'Electricity\nBill'),
            _quickButton(Icons.water, 'Water\nBill'),
          ],
        ),
      ],
    );
  }

  Widget _buildFinanceButtons() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Financial Services',
          style: TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.bold,
            color: Colors.black,
          ),
        ),
        SizedBox(height: 16),
        Wrap(
          spacing: 20,
          runSpacing: 20,
          children: [
            _enhancedFinanceButton(Icons.attach_money, 'Loans'),
            _enhancedFinanceButton(Icons.security, 'Insurance'),
            _enhancedFinanceButton(Icons.savings, 'Savings'),
            _enhancedFinanceButton(Icons.bar_chart, 'Mutual Funds'),
            _enhancedFinanceButton(Icons.flight_takeoff, 'Travel & Transit'),
          ],
        ),
      ],
    );
  }

  Widget _quickButton(IconData icon, String label) {
    return Column(
      children: [
        CircleAvatar(
          radius: 28,
          backgroundColor: Color(0xFFEDE7F6),
          child: Icon(icon, size: 28, color: Color(0xFF7B1FA2)),
        ),
        SizedBox(height: 8),
        Text(
          label,
          textAlign: TextAlign.center,
          style: TextStyle(
            color: Colors.black,
            fontWeight: FontWeight.w600,
            fontSize: 13,
          ),
        ),
      ],
    );
  }

  Widget _enhancedFinanceButton(IconData icon, String label) {
    return Container(
      width: 140,
      padding: EdgeInsets.symmetric(vertical: 16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
        border: Border.all(color: Colors.purple.shade100),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.shade300,
            blurRadius: 10,
            offset: Offset(0, 4),
          ),
        ],
      ),
      child: Column(
        children: [
          Icon(icon, color: Colors.black, size: 28),
          SizedBox(height: 10),
          Text(
            label,
            style: TextStyle(
              color: Colors.black,
              fontWeight: FontWeight.w600,
              fontSize: 14,
            ),
            textAlign: TextAlign.center,
          ),
        ],
      ),
    );
  }

  Widget buildManagePaymentsSection() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Manage Payments',
          style: TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.bold,
            color: Colors.black,
          ),
        ),
        SizedBox(height: 14),
        GridView.count(
          crossAxisCount: 2,
          shrinkWrap: true,
          physics: NeverScrollableScrollPhysics(),
          mainAxisSpacing: 16,
          crossAxisSpacing: 16,
          childAspectRatio: 3.2,
          children: [
            _paymentOptionButton(Icons.account_balance_wallet, 'Wallet'),
            _paymentOptionButton(Icons.flash_on, 'UPI Lite'),
            _paymentOptionButton(Icons.group, 'UPI Circle'),
            _paymentOptionButton(Icons.credit_card, 'Get Credit Card'),
          ],
        ),
      ],
    );
  }

  Widget _paymentOptionButton(IconData icon, String label) {
    return Container(
      decoration: BoxDecoration(
        color: Color(0xFFF2F2F2),
        borderRadius: BorderRadius.circular(12),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.shade300,
            blurRadius: 4,
            offset: Offset(0, 2),
          ),
        ],
      ),
      padding: EdgeInsets.symmetric(horizontal: 10),
      child: Row(
        children: [
          Icon(icon, color: Colors.purple, size: 24),
          SizedBox(width: 10),
          Flexible(
            child: Text(
              label,
              style: TextStyle(
                color: Colors.black,
                fontWeight: FontWeight.w600,
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildSponsoredLinks() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Sponsored Links',
          style: TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.bold,
            color: Colors.black,
          ),
        ),
        SizedBox(height: 10),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            _sponsoredLinkItem('assets/rummycircle.png', 'Rummy Circle'),
            _sponsoredLinkItem('assets/zupee.png', 'Zupee'),
          ],
        ),
      ],
    );
  }

  Widget _sponsoredLinkItem(String imagePath, String title) {
    return Column(
      children: [
        ClipRRect(
          borderRadius: BorderRadius.circular(12),
          child: Image.asset(
            imagePath,
            height: 60,
            width: 60,
            fit: BoxFit.cover,
          ),
        ),
        SizedBox(height: 6),
        Text(
          title,
          style: TextStyle(
            color: Colors.black,
            fontWeight: FontWeight.w600,
            fontSize: 14,
          ),
        ),
      ],
    );
  }

  Widget _buildBottomNavigationBar(BuildContext context) {
    return BottomAppBar(
      shape: CircularNotchedRectangle(),
      notchMargin: 8,
      color: Colors.white,
      elevation: 10,
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 24),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            _bottomNavItem(Icons.home, "Home", () {}),
            _bottomNavItem(Icons.search, "Search", () {}),
            SizedBox(width: 48), // Floating button space
            _bottomNavItem(Icons.notifications_none, "Alert", () {}),
            _bottomNavItem(Icons.history, "History", () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => HistoryPage()),
              );
            }),
          ],
        ),
      ),
    );
  }

  Widget _bottomNavItem(IconData icon, String label, VoidCallback onTap) {
    return InkWell(
      onTap: onTap,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(icon, color: Colors.grey[800], size: 28),
          SizedBox(height: 4),
          Text(label, style: TextStyle(fontSize: 12, color: Colors.grey[800])),
        ],
      ),
    );
  }

  Widget _buildFloatingQRButton() {
    return FloatingActionButton(
      onPressed: () {
        // TODO: Add QR functionality
      },
      backgroundColor: Color(0xFF7B1FA2),
      child: Icon(Icons.qr_code_scanner, size: 30),
      elevation: 6,
    );
  }
}
