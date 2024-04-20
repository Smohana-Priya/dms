// ignore: avoid_classes_with_only_static_members

class Validator {
  static final RegExp _emailRegExp = RegExp(
    r"^[a-zA-Z0-9.a-zA-Z0-9!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+",
  );

  static ValidationState validate(String input,
      {required List<String> rules, String? fieldName, int? lengthOfInput}) {
    for (int i = 0; i < rules.length; i++) {
      final String rule = rules[i];
      if (rule == 'required' && (fieldName == null || fieldName.isEmpty)) {
        if (input.trim() == '') {
          return ValidationState(error: 'This field is required');
        }
      }
      if (rule == 'required' && (fieldName != null && fieldName.isNotEmpty)) {
        if (input.trim() == '') {
          return ValidationState(error: 'Please enter your $fieldName');
        }
      }

      if (rule == 'expiry') {
        if (input.trim() == '') {
          return ValidationState(error: 'Enter expiry');
        }
      }

      if (rule == 'CVV') {
        if (input.trim() == '') {
          return ValidationState(error: 'Enter CVV');
        }
      }

      if (rule == 'email') {
        if (input == '') {
          return ValidationState(error: 'Please enter email address');
        }
        if (!_emailRegExp.hasMatch(input)) {
          return ValidationState(error: 'Please enter valid email address');
        }
      }
      if (rule == 'currentPassword') {
        //  String pattern = r'^(?=.*?[A-Z])(?=.*?[a-z])(?=.*?[0-9])(?=.*?[!@#\$&*~]).{8,}$';
        String pattern = '[a-zA-Z]';
        RegExp regExp = RegExp(pattern);
        if (input == '') {
          return ValidationState(error: 'Please enter current password');
        }
        // if (!regExp.hasMatch(input)) {
        //   return ValidationState(
        //       error:
        //       'Password should contain alpha numeric, capital letter and special char');
        // }
      }

      if (rule == 'password') {
        String pattern = r'^(?=.*?[A-Z])(?=.*?[a-z])(?=.*?[0-9])(?=.*?[!@#\$&*~]).{8,}$';
        // String pattern = r'(\d+)';
        RegExp regExp = RegExp(pattern);
        if (input == '') {
          return ValidationState(error: 'Please enter your password');
        }
        if (!regExp.hasMatch(input)) {
          return ValidationState(
              error:
              'Password should contain alpha numeric, capital letter and special char');
        }
      }


      if (rule.startsWith('min:')) {
        try {
          final int? letterCount = int.tryParse(rule.replaceAll('min:', ''));
          if (input.length < letterCount! && (fieldName == null || fieldName.isEmpty)) {
            return ValidationState(
              // ignore: avoid_redundant_argument_values
                status: false,
                error: 'Value name should be min $letterCount character long');
          }else if(input.length < letterCount && (fieldName != null && fieldName.isNotEmpty)){
            return ValidationState(
              // ignore: avoid_redundant_argument_values
                status: false,
                error: '$fieldName name should be min $letterCount character long');
          }
        } catch (_) {
          // ignore: avoid_redundant_argument_values
          return ValidationState(status: false, error: ' - $rule is incorrect');
        }
      }

      if (rule == 'number_only') {
        final RegExp regex = RegExp(r'(\d+)');
        if (!regex.hasMatch(input)) {
          // ignore: avoid_redundant_argument_values
          return ValidationState(status: false, error: 'Value is not a number');
        }
      }

      if (rule == 'mobile_number') {
        const String pattern = r'^([1-9][0-9]*)?$';

        //String pattern = (mobileLength==null)?r'(^(?:[+0]9)?$)':r'(^(?:[+0]9)?[0-9]{10}$)';
        final RegExp regExp = RegExp(pattern);
        if (input.isEmpty) {
          return ValidationState(status: true);
        } else if (!regExp.hasMatch(input)) {
          return ValidationState(error: 'Please enter valid  mobile number');
        } else if (regExp.hasMatch(input) &&
            (lengthOfInput != null && input.length != lengthOfInput)) {
          return ValidationState(
              error: 'Mobile number should contain $lengthOfInput');
        }
      }

      if (rule == 'alternateMobile_number') {
        const String pattern = r'^([1-9][0-9]*)?$';

        //String pattern = (mobileLength==null)?r'(^(?:[+0]9)?$)':r'(^(?:[+0]9)?[0-9]{10}$)';
        final RegExp regExp = RegExp(pattern);
        if (input.isEmpty) {
          return ValidationState(status: false);
        } else if (!regExp.hasMatch(input)) {
          return ValidationState(error: 'Please enter valid  mobile number');
        } else if (regExp.hasMatch(input) &&
            (lengthOfInput != null && input.length != lengthOfInput)) {
          return ValidationState(
              error: 'Mobile number should contain $lengthOfInput');
        }
      }

      if (rule == 'council_name') {
        final RegExp regex = RegExp(r'[a-zA-Z0-9]');
        if (input.isEmpty) {
          return ValidationState(error: 'Please enter valid council name');
        } else if (!regex.hasMatch(input)) {
          return ValidationState(error: 'special character not allowed');
        }
      }
      if (rule == 'council_number') {
        final RegExp regex = RegExp(r'[a-zA-Z0-9]');
        if (input.isEmpty) {
          return ValidationState(
              error: 'Please enter valid registration number');
        } else if (!regex.hasMatch(input)) {
          return ValidationState(error: 'special character not allowed');
        }
      }
      if (rule == 'council_year') {
        if (input.isEmpty) {
          return ValidationState(error: 'Please enter valid registration year');
        }
      }
      if (rule == 'establishment_name') {
        final RegExp regex = RegExp(r'[a-zA-Z0-9]');
        if (input.isEmpty) {
          return ValidationState(error: 'Please enter establishment Name');
        } else if (!regex.hasMatch(input)) {
          return ValidationState(error: 'special character not allowed');
        }
      }
      if (rule == 'location_field') {
        if (input.isEmpty) {
          return ValidationState(error: 'Please fill out the required fields');
        }
      }
      if (rule == 'gst_number') {
        final RegExp regex = RegExp(r"^[0-9]{2}[A-Z]{5}[0-9]{4}"+"[A-Z]{1}[1-9A-Z]{1}"+"Z[0-9A-Z]{1}");
        if (input.isEmpty) {

        } else if (!regex.hasMatch(input)) {
          return ValidationState(error: 'not allowed');
        }
      }

      if (rule == 'web_url') {
        final RegExp regex = RegExp(r"^(http:\/\/|https:\/\/)?(www.)?([a-zA-Z0-9]+).[a-zA-Z0-9]*.[a-z]{3}\.([a-z]+)?");
        if (input.isEmpty) {
        } else if (!regex.hasMatch(input)) {
          return ValidationState(error: 'Special character not allowed');
        }
      }
      if (rule == 'date') {
        final RegExp regex = RegExp(r"^([0-9]{2}-[0-9]{2}-[0-9]{4})");
        if (input.isEmpty) {
          return ValidationState(error: 'Please Enter date of birth');
        } else if (!regex.hasMatch(input)) {
          return ValidationState(error: 'please Enter DD-MM-YYYY');
        }
      }
      if (rule == 'datetime') {
        final RegExp regex = RegExp(r"^([0-9]{2}/[0-9]{2}/[0-9]{4})");
        if (input.isEmpty) {
          return ValidationState(error: 'Please Enter Date');
        } else if (!regex.hasMatch(input)) {
          return ValidationState(error: 'please enter DD/MM/YYYY');
        }
      }
    }


    return ValidationState(status: true);
  }

