import 'package:flutter/material.dart';

import '../../data/models/custom_service.dart';
import '../../data/models/project.dart';
import 'app_assets.dart';

abstract class AppConstants {
  static const double appBarHeight = 80;

  static const List<String> projectCategories = [
    'All',
    'Mobile',
    'IoT & Hardware',
    'Desktop & AI',
    'Healthcare',
  ];

  static const List<CustomService> services = [
    CustomService(
      service: 'Languages & Frameworks',
      logo: AppAssets.flutterLogo,
      icon: Icons.code_rounded,
      description: 'Flutter & Dart cross-platform mobile, desktop, and web applications.',
      skills: ['Flutter', 'Dart', 'OOP', 'Async/Await', 'Platform Channels'],
    ),
    CustomService(
      service: 'Backend & Cloud APIs',
      logo: AppAssets.firebaseLogo,
      icon: Icons.cloud_sync_rounded,
      description: 'Firebase Suite and RESTful APIs integration with Dio & Retrofit.',
      skills: ['Firebase Auth', 'Firestore', 'Realtime DB', 'REST APIs', 'Cloud Storage'],
    ),
    CustomService(
      service: 'State Management',
      logo: AppAssets.stateManagement,
      icon: Icons.layers_rounded,
      description: 'Predictable, reactive, and scalable enterprise-level state management.',
      skills: ['BLoC', 'Cubit', 'Provider', 'Equatable'],
    ),
    CustomService(
      service: 'Tools & DevOps',
      logo: AppAssets.localStorageLogo,
      icon: Icons.build_circle_rounded,
      description: 'Industry-standard developer workflows, version control, and design handoff.',
      skills: ['Git & GitHub', 'Android Studio', 'VS Code', 'Postman', 'Figma'],
    ),
    CustomService(
      service: 'Local Storage & Offline',
      logo: AppAssets.localStorageLogo,
      icon: Icons.storage_rounded,
      description: 'High-speed offline-first local databases and preference caching.',
      skills: ['Hive DB', 'SharedPreferences', 'SQLite / Sqflite', 'Caching'],
    ),
    CustomService(
      service: 'Architecture & Patterns',
      logo: AppAssets.firebaseLogo,
      icon: Icons.account_tree_rounded,
      description: 'Robust software engineering architectures ensuring modularity and testability.',
      skills: ['Clean Architecture', 'MVVM', 'SOLID Principles', 'Repository Pattern'],
    ),
  ];

