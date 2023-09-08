import 'dart:io';

void main() {
  print("Welcome to the Unit Converter!");
  while (true) {
    print("\nSelect an option:");
    print("1. Length");
    print("2. Temperature");
    print("3. Weight");
    print("4. Exit");

    String choice = stdin.readLineSync() ?? '';
    switch (choice) {
      case '1':
        convertLength();
        break;
      case '2':
        convertTemperature();
        break;
      case '3':
        convertWeight();
        break;
      case '4':
        exit(0);
        break;
      default:
        print("Invalid option. Please choose a valid option.");
    }
  }
}

void convertLength() {
  print("\nLength Converter");
  print("Select an option:");
  print("1. Meters to Feet");
  print("2. Feet to Meters");

  String choice = stdin.readLineSync() ?? '';
  double result;
  switch (choice) {
    case '1':
      print("Enter length in meters:");
      double meters = double.parse(stdin.readLineSync() ?? '0');
      result = meters * 3.28084;
      print("Result: $meters meters = $result feet");
      break;
    case '2':
      print("Enter length in feet:");
      double feet = double.parse(stdin.readLineSync() ?? '0');
      result = feet / 3.28084;
      print("Result: $feet feet = $result meters");
      break;
    default:
      print("Invalid option. Please choose a valid option.");
  }
}

void convertTemperature() {
  print("\nTemperature Converter");
  print("Select an option:");
  print("1. Celsius to Fahrenheit");
  print("2. Fahrenheit to Celsius");

  String choice = stdin.readLineSync() ?? '';
  double result;
  switch (choice) {
    case '1':
      print("Enter temperature in Celsius:");
      double celsius = double.parse(stdin.readLineSync() ?? '0');
      result = (celsius * 9 / 5) + 32;
      print("Result: $celsius°C = $result°F");
      break;
    case '2':
      print("Enter temperature in Fahrenheit:");
      double fahrenheit = double.parse(stdin.readLineSync() ?? '0');
      result = (fahrenheit - 32) * 5 / 9;
      print("Result: $fahrenheit°F = $result°C");
      break;
    default:
      print("Invalid option. Please choose a valid option.");
  }
}

void convertWeight() {
  print("\nWeight Converter");
  print("Select an option:");
  print("1. Kilograms to Pounds");
  print("2. Pounds to Kilograms");

  String choice = stdin.readLineSync() ?? '';
  double result;
  switch (choice) {
    case '1':
      print("Enter weight in kilograms:");
      double kilograms = double.parse(stdin.readLineSync() ?? '0');
      result = kilograms * 2.20462;
      print("Result: $kilograms kg = $result lbs");
      break;
    case '2':
      print("Enter weight in pounds:");
      double pounds = double.parse(stdin.readLineSync() ?? '0');
      result = pounds / 2.20462;
      print("Result: $pounds lbs = $result kg");
      break;
    default:
      print("Invalid option. Please choose a valid option.");
  }
}
