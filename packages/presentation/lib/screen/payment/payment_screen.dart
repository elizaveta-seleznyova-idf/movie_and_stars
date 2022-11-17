import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:presentation/base/bloc_data.dart';
import 'package:presentation/base/bloc_screen.dart';
import 'package:presentation/config/dimens/dimens.dart';
import 'package:presentation/config/input_formatters/input_formatters.dart';
import 'package:presentation/config/text_style/text_style.dart';
import 'package:presentation/config/theme/app_colors.dart';
import 'package:presentation/generated_localization/l10n.dart';
import 'package:presentation/navigation/base_arguments.dart';
import 'package:presentation/navigation/base_page.dart';
import 'package:presentation/screen/payment/payment_bloc.dart';
import 'package:presentation/screen/payment/payment_data.dart';

class PaymentScreenArguments extends BaseArguments {
  PaymentScreenArguments({super.result});
}

class PaymentScreen extends StatefulWidget {
  const PaymentScreen({super.key});

  static const _routeName = '/PaymentScreen';

  static BasePage page(PaymentScreenArguments arguments) => BasePage(
        key: const ValueKey(_routeName),
        name: _routeName,
        builder: (context) => const PaymentScreen(),
        showSlideAnim: true,
        arguments: arguments,
        isButtonNavBarActive: true,
      );

  @override
  State<PaymentScreen> createState() => _PaymentScreenState();
}

