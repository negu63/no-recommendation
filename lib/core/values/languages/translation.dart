import 'package:get/get.dart';

class Messages extends Translations {
  @override
  Map<String, Map<String, String>> get keys => {
        'en_US': {
          'appTitle': 'Blinker',
          'settingTitle': 'Setting',
          'settingSubtitleDisplay': 'Display',
          'settingSubtitleHistory': 'History',
          'settingSubtitleDelete': 'Delete',
          'settingCommentBox': 'Comment box',
          'settingDarkTheme': 'Dark Mode',
          'settingQueryHistory': 'Save search history',
          'settingQueryClear': 'Delete all search history',
          'settingButtonClear': 'Delete',
          'snackbarToggleTitle': 'Setting completed',
          'snackbarToggleMessage': 'has been saved.',
          'buttonClearTitle': 'Warning',
          'buttonClearMessage': 'Are you sure you want to delete?',
          'buttonClearConfirm': 'Delete',
          'buttonClearCancel': 'Cacel',
          'snackbarClearTitle': 'Delete completed',
          'snackbarClearMessage': 'Has been deleted.',
        },
        'ko_KR': {
          'appTitle': '블링커',
          'settingTitle': '설정',
          'settingSubtitleDisplay': '화면',
          'settingSubtitleHistory': '기록',
          'settingSubtitleDelete': '삭제',
          'settingCommentBox': '댓글 창',
          'settingDarkTheme': '다크 모드',
          'settingQueryHistory': '검색 기록 저장',
          'settingQueryClear': '검색 기록 전체 삭제',
          'settingButtonClear': '삭제',
          'snackbarToggleTitle': '설정 완료',
          'snackbarToggleMessage': '저장되었습니다.',
          'buttonClearTitle': '경고',
          'buttonClearMessage': '삭제하시겠습니까?',
          'buttonClearConfirm': '삭제',
          'buttonClearCancel': '취소',
          'snackbarClearTitle': '삭제 완료',
          'snackbarClearMessage': '삭제되었습니다.',
        },
      };
}
