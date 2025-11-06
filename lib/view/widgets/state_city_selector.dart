import 'package:flutter/material.dart';
import 'package:country_state_city/country_state_city.dart' as csc;
import 'package:structure_mvvm/res/colors/app_colors.dart';
import 'package:structure_mvvm/res/log/app_logger.dart';

import '../components/dropdown/custom_dropdown.dart';

class StateCitySelector extends StatefulWidget {
  final String countryCode; // e.g. "US", "PK", "IN"
  final String? initailState;
  final String? initailCity;
  final Color? fillColor;
  final Function(String state, String city) onChanged;

  const StateCitySelector({
    super.key,
    required this.countryCode,
    required this.onChanged,
    this.initailCity,
    this.fillColor,
    this.initailState,
  });

  @override
  State<StateCitySelector> createState() => _StateCitySelectorState();
}

class _StateCitySelectorState extends State<StateCitySelector> {
  List<String> states = [];
  List<String> cities = [];
  String? selectedState;
  String? selectedCity;
  bool isLoadingStates = true;
  bool isLoadingCities = false;

  @override
  void initState() {
    super.initState();
    if (widget.initailState != null) {
      selectedState = widget.initailState;
      AppLogger.info("i am here ");
      _loadCities(selectedState!);
    }
    if (widget.initailCity != null) selectedCity = widget.initailCity;

    _loadStates();
  }

  Future<void> _loadStates() async {
    setState(() => isLoadingStates = true);
    try {
      final fetchedStates = await csc.getStatesOfCountry(widget.countryCode);
      setState(() {
        states = fetchedStates.map((e) => e.name).toList();
      });
    } catch (e) {
      debugPrint("Error fetching states: $e");
    } finally {
      setState(() => isLoadingStates = false);
    }
  }

  Future<void> _loadCities(String stateName) async {
    setState(() {
      isLoadingCities = true;
      cities = [];
      selectedCity = null;
    });

    try {
      final stateModel = (await csc.getStatesOfCountry(
        widget.countryCode,
      )).firstWhere((e) => e.name == stateName);
      final fetchedCities = await csc.getStateCities(
        widget.countryCode,
        stateModel.isoCode,
      );
      setState(() {
        cities = fetchedCities.map((e) => e.name).toList();
      });
    } catch (e) {
      debugPrint("Error fetching cities: $e");
    } finally {
      setState(() => isLoadingCities = false);
    }
  }

  Widget _buildDropdown({
    required String hint,
    required String? value,
    required List<String> items,
    required Function(String?) onChanged,
    required bool isLoading,
  }) {
    return Expanded(
      child: CustomDropdown<String>(
        hintText: hint,
        value: value,
        items: items,
        onChanged: onChanged,
        itemBuilder: (item) => item,
        isLoading: isLoading,
        fillColor: widget.fillColor ?? AppColors.intputBgColor2,
        borderColor: Colors.transparent,

        boxShadow: false,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        _buildDropdown(
          hint: "Select State",
          value: selectedState,
          items: states,
          isLoading: isLoadingStates,
          onChanged: (value) {
            setState(() {
              selectedState = value;
              selectedCity = null;
              cities.clear();
            });
            if (value != null) _loadCities(value);
          },
        ),
        const SizedBox(width: 10),
        _buildDropdown(
          hint: "Select City",
          value: selectedCity,
          items: cities,
          isLoading: isLoadingCities,
          onChanged: (value) {
            setState(() => selectedCity = value);
            if (selectedState != null && selectedCity != null) {
              widget.onChanged(selectedState!, selectedCity!);
            }
          },
        ),
      ],
    );
  }
}
