import 'package:flutter/material.dart';
import 'package:grocery_user_app/controllers/provider/users/user_provider.dart';
import 'package:grocery_user_app/models/users/user_details_model.dart';
import 'package:provider/provider.dart';

class UserDetailsForm extends StatefulWidget {
  @override
  _UserDetailsFormState createState() => _UserDetailsFormState();
}

class _UserDetailsFormState extends State<UserDetailsForm> {
  final _formKey = GlobalKey<FormState>();

  final TextEditingController unameController = TextEditingController();
  final TextEditingController uaddressController = TextEditingController();
  final TextEditingController unearcityController = TextEditingController();
  final TextEditingController pincodeController = TextEditingController();
  final TextEditingController phoneController = TextEditingController();

  String? selectedState;
  String? selectedCountry;

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

  final List<String> countries =  [
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
        title: const Text("User Details"),
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
                _buildTextField("Name", unameController, TextInputType.text),
                _buildTextField(
                    "Address", uaddressController, TextInputType.text),
                _buildTextField(
                    "Nearby City", unearcityController, TextInputType.text),
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
                    "Pincode", pincodeController, TextInputType.number),
                _buildTextField(
                    "Phone Number", phoneController, TextInputType.phone),
                const SizedBox(height: 20),
                Center(
                  child: SizedBox(
                    width: double.infinity, // Full-width button
                    child: ElevatedButton(
                      onPressed: () {
                        if (_formKey.currentState!.validate()) {
                          var userDetails = UserDetailsModel(
                            name: unameController.text,
                            address: uaddressController.text,
                            nearbyCity: unearcityController.text,
                            state: selectedState,
                            country: selectedCountry,
                            pincode: int.tryParse(pincodeController.text),
                            phoneNumber: int.tryParse(phoneController.text),
                          );

                          userData.addUserDetails(userDetails);

                          // Saare textfields clear karne ke liye
                          unameController.clear();
                          uaddressController.clear();
                          unearcityController.clear();
                          pincodeController.clear();
                          phoneController.clear();

                          // Dropdowns reset karne ke liye
                          setState(() {
                            selectedState = null;
                            selectedCountry = null;
                          });

                          ScaffoldMessenger.of(context).showSnackBar(
                            const SnackBar(
                              content: Text("Details submitted successfully!"),
                            ),
                          );
                        }
                      },

                    style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.orange,
                        padding: const EdgeInsets.symmetric(
                          horizontal: 30,
                          vertical: 15,
                        ),
                        textStyle: const TextStyle(fontSize: 16),
                      ),
                      child: const Text("Submit"),
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

  Widget _buildTextField(String label, TextEditingController controller,
      TextInputType inputType) {
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
        validator: (value) {
          if (value == null || value.isEmpty) {
            return "$label is required";
          }

          // Phone Number ke liye specific validation
          if (label == "Phone Number") {
            if (value.length != 10) {
              return "Phone number must be exactly 10 digits";
            }
            if (!RegExp(r'^\d{10}$').hasMatch(value)) {
              return "Only numeric digits are allowed";
            }
          }

          return null;
        },
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
