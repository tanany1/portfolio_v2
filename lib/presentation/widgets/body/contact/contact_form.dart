import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

import '../../../../core/utils/app_colors.dart';
import '../../../../core/utils/app_styles.dart';
import '../../../../core/widgets/custom_button.dart';

class ContactForm extends StatefulWidget {
  const ContactForm({super.key});

  @override
  State<ContactForm> createState() => _ContactFormState();
}

class _ContactFormState extends State<ContactForm> {
  late final GlobalKey<FormState> _formKey;
  late final TextEditingController _emailController;
  late final TextEditingController _messageController;
  late final TextEditingController _nameController;
  late final TextEditingController _subjectController;
  bool _isSubmitting = false;

  @override
  void initState() {
    super.initState();
    _formKey = GlobalKey<FormState>();
    _emailController = TextEditingController();
    _messageController = TextEditingController();
    _nameController = TextEditingController();
    _subjectController = TextEditingController();
  }

  @override
  void dispose() {
    _emailController.dispose();
    _messageController.dispose();
    _nameController.dispose();
    _subjectController.dispose();
    super.dispose();
  }

  void _handleSubmit() async {
    if (_formKey.currentState!.validate()) {
      setState(() => _isSubmitting = true);

      final String name = _nameController.text.trim();
      final String email = _emailController.text.trim();
      final String subject = _subjectController.text.trim();
      final String message = _messageController.text.trim();

      final Uri emailUri = Uri(
        scheme: 'mailto',
        path: 'ahmedtanany25@gmail.com',
        queryParameters: {
          'subject': subject.isNotEmpty ? subject : 'Portfolio Inquiry from $name',
          'body': 'Name: $name\nEmail: $email\n\nMessage:\n$message',
        },
      );

      try {
        if (await canLaunchUrl(emailUri)) {
          await launchUrl(emailUri);
        }
      } catch (e) {
        debugPrint('Error launching email: $e');
      }

      if (mounted) {
        setState(() => _isSubmitting = false);
        _nameController.clear();
        _emailController.clear();
        _subjectController.clear();
        _messageController.clear();

        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            backgroundColor: AppColors.cardBgElevated,
            behavior: SnackBarBehavior.floating,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(12),
              side: const BorderSide(color: AppColors.success),
            ),
            content: Row(
              children: [
                const Icon(Icons.check_circle_rounded, color: AppColors.success),
                const SizedBox(width: 12),
                Expanded(
                  child: Text(
                    'Thank you, $name! Your message has been prepared in your email client.',
                    style: AppStyles.s14.copyWith(color: AppColors.white),
                  ),
                ),
              ],
            ),
          ),
        );
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(24),
      decoration: BoxDecoration(
        color: AppColors.cardBg,
        borderRadius: BorderRadius.circular(20),
        border: Border.all(
          color: AppColors.cardBorder,
        ),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.3),
            blurRadius: 20,
            offset: const Offset(0, 8),
          ),
        ],
      ),
      child: Form(
        key: _formKey,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Send a Message',
              style: AppStyles.s20.copyWith(
                color: AppColors.white,
                fontWeight: FontWeight.w700,
              ),
            ),
            const SizedBox(height: 6),
            Text(
              'Fill out the form below and I will get back to you promptly.',
              style: AppStyles.s14.copyWith(color: AppColors.textMuted),
            ),
            const SizedBox(height: 20),
            TextFormField(
              controller: _nameController,
              style: AppStyles.s14.copyWith(color: AppColors.textPrimary),
              decoration: const InputDecoration(
                labelText: 'Your Name',
                prefixIcon: Icon(Icons.person_outline_rounded, color: AppColors.primaryColor, size: 20),
              ),
              validator: (val) {
                if (val == null || val.trim().isEmpty) {
                  return 'Please enter your name';
                }
                return null;
              },
            ),
            const SizedBox(height: 16),
            TextFormField(
              controller: _emailController,
              style: AppStyles.s14.copyWith(color: AppColors.textPrimary),
              keyboardType: TextInputType.emailAddress,
              decoration: const InputDecoration(
                labelText: 'Email Address',
                prefixIcon: Icon(Icons.email_outlined, color: AppColors.primaryColor, size: 20),
              ),
              validator: (val) {
                if (val == null || val.trim().isEmpty) {
                  return 'Please enter your email';
                }
                if (!val.contains('@') || !val.contains('.')) {
                  return 'Please enter a valid email';
                }
                return null;
              },
            ),
            const SizedBox(height: 16),
            TextFormField(
              controller: _subjectController,
              style: AppStyles.s14.copyWith(color: AppColors.textPrimary),
              decoration: const InputDecoration(
                labelText: 'Subject',
                prefixIcon: Icon(Icons.subject_rounded, color: AppColors.primaryColor, size: 20),
              ),
              validator: (val) {
                if (val == null || val.trim().isEmpty) {
                  return 'Please enter a subject';
                }
                return null;
              },
            ),
            const SizedBox(height: 16),
            TextFormField(
              controller: _messageController,
              maxLines: 4,
              style: AppStyles.s14.copyWith(color: AppColors.textPrimary),
              decoration: const InputDecoration(
                labelText: 'Your Message...',
                alignLabelWithHint: true,
                prefixIcon: Padding(
                  padding: EdgeInsets.only(bottom: 50),
                  child: Icon(Icons.chat_bubble_outline_rounded, color: AppColors.primaryColor, size: 20),
                ),
              ),
              validator: (val) {
                if (val == null || val.trim().isEmpty) {
                  return 'Please write your message';
                }
                return null;
              },
            ),
            const SizedBox(height: 24),
            CustomButton(
              label: _isSubmitting ? 'Sending...' : 'Send Message',
              icon: Icons.send_rounded,
              isGradient: true,
              onPressed: _isSubmitting ? null : _handleSubmit,
              width: double.infinity,
            ),
          ],
        ),
      ),
    );
  }
}

