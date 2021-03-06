unit DB;

interface

const

    MAP_COL_COUNT   = 20;
    MAP_ROW_COUNT   = 20;
    MAP_TILE_COUNT   = MAP_COL_COUNT * MAP_ROW_COUNT;
    /// ��������� ������������ ��� ����������� ��������� ���� ���������.
    /// ��� ������������ ���� ���������� �������� ����������� � ��������� �� ����� ��������

    TILE_WIDTH      = 64;
    TILE_HEIGHT     = 64;

    RES_ICON_SIZE = 20;

    OBJECTS_FIELD_NAME = 0;
    OBJECTS_FIELD_DESCRIP = 2;

    TABLE_FIELD_NAME       = 0;
    TABLE_FIELD_ICON_IMAGE = 1;
    TABLE_FIELD_TILE_IMAGE = 1;

    FUNGRY_VALUE = -0.2;

    MESS_ICON_DEAD    = 'icon_dead';
    MESS_ICON_NEUTRAL = 'icon_neutral';
    MESS_ICON_WOW     = 'icon_wow';
    MESS_ICON_ANGRY   = 'icon_angry';
    MESS_ICON_FEAR    = 'icon_fear';
    MESS_ICON_WHAT    = 'icon_what';

    // �������� ����� ������ �������
    FIELD_CAPTION     = 0;
    FIELD_DESCRIP     = 1;
    FIELD_TAGS        = 2;
    FIELD_COUNT       = 3;
    FIELD_DELTA       = 5;
    FIELD_ONCE        = 6;
    FIELD_MAXIMUM     = 7;
    FIELD_MINIMUM     = 8;
    FIELD_USED        = 9;
    FIELD_VISIBLE     = 10;
    FIELD_ICON        = 11;
    FIELD_PERIOD      = 12;

    // ������ ��������� ���������� ��������.
    CALC_MODE_AUTO  = 0;   // �� ������. ����� �������� Delta � ������ �������� �����
    CALC_MODE_CLICK = 1;   // ���� ������. ����� �������� Once
    CALC_MODE_VALUE = 2;   // �������������. ������������ ��������� ��������

    // ���� ��������
    OBJ_FOREST      =  0;  // ���
    OBJ_PLAIN       =  1;  // �������
    OBJ_MOUNT       =  2;  // ����
    OBJ_SAND        =  3;  // �������
    OBJ_ICE         =  4;  // ������
    OBJ_CANYON      =  5;  // ������
    OBJ_LAVA        =  6;  // ������� ����
    OBJ_WATER       =  7;  // ����
    OBJ_DEAD        =  8;  // ������� ����� (����� ������ ����, ������ ������ ��������)

    OBJ_FOG         =  9;  // ����� ����� (��������������� ����������)

    OBJ_PREDATOR    = 10;  // ������
    OBJ_MAMMOTH     = 11;  // ������ (���������)
    OBJ_CAVE        = 12;  // ������
    OBJ_HERD        = 13;  // ����� (���������)

    OBJ_TOWN_SMALL  = 14;  // ��������� ���������
    OBJ_TOWN_MEDIUM = 15;  // ������� ���������
    OBJ_TOWN_BIG    = 16;  // ������� ���������
    OBJ_TOWN_GREAT  = 17;  // �������� ���������

    // ������������� ������ ������. ����� ���� ���������� ��� ������������
    OBJ_PESANT = 18;  // ��������
    OBJ_RAIDER = 19;  // ����-��������
    OBJ_BAND   = 20;  // ������
    OBJ_ARMY   = 21;  // �����

    // ������� ���������� ������
    OBJ_TREE        = 22;  // ������
    OBJ_BUSH        = 23;  // �����
    OBJ_ROCK        = 24;  // ������
    OBJ_BERRY       = 25;  // �����
    OBJ_GRASS       = 26;  // ������� �����
    OBJ_MUSH        = 27;  // �����
    OBJ_BIGTREE     = 28;  // ������� ������
    OBJ_DEADTREE    = 29;  // ������� ������
    OBJ_PAPOROTNIK  = 30;  // ����������
    OBJ_APPLETREE   = 31;  // ����������
    OBJ_GRAYSTONE   = 32;  // ����������
    OBJ_BROVNSTONE  = 33;  // ����������
    OBJ_SMALLGRASS  = 34;  // ����������

    OBJ_WOLF        = 35;  // ����������
    OBJ_BIZON       = 36;  // ����������
    OBJ_BEAR        = 37;  // ����������
    OBJ_BLACKWOLF   = 38;  // ����������
    OBJ_WHITE_FLOWERS = 39;
    OBJ_YELLOW_FLOWERS = 40;
    OBJ_BROWN_FLOWERS = 41;
    OBJ_BROWN_MUSH = 42;
    OBJ_DEADANIMAL = 43;
    OBJ_BIGSTONE = 44;
    OBJ_TAGEDSTONE = 45;
    OBJ_HEALFLOWER = 46;


    // ���� ��������
    // �������� �������� � ������� TableResource
    RESOURCE_IQ     = 0;
    RESOURCE_HEALTH = 1;
    RESOURCE_MAN    = 2;
    RESOURCE_WOMAN  = 3;

    RESOURCE_WOOD   = 4;
    RESOURCE_GRASS  = 5;
    RESOURCE_STONE  = 6;
    RESOURCE_ICE    = 7;
    RESOURCE_LAVA   = 8;

    RESOURCE_FOOD   = 9;
    RESOURCE_BONE   = 10;
    RESOURCE_PRODUCT= 11; /// ������������ ������ � �������, �������� �� ��� ���������������� ��������
    RESOURCE_SPEAR  = 12; // ��������� ��� ��������. ��������� ���� � ����� �����
    RESOURCE_SKIN   = 13; // ��������� ��� ��������. ��������� ���������� ���� �� ����� ����� ����������
    RESOURCE_HIDE   = 14; // �����, ��������� ��� ������

var
    // ��� ������������ ������� �������
    TableObjects : array [0..46, 0..3] of string = (
      /// ���� ���������
      ('���',     'tile_forest', '+', ''),
      ('�������', 'tile_plane',  '+', ''),
      ('����',    'tile_mount',  '+', ''),
      ('�������', 'tile_sand',   '+', ''),
      ('������',  'tile_ice',    '+', ''),
      ('������',  'tile_canyon', '', ''),
      ('����',    'tile_lava',   '', ''),
      ('����',    'tile_water',  '+', ''),
      ('�����',   'tile_dead',   '+', ''),
      ('�����',   'tile_fog',    '+', ''),
      /// ������������ �������
      ('������', 'tile_predator', '', ''),      //10
      ('������', 'tile_mammoth', '������!', ''),
      ('������', 'tile_cave', '', ''),
      ('�����', 'tile_herd', '', ''),
      /// ����������� � ������������ ��������
      ('��������� ���������', 'tile_town_small', '', ''),
      ('������� ���������',   'tile_town_medium', '', ''),
      ('������� ���������',   'tile_town_big', '', ''),
      ('�������� ���������',  'tile_town_great', '', ''),
      /// ������, �������� �� �����
      ('������', 'tile_pesant', '', ''),
      ('������', 'tile_raider', '', ''),
      ('�����',  'tile_band', '', ''),          // 20
      ('�����',  'tile_army', '', ''),
      // ��������� �����
      ('������', 'tile_tree',  '', ''),
      ('����',   'tile_bush',  '', ''),
      ('������', 'tile_rock',  '', ''),
      ('�����',  'tile_berry', '', ''),          // 25
      ('�����',  'tile_grass', '', ''),
      ('�����',  'tile_mush',  '', ''),
      ('������� ������',  'tile_bigtree',  '', ''),
      ('������� ������',  'tile_deadtree',  '', ''),
      ('����������',  'tile_paporotnik',  '', ''),  // 30
      ('������',  'tile_appletree',  '', ''),
      ('������',  'tile_graystone',  '������� ������. ����� �����������', ''),
      ('��������',  'tile_brovnstone',  '������� ������. ������ ������ ������', ''),
      ('�����',  'tile_smallgrass',  '������� ������ �����', ''),

      ('����',  'tile_wolf',  '��������', ''),                //35
      ('�����',  'tile_bizon',  '�����', ''),
      ('�������',  'tile_bear',  '', ''),
      ('������ ����',  'tile_blackwolf',  '', ''),
      ('����� �����',  'tile_w_flover',  '', ''),
      ('������ �����',  'tile_y_flower',  '', ''),
      ('����� �����',  'tile_b_flower',  '', ''),
      ('����� �����',  'tile_b_mush',  '', ''),
      ('���� ���������',  'tile_deadanimal',  '', ''),
      ('������� ������',  'tile_bigstone',  '', ''),
      ('������ � ����������',  'tile_tagedstone',  '', ''),
      ('�������',  'tile_healflower',  '', '')




//    ,('', 'tile_', ''),

    );

    // ��� ������������ �������
    TableResource : array [0..14, 0..2] of string = (
      ('���������',    'icon_iq',     '��������� ��� ����������� ����� ����������. ����������� ��� ������ ����� ����.'),
      ('��������',     'icon_health', '�������� ������ ������� ������������� �������. ��� ������� �� ���� - ���� �� ������ ������� �������.'),
      ('�������',      'icon_man',    '������� ������ �������. ���������� ������ � ���������� � ������� ���������. ��� ������ ���� - ����� ��������.'),
      ('�������',      'icon_woman',  '������� ������ �������. ���� ������� � �����������, ���������� ������ � ���������.'),
      ('���������',    'icon_wood',   '������� ���������. ������������ � �������������, ������������ ������������.'),
      ('�����',        'icon_grass',  ''),
      ('������',       'icon_stone',  '������� ������. ������������ � �������������, ������������ ������������.'),
      ('���',          'icon_ice',    ''),
      ('����',         'icon_lava',   ''),
      ('���',          'icon_food',   '��� ������� ������ �������� ������ �������� �������.'),
      ('�����',        'icon_bone',   ''),
      ('������������', 'icon_prod',   '���������� ������������ ������ � ������� (��� �������).'),
      ('�����',        'icon_spear',  '������. ����������� � ��� ��� ���������� ����� ����������'),
      ('������',       'icon_skin',   '������. ����������� � ���, ������ ���� �� ����������'),
      ('�����',        'icon_hide',   '�������� ������ ��������� ��� ������')
    );

implementation

end.