  static const List<Project> projects = [
    Project(
      name: 'AgriHope',
      imageUrl: '',
      category: 'Desktop & AI',
      isFeatured: true,
      primaryIcon: Icons.eco_rounded,
      tags: ['Flutter Desktop', 'AI Models', 'IoT Hardware', 'Chatbot', 'Weather API'],
      description:
          'Smart precision farming desktop app integrating AI models (crop recommendation, soil prediction, disease detection), conversational chatbot, and hardware telemetry.',
      githubRepoLink: 'https://github.com/tanany1/agri_hope.git',
      previewLink: 'https://github.com/tanany1/agri_hope',
      features: [
        'AI Crop & Soil health diagnosis',
        'Real-time IoT sensors telemetry',
        'Interactive AI farming assistant chatbot',
        'Live weather forecasts & irrigation alerts',
      ],
    ),
    Project(
      name: 'Talabat Tap & Match',
      imageUrl: '',
      category: 'Desktop & AI',
      isFeatured: true,
      primaryIcon: Icons.sports_esports_rounded,
      tags: ['Flutter Desktop', 'Interactive Game', 'Talabat Campaign', 'Animations'],
      description:
          'High-engagement desktop game built for Talabat Egypt’s nationwide marketing campaign featuring smooth emoji-matching mechanics and instant reward tracking.',
      githubRepoLink: 'https://github.com/tanany1/talabat_tab_match.git',
      features: [
        'Real-time timer and scoring engine',
        'Custom 60fps card flip animations',
        'Interactive brand marketing touchpoint',
        'High-score leaderboard integration',
      ],
    ),
    Project(
      name: 'Booth Usher App',
      imageUrl: '',
      category: 'IoT & Hardware',
      isFeatured: true,
      primaryIcon: Icons.nfc_rounded,
      tags: ['Flutter Mobile', 'NFC Tech', 'Event Operations', 'Real-time Points'],
      description:
          'NFC-driven mobile application used in large advertising activations and exhibitions to scan attendee cards, manage game points, and redeem prizes in real time.',
      githubRepoLink: 'https://github.com/tanany1/booth_usher.git',
      features: [
        'Instant NFC tag read/write protocol',
        'Fast attendee balance management',
        'Offline fallback caching',
        'Cloud synchronization dashboard',
      ],
    ),
    Project(
      name: 'Neuro Balance',
      imageUrl: '',
      category: 'Healthcare',
      isFeatured: true,
      primaryIcon: Icons.medical_services_rounded,
      tags: ['Flutter Mobile', 'Healthcare', 'Doctor Chat', 'Firebase', 'Clean Arch'],
      description:
          'Comprehensive health companion for Multiple Sclerosis (MS) patients to record daily symptoms, track medication schedules, consult doctors, and view physical therapy videos.',
      githubRepoLink: 'https://github.com/tanany1/neuro_balance.git',
      features: [
        'Symptom log & health trend visualization',
        'Medication reminder push notifications',
        'Direct doctor consultation chat',
        'Curated physical therapy video library',
      ],
    ),
    Project(
      name: 'Dr. Buzzy',
      imageUrl: '',
      category: 'Healthcare',
      isFeatured: true,
      primaryIcon: Icons.child_care_rounded,
      tags: ['Flutter Mobile', 'Pediatric Health', 'Gamification', 'Interactive UI'],
      description:
          'Gamified educational health application for children (ages 5–10) simplifying chronic conditions like diabetes and childhood obesity through fun storytelling and mini-games.',
      githubRepoLink: 'https://github.com/tanany1/dr_buzzy.git',
      features: [
        'Kid-friendly animated character illustrations',
        'Educational interactive story modules',
        'Healthy nutrition mini-games',
        'Parental progress dashboard',
      ],
    ),
    Project(
      name: 'Smart Farming IoT',
      imageUrl: '',
      category: 'IoT & Hardware',
      isFeatured: true,
      primaryIcon: Icons.sensors_rounded,
      tags: ['Flutter Mobile', 'IoT Sensors', 'Firebase Realtime', 'Hardware Control'],
      description:
          'IoT-connected mobile application communicating with ESP32 microcontrollers to remotely monitor moisture/temperature sensors and toggle irrigation pumps.',
      githubRepoLink: 'https://github.com/tanany1/smart_farming.git',
      features: [
        'Realtime Firebase DB sensor streaming',
        'Automated & manual pump relay triggers',
        'Soil moisture threshold alerts',
        'Historical environmental graph charts',
      ],
    ),
    Project(
      name: 'Smart Garden',
      imageUrl: '',
      category: 'IoT & Hardware',
      isFeatured: false,
      primaryIcon: Icons.yard_rounded,
      tags: ['Flutter Mobile', 'Hardware Integration', 'Firebase Console', 'Automation'],
      description:
          'Hardware-software hybrid system for smart garden automation using Firebase Realtime Database to send live control signals to solenoids and water valves.',
      githubRepoLink: 'https://github.com/tanany1/smart_farming.git',
      features: [
        'One-touch valve control',
        'Scheduled watering automation',
        'Live system status heartbeat',
      ],
    ),
    Project(
      name: 'NFC Manager Pro',
      imageUrl: '',
      category: 'IoT & Hardware',
      isFeatured: false,
      primaryIcon: Icons.contactless_rounded,
      tags: ['Flutter Mobile', 'NFC Protocols', 'NDEF Records', 'Hardware'],
      description:
          'Utility mobile app to read, format, write, and duplicate standard NFC cards (NTAG, Mifare) with custom payload encryption.',
      githubRepoLink: 'https://github.com/tanany1/nfc.git',
      features: [
        'NDEF text, URL, and raw payload writing',
        'Tag lock and memory inspection',
        'Saved tag history repository',
      ],
    ),
    Project(
      name: 'Pregnancy Companion',
      imageUrl: '',
      category: 'Healthcare',
      isFeatured: false,
      primaryIcon: Icons.pregnant_woman_rounded,
      tags: ['Flutter Mobile', 'Maternal Health', 'Trimester Guide', 'Medication Safety'],
      description:
          'Empowering expecting mothers with week-by-week fetal development milestones, approved medication directory, and trimester-specific nutrition advice.',
      githubRepoLink: 'https://github.com/tanany1/pregnancy.git',
      features: [
        'Week-by-week baby growth graphics',
        'Safety medication search engine',
        'Kick counter and contraction timer',
      ],
    ),
    Project(
      name: 'Vitalogy Supplement Guide',
      imageUrl: '',
      category: 'Healthcare',
      isFeatured: false,
      primaryIcon: Icons.healing_rounded,
      tags: ['Flutter Mobile', 'Vitamins & Minerals', 'Health Advice', 'REST API'],
      description:
          'Vitamin and dietary supplement analyzer providing symptom-based deficiency detection, dosage guidelines, and food source recommendations.',
      githubRepoLink: 'https://github.com/tanany1/vitamin.git',
      features: [
        'Interactive vitamin deficiency quiz',
        'Comprehensive supplement encyclopedia',
        'Personalized daily vitamin plan',
      ],
    ),
    Project(
      name: 'Sugar Pop Diabetes Log',
      imageUrl: '',
      category: 'Healthcare',
      isFeatured: false,
      primaryIcon: Icons.monitor_heart_rounded,
      tags: ['Flutter Mobile', 'Glucose Tracking', 'Health Analytics', 'Local DB'],
      description:
          'Daily diabetes management application enabling rapid blood glucose logging, insulin unit tracking, and automated weekly HbA1c approximations.',
      githubRepoLink: 'https://github.com/tanany1/Sugar_pop.git',
      features: [
        'Meal-tagged glucose logging (pre/post)',
        'Visual blood sugar trend graphs',
        'PDF report export for doctors',
      ],
    ),
    Project(
      name: 'Talabat Vending Machine',
      imageUrl: '',
      category: 'Desktop & AI',
      isFeatured: false,
      primaryIcon: Icons.local_convenience_store_rounded,
      tags: ['Flutter Desktop', 'Vending Hardware', 'Interactive Quiz', 'Custom UI'],
      description:
          'Custom desktop kiosk application built for interactive physical vending machines with timed promotional trivia questions that unlock prizes upon winning.',
      githubRepoLink: 'https://github.com/tanany1/talabat.git',
      features: [
        'Touchscreen kiosk interface design',
        'Hardware serial port dispenser trigger',
        'Dynamic quiz randomized pool',
      ],
    ),
    Project(
      name: 'Feastly App',
      imageUrl: '',
      category: 'Mobile',
      isFeatured: false,
      primaryIcon: Icons.restaurant_menu_rounded,
      tags: ['Flutter Mobile', 'TheMealDB API', 'BLoC State', 'Recipe Explorer'],
      description:
          'Delightful recipe and culinary guide consuming public meal APIs to discover recipes, dietary categories, cooking video steps, and ingredients.',
      githubRepoLink: 'https://github.com/Galal-20/feastly.git',
      previewLink: 'https://github.com/Galal-20/feastly',
      features: [
        'Ingredient and category search filters',
        'Step-by-step cooking guide with YouTube embeds',
        'Bookmark favorite recipes locally',
      ],
    ),
    Project(
      name: 'Islami App',
      imageUrl: '',
      category: 'Mobile',
      isFeatured: false,
      primaryIcon: Icons.mosque_rounded,
      tags: ['Flutter Mobile', 'Quran Audio', 'Prayer Times', 'Tasbeeh Counter'],
      description:
          'Complete Islamic companion app featuring full Quran recitation with audio players, accurate geolocation prayer times, and digital electronic tasbeeh.',
      githubRepoLink: 'https://github.com/tanany1/Islami-app.git',
      features: [
        'Surah audio streaming and local playback',
        'Interactive electronic tasbeeh counter',
        'Daily morning and evening Azkar',
      ],
    ),
    Project(
      name: 'Todo',
      imageUrl: '',
      category: 'Mobile',
      isFeatured: false,
      primaryIcon: Icons.task_alt_rounded,
      tags: ['Flutter Mobile', 'Hive DB', 'CRUD Operations', 'Dark Theme'],
      description:
          'High-performance task and goal management app with priority color-coding, calendar views, and persistent offline storage using Hive database.',
      githubRepoLink: 'https://github.com/tanany1/ToDo-App.git',
      features: [
        'Fast persistent Hive storage',
        'Priority tagging and category grouping',
        'Due-date reminder alarms',
      ],
    ),
    Project(
      name: 'News Pulse World',
      imageUrl: '',
      category: 'Mobile',
      isFeatured: false,
      primaryIcon: Icons.newspaper_rounded,
      tags: ['Flutter Mobile', 'News API', 'Dio / Retrofit', 'Category Filter'],
      description:
          'Modern live news aggregator presenting headlines across politics, tech, science, and sports with clean reader view and bookmarking.',
      githubRepoLink: 'https://github.com/tanany1/news_app.git',
      features: [
        'Real-time news feeds with pagination',
        'In-app webview article browser',
        'Cached news for offline reading',
      ],
    ),
    Project(
      name: 'Movie Hub',
      imageUrl: '',
      category: 'Mobile',
      isFeatured: false,
      primaryIcon: Icons.movie_filter_rounded,
      tags: ['Flutter Mobile', 'TMDB API', 'Video Trailers', 'Shimmer Loading'],
      description:
          'Feature-packed movie and TV series explorer backed by TMDB REST API, showcasing top-rated titles, cast details, trailers, and user reviews.',
      githubRepoLink: 'https://github.com/tanany1/movie_task.git',
      features: [
        'Dynamic movie search with debounce',
        'Cast & crew biographies',
        'Shimmer skeleton loading states',
      ],
    ),
  ];
}
