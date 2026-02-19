import 'package:flutter/material.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.sizeOf(context);

    return Scaffold(
      body: Container(
        width: double.infinity,
        height: double.infinity,
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [
              Color(0xFFFFF6F6),
              Color(0xFFFFEFEF),
            ],
          ),
        ),
        child: SafeArea(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 18),
            child: Column(
              children: [
                const SizedBox(height: 18),

                // ✅ Brand top center
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: const [
                    _LogoMark(),
                    SizedBox(width: 10),
                    Text(
                      'Alapon',
                      style: TextStyle(
                        fontSize: 22,
                        fontWeight: FontWeight.w800,
                        color: Color(0xFFD94141),
                        letterSpacing: 0.2,
                      ),
                    ),
                  ],
                ),

                const SizedBox(height: 18),

                // ✅ Title close to image
                const Text(
                  'Connect & Chat with\nPower Grid Employees',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 22,
                    height: 1.18,
                    fontWeight: FontWeight.w900,
                    color: Color(0xFF7E2A2A),
                  ),
                ),


                // ✅ Image takes full width and stays centered
                Expanded(
                  child: Center(
                    child: SizedBox(
                      width: MediaQuery.of(context).size.width > 360
                          ? 360
                          : MediaQuery.of(context).size.width * 0.95,
                      child: Image.asset(
                        'assets/images/splash_illustration.png',
                        fit: BoxFit.contain,
                      ),
                    ),
                  ),
                ),

                const SizedBox(height: 10),

                const Text(
                  'Build your network\nwithin your organization',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 16,
                    height: 1.35,
                    fontWeight: FontWeight.w700,
                    color: Color(0xFF8B5C5C),
                  ),
                ),

                const SizedBox(height: 16),

                _BottomBrandBar(
                  onPrivacyTap: () {
                    // TODO: open privacy
                  },
                ),

                const SizedBox(height: 10),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

// ✅ Logo mark same
class _LogoMark extends StatelessWidget {
  const _LogoMark();

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 34,
      height: 34,
      decoration: BoxDecoration(
        color: const Color(0xFFD94141),
        borderRadius: BorderRadius.circular(10),
        boxShadow: const [
          BoxShadow(
            color: Color(0x33D94141),
            blurRadius: 14,
            offset: Offset(0, 6),
          )
        ],
      ),
      child: const Icon(
        Icons.bolt_rounded,
        color: Colors.white,
        size: 20,
      ),
    );
  }
}

// ✅ Bottom bar same
class _BottomBrandBar extends StatelessWidget {
  final VoidCallback onPrivacyTap;

  const _BottomBrandBar({required this.onPrivacyTap});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          width: 58,
          height: 58,
          decoration: BoxDecoration(
            color: const Color(0xFFD94141),
            borderRadius: BorderRadius.circular(18),
            boxShadow: const [
              BoxShadow(
                color: Color(0x33D94141),
                blurRadius: 18,
                offset: Offset(0, 10),
              ),
            ],
          ),
          child: const Icon(
            Icons.bolt_rounded,
            color: Colors.white,
            size: 30,
          ),
        ),
        const SizedBox(height: 12),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text(
              'We value your ',
              style: TextStyle(
                fontSize: 12,
                color: Color(0xFF9B7A7A),
                fontWeight: FontWeight.w700,
              ),
            ),
            InkWell(
              onTap: onPrivacyTap,
              borderRadius: BorderRadius.circular(10),
              child: const Padding(
                padding: EdgeInsets.symmetric(horizontal: 4, vertical: 2),
                child: Text(
                  'Privacy',
                  style: TextStyle(
                    fontSize: 12,
                    color: Color(0xFFD94141),
                    fontWeight: FontWeight.w900,
                    decoration: TextDecoration.underline,
                  ),
                ),
              ),
            ),
          ],
        ),
      ],
    );
  }
}
