import 'package:flutter/material.dart';

import '../../components/person_card.dart';
import '../../logic/screens/logic_team_members.dart';
import '../../widgets/animated_page.dart';

class ScreenTeamMembers extends StatelessWidget {
  const ScreenTeamMembers({Key? key}) : super(key: key);

  static const screenId = 'ScreenTeamMembers0002';

  @override
  Widget build(BuildContext context) {
    return AmAnimatedPage(
      uniqueId: screenId,
      minHeight: 0,
      forceAnimation: LogicTeamMembersScreen().forceAnimation,
      scaffold: Scaffold(
        backgroundColor: const Color.fromARGB(255, 236, 253, 255),
        appBar: AppBar(
          backgroundColor: const Color.fromARGB(255, 210, 250, 255),
          title: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                'Team Members',
                style: Theme.of(context).textTheme.titleLarge,
              ),
              const SizedBox(width: 20),
              const Icon(Icons.person_pin_rounded, size: 36),
            ],
          ),
        ),
        body: GridView.count(
          crossAxisCount: 2,
          childAspectRatio: 0.70,
          padding: const EdgeInsets.all(8),
          children: [
            PersonCard(
              description: 'Project Manager + SCADA',
              title: 'Otafy',
              fullName: 'Mohamed Mostafa Otafy',
              onTap: () {},
            ),
            PersonCard(
              // description: 'MobileApp + Servers + Packing Sys + Am_RED_Nodes',
              description: 'Packing System',
              fullName: 'Amr Mostafa Abbas Mahmoud',
              title: 'Amr Mostafa',
              imageUrl: 'assets/images/amr.jpg',
              onTap: () {},
            ),
            PersonCard(
              description: 'Node-RED + تعب معاناجامد',
              fullName: "Mo'men Mohamed",
              title: "Mo'men",
              onTap: () {},
            ),
            PersonCard(
              description: 'Node-RED + تعب معاناجامد',
              fullName: "Mo'men Mohamed",
              title: "Mo'men",
              onTap: () {},
            ),
          ],
        ),
      ),
    );
  }
}
