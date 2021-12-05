import 'package:flutter/material.dart';
import 'package:flutter_application_1/core/enum/duration_enum.dart';



class ImageOpacity extends StatefulWidget {
  final String Url;
  const ImageOpacity({ Key? key, required this.Url }) : super(key: key);

  @override
  _ImageOpacityState createState() => _ImageOpacityState();
}

class _ImageOpacityState extends State<ImageOpacity> {
  bool _isOpacity=false;
  
@override
  void initState() {
    super.initState();
    waitForLoading();
  }

  Future<void> waitForLoading() async {
    await Future.delayed(DurationEnums.NORMAL.time);
    setState(() {
      _isOpacity = true;
    });
  }



  @override
  Widget build(BuildContext context) {
    return AnimatedOpacity(
            opacity: _isOpacity ? 0 : 1,
            duration: Duration(seconds: 1),
            child: Image.network(widget.Url),
          );
  }
}