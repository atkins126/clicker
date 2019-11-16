unit uMain;

interface

uses
  System.SysUtils, System.Types, System.UITypes, System.Classes, System.Variants,
  FMX.Types, FMX.Controls, FMX.Forms, FMX.Graphics, FMX.Dialogs, FMX.StdCtrls,
  FMX.Controls.Presentation, FMX.Layouts, FMX.TabControl, System.ImageList,
  FMX.ImgList, FMX.ExtCtrls, FMX.Objects, System.Math,

  uResourceManager, uTiledModeManager, uGameManager, uGameObjectManager, uToolPanelManager;

type
  TfMain = class(TForm)
    sbScreen: TScrollBox;
    il18: TImageList;
    flResources: TFlowLayout;
    lResources: TLayout;
    tResTimer: TTimer;
    imgPreview: TImage;
    lTabs: TLayout;
    iObject: TImage;
    Rectangle1: TRectangle;
    tabsTool: TTabControl;
    tabObject: TTabItem;
    tabScience: TTabItem;
    tabProduction: TTabItem;
    Layout1: TLayout;
    iScience: TImage;
    iProduction: TImage;
    iOperation: TImage;
    Rectangle2: TRectangle;
    lObjectName: TLabel;
    iact1: TImage;
    iact2: TImage;
    iact3: TImage;
    iact4: TImage;
    iact5: TImage;
    iact6: TImage;
    Rectangle3: TRectangle;
    tabsScreen: TTabControl;
    tabGame: TTabItem;
    tabMenu: TTabItem;
    Image1: TImage;
    Image2: TImage;
    iNewGame: TImage;
    iOptions: TImage;
    iExit: TImage;
    Image7: TImage;
    Label1: TLabel;
    Label2: TLabel;procedure FormCreate(Sender: TObject);
    procedure tResTimerTimer(Sender: TObject);
    procedure OnMouseDownCallback(Sender: TObject; Button: TMouseButton;
  Shift: TShiftState; X, Y: Single);
    procedure OnMouseUpCallback(Sender: TObject; Button: TMouseButton;
  Shift: TShiftState; X, Y: Single);
    procedure OnMouseMoveCallback(Sender: TObject; Shift: TShiftState; X,
      Y: Single);
    procedure sbScreenMouseLeave(Sender: TObject);
    procedure iNewGameMouseEnter(Sender: TObject);
    procedure iNewGameMouseLeave(Sender: TObject);
    procedure iOptionsMouseEnter(Sender: TObject);
    procedure iOptionsMouseLeave(Sender: TObject);
    procedure iExitMouseEnter(Sender: TObject);
    procedure iExitMouseLeave(Sender: TObject);
    procedure iExitClick(Sender: TObject);
    procedure iNewGameClick(Sender: TObject);
    procedure Image7Click(Sender: TObject);
  private
    { Private declarations }
    StartDragPos: TPointF;
    InDrag : boolean;
    StartDragX,
    StartDragY
        : Single;
  public
    { Public declarations }
    procedure InitGame;
    procedure SetGameState;
    procedure StartGame;
  end;

var
  fMain: TfMain;

implementation

{$R *.fmx}

uses uImgMap, DB;
{$R *.Macintosh.fmx MACOS}

procedure TfMain.FormCreate(Sender: TObject);
begin
    // ��������� ������ ���������, ��� �������������� ����� ����
    InitGame;

    // ������ �� ����������� ��� ������������������ ������, �������� ���� � �������������� ���������
    SetGameState;

    // ��������� ������� (�������� ������� � ��� �����)
    StartGame;
end;

