class Lesson {
  String name;
  String type;
  String teacher;
  String audience;

  bool get isEmpty => name == "";

  Lesson(this.name, this.type, this.teacher, this.audience);

  factory Lesson.empty() => Lesson("", "", "", "");
}
