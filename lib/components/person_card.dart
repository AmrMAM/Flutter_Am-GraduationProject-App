import 'package:flutter/material.dart';

import '../statics/screen_size.dart';

class PersonCard extends StatelessWidget {
  final String? imageUrl;
  final String title;
  final String fullName;
  final String description;
  final Alignment alignment;
  final void Function()? onTap;
  const PersonCard({
    Key? key,
    required this.description,
    required this.fullName,
    this.imageUrl,
    required this.title,
    this.alignment = Alignment.center,
    this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: alignment,
      child: SizedBox(
        width: ScreenSize.screenWidth! / 2 - 10,
        height: 250,
        child: Card(
          borderOnForeground: false,
          clipBehavior: Clip.antiAlias,
          elevation: 6,
          shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(30),
              topRight: Radius.circular(30),
              bottomLeft: Radius.circular(10),
              bottomRight: Radius.circular(10),
            ),
          ),
          child: InkWell(
            onTap: onTap,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  color: Colors.green,
                  width: ScreenSize.screenWidth! / 2 - 10,
                  height: 170,
                  child: ImageSection(imageUrl: imageUrl, title: title),
                ),
                TitleSection(fullName: fullName, description: description),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class TitleSection extends StatelessWidget {
  const TitleSection({
    Key? key,
    required this.fullName,
    required this.description,
  }) : super(key: key);

  final String fullName;
  final String description;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 72,
      padding: const EdgeInsets.symmetric(horizontal: 4, vertical: 2),
      child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              fullName,
              maxLines: 2,
              softWrap: true,
              style: Theme.of(context)
                  .textTheme
                  .bodyLarge!
                  .copyWith(color: Colors.blue[800]),
            ),
            const SizedBox(height: 2),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 4),
              child: Text(
                description,
                softWrap: true,
                style: Theme.of(context)
                    .textTheme
                    .bodyLarge!
                    .copyWith(color: Colors.grey[600]),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class ImageSection extends StatelessWidget {
  const ImageSection({
    Key? key,
    required this.imageUrl,
    required this.title,
  }) : super(key: key);

  final String? imageUrl;
  final String title;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Image.asset(
          imageUrl ?? 'assets/images/nullImage.jpg',
          fit: BoxFit.cover,
          width: double.infinity,
          height: double.infinity,
        ),
        Positioned(
          bottom: 0,
          child: Stack(
            children: [
              Opacity(
                opacity: 0.5,
                child: Container(
                  height: 50,
                  width: ScreenSize.screenWidth! / 2 - 18,
                  decoration: const BoxDecoration(
                    color: Colors.black,
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(20),
                      topRight: Radius.circular(20),
                    ),
                  ),
                ),
              ),
              SizedBox(
                height: 50,
                width: ScreenSize.screenWidth! / 2 - 10,
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 4),
                  child: Center(
                    child: Text(
                      title,
                      maxLines: 2,
                      softWrap: true,
                      style: Theme.of(context)
                          .textTheme
                          .headline5!
                          .copyWith(color: Colors.white),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
