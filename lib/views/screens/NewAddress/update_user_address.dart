import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:grocery_user_app/controllers/provider/users/user_provider.dart';
import 'package:grocery_user_app/models/users/user_details_model.dart';
import 'package:provider/provider.dart';

class UpdateUserDetailsForm extends StatefulWidget {
  UserDetailsModel userDetailsModel;

  UpdateUserDetailsForm({super.key, required this.userDetailsModel});

  @override
  _UpdateUserDetailsFormState createState() => _UpdateUserDetailsFormState();
}

class _UpdateUserDetailsFormState extends State<UpdateUserDetailsForm> {
  final _formKey = GlobalKey<FormState>();

  final TextEditingController uUpNameController = TextEditingController();
  final TextEditingController uUpAddressController = TextEditingController();
  final TextEditingController uUpNearCityController = TextEditingController();
  final TextEditingController upPincodeController = TextEditingController();
  final TextEditingController upPhoneController = TextEditingController();

  String? selectedState;
  String? selectedCountry;

  @override
  void initState() {
    uUpNameController.text = widget.userDetailsModel.name ?? "";
    uUpAddressController.text = widget.userDetailsModel.address ?? "";
    uUpNearCityController.text = widget.userDetailsModel.nearbyCity ?? "";
    upPincodeController.text =
        widget.userDetailsModel.pincode?.toString() ?? "";
    upPhoneController.text =
        widget.userDetailsModel.phoneNumber?.toString() ?? "";
    selectedState = widget.userDetailsModel.state;
    selectedCountry = widget.userDetailsModel.country;
    super.initState();
  }

  final List<String> states = [
    'Andhra Pradesh',
    'Arunachal Pradesh',
    'Assam',
    'Bihar',
    'Chhattisgarh',
    'Goa',
    'Gujarat',
    'Haryana',
    'Himachal Pradesh',
    'Jharkhand',
    'Karnataka',
    'Kerala',
    'Madhya Pradesh',
    'Maharashtra',
    'Manipur',
    'Meghalaya',
    'Mizoram',
    'Nagaland',
    'Odisha',
    'Punjab',
    'Rajasthan',
    'Sikkim',
    'Tamil Nadu',
    'Telangana',
    'Tripura',
    'Uttar Pradesh',
    'Uttarakhand',
    'West Bengal',
  ];

