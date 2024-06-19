import 'package:flutter/material.dart';

import '../../data/validators.dart';

class SocialsInput extends StatefulWidget {
  final TextEditingController cFacebook;
  final TextEditingController cInstagram;
  final TextEditingController cTwitter;
  final TextEditingController cLinkedIn;
  final TextEditingController cTiktok;
  final TextEditingController cYoutube;

  const SocialsInput({
    super.key,
    required this.cFacebook,
    required this.cInstagram,
    required this.cTiktok,
    required this.cTwitter,
    required this.cLinkedIn,
    required this.cYoutube,
  });

  @override
  State<SocialsInput> createState() => _SocialsInputState();
}

class _SocialsInputState extends State<SocialsInput> {
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Row(
          mainAxisSize: MainAxisSize.max,
          children: [
            // TODO: Update with actual company icons
            Flexible(
              child: TextFormField(
                controller: widget.cFacebook,
                validator: Validators.validateWebsiteNullable,
                decoration: const InputDecoration(
                  prefixIcon: Icon(Icons.facebook),
                  labelText: 'Facebook Profile',
                  border: OutlineInputBorder(),
                ),
              ),
            ),
            const SizedBox(width: 20),
            Flexible(
              child: TextFormField(
                controller: widget.cInstagram,
                validator: Validators.validateWebsiteNullable,
                decoration: const InputDecoration(
                  prefixIcon: Icon(
                    Icons.camera_alt,
                    color: Colors.deepPurple,
                  ),
                  labelText: 'Instagram Profile',
                  border: OutlineInputBorder(),
                ),
              ),
            )
          ],
        ),
        const SizedBox(height: 20),
        Row(
          mainAxisSize: MainAxisSize.max,
          children: [
            Flexible(
              child: TextFormField(
                controller: widget.cTwitter,
                validator: Validators.validateWebsiteNullable,
                decoration: const InputDecoration(
                  prefixIcon: Icon(
                    Icons.close,
                    color: Colors.black,
                  ),
                  labelText: 'Twitter Profile',
                  border: OutlineInputBorder(),
                ),
              ),
            ),
            const SizedBox(width: 20),
            Flexible(
              child: TextFormField(
                controller: widget.cLinkedIn,
                validator: Validators.validateWebsiteNullable,
                decoration: const InputDecoration(
                  prefixIcon: Icon(
                    Icons.person,
                    color: Colors.blue,
                  ),
                  labelText: 'LinkedIn Profile',
                  border: OutlineInputBorder(),
                ),
              ),
            )
          ],
        ),
        const SizedBox(height: 20),
        Row(
          mainAxisSize: MainAxisSize.max,
          children: [
            Flexible(
              child: TextFormField(
                controller: widget.cTiktok,
                validator: Validators.validateWebsiteNullable,
                decoration: const InputDecoration(
                  prefixIcon: Icon(Icons.tiktok),
                  labelText: 'Tiktok Profile',
                  border: OutlineInputBorder(),
                ),
              ),
            ),
            const SizedBox(width: 20),
            Flexible(
              child: TextFormField(
                controller: widget.cYoutube,
                validator: Validators.validateWebsiteNullable,
                decoration: const InputDecoration(
                  prefixIcon: Icon(Icons.play_circle, color: Colors.red),
                  labelText: 'Youtube Profile',
                  border: OutlineInputBorder(),
                ),
              ),
            ),
          ],
        ),
      ],
    );
  }
}
