import 'package:bookly/constants.dart';
import 'package:bookly/core/utils/assets.dart';
import 'package:flutter/material.dart';

class LogoSection extends StatelessWidget {
  const LogoSection({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
                height: 220,
                decoration: const BoxDecoration(
                  color: kPrimaryColor,
                  borderRadius: BorderRadius.only(
                    bottomLeft: Radius.circular(60),
                    bottomRight: Radius.circular(60),
                  ),
                ),
                child: Padding(
                  padding: EdgeInsets.only(bottom: 50),
                  child: Center(
                    child: Image.asset(
                      Assets.logoWhite,
                      height: 60,
                      width: MediaQuery.of(context).size.width * .5,
                    ),
                  ),
                ),
              );
  }
}