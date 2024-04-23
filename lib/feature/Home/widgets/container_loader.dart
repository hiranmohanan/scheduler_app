import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:rive/rive.dart';

class RivContainer extends StatefulWidget {
  const RivContainer({super.key});

  @override
  State<RivContainer> createState() => _RivContainerState();
}

class _RivContainerState extends State<RivContainer> {
  Artboard? _riveArtboard;

  @override
  void initState() {
    // TODO: implement initState

    super.initState();
    _loadRiveFile(name: 'Left');
  }

  Future<void> _loadRiveFile({required String name}) async {
    final bytes = await rootBundle.load('assets/riv/robot_controller_test.riv');
    final file = RiveFile.import(bytes);
    final artboard = file.mainArtboard;
    var controller = StateMachineController.fromArtboard(artboard, name);
    if (controller != null) {
      artboard.addController(controller);

      setState(() {
        _riveArtboard = artboard;
      });
    }
    if (kDebugMode) {
      print('Loaded $name');
      print('Artboard $_riveArtboard');
    }
  }

  @override
  Widget build(BuildContext context) {
    return _riveArtboard != null
        ? GestureDetector(
            onTap: () {
              _loadRiveFile(name: 'Center');
            },
            onDoubleTap: () {
              _loadRiveFile(name: 'Wave');
            },
            child: Container(
              child: Expanded(
                child: Rive(
                  artboard: _riveArtboard!,
                  fit: BoxFit.cover,
                ),
              ),
            ),
          )
        : const SizedBox();
  }
}
