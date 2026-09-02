import 'dart:typed_data';

import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';

class ImageUploadBox extends StatefulWidget {
  final ValueChanged<Uint8List?> onImageSelected;

  const ImageUploadBox({super.key, required this.onImageSelected});

  @override
  State<ImageUploadBox> createState() => _ImageUploadBoxState();
}

class _ImageUploadBoxState extends State<ImageUploadBox> {
  Uint8List? imageBytes;

  @override
  Widget build(BuildContext context) {
    final colors = Theme.of(context).colorScheme;

    return InkWell(
      onTap: pickImage,
      borderRadius: BorderRadius.circular(14),
      child: Container(
        height: 170,
        width: double.infinity,
        decoration: BoxDecoration(
          color: colors.surfaceContainerLow,
          borderRadius: BorderRadius.circular(14),
          border: Border.all(color: colors.outlineVariant, width: 1.5),
        ),
        child: imageBytes == null
            ? _buildUploadState(context)
            : _buildPreview(context),
      ),
    );
  }

  Future<void> pickImage() async {
    final result = await FilePicker.pickFiles(
      type: FileType.image,
      allowMultiple: false,
      withData: true,
    );

    if (result == null) {
      return;
    }

    final bytes = result.files.first.bytes;

    if (bytes == null) {
      return;
    }

    setState(() {
      imageBytes = bytes;
    });

    widget.onImageSelected(imageBytes);
  }

  void removeImage() {
    setState(() {
      imageBytes = null;
    });

    widget.onImageSelected(null);
  }

  Widget _buildPreview(BuildContext context) {
    final colors = Theme.of(context).colorScheme;

    return Stack(
      children: [
        Center(
          child: Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(12),
              border: Border.all(color: colors.outlineVariant),
            ),
            clipBehavior: Clip.antiAlias,
            child: Image.memory(
              imageBytes!,
              height: 130,
              width: 130,
              fit: BoxFit.cover,
            ),
          ),
        ),

        Positioned(
          top: 10,
          right: 10,
          child: IconButton(
            tooltip: 'Remove image',
            onPressed: removeImage,
            icon: const Icon(Icons.close),
            style: IconButton.styleFrom(
              backgroundColor: colors.surface,
              foregroundColor: colors.onSurface,
              side: BorderSide(color: colors.outlineVariant),
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildUploadState(BuildContext context) {
    final theme = Theme.of(context);
    final colors = theme.colorScheme;

    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Container(
          padding: const EdgeInsets.all(14),
          decoration: BoxDecoration(
            color: colors.primary.withValues(alpha: .10),
            shape: BoxShape.circle,
          ),
          child: Icon(
            Icons.cloud_upload_outlined,
            size: 32,
            color: colors.primary,
          ),
        ),

        const SizedBox(height: 12),

        Text(
          'Upload Category Image',
          style: theme.textTheme.bodyLarge?.copyWith(
            color: colors.onSurface,
            fontWeight: FontWeight.w600,
          ),
        ),

        const SizedBox(height: 5),

        Text(
          'PNG, JPG up to 2MB',
          style: theme.textTheme.bodySmall?.copyWith(
            color: colors.onSurfaceVariant,
          ),
        ),
      ],
    );
  }
}
