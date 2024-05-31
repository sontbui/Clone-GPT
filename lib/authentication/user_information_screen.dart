import 'package:clone_gpt/service/assets_manager.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter/widgets.dart';
import 'package:rounded_loading_button_plus/rounded_loading_button.dart';
import 'package:intl/intl.dart';

class UserInformationScreen extends StatefulWidget {
  final String phoneNumber;
  const UserInformationScreen({super.key, required this.phoneNumber});

  @override
  State<UserInformationScreen> createState() => _UserInformationScreenState();
}

class _UserInformationScreenState extends State<UserInformationScreen> {
  final TextEditingController nameController = TextEditingController();
  final TextEditingController phoneController = TextEditingController();
  final TextEditingController dobController = TextEditingController();
  @override
  void dispose() {
    nameController.dispose();
    phoneController.dispose();
    super.dispose();
  }

  final RoundedLoadingButtonController buttonController =
      RoundedLoadingButtonController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Center(
            child: Padding(
              padding: const EdgeInsets.symmetric(
                vertical: 8.0,
                horizontal: 35,
              ),
              child: Column(
                children: [
                  Center(
                    child: Stack(
                      children: [
                        CircleAvatar(
                          radius: 70,
                          backgroundImage: AssetImage(AssetsManager.userIcon),
                        ),
                        Positioned(
                          bottom: 0,
                          right: 0,
                          child: Container(
                            decoration: BoxDecoration(
                              color: Colors.grey,
                              border: Border.all(
                                width: 0.7,
                                color: Colors.white,
                              ),
                              borderRadius: const BorderRadius.all(
                                Radius.circular(50),
                              ),
                            ),
                            child: ClipRRect(
                              borderRadius: BorderRadius.circular(20),
                              child: IconButton(
                                icon: Icon(Icons.camera_alt),
                                color: Colors.white,
                                onPressed: () {},
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(
                    height: 30,
                  ),
                  Container(
                    width: MediaQuery.of(context).size.width,
                    margin: const EdgeInsets.only(top: 20),
                    child: Column(
                      children: [
                        myTextFormField(
                          hintText: 'Enter your name',
                          icon: Icons.account_circle,
                          textInputType: TextInputType.name,
                          maxLines: 1,
                          maxLength: 50,
                          textEditingController: nameController,
                          enable: true,
                        ),
                        const SizedBox(
                          height: 20,
                        ),
                        myTextFormField(
                          hintText: 'Date of birth',
                          textInputType: TextInputType.datetime,
                          maxLines: 1,
                          maxLength: 50,
                          textEditingController: dobController,
                          enable: true,
                          icon: Icons.abc,
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(height: 40),
                  const SizedBox(height: 10),
                  SizedBox(
                    width: double.infinity,
                    height: 50,
                    child: RoundedLoadingButton(
                      controller: buttonController,
                      onPressed: () {},
                      successIcon: Icons.check,
                      successColor: Colors.green,
                      errorColor: Colors.red,
                      color: Colors.grey,
                      child: const Text(
                        'Save',
                        style: TextStyle(
                          fontSize: 24,
                          fontWeight: FontWeight.bold,
                          color: Colors.black,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget myTextFormField({
    required String hintText,
    required IconData icon,
    required TextInputType textInputType,
    required int maxLines,
    required int maxLength,
    required TextEditingController textEditingController,
    required bool enable,
  }) {
    return TextFormField(
      enabled: enable,
      readOnly: textInputType == TextInputType.datetime,
      cursorColor: const Color.fromARGB(255, 254, 254, 254),
      controller: textEditingController,
      maxLength: maxLength,
      maxLines: maxLines,
      decoration: InputDecoration(
        counterText: '',
        prefixIcon: Container(
          margin: const EdgeInsets.all(0.0),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10.0),
          ),
          child: Icon(
            icon,
            size: 20,
            color: Colors.white,
          ),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(20.0),
          borderSide: const BorderSide(
            color: Colors.black,
          ),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(20),
          borderSide: const BorderSide(
            color: Color.fromARGB(255, 60, 150, 86),
          ),
        ),
        suffixIcon: textInputType == TextInputType.datetime
            ? IgnorePointer(
                ignoring: !enable,
                child: IconButton(
                  icon: const Icon(Icons.calendar_today),
                  onPressed: enable ? () => _selectedDate(context) : null,
                  color: Colors.white,
                ),
              )
            : null,
        hintText: hintText,
        alignLabelWithHint: true,
        border: InputBorder.none,
        fillColor: Colors.black,
        filled: true,
      ),
      style: const TextStyle(
        color: Colors.white,
        fontSize: 16,
      ),
    );
  }

  Future<void> _selectedDate(BuildContext context) async {
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(1900),
      lastDate: DateTime.now(),
    );
    if (picked != null) {
      final formattefDate = DateFormat('dd/MM/yyyy').format(picked);

      dobController.text = DateFormat('dd/MM/yyyy').format(picked).toString();
    }
  }
}
