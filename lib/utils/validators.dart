//is valid email
String? isEmail(String? value) {
  if (value!.isEmpty) {
    return 'Email is required';
  }
  if (!RegExp(r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$').hasMatch(value)) {
    return 'Please enter a valid email';
  }
  return null;
}

//is valid password
String? isPassword(String? value) {
  if (value!.isEmpty) {
    return 'Password is required';
  }
  if (value.length < 6) {
    return 'Password must be at least 6 characters';
  }
  return null;
}
//is valid name
String? isName(String? value) {
  if (value!.isEmpty) {
    return 'Name is required';
  }
  if (value.length < 3) {
    return 'Name must be at least 3 characters';
  }
  return null;
}

//is valid phone number
String? isPhoneNumber(String? value) {
  if (value!.isEmpty) {
    return 'Phone number is required';
  }
  if (value.length < 10) {
    return 'Phone number must be at least 10 characters';
  }
  return null;
}


//cnfirm password