procedure TfMain.SetGameState;
{ ��������� ���������� � �������� ���� �����, �������� �������� ��������: ���, ������.
  ���������������, ��� ��� ��������� ������� ��� ������� ��� ��������� �� �����.

  � ��������� ��������� ���� ���������:
     - ����������� ������ ������������ � ������ ����� � ������ ��������
     - ���������� ��������� �������� � ����� �� �� ������
     - ����������� ������ ��� �������� ������
     - �������� ������ � ������� ������� � �������������
     - ������ ���� ����� ���� ��������
}
begin

     // ��������� ������ ��������
     // ���������� ��������� ��������, ������ �� ������� ��� � ������
     with mResManager, mGameManager.GameSatate do
     begin
         SetAttr(RESOURCE_IQ, FIELD_VISIBLE,
            (Era in [ERA_PRIMAL, ERA_ANCIENT, ERA_MEDIVAL, ERA_TECHNICAL, ERA_ELECTRONIC, ERA_COSMIC, ERA_EXPANSE, ERA_SINGULAR]) and
            (Mode in [MODE_LOCAL, MODE_COUNTRY, MODE_PLANET])
         );

         SetAttr(RESOURCE_FOOD, FIELD_VISIBLE,
            (Era in [ERA_PRIMAL, ERA_ANCIENT, ERA_MEDIVAL, ERA_TECHNICAL, ERA_ELECTRONIC]) and
            (Mode in [MODE_LOCAL, MODE_COUNTRY])
         );

         SetAttr(RESOURCE_HEALTH, FIELD_VISIBLE,
            (Era in [ERA_PRIMAL, ERA_ANCIENT, ERA_MEDIVAL, ERA_TECHNICAL, ERA_ELECTRONIC, ERA_COSMIC, ERA_EXPANSE, ERA_SINGULAR]) and
            (Mode in [MODE_LOCAL])
         );

         SetAttr(RESOURCE_MAN, FIELD_VISIBLE,
            (Era in [ERA_PRIMAL, ERA_ANCIENT, ERA_MEDIVAL, ERA_TECHNICAL, ERA_ELECTRONIC, ERA_COSMIC, ERA_EXPANSE, ERA_SINGULAR]) and
            (Mode in [MODE_LOCAL, MODE_COUNTRY, MODE_PLANET])
         );

         SetAttr(RESOURCE_WOMAN, FIELD_VISIBLE,
            (Era in [ERA_PRIMAL]) and
            (Mode in [MODE_LOCAL])
         );

         SetAttr(RESOURCE_WOOD, FIELD_VISIBLE,
            (Era in [ERA_PRIMAL, ERA_ANCIENT, ERA_MEDIVAL]) and
            (Mode in [MODE_LOCAL, MODE_COUNTRY])
         );

         SetAttr(RESOURCE_STONE, FIELD_VISIBLE,
            (Era in [ERA_PRIMAL, ERA_ANCIENT, ERA_MEDIVAL]) and
            (Mode in [MODE_LOCAL, MODE_COUNTRY])
         );

         // �������� �������� ��������� ��������� �������� �� ������
         UpdateResPanel;
     end;

     // ������������� ������ ��� �������� ������
     mTileDrive := TTileModeDrive.Create;
     mTileDrive.SetupComponents(sbScreen);
     mTileDrive.DownCallback := OnMouseDownCallback;
     mTileDrive.MoveCallback := OnMouseMoveCallback;
     mTileDrive.UpCallback := OnMouseUpCallback;
     mTileDrive.BuildField;
     mTileDrive.UpdateField;

end;

procedure TfMain.OnMouseDownCallback(Sender: TObject; Button: TMouseButton;
  Shift: TShiftState; X, Y: Single);
begin

    if Button = TMouseButton.mbRight then
    begin
        InDrag := true;
        StartDragPos := Screen.MousePos;
//        self.Caption := Format('X: %f, Y: %f', [StartDragPos.X, StartDragPos.Y]);
    end;

end;


procedure TfMain.OnMouseMoveCallback(Sender: TObject; Shift: TShiftState; X,
  Y: Single);
const
    MaxDelta = 4;
var
    p : TPointF;
    DeltaX, DeltaY: single;
begin

    if InDrag then
    begin

        p := Screen.MousePos;


        DeltaX := p.X - StartDragPos.X;
        DeltaY := p.Y - StartDragPos.Y;

        DeltaX := Min(DeltaX, MaxDelta);
        DeltaX := Max(DeltaX, -MaxDelta);

        DeltaY := Min(DeltaY, MaxDelta);
        DeltaY := Max(DeltaY, -MaxDelta);

