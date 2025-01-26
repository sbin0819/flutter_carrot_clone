import 'dart:typed_data';

import 'package:bamtol_market_app/src/common/components/app_font.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:photo_manager/photo_manager.dart';

class MultifulImageView extends StatefulWidget {
  final List<AssetEntity>? initImages;
  const MultifulImageView({
    super.key,
    this.initImages,
  });

  @override
  State<MultifulImageView> createState() => _MultifulImageViewState();
}

class _MultifulImageViewState extends State<MultifulImageView> {
  var scrollController = ScrollController();
  var albums = <AssetPathEntity>[];
  var imageList = <AssetEntity>[];
  int currentPage = 0;
  var selectedImages = <AssetEntity>[];
  int lastPage = -1;

  Future<void> _pagingPhotos() async {
    if (albums.isNotEmpty) {
      var photos =
          await albums.first.getAssetListPaged(page: currentPage, size: 60);

      if (currentPage == 0) {
        imageList.clear();
      }

      if (photos.isEmpty) {
        return;
      }

      setState(() {
        imageList.addAll(photos);
        currentPage++;
      });
    }
  }

  void loadMyPhotos() async {
    var permissionState = await PhotoManager.requestPermissionExtend();
    if (permissionState == PermissionState.limited ||
        permissionState == PermissionState.authorized) {
      albums = await PhotoManager.getAssetPathList(
        type: RequestType.image,
      );
    }
    _pagingPhotos();
  }

  @override
  void initState() {
    super.initState();
    loadMyPhotos();
    scrollController.addListener(() {
      var maxScroll = scrollController.position.maxScrollExtent;
      var currentScroll = scrollController.offset;
      if (currentScroll > maxScroll - 150 && currentPage != lastPage) {
        lastPage = currentPage;
        _pagingPhotos();
      }
    });
    if (widget.initImages != null) {
      selectedImages.addAll([...widget.initImages!]);
    }
  }

  bool containValue(AssetEntity value) {
    return selectedImages.where((element) => element.id == value.id).isNotEmpty;
  }

  String returnIndexValue(AssetEntity value) {
    var find = selectedImages.asMap().entries.where((element) {
      return element.value.id == value.id;
    });
    if (find.isNotEmpty) {
      return (find.first.key + 1).toString();
    } else {
      return '';
    }
  }

  void _selectedImage(AssetEntity imageList) async {
    setState(() {
      if (containValue(imageList)) {
        selectedImages.remove(imageList);
      } else {
        selectedImages.add(imageList);
      }
    });
  }

  Widget _photoWidget(AssetEntity asset) {
    return FutureBuilder<Uint8List?>(
      future: asset.thumbnailDataWithSize(ThumbnailSize(200, 200)),
      builder: (_, AsyncSnapshot snapshot) {
        if (snapshot.hasData) {
          return Stack(
            children: [
              SizedBox(
                width: double.infinity,
                height: double.infinity,
                child: Image.memory(
                  snapshot.data!,
                  fit: BoxFit.cover,
                ),
              ),
              Positioned(
                left: 0,
                bottom: 0,
                right: 0,
                top: 0,
                child: Stack(
                  children: [
                    Positioned(
                      left: 0,
                      bottom: 0,
                      right: 0,
                      top: 0,
                      child: Container(
                        color: Colors.white
                            .withValues(alpha: containValue(asset) ? 0.5 : 0),
                      ),
                    ),
                    Positioned(
                        top: 0,
                        right: 0,
                        child: GestureDetector(
                          onTap: () {
                            _selectedImage(asset);
                          },
                          behavior: HitTestBehavior.translucent,
                          child: Container(
                            margin: EdgeInsets.all(10),
                            width: 25,
                            height: 25,
                            decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              color: containValue(asset)
                                  ? Color(0xffed7738)
                                  : Colors.white.withValues(alpha: 0.5),
                              border: Border.all(
                                color: Colors.white,
                                width: 1,
                              ),
                            ),
                            child: Center(
                              child: Text(
                                returnIndexValue(asset),
                                style: TextStyle(color: Colors.white),
                              ),
                            ),
                          ),
                        )),
                  ],
                ),
              )
            ],
          );
        } else {
          return Container();
        }
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: AppFont(
          '최근 항목',
          fontWeight: FontWeight.bold,
          size: 18,
        ),
        actions: [
          GestureDetector(
            onTap: () {
              if (selectedImages.isNotEmpty) {
                Get.back(result: selectedImages);
              }
            },
            child: Padding(
              padding: EdgeInsets.only(top: 20, right: 25),
              child: AppFont(
                '완료',
                size: 16,
                color: Color(0xffed7738),
                fontWeight: FontWeight.bold,
              ),
            ),
          )
        ],
      ),
      body: Column(
        children: [
          Expanded(
            child: GridView.builder(
              controller: scrollController,
              itemCount: imageList.length,
              padding: EdgeInsets.zero,
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 3,
                crossAxisSpacing: 1,
                mainAxisSpacing: 1,
              ),
              itemBuilder: (BuildContext context, int index) {
                return _photoWidget(imageList[index]);
              },
            ),
          ),
        ],
      ),
    );
  }
}
