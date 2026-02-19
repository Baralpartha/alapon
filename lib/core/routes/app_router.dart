import 'package:flutter/material.dart';

import '../../features/auth/presentation/pages/login_page.dart';
import '../../features/chat/presentation/pages/chat_list_page.dart';
import '../../features/chat/presentation/pages/chat_thread_page.dart';
import '../../features/contacts/presentation/pages/contacts_page.dart';
import '../../features/employees/presentation/pages/employees_page.dart';
import '../../features/meeting/presentation/pages/meeting_page.dart';
import '../../features/notice/presentation/pages/notice_page.dart';
import '../../features/office/presentation/pages/office_page.dart';
import '../../features/profile/presentation/pages/profile_page.dart';
import '../../features/splash_screen/splash_gate.dart';
import '../../features/home/presentation/pages/home_page.dart';
import '../../features/tasks/presentation/pages/tasks_page.dart';
import 'app_routes.dart';

class AppRouter {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case AppRoutes.splash:
        return MaterialPageRoute(builder: (_) => const SplashGate());

      case AppRoutes.home:
        return MaterialPageRoute(builder: (_) => const HomePage());
      case AppRoutes.login:
        return MaterialPageRoute(builder: (_) => const LoginPage());
      case AppRoutes.chatList:
        return MaterialPageRoute(builder: (_) => const ChatListPage());
      case AppRoutes.profile:
        return MaterialPageRoute(builder: (_) => const ProfilePage());
      case AppRoutes.Employees:
        return MaterialPageRoute(builder: (_) => const EmployeesPage());
      case AppRoutes.Tasks:
        return MaterialPageRoute(builder: (_) => const TasksPage());
      case AppRoutes.meetings:
        return MaterialPageRoute(builder: (_) => const MeetingPage());
      case AppRoutes.office:
        return MaterialPageRoute(builder: (_) => const OfficePage());
      case AppRoutes.Messages:
        return MaterialPageRoute(builder: (_) => const ChatListPage());
      case AppRoutes.notice:
        return MaterialPageRoute(builder: (_) => const NoticePage());
      case AppRoutes.contacts:
        return MaterialPageRoute(builder: (_) => const ContactsPage());
      case AppRoutes.chatThread:
        final args = settings.arguments as ChatThreadArgs?;
        return MaterialPageRoute(
          builder: (_) => ChatThreadPage(args: args),
        );








      default:
        return MaterialPageRoute(
          builder: (_) => const Scaffold(
            body: Center(child: Text('No route found')),
          ),
        );
    }
  }
}
