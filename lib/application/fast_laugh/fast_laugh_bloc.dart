import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';
import 'package:netflix/domain/downloads/i_downloads_repo.dart';
import 'package:netflix/domain/downloads/models/downloads.dart';

part 'fast_laugh_event.dart';
part 'fast_laugh_state.dart';
part 'fast_laugh_bloc.freezed.dart';

@injectable
class FastLaughBloc extends Bloc<FastLaughEvent, FastLaughState> {
  FastLaughBloc(
    IDownloadsRepo _downloadService,
  ) : super(FastLaughState.initial()) {
    on<Initialize>((event, emit) async {
      //send loading to ui
      emit(FastLaughState(
        videosList: [],
        isLoading: true,
        isError: false,
      ));
      // get trending movies
      final _result = await _downloadService.getDownloadsImages();
      final _state = _result.fold((l) {
        return FastLaughState(
          videosList: [],
          isLoading: false,
          isError: true,
        );
      },
          (resp) => FastLaughState(
                videosList: resp,
                isLoading: false,
                isError: false,
              ));

      // send to ui
      emit(_state);
    });
   
}

}