  static ValidationState confirmPassword(
      String password, String confirmPassword) {
    if (confirmPassword.isEmpty) {
      return ValidationState(error: 'Please enter your confirm password');
    }
    if (confirmPassword != password) {
      return ValidationState(error: 'Password not matched');
    }

    return ValidationState(status: true);
  }

  static ValidationState confirmMobile(
      String phone, String confirmMobiles) {
    if (confirmMobiles.isEmpty) {
      return ValidationState(error: 'Please enter your confirm phone number');
    }
    if (confirmMobiles != phone) {
      return ValidationState(error: 'Phone number not matched');
    }

    return ValidationState(status: true);
  }
  static ValidationState newPassword(
      String currentPassword, String newPassword) {
    const String pattern =
        '[a-zA-Z]';
    final RegExp regExp = RegExp(pattern);
    if (newPassword == '') {
      return ValidationState(error: 'Please enter new password');
    }
    // if (!regExp.hasMatch(newPassword)) {
    //   return ValidationState(
    //       error:
    //       'Password should contain alpha numeric, capital letter and special char');
    // }
    if (newPassword == currentPassword) {
      //   return ValidationState(error: 'You have entered your old password');
      return ValidationState(error: 'You have entered your old password');
    }

    return ValidationState(status: true);
  }

  static ValidationState newPhone(
      String currentPhone, String newPhone) {
    const String pattern = r'^([1-9][0-9]*)?$';
    final RegExp regExp = RegExp(pattern);
    if (newPhone == '') {
      return ValidationState(error: 'Please enter new phone number');
    }
    if (newPhone == currentPhone) {
      return ValidationState(error: 'You have entered your old phone number, Please change new phone number');
    }

    return ValidationState(status: true);
  }


  static ValidationState loginCheckPassword(
      String password, String confirmPassword, bool isOtp) {
    if (isOtp) {
      return ValidationState(status: true);
    } else {
      if (confirmPassword.isEmpty) {
        return ValidationState(error: 'This field is required');
      }
      if (confirmPassword != password) {
        return ValidationState(error: 'Password not matched');
      }

      return ValidationState(status: true);
    }
  }


  static ValidationState emailOrPhone(bool isOtp, String input) {
    final ValidationState isEmail = validate(input, rules: ['email']);
    final ValidationState isPhone = validate(input, rules: ['mobile_number']);

    if (isOtp) {
      if(input.length>=15){
        return ValidationState(
            error: 'Please enter a valid mobile number 7 to 15.');
      }
      if(input.length<=7){
        return ValidationState(
            error: 'Please enter a valid mobile number 7 to 15.');
      }
      if (!isPhone.status) {
        return ValidationState(
            error: 'Please enter a valid mobile number to get OTP.');
      }
    }
    if (!isEmail.status && !isPhone.status) {
      return ValidationState(
          error: 'Please enter a valid email or mobile number.');
    }

    return ValidationState(status: true);
  }
}

class ValidationState {
  bool status;
  String? error;

  ValidationState({this.status = false, this.error});
}
