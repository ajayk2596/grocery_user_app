import 'package:flutter/material.dart';

class PaymentScreen extends StatefulWidget {
  @override
  _PaymentScreenState createState() => _PaymentScreenState();
}

class _PaymentScreenState extends State<PaymentScreen> {
  String? selectedDate;
  String? selectedTimeSlot;
  String selectedPaymentMethod = "Apple Pay";

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_ios_new_outlined, color: Colors.orange),
          onPressed: () => Navigator.pop(context),
        ),
        title: Text(
          "Payment",
          style: TextStyle(color: Colors.orange, fontSize: screenWidth * 0.05),
        ),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: screenWidth * 0.05),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              _buildSectionHeader("Delivery Location", "Change"),
              _buildLocationInfo(),
              SizedBox(height: 20),
              _buildSectionHeader("Expected date & Time"),
              _buildDateAndTimeSelection(),
              SizedBox(height: 20),
              _buildInStorePickUp(),
              SizedBox(height: 20),
              _buildSectionItem("See Items"),
              SizedBox(height: 20),
              _buildPaymentMethods(),
              SizedBox(height: 20),
              _buildOrderSummary(),
            ],
          ),
        ),
      ),
      bottomNavigationBar: _buildCheckoutButton(),
    );
  }

  Widget _buildSectionHeader(String title, [String? action]) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          title,
          style: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 16,
            color: Colors.black87,
          ),
        ),
        if (action != null)
          TextButton(
            onPressed: () {},
            child: Text(
              action,
              style: TextStyle(color: Colors.orange),
            ),
          ),
      ],
    );
  }

  Widget _buildLocationInfo() {
    return Container(
      padding: EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: Colors.orange[50],
        borderRadius: BorderRadius.circular(12),
      ),
      child: Row(
        children: [
          Icon(Icons.location_on, color: Colors.orange),
          SizedBox(width: 8),
          Expanded(
            child: Text(
              "Floor 4, Kartini Tower No 43\nLumajang, Jawa Timur",
              style: TextStyle(color: Colors.black87),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildDateAndTimeSelection() {
    return Container(
      padding: EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: Colors.orange[50],
        borderRadius: BorderRadius.circular(12),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Icon(Icons.calendar_today, color: Colors.orange),
              SizedBox(width: 8),
              Expanded(
                child: DropdownButtonFormField<String>(
                  value: selectedDate,
                  decoration: InputDecoration(
                    hintText: "Select Date",
                    border: InputBorder.none,
                  ),
                  items: ["Date 1", "Date 2"].map((String date) {
                    return DropdownMenuItem<String>(
                      value: date,
                      child: Text(date),
                    );
                  }).toList(),
                  onChanged: (value) {
                    setState(() {
                      selectedDate = value;
                    });
                  },
                ),
              ),
            ],
          ),
          SizedBox(height: 10),
          Wrap(
            spacing: 8,
            children: [
              _buildTimeSlot("8 AM - 11 AM"),
              _buildTimeSlot("11 AM - 1 PM"),
              _buildTimeSlot("1 PM - 3 PM"),
              _buildTimeSlot("3 PM - 5 PM"),
              _buildTimeSlot("5 PM - 7 PM"),
              _buildTimeSlot("7 PM - 9 PM"),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildTimeSlot(String time) {
    bool isSelected = selectedTimeSlot == time;
    return ChoiceChip(
      label: Text(time),
      selected: isSelected,
      onSelected: (bool selected) {
        setState(() {
          selectedTimeSlot = selected ? time : null;
        });
      },
      backgroundColor: Colors.grey[200],
      selectedColor: Colors.orange,
      labelStyle: TextStyle(color: isSelected ? Colors.white : Colors.black87),
    );
  }

  Widget _buildInStorePickUp() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text("In-Store Pick Up", style: TextStyle(fontWeight: FontWeight.bold)),
        SizedBox(height: 5),
        Text(
          "Some Stores May Be Temporarily Unavailable.",
          style: TextStyle(color: Colors.black54),
        ),
      ],
    );
  }

  Widget _buildSectionItem(String title) {
    return Container(
      padding: EdgeInsets.symmetric(vertical: 15, horizontal: 10),
      decoration: BoxDecoration(
        color: Colors.orange[50],
        borderRadius: BorderRadius.circular(12),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(title, style: TextStyle(fontWeight: FontWeight.bold)),
          Icon(Icons.arrow_forward_ios, color: Colors.black54),
        ],
      ),
    );
  }

  Widget _buildPaymentMethods() {
    return Container(
      padding: EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: Colors.orange[50],
        borderRadius: BorderRadius.circular(12),
      ),
      child: Column(
        children: [
          _buildPaymentMethodItem("Apple Pay", Icons.apple, "Apple Pay"),
          Divider(),
          _buildPaymentMethodItem("Cash On Delivery", Icons.money_off, "Cash On Delivery"),
        ],
      ),
    );
  }

  Widget _buildPaymentMethodItem(String title, IconData icon, String method) {
    bool isSelected = selectedPaymentMethod == method;
    return ListTile(
      leading: Icon(icon, color: Colors.green),
      title: Text(title),
      trailing: isSelected ? Icon(Icons.check, color: Colors.green) : null,
      onTap: () {
        setState(() {
          selectedPaymentMethod = method;
        });
      },
    );
  }

  Widget _buildOrderSummary() {
    return Container(
      padding: EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: Colors.orange[50],
        borderRadius: BorderRadius.circular(12),
      ),
      child: Column(
        children: [
          _buildOrderSummaryItem("Subtotal", "\$137.00"),
          _buildOrderSummaryItem("Tax", "\$4.50"),
          _buildOrderSummaryItem("Delivery Price", "\$5.00"),
          Divider(),
          _buildOrderSummaryItem("Total", "\$146.50", isTotal: true),
        ],
      ),
    );
  }

  Widget _buildOrderSummaryItem(String title, String value, {bool isTotal = false}) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 4.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            title,
            style: TextStyle(fontWeight: isTotal ? FontWeight.bold : FontWeight.normal),
          ),
          Text(
            value,
            style: TextStyle(
              fontWeight: isTotal ? FontWeight.bold : FontWeight.normal,
              color: isTotal ? Colors.orange : Colors.black,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildCheckoutButton() {
    return Container(
      padding: EdgeInsets.all(15),
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          backgroundColor: Colors.orange,
          padding: EdgeInsets.symmetric(vertical: 15),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(30),
          ),
        ),
        onPressed: () {
          // Checkout action
        },
        child: Text(
          "CheckOut \$146.50",
          style: TextStyle(fontSize: 16, color: Colors.white, fontWeight: FontWeight.bold),
        ),
      ),
    );
  }
}
