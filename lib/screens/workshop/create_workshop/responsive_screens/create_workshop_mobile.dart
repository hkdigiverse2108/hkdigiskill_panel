import 'package:flutter/material.dart';
import 'package:hkdigiskill_admin/utils/constants/sizes.dart';

class CreateWorkshopMobileScreen extends StatelessWidget {
  const CreateWorkshopMobileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // bottomNavigationBar: const WorkshopBottomNavigationButtons(),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(AdminSizes.defaultSpace),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [],
        ),
      ),
    );
  }
}
