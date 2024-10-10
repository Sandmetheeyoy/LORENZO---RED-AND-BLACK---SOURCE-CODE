/// @description initialising enemies


// attention and overall behavior
attention_span = random_range(50, 60);
attention_counter = 0;
found_player = 0;
lose_player = 0;
alert_mode = 0;
turn_dir = choose(-1, 1)*30;
// walking
walk_cooldown = 0;
findsoundsource = false;
selectedpathfindblocks = [];
// kinds of weapons
ROF = 0;
guns = ["revolver", "pumpaction", "lupara", "tommygun"];
gun_ROF = [15, 45, 45, 4];
gun_ammo = [6, 7, 2, 50];
gun_ammo_standard = [6, 7, 2, 50];
gun_damage = [30, 5, 5, 10];
gun_pellets = [1, 13, 17, 1];
gun_shake = [1, 2, 2, 1];
gun_inacc = [10, 12.5, 32, 17];
gun_sprite = [s_revolver, s_player_torso_pistol, s_player_torso_pistol, s_player_torso_pistol];
gun_sound = [snd_pistol, snd_shotgun_blast, snd_shotgun_blast, snd_tommygun_spray];

direction = set_direction;
visible = true;

// image looping
image_speed = 0;
depth = -2;

all_torsos_pistol = [s_enemy_torso_pistol // 0: connected suits, 1: spades, 2: donnie, 3: cremes, 5: cops
, s_donnie_m_torso_pistol
, s_enemy_spade_torso_pistol
, s_enemy_creme_torso_pistol
, s_enemy_cop_torso_pistol
];
all_torsos_longgun = [s_enemy_torso_longgun
, s_donnie_m_torso_longgun
, s_enemy_spade_torso_longgun
, s_enemy_creme_torso_longgun
, s_enemy_cop_torso_longgun
];
all_legs = [s_enemy_leg, s_enemy_leg, s_enemy_spade_leg, s_player_leg, s_enemy_cop_leg];
default_torso = s_enemy_torso_pistol;
default_leg = s_enemy_leg;


audio_scream = 0;

// prev_dir
prev_dir = 0; // solve the problem 
