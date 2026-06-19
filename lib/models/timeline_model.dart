
class TimelineModel {
  final String period;
  final String title;
  final String institution;
  final String description;

  const TimelineModel({
    required this.period,
    required this.title,
    required this.institution,
    required this.description,
  });
}

final List<TimelineModel> academicTimeline = [

  const TimelineModel(
    period: "2022 - 2026",
    title: "Bachelor of Science in Software Engineering",
    institution: "CECOS University of IT & Emerging Sciences",
    description:
    "Currently pursuing a comprehensive degree focused on software development, data structures, algorithms, database systems, and modern application engineering practices.",
  ),

  const TimelineModel(
    period: "2024",
    title: "Flutter Development & State Management Focus",
    institution: "Self-Learning & Project-Based Growth",
    description:
    "Specialized in Flutter development including UI architecture, REST API integration, Firebase services, and state management techniques for scalable mobile applications.",
  ),

  const TimelineModel(
    period: "2023",
    title: "Programming Fundamentals & OOP Mastery",
    institution: "Self-Learning Journey",
    description:
    "Built strong foundation in programming logic, Object-Oriented Programming (OOP), data structures, and software design principles.",
  ),
];