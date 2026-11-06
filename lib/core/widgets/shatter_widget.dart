import 'dart:math' as math;
import 'dart:ui' as ui;

import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';

class ShatterWidget extends StatefulWidget {
  const ShatterWidget({
    super.key,
    required this.child,
    this.onCompleted,
    this.columns = 16,
    this.rows = 10,
    this.duration = const Duration(milliseconds: 900),
    this.origin = Alignment.topRight, // where the explosion starts
    this.gravity = 220,
  });

  final Widget child;
  final VoidCallback? onCompleted;
  final int columns;
  final int rows;
  final Duration duration;
  final Alignment origin;
  final double gravity;

  @override
  State<ShatterWidget> createState() => ShatterWidgetState();
}

class ShatterWidgetState extends State<ShatterWidget>
    with SingleTickerProviderStateMixin {
  final _boundaryKey = GlobalKey();
  late final AnimationController _controller;

  ui.Image? _image;
  Size _size = Size.zero;
  List<_Fragment> _fragments = const [];
  bool _isShattering = false;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(vsync: this, duration: widget.duration);
  }

  @override
  void dispose() {
    _controller.dispose();
    _image?.dispose();
    super.dispose();
  }

  Future<void> shatter() async {
    if (_isShattering) return;
    _isShattering = true;

    final boundary =
        _boundaryKey.currentContext?.findRenderObject()
            as RenderRepaintBoundary?;
if (boundary == null) {
      _isShattering = false;
      return;
    }
    final pixelRatio = MediaQuery.of(context).devicePixelRatio;
    final image = await boundary.toImage(pixelRatio: pixelRatio);
    if (!mounted) {
      image.dispose();
      return;
    }

    setState(() {
      _image = image;
      _size = boundary.size;
      _fragments = _buildFragments(boundary.size, image);
    });

    await _controller.forward();
    if (mounted) widget.onCompleted?.call();
  }

  List<_Fragment> _buildFragments(Size size, ui.Image image) {
    final rnd = math.Random();
    final cellW = size.width / widget.columns;
    final cellH = size.height / widget.rows;
    final srcW = image.width / widget.columns;
    final srcH = image.height / widget.rows;
    final origin = widget.origin.alongSize(size);
    final maxDist = math.sqrt(
      size.width * size.width + size.height * size.height,
    );

    final fragments = <_Fragment>[];
    for (var r = 0; r < widget.rows; r++) {
      for (var c = 0; c < widget.columns; c++) {
        final center = Offset((c + 0.5) * cellW, (r + 0.5) * cellH);
        var dir = center - origin;
        final dist = dir.distance;
        dir = dist == 0
            ? Offset.fromDirection(rnd.nextDouble() * 2 * math.pi)
            : dir / dist;

        final speed = 140 + rnd.nextDouble() * 280;
        final jitter = Offset.fromDirection(
          rnd.nextDouble() * 2 * math.pi,
          rnd.nextDouble() * 90,
        );

        fragments.add(
          _Fragment(
            src: Rect.fromLTWH(c * srcW, r * srcH, srcW, srcH),
            center: center,
            velocity: dir * speed + jitter,
            // Pieces near the origin go first -> shockwave feel.
            delay: (dist / maxDist) * 0.3 + rnd.nextDouble() * 0.05,
            rotation: (rnd.nextDouble() - 0.5) * 4 * math.pi,
          ),
        );
      }
    }
    return fragments;
  }

  @override
  Widget build(BuildContext context) {
    if (_image == null) {
      return RepaintBoundary(key: _boundaryKey, child: widget.child);
    }
    return SizedBox(
      width: _size.width,
      height: _size.height,
      child: CustomPaint(
        painter: _ShatterPainter(
          image: _image!,
          fragments: _fragments,
          progress: _controller,
          cellSize: Size(
            _size.width / widget.columns,
            _size.height / widget.rows,
          ),
          gravity: widget.gravity,
        ),
      ),
    );
  }
}

class _Fragment {
  const _Fragment({
    required this.src,
    required this.center,
    required this.velocity,
    required this.delay,
    required this.rotation,
  });

  final Rect src;
  final Offset center;
  final Offset velocity;
  final double delay;
  final double rotation;
}

class _ShatterPainter extends CustomPainter {
  _ShatterPainter({
    required this.image,
    required this.fragments,
    required this.progress,
    required this.cellSize,
    required this.gravity,
  }) : super(repaint: progress);

  final ui.Image image;
  final List<_Fragment> fragments;
  final Animation<double> progress;
  final Size cellSize;
  final double gravity;

  @override
  void paint(Canvas canvas, Size size) {
    final t = progress.value;
    final paint = Paint()..filterQuality = FilterQuality.low;
    // Slight overdraw hides hairline seams between cells at t = 0.
    final dst = Rect.fromCenter(
      center: Offset.zero,
      width: cellSize.width + 0.6,
      height: cellSize.height + 0.6,
    );

    for (final f in fragments) {
      final lt = ((t - f.delay) / (1 - f.delay)).clamp(0.0, 1.0);
      final moved = Curves.easeOutCubic.transform(lt);
      final opacity = 1.0 - Curves.easeIn.transform(lt);
      if (opacity <= 0) continue;

      final pos = f.center + f.velocity * moved + Offset(0, gravity * lt * lt);

      paint.color = Color.fromRGBO(255, 255, 255, opacity);
      canvas.save();
      canvas.translate(pos.dx, pos.dy);
      canvas.rotate(f.rotation * moved);
      canvas.scale(1.0 - 0.6 * lt);
      canvas.drawImageRect(image, f.src, dst, paint);
      canvas.restore();
    }
  }

  @override
  bool shouldRepaint(_ShatterPainter old) =>
      old.image != image || old.fragments != fragments;
}
