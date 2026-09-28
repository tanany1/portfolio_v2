import 'package:flutter/material.dart';

class Project {
  final String name;
  final String imageUrl;
  final String description;
  final String? githubRepoLink;
  final String? previewLink;
  final List<String> tags;
  final String category;
  final bool isFeatured;
  final IconData primaryIcon;
  final List<String> features;
  final List<String> screenshots;

  const Project({
    required this.name,
    required this.imageUrl,
    required this.description,
    this.githubRepoLink,
    this.previewLink,
    this.tags = const [],
    this.category = 'Mobile',
    this.isFeatured = false,
    this.primaryIcon = Icons.phone_android_rounded,
    this.features = const [],
    this.screenshots = const [],
  });
}
