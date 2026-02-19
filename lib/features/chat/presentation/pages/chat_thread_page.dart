import 'package:flutter/material.dart';

class ChatThreadArgs {
  final String name;
  final String subtitle;
  final String tag;
  final bool isOnline;

  ChatThreadArgs({
    required this.name,
    required this.subtitle,
    required this.tag,
    required this.isOnline,
  });
}

class ChatThreadPage extends StatefulWidget {
  final ChatThreadArgs? args;
  const ChatThreadPage({super.key, required this.args});

  @override
  State<ChatThreadPage> createState() => _ChatThreadPageState();
}

class _ChatThreadPageState extends State<ChatThreadPage> {
  final controller = TextEditingController();

  // Demo messages (আপনি backend থেকে replace করবেন)
  final messages = <_Msg>[
    _Msg(text: "Got it! Let’s do a video call after 11 AM.", isMe: false, time: "10:00 AM"),
    _Msg(text: "Okay! Talk to you soon!", isMe: true, time: "10:02 AM"),
    _Msg(text: "Perfect. Please share the site update once ready.", isMe: false, time: "10:03 AM"),
  ];

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  void _send() {
    final t = controller.text.trim();
    if (t.isEmpty) return;
    setState(() {
      messages.add(_Msg(text: t, isMe: true, time: "Now"));
    });
    controller.clear();
  }

  @override
  Widget build(BuildContext context) {
    final a = widget.args ??
        ChatThreadArgs(name: "Employee", subtitle: "Department", tag: "Tag", isOnline: true);

    return Scaffold(
      backgroundColor: const Color(0xFFFFF6F6),
      body: SafeArea(
        child: Column(
          children: [
            _ChatThreadTopBar(
              name: a.name,
              subtitle: a.subtitle,
              tag: a.tag,
              isOnline: a.isOnline,
              onBack: () => Navigator.maybePop(context),
              onMore: () {},
            ),

            Expanded(
              child: ListView.builder(
                padding: const EdgeInsets.fromLTRB(14, 12, 14, 12),
                itemCount: messages.length + 1,
                itemBuilder: (context, i) {
                  if (i == 0) return const _DayPill(text: "Today");
                  final m = messages[i - 1];
                  return Padding(
                    padding: const EdgeInsets.only(bottom: 10),
                    child: _Bubble(msg: m),
                  );
                },
              ),
            ),

            _ComposerBar(
              controller: controller,
              onSend: _send,
              onMic: () {},
              onAttach: () {},
            ),
          ],
        ),
      ),
    );
  }
}

class _Msg {
  final String text;
  final bool isMe;
  final String time;
  _Msg({required this.text, required this.isMe, required this.time});
}

/// ---------- Top Bar (similar to your screenshot style) ----------
class _ChatThreadTopBar extends StatelessWidget {
  final String name;
  final String subtitle;
  final String tag;
  final bool isOnline;
  final VoidCallback onBack;
  final VoidCallback onMore;

  const _ChatThreadTopBar({
    required this.name,
    required this.subtitle,
    required this.tag,
    required this.isOnline,
    required this.onBack,
    required this.onMore,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 86,
      child: Stack(
        children: [
          Positioned.fill(
            child: Container(
              decoration: const BoxDecoration(
                gradient: LinearGradient(
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                  colors: [
                    Color(0xFFE35A5A),
                    Color(0xFFD94141),
                    Color(0xFFC93B3B),
                  ],
                ),
              ),
            ),
          ),

          // soft arc bottom
          Align(
            alignment: Alignment.bottomCenter,
            child: Container(
              height: 22,
              decoration: const BoxDecoration(
                color: Color(0xFFFFF6F6),
                borderRadius: BorderRadius.vertical(top: Radius.elliptical(420, 110)),
              ),
            ),
          ),

          SafeArea(
            bottom: false,
            child: Padding(
              padding: const EdgeInsets.fromLTRB(10, 6, 10, 0),
              child: Row(
                children: [
                  IconButton(
                    onPressed: onBack,
                    icon: const Icon(Icons.arrow_back_ios_new_rounded, color: Colors.white, size: 18),
                  ),

                  // avatar + presence
                  Stack(
                    children: [
                      const CircleAvatar(
                        radius: 20,
                        backgroundColor: Color(0x22FFFFFF),
                        child: Icon(Icons.person_rounded, color: Colors.white),
                      ),
                      Positioned(
                        right: 0,
                        bottom: 0,
                        child: Container(
                          width: 10,
                          height: 10,
                          decoration: BoxDecoration(
                            color: isOnline ? const Color(0xFF2F7D3B) : const Color(0xFFB0B0B0),
                            borderRadius: BorderRadius.circular(99),
                            border: Border.all(color: Colors.white, width: 2),
                          ),
                        ),
                      ),
                    ],
                  ),

                  const SizedBox(width: 10),

                  Expanded(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          name,
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                          style: const TextStyle(
                            color: Colors.white,
                            fontSize: 15,
                            fontWeight: FontWeight.w900,
                          ),
                        ),
                        const SizedBox(height: 2),
                        Row(
                          children: [
                            Expanded(
                              child: Text(
                                subtitle,
                                maxLines: 1,
                                overflow: TextOverflow.ellipsis,
                                style: const TextStyle(
                                  color: Color(0xFFFFE7E7),
                                  fontSize: 12,
                                  fontWeight: FontWeight.w700,
                                ),
                              ),
                            ),
                            const SizedBox(width: 8),
                            _MiniTag(text: tag),
                          ],
                        ),
                      ],
                    ),
                  ),

                  IconButton(
                    onPressed: onMore,
                    icon: const Icon(Icons.more_vert_rounded, color: Colors.white),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class _MiniTag extends StatelessWidget {
  final String text;
  const _MiniTag({required this.text});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
      decoration: BoxDecoration(
        color: Colors.white.withOpacity(0.20),
        borderRadius: BorderRadius.circular(999),
        border: Border.all(color: Colors.white.withOpacity(0.18)),
      ),
      child: Text(
        text,
        style: const TextStyle(color: Colors.white, fontSize: 10.5, fontWeight: FontWeight.w900),
      ),
    );
  }
}

/// ---------- Day pill ----------
class _DayPill extends StatelessWidget {
  final String text;
  const _DayPill({required this.text});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        margin: const EdgeInsets.only(bottom: 12),
        padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(999),
          boxShadow: const [
            BoxShadow(color: Color(0x12000000), blurRadius: 14, offset: Offset(0, 8)),
          ],
        ),
        child: Text(
          text,
          style: const TextStyle(
            color: Color(0xFF8B5C5C),
            fontWeight: FontWeight.w900,
            fontSize: 12,
          ),
        ),
      ),
    );
  }
}

/// ---------- Bubble ----------
class _Bubble extends StatelessWidget {
  final _Msg msg;
  const _Bubble({required this.msg});

