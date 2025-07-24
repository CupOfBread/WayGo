import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'radio_logic.dart';

class RadioPage extends StatelessWidget {
  const RadioPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<RadioLogic>(
      init: RadioLogic(),
      builder: (logic) {
        final state = logic.state;
        return Scaffold(
          backgroundColor: const Color(0xFF181818),
          appBar: AppBar(
            title: const Text('收音机'),
            centerTitle: true,
            backgroundColor: Colors.transparent,
            elevation: 0,
            foregroundColor: Colors.white,
          ),
          body: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                // 唱片+唱针
                Stack(
                  alignment: Alignment.center,
                  children: [
                    // 黑胶唱片
                    Container(
                      width: 260,
                      height: 260,
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        gradient: const RadialGradient(
                          colors: [Color(0xFF444444), Color(0xFF181818)],
                          radius: 0.95,
                        ),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.black.withAlpha((0.4 * 255).toInt()),
                            blurRadius: 32,
                            offset: Offset(0, 12),
                          ),
                        ],
                        border: Border.all(color: Colors.grey.shade800, width: 6),
                      ),
                    ),
                    // 唱片中心圆
                    Container(
                      width: 80,
                      height: 80,
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        color: Colors.orange.shade200,
                        border: Border.all(color: Colors.orange.shade400, width: 4),
                      ),
                    ),
                    // 唱针装饰
                    Positioned(
                      top: 18,
                      right: 38,
                      child: Transform.rotate(
                        angle: state.isPlaying ? -0.25 : -0.5,
                        child: Container(
                          width: 90,
                          height: 16,
                          decoration: BoxDecoration(
                            color: Colors.grey.shade300,
                            borderRadius: BorderRadius.circular(8),
                            boxShadow: [
                              BoxShadow(
                                color: Colors.black12,
                                blurRadius: 6,
                                offset: Offset(2, 2),
                              ),
                            ],
                          ),
                          child: Align(
                            alignment: Alignment.centerRight,
                            child: Container(
                              width: 18,
                              height: 18,
                              decoration: BoxDecoration(
                                color: Colors.grey.shade700,
                                shape: BoxShape.circle,
                                border: Border.all(color: Colors.white, width: 2),
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                    // 播放/暂停按钮
                    Positioned(
                      child: GestureDetector(
                        onTap: logic.togglePlay,
                        child: AnimatedContainer(
                          duration: const Duration(milliseconds: 200),
                          width: 80,
                          height: 80,
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            color: state.isPlaying ? Colors.deepOrange : Colors.orange.shade400,
                            boxShadow: [
                              BoxShadow(
                                color: Colors.deepOrange.withAlpha((0.18 * 255).toInt()),
                                blurRadius: 16,
                                offset: Offset(0, 6),
                              ),
                            ],
                          ),
                          child: state.isLoading
                              ? const Center(child: CircularProgressIndicator(color: Colors.white))
                              : Icon(
                                  state.isPlaying ? Icons.pause_rounded : Icons.play_arrow_rounded,
                                  color: Colors.white,
                                  size: 48,
                                ),
                        ),
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 40),
                // 电台名
                const Text(
                  'CRI 中文环球资讯广播',
                  style: TextStyle(
                    fontSize: 22,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                    letterSpacing: 1.2,
                  ),
                ),
                const SizedBox(height: 10),
                // 频率信息
                Container(
                  padding: const EdgeInsets.symmetric(horizontal: 18, vertical: 6),
                  decoration: BoxDecoration(
                    color: Color(0xFF232323),
                    borderRadius: BorderRadius.circular(16),
                  ),
                  child: const Text(
                    '网络直播 905.m3u8',
                    style: TextStyle(fontSize: 15, color: Colors.orange, fontWeight: FontWeight.w500),
                  ),
                ),
                const SizedBox(height: 24),
                const Text(
                  '点击中间圆盘播放/暂停',
                  style: TextStyle(fontSize: 15, color: Colors.white54),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
} 