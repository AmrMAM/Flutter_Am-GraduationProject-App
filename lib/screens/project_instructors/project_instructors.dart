import 'package:flutter/material.dart';

import '../../components/person_card.dart';
import '../../logic/screens/logic_project_instructors.dart';
import '../../widgets/animated_page.dart';

class ScreenProjectInstructors extends StatelessWidget {
  const ScreenProjectInstructors({Key? key}) : super(key: key);

  static const screenId = 'ScreenProjectInstructors0002';

  @override
  Widget build(BuildContext context) {
    return AmAnimatedPage(
      uniqueId: screenId,
      minHeight: 0,
      forceAnimation: LogicProjectInstructorsScreen().forceAnimation,
      scaffold: Scaffold(
        backgroundColor: const Color.fromARGB(255, 236, 253, 255),
        appBar: AppBar(
          backgroundColor: const Color.fromARGB(255, 210, 250, 255),
          title: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                'Project Instructors',
                style: Theme.of(context).textTheme.titleLarge,
              ),
              const SizedBox(width: 20),
              const Icon(Icons.verified, size: 36),
            ],
          ),
        ),
        body: GridView.count(
          crossAxisCount: 2,
          childAspectRatio: 0.70,
          padding: const EdgeInsets.all(8),
          children: const [
            PersonCard(
              description: 'Electrical Power Engineering Professor',
              title: 'Dr.Elnaggar',
              fullName: 'Dr.Mahmoud Elnaggar',
            ),
            PersonCard(
              description: 'Electrical Power Engineering Professor',
              title: 'Dr.Khaled',
              fullName: 'Dr.Khaled El-Metwally',
            ),
            PersonCard(
              description: 'Schneider Sponsor',
              fullName: "Eng.Hossam Empapy",
              title: "Eng.Hossam",
              imageUrl: 'assets/images/7ossam.jpg',
            ),
          ],
        ),
      ),
    );
  }
}
