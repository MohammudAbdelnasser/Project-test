import 'package:flutter/material.dart';
import 'package:project_2/app_styles.dart';
import 'PaymentConfirmationPage.dart'; // Import PaymentConfirmationPage

class PaymentPage extends StatefulWidget {
  @override
  _PaymentPageState createState() => _PaymentPageState();
}

class _PaymentPageState extends State<PaymentPage> {
  final _formKey = GlobalKey<FormState>();

  TextEditingController nameController = TextEditingController();
  TextEditingController cardNumberController = TextEditingController();
  TextEditingController expDateController = TextEditingController();
  TextEditingController cvvController = TextEditingController();

  bool isSaved = false;
  bool isFormValid = false;

  void validateForm() {
    setState(() {
      isFormValid = _formKey.currentState!.validate();
    });
  }

  String? validateExpDate(String? value) {
    if (value == null || value.isEmpty) return "Enter Exp. Date";

    RegExp dateRegex = RegExp(r'^(0[1-9]|1[0-2])\/([0-9]{2})$');
    if (!dateRegex.hasMatch(value)) return "Invalid format (MM/YY)";

    try {
      List<String> parts = value.split('/');
      int enteredMonth = int.parse(parts[0]);
      int enteredYear = 2000 + int.parse(parts[1]); // Convert YY to YYYY

      DateTime enteredDate = DateTime(enteredYear, enteredMonth);
      DateTime minValidDate = DateTime(2025, 6); // June 1, 2025

      if (enteredDate.isBefore(minValidDate)) {
        return "Expiration must be after 06/25";
      }
    } catch (e) {
      return "Invalid Exp. Date";
    }

    return null; // Valid expiration date
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppStyles.backgroundColor,
      appBar: AppBar(
        backgroundColor: AppStyles.primarybackground,
        elevation: 0,
        leading: IconButton(
          icon: Icon(Icons.arrow_back, color: Colors.white),
          onPressed: () => Navigator.pop(context),
        ),
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          padding: EdgeInsets.symmetric(horizontal: 30, vertical: 20),
          child: Form(
            key: _formKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // *Progress Indicator*
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Container(
                      width: 18,
                      height: 18,
                      decoration: BoxDecoration(
                        color: Color(0xFFDE5902),
                        shape: BoxShape.circle,
                      ),
                    ),
                    Container(
                      width: 100,
                      height: 2,
                      decoration: BoxDecoration(
                        color: Color(0xFF317A8B),
                      ),
                    ),
                    Container(
                      width: 25,
                      height: 25,
                      decoration: BoxDecoration(
                        color: Color(0xFFDE5902),
                        shape: BoxShape.circle,
                      ),
                    ),
                    Container(
                      width: 100,
                      height: 2,
                      decoration: BoxDecoration(
                        color: Color(0xFF317A8B),
                      ),
                    ),
                    Container(
                      width: 18,
                      height: 18,
                      decoration: BoxDecoration(
                        color: Color(0xFFDE5902),
                        shape: BoxShape.circle,
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 20),

                // *Payment Title*
                Center(
                  child: Text(
                    'Payment',
                    style: TextStyle(
                      fontFamily: 'Inter',
                      color: Color(0xFFDE5902),
                      fontSize: 25,
                    ),
                  ),
                ),
                SizedBox(height: 20),

                // *Cardholder Name*
                Text(
                  'Cardholder Name',
                  style: TextStyle(
                    fontFamily: 'Inter',
                    fontSize: 16,
                  ),
                ),
                SizedBox(height: 5),
                TextFormField(
                  controller: nameController,
                  decoration: InputDecoration(
                    hintText: 'Enter your name',
                    filled: true,
                    fillColor: Colors.white,
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(8),
                    ),
                  ),
                  validator: (value) =>
                      value!.isEmpty ? "Please enter your name" : null,
                  onChanged: (value) => validateForm(),
                ),
                SizedBox(height: 20),

                // *Card Info*
                Text(
                  'Card Info',
                  style: TextStyle(
                    fontFamily: 'Inter',
                    fontSize: 16,
                  ),
                ),
                SizedBox(height: 5),
                Text(
                  'Card number',
                  style: TextStyle(
                    fontFamily: 'Inter',
                    fontSize: 14,
                    color: Colors.grey,
                  ),
                ),
                TextFormField(
                  controller: cardNumberController,
                  decoration: InputDecoration(
                    hintText: '●●●● ●●●● ●●●● ●●●●',
                    filled: true,
                    fillColor: Colors.white,
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(8),
                    ),
                  ),
                  keyboardType: TextInputType.number,
                  obscureText: true,
                  validator: (value) => value!.length < 16
                      ? "Card number must be 16 digits"
                      : null,
                  onChanged: (value) => validateForm(),
                ),
                SizedBox(height: 10),

                Row(
                  children: [
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Exp. Date',
                            style: TextStyle(
                              fontFamily: 'Inter',
                              fontSize: 14,
                              color: Colors.grey,
                            ),
                          ),
                          TextFormField(
                            controller: expDateController,
                            decoration: InputDecoration(
                              hintText: 'MM/YY',
                              filled: true,
                              fillColor: Colors.white,
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(8),
                              ),
                            ),
                            keyboardType: TextInputType.datetime,
                            validator: validateExpDate,
                            onChanged: (value) => validateForm(),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(width: 10),
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'CVV',
                            style: TextStyle(
                              fontFamily: 'Inter',
                              fontSize: 14,
                              color: Colors.grey,
                            ),
                          ),
                          TextFormField(
                            controller: cvvController,
                            decoration: InputDecoration(
                              hintText: '●●●',
                              filled: true,
                              fillColor: Colors.white,
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(8),
                              ),
                            ),
                            keyboardType: TextInputType.number,
                            obscureText: true,
                            validator: (value) => value!.length != 3
                                ? "CVV must be 3 digits"
                                : null,
                            onChanged: (value) => validateForm(),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 20),

                // *Save Card Toggle*
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'Save this card',
                      style: TextStyle(
                        fontFamily: 'Inter',
                        fontSize: 16,
                      ),
                    ),
                    Switch(
                      value: isSaved,
                      activeColor: Color(0xFFDE5902),
                      onChanged: (value) {
                        setState(() {
                          isSaved = value;
                        });
                      },
                    ),
                  ],
                ),
                Text(
                  'Your card information is safe with us',
                  style: TextStyle(
                    fontFamily: 'Inter',
                    fontSize: 12,
                    color: Colors.grey,
                  ),
                ),
                SizedBox(height: 20),

                // *Subtotal and Grand Total*
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'Subtotal',
                      style: TextStyle(
                        fontFamily: 'Inter',
                        fontSize: 16,
                      ),
                    ),
                    Text(
                      '195 EGP',
                      style: TextStyle(
                        fontFamily: 'Inter',
                        fontSize: 16,
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 10),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'Promo Code',
                      style: TextStyle(
                        fontFamily: 'Inter',
                        fontSize: 16,
                      ),
                    ),
                    Text(
                      'Enter code Here >',
                      style: TextStyle(
                        fontFamily: 'Inter',
                        fontSize: 16,
                        color: Color(0xFFDE5902),
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 10),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'Grand Total',
                      style: TextStyle(
                        fontFamily: 'Inter',
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Text(
                      '180 EGP',
                      style: TextStyle(
                        fontFamily: 'Inter',
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 20),

                // *Confirm Button*
                Center(
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor:
                          isFormValid ? Color(0xFFDE5902) : Colors.grey,
                      padding:
                          EdgeInsets.symmetric(vertical: 12, horizontal: 80),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20),
                      ),
                    ),
                    onPressed: isFormValid
                        ? () {
                            // Navigate to PaymentConfirmationPage
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) =>
                                      PaymentConfirmationPage()),
                            );
                          }
                        : null,
                    child: Text(
                      'Confirm',
                      style: TextStyle(
                        fontFamily: 'Inter Tight',
                        fontSize: 18,
                        color: Colors.white,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
