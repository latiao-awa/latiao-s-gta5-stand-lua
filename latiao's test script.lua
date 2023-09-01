local ALL_script_hosts = {
    "abigail1",
    "abigail2",
    "achievement_controller",
    "act_cinema",
    "activity_creator_prototype_launcher",
    "af_intro_t_sandy",
    "agency_heist1",
    "agency_heist2",
    "agency_heist3a",
    "agency_heist3b",
    "agency_prep1",
    "agency_prep2amb",
    "aicover_test",
    "ainewengland_test",
    "altruist_cult",
    "am_agency_suv",
    "am_airstrike",
    "am_ammo_drop",
    "am_arena_shp",
    "am_armwrestling_apartment",
    "am_armwrestling",
    "am_armybase",
    "am_backup_heli",
    "am_beach_washup_cinematic",
    "am_boat_taxi",
    "am_bru_box",
    "am_car_mod_tut",
    "am_casino_limo",
    "am_casino_luxury_car",
    "am_casino_peds",
    "am_challenges",
    "am_contact_requests",
    "am_cp_collection",
    "am_crate_drop",
    "am_criminal_damage",
    "am_darts_apartment",
    "am_darts",
    "am_dead_drop",
    "am_destroy_veh",
    "am_distract_cops",
    "am_doors",
    "am_ferriswheel",
    "am_ga_pickups",
    "am_gang_call",
    "am_heist_int",
    "am_heli_taxi",
    "am_hi_plane_land_cinematic",
    "am_hi_plane_take_off_cinematic",
    "am_hold_up",
    "am_hot_property",
    "am_hot_target",
    "am_hs4_isd_take_vel",
    "am_hs4_lsa_land_nimb_arrive",
    "am_hs4_lsa_land_vel",
    "am_hs4_lsa_take_vel",
    "am_hs4_nimb_isd_lsa_leave",
    "am_hs4_nimb_lsa_isd_arrive",
    "am_hs4_nimb_lsa_isd_leave",
    "am_hs4_vel_lsa_isd",
    "am_hunt_the_beast",
    "am_imp_exp",
    "am_island_backup_heli",
    "am_joyrider",
    "am_kill_list",
    "am_king_of_the_castle",
    "am_launcher",
    "am_lester_cut",
    "am_lowrider_int",
    "am_lsia_take_off_cinematic",
    "am_luxury_showroom",
    "am_mission_launch",
    "am_mp_acid_lab",
    "am_mp_arc_cab_manager",
    "am_mp_arcade_claw_crane",
    "am_mp_arcade_fortune_teller",
    "am_mp_arcade_love_meter",
    "am_mp_arcade_peds",
    "am_mp_arcade_strength_test",
    "am_mp_arcade",
    "am_mp_arena_box",
    "am_mp_arena_garage",
    "am_mp_armory_aircraft",
    "am_mp_armory_truck",
    "am_mp_auto_shop",
    "am_mp_biker_warehouse",
    "am_mp_boardroom_seating",
    "am_mp_bunker",
    "am_mp_business_hub",
    "am_mp_car_meet_property",
    "am_mp_car_meet_sandbox",
    "am_mp_carwash_launch",
    "am_mp_casino_apartment",
    "am_mp_casino_nightclub",
    "am_mp_casino_valet_garage",
    "am_mp_casino",
    "am_mp_creator_aircraft",
    "am_mp_creator_trailer",
    "am_mp_defunct_base",
    "am_mp_drone",
    "am_mp_fixer_hq",
    "am_mp_garage_control",
    "am_mp_hacker_truck",
    "am_mp_hangar",
    "am_mp_ie_warehouse",
    "am_mp_island",
    "am_mp_juggalo_hideout",
    "am_mp_multistorey_garage",
    "am_mp_music_studio",
    "am_mp_nightclub",
    "am_mp_orbital_cannon",
    "am_mp_peds",
    "am_mp_property_ext",
    "am_mp_property_int",
    "am_mp_rc_vehicle",
    "am_mp_shooting_range",
    "am_mp_simeon_showroom",
    "am_mp_smoking_activity",
    "am_mp_smpl_interior_ext",
    "am_mp_smpl_interior_int",
    "am_mp_social_club_garage",
    "am_mp_solomon_office",
    "am_mp_submarine",
    "am_mp_vehicle_reward",
    "am_mp_vehicle_weapon",
    "am_mp_warehouse",
    "am_mp_yacht",
    "am_npc_invites",
    "am_pass_the_parcel",
    "am_penned_in",
    "am_penthouse_peds",
    "am_pi_menu",
    "am_plane_takedown",
    "am_prison",
    "am_prostitute",
    "am_rollercoaster",
    "am_rontrevor_cut",
    "am_taxi",
    "am_vehicle_spawn",
    "ambient_diving",
    "ambient_mrsphilips",
    "ambient_solomon",
    "ambient_sonar",
    "ambient_tonya",
    "ambient_tonyacall2",
    "ambient_tonyacall5",
    "ambient_tonyacall",
    "ambient_ufos",
    "ambientblimp",
    "animal_controller",
    "apartment_minigame_launcher",
    "apparcadebusiness",
    "apparcadebusinesshub",
    "appavengeroperations",
    "appbikerbusiness",
    "appbroadcast",
    "appbunkerbusiness",
    "appbusinesshub",
    "appcamera",
    "appchecklist",
    "appcontacts",
    "appcovertops",
    "appemail",
    "appextraction",
    "appfixersecurity",
    "apphackertruck",
    "apphs_sleep",
    "appimportexport",
    "appinternet",
    "appjipmp",
    "appmedia",
    "appmpbossagency",
    "appmpemail",
    "appmpjoblistnew",
    "apporganiser",
    "appprogresshub",
    "apprepeatplay",
    "appsecurohack",
    "appsecuroserv",
    "appsettings",
    "appsidetask",
    "appsmuggler",
    "apptextmessage",
    "apptrackify",
    "appvlsi",
    "appzit",
    "arcade_seating",
    "arena_box_bench_seats",
    "arena_carmod",
    "arena_workshop_seats",
    "armenian1",
    "armenian2",
    "armenian3",
    "armory_aircraft_carmod",
    "assassin_bus",
    "assassin_construction",
    "assassin_hooker",
    "assassin_multi",
    "assassin_rankup",
    "assassin_valet",
    "atm_trigger",
    "audiotest",
    "auto_shop_seating",
    "autosave_controller",
    "bailbond1",
    "bailbond2",
    "bailbond3",
    "bailbond4",
    "bailbond_launcher",
    "barry1",
    "barry2",
    "barry3",
    "barry3a",
    "barry3c",
    "barry4",
    "base_carmod",
    "base_corridor_seats",
    "base_entrance_seats",
    "base_heist_seats",
    "base_lounge_seats",
    "base_quaters_seats",
    "base_reception_seats",
    "basic_creator",
    "beach_exterior_seating",
    "benchmark",
    "bigwheel",
    "bj",
    "blackjack",
    "blimptest",
    "blip_controller",
    "bootycall_debug_controller",
    "bootycallhandler",
    "buddydeathresponse",
    "bugstar_mission_export",
    "building_controller",
    "buildingsiteambience",
    "business_battles_defend",
    "business_battles_sell",
    "business_battles",
    "business_hub_carmod",
    "business_hub_garage_seats",
    "cablecar",
    "cam_coord_sender",
    "camera_test",
    "camhedz_arcade",
    "candidate_controller",
    "car_meet_carmod",
    "car_meet_exterior_seating",
    "car_meet_interior_seating",
    "car_roof_test",
    "carmod_shop",
    "carsteal1",
    "carsteal2",
    "carsteal3",
    "carsteal4",
    "carwash1",
    "carwash2",
    "casino_bar_seating",
    "casino_exterior_seating",
    "casino_interior_seating",
    "casino_lucky_wheel",
    "casino_main_lounge_seating",
    "casino_nightclub_seating",
    "casino_penthouse_seating",
    "casino_slots",
    "casinoroulette",
    "celebration_editor",
    "celebrations",
    "cellphone_controller",
    "cellphone_flashhand",
    "charactergoals",
    "charanimtest",
    "cheat_controller",
    "chinese1",
    "chinese2",
    "chop",
    "clothes_shop_mp",
    "clothes_shop_sp",
    "code_controller",
    "combat_test",
    "comms_controller",
    "completionpercentage_controller",
    "component_checker",
    "context_controller",
    "controller_ambientarea",
    "controller_races",
    "controller_taxi",
    "controller_towing",
    "controller_trafficking",
    "coordinate_recorder",
    "country_race_controller",
    "country_race",
    "creation_startup",
    "creator",
    "custom_config",
    "cutscene_test",
    "cutscenemetrics",
    "cutscenesamples",
    "darts",
    "debug_app_select_screen",
    "debug_clone_outfit_testing",
    "debug_launcher",
    "debug_ped_data",
    "debug",
    "degenatron_games",
    "density_test",
    "dialogue_handler",
    "director_mode",
    "docks2asubhandler",
    "docks_heista",
    "docks_heistb",
    "docks_prep1",
    "docks_prep2b",
    "docks_setup",
    "dont_cross_the_line",
    "dreyfuss1",
    "drf1",
    "drf2",
    "drf3",
    "drf4",
    "drf5",
    "drunk_controller",
    "drunk",
    "dynamixtest",
    "email_controller",
    "emergencycall",
    "emergencycalllauncher",
    "epscars",
    "epsdesert",
    "epsilon1",
    "epsilon2",
    "epsilon3",
    "epsilon4",
    "epsilon5",
    "epsilon6",
    "epsilon7",
    "epsilon8",
    "epsilontract",
    "epsrobes",
    "error_listener",
    "error_thrower",
    "event_controller",
    "exile1",
    "exile2",
    "exile3",
    "exile_city_denial",
    "extreme1",
    "extreme2",
    "extreme3",
    "extreme4",
    "fairgroundhub",
    "fake_interiors",
    "fame_or_shame_set",
    "fameorshame_eps_1",
    "fameorshame_eps",
    "family1",
    "family1taxi",
    "family2",
    "family3",
    "family4",
    "family5",
    "family6",
    "family_scene_f0",
    "family_scene_f1",
    "family_scene_m",
    "family_scene_t0",
    "family_scene_t1",
    "fanatic1",
    "fanatic2",
    "fanatic3",
    "fbi1",
    "fbi2",
    "fbi3",
    "fbi4_intro",
    "fbi4_prep1",
    "fbi4_prep2",
    "fbi4_prep3",
    "fbi4_prep3amb",
    "fbi4_prep4",
    "fbi4_prep5",
    "fbi4",
    "fbi5a",
    "finale_choice",
    "finale_credits",
    "finale_endgame",
    "finale_heist1",
    "finale_heist2_intro",
    "finale_heist2a",
    "finale_heist2b",
    "finale_heist_prepa",
    "finale_heist_prepb",
    "finale_heist_prepc",
    "finale_heist_prepd",
    "finale_heist_prepeamb",
    "finale_intro",
    "finalea",
    "finaleb",
    "finalec1",
    "finalec2",
    "fixer_hq_carmod",
    "fixer_hq_seating_op_floor",
    "fixer_hq_seating_pq",
    "fixer_hq_seating",
    "floating_help_controller",
    "flow_autoplay",
    "flow_controller",
    "flow_help",
    "flowintrotitle",
    "flowstartaccept",
    "flyunderbridges",
    "fm_bj_race_controler",
    "fm_capture_creator",
    "fm_content_acid_lab_sell",
    "fm_content_acid_lab_setup",
    "fm_content_acid_lab_source",
    "fm_content_ammunation",
    "fm_content_armoured_truck",
    "fm_content_auto_shop_delivery",
    "fm_content_bank_shootout",
    "fm_content_bar_resupply",
    "fm_content_bicycle_time_trial",
    "fm_content_bike_shop_delivery",
    "fm_content_business_battles",
    "fm_content_cargo",
    "fm_content_cerberus",
    "fm_content_club_management",
    "fm_content_club_odd_jobs",
    "fm_content_club_source",
    "fm_content_clubhouse_contracts",
    "fm_content_convoy",
    "fm_content_crime_scene",
    "fm_content_drug_lab_work",
    "fm_content_drug_vehicle",
    "fm_content_export_cargo",
    "fm_content_ghosthunt",
    "fm_content_golden_gun",
    "fm_content_gunrunning",
    "fm_content_hsw_setup",
    "fm_content_hsw_time_trial",
    "fm_content_island_dj",
    "fm_content_island_heist",
    "fm_content_metal_detector",
    "fm_content_movie_props",
    "fm_content_mp_intro",
    "fm_content_parachuter",
    "fm_content_payphone_hit",
    "fm_content_phantom_car",
    "fm_content_possessed_animals",
    "fm_content_robbery",
    "fm_content_security_contract",
    "fm_content_sightseeing",
    "fm_content_skydive",
    "fm_content_slasher",
    "fm_content_smuggler_ops",
    "fm_content_smuggler_plane",
    "fm_content_smuggler_resupply",
    "fm_content_smuggler_sell",
    "fm_content_smuggler_trail",
    "fm_content_source_research",
    "fm_content_stash_house",
    "fm_content_taxi_driver",
    "fm_content_test",
    "fm_content_tuner_robbery",
    "fm_content_vehicle_list",
    "fm_content_vip_contract_1",
    "fm_content_xmas_mugger",
    "fm_deathmatch_controler",
    "fm_deathmatch_creator",
    "fm_hideout_controler",
    "fm_hold_up_tut",
    "fm_horde_controler",
    "fm_impromptu_dm_controler",
    "fm_intro_cut_dev",
    "fm_intro",
    "fm_lts_creator",
    "fm_main_menu",
    "fm_maintain_cloud_header_data",
    "fm_maintain_transition_players",
    "fm_mission_controller_2020",
    "fm_mission_controller",
    "fm_mission_creator",
    "fm_race_controler",
    "fm_race_creator",
    "fm_street_dealer",
    "fm_survival_controller",
    "fm_survival_creator",
    "fmmc_contentquicklauncher",
    "fmmc_launcher",
    "fmmc_playlist_controller",
    "forsalesigns",
    "fps_test_mag",
    "fps_test",
    "franklin0",
    "franklin1",
    "franklin2",
    "freemode_clearglobals",
    "freemode_creator",
    "freemode_init",
    "freemode",
    "friendactivity",
    "friends_controller",
    "friends_debug_controller",
    "fullmap_test_flow",
    "fullmap_test",
    "game_server_test",
    "gb_airfreight",
    "gb_amphibious_assault",
    "gb_assault",
    "gb_bank_job",
    "gb_bellybeast",
    "gb_biker_bad_deal",
    "gb_biker_burn_assets",
    "gb_biker_contraband_defend",
    "gb_biker_contraband_sell",
    "gb_biker_contract_killing",
    "gb_biker_criminal_mischief",
    "gb_biker_destroy_vans",
    "gb_biker_driveby_assassin",
    "gb_biker_free_prisoner",
    "gb_biker_joust",
    "gb_biker_last_respects",
    "gb_biker_race_p2p",
    "gb_biker_rescue_contact",
    "gb_biker_rippin_it_up",
    "gb_biker_safecracker",
    "gb_biker_search_and_destroy",
    "gb_biker_shuttle",
    "gb_biker_stand_your_ground",
    "gb_biker_steal_bikes",
    "gb_biker_target_rival",
    "gb_biker_unload_weapons",
    "gb_biker_wheelie_rider",
    "gb_carjacking",
    "gb_cashing_out",
    "gb_casino_heist_planning",
    "gb_casino_heist",
    "gb_casino",
    "gb_collect_money",
    "gb_contraband_buy",
    "gb_contraband_defend",
    "gb_contraband_sell",
    "gb_data_hack",
    "gb_deathmatch",
    "gb_delivery",
    "gb_finderskeepers",
    "gb_fivestar",
    "gb_fortified",
    "gb_fragile_goods",
    "gb_fully_loaded",
    "gb_gang_ops_planning",
    "gb_gangops",
    "gb_gunrunning_defend",
    "gb_gunrunning_delivery",
    "gb_gunrunning",
    "gb_headhunter",
    "gb_hunt_the_boss",
    "gb_ie_delivery_cutscene",
    "gb_illicit_goods_resupply",
    "gb_infiltration",
    "gb_jewel_store_grab",
    "gb_ploughed",
    "gb_point_to_point",
    "gb_ramped_up",
    "gb_rob_shop",
    "gb_salvage",
    "gb_security_van",
    "gb_sightseer",
    "gb_smuggler",
    "gb_stockpiling",
    "gb_target_pursuit",
    "gb_terminate",
    "gb_transporter",
    "gb_vehicle_export",
    "gb_velocity",
    "gb_yacht_rob",
    "general_test",
    "ggsm_arcade",
    "globals_fmmc_struct_registration",
    "globals_fmmcstruct2_registration",
    "golf_ai_foursome_putting",
    "golf_ai_foursome",
    "golf_mp",
    "golf",
    "gpb_andymoon",
    "gpb_baygor",
    "gpb_billbinder",
    "gpb_clinton",
    "gpb_griff",
    "gpb_jane",
    "gpb_jerome",
    "gpb_jesse",
    "gpb_mani",
    "gpb_mime",
    "gpb_pameladrake",
    "gpb_superhero",
    "gpb_tonya",
    "gpb_zombie",
    "grid_arcade_cabinet",
    "gtest_airplane",
    "gtest_avoidance",
    "gtest_boat",
    "gtest_divingfromcar",
    "gtest_divingfromcarwhilefleeing",
    "gtest_helicopter",
    "gtest_nearlymissedbycar",
    "gunclub_shop",
    "gunfighttest",
    "gunslinger_arcade",
    "hacker_truck_carmod",
    "hairdo_shop_mp",
    "hairdo_shop_sp",
    "hangar_carmod",
    "hao1",
    "headertest",
    "heatmap_test_flow",
    "heatmap_test",
    "heist_ctrl_agency",
    "heist_ctrl_docks",
    "heist_ctrl_finale",
    "heist_ctrl_jewel",
    "heist_ctrl_rural",
    "heist_island_planning",
    "heli_gun",
    "heli_streaming",
    "hud_creator",
    "hunting1",
    "hunting2",
    "hunting_ambient",
    "idlewarper",
    "ingamehud",
    "initial",
    "item_ownership_output",
    "jewelry_heist",
    "jewelry_prep1a",
    "jewelry_prep1b",
    "jewelry_prep2a",
    "jewelry_setup1",
    "josh1",
    "josh2",
    "josh3",
    "josh4",
    "juggalo_hideout_carmod",
    "juggalo_hideout_seating",
    "lamar1",
    "landing_pre_startup",
    "laptop_trigger",
    "launcher_abigail",
    "launcher_barry",
    "launcher_basejumpheli",
    "launcher_basejumppack",
    "launcher_carwash",
    "launcher_darts",
    "launcher_dreyfuss",
    "launcher_epsilon",
    "launcher_extreme",
    "launcher_fanatic",
    "launcher_golf",
    "launcher_hao",
    "launcher_hunting_ambient",
    "launcher_hunting",
    "launcher_josh",
    "launcher_maude",
    "launcher_minute",
    "launcher_mrsphilips",
    "launcher_nigel",
    "launcher_offroadracing",
    "launcher_omega",
    "launcher_paparazzo",
    "launcher_pilotschool",
    "launcher_racing",
    "launcher_rampage",
    "launcher_range",
    "launcher_stunts",
    "launcher_tennis",
    "launcher_thelastone",
    "launcher_tonya",
    "launcher_triathlon",
    "launcher_yoga",
    "lester1",
    "lesterhandler",
    "letterscraps",
    "line_activation_test",
    "liverecorder",
    "locates_tester",
    "luxe_veh_activity",
    "magdemo2",
    "magdemo",
    "main_install",
    "main_persistent",
    "main",
    "maintransition",
    "martin1",
    "maude1",
    "maude_postbailbond",
    "me_amanda1",
    "me_jimmy1",
    "me_tracey1",
    "mg_race_to_point",
    "michael1",
    "michael2",
    "michael3",
    "michael4",
    "michael4leadout",
    "minigame_ending_stinger",
    "minigame_stats_tracker",
    "minute1",
    "minute2",
    "minute3",
    "mission_race",
    "mission_repeat_controller",
    "mission_stat_alerter",
    "mission_stat_watcher",
    "mission_triggerer_a",
    "mission_triggerer_b",
    "mission_triggerer_c",
    "mission_triggerer_d",
    "missioniaaturret",
    "mp_awards",
    "mp_bed_high",
    "mp_fm_registration",
    "mp_menuped",
    "mp_prop_global_block",
    "mp_prop_special_global_block",
    "mp_registration",
    "mp_save_game_global_block",
    "mp_unlocks",
    "mp_weapons",
    "mpstatsinit",
    "mptestbed",
    "mrsphilips1",
    "mrsphilips2",
    "multistorey_garage_ext_seating",
    "multistorey_garage_seating",
    "murdermystery",
    "music_studio_seating_external",
    "music_studio_seating",
    "music_studio_smoking",
    "navmeshtest",
    "net_activity_creator_ui",
    "net_apartment_activity_light",
    "net_apartment_activity",
    "net_bot_brain",
    "net_bot_simplebrain",
    "net_cloud_mission_loader",
    "net_combat_soaktest",
    "net_jacking_soaktest",
    "net_session_soaktest",
    "net_test_drive",
    "net_tunable_check",
    "nigel1",
    "nigel1a",
    "nigel1b",
    "nigel1c",
    "nigel1d",
    "nigel2",
    "nigel3",
    "nightclub_ground_floor_seats",
    "nightclub_office_seats",
    "nightclub_vip_seats",
    "nightclubpeds",
    "nodemenututorial",
    "nodeviewer",
    "ob_abatdoor",
    "ob_abattoircut",
    "ob_airdancer",
    "ob_bong",
    "ob_cashregister",
    "ob_drinking_shots",
    "ob_foundry_cauldron",
    "ob_franklin_beer",
    "ob_franklin_tv",
    "ob_franklin_wine",
    "ob_huffing_gas",
    "ob_jukebox",
    "ob_mp_bed_high",
    "ob_mp_bed_low",
    "ob_mp_bed_med",
    "ob_mp_shower_med",
    "ob_mp_stripper",
    "ob_mr_raspberry_jam",
    "ob_poledancer",
    "ob_sofa_franklin",
    "ob_sofa_michael",
    "ob_telescope",
    "ob_tv",
    "ob_vend1",
    "ob_vend2",
    "ob_wheatgrass",
    "offroad_races",
    "omega1",
    "omega2",
    "paparazzo1",
    "paparazzo2",
    "paparazzo3",
    "paparazzo3a",
    "paparazzo3b",
    "paparazzo4",
    "paradise2",
    "paradise",
    "pausemenu_example",
    "pausemenu_map",
    "pausemenu_multiplayer",
    "pausemenu_sp_repeat",
    "pausemenu",
    "pausemenucareerhublaunch",
    "pb_busker",
    "pb_homeless",
    "pb_preacher",
    "pb_prostitute",
    "personal_carmod_shop",
    "photographymonkey",
    "photographywildlife",
    "physics_perf_test_launcher",
    "physics_perf_test",
    "pi_menu",
    "pickup_controller",
    "pickuptest",
    "pickupvehicles",
    "pilot_school_mp",
    "pilot_school",
    "placeholdermission",
    "placementtest",
    "planewarptest",
    "player_controller_b",
    "player_controller",
    "player_scene_f_lamgraff",
    "player_scene_f_lamtaunt",
    "player_scene_f_taxi",
    "player_scene_ft_franklin1",
    "player_scene_m_cinema",
    "player_scene_m_fbi2",
    "player_scene_m_kids",
    "player_scene_m_shopping",
    "player_scene_mf_traffic",
    "player_scene_t_bbfight",
    "player_scene_t_chasecar",
    "player_scene_t_insult",
    "player_scene_t_park",
    "player_scene_t_tie",
    "player_timetable_scene",
    "playthrough_builder",
    "pm_defend",
    "pm_delivery",
    "pm_gang_attack",
    "pm_plane_promotion",
    "pm_recover_stolen",
    "postkilled_bailbond2",
    "postrc_barry1and2",
    "postrc_barry4",
    "postrc_epsilon4",
    "postrc_nigel3",
    "profiler_registration",
    "prologue1",
    "prop_drop",
    "puzzle",
    "racetest",
    "rampage1",
    "rampage2",
    "rampage3",
    "rampage4",
    "rampage5",
    "rampage_controller",
    "randomchar_controller",
    "range_modern_mp",
    "range_modern",
    "re_abandonedcar",
    "re_accident",
    "re_armybase",
    "re_arrests",
    "re_atmrobbery",
    "re_bikethief",
    "re_border",
    "re_burials",
    "re_bus_tours",
    "re_cartheft",
    "re_chasethieves",
    "re_crashrescue",
    "re_cultshootout",
    "re_dealgonewrong",
    "re_domestic",
    "re_drunkdriver",
    "re_duel",
    "re_gang_intimidation",
    "re_gangfight",
    "re_getaway_driver",
    "re_hitch_lift",
    "re_homeland_security",
    "re_lossantosintl",
    "re_lured",
    "re_monkey",
    "re_mountdance",
    "re_muggings",
    "re_paparazzi",
    "re_prison",
    "re_prisonerlift",
    "re_prisonvanbreak",
    "re_rescuehostage",
    "re_seaplane",
    "re_securityvan",
    "re_shoprobbery",
    "re_snatched",
    "re_stag_do",
    "re_yetarian",
    "replay_controller",
    "rerecord_recording",
    "respawn_controller",
    "restrictedareas",
    "rng_output",
    "road_arcade",
    "rollercoaster",
    "rural_bank_heist",
    "rural_bank_prep1",
    "rural_bank_setup",
    "save_anywhere",
    "savegame_bed",
    "sc_lb_global_block",
    "scaleformgraphictest",
    "scaleformminigametest",
    "scaleformprofiling",
    "scaleformtest",
    "scene_builder",
    "sclub_front_bouncer",
    "script_metrics",
    "scripted_cam_editor",
    "scriptplayground",
    "scripttest1",
    "scripttest2",
    "scripttest3",
    "scripttest4",
    "scroll_arcade_cabinet",
    "sctv",
    "selector_example",
    "selector",
    "selling_short_1",
    "selling_short_2",
    "sh_intro_f_hills",
    "sh_intro_m_home",
    "shooting_camera",
    "shop_controller",
    "shoprobberies",
    "shot_bikejump",
    "shrinkletter",
    "simeon_showroom_seating",
    "smoketest",
    "social_controller",
    "solomon1",
    "solomon2",
    "solomon3",
    "sp_dlc_registration",
    "sp_editor_mission_instance",
    "sp_menuped",
    "sp_pilotschool_reg",
    "spaceshipparts",
    "spawn_activities",
    "speech_reverb_tracker",
    "spmc_instancer",
    "spmc_preloader",
    "standard_global_init",
    "standard_global_reg",
    "startup_install",
    "startup_locationtest",
    "startup_positioning",
    "startup_smoketest",
    "startup",
    "stats_controller",
    "stock_controller",
    "streaming",
    "stripclub_drinking",
    "stripclub_mp",
    "stripclub",
    "stripperhome",
    "stunt_plane_races",
    "tasklist_1",
    "tattoo_shop",
    "taxi_clowncar",
    "taxi_cutyouin",
    "taxi_deadline",
    "taxi_followcar",
    "taxi_gotyounow",
    "taxi_gotyourback",
    "taxi_needexcitement",
    "taxi_procedural",
    "taxi_takeiteasy",
    "taxi_taketobest",
    "taxilauncher",
    "taxiservice",
    "taxitutorial",
    "tempalpha",
    "temptest",
    "tennis_ambient",
    "tennis_family",
    "tennis_network_mp",
    "tennis",
    "test_startup",
    "thelastone",
    "three_card_poker",
    "timershud",
    "title_update_registration_2",
    "title_update_registration",
    "tonya1",
    "tonya2",
    "tonya3",
    "tonya4",
    "tonya5",
    "towing",
    "traffick_air",
    "traffick_ground",
    "traffickingsettings",
    "traffickingteleport",
    "train_create_widget",
    "train_tester",
    "trevor1",
    "trevor2",
    "trevor3",
    "trevor4",
    "triathlonsp",
    "tunables_registration",
    "tuneables_processing",
    "tuner_planning",
    "tuner_property_carmod",
    "tuner_sandbox_activity",
    "turret_cam_script",
    "ufo",
    "ugc_global_registration_2",
    "ugc_global_registration",
    "underwaterpickups",
    "utvc",
    "valentinerpreward2",
    "veh_play_widget",
    "vehicle_ai_test",
    "vehicle_force_widget",
    "vehicle_gen_controller",
    "vehicle_plate",
    "vehicle_stealth_mode",
    "vehiclespawning",
    "walking_ped",
    "wardrobe_mp",
    "wardrobe_sp",
    "weapon_audio_widget",
    "wizard_arcade",
    "wp_partyboombox",
    "xml_menus",
    "yoga",

}


