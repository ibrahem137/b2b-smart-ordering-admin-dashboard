import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';

class StoresToolbar extends StatefulWidget {
  final String? selectedStatus;
  final ValueChanged<String> onSearchChanged;
  final ValueChanged<String?> onStatusChanged;
  final VoidCallback onRefresh;

  const StoresToolbar({
    super.key,
    required this.selectedStatus,
    required this.onSearchChanged,
    required this.onStatusChanged,
    required this.onRefresh,
  });

  @override
  State<StoresToolbar> createState() => _StoresToolbarState();
}

class _StoresToolbarState extends State<StoresToolbar> {
  final TextEditingController _searchController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        final isCompact = constraints.maxWidth < 850;

        final search = TextField(
          controller: _searchController,
          onChanged: (value) {
            setState(() {});
            widget.onSearchChanged(value);
          },
          decoration: InputDecoration(
            hintText: 'stores.search_hint'.tr(),
            prefixIcon: const Icon(Icons.search),
            suffixIcon: _searchController.text.isNotEmpty
                ? IconButton(
                    tooltip: 'common.clear'.tr(),
                    onPressed: () {
                      _searchController.clear();
                      setState(() {});
                      widget.onSearchChanged('');
                    },
                    icon: const Icon(Icons.close),
                  )
                : null,
            border: OutlineInputBorder(borderRadius: BorderRadius.circular(10)),
          ),
        );

        final status = DropdownButtonFormField<String?>(
          initialValue: widget.selectedStatus,
          isExpanded: true,
          decoration: InputDecoration(
            prefixIcon: const Icon(Icons.filter_alt_outlined),
            border: OutlineInputBorder(borderRadius: BorderRadius.circular(10)),
          ),
          items: [
            DropdownMenuItem<String?>(
              value: null,
              child: Text(
                'stores.all_statuses'.tr(),
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
              ),
            ),
            DropdownMenuItem<String?>(
              value: 'active',
              child: Text('stores.status.active'.tr()),
            ),
            DropdownMenuItem<String?>(
              value: 'inactive',
              child: Text('stores.status.inactive'.tr()),
            ),
          ],
          onChanged: widget.onStatusChanged,
        );

        final refresh = IconButton.outlined(
          tooltip: 'common.refresh'.tr(),
          onPressed: widget.onRefresh,
          icon: const Icon(Icons.refresh),
        );

        if (isCompact) {
          return Column(
            children: [
              SizedBox(width: double.infinity, child: search),
              const SizedBox(height: 12),
              Row(
                children: [
                  Expanded(child: status),
                  const SizedBox(width: 12),
                  refresh,
                ],
              ),
            ],
          );
        }

        return Row(
          children: [
            Expanded(child: search),
            const SizedBox(width: 16),
            SizedBox(width: 220, child: status),
            const SizedBox(width: 12),
            refresh,
          ],
        );
      },
    );
  }

  @override
  void dispose() {
    _searchController.dispose();
    super.dispose();
  }
}
