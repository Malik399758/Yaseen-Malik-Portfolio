
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
    period: "2023 - Present",
    title: "Bachelor of Science in Mechanical Engineering",
    institution: "CECOS University of Information Technology and Emerging Sciences",
    description: "Applying critical core engineering logic, advanced mathematics, and systematic problem-solving vectors while translating analytical design approaches directly to high-scale software architectures.",
  ),
  const TimelineModel(
    period: "2024",
    title: "Advanced Flutter & State Management Certification",
    institution: "Self-Driven Specialized Track",
    description: "Deep-dived into building modular patterns, declarative architectures, lifecycle management optimizations, and secure reactive data binding mechanics across platforms.",
  ),
  const TimelineModel(
    period: "2023",
    title: "Foundations of Software Systems & OOP",
    institution: "Self-Learning Journey",
    description: "Mastered algorithmic processes, Object-Oriented design matrices, code structural modularity metrics, and robust local/remote database synchronization paradigms.",
  ),
];