function ADD_MP_INDEX(stat)
    local Exceptions = {
        "MP_CHAR_STAT_RALLY_ANIM",
        "MP_CHAR_ARMOUR_1_COUNT",
        "MP_CHAR_ARMOUR_2_COUNT",
        "MP_CHAR_ARMOUR_3_COUNT",
        "MP_CHAR_ARMOUR_4_COUNT",
        "MP_CHAR_ARMOUR_5_COUNT",
    }
    for _, exception in pairs(Exceptions) do
        if stat == exception then
            return "MP" .. util.get_char_slot() .. "_" .. stat
        end
    end

    if not string.contains(stat, "MP_") and not string.contains(stat, "MPPLY_") then
        return "MP" .. util.get_char_slot() .. "_" .. stat
    end
    return stat
end

function STAT_SET_INT(stat, value)
    print(stat .. "," .. value)
    STATS.STAT_SET_INT(util.joaat(ADD_MP_INDEX(stat)), value, true)
    print(util.joaat(ADD_MP_INDEX(stat)))
end

function STAT_SET_BOOL(stat, value)
    STATS.STAT_SET_BOOL(util.joaat(ADD_MP_INDEX(stat)), value, true)
end

function STAT_SET_STRING(stat, value)
    STATS.STAT_SET_STRING(util.joaat(ADD_MP_INDEX(stat)), value, true)
