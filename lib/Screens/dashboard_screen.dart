import 'package:flutter/material.dart';

class DashboardScreen extends StatelessWidget {
  final String userName = 'Shubhi'; // Updated name here

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // Gradient background similar to PhonePe style
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
                    borderRadius:
                    BorderRadius.only(topLeft: Radius.circular(32), topRight: Radius.circular(32)),
                  ),
                  child: Padding(
                    padding: EdgeInsets.symmetric(horizontal: 20, vertical: 25),
                    child: SingleChildScrollView(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          _buildGreeting(),
                          SizedBox(height: 20),

                          // Wallet + Recharge & Bills Section in a Column
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              _buildWalletCard(),
                              SizedBox(height: 25),

                              // Recharge & Bills Section Title
                              Text(
                                'Recharge & Bills',
                                style: TextStyle(
                                  fontSize: 20,
                                  fontWeight: FontWeight.bold,
                                  color: Color(0xFF7B1FA2),
                                ),
                              ),
                              SizedBox(height: 16),

                              // Recharge & Bills Options
                              Row(
                                mainAxisAlignment: MainAxisAlignment.spaceAround,
                                children: [
                                  _rechargeBillItem(Icons.phone_android, 'Mobile Recharge'),
                                  _rechargeBillItem(Icons.tv, 'DTH Recharge'),
                                  _rechargeBillItem(Icons.lightbulb, 'Electricity Bill'),
                                  _rechargeBillItem(Icons.water, 'Water Bill'),
                                ],
                              ),
                            ],
                          ),

                          SizedBox(height: 30),
                          _buildQuickActions(),
                          SizedBox(height: 30),
                          _buildExploreTitle(),
                          SizedBox(height: 16),
                          _buildServicesGrid(),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        selectedItemColor: Color(0xFF7B1FA2),
        unselectedItemColor: Colors.grey,
        items: [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Home'),
          BottomNavigationBarItem(icon: Icon(Icons.history), label: 'History'),
          BottomNavigationBarItem(icon: Icon(Icons.account_circle), label: 'Profile'),
        ],
      ),
    );
  }

  Widget _buildTopBar() {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 20, vertical: 15),
      child: Row(
        children: [
          CircleAvatar(
            radius: 24,
            backgroundColor: Colors.white,
            child: Icon(Icons.person, color: Color(0xFF7B1FA2), size: 30),
          ),
          SizedBox(width: 16),
          Expanded(
            child: Container(
              height: 42,
              padding: EdgeInsets.symmetric(horizontal: 15),
              decoration: BoxDecoration(
                color: Colors.white.withOpacity(0.9),
                borderRadius: BorderRadius.circular(25),
              ),
              child: Row(
                children: [
                  Icon(Icons.search, color: Colors.grey[600]),
                  SizedBox(width: 10),
                  Expanded(
                    child: TextField(
                      decoration: InputDecoration(
                        hintText: 'Search for services, recharge, pay bills...',
                        border: InputBorder.none,
                        isDense: true,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
          SizedBox(width: 16),
          Icon(Icons.notifications_none, color: Colors.white, size: 28),
        ],
      ),
    );
  }

  Widget _buildGreeting() {
    return Text(
      'Hi, $userName 👋',
      style: TextStyle(
        fontSize: 26,
        fontWeight: FontWeight.bold,
        color: Color(0xFF7B1FA2),
      ),
    );
  }

  Widget _buildWalletCard() {
    return Container(
      padding: EdgeInsets.all(24),
      decoration: BoxDecoration(
        color: Color(0xFF7B1FA2),
        borderRadius: BorderRadius.circular(20),
        boxShadow: [
          BoxShadow(
            color: Colors.purple.shade300.withOpacity(0.5),
            blurRadius: 10,
            offset: Offset(0, 5),
          )
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Wallet Balance',
            style: TextStyle(color: Colors.white70, fontSize: 18),
          ),
          SizedBox(height: 8),
          Text(
            '₹ 12,345',
            style: TextStyle(
              color: Colors.white,
              fontSize: 36,
              fontWeight: FontWeight.bold,
              letterSpacing: 1.2,
            ),
          ),
          SizedBox(height: 20),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              _walletActionButton(Icons.send, 'Send'),
              _walletActionButton(Icons.phone_android, 'Recharge'),
              _walletActionButton(Icons.payment, 'Pay Bills'),
              _walletActionButton(Icons.history, 'History'),
            ],
          ),
        ],
      ),
    );
  }

  Widget _walletActionButton(IconData icon, String label) {
    return Column(
      children: [
        CircleAvatar(
          radius: 25,
          backgroundColor: Colors.white,
          child: Icon(icon, size: 28, color: Color(0xFF7B1FA2)),
        ),
        SizedBox(height: 8),
        Text(label,
            style: TextStyle(
              color: Color(0xFF7B1FA2),
              fontWeight: FontWeight.w600,
            )),
      ],
    );
  }

  Widget _rechargeBillItem(IconData icon, String label) {
    return Column(
      children: [
        CircleAvatar(
          radius: 28,
          backgroundColor: Color(0xFFEDE7F6),
          child: Icon(icon, size: 30, color: Color(0xFF7B1FA2)),
        ),
        SizedBox(height: 8),
        Text(
          label,
          style: TextStyle(
            color: Color(0xFF7B1FA2),
            fontWeight: FontWeight.w600,
            fontSize: 14,
          ),
          textAlign: TextAlign.center,
        ),
      ],
    );
  }

  Widget _buildQuickActions() {
    return SizedBox(
      height: 110,
      child: ListView(
        scrollDirection: Axis.horizontal,
        children: [
          _quickActionItem(Icons.local_grocery_store, 'Groceries'),
          _quickActionItem(Icons.train, 'Tickets'),
          _quickActionItem(Icons.fastfood, 'Food'),
          _quickActionItem(Icons.movie, 'Movies'),
          _quickActionItem(Icons.more_horiz, 'More'),
        ],
      ),
    );
  }

  Widget _quickActionItem(IconData icon, String label) {
    return Padding(
      padding: EdgeInsets.only(right: 20),
      child: Column(
        children: [
          CircleAvatar(
            radius: 30,
            backgroundColor: Color(0xFFEDE7F6),
            child: Icon(icon, size: 32, color: Color(0xFF7B1FA2)),
          ),
          SizedBox(height: 10),
          Text(
            label,
            style: TextStyle(
              color: Color(0xFF7B1FA2),
              fontWeight: FontWeight.w600,
              fontSize: 14,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildExploreTitle() {
    return Text(
      'Explore',
      style: TextStyle(
        fontSize: 22,
        fontWeight: FontWeight.bold,
        color: Color(0xFF7B1FA2),
      ),
    );
  }

  Widget _buildServicesGrid() {
    return GridView.count(
      crossAxisCount: 3,
      shrinkWrap: true,
      physics: NeverScrollableScrollPhysics(),
      crossAxisSpacing: 18,
      mainAxisSpacing: 18,
      children: [
        _serviceTile(Icons.local_offer, 'Offers'),
        _serviceTile(Icons.local_taxi, 'Taxi'),
        _serviceTile(Icons.card_giftcard, 'Gifts'),
        _serviceTile(Icons.money, 'Loans'),
        _serviceTile(Icons.movie_filter, 'Movies'),
        _serviceTile(Icons.more_horiz, 'More'),
      ],
    );
  }

  Widget _serviceTile(IconData icon, String label) {
    return Container(
      decoration: BoxDecoration(
        color: Color(0xFFF3E5F5),
        borderRadius: BorderRadius.circular(15),
        boxShadow: [
          BoxShadow(
            color: Colors.purple.shade100.withOpacity(0.5),
            blurRadius: 6,
            offset: Offset(0, 3),
          )
        ],
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(icon, size: 36, color: Color(0xFF7B1FA2)),
          SizedBox(height: 10),
          Text(
            label,
            style: TextStyle(
              color: Color(0xFF7B1FA2),
              fontWeight: FontWeight.w600,
              fontSize: 14,
            ),
          ),
        ],
      ),
    );
  }
}
