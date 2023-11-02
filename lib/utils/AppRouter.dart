
import 'package:go_router/go_router.dart';
import 'package:task_2/Ui/pages/news.dart';
import '../Ui/pages/home.dart';
import '../../utils/routing constants.dart';

class AppRouter {
  final GoRouter router = GoRouter(
    initialLocation: "/",
      routes: <RouteBase>[
        GoRoute(path: '/',
          builder: (context, state)=> const HomePage()
        ),
        GoRoute(path: nasaNews,
            builder: (context, state)=>const news()
        ),],

        errorBuilder: (context, state) {
          return  const HomePage();
        },

      );
}