end

function STAT_SET_DATE(stat, year, month, day, hour, min)
    local DatePTR = memory.alloc(8 * 7) -- Thanks for helping memory stuffs, aaronlink127#0127
    memory.write_int(DatePTR, year)
    memory.write_int(DatePTR + 8, month)
    memory.write_int(DatePTR + 16, day)
    memory.write_int(DatePTR + 24, hour)
    memory.write_int(DatePTR + 32, min)
    memory.write_int(DatePTR + 40, 0) -- Seconds
    memory.write_int(DatePTR + 48, 0) -- Milliseconds
    STATS.STAT_SET_DATE(util.joaat(ADD_MP_INDEX(stat)), DatePTR, 7, true)
end

function STAT_SET_MASKED_INT(stat, value1, value2)
    STATS.STAT_SET_MASKED_INT(util.joaat(ADD_MP_INDEX(stat)), value1, value2, 8, true)
end

function SET_PACKED_STAT_BOOL_CODE(stat, value)
    STATS.SET_PACKED_STAT_BOOL_CODE(stat, value, util.get_char_slot())
end

function STAT_INCREMENT(stat, value)
    STATS.STAT_INCREMENT(util.joaat(ADD_MP_INDEX(stat)), value, true)
end

function STAT_GET_INT(stat)
    local IntPTR = memory.alloc_int()
    STATS.STAT_GET_INT(util.joaat(ADD_MP_INDEX(stat)), IntPTR, -1)
    return memory.read_int(IntPTR)
end

function STAT_GET_FLOAT(stat)
    local FloatPTR = memory.alloc_int()
    STATS.STAT_GET_FLOAT(util.joaat(ADD_MP_INDEX(stat)), FloatPTR, -1)
    return tonumber(string.format("%.3f", memory.read_float(FloatPTR)))
end

function STAT_GET_BOOL(stat)
    if STAT_GET_INT(stat) ~= 0 then
        return "true"
    else
        return "false"
    end
end

function STAT_GET_STRING(stat)
    return STATS.STAT_GET_STRING(util.joaat(ADD_MP_INDEX(stat)), -1)
end

function STAT_GET_DATE(stat, type)
    local DatePTR = memory.alloc(8 * 7)
    STATS.STAT_GET_DATE(util.joaat(ADD_MP_INDEX(stat)), DatePTR, 7, true)
    local DateTypes = {
        "Years",
        "Months",
        "Days",
        "Hours",
        "Mins",
        -- Seconds,
        -- Milliseconds,
    }
    for i = 1, #DateTypes do
        if type == DateTypes[i] then
            return memory.read_int(DatePTR + 8 * (i - 1))
        end
    end
end

function SET_INT_GLOBAL(global, value)
    memory.write_int(memory.script_global(global), value)
end

function SET_FLOAT_GLOBAL(global, value)
    memory.write_float(memory.script_global(global), value)
end

function GET_INT_GLOBAL(global)
    return memory.read_int(memory.script_global(global))
end

function SET_PACKED_INT_GLOBAL(start_global, end_global, value)
    for i = start_global, end_global do
        SET_INT_GLOBAL(262145 + i, value)
    end
end

function SET_INT_LOCAL(script, script_local, value)
    if memory.script_local(script, script_local) ~= 0 then
        memory.write_int(memory.script_local(script, script_local), value)
    end
end

function SET_FLOAT_LOCAL(script, script_local, value)
    if memory.script_local(script, script_local) ~= 0 then
        memory.write_float(memory.script_local(script, script_local), value)
    end
end

function GET_INT_LOCAL(script, script_local)
    if memory.script_local(script, script_local) ~= 0 then
        local ReadLocal = memory.read_int(memory.script_local(script, script_local))
        if ReadLocal ~= nil then
            return ReadLocal
        end
    end
end

function SET_BIT(bits, place) -- Credit goes to WiriScript
    return (bits | (1 << place))
end

function SET_GLOBAL_BIT(global, bit)
    local Addr = memory.script_global(global)
    memory.write_int(Addr, SET_BIT(memory.read_int(Addr), bit))
end

function SET_LOCAL_BIT(script, script_local, bit)
    if memory.script_local(script, script_local) ~= 0 then
        local Addr = memory.script_local(script, script_local)
        memory.write_int(Addr, SET_BIT(memory.read_int(Addr), bit))
    end
end

---

menu.action(menu.my_root(), "restart lua", { "latiaorestartlua" }, "restartlua", function()
    util.restart_script()
end)
util.keep_running()

util.require_natives("2944b")


local killaura = menu.list(menu.my_root(), "killaura", {}, "")
local self = menu.list(menu.my_root(), "self", {}, "")
local world = menu.list(menu.my_root(), "world", {}, "")
local server = menu.list(menu.my_root(), "server", {}, "")
local test = menu.list(menu.my_root(), "test", {}, "")
local dividends = menu.list(menu.my_root(), "dividends", {}, "")
local admin = menu.list(menu.my_root(), "admin", {}, "")
local adblock = menu.list(menu.my_root(), "adblock", {}, "")
-- local Multipliers = menu.list(menu.my_root(), "Multipliers", {}, "")






kill_aura_peds = false
kill_aura_player = false
kill_aura_in_vehicle = false
kill_aura_through_walls = false
kill_aura_explosion = false
kill_aura_nick_explosion = false
kill_aura_F_Loop = false
IS_ENTITY_DEAD = false
menu.toggle(killaura, "kill_aura_peds", {}, "", function(on)
    kill_aura_peds = on
end)

menu.toggle(killaura, "killaura_player", {}, "", function(on)
    kill_aura_player = on
end)

menu.toggle(killaura, "killaura_in_vehicle", {}, "", function(on)
    kill_aura_in_vehicle = on
end)

menu.toggle(killaura, "killaura_attack_walls_back", {}, "", function(on)
    kill_aura_through_walls = on
end)

menu.toggle(killaura, "killaura_explosion", {}, "", function(on)
    kill_aura_explosion = on
end)
menu.toggle(killaura, "killaura_nick_explosion", {}, "", function(on)
    kill_aura_nick_explosion = on
end)
menu.toggle(killaura, "kill_aura_F_Loop", {}, "", function(on)
    kill_aura_F_Loop = on
end)
local time = menu.slider(killaura, "time", { "time" }, "", 0,
    2147483647, 0, 1,
    function() end)

menu.toggle_loop(killaura, "killaura all", { "latiaokillaura" }, ("SHOOT ALL"), function()
    if kill_aura_peds or kill_aura_player or kill_aura_in_vehicle then
        for _, ped in pairs(entities.get_all_peds_as_handles()) do
            if ENTITY.IS_ENTITY_DEAD(ped) or players.user_ped() == ped or

                (PED.IS_PED_IN_ANY_VEHICLE(ped, false) and not kill_aura_in_vehicle) or
                (entities.is_player_ped(ped) == false and not kill_aura_peds) or
                (entities.is_player_ped(ped) == true and not kill_aura_player) or

                (not ENTITY.HAS_ENTITY_CLEAR_LOS_TO_ENTITY(players.user_ped(), ped, 17) and not kill_aura_through_walls) 
            then
                goto continue
            end

            local pos = v3.new(ENTITY.GET_ENTITY_COORDS(ped))
            if kill_aura_F_Loop then
                FIRE.ADD_EXPLOSION(pos.x, pos.y, pos.z, 12, 2147483647, false, true, 0.0)
            else
                if kill_aura_nick_explosion then
                    FIRE.ADD_EXPLOSION(pos.x, pos.y, pos.z, 0, 2147483647, false, true, 0.0)
                else
                    if kill_aura_explosion then
                        FIRE.ADD_OWNED_EXPLOSION(players.user_ped(), pos.x, pos.y, pos.z, 0, 2147483647, false,
                            true,
                            0.0)
                    else
                        MISC.SHOOT_SINGLE_BULLET_BETWEEN_COORDS(pos.x, pos.y, pos.z + 1.5, pos.x, pos.y,
                            pos.z,
                            2147483647,
                            true,
                            util.joaat("weapon_pistol"), players.user_ped(), false, true, 1)
                        util.yield(menu.get_value(time))
                    end
                end
            end
            ::continue::
        end
    end
end)







menu.toggle_loop(self, "heal/armour", {}, "", function()
    util.draw_debug_text("heal: " ..
        ENTITY.GET_ENTITY_HEALTH(players.user_ped()) .. "/" .. PED.GET_PED_MAX_HEALTH(players.user_ped()) ..
        "\narmour: " .. PED.GET_PED_ARMOUR(players.user_ped()) .. "/" .. PLAYER.GET_PLAYER_MAX_ARMOUR(players.user()))
end)

-- menu.toggle_loop(self, "silence", {}, "", function()
--     PLAYER.SET_PLAYER_NOISE_MULTIPLIER(players.user(), 0.0)
--     PLAYER.SET_PLAYER_SNEAKING_NOISE_MULTIPLIER(players.user(), 0.0)
-- end)



menu.toggle_loop(world, "delallobjects", { "latiaodelallobjects" }, "delallobjects.", function()
    for k, ent in pairs(entities.get_all_objects_as_handles()) do
        entities.delete_by_handle(ent)
    end
end)

menu.toggle_loop(world, "delallpeds", { "latiaodelallpeds" }, "delallpeds.", function()
    for k, ent in pairs(entities.get_all_peds_as_handles()) do
        if entities.is_player_ped(ent) == true then
            goto out
        end
        entities.delete_by_handle(ent)
        ::out::
    end
end)



menu.toggle_loop(world, "delallvehicles", { "latiaodelallvehicles" }, "delallvehicles.", function()
    for k, ent in pairs(entities.get_all_vehicles_as_handles()) do
        entities.delete_by_handle(ent)
    end
end)

menu.toggle_loop(world, "delallpickups", { "latiaodelallvehicles" }, "delallvehicles.", function()
    for k, ent in pairs(entities.get_all_pickups_as_handles()) do
        entities.delete_by_handle(ent)
    end
end)

menu.action(world, "delall", { "latiaodelall" }, "delall.", function()
    local targets = {}

    for _, ped in ipairs(entities.get_all_peds_as_handles()) do
        table.insert(targets, ped)
    end

    for _, vehicle in ipairs(entities.get_all_vehicles_as_handles()) do
        table.insert(targets, vehicle)
    end

    for _, object in ipairs(entities.get_all_objects_as_handles()) do
        table.insert(targets, object)
    end

    for _, pickups in ipairs(entities.get_all_pickups_as_handles()) do
        table.insert(targets, pickups)
    end

    for _, target in ipairs(targets) do
        entities.delete_by_handle(target)
        menu.trigger_commands("deleteropes")
    end
end)



menu.toggle_loop(world, "TPALL 0 0 0", { "latiaodelallvehicles" }, "delallvehicles.", function()
    local targets = {}

    for _, ped in ipairs(entities.get_all_peds_as_handles()) do
        if entities.is_player_ped(ped) == true then
            goto out
        end
        table.insert(targets, ped)
        ::out::
    end

    for _, vehicle in ipairs(entities.get_all_vehicles_as_handles()) do
        table.insert(targets, vehicle)
    end
    for _, object in ipairs(entities.get_all_objects_as_handles()) do
        table.insert(targets, object)
    end

    for _, pickups in ipairs(entities.get_all_pickups_as_handles()) do
        table.insert(targets, pickups)
    end

    for _, target in ipairs(targets) do
        ENTITY.SET_ENTITY_COORDS(target, 0, 0, 2600, false)
    end
end)




menu.toggle_loop(world, "kick ped to vehicle", { "latiaokickpedvehicle" }, ("kickpedvehicle"), function()
    for _, ped in pairs(entities.get_all_peds_as_handles()) do
        if entities.is_player_ped(ped) == true then
            goto out
        end
        if PED.IS_PED_IN_ANY_VEHICLE(ped, false) then
            TASK.CLEAR_PED_TASKS_IMMEDIATELY(ped)
        end
        ::out::
    end
end)




