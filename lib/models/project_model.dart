
class ProjectModel {
  final String title;
  final String description;
  final List<String> techStack;
  final String? githubLink;
  final String? liveDemoLink;

  const ProjectModel({
    required this.title,
    required this.description,
    required this.techStack,
    this.githubLink,
    this.liveDemoLink,
  });
}

final List<ProjectModel> sampleProjects = [

  const ProjectModel(
    title: "AI Chatbot App",
    description:
    "Conversational AI chatbot built with Flutter and Google Gemini API, enabling real-time intelligent responses with a modern chat UI and smooth streaming interactions.",
    techStack: ["Flutter", "Dart", "Gemini API", "REST API"],
    githubLink: "https://github.com",
  ),

  const ProjectModel(
    title: "Real-Time Chat App",
    description:
    "Full-featured chat application using Firebase Firestore with real-time messaging, authentication, and optimized data sync architecture.",
    techStack: ["Flutter", "Firebase", "Firestore", "Auth"],
    githubLink: "https://github.com",
  ),

  const ProjectModel(
    title: "Bakery E-Commerce App",
    description:
    "Complete shopping application with product catalog, cart system, and REST API integration combined with Hive offline caching support.",
    techStack: ["Flutter", "REST API", "Hive", "UI/UX"],
    githubLink: "https://github.com",
  ),

  const ProjectModel(
    title: "Diabetes Management App",
    description:
    "Health tracking system for glucose monitoring with Firebase sync and offline-first architecture using Hive database for persistent storage.",
    techStack: ["Flutter", "Firebase", "Hive"],
    githubLink: "https://github.com",
  ),

  const ProjectModel(
    title: "Skin Cancer Detection System (Final Year Project)",
    description:
    "Machine learning based diagnostic system for early skin cancer detection with Flutter UI for image upload and prediction results visualization.",
    techStack: ["Flutter", "Machine Learning", "Python API"],
    githubLink: "https://github.com",
  ),

  const ProjectModel(
    title: "GPA Manager App",
    description:
    "Academic performance tracker for managing semester GPA, grades, and performance analytics with clean UI and local storage support.",
    techStack: ["Flutter", "SQLite", "State Management"],
    githubLink: "https://github.com",
  ),

  const ProjectModel(
    title: "Quick Language Translator App",
    description:
    "Real-time language translation app supporting multiple languages with fast API integration and lightweight responsive UI.",
    techStack: ["Flutter", "Translation API", "REST API"],
    githubLink: "https://github.com",
  ),
];