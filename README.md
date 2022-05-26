# Client-iOS

## 29cm

![image](https://user-images.githubusercontent.com/70689381/168750546-2ca4fa2d-8b01-40a9-8cf5-0fdf00bde365.png)

- 국내 유명 온라인 셀렉트숍 29cm의 **iOS Application Redesign Project**

## Contributors

| @jimin-kiim | @haneulKimaa | @EunHee-Jeong |
| --- | --- | --- |
| <img width="200" alt="image" src="https://user-images.githubusercontent.com/70689381/169638308-1c68d905-4ddc-40f1-8d7a-f58eb28ac2b9.png"> | <img width="200" alt="image" src="https://user-images.githubusercontent.com/70689381/169638323-77e9eae5-65c2-4faa-b158-020077017bbd.png"> | <img width="200" alt="image" src="https://user-images.githubusercontent.com/70689381/169638252-5cc5610b-3681-4f9a-9c7b-8c1caf5e71bf.png"> |
| 숨겨진 고수 ㄷㄷ | 스승님 | 바지사장 |

## Project Setting

### 📏📐 Development Environment

| Environment | Tool |
| --- | --- |
| Framework | UIKit |
| UI Configuration | Storyboard |
| Library | Alamofire |

### 📏📐 Folder Structure

```swift
├── Info.plist
├── Resource
│   ├── Assets
│   │   └── AppIcon.xcassets
│   ├── Colors
│   │      └── Colors.xcassets
│   ├── Images
│   ├── Fonts
│   └── Storyboards
├── Source
│   ├── Application
│   │   └── AppDelegate
│   │   └── SceneDelegate
│   ├── Common
│   │   └── Consts
│   │   └── Extensions
│   │   └── Protocols
│   ├── Presentation
│   │   └── Common
│   │   └── Create
│   │        └── Views
│   │        └── Models
│   │        └── Controllers
│   │   └── Read
│   │        └── Views
│   │        └── Models
│   │        └── Controllers
│   ├── Service
│   │   └── Network
│   │   └── Result
│   │   └── Mock
│   │   └── Model
└───
```

## Git Flow

### 📏📐 Branch

```
1. Issue를 생성한다. // 작업의 단위, 번호 부여

2. Issue의 Feature Branch를 생성한다. // ex - feature/#이슈번호

3. ~작업~ // Add - Commit - Push - Pull Request 의 과정

4. Pull Request가 작성되면 작성자 이외의 다른 팀원이 Code Review를 한다.

5. Code Review가 완료되고, 1명 이상 Approve 하면 Pull Request 작성자가 main Branch로 merge 한다. // Conflicts 방지

6. 다른 팀원들은 merge된 작업물을 pull하고 다시 각자 맡은 작업을 이어나간다.
```

### 📏📐 Branch Naming

- 명확함과 간결함을 위해 3개만 사용하도록 한다.


    - `main` : 개발이 완료된 산출물이 저장될 공간


    - `feature` : 기능을 개발하는 브랜치
        - 이슈별•작업별로 브랜치를 생성하여 기능을 개발함.

    - `fix` : 버그를 수정하는 브랜치

### 📏📐 Commit Message

```
[Feat] 새로운 기능 추가 작업

[Fix] 에러 및 버그 수정, 기능에 대한 수정 작업

[HotFix] 겁나 급한 버그 수정 (모두 주목...)

[Docs] 문서 작성 및 수정 작업 (README 등)

[Style] UI 관련 작업 (UI 컴포넌트, Xib 파일, 컬러·폰트 작업 등)

[Edit] Fix가 아닌 모든 수정 작업 (주석, 파일 및 폴더 위치, 코드 스타일 등)

[Remove] 파일 삭제

[Add] 기능이 아닌 것 생성 및 추가 작업 (파일·익스텐션·프로토콜 등)

[Set] 설정 관련 작업 (add, feat, edit에 들어가기가 애매함)

[Test] 테스트 관련 작업 (ex. 폰트 설정 이후 폰트 테스트 등)
```

## Code & MARK Syntax Convention

- [GitHub Wiki 보러가기](https://github.com/SOPT-30th-Joint-Seminar-15/Client-iOS/wiki/%0830th-THE-SOPT-%ED%95%A9%EB%8F%99-%EC%84%B8%EB%AF%B8%EB%82%98-15%EC%A1%B0-iOS-%ED%8C%8C%ED%8A%B8's-Wiki)
