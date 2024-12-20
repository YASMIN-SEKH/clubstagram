import 'package:flutter/material.dart';
import 'main.dart'; // Import the WelcomePage

// To store user data globally
Map<String, dynamic> userData = {};

class RegisterPage extends StatefulWidget {
  @override
  _RegisterPageState createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  final _formKey = GlobalKey<FormState>();

  // Controllers for text fields
  final TextEditingController _firstNameController = TextEditingController();
  final TextEditingController _middleNameController = TextEditingController();
  final TextEditingController _lastNameController = TextEditingController();
  final TextEditingController _studentNumberController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _phoneNumberController = TextEditingController();

  // Dropdown values
  String? _selectedYearLevel;
  String? _selectedDegreeProgram;
  String? _selectedMonth;
  String? _selectedDay;
  String? _selectedYear;

  // Dropdown options
  final List<String> _yearLevels = ['1st Year', '2nd Year', '3rd Year', '4th Year'];
  final List<String> _degreePrograms = ['B.Tech Computer Science', 'B.Tech IT', 'B.Tech Engineering'];
  final List<String> _months = ['January', 'February', 'March', 'April', 'May', 'June'];
  final List<String> _days = List.generate(31, (index) => '${index + 1}');
  final List<String> _years = List.generate(100, (index) => '${DateTime.now().year - index}');

  // Checkboxes for extracurricular activities and talents
  List<String> _extraCurriculars = ['Student Council', 'Class Officer', 'Club/Organization', 'Varsity Player'];
  List<String> _selectedExtraCurriculars = [];

