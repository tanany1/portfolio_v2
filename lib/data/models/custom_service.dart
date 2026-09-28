import 'package:flutter/material.dart';

class CustomService {
  final String service;
  final String logo;
  final String description;
  final IconData? icon;
  final List<String> skills;

  const CustomService({
    required this.service,
    required this.logo,
    required this.description,
    this.icon,
    this.skills = const [],
  });
}
