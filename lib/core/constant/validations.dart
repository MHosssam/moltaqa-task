String? validatePhone(String? value) {
  if (value!.isEmpty) {
    return 'حقل رقم الجوال فارغ';
  } else if (value.length != 9) {
    return 'يجب ان يكون رقم الجوال 9 ارقام';
  }
  return null;
}

String? validatePassword(String? value) {
  if (value!.isEmpty) {
    return 'حقل كلمه المرور فارغ';
  } else if (value.length < 8) {
    return 'يجب ان تكون كلمه المرور اكبر من 8 ارقام';
  }
  return null;
}