  @override
  Widget build(BuildContext context) {
    final isMe = msg.isMe;

    return Align(
      alignment: isMe ? Alignment.centerRight : Alignment.centerLeft,
      child: ConstrainedBox(
        constraints: const BoxConstraints(maxWidth: 260),
        child: Container(
          padding: const EdgeInsets.fromLTRB(12, 10, 12, 10),
          decoration: BoxDecoration(
            color: isMe ? const Color(0x22D94141) : Colors.white,
            borderRadius: BorderRadius.circular(16).copyWith(
              bottomLeft: Radius.circular(isMe ? 16 : 6),
              bottomRight: Radius.circular(isMe ? 6 : 16),
            ),
            border: Border.all(color: const Color(0x11D94141)),
            boxShadow: const [
              BoxShadow(color: Color(0x0E000000), blurRadius: 12, offset: Offset(0, 8)),
            ],
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              Text(
                msg.text,
                style: const TextStyle(
                  color: Color(0xFF7E2A2A),
                  fontWeight: FontWeight.w700,
                  height: 1.25,
                ),
              ),
              const SizedBox(height: 6),
              Text(
                msg.time,
                style: const TextStyle(
                  color: Color(0xFFB48E8E),
                  fontWeight: FontWeight.w800,
                  fontSize: 10.5,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

/// ---------- Composer ----------
class _ComposerBar extends StatelessWidget {
  final TextEditingController controller;
  final VoidCallback onSend;
  final VoidCallback onMic;
  final VoidCallback onAttach;

  const _ComposerBar({
    required this.controller,
    required this.onSend,
    required this.onMic,
    required this.onAttach,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.fromLTRB(12, 10, 12, 12),
      decoration: const BoxDecoration(
        color: Color(0xFFFFF6F6),
        boxShadow: [
          BoxShadow(color: Color(0x12000000), blurRadius: 16, offset: Offset(0, -8)),
        ],
      ),
      child: Row(
        children: [
          _CircleBtn(icon: Icons.attach_file_rounded, onTap: onAttach),
          const SizedBox(width: 10),

          Expanded(
            child: Container(
              height: 44,
              padding: const EdgeInsets.symmetric(horizontal: 12),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(18),
                border: Border.all(color: const Color(0x11D94141)),
              ),
              child: Row(
                children: [
                  const Icon(Icons.message_rounded, color: Color(0xFFB48E8E), size: 18),
                  const SizedBox(width: 8),
                  Expanded(
                    child: TextField(
                      controller: controller,
                      decoration: const InputDecoration(
                        hintText: "Message",
                        border: InputBorder.none,
                        hintStyle: TextStyle(
                          color: Color(0xFFB48E8E),
                          fontWeight: FontWeight.w700,
                        ),
                      ),
                      onSubmitted: (_) => onSend(),
                    ),
                  ),
                ],
              ),
            ),
          ),

          const SizedBox(width: 10),
          _CircleBtn(icon: Icons.mic_rounded, onTap: onMic),
          const SizedBox(width: 10),
          _SendBtn(onTap: onSend),
        ],
      ),
    );
  }
}

class _CircleBtn extends StatelessWidget {
  final IconData icon;
  final VoidCallback onTap;
  const _CircleBtn({required this.icon, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      borderRadius: BorderRadius.circular(999),
      child: Container(
        width: 42,
        height: 42,
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(999),
          border: Border.all(color: const Color(0x11D94141)),
        ),
        child: Icon(icon, color: const Color(0xFFD94141), size: 20),
      ),
    );
  }
}

class _SendBtn extends StatelessWidget {
  final VoidCallback onTap;
  const _SendBtn({required this.onTap});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      borderRadius: BorderRadius.circular(14),
      child: Container(
        width: 46,
        height: 42,
        decoration: BoxDecoration(
          color: const Color(0xFFD94141),
          borderRadius: BorderRadius.circular(14),
        ),
        child: const Icon(Icons.send_rounded, color: Colors.white, size: 18),
      ),
    );
  }
}
