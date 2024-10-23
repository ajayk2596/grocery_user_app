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
      initialIndex: 1,
      length: 2,
      child: Scaffold(
        appBar: AppBar(
          actions: [
            IconButton(onPressed: () {
              Navigator.push(context, MaterialPageRoute(builder: (context) =>NewAddress() ,));
            }, icon: Icon(Icons.add))
          ],

          leading: const Icon(Icons.arrow_back_ios_new_outlined,color: Colors.orange,),
          centerTitle: true,
          title: Padding(
            padding: const EdgeInsets.only(top: 38.0),
            child: Text('Orders', style: TextStyle(color: Colors.orange,
              fontSize: screenWidth * 0.07,
              fontWeight: FontWeight.bold,),
            ),

          ),
          bottom: const TabBar(
            tabs: <Widget>[
              Tab(
                //icon: Icon(Icons.cloud_outlined),
                text:  'Ongoing',
              ),
              Tab(
                //icon: Icon(Icons.beach_access_sharp),
                text:  'History',
              ),

            ],
          ),
        ),
        body: Column(
          children: [
            SizedBox( height: screenHeight*0.01,),
            Expanded(
              child:
              TabBarView(
                children: <Widget>[
                  Column(
                    children: [
                      //SearchBar(),
                      SizedBox(height: screenHeight*0.03,),
                      Padding(
                        padding: const EdgeInsets.only(left: 28.0),
                        child: Row(
                          children: [
                            Image.asset('assets/images/packing.png', height: screenHeight * 0.04,),
                            Padding(
                              padding: const EdgeInsets.only(left: 18.0),
                              child: Text('March 5,2019',style: TextStyle(fontWeight: FontWeight.bold),),
                            ),
                            Spacer(flex: 12,),
                            Padding(
                              padding: const EdgeInsets.only(right: 18.0),
                              child: Text('6:30 pm',style: TextStyle(fontWeight: FontWeight.bold,color: Colors.orange),),
                            ),
                          ],
                        ),
                      ),

                      Column(
                        children: [
                          SizedBox(height: screenHeight*0.03,),
                          Stepper(
                            currentStep: _currentStep,
                            onStepTapped: (step) => setState(() => _currentStep = step),
                            onStepContinue: () {
                              if (_currentStep < 2) {
                                setState(() {
                                  _currentStep += 1;
                                });
                              }
                            },
                            onStepCancel: () {
                              if (_currentStep > 0){
                                setState(() {
                                  _currentStep -= 1;
                                });
                              }
                            },

                            steps: [
                              Step(
                                title: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start, // Text alignment control
                                  children: [
                                    Row(
                                      children: [
                                        Image.asset('assets/images/packing.png', height: screenHeight * 0.07,),
                                        Spacer(), // Space between image and text
                                        FittedBox(
                                          child: Text(
                                            'We are Packing Your items.',
                                            style: TextStyle(fontSize: screenWidth * 0.05),
                                          ),
                                        ),
                                      ],
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
                                    Image.asset('assets/images/scooter.png',height: screenHeight*0.07,),
                                    Spacer(),
                                    FittedBox(child: Text('Your Order is Delivering to\n Your Location...',style: TextStyle(fontSize:  screenWidth*0.05,),)),
                                  ],
                                ),
                                content: Text('Details for Step 2'),
                                isActive: _currentStep >= 1,
                                state: _currentStep > 1 ? StepState.complete : StepState.indexed,
                              ),
                              Step(
                                title: Row(
                                  children: [
                                    Image.asset('assets/images/order.png',height: screenHeight*0.07,),
                                    SizedBox(width: 13,),
                                    FittedBox(child: Text('Your Order is recived.',style: TextStyle(fontSize:  screenWidth*0.05),)),
                                  ],
                                ),
                                content: Text('Details for Step 3'),
                                isActive: _currentStep >= 2,
                                state: _currentStep > 2 ? StepState.complete : StepState.indexed,
                              ),
                            ],
                          ),
                        ],
                      ),
                    ],
                  ),

                  Center(
                    child: Column(
                      children: [
                        ListTile(
                          leading: CircleAvatar(
                            backgroundColor: Colors.orange,
                            maxRadius: 25,
                            child: Image.asset(
                              'assets/images/shopping.png',
                              height: 28,
                            ),
                          ),
                          title: Text(
                            'Order #345',
                            style: TextStyle(fontWeight: FontWeight.bold),
                          ),
                          subtitle: Column(
                            crossAxisAlignment: CrossAxisAlignment.start, // Align text to the start
                            children: [
                              Text(
                                'Delivered',
                                style: TextStyle(color: Colors.green),
                              ),
                              Text(
                                'June 26 2024',
                              ),
                            ],
                          ),
                          trailing: Text("\$700",style: TextStyle(color: Colors.orange,fontSize: 20),),
                        ),
                        Divider(),
                        ListTile(
                          leading: CircleAvatar(
                            backgroundColor: Colors.orange,
                            maxRadius: 25,
                            child: Image.asset(
                              'assets/images/shopping.png',
                              height: 28,
                            ),
                          ),
                          title: Text(
                            'Order #345',
                            style: TextStyle(fontWeight: FontWeight.bold),
                          ),
                          subtitle: Column(
                            crossAxisAlignment: CrossAxisAlignment.start, // Align text to the start
                            children: [
                              Text(
                                'Delivered',
                                style: TextStyle(color: Colors.green),
                              ),
                              Text(
                                'June 26 2024',
                              ),
                            ],
                          ),
                          trailing: Text("\$700",style: TextStyle(color: Colors.orange,fontSize: 20),),
                        ),
                        Divider(),
                        ListTile(
                          leading: CircleAvatar(
                            backgroundColor: Colors.orange,
                            maxRadius: 25,
                            child: Image.asset(
                              'assets/images/shopping.png',
                              height: 28,
                            ),
                          ),
                          title: Text(
                            'Order #345',
                            style: TextStyle(fontWeight: FontWeight.bold),
                          ),
                          subtitle: Column(
                            crossAxisAlignment: CrossAxisAlignment.start, // Align text to the start
                            children: [
                              Text(
                                'Delivered',
                                style: TextStyle(color: Colors.green),
                              ),
                              Text(
                                'June 26 2024',
                              ),
                            ],
                          ),
                          trailing: Text("\$700",style: TextStyle(color: Colors.orange,fontSize: 20),),
                        ),
                      ],
                    ),
                  ),

                ],
              ),
            ),
          ],
        ),
      ),

    );
  }
}