  final List<String> countries = [
    "Afghanistan",
    "Albania",
    "Algeria",
    "Andorra",
    "Angola",
    "Antigua and Barbuda",
    "Argentina",
    "Armenia",
    "Australia",
    "Austria",
    "Azerbaijan",
    "Bahamas",
    "Bahrain",
    "Bangladesh",
    "Barbados",
    "Belarus",
    "Belgium",
    "Belize",
    "Benin",
    "Bhutan",
    "Bolivia",
    "Bosnia and Herzegovina",
    "Botswana",
    "Brazil",
    "Brunei",
    "Bulgaria",
    "Burkina Faso",
    "Burundi",
    "Cambodia",
    "Cameroon",
    "Canada",
    "Cape Verde",
    "Central African Republic",
    "Chad",
    "Chile",
    "China",
    "Colombia",
    "Comoros",
    "Congo (Congo-Brazzaville)",
    "Costa Rica",
    "Croatia",
    "Cuba",
    "Cyprus",
    "Czech Republic",
    "Denmark",
    "Djibouti",
    "Dominica",
    "Dominican Republic",
    "Ecuador",
    "Egypt",
    "El Salvador",
    "Equatorial Guinea",
    "Eritrea",
    "Estonia",
    "Eswatini (Swaziland)",
    "Ethiopia",
    "Fiji",
    "Finland",
    "France",
    "Gabon",
    "Gambia",
    "Georgia",
    "Germany",
    "Ghana",
    "Greece",
    "Grenada",
    "Guatemala",
    "Guinea",
    "Guinea-Bissau",
    "Guyana",
    "Haiti",
    "Holy See",
    "Honduras",
    "Hungary",
    "Iceland",
    "India",
    "Indonesia",
    "Iran",
    "Iraq",
    "Ireland",
    "Israel",
    "Italy",
    "Jamaica",
    "Japan",
    "Jordan",
    "Kazakhstan",
    "Kenya",
    "Kiribati",
    "Korea (North)",
    "Korea (South)",
    "Kosovo",
    "Kuwait",
    "Kyrgyzstan",
    "Laos",
    "Latvia",
    "Lebanon",
    "Lesotho",
    "Liberia",
    "Libya",
    "Liechtenstein",
    "Lithuania",
    "Luxembourg",
    "Madagascar",
    "Malawi",
    "Malaysia",
    "Maldives",
    "Mali",
    "Malta",
    "Marshall Islands",
    "Mauritania",
    "Mauritius",
    "Mexico",
    "Micronesia",
    "Moldova",
    "Monaco",
    "Mongolia",
    "Montenegro",
    "Morocco",
    "Mozambique",
    "Myanmar (Burma)",
    "Namibia",
    "Nauru",
    "Nepal",
    "Netherlands",
    "New Zealand",
    "Nicaragua",
    "Niger",
    "Nigeria",
    "North Macedonia",
    "Norway",
    "Oman",
    "Pakistan",
    "Palau",
    "Palestine State",
    "Panama",
    "Papua New Guinea",
    "Paraguay",
    "Peru",
    "Philippines",
    "Poland",
    "Portugal",
    "Qatar",
    "Romania",
    "Russia",
    "Rwanda",
    "Saint Kitts and Nevis",
    "Saint Lucia",
    "Saint Vincent and the Grenadines",
    "Samoa",
    "San Marino",
    "Sao Tome and Principe",
    "Saudi Arabia",
    "Senegal",
    "Serbia",
    "Seychelles",
    "Sierra Leone",
    "Singapore",
    "Slovakia",
    "Slovenia",
    "Solomon Islands",
    "Somalia",
    "South Africa",
    "Spain",
    "Sri Lanka",
    "Sudan",
    "Suriname",
    "Sweden",
    "Switzerland",
    "Syria",
    "Taiwan",
    "Tajikistan",
    "Tanzania",
    "Thailand",
    "Timor-Leste",
    "Togo",
    "Tonga",
    "Trinidad and Tobago",
    "Tunisia",
    "Turkey",
    "Turkmenistan",
    "Tuvalu",
    "Uganda",
    "Ukraine",
    "United Arab Emirates",
    "United Kingdom",
    "United States of America",
    "Uruguay",
    "Uzbekistan",
    "Vanuatu",
    "Venezuela",
    "Vietnam",
    "Yemen",
    "Zambia",
    "Zimbabwe",
  ];

