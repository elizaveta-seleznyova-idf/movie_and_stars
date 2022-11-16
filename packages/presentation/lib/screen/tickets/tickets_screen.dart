import 'package:flutter/material.dart';
import 'package:presentation/base/bloc_data.dart';
import 'package:presentation/base/bloc_screen.dart';
import 'package:presentation/config/dimens/dimens.dart';
import 'package:presentation/config/text_style/text_style.dart';
import 'package:presentation/config/theme/app_colors.dart';
import 'package:presentation/generated_localization/l10n.dart';
import 'package:presentation/navigation/base_arguments.dart';
import 'package:presentation/navigation/base_page.dart';
import 'package:presentation/screen/tickets/tickets_bloc.dart';
import 'package:presentation/screen/tickets/tickets_data.dart';

class TicketsScreenArguments extends BaseArguments {
  TicketsScreenArguments({super.result});
}

class TicketsScreen extends StatefulWidget {
  const TicketsScreen({super.key});

  static const _routeName = '/TicketsScreen';

  static BasePage page(TicketsScreenArguments arguments) => BasePage(
        key: const ValueKey(_routeName),
        name: _routeName,
        builder: (context) => const TicketsScreen(),
        showSlideAnim: true,
        arguments: arguments,
        isButtonNavBarActive: true,
      );

  @override
  State<TicketsScreen> createState() => _TicketsScreenState();
}

class _TicketsScreenState extends BlocScreenState<TicketsScreen, TicketsBloc> {
  @override
  Widget build(BuildContext context) {
    return StreamBuilder<BlocData<TicketsData?>>(
        stream: bloc.dataStream,
        builder: (_, snapshot) {
          return Scaffold(
            appBar: AppBar(
              backgroundColor: AppColorsDark.primaryColorDark,
              bottom: PreferredSize(
                preferredSize: const Size.fromHeight(Dimens.size1),
                child: Container(
                  color: AppColorsDark.borderTabBar,
                  height: Dimens.size1,
                ),
              ),
              elevation: Dimens.size0,
              title: Padding(
                padding: const EdgeInsets.only(
                  left: Dimens.size12,
                ),
                child: Text(
                  SM.current.ticketsTitle,
                  style: AppTextStyles.sfProSemiBold24px,
                ),
              ),
            ),
            body: Form(
              key: bloc.ticketsScreenFormKey,
              autovalidateMode: AutovalidateMode.onUserInteraction,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    SM.current.cardNumber,
                    style: AppTextStyles.sfProRegularSelected14px,
                  ),
                  TextFormField(
                    controller: bloc.cartNumberController,
                    autocorrect: false,
                    enableSuggestions: false,
                    cursorColor: Colors.white,
                    style: const TextStyle(
                      color: AppColorsDark.unselectedColor,
                    ),
                    onChanged: null,
                    validator: null,
                    decoration: InputDecoration(
                      filled: true,
                      fillColor: AppColorsDark.secondaryColor,
                      contentPadding: const EdgeInsets.symmetric(
                        horizontal: Dimens.size10,
                      ),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(Dimens.size4),
                        borderSide: const BorderSide(
                          width: Dimens.size0,
                          style: BorderStyle.none,
                        ),
                      ),
                    ),
                  ),
                  Row(
                    children: [
                      Column(
                        children: [
                          Text(
                            SM.current.dateExpire,
                            style: AppTextStyles.sfProRegularSelected14px,
                          ),
                          SizedBox(
                            width: Dimens.size100,
                            child: TextFormField(
                              controller: bloc.dateExpireController,
                              autocorrect: false,
                              enableSuggestions: false,
                              cursorColor: Colors.white,
                              style: const TextStyle(
                                color: AppColorsDark.unselectedColor,
                              ),
                              onChanged: null,
                              validator: null,
                              decoration: InputDecoration(
                                filled: true,
                                fillColor: AppColorsDark.secondaryColor,
                                contentPadding: const EdgeInsets.symmetric(
                                  horizontal: Dimens.size10,
                                ),
                                border: OutlineInputBorder(
                                  borderRadius:
                                      BorderRadius.circular(Dimens.size4),
                                  borderSide: const BorderSide(
                                    width: Dimens.size0,
                                    style: BorderStyle.none,
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                      Column(
                        children: [
                          Text(
                            SM.current.cvv,
                            style: AppTextStyles.sfProRegularSelected14px,
                          ),
                          SizedBox(
                            width: Dimens.size60,
                            child: TextFormField(
                              controller: bloc.cvvController,
                              autocorrect: false,
                              enableSuggestions: false,
                              cursorColor: Colors.white,
                              style: const TextStyle(
                                color: AppColorsDark.unselectedColor,
                              ),
                              onChanged: null,
                              validator: null,
                              decoration: InputDecoration(
                                filled: true,
                                fillColor: AppColorsDark.secondaryColor,
                                contentPadding: const EdgeInsets.symmetric(
                                  horizontal: Dimens.size10,
                                ),
                                border: OutlineInputBorder(
                                  borderRadius:
                                      BorderRadius.circular(Dimens.size4),
                                  borderSide: const BorderSide(
                                    width: Dimens.size0,
                                    style: BorderStyle.none,
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ],
              ),
            ),
          );
        });
  }
}
