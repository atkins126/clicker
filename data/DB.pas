unit DB;

interface

const

    MAP_COL_COUNT   = 20;
    MAP_ROW_COUNT   = 20;

    TILE_WIDTH      = 64;
    TILE_HEIGHT     = 64;

    TABLE_FIELD_NAME       = 0;
    TABLE_FIELD_ICON_IMAGE = 1;
    TABLE_FIELD_TILE_IMAGE = 1;

    // ���� ��������
    OBJ_FOREST      =  0;  // ���
    OBJ_PLAIN       =  1;  // �������
    OBJ_MOUNT       =  2;  // ����
    OBJ_SAND        =  3;  // �������
    OBJ_ICE         =  4;  // ������
    OBJ_CANYON      =  5;  // ������
    OBJ_LAVA        =  6;  // ������� ����
    OBJ_WATER       =  7;  // ����
    OBJ_FOG         =  8;  // ����� ����� (��������������� ����������)
    OBJ_DEAD        =  9;  // ������� ����� (����� ������ ����, ������ ������ ��������)

    OBJ_PREDATOR    = 10;  // ������
    OBJ_MAMONT      = 11;  // ������ (���������)
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
var
    // ��� ������������ ������� �������
    TableObjects : array [0..38, 0..2] of string = (
      /// ���� ���������
      ('���',     'tile_forest', '+'),
      ('�������', 'tile_plane',  '+'),
      ('����',    'tile_mount',  '+'),
      ('�������', 'tile_sand',   '+'),
      ('������',  'tile_ice',    '+'),
      ('������',  'tile_canyon', ''),
      ('����',    'tile_lava',   ''),
      ('����',    'tile_water',  '+'),
      ('�����',   'tile_fog',    '+'),
      ('�����',   'tile_dead',   '+'),
      /// ������������ �������
      ('������', 'tile_predator', ''),      //10
      ('������', 'tile_mamont', ''),
      ('������', 'tile_cave', ''),
      ('�����', 'tile_herd', ''),
      /// ����������� � ������������ ��������
      ('��������� ���������', 'tile_town_small', ''),
      ('������� ���������',   'tile_town_medium', ''),
      ('������� ���������',   'tile_town_big', ''),
      ('�������� ���������',  'tile_town_great', ''),
      /// ������, �������� �� �����
      ('������', 'tile_pesant', ''),
      ('������', 'tile_raider', ''),
      ('�����',  'tile_band', ''),          // 20
      ('�����',  'tile_army', ''),
      // ��������� �����
      ('������', 'tile_tree',  ''),
      ('����',   'tile_bush',  ''),
      ('������', 'tile_rock',  ''),
      ('�����',  'tile_berry', ''),
      ('�����',  'tile_grass', ''),
      ('�����',  'tile_mush',  ''),
      ('������� ������',  'tile_bigtree',  ''),
      ('������� ������',  'tile_deadtree',  ''),
      ('����������',  'tile_paporotnik',  ''),
      ('������',  'tile_appletree',  ''),
      ('������',  'tile_graystone',  ''),
      ('�����',  'tile_brovnstone',  ''),
      ('�����',  'tile_smallgrass',  ''),

      ('����',  'tile_wolf',  ''),
      ('�����',  'tile_bizon',  ''),
      ('�������',  'tile_bear',  ''),
      ('������ ����',  'tile_blackwolf',  '')


//    ,('', 'tile_', ''),

    );

    // ��� ������������ �������
    TableResource : array [0..11, 0..2] of string = (
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
      ('������������', 'icon_prod',   '���������� ������������ ������ � ������� (��� �������).')
    );

implementation

end.
