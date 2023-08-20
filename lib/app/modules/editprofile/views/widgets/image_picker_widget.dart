import 'dart:io';

import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:image_cropper/image_cropper.dart';
import 'package:image_picker/image_picker.dart';
import 'package:jiitak_mac_test/config/theme/dark_theme_colors.dart';
import 'package:jiitak_mac_test/config/theme/light_theme_colors.dart';

class ImagePickerWidget extends StatefulWidget {
  final String? labelText;
  final String? helperText;
  final bool isRequired;
  final bool isLimit;
  final bool isLimitFlag;
  const ImagePickerWidget(
      {super.key,
      this.labelText = "",
      this.helperText = "",
      this.isRequired = true,
      this.isLimit = false,
      this.isLimitFlag = false});

  @override
  State<ImagePickerWidget> createState() => _ImagePickerWidgetState();
}

class _ImagePickerWidgetState extends State<ImagePickerWidget> {
  List<String> imageList = [
    "",
  ];

  openImageCropper(imageFile, aspectRatio, isMobile) async {
    CroppedFile? croppedFile = await ImageCropper().cropImage(
        sourcePath: imageFile,
        aspectRatio: Platform.isAndroid ? aspectRatio : aspectRatio,
        uiSettings: [
          AndroidUiSettings(
              toolbarTitle: '',
              toolbarColor: Colors.black,
              toolbarWidgetColor: Colors.white,
              cropFrameColor: Colors.black,
              activeControlsWidgetColor: Theme.of(context).primaryColor,
              lockAspectRatio: true),
          IOSUiSettings(
            title: '',
          )
        ]);
    imageList = imageList.reversed.toList();
    imageList.add(croppedFile!.path);
    imageList = imageList.reversed.toList();

    setState(() {});
  }

