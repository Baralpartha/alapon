import 'package:flutter/material.dart';

class AuthBackground extends StatelessWidget {
  final Widget child;
  final String bottomAsset;
  final double bottomHeight;

  const AuthBackground({
    super.key,
    required this.child,
    required this.bottomAsset,
    this.bottomHeight = 190,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: LayoutBuilder(
        builder: (context, constraints) {
          return Container(
            width: double.infinity,
            height: double.infinity,
            decoration: const BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                colors: [Color(0xFFFFF6F6), Color(0xFFFFEFEF)],
              ),
            ),
            child: SafeArea(
              child: Stack(
                children: [
                  // শুধুমাত্র নিচের ডান পাশের ডেকোরেশন রাখা হয়েছে
                  Positioned(
                    bottom: -100,
                    right: -80,
                    child: _SoftCircle(size: 280),
                  ),

                  // মেইন ফর্ম স্ক্রল এরিয়া
                  Positioned.fill(
                    child: SingleChildScrollView(
                      physics: const BouncingScrollPhysics(),
                      child: ConstrainedBox(
                        constraints: BoxConstraints(
                          minHeight: constraints.maxHeight - MediaQuery.of(context).padding.top,
                        ),
                        child: child,
                      ),
                    ),
                  ),

                  // বটম ইমেজ
                  Positioned(
                    left: 0,
                    right: 0,
                    bottom: 0,
                    child: SizedBox(
                      height: bottomHeight,
                      child: Image.asset(
                        bottomAsset,
                        width: double.infinity,
                        fit: BoxFit.fitWidth,
                        alignment: Alignment.bottomCenter,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}

class _SoftCircle extends StatelessWidget {
  final double size;
  const _SoftCircle({required this.size});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: size,
      height: size,
      decoration: const BoxDecoration(
        shape: BoxShape.circle,
        color: Color(0x1FD94141),
      ),
    );
  }
}