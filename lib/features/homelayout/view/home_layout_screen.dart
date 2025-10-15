part of '../home_layout.dart';

class HomeLayoutScreen extends StatefulWidget {
  const HomeLayoutScreen({super.key});

  @override
  State<HomeLayoutScreen> createState() => _HomeLayoutScreenState();
}

class _HomeLayoutScreenState extends State<HomeLayoutScreen> {
  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    AppReference.getDeviceInfo(context);
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<HomeLayoutBloc, HomeLayoutState>(
      builder: (context, state) {
        return Scaffold(
          body: context.read<HomeLayoutBloc>().state.appFlow[state.index],
          bottomNavigationBar: CustomBottomNavBar(),
        );
      },
    );
  }
}
