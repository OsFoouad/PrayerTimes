// ignore_for_file: file_names
import 'package:flutter/material.dart';

class ThemeNotifier with ChangeNotifier {
  ThemeData _themeData;
  String _imageAssetPath;
  String _masgedImageAsset;

  ThemeNotifier(this._themeData, this._imageAssetPath  , this._masgedImageAsset);

  getTheme() => _themeData;

  getImageAssetPath() => _imageAssetPath;

  getMasgedImageAsset() => _masgedImageAsset;

  setTheme(ThemeData themeData, String imageAssetPath , String masgedImage) async {
    _themeData = themeData;
    _imageAssetPath = imageAssetPath;
    _masgedImageAsset=masgedImage;
    notifyListeners();
  }
}
