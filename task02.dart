import 'dart:io';
import 'dart:math';

void main() {
  List<String> studentNames = [];
  List<List<double>> studentGrades = [];

  int numStudents = 0;
  while (true) {
    stdout.write("Enter number of students: ");
    String? input = stdin.readLineSync();
    if (input != null && int.tryParse(input) != null) {
      numStudents = int.parse(input);
      if (numStudents > 0) break;
    }
    print("Invalid input! Please enter a positive integer.");
  }

  for (int i = 0; i < numStudents; i++) {
    stdout.write("Enter name of student ${i + 1}: ");
    String? name = stdin.readLineSync();
    if (name == null || name.trim().isEmpty) {
      print("Invalid name! Using 'Student${i + 1}'");
      name = "Student${i + 1}";
    }
    studentNames.add(name.trim());

    int numSubjects = 0;
    while (true) {
      stdout.write("Enter number of subjects for $name: ");
      String? subjInput = stdin.readLineSync();
      if (subjInput != null && int.tryParse(subjInput) != null) {
        numSubjects = int.parse(subjInput);
        if (numSubjects > 0) break;
      }
      print("Invalid input! Please enter a positive integer.");
    }

    List<double> grades = [];
    for (int j = 0; j < numSubjects; j++) {
      while (true) {
        stdout.write("Enter grade for subject ${j + 1}: ");
        String? gradeInput = stdin.readLineSync();
        if (gradeInput != null && double.tryParse(gradeInput) != null) {
          double grade = double.parse(gradeInput);
          if (grade >= 0 && grade <= 100) {
            grades.add(grade);
            break;
          }
        }
        print("Invalid input! Enter a grade between 0 and 100.");
      }
    }
    studentGrades.add(grades);
  }

  while (true) {
    print("\n--- MENU ---");
    print("1. Show All Results");
    print("2. Search Student");
    print("3. Exit");

    stdout.write("Choose an option: ");
    String? choice = stdin.readLineSync();

    if (choice == "1") {
      for (int i = 0; i < studentNames.length; i++) {
        String name = studentNames[i].toUpperCase();
        List<double> grades = studentGrades[i];
        double avg = grades.reduce((a, b) => a + b) / grades.length;
        double roundedAvg = double.parse(avg.toStringAsFixed(2));
        String letter = getLetterGrade(avg);
        print("$name - Average: $roundedAvg - Grade: $letter");
      }
    } else if (choice == "2") {
      stdout.write("Enter student name to search: ");
      String? searchName = stdin.readLineSync();
      if (searchName != null) {
        int index = studentNames.indexWhere(
          (name) => name.toLowerCase() == searchName.toLowerCase(),
        );
        if (index != -1) {
          List<double> grades = studentGrades[index];
          double avg = grades.reduce((a, b) => a + b) / grades.length;
          int roundedAvg = avg.round();
          print("${studentNames[index]} - Average grade: $roundedAvg");
        } else {
          print("Student not found!");
        }
      }
    } else if (choice == "3") {
      print("Exiting program...");
      break;
    } else {
      print("Invalid option! Choose 1, 2, or 3.");
    }
  }
}

String getLetterGrade(double avg) {
  if (avg >= 90) return "A";
  if (avg >= 80) return "B";
  if (avg >= 70) return "C";
  return "F";
}
