import 'package:flutter/material.dart';

import '../../components/person_card.dart';
import '../../logic/screens/logic_team_members.dart';
import '../../widgets/animated_page.dart';

class ScreenTeamMembers extends StatelessWidget {
  const ScreenTeamMembers({Key? key}) : super(key: key);

  static const screenId = 'ScreenTeamMembers0002';

  @override
  Widget build(BuildContext context) {
    final logic = LogicTeamMembersScreen();
    return AmAnimatedPage(
      uniqueId: screenId,
      minHeight: 0,
      forceAnimation: logic.forceAnimation,
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
          physics: const BouncingScrollPhysics(),
          padding: const EdgeInsets.all(8),
          children: [
            PersonCard(
              description: 'Project Manager + SCADA + PLC code + Panels',
              title: 'Otafy',
              imageUrl: 'assets/images/otafy.jpg',
              fullName: 'Mohamed Mustafa Otafy Ahmed',
              onTap: () => logic.pushOtafyCvPage(context),
            ),
            PersonCard(
              // description: 'MobileApp + Servers + Packing Sys + Am_RED_Nodes',
              description:
                  'Packing System + Mobile App & Servers + AM_RED_Channel + Public-RED App + Panels',
              fullName: 'Amr Mostafa Abbas',
              title: 'Amr Mostafa',
              imageUrl: 'assets/images/amr.jpg',
              onTap: () => logic.pushAmrCvPage(context),
            ),
            PersonCard(
              description: 'Node-RED + PLC Code + Procurement + Panels',
              fullName: "Mo’men Mohamed Mahmoud",
              title: "Mo'men",
              imageUrl: 'assets/images/momen.jpg',
              onTap: () => logic.pushMomenCvPage(context),
            ),
            PersonCard(
              description: 'Leakage system + HMI',
              fullName: "Ahmed Abdel Wahab Mohmed Hawash",
              title: "Ahmed Hawash",
              imageUrl: 'assets/images/7wash.jpg',
              onTap: () => logic.push7washCvPage(context),
            ),
            PersonCard(
              description: 'Documentation + PLC code + Panels',
              fullName: "Abdelrahman Ahmed Thabet",
              title: "Abdelrahman Thabet",
              imageUrl: 'assets/images/thabet.jpg',
              onTap: () => logic.pushThabetCvPage(context),
            ),
            PersonCard(
              description:
                  'Computer vision + Object  detection + Deep learning',
              fullName: "KAREEM OSAMA ABDELHAKIEM Aly",
              title: "Kareem Osama",
              imageUrl: 'assets/images/kareem.jpg',
              onTap: () => logic.pushKareemCvPage(context),
            ),
            PersonCard(
              description:
                  'Communication drives; plc code; filling system and wiring',
              fullName: "Ahmed Abd-Elrheem",
              title: "Ahmed Abd-Elrheem",
              imageUrl: 'assets/images/abdelrheem.jpg',
              onTap: () => logic.pushAbdelriheemCvPage(context),
            ),
          ],
        ),
      ),
    );
  }
}
