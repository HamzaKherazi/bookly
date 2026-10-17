import 'package:bookly/constants.dart';
import 'package:bookly/core/utils/service_locator.dart';
import 'package:bookly/features/payment/data/models/city_model.dart';
import 'package:bookly/features/payment/data/repos/city_repo.dart';
import 'package:bookly/features/payment/presentation/view_models/cities_cubit/cities_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CitiesCombobox extends StatelessWidget {
  final CityModel? selectedCity;
  final ValueChanged<CityModel?> onChanged;
  final String label;
  final String hint;
  final IconData icon;
  final String? errorText;

  const CitiesCombobox({
    super.key,
    required this.onChanged,
    this.selectedCity,
    this.label = 'City',
    this.hint = 'Select a city',
    this.icon = Icons.location_city_outlined,
    this.errorText,
  });

  OutlineInputBorder _border(Color color, [double width = 1]) =>
      OutlineInputBorder(
        borderRadius: BorderRadius.circular(10),
        borderSide: BorderSide(color: color, width: width),
      );

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          children: [
            Text(
              label,
              style: TextStyle(
                color: Colors.grey.shade700,
                fontSize: 14,
                fontWeight: FontWeight.w500,
              ),
            ),
            Text(
              ' *',
              style: TextStyle(
                color: Colors.red.shade700,
                fontSize: 14,
                fontWeight: FontWeight.w500,
              ),
            ),
          ],
        ),
        const SizedBox(height: 6),
        BlocProvider(
          create: (context) => CitiesCubit(getIt<CitiesRepo>())..getCities(),
          child: BlocBuilder<CitiesCubit, CitiesState>(
            builder: (context, state) {
              if (state is CitiesSuccess) {
                return DropdownButtonFormField<CityModel>(
                  // Rebuild the field if the selection is changed from outside.
                  key: ValueKey(selectedCity?.cityId),
                  initialValue: selectedCity,
                  isExpanded: true,
                  icon: Icon(
                    Icons.keyboard_arrow_down_rounded,
                    color: Colors.grey.shade600,
                  ),
                  borderRadius: BorderRadius.circular(10),
                  dropdownColor: Colors.white,
                  hint: Text(
                    hint,
                    style: TextStyle(color: Colors.grey.shade400, fontSize: 14),
                  ),
                  items: state.cities
                      .map(
                        (city) => DropdownMenuItem<CityModel>(
                          value: city,
                          child: Text(
                            city.name,
                            overflow: TextOverflow.ellipsis,
                            style: const TextStyle(fontSize: 14),
                          ),
                        ),
                      )
                      .toList(),
                  onChanged: onChanged,
                  validator: (value) => value == null
                      ? 'Please select ${label.toLowerCase()}'
                      : null,
                  decoration: InputDecoration(
                    prefixIcon: Icon(
                      icon,
                      color: kPrimaryColor.withOpacity(0.6),
                      size: 20,
                    ),
                    border: _border(Colors.grey.shade300),
                    enabledBorder: _border(Colors.grey.shade300),
                    focusedBorder: _border(kPrimaryColor, 2),
                    errorBorder: _border(Colors.red.shade700, 2),
                    focusedErrorBorder: _border(Colors.red.shade700, 2),
                    filled: true,
                    fillColor: Colors.grey.shade50,
                    errorText: errorText,
                    errorStyle: TextStyle(
                      color: Colors.red.shade700,
                      fontSize: 12,
                    ),
                    contentPadding: const EdgeInsets.symmetric(
                      horizontal: 16,
                      vertical: 14,
                    ),
                  ),
                );
              }
              return const SizedBox.shrink();
            },
          ),
        ),
      ],
    );
  }
}
