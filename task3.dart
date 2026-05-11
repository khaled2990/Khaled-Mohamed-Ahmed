void main() {
  Set<String> students = {};

  addStudent(students, "Nada");
  addStudent(students, "Ali");
  addStudent(students, "Nada");

  print("Students (Recursive):");
  printStudentsRecursively(students.toList(), 0);

  print("\nUsing forEach (Lambda):");
  students.forEach((s) => print(s));

  Set<String> newStudents = {"Mona", "Sara"};
  Set<String> allStudents = {...students, ...newStudents};

  print("\nAfter merging:");
  allStudents.forEach((s) => print(s));

  Map<String, List<double>> studentCourses = {};

  addCourse(studentCourses, "Nada", "Math", 90);
  addCourse(studentCourses, "Nada", "Science", 80);
  addCourse(studentCourses, "Ali", "Math"); // default grade = 0

  print("\nAverage Grades:");
  print("Nada: ${averageGrade(studentCourses, "Nada")}");
  print("Ali: ${averageGrade(studentCourses, "Ali")}");
}

void addStudent(Set<String> students, String name) {
  students.add(name);
}

void printStudentsRecursively(List<String> list, int index) {
  if (index >= list.length) return;
  print(list[index]);
  printStudentsRecursively(list, index + 1);
}

void addCourse(
  Map<String, List<double>> data,
  String student,
  String course, [
  double grade = 0,
]) {
  if (!data.containsKey(student)) {
    data[student] = [];
  }
  data[student]!.add(grade);
}

double averageGrade(Map<String, List<double>> data, String student) {
  if (!data.containsKey(student) || data[student]!.isEmpty) return 0;

  var grades = data[student]!;

  double sum = grades.reduce((a, b) => a + b); // lambda
  return sum / grades.length;
}
