import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';

/// ---------------------------------------------------------------------------
/// AppTopBar
/// ---------------------------------------------------------------------------
///
/// Shared dashboard top app bar.
///
/// Features
/// --------
/// ✓ Material 3
/// ✓ Responsive
/// ✓ Optional Search
/// ✓ Optional Actions
/// ✓ User Avatar
/// ✓ Notification Button
/// ✓ Mobile Menu Button
/// ✓ Sidebar Toggle Button
///
/// ---------------------------------------------------------------------------

class DashTopBar extends StatelessWidget {
  final String title;

  final String? subtitle;
  final List<Widget> actions;

  final bool showSearch;

  final bool showNotifications;
  final bool showProfile;
  final bool showMenuButton;
  final VoidCallback? onToggleSidebar;

  const DashTopBar({
    super.key,
    required this.title,
    this.subtitle,
    this.actions = const [],
    this.showSearch = true,
    this.showNotifications = true,
    this.showProfile = true,
    this.showMenuButton = false,
    this.onToggleSidebar,
  });

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;

    return Material(
      elevation: 0,
      color: colorScheme.surface,
      child: Container(
        height: 76,
        padding: const EdgeInsets.symmetric(horizontal: 24),
        decoration: BoxDecoration(
          border: Border(
            bottom: BorderSide(
              color: colorScheme.outlineVariant,
            ),
          ),
        ),
        child: Row(
          children: [
            if (showMenuButton)
              IconButton(
                icon: const Icon(Icons.menu),
                onPressed: () {
                  Scaffold.of(context).openDrawer();
                },
              ),

            if (onToggleSidebar != null && !showMenuButton)
              IconButton(
                icon: const Icon(Icons.menu_open),
                onPressed: onToggleSidebar,
              ),

            if (showMenuButton || onToggleSidebar != null)
              const SizedBox(width: 8),

            Expanded(
              child: _TitleSection(
                title: title,
                subtitle: subtitle,
              ),
            ),

            if (showSearch)
              const SizedBox(
                width: 320,
                child: _SearchField(),
              ),

            if (showSearch) const SizedBox(width: 16),

            ...actions,

            if (actions.isNotEmpty)
              const SizedBox(width: 12),

            if (showNotifications)
              IconButton(
                tooltip: 'common.notifications'.tr(),
                icon: const Badge(
                  child: Icon(Icons.notifications_none),
                ),
                onPressed: () {},
              ),

            if (showProfile) const SizedBox(width: 12),

            if (showProfile) const _ProfileButton(),
          ],
        ),
      ),
    );
  }
}

/// ---------------------------------------------------------------------------
/// Profile Button
/// ---------------------------------------------------------------------------

class _ProfileButton extends StatelessWidget {
  const _ProfileButton();

  @override
  Widget build(BuildContext context) {
    return MenuAnchor(
      builder: (context, controller, child) {
        return InkWell(
          borderRadius: BorderRadius.circular(30),
          onTap: controller.open,
          child: Row(
            children: [
              const CircleAvatar(
                radius: 18,
                child: Icon(Icons.person),
              ),
              const SizedBox(width: 10),
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment:
                    CrossAxisAlignment.start,
                children: [
                  Text(
                    'admin'.tr(),
                    style: Theme.of(context)
                        .textTheme
                        .labelLarge,
                  ),
                  Text(
                    'common.admin'.tr(),
                    style: Theme.of(context)
                        .textTheme
                        .bodySmall,
                  ),
                ],
              ),
              const SizedBox(width: 6),
              const Icon(Icons.keyboard_arrow_down),
            ],
          ),
        );
      },
      menuChildren: [
        MenuItemButton(
          leadingIcon: const Icon(Icons.person_outline),
          onPressed: () {},
          child: Text('common.profile'.tr()),
        ),
        MenuItemButton(
          leadingIcon: const Icon(Icons.settings_outlined),
          onPressed: () {},
          child: Text('navigation.settings'.tr()),
        ),
        const Divider(height: 1),
        MenuItemButton(
          leadingIcon: const Icon(Icons.logout),
          onPressed: () {},
          child: Text('settings.logout'.tr()),
        ),
      ],
    );
  }
}

/// ---------------------------------------------------------------------------
/// Search Field
/// ---------------------------------------------------------------------------

class _SearchField extends StatelessWidget {
  const _SearchField();

  @override
  Widget build(BuildContext context) {
    return SearchBar(
      hintText: 'common.search_placeholder'.tr(),
      leading: const Icon(Icons.search),
      onChanged: (_) {},
    );
  }
}

/// ---------------------------------------------------------------------------
/// Title
/// ---------------------------------------------------------------------------

class _TitleSection extends StatelessWidget {
  final String title;

  final String? subtitle;
  const _TitleSection({required this.title, this.subtitle});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          title,
          style: Theme.of(context).textTheme.titleLarge,
        ),
        if (subtitle != null)
          Text(
            subtitle!,
            style: Theme.of(context).textTheme.bodySmall,
          ),
      ],
    );
  }
}
