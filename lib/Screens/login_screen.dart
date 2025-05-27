import 'package:flutter/material.dart';
import 'dashboard_screen.dart';

class LoginScreen extends StatefulWidget {
  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final TextEditingController pinController = TextEditingController();
  final _formKey = GlobalKey<FormState>();
  bool _isLoading = false;

  final String userName = 'Ravi Kumar'; // 👈 Change this to dynamic name if needed

  void _validatePin() async {
    if (_formKey.currentState!.validate()) {
      setState(() => _isLoading = true);

      await Future.delayed(Duration(seconds: 2)); // Simulate processing

      setState(() => _isLoading = false);

      if (pinController.text == '1234') {
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(builder: (context) => DashboardScreen()),
        );
      } else {
        pinController.clear();
        _showSnack('❌ Incorrect MPIN. Try again.');
      }
    }
  }

  void _showSnack(String msg) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(content: Text(msg), backgroundColor: Colors.redAccent),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.deepPurple[50],
      body: Center(
        child: SingleChildScrollView(
          padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 40),
          child: Column(
            children: [
              CircleAvatar(
                radius: 40,
                backgroundColor: Colors.deepPurple,
                child: Icon(Icons.account_balance_wallet, size: 40, color: Colors.white),
              ),
              SizedBox(height: 20),
              Text(
                'Welcome to PhonePe Clone',
                style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
              ),
              SizedBox(height: 40),

              Form(
                key: _formKey,
                child: Column(
                  children: [
                    Text(
                      'Enter your 4-digit MPIN',
                      style: TextStyle(fontSize: 18),
                    ),
                    SizedBox(height: 15),
                    TextFormField(
                      controller: pinController,
                      obscureText: true,
                      keyboardType: TextInputType.number,
                      maxLength: 4,
                      decoration: InputDecoration(
                        prefixIcon: Icon(Icons.lock),
                        hintText: '••••',
                        filled: true,
                        fillColor: Colors.white,
                        counterText: "",
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(12),
                        ),
                      ),
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Please enter your MPIN';
                        } else if (value.length != 4) {
                          return 'MPIN must be 4 digits';
                        }
                        return null;
                      },
                    ),
                    ElevatedButton.icon(
                      icon: Icon(Icons.login, color: Colors.black), // Optional: icon color also black
                      label: Text(
                        'Login',
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                          color: Colors.black, // ✅ Black text
                        ),
                      ),
                      style: ElevatedButton.styleFrom(
                        minimumSize: Size(double.infinity, 50),
                        backgroundColor: Colors.deepPurple, // button background
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(12),
                        ),
                      ),
                      onPressed: _validatePin,
                    ),



                    SizedBox(height: 10),
                    TextButton(
                      onPressed: () {
                        _showSnack("Forgot MPIN? Coming soon.");
                      },
                      child: Text('Forgot MPIN?', style: TextStyle(color: Colors.deepPurple)),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
