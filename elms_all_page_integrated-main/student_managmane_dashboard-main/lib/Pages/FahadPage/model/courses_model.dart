class CoursesModel {
  final String courseImageUrl;
  final String courseName;

  CoursesModel({required this.courseImageUrl, required this.courseName});

  static List<CoursesModel> cousesDataList = [
    CoursesModel(
        courseImageUrl: 'assets/images/App development.png',
        courseName: 'Android Development'),
    CoursesModel(
        courseImageUrl: 'assets/images/flutter_development.png',
        courseName: 'Flutter App Development'),
    CoursesModel(
        courseImageUrl: 'assets/images/Web Frontend.png',
        courseName: 'Front-End Web Develpers'),
    CoursesModel(
        courseImageUrl: 'assets/images/Backend.png',
        courseName: 'Backend Development'),
  ];
}
