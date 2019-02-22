/*
 * @Author: Tan Dong 
 * @Date: 2019-02-22 22:29:42 
 * @Last Modified by:   Tan Dong 
 * @Last Modified time: 2019-02-22 22:29:42 
 */
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter/services.dart' show rootBundle;

class ImageSamples extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return ImageSamplesState();
  }
}

class ImageSamplesState extends State<ImageSamples> {
  ImageInfo imageInfo;
  String imageUrl =
      'https://ss3.bdstatic.com/70cFv8Sh_Q1YnxGkpoWK1HF6hhy/it/u=495625508,3408544765&fm=27&gp=0.jpg';

  @override
  void initState() {
    super.initState();
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();

    ///图片加载监听处理
    Image.asset("assets/flutter-mark-square-64.png")
        .image
        .resolve(createLocalImageConfiguration(context))
        .addListener((ImageInfo image, bool synchronousCall) {
      imageInfo = image;
    });
  }

  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      shrinkWrap: true,
      slivers: <Widget>[
        SliverPadding(
          padding: const EdgeInsets.all(20.0),
          sliver: SliverList(
            delegate: SliverChildListDelegate(
              <Widget>[
                ///从项目目录里读取图片，需要在pubspec.yaml注册路径
                Image.asset("assets/flutter-mark-square-64.png"),
                Image(
                  image: AssetImage("assets/flutter-mark-square-64.png"),
                ),

                ///从文件读取图片
                Image.file(
                  File('/sdcard/img.png'),
                  width: 200,
                  height: 80,
                ),
                Image(
                  image: FileImage(File('/sdcard/img.png')),
                ),

                ///读取加载原始图片
                // RawImage(
                //   image: imageInfo?.image,
                // ),

                ///内存中读取byte数组图片
                /// Image.memory(bytes)
                /// Image(
                ///   image: MemoryImage(bytes),
                /// ),
                /// 读取网络图片
                Image.network(imageUrl),
                Image(
                  image: NetworkImage(imageUrl),
                ),

                ///加入占位图的加载图片
                FadeInImage(
                  placeholder: AssetImage("assets/flutter-mark-square-64.png"),
                  image: FileImage(File('/sdcard/img.png')),
                ),
                FadeInImage.assetNetwork(
                  placeholder: "assets/flutter-mark-square-64.png",
                  image: imageUrl,
                ),

                /// FadeInImage.memoryNetwork(
                ///   placeholder: byte,
                ///   image: imageUrL,
                /// ),

                ///加载圆形图片
                CircleAvatar(
                  backgroundColor: Colors.brown.shade800,
                  child: Text('头像'),
                  backgroundImage: AssetImage("assets/img_welcome.jpg"),
                  radius: 50.0,
                ),
                Container(
                  decoration: BoxDecoration(
                      image: DecorationImage(
                          image: AssetImage("assets/img_welcome.jpg"))),
                ),
                ImageIcon(AssetImage("assets/img_welcome.jpg")),
                ClipRRect(
                  child: Image.network(
                    imageUrl,
                    scale: 8.5,
                    fit: BoxFit.cover,
                  ),
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(20),
                    topRight: Radius.circular(20),
                  ),
                ),
                Container(
                  width: 120,
                  height: 60,
                  decoration: BoxDecoration(
                    shape: BoxShape.rectangle,
                    borderRadius: BorderRadius.circular(10.0),
                    image: DecorationImage(
                        image: NetworkImage(imageUrl), fit: BoxFit.cover),
                  ),
                ),
                ClipOval(
                  child: Image.network(
                    imageUrl,
                    scale: 8.5,
                  ),
                ),
                CircleAvatar(
                  backgroundImage: NetworkImage(imageUrl),
                  radius: 50.0,
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
