class Constants {





 static final RegExp EMAIL_VALIDATION_REGEX =
  RegExp(r"^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$");

 static final RegExp PASSWORD_VALIDATION_REGEX =
  RegExp(r"^(?=.*\d)(?=.*[a-z])(?=.*[A-Z])(?=.*[a-zA-Z]).{8,}$");

 static final RegExp NAME_VALIDATION_REGEX = RegExp(r"\b([A-ZÀ-ÿ][-,a-z. ']+[ ]*)+");

  static const  String PLACEHOLDER_PFP =
      "https://t3.ftcdn.net/jpg/05/16/27/58/360_F_516275801_f3Fsp17x6HQK0xQgDQEELoTuERO4SsWV.jpg";






 // Define the list of Firm types as static
 static const List<String> firmTypes = [
  'Company',
  'Private Limited',
  'Partnership',
  'Proprietorship',
  'LLP',
  'OPC'
 ];

 // Define the map for Multiple Login Required options as static
 static const Map<String, List<String>> multipleLoginOptions = {
  'No': [],
  'Yes': ['2', '3', '4'],
 };

 // Define the list of title options as static
 static const List<String> titleOptions = ['Mr', 'Ms', 'Mrs', 'Dr'];




}

enum UserType {viewer,sponsor,agent}

