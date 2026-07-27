import 'package:bookly/features/profile/presentation/views/widgets/profile_image.dart';
import 'package:bookly/features/profile/presentation/views/widgets/profile_text_field.dart';
import 'package:flutter/material.dart';
import 'package:bookly/constants.dart';

class EditProfileViewBody extends StatefulWidget {
  const EditProfileViewBody({super.key});

  @override
  State<EditProfileViewBody> createState() => _EditProfileViewBodyState();
}

class _EditProfileViewBodyState extends State<EditProfileViewBody> {
  final formKey = GlobalKey<FormState>();

  final TextEditingController _firstNameController = TextEditingController(
    text: 'Hamza',
  );
  final TextEditingController _lastNameController = TextEditingController(
    text: 'Kherazi',
  );
  final TextEditingController _emailController = TextEditingController(
    text: 'hamza.kherazi@email.com',
  );
  final TextEditingController _phoneController = TextEditingController(
    text: '0773435565',
  );
  final TextEditingController _bioController = TextEditingController(
    text: 'Book lover',
  );

  @override
  void dispose() {
    _firstNameController.dispose();
    _lastNameController.dispose();
    _emailController.dispose();
    _phoneController.dispose();
    _bioController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      padding: const EdgeInsets.symmetric(horizontal: 24.0, vertical: 16.0),
      child: Form(
        key: formKey,
        child: Column(
          children: [
            const SizedBox(height: 16),
            const ProfileImage(),
            const SizedBox(height: 32),

            // First Name & Last Name - Row Layout
            Row(
              children: [
                Expanded(
                  child: ProfileTextField(
                    controller: _firstNameController,
                    label: 'First Name',
                    hintText: 'first name',
                    icon: Icons.person_outline,
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'First name required';
                      }
                      return null;
                    },
                  ),
                ),
                const SizedBox(width: 16),
                Expanded(
                  child: ProfileTextField(
                    controller: _lastNameController,
                    label: 'Last Name',
                    hintText: 'last name',
                    icon: Icons.person_outline,
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Last name required';
                      }
                      return null;
                    },
                  ),
                ),
              ],
            ),
            const SizedBox(height: 20),

            // Email
            ProfileTextField(
              controller: _emailController,
              label: 'Email Address',
              hintText: 'your@email.com',
              icon: Icons.email_outlined,
              keyboardType: TextInputType.emailAddress,
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return 'Please enter your email';
                }
                final emailRegex = RegExp(
                  r'^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}$',
                );
                if (!emailRegex.hasMatch(value)) {
                  return 'Please enter a valid email';
                }
                return null;
              },
            ),
            const SizedBox(height: 20),

            // Phone
            ProfileTextField(
              controller: _phoneController,
              label: 'Phone Number',
              hintText: '+1 234 567 8900',
              icon: Icons.phone_outlined,
              keyboardType: TextInputType.phone,
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return 'Please enter your phone number';
                }
                final digitsOnly = value.replaceAll(RegExp(r'\D'), '');
                if (digitsOnly.length < 10) {
                  return 'Please enter a valid phone number';
                }
                return null;
              },
            ),
            const SizedBox(height: 20),

            // Bio
            ProfileTextField(
              controller: _bioController,
              label: 'Bio',
              hintText: 'Tell us a little about yourself...',
              icon: Icons.description_outlined,
              maxLines: 4,
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return 'Please enter a bio';
                }
                if (value.length < 10) {
                  return 'Bio must be at least 10 characters';
                }
                if (value.length > 200) {
                  return 'Bio must be less than 200 characters';
                }
                return null;
              },
            ),
            const SizedBox(height: 32),

            const UpdateButton(),
            const SizedBox(height: 20),
          ],
        ),
      ),
    );
  }
}

class UpdateButton extends StatelessWidget {
  const UpdateButton({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      height: 56,
      child: ElevatedButton(
        onPressed: () {
          final form = Form.of(context);
          if (form.validate() ?? false) {
            ScaffoldMessenger.of(context).showSnackBar(
              const SnackBar(
                content: Text('Profile updated successfully!'),
                backgroundColor: Colors.green,
                duration: Duration(seconds: 2),
              ),
            );
          }
        },
        style: ElevatedButton.styleFrom(
          backgroundColor: kPrimaryColor,
          foregroundColor: Colors.white,
          elevation: 2,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(14),
          ),
        ),
        child: const Text(
          'Update Profile',
          style: TextStyle(fontSize: 18, fontWeight: FontWeight.w600),
        ),
      ),
    );
  }
}
