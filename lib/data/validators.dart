final class Validators {
  final bool debug = false;

  /// Validator for the first name and last name form fields
  static String? validateName(String? value, int pos) {
    if (value == null || value.isEmpty) {
      return 'Please enter a valid ${pos == 1 ? 'first' : 'last'} name';
    }

    return null;
  }

  /// Ensures that the user has input at least something into the field
  static String? validateFullname(String? value) {
    if (value == null || value.isEmpty) {
      return 'Please enter a valid name full name';
    }

    return null;
  }

  /// Validator for the form fields which ask about business name
  static String? validateBizName(String? value) {
    if (value == null) {
      return 'Value cannot be empty';
    }

    if (value.length < 5) {
      return 'Value must be at least 5 characters';
    }

    return null;
  }

  /// Ensures that the input year is valid and not > the current year
  static String? validateYear(String? value) {
    if (value == null) {
      return 'Value cannot be empty';
    }

    int? parsedYear = int.tryParse(value);
    if (parsedYear == null) {
      return 'Unable to parse year from value, make sure value is an integer';
    }

    if (parsedYear > DateTime.now().year) {
      return 'Invalid year. Year must be <= the current year.';
    }

    return null;
  }

  /// Ensures that FEIN will be of form 9xx-xxx-xxxx (stripping out the "-")
  static String? validateFEIN(String? value) {
    if (value == null) {
      return 'Value cannot be empty';
    }

    // Ensure it starts with 9
    if (!value.startsWith("9")) {
      return 'Value must begin with a 9 to be considered a valid FEIN';
    }

    // Make sure its correct length (strip out unnecessary chars)
    var stripped = value.replaceAll("-", "");
    if (stripped.length != 10) {
      return 'FEIN should be 10 integers long';
    }

    return null;
  }

  /// Ensures that FRN will be a 10 digit unique identifier
  static String? validateFRN(String? value) {
    if (value == null) {
      return 'Value cannot be empty';
    }

    final regex = RegExp(
      r'^[0-9]{10}$',
      caseSensitive: false,
      multiLine: false,
    );
    if (!regex.hasMatch(value)) {
      return 'Value must be a 10 digit unique identifier';
    }

    return null;
  }

  /// Ensures that a provided string is the same form as a valid URL
  static String? validateWebsite(String? value) {
    if (value == null) {
      return 'Value cannot be empty';
    }
    final regex = RegExp(
      r'^(https?|ftp)://[^\s/$.?#].\S*$',
      caseSensitive: false,
      multiLine: false,
    );

    if (!regex.hasMatch(value)) {
      return 'Value must be a valid website URL';
    }

    return null;
  }

  /// Version of validateWebsite that does not care if the value is null, useful for social links.
  static String? validateWebsiteNullable(String? value) {
    if (value == null || value == '') {
      return null;
    }

    final regex = RegExp(
      r'^(https?|ftp)://[^\s/$.?#].\S*$',
      caseSensitive: false,
      multiLine: false,
    );

    if (!regex.hasMatch(value)) {
      return 'Value must be a valid website URL';
    }

    return null;
  }

  /// Ensures that a user provided an address, not much beyond that because we rely on google maps autocomplete api
  /// This should ensure reasonable input, but this may be subject to change depending on how silly our users get...
  static String? validateAddress(String? value) {
    if (value == null || value == '') {
      return 'Value cannot be empty';
    }

    return null;
  }

  static String? validatePhone(String? value) {
    if (value == null || value.isEmpty) {
      return 'Please enter a valid phone number. Ex. (573) 434-1234';
    }

    var phoneRegex = RegExp(r'\(\d{3}\)\s\d{3}-\d{4}');
    if (!phoneRegex.hasMatch(value)) {
      return 'Please enter phone number in the form "(573) 434-1234"';
    }

    return null;
  }

  /// Does minimal validation of input. Only checks that input is more than 2 chars really.
  /// Maybe add in google autocomplete if necessary, but don't want to drive api cost if not required
  static String? validateStateCountry(String? value) {
    if (value == null) {
      return 'Value cannot be empty';
    }

    if (value.length <= 2) {
      return 'Value should be extended form. Eg. Missouri or Cuba';
    }

    return null;
  }

  /// Ensures that a user provides an ID that is 6 digits.
  /// TODO: Could query apps.fcc.gov for validation of this field??
  static String? validate499FilerId(String? value) {
    if (value == null || value.isEmpty) {
      return 'Value can not be empty';
    }

    final regex = RegExp(r'^\d{6}$', caseSensitive: false, multiLine: false);

    if (!regex.hasMatch(value)) {
      return 'Value should be a 6 digit ID';
    }

    return null;
  }

  /// Ensures that a user provides an OCN that is 4 characters
  static String? validateOCN(String? value) {
    if (value == null || value.isEmpty) {
      return 'Value can not be empty';
    }

    final regex = RegExp(r'^[:alnum]{4}$', caseSensitive: false, multiLine: false);
    if (!regex.hasMatch(value)) {
      return 'Value should be a 4 character ID';
    }

    return null;
  }

  /// Ensures that a user provides
  static String? validateFCC214(String? value) {
    if (value == null || value.isEmpty) {
      return 'Value cannot be empty';
    }

    // TODO: what are the requirements of an FCC219 number???

    return null;
  }

  // TODO: Need to see what more validation we need
  static String? validateBusinessType(String? value) {
    if (value == null || value.isEmpty) {
      return 'Value cannot be empty';
    }

    return null;
  }

  // TODO: Need to see what more validation we need
  static String? validateServices(String? value) {
    if (value == null || value.isEmpty) {
      return 'Value cannot be empty';
    }

    return null;
  }

  // TODO: Need to see what more validation we need
  static String? validateVoiceServices(String? value) {
    if (value == null || value.isEmpty) {
      return 'Value cannot be empty';
    }

    return null;
  }

  // TODO: Need to see what more validation we need
  static String? validateCustomerType(String? value) {
    if (value == null || value.isEmpty) {
      return 'Value cannot be empty';
    }

    return null;
  }

  static String? validateDNCId(String? value) {
    if (value == null || value.isEmpty) return 'Value cannot be empty';

    return null;
  }

  static String? validateAutodialPurpose(String? value) {
    if (value == null || value.isEmpty) return 'Value cannot be empty';

    return null;
  }

  static String? validateTracebacks(String? value) {
    if (value == null || value.isEmpty) {
      return 'Value cannot be empty';
    }

    var valueInt = int.tryParse(value);
    if (valueInt == null) {
      return 'Value must be an integer';
    }

    if (valueInt < 0) {
      return 'Value must be a non-negative integer';
    }

    return null;
  }

  // TODO: Ensure RMD number exists and FCC has not delisted company
  static String? validateRMDNum(String? value) {
    if (value == null || value.isEmpty) return 'Value cannot be empty';

    return null;
  }

  // TODO: What are the requirements of this num and its typical format?
  static String? validateRuralCallRegistryNum(String? value) {
    if (value == null || value.isEmpty) return 'Value cannot be empty';

    return null;
  }
}
