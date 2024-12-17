import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:image_picker/image_picker.dart';
import 'package:story_space/add_story/presentation/cubit/add_story_cubit.dart';
import 'package:story_space/add_story/presentation/cubit/add_story_state.dart';
import 'package:story_space/add_story/presentation/widget/pick_location_bottom_sheet.dart';
import 'package:story_space/add_story/presentation/widget/pick_location_result.dart';
import 'package:story_space/core/presentation/dialog/loading_dialog.dart';
import 'package:story_space/core/presentation/util/context_ext.dart';

class AddStoryPage extends StatefulWidget {
  const AddStoryPage({super.key});

  @override
  State<AddStoryPage> createState() => _AddStoryPageState();
}

class _AddStoryPageState extends State<AddStoryPage> {
  final _descriptionController = TextEditingController();
  final _locationController = TextEditingController();
  double? _selectedLatitude;
  double? _selectedLongitude;

  final GlobalKey<FormState> _formState = GlobalKey();
  File? pickedFile;

  @override
  void dispose() {
    _descriptionController.dispose();
    super.dispose();
  }

  _pickImageGalery() async {
    final ImagePicker imagePicker = ImagePicker();
    final XFile? pickedImage = await imagePicker.pickImage(source: ImageSource.gallery);
    if (pickedImage?.path != null) {
      pickedFile = File(pickedImage!.path);
      setState(() {});
    }
  }

  _captureImage() async {
    final ImagePicker imagePicker = ImagePicker();
    final XFile? pickedImage = await imagePicker.pickImage(source: ImageSource.camera);
    if (pickedImage?.path != null) {
      pickedFile = File(pickedImage!.path);
      setState(() {});
    }
  }

  _submit() async {
    if (pickedFile == null) {
      if (!context.mounted) return;
      ScaffoldMessenger.of(context)
        ..removeCurrentSnackBar()
        ..showSnackBar(
          SnackBar(
            content: Text(context.getString.selectImage),
          ),
        );
      return;
    }
    if (_formState.currentState!.validate()) {
      final description = _descriptionController.text;
      context.read<AddStoryCubit>().addNewStory(
            description: description,
            file: pickedFile!,
            lat: _selectedLatitude,
            long: _selectedLongitude,
          );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(context.getString.addStory),
      ),
      body: SafeArea(
        top: false,
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8),
            child: Form(
              key: _formState,
              child: Column(
                children: [
                  const SizedBox(
                    height: 16,
                  ),
                  Container(
                    width: double.infinity,
                    height: pickedFile != null ? null : 300,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(8),
                      color: context.colorsScheme.onSurface.withAlpha(40),
                    ),
                    child: (() {
                      if (pickedFile != null) {
                        return Stack(
                          children: [
                            Image.file(
                              pickedFile!,
                              fit: BoxFit.fitWidth,
                            ),
                            Positioned(
                              right: 8,
                              bottom: 8,
                              child: IconButton(
                                onPressed: () {
                                  pickedFile = null;
                                  setState(() {});
                                },
                                icon: const Icon(Icons.delete),
                              ),
                            ),
                          ],
                        );
                      }

                      return Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          GestureDetector(
                            onTap: _pickImageGalery,
                            child: Icon(
                              Icons.image,
                              size: 64,
                              color: context.colorsScheme.onSurface,
                            ),
                          ),
                          const SizedBox(
                            width: 16,
                          ),
                          GestureDetector(
                            onTap: _captureImage,
                            child: Icon(
                              Icons.camera,
                              size: 64,
                              color: context.colorsScheme.onSurface,
                            ),
                          ),
                        ],
                      );
                    })(),
                  ),
                  const SizedBox(
                    height: 16,
                  ),
                  TextFormField(
                    controller: _descriptionController,
                    decoration: InputDecoration(
                      hintText: context.getString.descriptionHint,
                      border: const OutlineInputBorder(),
                    ),
                    keyboardType: TextInputType.multiline,
                    textInputAction: TextInputAction.done,
                    maxLines: null,
                    validator: (value) {
                      if (value?.isEmpty == true) {
                        return context.getString.descriptionCannotBeEmpty;
                      }

                      return null;
                    },
                  ),
                  const SizedBox(
                    height: 16,
                  ),
                  TextFormField(
                    controller: _locationController,
                    readOnly: true,
                    maxLines: null,
                    onTap: () async {
                      final dynamic result = await showBottomSheetDialog(
                        context: context,
                        child: const PickLocationBottomSheet(),
                      );
                      if (result == null) return;
                      if (result is PickLocationResult) {
                        _locationController.text = '${result.street}, ${result.address}';
                        _selectedLatitude = result.latitude;
                        _selectedLongitude = result.longitude;
                        setState(() {});
                        _formState.currentState!.validate();
                      }

                      if (result is String && result.isNotEmpty) {
                        if (!context.mounted) return;
                        ScaffoldMessenger.of(context)
                          ..removeCurrentSnackBar()
                          ..showSnackBar(
                            SnackBar(
                              content: Text(result),
                            ),
                          );
                      }
                    },
                    decoration: InputDecoration(
                      hintText: context.getString.selectLocation,
                      border: const OutlineInputBorder(),
                    ),
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return context.getString.selectLocation;
                      }
                      return null;
                    },
                  ),
                  const SizedBox(
                    height: 24,
                  ),
                  SizedBox(
                    width: double.infinity,
                    height: 48,
                    child: BlocListener<AddStoryCubit, AddStoryState>(
                      listener: (context, state) {
                        if (state.isLoading) {
                          showLoadingDialog(context);
                          return;
                        }

                        context.pop();

                        if (state.isError) {
                          ScaffoldMessenger.of(context)
                            ..removeCurrentSnackBar()
                            ..showSnackBar(
                              SnackBar(
                                content: Text(context.getString.errorMessage),
                              ),
                            );
                          return;
                        }

                        context.pop(true);
                      },
                      child: ElevatedButton(
                        onPressed: _submit,
                        child: Text(context.getString.submit),
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 44,
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
