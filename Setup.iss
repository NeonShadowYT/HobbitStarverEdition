; Script for Hobbit 2003 - Starver Edition
; Based on Starve Neon improvements, without registry associations

#define MyAppName "Hobbit 2003 - Starver Edition"
#define MyAppVersion "1.0"
#define MyAppPublisher "Neon Shadow"
#define MyAppURL "https://github.com/NeonShadowYT/HobbitStarverEdition"
#define MyAppExeName "Meridian.exe"

[Setup]
AppId={{9DA57180-BD77-4B00-911B-1BF7F9854E7E}
AppName={#MyAppName}
AppVersion={#MyAppVersion}
AppVerName={#MyAppName} {#MyAppVersion}
AppPublisher={#MyAppPublisher}
AppPublisherURL={#MyAppURL}
AppSupportURL={#MyAppURL}
AppUpdatesURL={#MyAppURL}
DefaultDirName={autopf}\Hobbit 2003 - Starve Edition
UninstallDisplayIcon={app}\{#MyAppExeName}
DefaultGroupName={#MyAppName}
AllowNoIcons=yes
PrivilegesRequired=lowest
OutputDir=C:\Users\NeonCyndows\Desktop
OutputBaseFilename=Hobbit 2003 Starver Edition setup
SetupIconFile=C:\Users\NeonCyndows\Documents\Project\HobbitStarverEdition\Meridian.ico
WizardStyle=modern dynamic windows11

SetupMutex=HobbitStarverSetup
DisableDirPage=no

Compression=lzma2/ultra64
CompressionThreads=auto
SolidCompression=yes

[CustomMessages]
YouTubeHint=Подписаться на YouTube
TwitchHint=Смотреть на Twitch
DiscordHint=Присоединиться к Discord
TelegramHint=Читать в Telegram
WebsiteHint=Перейти на сайт игры

[Languages]
Name: "english"; MessagesFile: "compiler:Default.isl"
Name: "russian"; MessagesFile: "compiler:Languages\Russian.isl"

[Tasks]
Name: "desktopicon"; Description: "{cm:CreateDesktopIcon}"; GroupDescription: "{cm:AdditionalIcons}"; Flags: unchecked

[Files]
Source: "C:\Users\NeonCyndows\Documents\Project\HobbitStarverEdition\{#MyAppExeName}"; DestDir: "{app}"; Components: main; Flags: ignoreversion
Source: "C:\Users\NeonCyndows\Documents\Project\HobbitStarverEdition\*"; DestDir: "{app}"; Components: main; Flags: ignoreversion recursesubdirs createallsubdirs

[Icons]
Name: "{group}\{#MyAppName}"; Filename: "{app}\{#MyAppExeName}"
Name: "{group}\{cm:ProgramOnTheWeb,{#MyAppName}}"; Filename: "{#MyAppURL}"
Name: "{group}\{cm:UninstallProgram,{#MyAppName}}"; Filename: "{uninstallexe}"
Name: "{autodesktop}\{#MyAppName}"; Filename: "{app}\{#MyAppExeName}"; Tasks: desktopicon

[Components]
Name: "main"; Description: "Основные файлы игры"; Types: full compact custom; Flags: fixed

[Run]
Filename: "{app}\{#MyAppExeName}"; Description: "{cm:LaunchProgram,{#StringChange(MyAppName, '&', '&&')}}"; Flags: nowait postinstall skipifsilent

[InstallDelete]
Type: filesandordirs; Name: "{app}\*"

[Code]
var
  BtnYouTube, BtnTwitch, BtnDiscord, BtnTelegram, BtnSite, BtnGitHub: TNewButton;

procedure OpenURL(Sender: TObject);
var
  URL: string;
  ErrorCode: Integer;
begin
  case TNewButton(Sender).Tag of
    1: URL := 'https://www.youtube.com/@NeonShadow-neon';
    2: URL := 'https://www.twitch.tv/neoncyndows';
    3: URL := 'https://discord.com/invite/9gv5sRhk9R';
    4: URL := 'https://t.me/voididea';
    5: URL := 'https://neonshadowyt.github.io/NeonImperium';
    6: URL := 'https://github.com/NeonShadowYT/HobbitStarverEdition';
  end;
  ShellExec('open', URL, '', '', SW_SHOWNORMAL, ewNoWait, ErrorCode);
end;

procedure InitializeWizard();
var
  ButtonWidth, Spacing, StartLeft, CurrentLeft, BtnTop, RightMargin: Integer;
begin
  ButtonWidth := 80;
  Spacing := 10;
  RightMargin := WizardForm.ClientWidth - WizardForm.CancelButton.Left - WizardForm.CancelButton.Width;
  StartLeft := RightMargin;
  BtnTop := WizardForm.CancelButton.Top;

  BtnYouTube := TNewButton.Create(WizardForm);
  with BtnYouTube do
  begin
    Parent := WizardForm;
    Left := StartLeft;
    Top := BtnTop;
    Width := ButtonWidth;
    Height := WizardForm.CancelButton.Height;
    Caption := 'YouTube';
    Tag := 1;
    OnClick := @OpenURL;
    Cursor := crHand;
    Font.Color := clBlue;
  end;

  CurrentLeft := BtnYouTube.Left + BtnYouTube.Width + Spacing;
  BtnTwitch := TNewButton.Create(WizardForm);
  with BtnTwitch do
  begin
    Parent := WizardForm;
    Left := CurrentLeft;
    Top := BtnTop;
    Width := ButtonWidth;
    Height := WizardForm.CancelButton.Height;
    Caption := 'Twitch';
    Tag := 2;
    OnClick := @OpenURL;
    Cursor := crHand;
    Font.Color := clBlue;
  end;

  CurrentLeft := BtnTwitch.Left + BtnTwitch.Width + Spacing;
  BtnDiscord := TNewButton.Create(WizardForm);
  with BtnDiscord do
  begin
    Parent := WizardForm;
    Left := CurrentLeft;
    Top := BtnTop;
    Width := ButtonWidth;
    Height := WizardForm.CancelButton.Height;
    Caption := 'Discord';
    Tag := 3;
    OnClick := @OpenURL;
    Cursor := crHand;
    Font.Color := clBlue;
  end;

  CurrentLeft := BtnDiscord.Left + BtnDiscord.Width + Spacing;
  BtnTelegram := TNewButton.Create(WizardForm);
  with BtnTelegram do
  begin
    Parent := WizardForm;
    Left := CurrentLeft;
    Top := BtnTop;
    Width := ButtonWidth;
    Height := WizardForm.CancelButton.Height;
    Caption := 'Telegram';
    Tag := 4;
    OnClick := @OpenURL;
    Cursor := crHand;
    Font.Color := clBlue;
  end;

  CurrentLeft := BtnTelegram.Left + BtnTelegram.Width + Spacing;
  BtnSite := TNewButton.Create(WizardForm);
  with BtnSite do
  begin
    Parent := WizardForm;
    Left := CurrentLeft;
    Top := BtnTop;
    Width := ButtonWidth;
    Height := WizardForm.CancelButton.Height;
    Caption := 'Site';
    Tag := 5;
    OnClick := @OpenURL;
    Cursor := crHand;
    Font.Color := clBlue;
  end;

  CurrentLeft := BtnSite.Left + BtnSite.Width + Spacing;
  BtnGitHub := TNewButton.Create(WizardForm);
  with BtnGitHub do
  begin
    Parent := WizardForm;
    Left := CurrentLeft;
    Top := BtnTop;
    Width := ButtonWidth;
    Height := WizardForm.CancelButton.Height;
    Caption := 'GitHub';
    Tag := 6;
    OnClick := @OpenURL;
    Cursor := crHand;
    Font.Color := clBlue;
  end;
end;

function InitializeSetup(): Boolean;
var
  GameRunning: Boolean;
begin
  Result := True;
  repeat
    GameRunning := (FindWindowByWindowName('Meridian') <> 0);
    if GameRunning then
    begin
      if MsgBox('Игра запущена. Закрой её и нажмите "Да" для продолжения установки,' + #13#10 +
                'или "Нет" для отмены установки.', mbConfirmation, MB_YESNO) = IDNO then
      begin
        Result := False;
        Exit;
      end;
      Sleep(1000);
    end;
  until not GameRunning;
end;

procedure CurStepChanged(CurStep: TSetupStep);
begin
  if CurStep = ssInstall then
  begin
    if ActiveLanguage = 'russian' then
      WizardForm.StatusLabel.Caption := 'Удаление старых файлов... Пожалуйста, подождите.'
    else
      WizardForm.StatusLabel.Caption := 'Removing old files... Please wait.';
  end;
end;