  @override
  Widget build(BuildContext context) {
    final userData = Provider.of<UserProvider>(context);

    return Scaffold(
      appBar: AppBar(
        title: const Text(" Edit User Details"),
        centerTitle: true,
        backgroundColor: Colors.orange,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Form(
          key: _formKey,
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                _buildTextField("Name", uUpNameController, TextInputType.text),
                _buildTextField(
                    "Address", uUpAddressController, TextInputType.text),
                _buildTextField(
                    "Nearby City", uUpNearCityController, TextInputType.text),
                _buildDropdownTextField(
                  label: "State",
                  selectedValue: selectedState,
                  items: states,
                  onSelected: (value) {
                    setState(() {
                      selectedState = value;
                    });
                  },
                ),
                _buildDropdownTextField(
                  label: "Country",
                  selectedValue: selectedCountry,
                  items: countries,
                  onSelected: (value) {
                    setState(() {
                      selectedCountry = value;
                    });
                  },
                ),
                _buildTextField(
                    "Pincode", upPincodeController, TextInputType.number),
                _buildTextField(
                    "Phone Number", upPhoneController, TextInputType.phone),
                const SizedBox(height: 20),
                Center(
                  child: SizedBox(
                      width: double.infinity, // Full-width button
                      child: ElevatedButton(
                        onPressed: () async {
                          // Ensure userId is valid
                          final userId =
                              FirebaseAuth.instance.currentUser?.uid ?? "";

                          if (userId != null && userId.isNotEmpty) {
                            try {
                              // Create an updated user details object
                              var updatedUserDetails = UserDetailsModel(
                                name: uUpNameController.text.isNotEmpty
                                    ? uUpNameController.text
                                    : widget.userDetailsModel.name,
                                address: uUpAddressController.text.isNotEmpty
                                    ? uUpAddressController.text
                                    : widget.userDetailsModel.address,
                                nearbyCity:
                                    uUpNearCityController.text.isNotEmpty
                                        ? uUpNearCityController.text
                                        : widget.userDetailsModel.nearbyCity,
                                state: selectedState ??
                                    widget.userDetailsModel.state,
                                country: selectedCountry ??
                                    widget.userDetailsModel.country,
                                pincode:
                                    int.tryParse(upPincodeController.text) ??
                                        widget.userDetailsModel.pincode,
                                phoneNumber:
                                    int.tryParse(upPhoneController.text) ??
                                        widget.userDetailsModel.phoneNumber,
                              );

                              // Update user details in Provider
                              await Provider.of<UserProvider>(context,
                                      listen: false)
                                  .updateUserDetails(
                                      userId, updatedUserDetails);

                              // Success message
                              ScaffoldMessenger.of(context).showSnackBar(
                                const SnackBar(
                                    content:
                                        Text("Details updated successfully!")),
                              );

                              // Clear the form and reset dropdowns
                              _clearFormFields();

                              // Navigate back to the previous screen
                              Navigator.pop(context);
                            } catch (e) {
                              // Handle error during update
                              print("Error updating data: $e");
                              ScaffoldMessenger.of(context).showSnackBar(
                                SnackBar(content: Text("Failed to update: $e")),
                              );
                            }
                          } else {
                            // Error message if userId is invalid
                            ScaffoldMessenger.of(context).showSnackBar(
                              const SnackBar(
                                  content:
                                      Text("Error: User ID is null or empty!")),
                            );
                          }
                        },
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.orange,
                          padding: const EdgeInsets.symmetric(
                              horizontal: 30, vertical: 15),
                          textStyle: const TextStyle(fontSize: 16),
                        ),
                        child: const Text("Update Data"),
                      )),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }

  void _clearFormFields() {
    uUpNameController.clear();
    uUpAddressController.clear();
    uUpNearCityController.clear();
    upPincodeController.clear();
    upPhoneController.clear();

    setState(() {
      selectedState = null;
      selectedCountry = null;
    });
  }

  Widget _buildTextField(
      String label, TextEditingController controller, TextInputType inputType) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: TextFormField(
        controller: controller,
        keyboardType: inputType,
        decoration: InputDecoration(
          labelText: label,
          labelStyle: TextStyle(color: Colors.orange),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(8.0),
          ),
        ),
      ),
    );
  }

  Widget _buildDropdownTextField({
    required String label,
    required List<String> items,
    required String? selectedValue,
    required Function(String?) onSelected,
  }) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: GestureDetector(
        onTap: () {
          _showDropdownDialog(label, items, onSelected);
        },
        child: InputDecorator(
          decoration: InputDecoration(
            labelText: label,
            labelStyle: TextStyle(color: Colors.orange),
            suffixIcon: const Icon(Icons.arrow_drop_down, color: Colors.orange),
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(8.0),
            ),
          ),
          child: Text(
            selectedValue ?? "Select $label",
            style: TextStyle(
              fontSize: 16,
              color: selectedValue != null ? Colors.black : Colors.grey,
            ),
          ),
        ),
      ),
    );
  }

  void _showDropdownDialog(
      String label, List<String> items, Function(String?) onSelected) {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: Text("Select $label"),
        content: SizedBox(
          width: double.maxFinite,
          child: ListView.separated(
            shrinkWrap: true,
            itemCount: items.length,
            itemBuilder: (context, index) {
              return ListTile(
                title: Text(items[index]),
                onTap: () {
                  onSelected(items[index]);
                  Navigator.pop(context);
                },
              );
            },
            separatorBuilder: (context, index) => const Divider(),
          ),
        ),
      ),
    );
  }
}
