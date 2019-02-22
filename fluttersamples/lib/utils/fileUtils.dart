/*
 * @Author: Tan Dong 
 * @Date: 2019-02-22 22:28:43 
 * @Last Modified by:   Tan Dong 
 * @Last Modified time: 2019-02-22 22:28:43 
 */
import 'dart:convert';
import 'dart:io';

void main() {
  file6();
}

/// 创建文件夹
Future directory1() async {
  var directory = Directory("temp1");
  directory.create();
}

/// 递归创建文件夹
void directory2() {
  Directory('dir/subdir').create(recursive: true).then((Directory directory) {
    print(directory.path);
  });
}

///列出目录文件列表
void directory3() {
  var systemTempDir = Directory('sdcard');
  systemTempDir
      .list(recursive: true, followLinks: false)
      .listen((FileSystemEntity entity) {
    print(entity.path);
  });
}

///判断文件夹是否存在
void directory4() {
  var directory = Directory('dir/subdir');
  directory.exists().then((isThere) {
    print(isThere);
  });
}

///判断文件夹是否存在
void directory5() {
  var directory = Directory('dir/subdir');
  directory.rename('dir/subRightDir').then((Directory directory) {});
}

///判断文件是否存在
void file1() {
  var file = File('E:/file.txt');
  file.exists().then((isThere) {
    print(isThere);
  });
}

///创建文件
void file2() {
  var file = File('E:/file2.txt');
  file.create().then((file) {
    print(file);
  });
}

///最强大的读取文件的方式，Stream方式
void file3() {
  var file = File('E:/file.txt');
  Stream<List<int>> inputStream = file.openRead();
  inputStream
      .transform(utf8.decoder)
      .transform(new LineSplitter())
      .listen((string) {
    print(string);
  }).onDone(() {
    print('File is now closed.');
  });
}

///文件写入内容
void file4() {
  var file = File('E:/file2.txt');
  file.writeAsString('some content').then((file) {
    print(file);
  });
}

///文件写入内容
void file5() {
  var file = File('E:/file2.txt');
  var sink = file.openWrite();
  sink.write('FILE ACCESSED ${new DateTime.now()}\n');
  sink.close();
}

///获取文件长度等信息
void file6() {
  var file = File('E:/file.txt');
  file.length().then((len) {
    print(len);
  });
}