//        self.Caption := Format('X: %f, Y: %f', [DeltaX, DeltaY]);


        // ��������� scrollbox
        sbScreen.ScrollBy(DeltaX, DeltaY);

        if (( p.X < self.Left + sbScreen.Position.X + 10 ) or ( p.X > self.Left + sbScreen.Width - 10 )) or
           (( p.Y < self.Top  + sbScreen.Position.Y + 10 ) or ( p.Y > self.Top + sbScreen.Height - 10 ))
        then InDrag := false;
    end;

end;

procedure TfMain.OnMouseUpCallback(Sender: TObject; Button: TMouseButton;
  Shift: TShiftState; X, Y: Single);
{ �������� ���������� ����� �� �������� �� ������� ����.
  �� �������� ��� ���������� OnClick ���� ������� ��������.
  Sender - ������ TImage ������������ ������ �� ����
  (Sender as TImage).Tag - id ������� � �������
   }
var
    result : integer;
begin

    InDrag := false;

    if Button = TMouseButton.mbLeft then
    begin
        result := mGameManager.ProcessObjectClick( (Sender as TImage).Tag );

        if (result and PROCESS_CHANGE_FIELD) <> 0
        then mTileDrive.UpdateField;
    end;

end;


procedure TfMain.iExitClick(Sender: TObject);
begin
    close;
end;

procedure TfMain.iExitMouseEnter(Sender: TObject);
begin
    fImgMap.AssignImage(iExit, 'menu_active_exit');
end;

procedure TfMain.iExitMouseLeave(Sender: TObject);
begin
    fImgMap.AssignImage(iExit, 'menu_unactive_exit');
end;

procedure TfMain.Image7Click(Sender: TObject);
begin
    tabsScreen.ActiveTab := tabMenu;
end;

procedure TfMain.iNewGameClick(Sender: TObject);
begin
    tabsScreen.ActiveTab := tabGame;
end;

procedure TfMain.iNewGameMouseEnter(Sender: TObject);
begin
    fImgMap.AssignImage(iNewGame, 'menu_active_newgame');
end;

procedure TfMain.iNewGameMouseLeave(Sender: TObject);
begin
    fImgMap.AssignImage(iNewGame, 'menu_unactive_newgame');
end;

procedure TfMain.InitGame;
begin

    // ������� �����, ���������� ���� ���� ������������ � ���� �����������
    fImgMap := TfImgMap.Create(Application);

    // ������� �������� ��������
    mResManager := TResourceManager.Create;
    // ����������� �������� � ������� �����
    mResManager.SetupComponents(lResources, flResources);

    // ������� �������� ������� ������
    mGameManager := TGameManager.Create;
    // �������������� ����
    mGameManager.InitGame;

    mToolPanel.SetupComponents(
        lTabs,
        tabsTool,
        [iObject, iOperation, iScience, iProduction],
        [fImgMap.iObjectActive, fImgMap.iOperationActive, fImgMap.iScienceActive, fImgMap.iProductionActive],
        [fImgMap.iObjectUnactive, fImgMap.iOperationUnactive, fImgMap.iScienceUnactive, fImgMap.iProductionUnactive]
    );
    mToolPanel.SetupObjectPanelComponents( imgPreview, lObjectName, [iact1,iact2,iact3,iact4,iact5,iact6 ] );
    mToolPanel.Init;
end;

procedure TfMain.iOptionsMouseEnter(Sender: TObject);
begin
    fImgMap.AssignImage(iOptions, 'menu_active_options');
end;

procedure TfMain.iOptionsMouseLeave(Sender: TObject);
begin
    fImgMap.AssignImage(iOptions, 'menu_unactive_options');
end;

procedure TfMain.StartGame;
begin
    tResTimer.Enabled := true;
end;

procedure TfMain.sbScreenMouseLeave(Sender: TObject);
begin
    InDrag := false;
end;

procedure TfMain.tResTimerTimer(Sender: TObject);
begin
   mResManager.OnTimer;
end;

end.