  openImagePicker(onCallBack, ratio, isMobile) async {
    showModalBottomSheet(
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.only(
              topLeft: Radius.circular(10), topRight: Radius.circular(10)),
        ),
        context: context,
        elevation: 0.0,
        isScrollControlled: true,
        builder: (BuildContext context) {
          return Wrap(
            children: <Widget>[
              GestureDetector(
                  child: Padding(
                      padding: EdgeInsets.only(
                          bottom: MediaQuery.of(context).viewInsets.bottom),
                      child: Column(children: <Widget>[
                        Padding(
                          padding: const EdgeInsets.all(10.0),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: <Widget>[
                              Container(
                                height: 10,
                              ),
                              const Text("Action",
                                  overflow: TextOverflow.ellipsis,
                                  style: TextStyle(
                                      fontFamily: 'Inter',
                                      fontSize: 16.0,
                                      color: Colors.black,
                                      fontWeight: FontWeight.bold)),
                              Container(
                                height: 5,
                              ),
                              const Divider(color: Colors.black12),
                              Container(
                                height: 0,
                              ),
                              InkWell(
                                  child: Container(
                                    height: 40,
                                    alignment: Alignment.centerLeft,
                                    child: Row(
                                      children: <Widget>[
                                        IconButton(
                                          icon: const SizedBox(
                                              height: 25,
                                              width: 25,
                                              child: Icon(Icons.camera)),
                                          onPressed: () async {
                                            Navigator.pop(context);
                                            var imagePicker = ImagePicker();
                                            var picture =
                                                await imagePicker.pickImage(
                                              source: ImageSource.camera,
                                              imageQuality: 30,
                                            );
                                            String path = picture!.path;

                                            if (path.isNotEmpty) {
                                              onCallBack(path, ratio, isMobile);
                                            }
                                          },
                                        ),
                                        const Text("Camera",
                                            overflow: TextOverflow.ellipsis,
                                            style: TextStyle(
                                                fontFamily: 'Inter',
                                                fontSize: 16.0,
                                                color: Colors.black,
                                                fontWeight: FontWeight.normal))
                                      ],
                                    ),
                                  ),
                                  onTap: () async {
                                    Navigator.pop(context);
                                    var imagePicker = ImagePicker();
                                    var picture = await imagePicker.pickImage(
                                      source: ImageSource.camera,
                                      imageQuality: 30,
                                    );
                                    String path = picture!.path;

                                    if (path.isNotEmpty) {
                                      onCallBack(path, ratio, isMobile);
                                    }
                                  }),
                              const Divider(color: Colors.black12),
                              InkWell(
                                  child: Container(
                                    height: 40,
                                    alignment: Alignment.centerLeft,
                                    child: Row(
                                      children: <Widget>[
                                        IconButton(
                                          icon: const Icon(Icons.photo),
                                          onPressed: () async {
                                            Navigator.pop(context);
                                            var imagepPicker = ImagePicker();
                                            var picture =
                                                await imagepPicker.pickImage(
                                              source: ImageSource.gallery,
                                              imageQuality: 30,
                                            );
                                            String path = picture!.path;

                                            if (path.isNotEmpty) {
                                              onCallBack(path, ratio, isMobile);
                                            }
                                          },
                                        ),
                                        const Text("Gallery",
                                            overflow: TextOverflow.ellipsis,
                                            style: TextStyle(
                                                fontFamily: 'Inter',
                                                fontSize: 16.0,
                                                color: Colors.black,
                                                fontWeight: FontWeight.normal))
                                      ],
                                    ),
                                  ),
                                  onTap: () async {
                                    Navigator.pop(context);
                                    var imagepPicker = ImagePicker();
                                    var picture = await imagepPicker.pickImage(
                                      source: ImageSource.gallery,
                                      imageQuality: 30,
                                    );
                                    String path = picture!.path;

                                    if (path.isNotEmpty) {
                                      onCallBack(path, ratio, isMobile);
                                    }
                                  }),
                              const Divider(color: Colors.black12),
                              Container(
                                height: 0,
                              ),
                            ],
                          ),
                        ),
                      ]))),
            ],
          );
        });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        16.verticalSpace,
        Row(
          children: [
            Text(widget.labelText ?? ""),
            if (widget.isRequired)
              const Text(
                " * ",
                style: TextStyle(color: Color(0xFFEB5308)),
              ),
            Text(widget.helperText ?? ""),
          ],
        ),
        if (widget.isLimit)
          Row(
            children: [
              Checkbox(value: widget.isLimitFlag, onChanged: (value) {},),
              const Text('有（最大３枚まで'),
              32.horizontalSpace,
              Checkbox(value: !widget.isLimitFlag, onChanged: (value) {}),
              const Text('無'),
            ],
          ),
        SizedBox(
          height: 130,
          child: ListView.builder(
              padding: const EdgeInsets.all(0),
              scrollDirection: Axis.horizontal,
              itemCount: imageList.length,
              itemBuilder: (contex, index) {
                return Padding(
                  padding: const EdgeInsets.only(right: 20.0, top: 10),
                  child: Stack(
                    children: [
                      imageList[index] != ""
                          ? ClipRRect(
                              borderRadius: BorderRadius.circular(8.0),
                              child: Image.file(
                                File(imageList[index]),
                                height: 102,
                                width: 102,
                              ),
                            )
                          : InkWell(
                              onTap: () {
                                openImagePicker(
                                    openImageCropper,
                                    const CropAspectRatio(ratioX: 1, ratioY: 1),
                                    true);
                              },
                              child: DottedBorder(
                                dashPattern: const [6, 3, 6, 3],
                                borderType: BorderType.RRect,
                                radius: const Radius.circular(5),
                                color: Colors.grey,
                                padding: const EdgeInsets.symmetric(
                                    vertical: 5, horizontal: 5),
                                child: ClipRRect(
                                  borderRadius: BorderRadius.circular(8.0),
                                  child: SizedBox(
                                    height: 90,
                                    width: 90,
                                    child: Center(
                                      child: Column(
                                          mainAxisAlignment:
                                              MainAxisAlignment.center,
                                          children: [
                                            Icon(
                                              Icons.image_outlined,
                                              color: Get.isDarkMode
                                                  ? DarkThemeColors
                                                      .bodyTextColor
                                                      .withOpacity(0.5)
                                                  : LightThemeColors
                                                      .bodyTextColor
                                                      .withOpacity(0.5),
                                            ),
                                            const Text(
                                              '写真を追加',
                                              style: TextStyle(fontSize: 12),
                                            ),
                                          ]),
                                    ),
                                  ),
                                ),
                              ),
                            ),
                      if (imageList[index] != "")
                        Positioned(
                            right: 0,
                            top: 0,
                            child: IconButton(
                              onPressed: () {
                                imageList.removeAt(index);
                              },
                              icon:
                                  const Icon(Icons.close, color: Colors.white),
                            )),
                    ],
                  ),
                );
              }),
        ),
      ],
    );
  }
}