menu.toggle_loop(world, "remove DEAD(ped)", { "latiaoremoveDEADped" }, ("latiaoremoveDEADped"), function()
    for _, ped in pairs(entities.get_all_peds_as_handles()) do
        if ENTITY.IS_ENTITY_DEAD(ped) then
            entities.delete_by_handle(ped)
            util.yield()
        end
    end
end)



menu.toggle_loop(world, "tp DEAD(ped) to me down", { "latiaoremoveDEADped" }, ("latiaoremoveDEADped"), function()
    local pos = players.get_position(players.user())
    for _, ped in pairs(entities.get_all_peds_as_handles()) do
        if ENTITY.IS_ENTITY_DEAD(ped) then
            ENTITY.SET_ENTITY_COORDS(ped, pos.x, pos.y, pos.z - 10, false)
            util.yield()
        end
    end
end)

menu.toggle_loop(world, "REMOVE_ALL_PED_WEAPONS", { "latiaoREMOVE_ALL_PED_WEAPONS" }, "REMOVE_ALL_PED_WEAPONS.",
    function()
        for _, ped in pairs(entities.get_all_peds_as_handles()) do
            for k, pid in pairs(players.list()) do
                if PLAYER.GET_PLAYER_PED_SCRIPT_INDEX(pid) == ped then
                    goto out
                end
            end
            WEAPON.REMOVE_ALL_PED_WEAPONS(ped)
            util.yield()
            ::out::
        end
    end)
menu.toggle_loop(world, "FREEZE_ENTITY_POSITION", { "latiaoFREEZE_ENTITY_POSITION" }, "FREEZE_ENTITY_POSITION.",
    function()
        for _, ped in pairs(entities.get_all_peds_as_handles()) do
            for k, pid in pairs(players.list()) do
                if PLAYER.GET_PLAYER_PED_SCRIPT_INDEX(pid) == ped then
                    goto out
                end
            end

            ENTITY.FREEZE_ENTITY_POSITION(ped, true)
            
            ::out::
        end
    end, function()
        for _, ped in pairs(entities.get_all_peds_as_handles()) do
            for k, pid in pairs(players.list()) do
                if PLAYER.GET_PLAYER_PED_SCRIPT_INDEX(pid) == ped then
                    goto out
                end
            end
            ENTITY.FREEZE_ENTITY_POSITION(ped, false)
            ::out::
        end
    end)

menu.toggle_loop(world, "tppedtome", { "latiaotppedtome" }, "latiaotppedtome.", function()
    local pos = players.get_position(players.user())
    pos:add(v3.new(0, 0, 2.5))
    for _, ped in entities.get_all_peds_as_handles() do
        if entities.is_player_ped(ped) == true then
            goto out
        end
        ENTITY.SET_ENTITY_COORDS(ped, pos.x, pos.y, pos.z, false)
        ::out::
    end
end)

menu.toggle_loop(world, "silencekillallped", { "latiaosilencekillallped" }, "latiaotsilencekillallped.", function()
    for _, ped in entities.get_all_peds_as_handles() do
        if entities.is_player_ped(ped) == true then
            goto out
        end

        ENTITY.SET_ENTITY_COORDS(ped, 0, 0, 2500, false)
        FIRE.ADD_OWNED_EXPLOSION(players.user_ped(), 0, 0, 2500, 0, 2147483647, false, true, 0.0)
        ::out::
    end
end)

menu.toggle_loop(world, "tppedto 00", { "latiaotppedto00" }, "latiaotpped00.", function()
    for _, ped in entities.get_all_peds_as_handles() do
        if entities.is_player_ped(ped) == true then
            goto out
        end
        ENTITY.SET_ENTITY_COORDS(ped, 0, 0, -200, false)
        ::out::
    end
end)


menu.toggle_loop(world, "SET_PED_TO_RAGDOLL_WITH_FALL ped", { "latiaoSET_PED_TO_RAGDOLL_WITH_FALL" },
    "latiaoSET_PED_TO_RAGDOLL_WITH_FALL.", function()
        for _, ped in entities.get_all_peds_as_handles() do
            PED.SET_PED_TO_RAGDOLL(ped, 10000, 0, 0, true, true, false);
        end
    end)








menu.toggle_loop(world, "CLEAR_PED_TASKS_IMMEDIATELY", { "latiaoCLEAR_PED_TASKS_IMMEDIATELY" },
    "CLEAR_PED_TASKS_IMMEDIATELY.", function()
        for _, ped in pairs(entities.get_all_peds_as_handles()) do
            for k, pid in pairs(players.list()) do
                if PLAYER.GET_PLAYER_PED_SCRIPT_INDEX(pid) == ped then
                    goto out
                end
            end

            TASK.CLEAR_PED_TASKS_IMMEDIATELY(ped)
            ::out::
        end
    end)





menu.toggle_loop(world, "maxpedVEHICLE", { "latiaomaxpedVEHICLE" }, "latiaomaxpedVEHICLE.", function()
    PED.INSTANTLY_FILL_PED_POPULATION()
    VEHICLE.INSTANTLY_FILL_VEHICLE_POPULATION()
end)
menu.toggle_loop(world, "maxpedforyouteam", { "latiaomaxpedforyouteam" }, "latiaomaxpedforyouteam.", function()
    for _, ped in pairs(entities.get_all_peds_as_handles()) do
        PED.SET_PED_RELATIONSHIP_GROUP_HASH(ped, PED.GET_PED_RELATIONSHIP_GROUP_HASH(players.user_ped()))
    end
end)


menu.toggle_loop(world, "no new cops for all", { "" }, "", function()
    for k, pid in pairs(players.list()) do
        PLAYER.SET_DISPATCH_COPS_FOR_PLAYER(pid, false)
    end
end, function()
    for k, pid in pairs(players.list()) do
        PLAYER.SET_DISPATCH_COPS_FOR_PLAYER(pid, true)
    end
end)



menu.toggle_loop(world, "tp Picked", { "LatiaoTpPicked" }, ("TpPicked for you"), function()
    local pos = players.get_position(players.user())
    for _, pickup in entities.get_all_pickups_as_handles() do
        ENTITY.SET_ENTITY_COORDS(pickup, pos.x, pos.y, pos.z, false)
    end
end)





menu.toggle_loop(world, "del cops", { "latiaodelcops" }, "latiaodelcops", function()
    for k, ent in pairs(entities.get_all_peds_as_handles()) do
        for _, copsModels in ipairs(
            {
                util.joaat("s_m_y_cop_01"),
                util.joaat("s_m_y_sheriff_01"),
                util.joaat("s_m_y_swat_01"),
                util.joaat("s_m_y_hwaycop_01"),
            }
        ) do
            if ENTITY.GET_ENTITY_MODEL(ent) ==

                copsModels

            then
                entities.delete_by_handle(ent)
                break
            end
        end
    end
end)






menu.toggle_loop(server, "auto host", { "latiaoautohost" }, ("autohost"), function()
    if not (players.get_host() == players.user()) then
        menu.trigger_commands("kick" .. PLAYER.GET_PLAYER_NAME(players.get_host()))
    end
end)
menu.toggle_loop(server, "auto Script host", { "latiaoautoScripthost" }, ("autoScripthost"), function()
    if not (players.get_script_host() == players.user()) then
        util.request_script_host("freemode")
    end
end)


menu.toggle_loop(server, "kickall exclude hosts", { "latiaokickallexcludehost" }, "latiaokickallexcludehost", function()
    for k, pid in pairs(players.list()) do
        if pid == players.get_host() or pid == players.user() then goto out end

        util.trigger_script_event(1 << pid, { -1544003568, pid })
        ::out::
    end
end)

menu.toggle_loop(server, "kickall exclude hosts and cheat", { "latiaokickallexcludehost" }, "latiaokickallexcludehost",
    function()
        for k, pid in pairs(players.list()) do
            if pid == players.get_host() or pid == players.user() or players.is_marked_as_modder(pid) then goto out end
            util.request_script_host("freemode")
            util.trigger_script_event(1 << pid, { -1544003568, pid })
            ::out::
        end
    end)


menu.toggle_loop(server, "LOVEkick + report all moder", { "latiaocrashkickmod" }, "crash and kickmod.", function()
    for k, pid in pairs(players.list()) do
        if pid == players.get_host() or pid == players.user() then goto out end
        if players.is_marked_as_modder(pid) then
            local attack = PLAYER.GET_PLAYER_NAME(pid)
            if pid == players.user() then goto out end
            menu.trigger_commands("reportgriefing" .. attack)
            menu.trigger_commands("reportexploits" .. attack)
            menu.trigger_commands("reportbugabuse" .. attack)
            util.yield(500)
            menu.trigger_commands("loveletterkick" .. attack)
        end
        ::out::
    end
end)

menu.toggle_loop(server, "LOVEkick all moder", { "latiaocrashkickmod" }, "crash and kickmod.", function()
    for k, pid in pairs(players.list()) do
        if pid == players.get_host() or pid == players.user() then goto out end
        if players.is_marked_as_modder(pid) then
            local attack = PLAYER.GET_PLAYER_NAME(pid)
            if pid == players.user() then goto out end
            menu.trigger_commands("loveletterkick" .. attack)
        end
        ::out::
    end
end)

menu.toggle_loop(server, "if you host kick chinese", { "latiaocrashall" }, "", function()
    if NETWORK.NETWORK_IS_HOST() then
        for k, pid in pairs(players.list()) do
            local language = players.get_language(pid)
            if language and language == 12 then
                local attack = PLAYER.GET_PLAYER_NAME(pid)
                if pid == players.user() then goto out end
                menu.trigger_commands("loveletterkick" .. attack)
            end
            ::out::
        end
    end
end)

menu.toggle_loop(server, "if you host loveletterkick all mod", { "latiaobankallmoder" }, "latiaobankallmoder.",
    function()
        if NETWORK.NETWORK_IS_HOST() then
            for k, pid in pairs(players.list()) do
                if pid == players.user() then goto out end
                if players.is_marked_as_modder(pid) then
                    local attack = PLAYER.GET_PLAYER_NAME(pid)
                    util.toast(attack .. "kick ing")
                    menu.trigger_commands("reportgriefing" .. attack)
                    menu.trigger_commands("reportexploits" .. attack)
                    menu.trigger_commands("reportbugabuse" .. attack)
                    util.yield(1000)
                    menu.trigger_commands("loveletterkick" .. attack)
                end
                ::out::
            end
        end
    end)







menu.toggle_loop(server, "if you host loveletterkick attack you mod", { "latiaobankallmoder" }, "latiaobankallmoder.",
    function()
        if NETWORK.NETWORK_IS_HOST() then
            for k, pid in pairs(players.list()) do
                if pid == players.user() then goto out end
                if players.is_marked_as_attacker(pid) then
                    local attack = PLAYER.GET_PLAYER_NAME(pid)
                    util.toast(attack .. "kick ing")
                    menu.trigger_commands("reportgriefing" .. attack)
                    menu.trigger_commands("reportexploits" .. attack)
                    menu.trigger_commands("reportbugabuse" .. attack)
                    util.yield(100)
                    menu.trigger_commands("loveletterkick" .. attack)
                end
                ::out::
            end
        end
    end)

menu.toggle_loop(server, "if you host NETWORK_SESSION_KICK_PLAYER attack you mod", { "latiaobankallmoder" },
    "latiaobankallmoder.",
    function()
        if NETWORK.NETWORK_IS_HOST() then
            for k, pid in pairs(players.list()) do
                if pid == players.user() then goto out end
                if players.is_marked_as_attacker(pid) then
                    local attack = PLAYER.GET_PLAYER_NAME(pid)
                    util.toast(attack .. "kick ing")
                    menu.trigger_commands("reportgriefing" .. attack)
                    menu.trigger_commands("reportexploits" .. attack)
                    menu.trigger_commands("reportbugabuse" .. attack)
                    util.yield(100)
                    NETWORK.NETWORK_SESSION_KICK_PLAYER(pid)
                end
                ::out::
            end
        end
    end)


menu.toggle_loop(server, "if you host ban all moder", { "latiaobankallmoder" }, "latiaobankallmoder.",
    function()
        if NETWORK.NETWORK_IS_HOST() then
            for k, pid in pairs(players.list()) do
                if pid == players.user() then goto out end
                if players.is_marked_as_modder(pid) then
                    local attack = PLAYER.GET_PLAYER_NAME(pid)
                    util.toast(attack .. "kick ing")
                    menu.trigger_commands("reportgriefing" .. attack)
                    menu.trigger_commands("reportexploits" .. attack)
                    menu.trigger_commands("reportbugabuse" .. attack)
                    util.yield(100)
                    menu.trigger_commands("ban" .. attack)
                end
                ::out::
            end
        end
    end)


menu.toggle_loop(server, "if you no host kick for kick you cheat", { "raidallplayer" }, "", function()
    if NETWORK.NETWORK_IS_HOST() then
        menu.trigger_command(menu.ref_by_path("Online>Protections>Events>Kick Event>Love Letter Kick>Disabled"))
    else
        menu.trigger_command(menu.ref_by_path("Online>Protections>Events>Kick Event>Love Letter Kick>Strangers"))
    end
end)




menu.action(server, "love letter kick all", { "latiaoloveletterkickall" }, "loveletter kick all.", function()
    for k, pid in pairs(players.list()) do
        if pid == players.user() then goto out end
        local player = PLAYER.GET_PLAYER_NAME(pid)

        menu.trigger_commands("loveletterkick" .. player)
        ::out::
    end
end)




menu.action(server, "hostkickall", { "latiaohostkickall" }, "latiaohostkickall.", function()
    if NETWORK.NETWORK_IS_HOST() then
        for k, pid in pairs(players.list()) do
            if pid == players.user() then goto out end
            NETWORK.NETWORK_SESSION_KICK_PLAYER(pid)
            ::out::
        end
    end
end)


menu.action(server, "timeoutall", { "latiaotimeout" }, "latiaotimeout.", function()
    for k, pid in pairs(players.list()) do
        if pid == players.user() then goto out end
        local player = PLAYER.GET_PLAYER_NAME(pid)
        menu.trigger_commands("timeout" .. player)
        ::out::
    end
end)

menu.action(server, "kick me", { "latiaokickme" }, "latiaokickme.", function()
    NETWORK.NETWORK_SESSION_KICK_PLAYER(players.user())
end)