class _PaymentScreenState extends BlocScreenState<PaymentScreen, PaymentBloc> {
  final String phoneNumberHintText = '+375 (XX) XXX-XX-XX';
  final String cardNumberHintText = 'XXXX XXXX XXXX XXXX';
  final String dateExpireHintText = 'MM/YY';
  final String cvvHintText = 'XXX';

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    return StreamBuilder<BlocData<PaymentData?>>(
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
                  SM.current.paymentTitle,
                  style: AppTextStyles.sfProSemiBold24px,
                ),
              ),
            ),
            body: Form(
              key: bloc.ticketsScreenFormKey,
              autovalidateMode: AutovalidateMode.onUserInteraction,
              child: Padding(
                padding: const EdgeInsets.only(
                  left: Dimens.size26,
                  right: Dimens.size25,
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Expanded(
                      flex: 1,
                      child: SizedBox.shrink(),
                    ),
                    // PaymentTextField(
                    //   titleText: SM.current.phoneNumber,
                    //   textFieldWidth: width,
                    //   controller: bloc.phoneNumberController,
                    //   formatter: PhoneNumberInputFormatter(),
                    //   lengthLimit: 14,
                    //   isObscureText: false,
                    //   hintText: phoneNumberHintText,
                    //   onChanged: null,
                    //   validator: null,
                    // ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          SM.current.phoneNumber,
                          style: AppTextStyles.sfProRegularSelected14px,
                        ),
                        const SizedBox(height: Dimens.size10),
                        TextFormField(
                          controller: bloc.phoneNumberController,
                          keyboardType: TextInputType.number,
                          autocorrect: false,
                          enableSuggestions: false,
                          cursorColor: Colors.white,
                          style: const TextStyle(
                            color: AppColorsDark.unselectedColor,
                          ),
                          inputFormatters: [
                            FilteringTextInputFormatter.digitsOnly,
                            PhoneNumberInputFormatter(),
                            LengthLimitingTextInputFormatter(14),
                          ],
                          onChanged: null,
                          validator: null,
                          decoration: InputDecoration(
                            hintText: phoneNumberHintText,
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
                        const SizedBox(height: Dimens.size24),
                        // PaymentTextField(
                        //   titleText: SM.current.cardNumber,
                        //   textFieldWidth: width,
                        //   controller: bloc.cardNumberController,
                        //   formatter: CardNumberInputFormatter(),
                        //   lengthLimit: 19,
                        //   isObscureText: true,
                        //   hintText: cardNumberHintText,
                        //   onChanged: null,
                        //   validator: null,
                        // ),
                        Text(
                          SM.current.cardNumber,
                          style: AppTextStyles.sfProRegularSelected14px,
                        ),
                        const SizedBox(height: Dimens.size10),
                        TextFormField(
                          controller: bloc.cardNumberController,
                          keyboardType: TextInputType.number,
                          autocorrect: false,
                          enableSuggestions: false,
                          cursorColor: Colors.white,
                          style: const TextStyle(
                            color: AppColorsDark.unselectedColor,
                          ),
                          inputFormatters: [
                            FilteringTextInputFormatter.digitsOnly,
                            CardNumberInputFormatter(),
                            LengthLimitingTextInputFormatter(19),
                          ],
                          onChanged: null,
                          validator: null,
                          decoration: InputDecoration(
                            hintText: cardNumberHintText,
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
                        const SizedBox(height: Dimens.size24),
                        Row(
                          children: [
                            // PaymentTextField(
                            //   titleText: SM.current.dateExpire,
                            //   textFieldWidth: Dimens.size100,
                            //   controller: bloc.dateExpireController,
                            //   formatter: DateExpireInputFormatter(),
                            //   lengthLimit: 5,
                            //   isObscureText: false,
                            //   hintText: dateExpireHintText,
                            //   onChanged: null,
                            //   validator: null,
                            // ),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  SM.current.dateExpire,
                                  style: AppTextStyles.sfProRegularSelected14px,
                                ),
                                const SizedBox(height: Dimens.size10),
                                SizedBox(
                                  width: Dimens.size100,
                                  child: TextFormField(
                                    controller: bloc.dateExpireController,
                                    keyboardType: TextInputType.number,
                                    autocorrect: false,
                                    enableSuggestions: false,
                                    cursorColor: Colors.white,
                                    style: const TextStyle(
                                      color: AppColorsDark.unselectedColor,
                                    ),
                                    inputFormatters: [
                                      FilteringTextInputFormatter.digitsOnly,
                                      DateExpireInputFormatter(),
                                      LengthLimitingTextInputFormatter(5),
                                    ],
                                    onChanged: null,
                                    validator: null,
                                    decoration: InputDecoration(
                                      hintText: dateExpireHintText,
                                      filled: true,
                                      fillColor: AppColorsDark.secondaryColor,
                                      contentPadding:
                                          const EdgeInsets.symmetric(
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
                            const SizedBox(width: Dimens.size24),
                            // PaymentTextField(
                            //   titleText: SM.current.cvv,
                            //   textFieldWidth: Dimens.size60,
                            //   controller: bloc.cvvController,
                            //   formatter: CvvInputFormatter(),
                            //   lengthLimit: 4,
                            //   isObscureText: true,
                            //   hintText: cvvHintText,
                            //   onChanged: null,
                            //   validator: null,
                            // ),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  SM.current.cvv,
                                  style: AppTextStyles.sfProRegularSelected14px,
                                ),
                                const SizedBox(height: Dimens.size10),
                                SizedBox(
                                  width: Dimens.size60,
                                  child: TextFormField(
                                    controller: bloc.cvvController,
                                    keyboardType: TextInputType.number,
                                    autocorrect: false,
                                    enableSuggestions: false,
                                    cursorColor: Colors.white,
                                    style: const TextStyle(
                                      color: AppColorsDark.unselectedColor,
                                    ),
                                    inputFormatters: [
                                      FilteringTextInputFormatter.digitsOnly,
                                      CvvInputFormatter(),
                                      LengthLimitingTextInputFormatter(4),
                                    ],
                                    onChanged: null,
                                    validator: null,
                                    decoration: InputDecoration(
                                      hintText: cvvHintText,
                                      filled: true,
                                      fillColor: AppColorsDark.secondaryColor,
                                      contentPadding:
                                          const EdgeInsets.symmetric(
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
                    Expanded(
                      flex: 1,
                      child: Column(
                        children: [
                          const Expanded(
                            flex: 1,
                            child: SizedBox.shrink(),
                          ),
                          SizedBox(
                            width: width,
                            height: Dimens.size48,
                            child: ElevatedButton(
                              onPressed: null,
                              style: ButtonStyle(
                                backgroundColor: MaterialStateProperty.all(
                                  AppColorsDark.primaryColor,
                                ),
                              ),
                              child: Text(
                                SM.current.placeOrder,
                                style: AppTextStyles.sfProRegularUnselected16px,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(height: Dimens.size34)
                  ],
                ),
              ),
            ),
          );
        });
  }
}