  List<String> _skills = [
    'Acting', 'Arts/Crafts', 'Calculating', 'Dancing', 'Debating', 'Drawing',
    'Eating', 'Fashion', 'Photography', 'Playing guitar', 'Playing piano',
    'Playing drums', 'Programming', 'Singing', 'Writing'
  ];
  List<String> _selectedSkills = [];

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;

    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [Color(0xFF1E1E56), Color(0xFF4B4B9D)],
          ),
        ),
        child: Center(
          child: SingleChildScrollView(
            physics: BouncingScrollPhysics(),
            child: Container(
              width: screenWidth * 0.6, // 60% of screen width
              child: Card(
                margin: EdgeInsets.all(20),
                elevation: 5,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Padding(
                  padding: EdgeInsets.symmetric(horizontal: 24, vertical: 32),
                  child: Form(
                    key: _formKey,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Center(
                          child: Text(
                            'STUDENT REGISTRATION FORM',
                            style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                            textAlign: TextAlign.center,
                          ),
                        ),
                        SizedBox(height: 24),
                        Text(
                          'Basic Information',
                          style: TextStyle(fontSize: 18, fontWeight: FontWeight.w600),
                        ),
                        Divider(),
                        SizedBox(height: 16),

                        // Form Fields
                        _buildTextField(_firstNameController, 'First Name'),
                        SizedBox(height: 16),
                        _buildTextField(
                          _studentNumberController,
                          'Student Number',
                          hintText: 'e.g. 11183021',
                          keyboardType: TextInputType.number,
                        ),
                        SizedBox(height: 16),
                        _buildDropdown(
                          value: _selectedYearLevel,
                          items: _yearLevels,
                          label: 'Year Level',
                          onChanged: (value) => setState(() => _selectedYearLevel = value),
                        ),
                        SizedBox(height: 16),
                        _buildDropdown(
                          value: _selectedDegreeProgram,
                          items: _degreePrograms,
                          label: 'Degree Program',
                          onChanged: (value) => setState(() => _selectedDegreeProgram = value),
                        ),
                        SizedBox(height: 16),
                        _buildTextField(
                          _emailController,
                          'Email',
                          hintText: 'example@example.com',
                          keyboardType: TextInputType.emailAddress,
                        ),
                        SizedBox(height: 16),
                        _buildTextField(
                          _phoneNumberController,
                          'Phone Number',
                          hintText: '(91) 0000000000',
                          keyboardType: TextInputType.phone,
                        ),
                        SizedBox(height: 16),
                        Text(
                          'Birth Date',
                          style: TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
                        ),
                        SizedBox(height: 8),
                        Row(
                          children: [
                            Expanded(
                              child: _buildDropdown(
                                value: _selectedMonth,
                                items: _months,
                                label: 'Month',
                                onChanged: (value) => setState(() => _selectedMonth = value),
                              ),
                            ),
                            SizedBox(width: 8),
                            Expanded(
                              child: _buildDropdown(
                                value: _selectedDay,
                                items: _days,
                                label: 'Day',
                                onChanged: (value) => setState(() => _selectedDay = value),
                              ),
                            ),
                            SizedBox(width: 8),
                            Expanded(
                              child: _buildDropdown(
                                value: _selectedYear,
                                items: _years,
                                label: 'Year',
                                onChanged: (value) => setState(() => _selectedYear = value),
                              ),
                            ),
                          ],
                        ),
                        SizedBox(height: 24),

                        // Extra Curricular Activities
                        Text(
                          'Extra Curricular Participation',
                          style: TextStyle(fontSize: 18, fontWeight: FontWeight.w600),
                        ),
                        Divider(),
                        _buildMultiCheckbox('Extra Curriculars', _extraCurriculars, _selectedExtraCurriculars),
                        SizedBox(height: 16),

                        // Skills/Talents
                        Text(
                          'Skills/Talents',
                          style: TextStyle(fontSize: 18, fontWeight: FontWeight.w600),
                        ),
                        Divider(),
                        _buildMultiCheckbox('Skills', _skills, _selectedSkills),
                        SizedBox(height: 24),

                        // Register Button
                        Center(
                          child: ElevatedButton(
                            onPressed: () {
                              if (_formKey.currentState!.validate()) {
                                _submitForm();
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) => WelcomePage(userData: userData),
                                  ),
                                );
                              }
                            },
                            style: ElevatedButton.styleFrom(
                              backgroundColor: Colors.blueAccent,
                              foregroundColor: Colors.white,
                              padding: EdgeInsets.symmetric(horizontal: 32, vertical: 12),
                            ),
                            child: Text('Register'),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildTextField(TextEditingController controller, String label,
      {String? hintText, TextInputType keyboardType = TextInputType.text}) {
    return TextFormField(
      controller: controller,
      keyboardType: keyboardType,
      decoration: InputDecoration(
        labelText: label,
        hintText: hintText,
        border: OutlineInputBorder(borderRadius: BorderRadius.circular(8)),
      ),
    );
  }

  Widget _buildDropdown({
    required String? value,
    required List<String> items,
    required String label,
    required void Function(String?) onChanged,
  }) {
    return DropdownButtonFormField<String>(
      value: value,
      items: items.map((item) => DropdownMenuItem(value: item, child: Text(item))).toList(),
      onChanged: onChanged,
      decoration: InputDecoration(
        labelText: label,
        border: OutlineInputBorder(borderRadius: BorderRadius.circular(8)),
      ),
    );
  }

  Widget _buildMultiCheckbox(String label, List<String> options, List<String> selectedItems) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: options.map((option) {
        return CheckboxListTile(
          value: selectedItems.contains(option),
          title: Text(option),
          onChanged: (bool? value) {
            setState(() {
              value! ? selectedItems.add(option) : selectedItems.remove(option);
            });
          },
        );
      }).toList(),
    );
  }

  void _submitForm() {
    userData = {
      'firstName': _firstNameController.text,
      'middleName': _middleNameController.text,
      'lastName': _lastNameController.text,
      'studentNumber': _studentNumberController.text,
      'email': _emailController.text,
      'phoneNumber': _phoneNumberController.text,
      'yearLevel': _selectedYearLevel ?? 'Not Selected',
      'degreeProgram': _selectedDegreeProgram ?? 'Not Selected',
      'birthMonth': _selectedMonth ?? 'Not Selected',
      'birthDay': _selectedDay ?? 'Not Selected',
      'birthYear': _selectedYear ?? 'Not Selected',
      'extraCurriculars': _selectedExtraCurriculars,
      'skills': _selectedSkills,
    };
  }
}
