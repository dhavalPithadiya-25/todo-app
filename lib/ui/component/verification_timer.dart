import 'dart:async';
import 'package:flutter/material.dart';

class VerificationTimer extends StatefulWidget {
  final Duration duration;
  final ValueSetter<VoidCallback> onResend;

  const VerificationTimer({super.key, required this.duration, required this.onResend});

  @override
  State<VerificationTimer> createState() => _VerificationTimerState();
}

class _VerificationTimerState extends State<VerificationTimer> {
  late ValueNotifier<int> _notifier;
  Timer? _timer;

  @override
  void dispose() {
    _timer?.cancel();
    super.dispose();
  }

  @override
  void initState() {
    // _onStart();
    _notifier = ValueNotifier<int>(widget.duration.inSeconds);
    super.initState();
  }

  void _onStart() {
    _timer = Timer.periodic(const Duration(seconds: 1), _timerCallBack);
  }

  void _timerCallBack(Timer timer) {
    int result = widget.duration.inSeconds - timer.tick;
    _notifier.value = result;
    if (result <= 0) timer.cancel();
  }

  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder(
      valueListenable: _notifier,
      builder: (context, value, child) {
        final isTimerActive = _timer?.isActive ?? true;
        return GestureDetector(
          onTap: () {
            if (isTimerActive == false) widget.onResend(_onStart);
          },
          child: Text(isTimerActive ? "$value sec" : "Resend"),
        );
      },
    );
  }
}
