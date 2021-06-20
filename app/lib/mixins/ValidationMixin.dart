class ValidationMixin {
  String validateEmail(String value){
    Pattern pattern =
      r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$';
    RegExp regex = new RegExp(pattern);
  return (!regex.hasMatch(value)) ? "Invalid Email" : null;
  }

  String validatePassword(String value){
    if(value.length > 8){
      return null;
    }
    return "Password is too short";
  }

  String validateName(String value){
    if(value.length >= 4){
      return null;
    }
    return "Name is too short";
  }
}