menu.toggle_loop(server, "if you host reportall", { "latiaoreportall" }, "reportall.", function()
    util.yield(100)
    if NETWORK.NETWORK_IS_HOST() then
        menu.trigger_command(menu.ref_by_path("Players>All Players>Increment Commend/Report Stats>Cheating or Modding"))
        util.yield()
    end
end)

menu.toggle_loop(server, "kick all for vehicle script_event", { "latiaoreportall" }, "reportall.", function()
    for k, pid in pairs(players.list()) do
        util.trigger_script_event(1 << pid, { -503325966 })
    end
end)

menu.toggle_loop(server, "fake hack crash attack all no host", { "latiaofackhackattackall" }, "reportall.", function()
    for k, pid in pairs(players.list()) do
        if pid == players.get_host() or pid == players.user() then goto out end
        util.trigger_script_event(1 << pid, { -375628860, pid, 2147483647 })
        ::out::
    end
end)

menu.toggle_loop(server, "fake hack kick attack all no host", { "latiaofackhackattackall" }, "reportall.", function()
    for k, pid in pairs(players.list()) do
        if pid == players.get_host() or pid == players.user() then goto out end

        util.trigger_script_event(1 << pid, { -901348601 })
        ::out::
    end
end)

menu.toggle_loop(server, "report all no host", { "latiaofackhackattackall" }, "reportall.", function()
    util.yield(500)
    for k, pid in pairs(players.list()) do
        if pid == players.get_host() or pid == players.user() then goto out end
        local player = PLAYER.GET_PLAYER_NAME(pid)
        menu.trigger_commands("reportgriefing" .. player)
        menu.trigger_commands("reportexploits" .. player)
        menu.trigger_commands("reportbugabuse" .. player)
        ::out::
    end
end)



menu.toggle_loop(server, "if you host kick ad bot", { "latiaoifyouhostkickadbot" }, "reportall.", function()
    if NETWORK.NETWORK_IS_HOST() then
        menu.trigger_command(menu.ref_by_path("Online>Chat>Reactions>Advertisement>Love Letter Kick>Strangers"))
    else
        menu.trigger_command(menu.ref_by_path("Online>Chat>Reactions>Advertisement>Love Letter Kick>Disabled"))
    end
end)

menu.toggle_loop(server, "bad TIMER_STOP SOUND for all", { "latiaobedsoundforall" }, "latiaobedsoundforall", function()
        AUDIO.PLAY_SOUND_FROM_COORD(-1, "TIMER_STOP", 0, 0, 0, "HUD_MINI_GAME_SOUNDSET", true, 2147483647, true)

    util.yield(50)
end)

menu.toggle_loop(server, "bad WastedSounds SOUND for all", { "latiaobedsoundforall" }, "latiaobedsoundforall", function()

        AUDIO.PLAY_SOUND_FROM_COORD(-1, "MP_Flash", 0, 0, 0, "WastedSounds", true, 2147483647, true)

    util.yield(50)
end)

menu.toggle_loop(server, "bad Camera_Shoot SOUND for all", { "latiaobedsoundforall" }, "latiaobedsoundforall", function()

        AUDIO.PLAY_SOUND_FROM_COORD(-1, "Camera_Shoot", 0, 0, 0, "Phone_Soundset_Franklin", true, 2147483647, true)

    util.yield(50)
end)



menu.action(server, "print all", { "latiaoprintall" }, "latiaocprintall", function()
    for k, pid in pairs(players.list()) do
        local attack = PLAYER.GET_PLAYER_NAME(pid)
        print(attack)
    end
end)



