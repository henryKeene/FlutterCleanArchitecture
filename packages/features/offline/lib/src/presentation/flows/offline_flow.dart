import 'package:flutter/material.dart';
import 'package:lego_architecture_demo_mason/app/extensions/build_context_extensions.dart';
import 'package:offline/src/presentation/views/pages/offline_page.dart';

class OfflineFlow extends StatefulWidget {
  const OfflineFlow({super.key});

  @override
  State<OfflineFlow> createState() => _OfflineFlowState();
}

class _OfflineFlowState extends State<OfflineFlow> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.transparent,
      body: GestureDetector(
        onTap: () => context.navigator.pop(),
        child: Container(
          height: context.height,
          color: Colors.transparent,
          child: NotificationListener<DraggableScrollableNotification>(
            onNotification: (notification) {
              if (notification.extent <= notification.minExtent) {
                context.navigator.pop();
              }
              return true;
            },
            child: DraggableScrollableSheet(
              initialChildSize: 0.3,
              maxChildSize: 0.3,
              builder: (_, controller) {
                return GestureDetector(
                  onTap:
                      () {}, // Prevents taps from dismissing the bottom sheet
                  child: Container(
                    decoration: BoxDecoration(
                      color: Theme.of(context).scaffoldBackgroundColor,
                      borderRadius:
                          const BorderRadius.vertical(top: Radius.circular(16)),
                    ),
                    child: SingleChildScrollView(
                      controller: controller,
                      physics: const ClampingScrollPhysics(),
                      child: Column(
                        children: [
                          Container(
                            width: 40,
                            height: 4,
                            margin: const EdgeInsets.symmetric(vertical: 8),
                            decoration: BoxDecoration(
                              color: Colors.grey[300],
                              borderRadius: BorderRadius.circular(2),
                            ),
                          ),
                          const OfflinePage(),
                        ],
                      ),
                    ),
                  ),
                );
              },
            ),
          ),
        ),
      ),
    );
  }
}
