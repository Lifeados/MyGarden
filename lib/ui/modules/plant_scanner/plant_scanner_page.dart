import 'package:camera/camera.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:my_garden/shared/utils/app_colors.dart';
import 'package:provider/provider.dart';

class PlantScannerPage extends StatefulWidget {
  const PlantScannerPage({
    super.key,
  });

  @override
  State<PlantScannerPage> createState() => PlantScannerPageState();
}

class PlantScannerPageState extends State<PlantScannerPage> {
  CameraController? _controller;
  late Future<void> _initializeControllerFuture;

  @override
  void initState() {
    super.initState();
    initializeCamera();
  }

  void initializeCamera() {
    try {
      final cameras = Provider.of<List<CameraDescription>>(
        context,
        listen: false,
      );

      if (cameras.isNotEmpty) {
        final firstCamera = cameras.first;
        _controller = CameraController(firstCamera, ResolutionPreset.high);
        _initializeControllerFuture = _controller!.initialize();
      } else {
        throw Exception("Nenhuma câmera disponível no dispositivo.");
      }
    } catch (e) {
      _initializeControllerFuture =
          Future.error("Erro ao inicializar a câmera: $e");
    }
  }

  @override
  void dispose() {
    super.dispose();
    _controller?.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        leading: IconButton(
          onPressed: () {},
          icon: SvgPicture.asset(
            'lib/ui/assets/icons/arrowleft.svg',
            colorFilter: const ColorFilter.mode(
              AppColors.primaryWhiteColor,
              BlendMode.srcIn,
            ),
            width: 20,
            height: 20,
          ),
        ),
      ),
      extendBodyBehindAppBar: true,
      body: Stack(
        alignment: AlignmentDirectional.center,
        children: [
          FutureBuilder(
            future: _initializeControllerFuture,
            builder: (context, snapshot) {
              if (snapshot.connectionState == ConnectionState.done) {
                if (_controller != null) {
                  return SizedBox.expand(
                    child: CameraPreview(
                      _controller!,
                    ),
                  );
                } else {
                  return const Center(
                    child: Text('Erro ao inicializar a câmera'),
                  );
                }
              } else if (snapshot.hasError) {
                return const Center(
                  child: Text('Houve um problema'),
                );
              } else {
                return const Center(
                  child: CircularProgressIndicator(),
                );
              }
            },
          ),
          Padding(
            padding: const EdgeInsets.only(bottom: 44),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Container(
                  width: 280,
                  height: 320,
                  decoration: BoxDecoration(
                    border: Border.all(
                      color: AppColors.primaryWhiteColor,
                      width: 3.0,
                    ),
                    borderRadius: BorderRadius.circular(30),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 30, bottom: 36),
                  child: Container(
                    padding: const EdgeInsets.all(16),
                    width: 335,
                    height: 109,
                    decoration: BoxDecoration(
                      color: const Color.fromRGBO(255, 255, 255, 0.8),
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Container(
                          width: 77,
                          height: 77,
                          decoration: BoxDecoration(
                            color: AppColors.primaryGreyColor,
                            borderRadius: BorderRadius.circular(8),
                            border: Border.all(
                              color: AppColors.primaryWhiteColor,
                              width: 2,
                            ),
                          ),
                          child: Image.asset(
                            'lib/ui/assets/images/alface.png',
                          ),
                        ),
                        const Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'Snake Plant',
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            Padding(
                              padding: EdgeInsets.only(top: 5, bottom: 10),
                              child: Text(
                                'It’s a large genus of flo...',
                                style: TextStyle(
                                  fontSize: 12,
                                ),
                              ),
                            ),
                            Text('Good Condition'),
                          ],
                        ),
                        IconButton(
                          onPressed: () {},
                          icon: SvgPicture.asset(
                            'lib/ui/assets/icons/bookmark.svg',
                            width: 24,
                            height: 24,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    IconButton(
                      onPressed: () {},
                      icon: SvgPicture.asset(
                        'lib/ui/assets/icons/gallery.svg',
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 75),
                      child: GestureDetector(
                        onTap: () {},
                        child: Stack(
                          alignment: AlignmentDirectional.center,
                          children: [
                            Container(
                              width: 77,
                              height: 77,
                              decoration: BoxDecoration(
                                border: Border.all(
                                  color: AppColors.primaryWhiteColor,
                                  width: 3,
                                ),
                                borderRadius: BorderRadius.circular(38.5),
                              ),
                            ),
                            Container(
                              width: 57,
                              height: 57,
                              decoration: BoxDecoration(
                                color: AppColors.primaryWhiteColor,
                                borderRadius: BorderRadius.circular(28.5),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    IconButton(
                      onPressed: () {},
                      icon: SvgPicture.asset(
                        'lib/ui/assets/icons/flash.svg',
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
