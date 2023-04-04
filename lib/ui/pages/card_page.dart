import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../files_import/files_import.dart';

class CardPage extends StatefulWidget {
  const CardPage({Key? key}) : super(key: key);

  @override
  State<CardPage> createState() => _CardPageState();
}

class _CardPageState extends State<CardPage> {
  final ImagePicker _picker = ImagePicker();

  File picture = File("");

  File? imageFile;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[300],
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          SizedBox(
            height: 30.h,
          ),
          GestureDetector(
            onTap: () async {},
            child: Container(
              margin: const EdgeInsets.symmetric(horizontal: 16),
              height: MediaQuery.of(context).size.height * 0.3,
              width: MediaQuery.of(context).size.width * 0.9,
              decoration: BoxDecoration(
                  color: Colors.grey[300],
                  image: DecorationImage(
                      image: picture.path != null
                          ? FileImage(
                              picture as File,
                            )
                          : const AssetImage(
                              "assets/images/1.jpg",
                            ) as ImageProvider,
                      fit: BoxFit.cover),
                  borderRadius: BorderRadius.circular(15.r),
                  boxShadow: [
                    // Shadow for top-left corner
                    BoxShadow(
                      color: Colors.grey[500]!,
                      offset: const Offset(5, 5),
                      blurRadius: 3,
                      spreadRadius: 1,
                    ),
                    // Shadow for bottom-right corner
                    const BoxShadow(
                      color: Colors.white,
                      offset: Offset(-5, -5),
                      blurRadius: 3,
                      spreadRadius: 1,
                    ),
                  ]),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(
                    height: 20.h,
                  ),
                  Image.asset(
                    "assets/images/chip.png",
                    height: 150.h,
                    width: 150.w,
                  ),
                  Text(
                    " 9860  1801 0346  1183",
                    style: TextStyle(
                      fontSize: 33,
                    ),
                  ),
                  const Text("12/27", textAlign: TextAlign.center),
                  const Text("Sattorov Sardor", textAlign: TextAlign.left)
                ],
              ),
            ),
          ),
          const SizedBox(
            height: 30,
          ),
          ElevatedButton(
            onPressed: () async {
              final XFile? image =
                  await _picker.pickImage(source: ImageSource.gallery);

              setState(() {
                picture = File(image!.path);
              });
            },
            child: const Text(
              "Set picture",
              style: TextStyle(
                fontSize: 20.0,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
