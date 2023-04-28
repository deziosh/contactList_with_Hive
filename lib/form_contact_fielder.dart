import 'package:contact_crud_hive/model/user.dart';
import 'package:flutter/material.dart';

class FormContactFielder extends StatelessWidget {
  TextEditingController controller;
  String hintTextName;
  IconData iconData;
  TextInputType textInputType;

  FormContactFielder(
      {super.key,
      required this.controller,
      required this.hintTextName,
      required this.iconData,
      this.textInputType = TextInputType.text});

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      decoration: InputDecoration(
        icon: Icon(iconData),
        hintText: hintTextName,
        filled: true,
      ),
      keyboardType: textInputType,
      validator: (value) {
        if (value == null || value.isEmpty) {
          return 'Por Favor Digite $hintTextName';
        }
        if (hintTextName == 'Email' && !validateEmail(value)) {
          return 'Digite um Email Válido';
        }
        if (hintTextName == 'Nome' && !validateName(value)) {
          return 'O Nome não pode conter números';
        }
        if (hintTextName == 'Código' && !validateCodigo(value)) {
          return 'O código deve ser válido e conter apenas números';
        }
        if (hintTextName == 'Telefone' && !validateTelefone(value)) {
          return 'O telefone deve conter apenas números';
        }
      },
    );
  }
}

validateEmail(String email) {
  final emailReg = RegExp(
      r"^[a-zA-Z0-9.!#$%&'*+/=?^_`{|}~-]+@[a-zA-Z0-9](?:[a-zA-Z0-9-]{0,253}[a-zA-Z0-9])?(?:\.[a-zA-Z0-9](?:[a-zA-Z0-9-]{0,253}[a-zA-Z0-9])?)*$");
  return emailReg.hasMatch(email);
}

validateName(String name) {
  final nameReg = RegExp(r'^[a-zA-Z ]+$');
  return nameReg.hasMatch(name);
}

validateCodigo(String codigo) {
  final phoneReg = RegExp(r'^[0-9]+$');
  return phoneReg.hasMatch(codigo);
}

validateTelefone(String telefone) {
  final phoneReg = RegExp(r'^[0-9]+$');
  return phoneReg.hasMatch(telefone);
}
