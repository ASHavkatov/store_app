import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:speech_to_text/speech_to_text.dart' as stt;
import 'package:permission_handler/permission_handler.dart';
import 'package:store_app/core/utils/colors.dart';
import 'package:store_app/features/home/managers/home_bloc.dart';
import 'package:store_app/features/home/managers/home_event.dart';

class SearchContainer extends StatefulWidget {
  const SearchContainer({super.key});

  @override
  State<SearchContainer> createState() => _SearchContainerState();
}

class _SearchContainerState extends State<SearchContainer> {
  late stt.SpeechToText _speech;
  bool _isListening = false;
  final TextEditingController _controller = TextEditingController();

  @override
  void initState() {
    super.initState();
    _speech = stt.SpeechToText();
  }

  Future<void> requestMicrophonePermission() async {
    final status = await Permission.microphone.request();

    if (status.isGranted) {
      print('Microphone permission granted');
    } else if (status.isDenied) {
      print('Microphone permission denied');
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Microphone permission is denied')),
      );
    } else if (status.isPermanentlyDenied) {
      print('Microphone permission is permanently denied');
      openAppSettings();
    }
  }

  void _startListening() async {
    bool available = await _speech.initialize();
    if (available) {
      setState(() => _isListening = true);
      _speech.listen(
        onResult: (val) {
          setState(() {
            _controller.text = val.recognizedWords;
            _controller.selection = TextSelection.fromPosition(
              TextPosition(offset: _controller.text.length),
            );
          });
        },
        listenFor: const Duration(seconds: 30),
        pauseFor: const Duration(seconds: 5),
        partialResults: true,
      );
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text("Speech recognition is not available")),
      );
    }
  }

  void _stopListening() {
    setState(() => _isListening = false);
    _speech.stop();
  }

  void _toggleListening() {
    if (_isListening) {
      _stopListening();
    } else {
      _startListening();
    }
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 52.h,
      child: TextFormField(
        controller: _controller,
        style: TextStyle(
          color: Colors.black,
          fontSize: 16.sp,
        ),
        decoration: InputDecoration(
          hintText: "Search for clothes...",
          hintStyle: TextStyle(
            color: AppColors.primary400,
            fontSize: 14.sp,
          ),
          filled: true,
          fillColor: Colors.white,
          prefixIcon: Padding(
            padding: EdgeInsets.all(12.w),
            child: GestureDetector(
              onTap: () {
                context.read<HomeBloc>().add(HomeLoad(title: _controller.text.trim(), categoryId: null));
              },
              child: SvgPicture.asset(
                "assets/icons/search.svg",
                color: Colors.grey,
                width: 24.w,
                height: 24.w,
              ),
            ),
          ),
          suffixIcon: GestureDetector(
            onTap: () async {
              await requestMicrophonePermission();
              _toggleListening();
            },
            child: Padding(
              padding: EdgeInsets.all(12.w),
              child: SvgPicture.asset(
                "assets/icons/microphone.svg",
                color: _isListening ? Colors.blue: Colors.grey,
                width: 24.w,
                height: 24.w,
              ),
            ),
          ),
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10.r),
            borderSide: const BorderSide(
              color: Colors.black12,
              width: 2,
            ),
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(12.r),
            borderSide: const BorderSide(
              color: Colors.black26,
              width: 2,
            ),
          ),
        ),
      ),
    );
  }
}
