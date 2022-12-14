import 'package:flutter/material.dart';
import 'package:sata_widgets/sata_widgets.dart';
import 'package:sata_widgets/widgets/cached_image.dart';

class CachedNImagePage extends StatelessWidget {
  const CachedNImagePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    const String url =
        "https://cdn.pixabay.com/photo/2015/04/23/22/00/tree-736885__480.jpg";
    return Scaffold(
      appBar: AppBar(
        leading: SwIconButton(
          Icons.arrow_back_ios_new_rounded,
          onTap: () => Navigator.pop(context),
        ),
        title: const Text("Cached Network Image"),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            Container(
              height: 280.0,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(16.0),
                boxShadow: [
                  BoxShadow(
                    color: Colors.grey.shade400,
                    blurRadius: 1.0,
                    offset: const Offset(0.0, 1.0),
                  )
                ],
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Expanded(
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(16.0),
                      child: CachedNImage.expand(
                        url,
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 10.0),
                    child: Text(
                      "CachedNImage",
                      style: Theme.of(context).textTheme.bodyLarge,
                    ),
                  ),
                  const Padding(
                    padding: EdgeInsets.all(10.0),
                    child: Text("by: $url"),
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