menu.toggle_loop(server, "RandomPlayerEXPLOSION", { "latiaoRandomPlayerEXPLOSION" }, "", function()
    for k, pid in pairs(players.list()) do
        local randomPid = PLAYER.GET_PLAYER_PED_SCRIPT_INDEX(players.list()[math.random(1, #players.list())])
        local pos = v3.new(ENTITY.GET_ENTITY_COORDS(PLAYER.GET_PLAYER_PED(pid)))
        FIRE.ADD_OWNED_EXPLOSION(randomPid, pos.x, pos.y, pos.z, 0, 2147483647, false, true, 0.0)
    end
end)




menu.action(test, "test", { "test" }, "test.", function()

end)


menu.toggle_loop(server, "REQUES_ENTITY ped", { "latiaoREQUES_ENTITYped" }, "latiaoREQUES_ENTITYped.", function()
    for _, target in ipairs(entities.get_all_peds_as_handles()) do
        NETWORK.NETWORK_REQUEST_CONTROL_OF_ENTITY(target)
    end
end)


menu.toggle_loop(server, "REQUES_ENTITY objects", { "latiaoREQUES_ENTITYobjects" }, "REQUES_ENTITYobjects.", function()
    for _, target in ipairs(entities.get_all_objects_as_handles()) do
        NETWORK.NETWORK_REQUEST_CONTROL_OF_ENTITY(target)
    end
end)

menu.toggle_loop(server, "REQUES_ENTITY vehicles", { "latiaoREQUES_ENTITYvehicles" }, "REQUES_ENTITYvehicles.",
    function()
        for _, target in ipairs(entities.get_all_vehicles_as_handles()) do
            NETWORK.NETWORK_REQUEST_CONTROL_OF_ENTITY(target)
        end
    end)

menu.toggle_loop(server, "REQUES_ENTITY vehicles no player", { "" }, ".", function()
    for _, target in ipairs(entities.get_all_vehicles_as_handles()) do
        for k, pid in pairs(players.list()) do
            local v1 = PED.GET_VEHICLE_PED_IS_IN(PLAYER.GET_PLAYER_PED_SCRIPT_INDEX(pid), true)
            if target == v1 then
                goto out
            end
        end
        NETWORK.NETWORK_REQUEST_CONTROL_OF_ENTITY(target)
    end
    ::out::
end)
menu.toggle_loop(server, "REQUES_ENTITY pickups", { "" }, "", function()
    for k, target in pairs(entities.get_all_pickups_as_handles()) do
        NETWORK.NETWORK_REQUEST_CONTROL_OF_ENTITY(target)
    end
end)





menu.action(test, "NETWORK_SESSION_END", { "latiaoNETWORK_SESSION_END" }, "NETWORK_SESSION_END.", function()
    NETWORK.NETWORK_SESSION_END(0, 0);
end)


menu.action(test, "IS_SCRIPTED_CONVERSATION_ONGOING", { "latiaoIS_SCRIPTED_CONVERSATION_ONGOING" },
    "IS_SCRIPTED_CONVERSATION_ONGOING.", function()
        AUDIO.STOP_SCRIPTED_CONVERSATION(false)
    end)




menu.action(world, "autoDRIVE", { "latiaoautoDRIVE" }, "autoDRIVE.", function()
    local pos = v3.new(HUD.GET_BLIP_COORDS(HUD.GET_FIRST_BLIP_INFO_ID(8)))
    TASK.TASK_VEHICLE_DRIVE_TO_COORD(PLAYER.GET_PLAYER_PED_SCRIPT_INDEX(players.user()),
        entities.get_user_vehicle_as_handle(), pos.x, pos.y, pos.z, 1000.0, 1.0,
        ENTITY.GET_ENTITY_MODEL(entities.get_user_vehicle_as_handle()), 787004, 1.0, 1)
end)


menu.action(world, "stopautoDRIVE", { "latiaostopautoDRIVE" }, "stopautoDRIVE.", function()
    TASK.CLEAR_PED_TASKS(PLAYER.GET_PLAYER_PED_SCRIPT_INDEX(players.user()))
end)

menu.action(server, "Bad PARACHUTE_MODEL Crash All", { "latiaocrashall" }, "crashall.", function()
    STREAMING.REQUEST_MODEL(util.joaat("prop_beach_parasol_05"))
    while not STREAMING.HAS_MODEL_LOADED(util.joaat("prop_beach_parasol_05")) do util.yield() end
    PLAYER.SET_PLAYER_PARACHUTE_MODEL_OVERRIDE(players.user(), util.joaat("prop_beach_parasol_05"))
    ENTITY.SET_ENTITY_COORDS_NO_OFFSET(PLAYER.GET_PLAYER_PED_SCRIPT_INDEX(players.user()), 0, 0, 500, 0, 0, 0)
    util.yield(1000)
    PED.FORCE_PED_TO_OPEN_PARACHUTE(PLAYER.GET_PLAYER_PED_SCRIPT_INDEX(players.user()))
    util.yield(5000)
    menu.trigger_commands("tpmazehelipad")
    PLAYER.SET_PLAYER_PARACHUTE_MODEL_OVERRIDE(players.user(), 0)
end)



menu.action(test, "GetAllPlayerInfo", { "latiaoGetAllPlayerInfo" }, "latiaoGetAllPlayerInfo.", function()
    for k, pid in pairs(players.list()) do
        local playerPED = PLAYER.GET_PLAYER_PED_SCRIPT_INDEX(pid)
        local playerNAME = PLAYER.GET_PLAYER_NAME(pid)
        local gameLANGUAGE = players.get_language(pid)
        print("player:" .. playerNAME .. " pid:" .. pid .. " PlayerPed:" .. playerPED .. " gameLANGUAGE" .. gameLANGUAGE)
    end
end)
menu.toggle_loop(test, "clean chat", { "latiaocleanchat" }, "latiaocleanchat.", function()
    chat.send_message("\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n", false, true, true)
end)





menu.action(test, "CLEAR_ALL_HELP_MESSAGES", { "latiaoCLEAR_ALL_HELP_MESSAGES" }, "CLEAR_ALL_HELP_MESSAGES.", function()
    HUD.CLEAR_ALL_HELP_MESSAGES()
end)











menu.toggle_loop(dividends, "jump hack", { "latiaojumphack" }, "latiaojumphack.", function()
    SET_INT_LOCAL("fm_mission_controller_2020", 23669, 5)
    SET_FLOAT_LOCAL("fm_mission_controller_2020", 29685 + 3, 100)
    SET_INT_LOCAL("fm_mission_controller_2020", 1718, GET_INT_LOCAL("fm_mission_controller_2020", 1719))
    SET_INT_LOCAL("fm_mission_controller", 52964, 5)
    SET_INT_LOCAL("fm_mission_controller", 54026, 5)
    SET_INT_LOCAL("fm_mission_controller", 10101 + 7, GET_INT_LOCAL("fm_mission_controller", 10101 + 37))
    SET_INT_LOCAL("fm_mission_controller", 1509, 3)
    SET_INT_LOCAL("fm_mission_controller", 1540, 2)
    SET_INT_LOCAL("fm_mission_controller", 1266 + 135, 3)
    SET_INT_LOCAL("fm_mission_controller", 11760 + 24, 7)
    SET_FLOAT_LOCAL("fm_mission_controller", 10061 + 11, 100)
    SET_LOCAL_BIT("fm_mission_controller", 9767, 9)
    SET_INT_LOCAL("fm_mission_controller_2020", 975 + 135, 3)
end)
menu.action(dividends, "MPPLY_H3_COOLDOWN", { "" }, "MPPLY_H3_COOLDOWN.", function()
    STAT_SET_INT("MPPLY_H3_COOLDOWN", -1)
end)

menu.action(dividends, "unclock casino Points", {}, "", function()
    STAT_SET_INT("MPx_H3OPT_ACCESSPOINTS", -1)
    STAT_SET_INT("MPx_H3OPT_POI", -1)
end)
menu.action(dividends, "reset casino Boards H3OPT_BITSET", { "" }, "H3OPT_BITSET1.", function()
    STAT_SET_INT("H3OPT_BITSET1", 0)
    STAT_SET_INT("H3OPT_BITSET0", 0)
end)
menu.action(dividends, "load casino Boards H3OPT_BITSET", { "" }, "H3OPT_BITSET1.", function()
    STAT_SET_INT("H3OPT_BITSET1", -1)
    STAT_SET_INT("H3OPT_BITSET0", -1)
end)

local nohostalldividends = menu.slider(dividends, "nohostalldividends", { "nohostcasino" }, "", -100000, 100000, 100, 5,
    function()

    end)

menu.toggle_loop(dividends, "casino and Perico and Doomsday for you(you not host)", { "" }, "latiaonohost.", function()
    SET_INT_GLOBAL(2684820 + 6606, menu.get_value(nohostalldividends))
end)



local casino = menu.slider(dividends, "casino", { "casino" }, "max 3600000", -100000, 100000, 100, 5, function() end)
menu.toggle_loop(dividends, "casino all (you host)", { "latiaocasinoallhost" }, "latiaocasinoallhost.", function()
    SET_INT_GLOBAL(1971696 + 1497 + 736 + 92 + 1, menu.get_value(casino))

    SET_INT_GLOBAL(1971696 + 1497 + 736 + 92 + 2, menu.get_value(casino))

    SET_INT_GLOBAL(1971696 + 1497 + 736 + 92 + 3, menu.get_value(casino))

    SET_INT_GLOBAL(1971696 + 1497 + 736 + 92 + 4, menu.get_value(casino))
end)


menu.action(dividends, "casino Forced Launch", { "" }, "latiaonohost.", function()
    SET_INT_GLOBAL(1971696 + 1497 + 736 + 87 + 0, -1)
    SET_INT_GLOBAL(1971696 + 1497 + 736 + 87 + 1, -1)
    SET_INT_GLOBAL(1971696 + 1497 + 736 + 87 + 2, -1)
    SET_INT_GLOBAL(1971696 + 1497 + 736 + 87 + 3, -1)
end)
-- menu.action(dividends, "casino Board3", { "latiaoBoard3" }, "latiaoBoard3.", function()
--     SET_INT_GLOBAL(1971696 + 1497 + 1017, 11)
--     SET_INT_GLOBAL(1971696 + 1497 + 1018, 11)
--     menu.trigger_commands("latiaoRefreshBoards")
-- end)
menu.action(dividends, "RefreshBoards", { "latiaoRefreshBoards" }, "",
    function()
        STAT_SET_INT("H3OPT_BITSET0", 0)
        STAT_SET_INT("H3OPT_BITSET1", 0)
        util.yield_once()
        STAT_SET_INT("H3OPT_BITSET0", -1)
        STAT_SET_INT("H3OPT_BITSET1", -1)
    end)




    menu.action(dividends, "load Doomsday", {}, "", function()
        STAT_SET_INT("GANGOPS_FLOW_MISSION_PROG", -1)
    end)
    
local Doomsday = menu.slider(dividends, "Doomsday", { "Doomsday" }, "2400000", -100000, 100000, 100, 5, function() end)

menu.toggle_loop(dividends, "Doomsday all (you host)", { "latiaoDoomsdayallyouhost" }, "latiaoDoomsdayallyouhost.",
    function()
        SET_INT_GLOBAL(1967630 + 812 + 50 + 1, menu.get_value(Doomsday))

        SET_INT_GLOBAL(1967630 + 812 + 50 + 2, menu.get_value(Doomsday))

        SET_INT_GLOBAL(1967630 + 812 + 50 + 3, menu.get_value(Doomsday))

        SET_INT_GLOBAL(1967630 + 812 + 50 + 4, menu.get_value(Doomsday))
    end)




menu.action(dividends, "unclock Perico Points", {}, "", function()
    STAT_SET_INT("H4CNF_BS_ENTR", -1)
    STAT_SET_INT("H4CNF_BS_GEN", -1)
end)

menu.action(dividends, "reset Perico", {}, "", function()
    STAT_SET_INT("H4_MISSIONS", 0)
end)
menu.action(dividends, "load Perico", {}, "", function()
    STAT_SET_INT("H4_MISSIONS", -1)
end)

local Perico = menu.slider(dividends, "Perico", { "Perico" }, "2550000", -2147483647, 2147483647, 100, 5, function() end)

menu.toggle_loop(dividends, "Perico all (you host)", { "" }, "latiaoPericoallyouhost.", function()
    SET_INT_GLOBAL(1978495 + 825 + 56 + 1, menu.get_value(Perico))
    SET_INT_GLOBAL(1978495 + 825 + 56 + 2, menu.get_value(Perico))
    SET_INT_GLOBAL(1978495 + 825 + 56 + 3, menu.get_value(Perico))
    SET_INT_GLOBAL(1978495 + 825 + 56 + 4, menu.get_value(Perico))
end)
local Pericotarget = menu.slider(dividends, "Pericotarget", { "Pericotarget" }, "", -2147483647, 2147483647, 1000, 5,
    function() end)
menu.action(dividends, "Pericotarget_money ", { "latiaoPericotarget_money" }, ".",
    function()
        SET_INT_GLOBAL(262145 + 30189 + 0, menu.get_value(Pericotarget))
        SET_INT_GLOBAL(262145 + 30189 + 1, menu.get_value(Pericotarget))
        SET_INT_GLOBAL(262145 + 30189 + 2, menu.get_value(Pericotarget))
        SET_INT_GLOBAL(262145 + 30189 + 3, menu.get_value(Pericotarget))
        SET_INT_GLOBAL(262145 + 30189 + 4, menu.get_value(Pericotarget))
        SET_INT_GLOBAL(262145 + 30189 + 5, menu.get_value(Pericotarget))
    end)
menu.action(dividends, "Pericoinfinite bag_size", { "latiaoPericoinfinitebag_size" }, "latiaoPericoinfinitebag_size.",
    function()
        SET_INT_GLOBAL(262145 + 29939, 100000000)
    end)

menu.action(dividends, "del prop_chem_grill_bit", { "latiaodelprop_chem_grill_bit" }, "latiaodelprop_chem_grill_bit.",
    function()
        for k, ent in pairs(entities.get_all_objects_as_handles()) do
            if ENTITY.GET_ENTITY_MODEL(ent) == util.joaat("prop_chem_grill_bit") then
                entities.delete_by_handle(ent)
            end
        end
    end)

local Apartment = menu.slider(dividends, "Apartment", { "Apartment" }, "15000000", -2147483647, 2147483647, 100, 100,
    function() end)

menu.toggle_loop(dividends, "Apartment all (you host)", { "latiaoApartmentallyouhost" }, "latiaoApartmentallyouhost.",
    function()
        SET_INT_GLOBAL(1938365 + 3008 + 1, menu.get_value(Apartment))
        SET_INT_GLOBAL(1938365 + 3008 + 2, menu.get_value(Apartment))
        SET_INT_GLOBAL(1938365 + 3008 + 3, menu.get_value(Apartment))
        SET_INT_GLOBAL(1938365 + 3008 + 4, menu.get_value(Apartment))
    end)



menu.toggle_loop(server, "fm_mission_controller host test", { "latiaofm_mission_controllertest" },
    "latiaofm_mission_controllertest.", function()
        local host = NETWORK.NETWORK_GET_HOST_OF_SCRIPT("fm_mission_controller", 0, 0)
        local name = PLAYER.GET_PLAYER_NAME(host)
        util.draw_debug_text("fm_mission_controller host is:" .. name)
    end)
menu.toggle_loop(server, "fm_mission_controller_2020 host test", { "latiaofm_mission_controller_2020test" },
    "latiaofm_mission_controllertest_2020.", function()
        local host = NETWORK.NETWORK_GET_HOST_OF_SCRIPT("fm_mission_controller_2020", 0, 0)
        local name = PLAYER.GET_PLAYER_NAME(host)
        util.draw_debug_text("fm_mission_controller_2020 host is: " .. name)
    end)
menu.toggle_loop(server, "freemode host test", { "latiaofreemodetest" }, "latiaofreemodetest.", function()
    local host = NETWORK.NETWORK_GET_HOST_OF_SCRIPT("freemode", -1, 0)
    local name = PLAYER.GET_PLAYER_NAME(host)
    util.draw_debug_text("freemode host is: " .. name)
end)



menu.toggle_loop(dividends, "fm_mission_controller GET_INT_LOCAL", { "latiaofm_mission_controllertest" },
    "latiaofm_mission_controllertest.", function()
        local function safe_get_int_local(variable, value)
            local result = GET_INT_LOCAL(variable, value)
            if result ~= nil then
                return result
            else
                return "error"
            end
        end

        local value2 = safe_get_int_local("fm_mission_controller", 28331 + 1)
        util.draw_debug_text("fm_mission_controller 28331 + 1 = " .. value2)

        local value3 = safe_get_int_local("fm_mission_controller", 31587 + 69)
        util.draw_debug_text("fm_mission_controller 31587 + 69 = " .. value3)
    end)

menu.toggle_loop(dividends, "fm_mission_controller_2020 GET_INT_LOCAL", { "latiaofm_mission_controllertest" },
    "latiaofm_mission_controllertest.", function()
        local function safe_get_int_local(variable, value)
            local result = GET_INT_LOCAL(variable, value)
            if result ~= nil then
                return result
            else
                return "error"
            end
        end

        local value1 = safe_get_int_local("fm_mission_controller_2020", 45450 + 1)
        util.draw_debug_text("fm_mission_controller_2020 45450 + 1 = " .. value1)
        print("fm_mission_controller_2020 45450 + 1 = " .. value1)


        local value2 = safe_get_int_local("fm_mission_controller_2020", 45450 + 1378 + 1)
        util.draw_debug_text("fm_mission_controller_2020 45450 + 1378 + 1 = " .. value2)
        print("fm_mission_controller_2020 31587 + 45450 + 1378 + 1 = " .. value2)
    end)


menu.action(dividends, "request_script_host fm_mission_controller", { "latiaoNrequest_script_host" },
    "latiaoNrequest_script_host.", function()
        util.request_script_host("fm_mission_controller_2020")
        util.request_script_host("fm_mission_controller")
    end)


menu.action(dividends, "fin fm_mission_controller_2020 ", { "fin fm_mission_controller_2020" },
    "finfm_mission_controller_2020",
    function()
        SET_INT_LOCAL("fm_mission_controller_2020", 45450 + 1, 17784544)
        SET_INT_LOCAL("fm_mission_controller_2020", 45450 + 1378 + 1, 2000)
    end)
local money = menu.slider(dividends, "fm_mission_controller money", { "fm_mission_controllermoney" },
    "fm_mission_controllermoney", -2147483647,
    2147483647, 3000000, 100000,
    function() end)
menu.action(dividends, "moneyfm_mission_controller", { "moneyfm_mission_controller" }, "moneyfinfm_mission_controller",
    function()
        SET_INT_LOCAL("fm_mission_controller", 19710 + 2686, menu.get_value(money))
    end)




menu.action(dividends, "finfm_mission_controller", { "finfmc" }, "finfm_mission_controller", function()
    SET_INT_LOCAL("fm_mission_controller", 19710 + 2686, menu.get_value(money))
    SET_INT_LOCAL("fm_mission_controller", 28331 + 1, 100000000)
    SET_INT_LOCAL("fm_mission_controller", 31587 + 69, 100000000)
end)






local test1 = menu.slider(dividends, "28331 + 1 fm_mission_controller", { "fm_mission_controllertest1" },
    "fm_mission_controllermoney", 0,
    2147483647, 0, 1,
    function() end)
local test2 = menu.slider(dividends, "31587 + 69 fm_mission_controlle", { "fm_mission_controllertest2" },
    "fm_mission_controllermoney", 0,
    2147483647, 0, 1,
    function() end)

menu.action(dividends, "debugfm_mission_controller", { "finfmc" }, "finfm_mission_controller", function()
    SET_INT_LOCAL("fm_mission_controller", 28331 + 1, menu.get_value(test1))
    SET_INT_LOCAL("fm_mission_controller", 31587 + 69, menu.get_value(test2))
end)

-- player root
local function testMenuSetup(pid)
    menu.divider(menu.player_root(pid), "test")

    local testMenu = menu.list(menu.player_root(pid), "test", {}, "")


    menu.action(testMenu, "block join", { "laitaoblockjoin" }, "", function()
        local player = PLAYER.GET_PLAYER_NAME(pid)
        menu.trigger_command(menu.ref_by_path("Online>Player History>" .. player .. ">Player Join Reactions>Notification"))
        menu.trigger_commands("historyblock" .. player .. " on")
        menu.trigger_commands("loveletterkick" .. player)
        menu.trigger_commands("Online>Player History>" .. PLAYER .. ">Player Join Reactions>Crash")
        menu.trigger_commands("historynote" .. player .. " latiaoblockjoin")
        menu.trigger_commands("loveletterkick" .. player)
    end)


    menu.toggle_loop(testMenu, "disabler godmode", {}, "", function()
        util.trigger_script_event(1 << pid, { 800157557, pid, 225624744, pid })
        if not players.exists(pid) then util.stop_thread() end
    end)


    menu.toggle_loop(testMenu, "super kill cheat", {}, "", function()
        util.trigger_script_event(1 << pid, { 800157557, pid, 225624744, pid })
        util.trigger_script_event(1 << pid, { -503325966 })
        menu.trigger_commands("kill" .. PLAYER.GET_PLAYER_NAME(pid))
        local pos = v3.new(ENTITY.GET_ENTITY_COORDS(PLAYER.GET_PLAYER_PED(pid)))
        FIRE.ADD_EXPLOSION(pos.x, pos.y, pos.z, 0, 2147483647, false, true, 0.0)
        if not players.exists(pid) then util.stop_thread() end
    end)

    menu.toggle_loop(testMenu, "鬼畜", {}, "", function()

        local glitch_hash = util.joaat("p_spinning_anus_s")
        util.request_model(glitch_hash)

        local pos = players.get_position(pid)
        

        local obj = entities.create_object(glitch_hash, pos)
        ENTITY.SET_ENTITY_VISIBLE(obj, false)
        -- ENTITY.SET_ENTITY_COLLISION(obj, true, true)
        util.yield()
        entities.delete(obj) 
        
        if not players.exists(pid) then util.stop_thread() end

    end)

    menu.toggle_loop(testMenu, "weapon_pistol SHOOT", {}, "", function()
        local pos = players.get_position(pid)
        MISC.SHOOT_SINGLE_BULLET_BETWEEN_COORDS(pos.x, pos.y, pos.z + 1, pos.x, pos.y, pos.z, 100, true,
            util.joaat("weapon_pistol"), players.user_ped(), false, true, 2147483647.0)
        if not players.exists(pid) then util.stop_thread() end
    end)


    menu.toggle_loop(testMenu, "weapon_stungun SHOOT", {}, "", function()
        local pos = players.get_position(pid)
        MISC.SHOOT_SINGLE_BULLET_BETWEEN_COORDS(pos.x, pos.y, pos.z + 1, pos.x, pos.y, pos.z, 0, true,
            util.joaat("weapon_stungun"), players.user_ped(), false, true, 2147483647)
        if not players.exists(pid) then util.stop_thread() end
    end)

    menu.toggle_loop(testMenu, "weapon_bzgas SHOOT", {}, "", function()
        local pos = players.get_position(pid)
        MISC.SHOOT_SINGLE_BULLET_BETWEEN_COORDS(pos.x, pos.y, pos.z + 1, pos.x, pos.y, pos.z, 2147483647, true,
            util.joaat("weapon_bzgas"), players.user_ped(), false, true, 2147483647)
        if not players.exists(pid) then util.stop_thread() end
    end)
    menu.toggle_loop(testMenu, "weapon_molotov SHOOT", {}, "", function()
        local pos = players.get_position(pid)
        MISC.SHOOT_SINGLE_BULLET_BETWEEN_COORDS(pos.x, pos.y, pos.z + 1, pos.x, pos.y, pos.z, 2147483647, true,
            util.joaat("weapon_molotov"), players.user_ped(), false, true, 2147483647)
        if not players.exists(pid) then util.stop_thread() end
    end)


    menu.toggle_loop(testMenu, "menukill", { "latiaobanmoder" }, "", function()
        menu.trigger_commands("kill" .. PLAYER.GET_PLAYER_NAME(pid))
        if not players.exists(pid) then util.stop_thread() end
    end)

    menu.action(testMenu, "scr_as_trans_smoke", { "latiaobanmoder" }, "", function()
        STREAMING.REQUEST_NAMED_PTFX_ASSET("scr_as_trans")
        GRAPHICS.USE_PARTICLE_FX_ASSET("scr_as_trans")
        local ped = PLAYER.GET_PLAYER_PED_SCRIPT_INDEX(pid)
        GRAPHICS.START_NETWORKED_PARTICLE_FX_LOOPED_ON_ENTITY("scr_as_trans_smoke", ped, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0,
            5.0, false, false, false, 0, 0, 0, 255)
        if not players.exists(pid) then util.stop_thread() end
    end)




    menu.toggle_loop(testMenu, "NickEXPLOSION", { "latiaobanmoder" }, "", function()
        local playerPed = PLAYER.GET_PLAYER_PED(pid)
        local pos = v3.new(ENTITY.GET_ENTITY_COORDS(playerPed))
        FIRE.ADD_EXPLOSION(pos.x, pos.y, pos.z, 0, 2147483647, false, true, 0.0)
        if not players.exists(pid) then util.stop_thread() end
        -- end)
    end)

    menu.toggle_loop(testMenu, "RandomPlayerEXPLOSION", { "latiaoRandomPlayerEXPLOSION" }, "", function()
        local randomPid = PLAYER.GET_PLAYER_PED_SCRIPT_INDEX(math.random(0, 30))



        local pos = players.get_position(pid)
        FIRE.ADD_OWNED_EXPLOSION(randomPid, pos.x, pos.y, pos.z, 0, 2147483647, false, true, 0.0)
        if not players.exists(pid) then util.stop_thread() end
    end)

    menu.toggle_loop(testMenu, "MEEXPLOSION", { "latiaobanmoder" }, "", function()
        local playerPed = PLAYER.GET_PLAYER_PED(pid)
        local pos = v3.new(ENTITY.GET_ENTITY_COORDS(playerPed))
        FIRE.ADD_OWNED_EXPLOSION(players.user_ped(), pos.x, pos.y, pos.z, 0, 2147483647, false, true, 0.0)
        if not players.exists(pid) then util.stop_thread() end
        -- end
    end)


    menu.toggle_loop(testMenu, "NickFlameLoop", { "latiaoFlameLoop" }, "", function()
        local playerPed = PLAYER.GET_PLAYER_PED(pid)
        local pos = v3.new(ENTITY.GET_ENTITY_COORDS(playerPed))
        FIRE.ADD_EXPLOSION(pos.x, pos.y, pos.z, 12, 2147483647, false, true, 0.0)
        if not players.exists(pid) then util.stop_thread() end
    end)

    menu.toggle_loop(testMenu, "FlameLoop", { "latiaoFlameLoop" }, "", function()
        local playerPed = PLAYER.GET_PLAYER_PED(pid)
        local pos = v3.new(ENTITY.GET_ENTITY_COORDS(playerPed))
        FIRE.ADD_OWNED_EXPLOSION(players.user_ped(), pos.x, pos.y, pos.z, 12, 2147483647, true, false, 0.0)
        if not players.exists(pid) then util.stop_thread() end
    end)






    menu.action(testMenu, "bad TASK_VEHICLE_HELI_PROTECT crash", { "latiaobadSET_MODEL_AS_NO_LONGER_NEEDEDcrash" },
        "", function()
            util.request_model(util.joaat("oppressor"))
            util.request_model(util.joaat("u_m_m_jesus_01"))
            local ped = PLAYER.GET_PLAYER_PED_SCRIPT_INDEX(pid)
            local pos = players.get_position(pid)
            local oppressor = entities.create_vehicle(util.joaat("oppressor"), pos, 0)
            local jesus = entities.create_ped(0, util.joaat("u_m_m_jesus_01"), pos, 0)
            PED.SET_PED_INTO_VEHICLE(jesus, oppressor, -1)
            TASK.TASK_VEHICLE_HELI_PROTECT(jesus, oppressor, ped, 10.0, 0, 10, 0, 0)
        end)




    menu.action(testMenu, "bad BREAK_OBJECT_FRAGMENT_CHILD crash", { "latiaobadBBREAK_OBJECT_FRAGMENT_CHILDcrash" }, "",
        function()
            STREAMING.REQUEST_MODEL(util.joaat("prop_fragtest_cnst_04"))
            local object = entities.create_object(util.joaat("prop_fragtest_cnst_04"),
                ENTITY.GET_ENTITY_COORDS(PLAYER.GET_PLAYER_PED_SCRIPT_INDEX(pid)))
            OBJECT.BREAK_OBJECT_FRAGMENT_CHILD(object, 1, false)
        end)


    menu.toggle_loop(testMenu, "freemode script crash kick", { "latiaoscriptkick" }, "", function()
        util.trigger_script_event(1 << pid, { -1544003568 })
        if not players.exists(pid) then util.stop_thread() end
    end)

    menu.toggle_loop(testMenu, "freemode script test", { "latiaoscriptkick" }, "", function()
        util.trigger_script_event(1 << pid, { -797526379 })
        if not players.exists(pid) then util.stop_thread() end
    end)

    menu.action(testMenu, "NETWORK_SESSION_KICK_PLAYER", { "latiaoNETWORK_SESSION_KICK_PLAYER" }, "", function()
        NETWORK.NETWORK_SESSION_KICK_PLAYER(pid)
    end)


    menu.toggle_loop(testMenu, "tun spamm crash", { "latiaotunspammcrash" }, "", function()
        local pos = v3.new(ENTITY.GET_ENTITY_COORDS(PLAYER.GET_PLAYER_PED_SCRIPT_INDEX(pid)))
        STREAMING.REQUEST_MODEL(util.joaat("tug"))
        while not STREAMING.HAS_MODEL_LOADED(util.joaat("tug")) do util.yield() end
        entities.create_vehicle(util.joaat("tug"), pos, 0)
        for k, ent in pairs(entities.get_all_vehicles_as_handles()) do
            if ENTITY.GET_ENTITY_MODEL(ent) == ipairs(util.joaat("tug")) then
                ENTITY.SET_ENTITY_COORDS(ent, pos.x, pos.y, pos.z, false)
            end
        end
        if not players.exists(pid) then util.stop_thread() end
    end)



    menu.action(testMenu, "del tun", { "" }, "", function()
        for k, ent in pairs(entities.get_all_vehicles_as_handles()) do
            if ENTITY.GET_ENTITY_MODEL(ent) == util.joaat("tug") then
                entities.delete_by_handle(ent)
            end
        end
    end)
    menu.toggle_loop(testMenu, "kick vehicles", { "latiaokickvehicles" }, "latiaokickvehicles.", function()
        util.trigger_script_event(1 << pid, { -503325966 })
        if not players.exists(pid) then util.stop_thread() end
    end)

    menu.toggle_loop(testMenu, "fake kick attack", { "latiaofackhackattack" }, "latiaofackhackattack.", function()
        util.trigger_script_event(1 << pid, { -901348601, pid })
        if not players.exists(pid) then util.stop_thread() end
    end)

    menu.toggle_loop(testMenu, "host freeze", { "" }, ".", function()
        util.trigger_script_event(1 << pid, { -1321657966, pid, pid, 0, 0, 115 })

        if not players.exists(pid) then util.stop_thread() end
    end)
    menu.toggle_loop(testMenu, "wok freeze", { "" }, ".", function()
        util.yield(1000)

        util.trigger_script_event(1 << pid, { 259469385 })

        if not players.exists(pid) then util.stop_thread() end
    end)

    menu.toggle_loop(testMenu, "bad SOUND script_event", { "latiaobedsoundforall" }, "latiaobedsoundforall", function()
        util.yield(50)
        util.trigger_script_event(1 << pid, { -642704387, pid, 782258655, 0, 0, 0, 0, 0, 0, 0, pid, 0, 0, 0 })
        if not players.exists(pid) then util.stop_thread() end

    end)

    menu.toggle_loop(testMenu, "info spamm", { "latiaobedsoundforall" }, "latiaobedsoundforall", function()
        util.yield(50)
        
        util.trigger_script_event(1 << pid, { -642704387, pid, 782258655, 0, 0, 0, 0, 0, 0, 0, math.random(0, 30), 0, 0, 0 })
        if not players.exists(pid) then util.stop_thread() end

    end)



    menu.action(testMenu, "give_script_host fm_mission_controller", { "give_script_host" }, "give_script_host.",
        function()
            util.request_script_host("fm_mission_controller_2020")
            util.request_script_host("fm_mission_controller")
            util.yield(5000)
            util.give_script_host("fm_mission_controller_2020", pid)
            util.give_script_host("fm_mission_controller", pid)
        end)

    menu.action(testMenu, "latiaoGHOSTModetrue", { "latiaoGHOSTMode" }, "", function()
        NETWORK.SET_REMOTE_PLAYER_AS_GHOST(pid, true)
    end)

    menu.action(testMenu, "latiaoGHOSTModefalse", { "latiaoGHOSTMode" }, "", function()
        NETWORK.SET_REMOTE_PLAYER_AS_GHOST(pid, false)
    end)


    menu.action(testMenu, "casino TP", { "" }, ".", function()
        util.trigger_script_event(1 << pid, { -1638522928, pid, 123, 0, 0, 0, 0, 0, 0, 0, 0, 1, 2147483647, 0, 0 })
    end)


    menu.toggle_loop(testMenu, "loop report", { "" }, ".", function()
        util.yield(1000)
        local player = PLAYER.GET_PLAYER_NAME(pid)
        menu.trigger_commands("reportgriefing" .. player)
        menu.trigger_commands("reportexploits" .. player)
        menu.trigger_commands("reportbugabuse" .. player)
        if not players.exists(pid) then util.stop_thread() end
    end)

    menu.action(testMenu, "TASK_COMBAT_PED", { "" }, ".", function()
        local player = PLAYER.GET_PLAYER_PED_SCRIPT_INDEX(pid)
        for k, ent in pairs(entities.get_all_peds_as_handles()) do
                if entities.is_player_ped(ent) == true then
                    goto out
                end
            WEAPON.GIVE_WEAPON_TO_PED(ent, util.joaat("weapon_pistol"), 1000, false, true)
            TASK.TASK_COMBAT_PED(ent, player)
            ::out::
        end
    end)


    menu.toggle_loop(testMenu, "GET IP", { "" }, ".", function()
    end)

    menu.action(testMenu, "Super Give All", { "" }, ".", function()
        for a = 0, 100 do
            -- for b = 0, 100 do
            --     for c = 0, 100 do
            --         for d = 0, 100 do
            --             for e = 0, 100 do
            util.trigger_script_event(1 << pid, { 968269233, pid, a })
            -- end
        end
        --         end
        --     end
        -- end
    end)
end












for _, pid in ipairs(players.list()) do
    testMenuSetup(pid)
end

players.on_join(testMenuSetup)






menu.toggle_loop(test, "raidallplayer", { "raidallplayer" }, "", function()
    for k, pid in pairs(players.list()) do
        util.trigger_script_event(1 << pid, { -1906536929, pid })
        ::out::
    end
end)











menu.toggle_loop(server, "bad post", { "latiaobadpost" }, ("latiaobadpost"), function()
    menu.trigger_commands("spoofpos")
end)



menu.toggle_loop(test, "debugshot", { "latiaodebugshot" }, ("latiaobadpost"), function()
    local outptr = memory.alloc(4)
    local aim_info = { handle = 0 }
    if PLAYER.GET_ENTITY_PLAYER_IS_FREE_AIMING_AT(players.user(), outptr) then
        local handle = memory.read_int(outptr)
        aim_info.hash = ENTITY.GET_ENTITY_MODEL(handle)
        aim_info.model = util.reverse_joaat(aim_info.hash)
        aim_info.health = ENTITY.GET_ENTITY_HEALTH(handle)
        aim_info.OWNER = PLAYER.GET_PLAYER_NAME(entities.get_owner(handle))
        local text = "hash=" ..
            aim_info.hash ..
            "," .. "model=" .. aim_info.model .. "," .. "health=" .. aim_info.health .. "," .. "owner=" ..
            aim_info.OWNER .. ","
        directx.draw_text(0.5, 0.25, text, 5, 0.5, { r = 255, g = 0, b = 0, a = 255 }, true)
        print(text)
    end
end)







menu.toggle_loop(world, "del cctv_cam(pls use in solo if bug)", { "" }, "", function()
    local Models = {
        util.joaat("prop_cctv_pole_04"),
        util.joaat("xm_prop_x17_server_farm_cctv_01"),
        util.joaat("ch_prop_ch_cctv_cam_02a"),
        util.joaat("prop_cctv_cam_05a"),
    }

    for _, ent in pairs(entities.get_all_objects_as_handles()) do
        for _, targetModelHash in pairs(Models) do
            if ENTITY.GET_ENTITY_MODEL(ent) == targetModelHash then
                entities.delete_by_handle(ent)
                util.yield()
                break
            end
        end
    end
end)

menu.action(test, "latiaoQUIT_GAME", { "latiaoQUIT_GAME" }, "", function()
    MISC.QUIT_GAME()
end)


menu.toggle_loop(server, "latiaoGHOSTMode", { "latiaoGHOSTMode" }, "", function()
    for k, pid in pairs(players.list()) do
        NETWORK.SET_REMOTE_PLAYER_AS_GHOST(pid, true)
    end
end, function()
    for k, pid in pairs(players.list()) do
        NETWORK.SET_REMOTE_PLAYER_AS_GHOST(pid, false)
    end
end)


menu.action(server, "latiaoSET_GHOST_ALPHA", { "latiaoSET_GHOST_ALPHA" }, "", function()
    NETWORK.SET_GHOST_ALPHA(100)
end)


menu.toggle_loop(server, "TALKING TEST", { "LATIAOTALKINGTEST" }, "", function()
    for k, pid in pairs(players.list()) do
        if NETWORK.NETWORK_IS_PLAYER_TALKING(pid) then
            util.draw_debug_text(players.get_name(pid) .. " TALKING")
        end
    end
end)

menu.toggle_loop(server, "block am_hunt_the_Beast", { "latiaoblockam_hunt_the_Beast" }, "latiaoblockam_hunt_the_Beast",
    function()
        MISC.TERMINATE_ALL_SCRIPTS_WITH_THIS_NAME("am_hunt_the_Beast")
    end)

menu.toggle_loop(server, "block am_gang_call", { "latiaoblockam_gang_call" }, "latiaoblockam_gang_call",
    function()
        MISC.TERMINATE_ALL_SCRIPTS_WITH_THIS_NAME("am_gang_call")
    end)

menu.toggle_loop(server, "block bounty", { "latiaoblockbounty" }, "latiaoblockbounty",
    function()
        if players.get_bounty(players.user()) ~= nil then
            menu.trigger_commands("removebounty")
            print("removebounty")
            util.yield(1000)
        end
    end)

menu.action(server, "NETWORK_START_SOLO_TUTORIAL_SESSION", { "latiaoNETWORK_START_SOLO_TUTORIAL_SESSION" },
    "NETWORK_START_SOLO_TUTORIAL_SESSION", function()
        NETWORK.NETWORK_START_SOLO_TUTORIAL_SESSION()
    end)

menu.action(server, "NETWORK_END_TUTORIAL_SESSION", { "latiaoNETWORK_END_TUTORIAL_SESSION" },
    "NETWORK_END_TUTORIAL_SESSION",
    function()
        NETWORK.NETWORK_END_TUTORIAL_SESSION()
    end)




menu.toggle_loop(world, "SET_ENTITY_HEALTH 0 ch_prop_ch_mobile_jammer_01x", { "" }, "", function()
    for _, ent in pairs(entities.get_all_objects_as_handles()) do
        if ENTITY.GET_ENTITY_MODEL(ent) == util.joaat("ch_prop_ch_mobile_jammer_01x") then
            ENTITY.SET_ENTITY_HEALTH(ent, 0, -1)
            util.yield()
            break
        end
    end
end)


local HEALTH = menu.slider(world, "SET_ENTITY_HEALTH up", { "SET_ENTITY_HEALTH" },
    "SET_ENTITY_HEALTH", -2147483647,
    2147483647, 100, 1,
    function() end)

menu.toggle_loop(world, "SET_ENTITY_HEALTH for get_all_objects_as_handles", { "" }, "", function()
    for _, ent in pairs(entities.get_all_objects_as_handles()) do
        ENTITY.SET_ENTITY_HEALTH(ent, menu.get_value(HEALTH), -1)
    end
end)
menu.toggle_loop(world, "SET_ENTITY_HEALTH for get_all_peds_as_handles", { "" }, "", function()
    for k, ent in pairs(entities.get_all_peds_as_handles()) do
        if entities.is_player_ped(ent) == true then
            goto out
        end
        ENTITY.SET_ENTITY_HEALTH(ent, menu.get_value(HEALTH), -1)
        ::out::
    end
end)
menu.toggle_loop(world, "SET_ENTITY_HEALTH for get_all_vehicles_as_handles", { "" }, "", function()
    for k, ent in pairs(entities.get_all_vehicles_as_handles()) do
        ENTITY.SET_ENTITY_HEALTH(ent, menu.get_value(HEALTH), -1)
    end
end)
menu.toggle_loop(world, "SET_ENTITY_HEALTH for get_all_pickups_as_handles", { "" }, "", function()
    for k, ent in pairs(entities.get_all_pickups_as_handles()) do
        ENTITY.SET_ENTITY_HEALTH(ent, menu.get_value(HEALTH), -1)
    end
end)



function START_SCRIPT(name)
    SCRIPT.REQUEST_SCRIPT(name)
    repeat util.yield_once() until SCRIPT.HAS_SCRIPT_LOADED(name)
    SYSTEM.START_NEW_SCRIPT(name, 5000)
end

menu.action(admin, "Bunker", { "" }, "", function()
    START_SCRIPT("appbunkerbusiness")
end)
menu.action(admin, ("Air Cargo"), { "" }, "", function()
    START_SCRIPT("appsmuggler")
end)
menu.action(admin, ("Nightclub"), { "" }, "", function()
    START_SCRIPT("appbusinesshub")
end)
menu.action(admin, ("The Open Road"), { "" }, "(" .. ("") .. ")",
    function()
        START_SCRIPT("appbikerbusiness")
    end)
menu.action(admin, ("Master Control Terminal"), { "" }, "", function()
    START_SCRIPT("apparcadebusinesshub")
end)
menu.action(admin, ("Touchscreen Terminal"), { "" }, "(" .. ("") .. ")", function()
    START_SCRIPT("apphackertruck")
end)

menu.action(admin, ("Agency App"), { "" }, "(" .. ("") .. ")", function()
    START_SCRIPT("appfixersecurity")
end)


menu.toggle_loop(admin, ("ez MC Club"), { "" }, "(" .. ("") .. ")", function()
    SET_INT_LOCAL("gb_biker_contraband_sell", 699 + 17, 0)
end)






menu.action(dividends, "Contract All Missions", {}, "", function()
    STAT_SET_INT("FIXER_GENERAL_BS", -1)
    STAT_SET_INT("FIXER_COMPLETED_BS", -1)
    STAT_SET_INT("FIXER_STORY_BS", -1)
end)

local ContractPayout = menu.slider(dividends, "ContractPayout", { "ContractPayout" }, "", 0, 2147483647, 0, 1,
    function()

    end)




menu.toggle_loop(dividends, "ContractPayout", { "" }, "", function()
    SET_INT_GLOBAL(262145 + 31955, menu.get_value(ContractPayout))
end)

menu.toggle_loop(test, "REFRESH_INTERIOR", { "" }, "", function()
    local pos = players.get_position(players.user())
    local MyInterior = INTERIOR.GET_INTERIOR_AT_COORDS(0, 0, 0)
    print(MyInterior)
    INTERIOR.REFRESH_INTERIOR(MyInterior)
end)



menu.toggle_loop(test, "CLEAR_AREA", { "" }, "", function()
    MISC.CLEAR_AREA(0, 0, 0, 2147483647)
end)

menu.toggle_loop(test, "CLEAR_AREA_OF_OBJECTS", { "" }, "", function()
    MISC.CLEAR_AREA_OF_OBJECTS(0, 0, 0, 2147483647)
end)

menu.toggle_loop(test, "CLEAR_AREA_OF_PEDS", { "" }, "", function()
    MISC.CLEAR_AREA_OF_PEDS(0, 0, 0, 2147483647, true)
end)
menu.toggle_loop(test, "CLEAR_AREA_OF_VEHICLES", { "" }, "", function()
    MISC.CLEAR_AREA_OF_VEHICLES(0, 0, 0, 2147483647)
end)
menu.toggle_loop(test, "CLEAR_AREA_OF_COPS", { "" }, "", function()
    MISC.CLEAR_AREA_OF_COPS(0, 0, 0, 2147483647)
end)



menu.toggle_loop(test, "NETWORK_DO_TRANSITION_TO_NEW_FREEMODE", {}, "", function()
    NETWORK.NETWORK_DO_TRANSITION_TO_FREEMODE(0, 0, true, 1000, true)
end)
menu.toggle_loop(test, "NETWORK_DO_TRANSITION_TO_NEW_GAME", {}, "", function()
    NETWORK.NETWORK_DO_TRANSITION_TO_GAME(1000, true)
end)


menu.action(test, "kill freemode", { "latiaoblockfreemode" }, "",
    function()
        util.spoof_script("freemode", function()
            SCRIPT.TERMINATE_THIS_THREAD()
        end
        )
    end)
menu.action(test, "test", { "latiaoblockfreemode" }, "",
    function()
        util.spoof_script("freemode", function()
            print(SCRIPT.IS_THREAD_ACTIVE())
        end
        )
    end)



menu.action(test, "tp and back", { "latiaotpback" }, "",
    function()
        local pos = players.get_position(players.user())


        ENTITY.SET_ENTITY_COORDS_NO_OFFSET(PLAYER.GET_PLAYER_PED_SCRIPT_INDEX(players.user()), pos.x, pos.y, 2600)
        util.yield(5000)
        ENTITY.SET_ENTITY_COORDS_NO_OFFSET(PLAYER.GET_PLAYER_PED_SCRIPT_INDEX(players.user()), pos.x, pos.y, pos.z)

        -- )
    end)

menu.toggle_loop(server, "bad SOUNDscript_event", { "latiaobedsoundforall" }, "latiaobedsoundforall", function()
    for k, pid in pairs(players.list()) do
        util.trigger_script_event(1 << pid, { -642704387, pid, 782258655, 0, 0, 0, 0, 0, 0, 0, pid, 0, 0, 0 })
        util.yield(50)
    end
end)

menu.toggle_loop(server, "info spamm", { "latiaobedsoundforall" }, "latiaobedsoundforall", function()
    
    for k, pid in pairs(players.list()) do
    util.trigger_script_event(1 << pid, { -642704387, pid, 782258655, 0, 0, 0, 0, 0, 0, 0, math.random(0, 30), 0, 0, 0 })
    util.yield(50)
    end
end)

menu.action(admin, "MOC", { "" }, ".", function()
    SET_INT_GLOBAL(2794162 + 930, 1)
end)
menu.action(admin, "Avenger", { "" }, ".", function()
    SET_INT_GLOBAL(2794162 + 938, 1)
end)
menu.action(admin, "Terrorbyte", { "" }, ".", function()
    SET_INT_GLOBAL(2794162 + 943, 1)
end)
menu.action(admin, "Kosatka", { "" }, ".", function()
    SET_INT_GLOBAL(2794162 + 960, 1)
end)
menu.action(admin, "Acid Lab", { "" }, ".", function()
    SET_INT_GLOBAL(2794162 + 944, 1)
end)
menu.action(admin, "Dingy", { "" }, ".", function()
    SET_INT_GLOBAL(2794162 + 972, 1)
end)
menu.action(admin, "Ballistic Armor", { "" }, ".", function()
    SET_INT_GLOBAL(2794162 + 901, 1)
end)



menu.toggle_loop(world, "STOP_FIRE_IN_RANGE", { "" }, ".", function()
    FIRE.STOP_FIRE_IN_RANGE(0, 0, 0, 2147483647)
end)



menu.toggle_loop(world, "EVERYONE IGNORE ALL PLAYER", {}, "", function()
    for k, pid in pairs(players.list()) do
        PLAYER.SET_EVERYONE_IGNORE_PLAYER(pid, true)
    end
end, function()
    for k, pid in pairs(players.list()) do
        PLAYER.SET_EVERYONE_IGNORE_PLAYER(pid, false)
    end
end)

menu.toggle_loop(world, "SET_CAN_ATTACK_FRIENDLY", { "" }, ".", function()
    PED.SET_CAN_ATTACK_FRIENDLY(players.user_ped(), true, false)
end, function()
    PED.SET_CAN_ATTACK_FRIENDLY(players.user_ped(), false, false)
end)

menu.toggle_loop(world, "NOISE SET 0 FOR ALL PLAYER", {}, "", function()
    for k, pid in pairs(players.list()) do
        PLAYER.SET_PLAYER_NOISE_MULTIPLIER(pid, 0.0)
        PLAYER.SET_PLAYER_SNEAKING_NOISE_MULTIPLIER(pid, 0.0)
    end
end)


menu.toggle_loop(world, "SET_ENTITY_SHOULD_FREEZE_WAITING_ON_COLLISION", { "" }, "", function()
    local targets = {}

    for _, ped in ipairs(entities.get_all_peds_as_handles()) do
        table.insert(targets, ped)
    end

    for _, vehicle in ipairs(entities.get_all_vehicles_as_handles()) do
        table.insert(targets, vehicle)
    end

    for _, object in ipairs(entities.get_all_objects_as_handles()) do
        table.insert(targets, object)
    end

    for _, pickups in ipairs(entities.get_all_pickups_as_handles()) do
        table.insert(targets, pickups)
    end

    for _, target in ipairs(targets) do
        ENTITY.SET_ENTITY_AS_MISSION_ENTITY(target)
    end
end)

menu.toggle_loop(world, "NETWORK_REGISTER_ENTITY_AS_NETWORKED", { "" }, "", function()
    local targets = {}

    for _, ped in ipairs(entities.get_all_peds_as_handles()) do
        table.insert(targets, ped)
    end

    for _, vehicle in ipairs(entities.get_all_vehicles_as_handles()) do
        table.insert(targets, vehicle)
    end

    for _, object in ipairs(entities.get_all_objects_as_handles()) do
        table.insert(targets, object)
    end

    for _, pickups in ipairs(entities.get_all_pickups_as_handles()) do
        table.insert(targets, pickups)
    end

    for _, target in ipairs(targets) do
        NETWORK.NETWORK_REGISTER_ENTITY_AS_NETWORKED(target)
        util.yield()
    end
end)


menu.toggle_loop(self, "SET_ENTITY_MAX_HEALTH 0", { "" }, ".", function()
    ENTITY.SET_ENTITY_MAX_HEALTH(players.user_ped(), 0)
end, function()
    ENTITY.SET_ENTITY_MAX_HEALTH(players.user_ped(), 328)
end)





menu.action(server, "super request_script_host for all ", { "request_script_hostall" },
    "latiaoNrequest_script_host.", function()
        for _, script in ipairs(ALL_script_hosts) do
            util.request_script_host(script)
        end
    end)


    menu.toggle_loop(world, "SET_ENTITY_INVINCIBLE true", { "" }, "", function()
        local targets = {}
    
        for _, ped in ipairs(entities.get_all_peds_as_handles()) do
            table.insert(targets, ped)
        end
    
        for _, vehicle in ipairs(entities.get_all_vehicles_as_handles()) do
            table.insert(targets, vehicle)
        end
    
        for _, object in ipairs(entities.get_all_objects_as_handles()) do
            table.insert(targets, object)
        end
    
        for _, pickups in ipairs(entities.get_all_pickups_as_handles()) do
            table.insert(targets, pickups)
        end
    
        for _, target in ipairs(targets) do
            ENTITY.SET_ENTITY_INVINCIBLE(target,true)
            util.yield()
        end
    end)
    
    menu.toggle_loop(world, "SET_ENTITY_INVINCIBLE false", { "" }, "", function()
        local targets = {}
    
        for _, ped in ipairs(entities.get_all_peds_as_handles()) do
            table.insert(targets, ped)
        end
    
        for _, vehicle in ipairs(entities.get_all_vehicles_as_handles()) do
            table.insert(targets, vehicle)
        end
    
        for _, object in ipairs(entities.get_all_objects_as_handles()) do
            table.insert(targets, object)
        end
    
        for _, pickups in ipairs(entities.get_all_pickups_as_handles()) do
            table.insert(targets, pickups)
        end
    
        for _, target in ipairs(targets) do
            ENTITY.SET_ENTITY_INVINCIBLE(target,false)
            util.yield()
        end
    end)
    
