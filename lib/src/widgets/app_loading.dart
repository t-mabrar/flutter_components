import 'package:flutter/material.dart';
import 'package:flutter_components/src/core/app_imports.dart';

class AppLoading extends StatefulWidget {
  final double? size;
  final Color? color;
  final bool _showLogo;
  final bool showWaitingContent;

  const AppLoading({
    super.key,
    this.size,
    this.color,
    this.showWaitingContent = true,
  }) : _showLogo = false;

  const AppLoading._internal({
    this.size,
    this.color,
    required bool showLogo,
    required this.showWaitingContent,
  }) : _showLogo = showLogo;

  factory AppLoading.logo({
    final double? size,
    final Color? color,
    final bool? showWaitingContent,
  }) {
    return AppLoading._internal(
      size: size,
      color: color,
      showLogo: true,
      showWaitingContent: showWaitingContent ?? true,
    );
  }

  @override
  State<AppLoading> createState() => _AppLoadingState();
}

class _AppLoadingState extends State<AppLoading>
    with SingleTickerProviderStateMixin {
  bool _showDelayMessage = false;
  late AnimationController _pulseController;

  @override
  void initState() {
    super.initState();

    // Start showing delayed message after 5 seconds
    Future.delayed(const Duration(seconds: 5), () {
      if (mounted) {
        setState(() {
          _showDelayMessage = true;
        });
      }
    });

    // Pulse animation
    _pulseController = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 2),
    )..repeat(reverse: true);
  }

  @override
  void dispose() {
    _pulseController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final primaryColor = widget.color ?? context.primaryColor;
    final spinner = CircularProgressIndicator();

    return Center(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          if (widget._showLogo) ...[
            ScaleTransition(
              scale: Tween(begin: 1.0, end: 1.05).animate(CurvedAnimation(
                parent: _pulseController,
                curve: Curves.easeInOut,
              )),
              child: Image.asset(
                "",
                scale: 4.0,
              ),
            ),
            const SizedBox(height: 30),
          ],
          spinner,
          if (_showDelayMessage && widget.showWaitingContent) ...[
            const SizedBox(height: 25.0),
            AnimatedOpacity(
              duration: const Duration(milliseconds: 300),
              opacity: _showDelayMessage ? 1.0 : 0.0,
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text(
                    "Still loading...",
                    style: Theme.of(context).textTheme.titleSmall?.copyWith(
                          color: primaryColor,
                          fontWeight: FontWeight.bold,
                        ),
                  ),
                  const SizedBox(height: 8),
                  Text(
                    "Please wait, it's taking more than expected.\nWe appreciate your patience!",
                    style: Theme.of(context).textTheme.bodySmall?.copyWith(
                          color: Colors.grey[600],
                        ),
                    textAlign: TextAlign.center,
                  ),
                ],
              ),
            )
          ],
        ],
      ),
    );
  }
}
