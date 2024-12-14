import 'package:flutter/material.dart';
import 'package:grocery_user_app/controllers/provider/users/user_provider.dart';
import 'package:grocery_user_app/models/users/user_details_model.dart';
import 'package:provider/provider.dart';

class UpdateUserDetailsForm extends StatefulWidget {
  @override
  _UpdateUserDetailsFormState createState() => _UpdateUserDetailsFormState();
}

class _UpdateUserDetailsFormState extends State<UpdateUserDetailsForm> {
  final _formKey = GlobalKey<FormState>();

  final TextEditingController upnameController = TextEditingController();
  final TextEditingController upaddressController = TextEditingController();
  final TextEditingController upnearcityController = TextEditingController();
  final TextEditingController uppincodeController = TextEditingController();
  final TextEditingController upphoneController = TextEditingController();

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
    var index=0;
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(onPressed: () {

        }, icon: Icon(Icons.location_on_rounded,color:  Colors.orange,)),
        title: const Text("User Details"),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Form(
          key: _formKey,
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                _buildTextField("Name", upnameController, TextInputType.text),
                _buildTextField(
                    "Address", upaddressController, TextInputType.text),
                _buildTextField("Nearby City", upnearcityController,
                    TextInputType.text),
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
                    "Pincode", uppincodeController, TextInputType.number),
                _buildTextField("Phone Number", upphoneController,
                    TextInputType.phone),
                const SizedBox(height: 20),
                Center(
                  child: ElevatedButton(
                    onPressed: () {

                      var upd=UserDetailsModel(
                        name: upnameController.text,
                        address: upaddressController.text,
                        nearbyCity: upnearcityController.text,
                        state: selectedState,
                        country: selectedCountry,
                        pincode: int.tryParse(uppincodeController.text),
                        phoneNumber: int.tryParse(upphoneController.text),
                      );

                      userData.addUserDetails(upd);
                      if (_formKey.currentState!.validate()) {
                        ScaffoldMessenger.of(context).showSnackBar(
                          const SnackBar(
                            content: Text("Details submitted successfully!"),
                          ),
                        );
                      }
                    },
                    child: const Text("Submit"),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  // Helper method to create text fields
  Widget _buildTextField(String label, TextEditingController controller,
      TextInputType inputType) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: TextFormField(
        controller: controller,
        keyboardType: inputType,
        decoration: InputDecoration(
          labelText: label,
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(8.0),
          ),
        ),
        validator: (value) {
          if (value == null || value.isEmpty) {
            return "$label is required";
          }
          return null;
        },
      ),
    );
  }

  // Helper method for dropdown fields
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
        child: TextFormField(
          enabled: false, // Disable manual typing
          decoration: InputDecoration(
            labelText: label,
            suffixIcon: const Icon(Icons.arrow_drop_down,color: Colors.orange,),
            border: OutlineInputBorder(
              borderSide: BorderSide(width: 2),
              borderRadius: BorderRadius.circular(8.0),
            ),
          ),
          controller: TextEditingController(text: selectedValue),
          validator: (value) {
            if (value == null || value.isEmpty) {
              return "$label is required";
            }
            return null;
          },
        ),
      ),
    );
  }

  // Helper method to show dropdown dialog
  void _showDropdownDialog(
      String label, List<String> items, Function(String?) onSelected) {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: Text("Select $label"),
        content: SizedBox(
          width: double.maxFinite,
          child: ListView.builder(
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
          ),
        ),
      ),
    );
  }
}
