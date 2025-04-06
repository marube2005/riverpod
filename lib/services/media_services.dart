//import 'package:flutter/material.dart';
import 'package:file_picker/file_picker.dart';
class MediaServices {

   MediaServices (){

   }
  // ignore: unused_element
  Future<PlatformFile?> _filepicker() async{
    FilePickerResult? _result = await FilePicker.platform.pickFiles(type: FileType.image);
    if(_result != null){
      return _result.files[0];
    }
    return null;
  }
}