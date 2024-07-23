import 'package:bloc/bloc.dart';
import 'package:flutter_bloc_state_management/bloc/image_picker/image_picker_event.dart';
import 'package:flutter_bloc_state_management/bloc/image_picker/image_picker_state.dart';

class ImagePickerBloc extends Bloc<ImagePickerEvent,ImagePickerState>{

  ImagePickerBloc():super(const ImagePickerState()){
    on<CameraCapture>(_captureImage);
    on<GalleryImagePicker>(_galleryImagePicker);
  }

 void _captureImage(CameraCapture event, Emitter<ImagePickerState> emit){
    emit(state.copyWith(file: state.file));
 }

  void _galleryImagePicker(GalleryImagePicker event, Emitter<ImagePickerState> emit){
    emit(state.copyWith(file: state.file));
  }


}