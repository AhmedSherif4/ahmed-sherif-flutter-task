part of '../home_layout.dart';

class CustomBottomNavBar extends StatelessWidget {
  const CustomBottomNavBar({super.key});

  @override
  Widget build(BuildContext context) {
    final Map<String, String> appIcons = {
      'الرئيسية': Assets.iconsHomeNavBar,
      'محادثة': Assets.iconsChatNavBar,
      'أضف أعلان': Assets.iconsAddBoxNavBar,
      'أعلاناتى': Assets.iconsMyAdsNavBar,
      'حسابى': Assets.iconsAccountCircleNavBar,
    };

    return Container(
      decoration: BoxDecoration(
        border: Border(top: BorderSide(color: Colors.grey, width: 1)),
      ),
      padding: EdgeInsets.symmetric(horizontal: Spacing.s5),
      height: Spacing.navBarH,
      child: BlocBuilder<HomeLayoutBloc, HomeLayoutState>(
        builder: (context, state) {
          return Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: List.generate(appIcons.length, (index) {
              return InkWell(
                onTap: () {
                  context.read<HomeLayoutBloc>().add(
                    ChangeBottomNavBarIndexEvent(index),
                  );
                },
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    SvgPicture.asset(
                      appIcons.values.elementAt(index),
                      width: Spacing.iconSize,
                      height: Spacing.iconSize,
                      fit: BoxFit.contain,
                      colorFilter:
                          context.read<HomeLayoutBloc>().state.index == index
                          ? ColorFilter.mode(
                              context.colors.black,
                              BlendMode.srcIn,
                            )
                          : ColorFilter.mode(
                              context.colors.gray,
                              BlendMode.srcIn,
                            ),
                    ),
                    Text(
                      appIcons.keys.elementAt(index),
                      style: context.typography.caption.copyWith(
                        color:
                            context.read<HomeLayoutBloc>().state.index == index
                            ? context.colors.black
                            : context.colors.gray,
                      ),
                    ),
                  ],
                ),
              );
            }),
          );
        },
      ),
    );
  }
}
