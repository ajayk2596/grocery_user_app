import 'package:flutter/material.dart';
import '../NewAddress/new_address.dart';

class Ordered extends StatefulWidget {
  const Ordered({super.key});

  @override
  State<Ordered> createState() => _OrderedState();
}

class _OrderedState extends State<Ordered> {
  int _currentStep = 0;

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    double screenHeight = MediaQuery.of(context).size.height;

    return DefaultTabController(
      initialIndex: 0,
      length: 2,
      child: Scaffold(
        appBar: AppBar(
          actions: [
            IconButton(
              onPressed: () {
                Navigator.push(context, MaterialPageRoute(builder: (context) => NewAddress()));
              },
              icon: Icon(Icons.add, color: Colors.orange),
            ),
          ],
          leading: IconButton(
            icon: const Icon(Icons.arrow_back_ios_new_outlined, color: Colors.orange),
            onPressed: () => Navigator.pop(context),
          ),
          centerTitle: true,
          title: Padding(
            padding: const EdgeInsets.only(top: 20.0),
            child: Text(
              'Orders',
              style: TextStyle(
                color: Colors.orange,
                fontSize: screenWidth * 0.06,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          bottom: const TabBar(
            indicatorColor: Colors.orange,
            labelColor: Colors.orange,
            unselectedLabelColor: Colors.grey,
            tabs: <Widget>[
              Tab(text: 'Ongoing'),
              Tab(text: 'History'),
            ],
          ),
        ),
        body: TabBarView(
          children: <Widget>[
            Column(
              children: [
                SizedBox(height: screenHeight * 0.02),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        children: [
                          Image.asset('assets/images/packing.png', height: screenHeight * 0.04),
                          SizedBox(width: 10),
                          Text('March 5, 2019', style: TextStyle(fontWeight: FontWeight.bold)),
                        ],
                      ),
                      Text('6:30 pm', style: TextStyle(fontWeight: FontWeight.bold, color: Colors.orange)),
                    ],
                  ),
                ),
                Expanded(
                  child: Stepper(
                    currentStep: _currentStep,
                    onStepTapped: (step) => setState(() => _currentStep = step),
                    onStepContinue: () {
                      if (_currentStep < 2) {
                        setState(() => _currentStep += 1);
                      }
                    },
                    onStepCancel: () {
                      if (_currentStep > 0) {
                        setState(() => _currentStep -= 1);
                      }
                    },
                    steps: [
                      Step(
                        title: Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Image.asset('assets/images/packing.png', height: screenHeight * 0.05),
                            SizedBox(width: 15),
                            Expanded(
                              child: Text(
                                'We are Packing Your items.',
                                style: TextStyle(fontSize: screenWidth * 0.045),
                              ),
                            ),
                          ],
                        ),
                        content: Text('Details for Step 1'),
                        isActive: _currentStep >= 0,
                        state: _currentStep > 0 ? StepState.complete : StepState.indexed,
                      ),
                      Step(
                        title: Row(
                          children: [
                            Image.asset('assets/images/scooter.png', height: screenHeight * 0.05),
                            SizedBox(width: 15),
                            Expanded(
                              child: Text(
                                'Your Order is Delivering to Your Location...',
                                style: TextStyle(fontSize: screenWidth * 0.045),
                              ),
                            ),
                          ],
                        ),
                        content: Text('Details for Step 2'),
                        isActive: _currentStep >= 1,
                        state: _currentStep > 1 ? StepState.complete : StepState.indexed,
                      ),
                      Step(
                        title: Row(
                          children: [
                            Image.asset('assets/images/receive.png', height: screenHeight * 0.05),
                            SizedBox(width: 15),
                            Expanded(
                              child: Text(
                                'Your Order is received.',
                                style: TextStyle(fontSize: screenWidth * 0.045),
                              ),
                            ),
                          ],
                        ),
                        content: Text('Details for Step 3'),
                        isActive: _currentStep >= 2,
                        state: _currentStep > 2 ? StepState.complete : StepState.indexed,
                      ),
                    ],
                  ),
                ),
              ],
            ),
            ListView.builder(
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
              itemCount: 3,
              itemBuilder: (context, index) {
                return Column(
                  children: [
                    ListTile(
                      leading: CircleAvatar(
                        backgroundColor: Colors.orange,
                        maxRadius: 25,
                        child: Image.asset('assets/images/shopping.png', height: 28),
                      ),
                      title: Text(
                        'Order #${345 + index}',
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ),
                      subtitle: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Delivered',
                            style: TextStyle(color: Colors.green),
                          ),
                          Text('June 26, 2024'),
                        ],
                      ),
                      trailing: Text(
                        "\$700",
                        style: TextStyle(color: Colors.orange, fontSize: 20),
                      ),
                    ),
                    Divider(thickness: 1, color: Colors.grey[300]),
                  ],
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
