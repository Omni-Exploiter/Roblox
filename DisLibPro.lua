local DiscordLib = {}
local IconData = {assets={["lucide-accessibility"]="rbxassetid://10709751939",["lucide-activity"]="rbxassetid://10709752035",["lucide-air-vent"]="rbxassetid://10709752131",["lucide-airplay"]="rbxassetid://10709752254",["lucide-alarm-check"]="rbxassetid://10709752405",["lucide-alarm-clock"]="rbxassetid://10709752630",["lucide-alarm-clock-off"]="rbxassetid://10709752508",["lucide-alarm-minus"]="rbxassetid://10709752732",["lucide-alarm-plus"]="rbxassetid://10709752825",["lucide-album"]="rbxassetid://10709752906",["lucide-alert-circle"]="rbxassetid://10709752996",["lucide-alert-octagon"]="rbxassetid://10709753064",["lucide-alert-triangle"]="rbxassetid://10709753149",["lucide-align-center"]="rbxassetid://10709753570",["lucide-align-center-horizontal"]="rbxassetid://10709753272",["lucide-align-center-vertical"]="rbxassetid://10709753421",["lucide-align-end-horizontal"]="rbxassetid://10709753692",["lucide-align-end-vertical"]="rbxassetid://10709753808",["lucide-align-horizontal-distribute-center"]="rbxassetid://10747779791",["lucide-align-horizontal-distribute-end"]="rbxassetid://10747784534",["lucide-align-horizontal-distribute-start"]="rbxassetid://10709754118",["lucide-align-horizontal-justify-center"]="rbxassetid://10709754204",["lucide-align-horizontal-justify-end"]="rbxassetid://10709754317",["lucide-align-horizontal-justify-start"]="rbxassetid://10709754436",["lucide-align-horizontal-space-around"]="rbxassetid://10709754590",["lucide-align-horizontal-space-between"]="rbxassetid://10709754749",["lucide-align-justify"]="rbxassetid://10709759610",["lucide-align-left"]="rbxassetid://10709759764",["lucide-align-right"]="rbxassetid://10709759895",["lucide-align-start-horizontal"]="rbxassetid://10709760051",["lucide-align-start-vertical"]="rbxassetid://10709760244",["lucide-align-vertical-distribute-center"]="rbxassetid://10709760351",["lucide-align-vertical-distribute-end"]="rbxassetid://10709760434",["lucide-align-vertical-distribute-start"]="rbxassetid://10709760612",["lucide-align-vertical-justify-center"]="rbxassetid://10709760814",["lucide-align-vertical-justify-end"]="rbxassetid://10709761003",["lucide-align-vertical-justify-start"]="rbxassetid://10709761176",["lucide-align-vertical-space-around"]="rbxassetid://10709761324",["lucide-align-vertical-space-between"]="rbxassetid://10709761434",["lucide-anchor"]="rbxassetid://10709761530",["lucide-angry"]="rbxassetid://10709761629",["lucide-annoyed"]="rbxassetid://10709761722",["lucide-aperture"]="rbxassetid://10709761813",["lucide-apple"]="rbxassetid://10709761889",["lucide-archive"]="rbxassetid://10709762233",["lucide-archive-restore"]="rbxassetid://10709762058",["lucide-armchair"]="rbxassetid://10709762327",["lucide-arrow-big-down"]="rbxassetid://10747796644",["lucide-arrow-big-left"]="rbxassetid://10709762574",["lucide-arrow-big-right"]="rbxassetid://10709762727",["lucide-arrow-big-up"]="rbxassetid://10709762879",["lucide-arrow-down"]="rbxassetid://10709767827",["lucide-arrow-down-circle"]="rbxassetid://10709763034",["lucide-arrow-down-left"]="rbxassetid://10709767656",["lucide-arrow-down-right"]="rbxassetid://10709767750",["lucide-arrow-left"]="rbxassetid://10709768114",["lucide-arrow-left-circle"]="rbxassetid://10709767936",["lucide-arrow-left-right"]="rbxassetid://10709768019",["lucide-arrow-right"]="rbxassetid://10709768347",["lucide-arrow-right-circle"]="rbxassetid://10709768226",["lucide-arrow-up"]="rbxassetid://10709768939",["lucide-arrow-up-circle"]="rbxassetid://10709768432",["lucide-arrow-up-down"]="rbxassetid://10709768538",["lucide-arrow-up-left"]="rbxassetid://10709768661",["lucide-arrow-up-right"]="rbxassetid://10709768787",["lucide-asterisk"]="rbxassetid://10709769095",["lucide-at-sign"]="rbxassetid://10709769286",["lucide-award"]="rbxassetid://10709769406",["lucide-axe"]="rbxassetid://10709769508",["lucide-axis-3d"]="rbxassetid://10709769598",["lucide-baby"]="rbxassetid://10709769732",["lucide-backpack"]="rbxassetid://10709769841",["lucide-baggage-claim"]="rbxassetid://10709769935",["lucide-banana"]="rbxassetid://10709770005",["lucide-banknote"]="rbxassetid://10709770178",["lucide-bar-chart"]="rbxassetid://10709773755",["lucide-bar-chart-2"]="rbxassetid://10709770317",["lucide-bar-chart-3"]="rbxassetid://10709770431",["lucide-bar-chart-4"]="rbxassetid://10709770560",["lucide-bar-chart-horizontal"]="rbxassetid://10709773669",["lucide-barcode"]="rbxassetid://10747360675",["lucide-baseline"]="rbxassetid://10709773863",["lucide-bath"]="rbxassetid://10709773963",["lucide-battery"]="rbxassetid://10709774640",["lucide-battery-charging"]="rbxassetid://10709774068",["lucide-battery-full"]="rbxassetid://10709774206",["lucide-battery-low"]="rbxassetid://10709774370",["lucide-battery-medium"]="rbxassetid://10709774513",["lucide-beaker"]="rbxassetid://10709774756",["lucide-bed"]="rbxassetid://10709775036",["lucide-bed-double"]="rbxassetid://10709774864",["lucide-bed-single"]="rbxassetid://10709774968",["lucide-beer"]="rbxassetid://10709775167",["lucide-bell"]="rbxassetid://10709775704",["lucide-bell-minus"]="rbxassetid://10709775241",["lucide-bell-off"]="rbxassetid://10709775320",["lucide-bell-plus"]="rbxassetid://10709775448",["lucide-bell-ring"]="rbxassetid://10709775560",["lucide-bike"]="rbxassetid://10709775894",["lucide-binary"]="rbxassetid://10709776050",["lucide-bitcoin"]="rbxassetid://10709776126",["lucide-bluetooth"]="rbxassetid://10709776655",["lucide-bluetooth-connected"]="rbxassetid://10709776240",["lucide-bluetooth-off"]="rbxassetid://10709776344",["lucide-bluetooth-searching"]="rbxassetid://10709776501",["lucide-bold"]="rbxassetid://10747813908",["lucide-bomb"]="rbxassetid://10709781460",["lucide-bone"]="rbxassetid://10709781605",["lucide-book"]="rbxassetid://10709781824",["lucide-book-open"]="rbxassetid://10709781717",["lucide-bookmark"]="rbxassetid://10709782154",["lucide-bookmark-minus"]="rbxassetid://10709781919",["lucide-bookmark-plus"]="rbxassetid://10709782044",["lucide-bot"]="rbxassetid://10709782230",["lucide-box"]="rbxassetid://10709782497",["lucide-box-select"]="rbxassetid://10709782342",["lucide-boxes"]="rbxassetid://10709782582",["lucide-briefcase"]="rbxassetid://10709782662",["lucide-brush"]="rbxassetid://10709782758",["lucide-bug"]="rbxassetid://10709782845",["lucide-building"]="rbxassetid://10709783051",["lucide-building-2"]="rbxassetid://10709782939",["lucide-bus"]="rbxassetid://10709783137",["lucide-cake"]="rbxassetid://10709783217",["lucide-calculator"]="rbxassetid://10709783311",["lucide-calendar"]="rbxassetid://10709789505",["lucide-calendar-check"]="rbxassetid://10709783474",["lucide-calendar-check-2"]="rbxassetid://10709783392",["lucide-calendar-clock"]="rbxassetid://10709783577",["lucide-calendar-days"]="rbxassetid://10709783673",["lucide-calendar-heart"]="rbxassetid://10709783835",["lucide-calendar-minus"]="rbxassetid://10709783959",["lucide-calendar-off"]="rbxassetid://10709788784",["lucide-calendar-plus"]="rbxassetid://10709788937",["lucide-calendar-range"]="rbxassetid://10709789053",["lucide-calendar-search"]="rbxassetid://10709789200",["lucide-calendar-x"]="rbxassetid://10709789407",["lucide-calendar-x-2"]="rbxassetid://10709789329",["lucide-camera"]="rbxassetid://10709789686",["lucide-camera-off"]="rbxassetid://10747822677",["lucide-car"]="rbxassetid://10709789810",["lucide-carrot"]="rbxassetid://10709789960",["lucide-cast"]="rbxassetid://10709790097",["lucide-charge"]="rbxassetid://10709790202",["lucide-check"]="rbxassetid://10709790644",["lucide-check-circle"]="rbxassetid://10709790387",["lucide-check-circle-2"]="rbxassetid://10709790298",["lucide-check-square"]="rbxassetid://10709790537",["lucide-chef-hat"]="rbxassetid://10709790757",["lucide-cherry"]="rbxassetid://10709790875",["lucide-chevron-down"]="rbxassetid://10709790948",["lucide-chevron-first"]="rbxassetid://10709791015",["lucide-chevron-last"]="rbxassetid://10709791130",["lucide-chevron-left"]="rbxassetid://10709791281",["lucide-chevron-right"]="rbxassetid://10709791437",["lucide-chevron-up"]="rbxassetid://10709791523",["lucide-chevrons-down"]="rbxassetid://10709796864",["lucide-chevrons-down-up"]="rbxassetid://10709791632",["lucide-chevrons-left"]="rbxassetid://10709797151",["lucide-chevrons-left-right"]="rbxassetid://10709797006",["lucide-chevrons-right"]="rbxassetid://10709797382",["lucide-chevrons-right-left"]="rbxassetid://10709797274",["lucide-chevrons-up"]="rbxassetid://10709797622",["lucide-chevrons-up-down"]="rbxassetid://10709797508",["lucide-chrome"]="rbxassetid://10709797725",["lucide-circle"]="rbxassetid://10709798174",["lucide-circle-dot"]="rbxassetid://10709797837",["lucide-circle-ellipsis"]="rbxassetid://10709797985",["lucide-circle-slashed"]="rbxassetid://10709798100",["lucide-citrus"]="rbxassetid://10709798276",["lucide-clapperboard"]="rbxassetid://10709798350",["lucide-clipboard"]="rbxassetid://10709799288",["lucide-clipboard-check"]="rbxassetid://10709798443",["lucide-clipboard-copy"]="rbxassetid://10709798574",["lucide-clipboard-edit"]="rbxassetid://10709798682",["lucide-clipboard-list"]="rbxassetid://10709798792",["lucide-clipboard-signature"]="rbxassetid://10709798890",["lucide-clipboard-type"]="rbxassetid://10709798999",["lucide-clipboard-x"]="rbxassetid://10709799124",["lucide-clock"]="rbxassetid://10709805144",["lucide-clock-1"]="rbxassetid://10709799535",["lucide-clock-10"]="rbxassetid://10709799718",["lucide-clock-11"]="rbxassetid://10709799818",["lucide-clock-12"]="rbxassetid://10709799962",["lucide-clock-2"]="rbxassetid://10709803876",["lucide-clock-3"]="rbxassetid://10709803989",["lucide-clock-4"]="rbxassetid://10709804164",["lucide-clock-5"]="rbxassetid://10709804291",["lucide-clock-6"]="rbxassetid://10709804435",["lucide-clock-7"]="rbxassetid://10709804599",["lucide-clock-8"]="rbxassetid://10709804784",["lucide-clock-9"]="rbxassetid://10709804996",["lucide-cloud"]="rbxassetid://10709806740",["lucide-cloud-cog"]="rbxassetid://10709805262",["lucide-cloud-drizzle"]="rbxassetid://10709805371",["lucide-cloud-fog"]="rbxassetid://10709805477",["lucide-cloud-hail"]="rbxassetid://10709805596",["lucide-cloud-lightning"]="rbxassetid://10709805727",["lucide-cloud-moon"]="rbxassetid://10709805942",["lucide-cloud-moon-rain"]="rbxassetid://10709805838",["lucide-cloud-off"]="rbxassetid://10709806060",["lucide-cloud-rain"]="rbxassetid://10709806277",["lucide-cloud-rain-wind"]="rbxassetid://10709806166",["lucide-cloud-snow"]="rbxassetid://10709806374",["lucide-cloud-sun"]="rbxassetid://10709806631",["lucide-cloud-sun-rain"]="rbxassetid://10709806475",["lucide-cloudy"]="rbxassetid://10709806859",["lucide-clover"]="rbxassetid://10709806995",["lucide-code"]="rbxassetid://10709810463",["lucide-code-2"]="rbxassetid://10709807111",["lucide-codepen"]="rbxassetid://10709810534",["lucide-codesandbox"]="rbxassetid://10709810676",["lucide-coffee"]="rbxassetid://10709810814",["lucide-cog"]="rbxassetid://10709810948",["lucide-coins"]="rbxassetid://10709811110",["lucide-columns"]="rbxassetid://10709811261",["lucide-command"]="rbxassetid://10709811365",["lucide-compass"]="rbxassetid://10709811445",["lucide-component"]="rbxassetid://10709811595",["lucide-concierge-bell"]="rbxassetid://10709811706",["lucide-connection"]="rbxassetid://10747361219",["lucide-contact"]="rbxassetid://10709811834",["lucide-contrast"]="rbxassetid://10709811939",["lucide-cookie"]="rbxassetid://10709812067",["lucide-copy"]="rbxassetid://10709812159",["lucide-copyleft"]="rbxassetid://10709812251",["lucide-copyright"]="rbxassetid://10709812311",["lucide-corner-down-left"]="rbxassetid://10709812396",["lucide-corner-down-right"]="rbxassetid://10709812485",["lucide-corner-left-down"]="rbxassetid://10709812632",["lucide-corner-left-up"]="rbxassetid://10709812784",["lucide-corner-right-down"]="rbxassetid://10709812939",["lucide-corner-right-up"]="rbxassetid://10709813094",["lucide-corner-up-left"]="rbxassetid://10709813185",["lucide-corner-up-right"]="rbxassetid://10709813281",["lucide-cpu"]="rbxassetid://10709813383",["lucide-croissant"]="rbxassetid://10709818125",["lucide-crop"]="rbxassetid://10709818245",["lucide-cross"]="rbxassetid://10709818399",["lucide-crosshair"]="rbxassetid://10709818534",["lucide-crown"]="rbxassetid://10709818626",["lucide-cup-soda"]="rbxassetid://10709818763",["lucide-curly-braces"]="rbxassetid://10709818847",["lucide-currency"]="rbxassetid://10709818931",["lucide-database"]="rbxassetid://10709818996",["lucide-delete"]="rbxassetid://10709819059",["lucide-diamond"]="rbxassetid://10709819149",["lucide-dice-1"]="rbxassetid://10709819266",["lucide-dice-2"]="rbxassetid://10709819361",["lucide-dice-3"]="rbxassetid://10709819508",["lucide-dice-4"]="rbxassetid://10709819670",["lucide-dice-5"]="rbxassetid://10709819801",["lucide-dice-6"]="rbxassetid://10709819896",["lucide-dices"]="rbxassetid://10723343321",["lucide-diff"]="rbxassetid://10723343416",["lucide-disc"]="rbxassetid://10723343537",["lucide-divide"]="rbxassetid://10723343805",["lucide-divide-circle"]="rbxassetid://10723343636",["lucide-divide-square"]="rbxassetid://10723343737",["lucide-dollar-sign"]="rbxassetid://10723343958",["lucide-download"]="rbxassetid://10723344270",["lucide-download-cloud"]="rbxassetid://10723344088",["lucide-droplet"]="rbxassetid://10723344432",["lucide-droplets"]="rbxassetid://10734883356",["lucide-drumstick"]="rbxassetid://10723344737",["lucide-edit"]="rbxassetid://10734883598",["lucide-edit-2"]="rbxassetid://10723344885",["lucide-edit-3"]="rbxassetid://10723345088",["lucide-egg"]="rbxassetid://10723345518",["lucide-egg-fried"]="rbxassetid://10723345347",["lucide-electricity"]="rbxassetid://10723345749",["lucide-electricity-off"]="rbxassetid://10723345643",["lucide-equal"]="rbxassetid://10723345990",["lucide-equal-not"]="rbxassetid://10723345866",["lucide-eraser"]="rbxassetid://10723346158",["lucide-euro"]="rbxassetid://10723346372",["lucide-expand"]="rbxassetid://10723346553",["lucide-external-link"]="rbxassetid://10723346684",["lucide-eye"]="rbxassetid://10723346959",["lucide-eye-off"]="rbxassetid://10723346871",["lucide-factory"]="rbxassetid://10723347051",["lucide-fan"]="rbxassetid://10723354359",["lucide-fast-forward"]="rbxassetid://10723354521",["lucide-feather"]="rbxassetid://10723354671",["lucide-figma"]="rbxassetid://10723354801",["lucide-file"]="rbxassetid://10723374641",["lucide-file-archive"]="rbxassetid://10723354921",["lucide-file-audio"]="rbxassetid://10723355148",["lucide-file-audio-2"]="rbxassetid://10723355026",["lucide-file-axis-3d"]="rbxassetid://10723355272",["lucide-file-badge"]="rbxassetid://10723355622",["lucide-file-badge-2"]="rbxassetid://10723355451",["lucide-file-bar-chart"]="rbxassetid://10723355887",["lucide-file-bar-chart-2"]="rbxassetid://10723355746",["lucide-file-box"]="rbxassetid://10723355989",["lucide-file-check"]="rbxassetid://10723356210",["lucide-file-check-2"]="rbxassetid://10723356100",["lucide-file-clock"]="rbxassetid://10723356329",["lucide-file-code"]="rbxassetid://10723356507",["lucide-file-cog"]="rbxassetid://10723356830",["lucide-file-cog-2"]="rbxassetid://10723356676",["lucide-file-diff"]="rbxassetid://10723357039",["lucide-file-digit"]="rbxassetid://10723357151",["lucide-file-down"]="rbxassetid://10723357322",["lucide-file-edit"]="rbxassetid://10723357495",["lucide-file-heart"]="rbxassetid://10723357637",["lucide-file-image"]="rbxassetid://10723357790",["lucide-file-input"]="rbxassetid://10723357933",["lucide-file-json"]="rbxassetid://10723364435",["lucide-file-json-2"]="rbxassetid://10723364361",["lucide-file-key"]="rbxassetid://10723364605",["lucide-file-key-2"]="rbxassetid://10723364515",["lucide-file-line-chart"]="rbxassetid://10723364725",["lucide-file-lock"]="rbxassetid://10723364957",["lucide-file-lock-2"]="rbxassetid://10723364861",["lucide-file-minus"]="rbxassetid://10723365254",["lucide-file-minus-2"]="rbxassetid://10723365086",["lucide-file-output"]="rbxassetid://10723365457",["lucide-file-pie-chart"]="rbxassetid://10723365598",["lucide-file-plus"]="rbxassetid://10723365877",["lucide-file-plus-2"]="rbxassetid://10723365766",["lucide-file-question"]="rbxassetid://10723365987",["lucide-file-scan"]="rbxassetid://10723366167",["lucide-file-search"]="rbxassetid://10723366550",["lucide-file-search-2"]="rbxassetid://10723366340",["lucide-file-signature"]="rbxassetid://10723366741",["lucide-file-spreadsheet"]="rbxassetid://10723366962",["lucide-file-symlink"]="rbxassetid://10723367098",["lucide-file-terminal"]="rbxassetid://10723367244",["lucide-file-text"]="rbxassetid://10723367380",["lucide-file-type"]="rbxassetid://10723367606",["lucide-file-type-2"]="rbxassetid://10723367509",["lucide-file-up"]="rbxassetid://10723367734",["lucide-file-video"]="rbxassetid://10723373884",["lucide-file-video-2"]="rbxassetid://10723367834",["lucide-file-volume"]="rbxassetid://10723374172",["lucide-file-volume-2"]="rbxassetid://10723374030",["lucide-file-warning"]="rbxassetid://10723374276",["lucide-file-x"]="rbxassetid://10723374544",["lucide-file-x-2"]="rbxassetid://10723374378",["lucide-files"]="rbxassetid://10723374759",["lucide-film"]="rbxassetid://10723374981",["lucide-filter"]="rbxassetid://10723375128",["lucide-fingerprint"]="rbxassetid://10723375250",["lucide-flag"]="rbxassetid://10723375890",["lucide-flag-off"]="rbxassetid://10723375443",["lucide-flag-triangle-left"]="rbxassetid://10723375608",["lucide-flag-triangle-right"]="rbxassetid://10723375727",["lucide-flame"]="rbxassetid://10723376114",["lucide-flashlight"]="rbxassetid://10723376471",["lucide-flashlight-off"]="rbxassetid://10723376365",["lucide-flask-conical"]="rbxassetid://10734883986",["lucide-flask-round"]="rbxassetid://10723376614",["lucide-flip-horizontal"]="rbxassetid://10723376884",["lucide-flip-horizontal-2"]="rbxassetid://10723376745",["lucide-flip-vertical"]="rbxassetid://10723377138",["lucide-flip-vertical-2"]="rbxassetid://10723377026",["lucide-flower"]="rbxassetid://10747830374",["lucide-flower-2"]="rbxassetid://10723377305",["lucide-focus"]="rbxassetid://10723377537",["lucide-folder"]="rbxassetid://10723387563",["lucide-folder-archive"]="rbxassetid://10723384478",["lucide-folder-check"]="rbxassetid://10723384605",["lucide-folder-clock"]="rbxassetid://10723384731",["lucide-folder-closed"]="rbxassetid://10723384893",["lucide-folder-cog"]="rbxassetid://10723385213",["lucide-folder-cog-2"]="rbxassetid://10723385036",["lucide-folder-down"]="rbxassetid://10723385338",["lucide-folder-edit"]="rbxassetid://10723385445",["lucide-folder-heart"]="rbxassetid://10723385545",["lucide-folder-input"]="rbxassetid://10723385721",["lucide-folder-key"]="rbxassetid://10723385848",["lucide-folder-lock"]="rbxassetid://10723386005",["lucide-folder-minus"]="rbxassetid://10723386127",["lucide-folder-open"]="rbxassetid://10723386277",["lucide-folder-output"]="rbxassetid://10723386386",["lucide-folder-plus"]="rbxassetid://10723386531",["lucide-folder-search"]="rbxassetid://10723386787",["lucide-folder-search-2"]="rbxassetid://10723386674",["lucide-folder-symlink"]="rbxassetid://10723386930",["lucide-folder-tree"]="rbxassetid://10723387085",["lucide-folder-up"]="rbxassetid://10723387265",["lucide-folder-x"]="rbxassetid://10723387448",["lucide-folders"]="rbxassetid://10723387721",["lucide-form-input"]="rbxassetid://10723387841",["lucide-forward"]="rbxassetid://10723388016",["lucide-frame"]="rbxassetid://10723394389",["lucide-framer"]="rbxassetid://10723394565",["lucide-frown"]="rbxassetid://10723394681",["lucide-fuel"]="rbxassetid://10723394846",["lucide-function-square"]="rbxassetid://10723395041",["lucide-gamepad"]="rbxassetid://10723395457",["lucide-gamepad-2"]="rbxassetid://10723395215",["lucide-gauge"]="rbxassetid://10723395708",["lucide-gavel"]="rbxassetid://10723395896",["lucide-gem"]="rbxassetid://10723396000",["lucide-ghost"]="rbxassetid://10723396107",["lucide-gift"]="rbxassetid://10723396402",["lucide-gift-card"]="rbxassetid://10723396225",["lucide-git-branch"]="rbxassetid://10723396676",["lucide-git-branch-plus"]="rbxassetid://10723396542",["lucide-git-commit"]="rbxassetid://10723396812",["lucide-git-compare"]="rbxassetid://10723396954",["lucide-git-fork"]="rbxassetid://10723397049",["lucide-git-merge"]="rbxassetid://10723397165",["lucide-git-pull-request"]="rbxassetid://10723397431",["lucide-git-pull-request-closed"]="rbxassetid://10723397268",["lucide-git-pull-request-draft"]="rbxassetid://10734884302",["lucide-glass"]="rbxassetid://10723397788",["lucide-glass-2"]="rbxassetid://10723397529",["lucide-glass-water"]="rbxassetid://10723397678",["lucide-glasses"]="rbxassetid://10723397895",["lucide-globe"]="rbxassetid://10723404337",["lucide-globe-2"]="rbxassetid://10723398002",["lucide-grab"]="rbxassetid://10723404472",["lucide-graduation-cap"]="rbxassetid://10723404691",["lucide-grape"]="rbxassetid://10723404822",["lucide-grid"]="rbxassetid://10723404936",["lucide-grip-horizontal"]="rbxassetid://10723405089",["lucide-grip-vertical"]="rbxassetid://10723405236",["lucide-hammer"]="rbxassetid://10723405360",["lucide-hand"]="rbxassetid://10723405649",["lucide-hand-metal"]="rbxassetid://10723405508",["lucide-hard-drive"]="rbxassetid://10723405749",["lucide-hard-hat"]="rbxassetid://10723405859",["lucide-hash"]="rbxassetid://10723405975",["lucide-haze"]="rbxassetid://10723406078",["lucide-headphones"]="rbxassetid://10723406165",["lucide-heart"]="rbxassetid://10723406885",["lucide-heart-crack"]="rbxassetid://10723406299",["lucide-heart-handshake"]="rbxassetid://10723406480",["lucide-heart-off"]="rbxassetid://10723406662",["lucide-heart-pulse"]="rbxassetid://10723406795",["lucide-help-circle"]="rbxassetid://10723406988",["lucide-hexagon"]="rbxassetid://10723407092",["lucide-highlighter"]="rbxassetid://10723407192",["lucide-history"]="rbxassetid://10723407335",["lucide-home"]="rbxassetid://10723407389",["lucide-hourglass"]="rbxassetid://10723407498",["lucide-ice-cream"]="rbxassetid://10723414308",["lucide-image"]="rbxassetid://10723415040",["lucide-image-minus"]="rbxassetid://10723414487",["lucide-image-off"]="rbxassetid://10723414677",["lucide-image-plus"]="rbxassetid://10723414827",["lucide-import"]="rbxassetid://10723415205",["lucide-inbox"]="rbxassetid://10723415335",["lucide-indent"]="rbxassetid://10723415494",["lucide-indian-rupee"]="rbxassetid://10723415642",["lucide-infinity"]="rbxassetid://10723415766",["lucide-info"]="rbxassetid://10723415903",["lucide-inspect"]="rbxassetid://10723416057",["lucide-italic"]="rbxassetid://10723416195",["lucide-japanese-yen"]="rbxassetid://10723416363",["lucide-joystick"]="rbxassetid://10723416527",["lucide-key"]="rbxassetid://10723416652",["lucide-keyboard"]="rbxassetid://10723416765",["lucide-lamp"]="rbxassetid://10723417513",["lucide-lamp-ceiling"]="rbxassetid://10723416922",["lucide-lamp-desk"]="rbxassetid://10723417016",["lucide-lamp-floor"]="rbxassetid://10723417131",["lucide-lamp-wall-down"]="rbxassetid://10723417240",["lucide-lamp-wall-up"]="rbxassetid://10723417356",["lucide-landmark"]="rbxassetid://10723417608",["lucide-languages"]="rbxassetid://10723417703",["lucide-laptop"]="rbxassetid://10723423881",["lucide-laptop-2"]="rbxassetid://10723417797",["lucide-lasso"]="rbxassetid://10723424235",["lucide-lasso-select"]="rbxassetid://10723424058",["lucide-laugh"]="rbxassetid://10723424372",["lucide-layers"]="rbxassetid://10723424505",["lucide-layout"]="rbxassetid://10723425376",["lucide-layout-dashboard"]="rbxassetid://10723424646",["lucide-layout-grid"]="rbxassetid://10723424838",["lucide-layout-list"]="rbxassetid://10723424963",["lucide-layout-template"]="rbxassetid://10723425187",["lucide-leaf"]="rbxassetid://10723425539",["lucide-library"]="rbxassetid://10723425615",["lucide-life-buoy"]="rbxassetid://10723425685",["lucide-lightbulb"]="rbxassetid://10723425852",["lucide-lightbulb-off"]="rbxassetid://10723425762",["lucide-line-chart"]="rbxassetid://10723426393",["lucide-link"]="rbxassetid://10723426722",["lucide-link-2"]="rbxassetid://10723426595",["lucide-link-2-off"]="rbxassetid://10723426513",["lucide-list"]="rbxassetid://10723433811",["lucide-list-checks"]="rbxassetid://10734884548",["lucide-list-end"]="rbxassetid://10723426886",["lucide-list-minus"]="rbxassetid://10723426986",["lucide-list-music"]="rbxassetid://10723427081",["lucide-list-ordered"]="rbxassetid://10723427199",["lucide-list-plus"]="rbxassetid://10723427334",["lucide-list-start"]="rbxassetid://10723427494",["lucide-list-video"]="rbxassetid://10723427619",["lucide-list-x"]="rbxassetid://10723433655",["lucide-loader"]="rbxassetid://10723434070",["lucide-loader-2"]="rbxassetid://10723433935",["lucide-locate"]="rbxassetid://10723434557",["lucide-locate-fixed"]="rbxassetid://10723434236",["lucide-locate-off"]="rbxassetid://10723434379",["lucide-lock"]="rbxassetid://10723434711",["lucide-log-in"]="rbxassetid://10723434830",["lucide-log-out"]="rbxassetid://10723434906",["lucide-luggage"]="rbxassetid://10723434993",["lucide-magnet"]="rbxassetid://10723435069",["lucide-mail"]="rbxassetid://10734885430",["lucide-mail-check"]="rbxassetid://10723435182",["lucide-mail-minus"]="rbxassetid://10723435261",["lucide-mail-open"]="rbxassetid://10723435342",["lucide-mail-plus"]="rbxassetid://10723435443",["lucide-mail-question"]="rbxassetid://10723435515",["lucide-mail-search"]="rbxassetid://10734884739",["lucide-mail-warning"]="rbxassetid://10734885015",["lucide-mail-x"]="rbxassetid://10734885247",["lucide-mails"]="rbxassetid://10734885614",["lucide-map"]="rbxassetid://10734886202",["lucide-map-pin"]="rbxassetid://10734886004",["lucide-map-pin-off"]="rbxassetid://10734885803",["lucide-maximize"]="rbxassetid://10734886735",["lucide-maximize-2"]="rbxassetid://10734886496",["lucide-medal"]="rbxassetid://10734887072",["lucide-megaphone"]="rbxassetid://10734887454",["lucide-megaphone-off"]="rbxassetid://10734887311",["lucide-meh"]="rbxassetid://10734887603",["lucide-menu"]="rbxassetid://10734887784",["lucide-message-circle"]="rbxassetid://10734888000",["lucide-message-square"]="rbxassetid://10734888228",["lucide-mic"]="rbxassetid://10734888864",["lucide-mic-2"]="rbxassetid://10734888430",["lucide-mic-off"]="rbxassetid://10734888646",["lucide-microscope"]="rbxassetid://10734889106",["lucide-microwave"]="rbxassetid://10734895076",["lucide-milestone"]="rbxassetid://10734895310",["lucide-minimize"]="rbxassetid://10734895698",["lucide-minimize-2"]="rbxassetid://10734895530",["lucide-minus"]="rbxassetid://10734896206",["lucide-minus-circle"]="rbxassetid://10734895856",["lucide-minus-square"]="rbxassetid://10734896029",["lucide-monitor"]="rbxassetid://10734896881",["lucide-monitor-off"]="rbxassetid://10734896360",["lucide-monitor-speaker"]="rbxassetid://10734896512",["lucide-moon"]="rbxassetid://10734897102",["lucide-more-horizontal"]="rbxassetid://10734897250",["lucide-more-vertical"]="rbxassetid://10734897387",["lucide-mountain"]="rbxassetid://10734897956",["lucide-mountain-snow"]="rbxassetid://10734897665",["lucide-mouse"]="rbxassetid://10734898592",["lucide-mouse-pointer"]="rbxassetid://10734898476",["lucide-mouse-pointer-2"]="rbxassetid://10734898194",["lucide-mouse-pointer-click"]="rbxassetid://10734898355",["lucide-move"]="rbxassetid://10734900011",["lucide-move-3d"]="rbxassetid://10734898756",["lucide-move-diagonal"]="rbxassetid://10734899164",["lucide-move-diagonal-2"]="rbxassetid://10734898934",["lucide-move-horizontal"]="rbxassetid://10734899414",["lucide-move-vertical"]="rbxassetid://10734899821",["lucide-music"]="rbxassetid://10734905958",["lucide-music-2"]="rbxassetid://10734900215",["lucide-music-3"]="rbxassetid://10734905665",["lucide-music-4"]="rbxassetid://10734905823",["lucide-navigation"]="rbxassetid://10734906744",["lucide-navigation-2"]="rbxassetid://10734906332",["lucide-navigation-2-off"]="rbxassetid://10734906144",["lucide-navigation-off"]="rbxassetid://10734906580",["lucide-network"]="rbxassetid://10734906975",["lucide-newspaper"]="rbxassetid://10734907168",["lucide-octagon"]="rbxassetid://10734907361",["lucide-option"]="rbxassetid://10734907649",["lucide-outdent"]="rbxassetid://10734907933",["lucide-package"]="rbxassetid://10734909540",["lucide-package-2"]="rbxassetid://10734908151",["lucide-package-check"]="rbxassetid://10734908384",["lucide-package-minus"]="rbxassetid://10734908626",["lucide-package-open"]="rbxassetid://10734908793",["lucide-package-plus"]="rbxassetid://10734909016",["lucide-package-search"]="rbxassetid://10734909196",["lucide-package-x"]="rbxassetid://10734909375",["lucide-paint-bucket"]="rbxassetid://10734909847",["lucide-paintbrush"]="rbxassetid://10734910187",["lucide-paintbrush-2"]="rbxassetid://10734910030",["lucide-palette"]="rbxassetid://10734910430",["lucide-palmtree"]="rbxassetid://10734910680",["lucide-paperclip"]="rbxassetid://10734910927",["lucide-party-popper"]="rbxassetid://10734918735",["lucide-pause"]="rbxassetid://10734919336",["lucide-pause-circle"]="rbxassetid://10735024209",["lucide-pause-octagon"]="rbxassetid://10734919143",["lucide-pen-tool"]="rbxassetid://10734919503",["lucide-pencil"]="rbxassetid://10734919691",["lucide-percent"]="rbxassetid://10734919919",["lucide-person-standing"]="rbxassetid://10734920149",["lucide-phone"]="rbxassetid://10734921524",["lucide-phone-call"]="rbxassetid://10734920305",["lucide-phone-forwarded"]="rbxassetid://10734920508",["lucide-phone-incoming"]="rbxassetid://10734920694",["lucide-phone-missed"]="rbxassetid://10734920845",["lucide-phone-off"]="rbxassetid://10734921077",["lucide-phone-outgoing"]="rbxassetid://10734921288",["lucide-pie-chart"]="rbxassetid://10734921727",["lucide-piggy-bank"]="rbxassetid://10734921935",["lucide-pin"]="rbxassetid://10734922324",["lucide-pin-off"]="rbxassetid://10734922180",["lucide-pipette"]="rbxassetid://10734922497",["lucide-pizza"]="rbxassetid://10734922774",["lucide-plane"]="rbxassetid://10734922971",["lucide-play"]="rbxassetid://10734923549",["lucide-play-circle"]="rbxassetid://10734923214",["lucide-plus"]="rbxassetid://10734924532",["lucide-plus-circle"]="rbxassetid://10734923868",["lucide-plus-square"]="rbxassetid://10734924219",["lucide-podcast"]="rbxassetid://10734929553",["lucide-pointer"]="rbxassetid://10734929723",["lucide-pound-sterling"]="rbxassetid://10734929981",["lucide-power"]="rbxassetid://10734930466",["lucide-power-off"]="rbxassetid://10734930257",["lucide-printer"]="rbxassetid://10734930632",["lucide-puzzle"]="rbxassetid://10734930886",["lucide-quote"]="rbxassetid://10734931234",["lucide-radio"]="rbxassetid://10734931596",["lucide-radio-receiver"]="rbxassetid://10734931402",["lucide-rectangle-horizontal"]="rbxassetid://10734931777",["lucide-rectangle-vertical"]="rbxassetid://10734932081",["lucide-recycle"]="rbxassetid://10734932295",["lucide-redo"]="rbxassetid://10734932822",["lucide-redo-2"]="rbxassetid://10734932586",["lucide-refresh-ccw"]="rbxassetid://10734933056",["lucide-refresh-cw"]="rbxassetid://10734933222",["lucide-refrigerator"]="rbxassetid://10734933465",["lucide-regex"]="rbxassetid://10734933655",["lucide-repeat"]="rbxassetid://10734933966",["lucide-repeat-1"]="rbxassetid://10734933826",["lucide-reply"]="rbxassetid://10734934252",["lucide-reply-all"]="rbxassetid://10734934132",["lucide-rewind"]="rbxassetid://10734934347",["lucide-rocket"]="rbxassetid://10734934585",["lucide-rocking-chair"]="rbxassetid://10734939942",["lucide-rotate-3d"]="rbxassetid://10734940107",["lucide-rotate-ccw"]="rbxassetid://10734940376",["lucide-rotate-cw"]="rbxassetid://10734940654",["lucide-rss"]="rbxassetid://10734940825",["lucide-ruler"]="rbxassetid://10734941018",["lucide-russian-ruble"]="rbxassetid://10734941199",["lucide-sailboat"]="rbxassetid://10734941354",["lucide-save"]="rbxassetid://10734941499",["lucide-scale"]="rbxassetid://10734941912",["lucide-scale-3d"]="rbxassetid://10734941739",["lucide-scaling"]="rbxassetid://10734942072",["lucide-scan"]="rbxassetid://10734942565",["lucide-scan-face"]="rbxassetid://10734942198",["lucide-scan-line"]="rbxassetid://10734942351",["lucide-scissors"]="rbxassetid://10734942778",["lucide-screen-share"]="rbxassetid://10734943193",["lucide-screen-share-off"]="rbxassetid://10734942967",["lucide-scroll"]="rbxassetid://10734943448",["lucide-search"]="rbxassetid://10734943674",["lucide-send"]="rbxassetid://10734943902",["lucide-separator-horizontal"]="rbxassetid://10734944115",["lucide-separator-vertical"]="rbxassetid://10734944326",["lucide-server"]="rbxassetid://10734949856",["lucide-server-cog"]="rbxassetid://10734944444",["lucide-server-crash"]="rbxassetid://10734944554",["lucide-server-off"]="rbxassetid://10734944668",["lucide-settings"]="rbxassetid://10734950309",["lucide-settings-2"]="rbxassetid://10734950020",["lucide-share"]="rbxassetid://10734950813",["lucide-share-2"]="rbxassetid://10734950553",["lucide-sheet"]="rbxassetid://10734951038",["lucide-shield"]="rbxassetid://10734951847",["lucide-shield-alert"]="rbxassetid://10734951173",["lucide-shield-check"]="rbxassetid://10734951367",["lucide-shield-close"]="rbxassetid://10734951535",["lucide-shield-off"]="rbxassetid://10734951684",["lucide-shirt"]="rbxassetid://10734952036",["lucide-shopping-bag"]="rbxassetid://10734952273",["lucide-shopping-cart"]="rbxassetid://10734952479",["lucide-shovel"]="rbxassetid://10734952773",["lucide-shower-head"]="rbxassetid://10734952942",["lucide-shrink"]="rbxassetid://10734953073",["lucide-shrub"]="rbxassetid://10734953241",["lucide-shuffle"]="rbxassetid://10734953451",["lucide-sidebar"]="rbxassetid://10734954301",["lucide-sidebar-close"]="rbxassetid://10734953715",["lucide-sidebar-open"]="rbxassetid://10734954000",["lucide-sigma"]="rbxassetid://10734954538",["lucide-signal"]="rbxassetid://10734961133",["lucide-signal-high"]="rbxassetid://10734954807",["lucide-signal-low"]="rbxassetid://10734955080",["lucide-signal-medium"]="rbxassetid://10734955336",["lucide-signal-zero"]="rbxassetid://10734960878",["lucide-siren"]="rbxassetid://10734961284",["lucide-skip-back"]="rbxassetid://10734961526",["lucide-skip-forward"]="rbxassetid://10734961809",["lucide-skull"]="rbxassetid://10734962068",["lucide-slack"]="rbxassetid://10734962339",["lucide-slash"]="rbxassetid://10734962600",["lucide-slice"]="rbxassetid://10734963024",["lucide-sliders"]="rbxassetid://10734963400",["lucide-sliders-horizontal"]="rbxassetid://10734963191",["lucide-smartphone"]="rbxassetid://10734963940",["lucide-smartphone-charging"]="rbxassetid://10734963671",["lucide-smile"]="rbxassetid://10734964441",["lucide-smile-plus"]="rbxassetid://10734964188",["lucide-snowflake"]="rbxassetid://10734964600",["lucide-sofa"]="rbxassetid://10734964852",["lucide-sort-asc"]="rbxassetid://10734965115",["lucide-sort-desc"]="rbxassetid://10734965287",["lucide-speaker"]="rbxassetid://10734965419",["lucide-sprout"]="rbxassetid://10734965572",["lucide-square"]="rbxassetid://10734965702",["lucide-star"]="rbxassetid://10734966248",["lucide-star-half"]="rbxassetid://10734965897",["lucide-star-off"]="rbxassetid://10734966097",["lucide-stethoscope"]="rbxassetid://10734966384",["lucide-sticker"]="rbxassetid://10734972234",["lucide-sticky-note"]="rbxassetid://10734972463",["lucide-stop-circle"]="rbxassetid://10734972621",["lucide-stretch-horizontal"]="rbxassetid://10734972862",["lucide-stretch-vertical"]="rbxassetid://10734973130",["lucide-strikethrough"]="rbxassetid://10734973290",["lucide-subscript"]="rbxassetid://10734973457",["lucide-sun"]="rbxassetid://10734974297",["lucide-sun-dim"]="rbxassetid://10734973645",["lucide-sun-medium"]="rbxassetid://10734973778",["lucide-sun-moon"]="rbxassetid://10734973999",["lucide-sun-snow"]="rbxassetid://10734974130",["lucide-sunrise"]="rbxassetid://10734974522",["lucide-sunset"]="rbxassetid://10734974689",["lucide-superscript"]="rbxassetid://10734974850",["lucide-swiss-franc"]="rbxassetid://10734975024",["lucide-switch-camera"]="rbxassetid://10734975214",["lucide-sword"]="rbxassetid://10734975486",["lucide-swords"]="rbxassetid://10734975692",["lucide-syringe"]="rbxassetid://10734975932",["lucide-table"]="rbxassetid://10734976230",["lucide-table-2"]="rbxassetid://10734976097",["lucide-tablet"]="rbxassetid://10734976394",["lucide-tag"]="rbxassetid://10734976528",["lucide-tags"]="rbxassetid://10734976739",["lucide-target"]="rbxassetid://10734977012",["lucide-tent"]="rbxassetid://10734981750",["lucide-terminal"]="rbxassetid://10734982144",["lucide-terminal-square"]="rbxassetid://10734981995",["lucide-text-cursor"]="rbxassetid://10734982395",["lucide-text-cursor-input"]="rbxassetid://10734982297",["lucide-thermometer"]="rbxassetid://10734983134",["lucide-thermometer-snowflake"]="rbxassetid://10734982571",["lucide-thermometer-sun"]="rbxassetid://10734982771",["lucide-thumbs-down"]="rbxassetid://10734983359",["lucide-thumbs-up"]="rbxassetid://10734983629",["lucide-ticket"]="rbxassetid://10734983868",["lucide-timer"]="rbxassetid://10734984606",["lucide-timer-off"]="rbxassetid://10734984138",["lucide-timer-reset"]="rbxassetid://10734984355",["lucide-toggle-left"]="rbxassetid://10734984834",["lucide-toggle-right"]="rbxassetid://10734985040",["lucide-tornado"]="rbxassetid://10734985247",["lucide-toy-brick"]="rbxassetid://10747361919",["lucide-train"]="rbxassetid://10747362105",["lucide-trash"]="rbxassetid://10747362393",["lucide-trash-2"]="rbxassetid://10747362241",["lucide-tree-deciduous"]="rbxassetid://10747362534",["lucide-tree-pine"]="rbxassetid://10747362748",["lucide-trees"]="rbxassetid://10747363016",["lucide-trending-down"]="rbxassetid://10747363205",["lucide-trending-up"]="rbxassetid://10747363465",["lucide-triangle"]="rbxassetid://10747363621",["lucide-trophy"]="rbxassetid://10747363809",["lucide-truck"]="rbxassetid://10747364031",["lucide-tv"]="rbxassetid://10747364593",["lucide-tv-2"]="rbxassetid://10747364302",["lucide-type"]="rbxassetid://10747364761",["lucide-umbrella"]="rbxassetid://10747364971",["lucide-underline"]="rbxassetid://10747365191",["lucide-undo"]="rbxassetid://10747365484",["lucide-undo-2"]="rbxassetid://10747365359",["lucide-unlink"]="rbxassetid://10747365771",["lucide-unlink-2"]="rbxassetid://10747397871",["lucide-unlock"]="rbxassetid://10747366027",["lucide-upload"]="rbxassetid://10747366434",["lucide-upload-cloud"]="rbxassetid://10747366266",["lucide-usb"]="rbxassetid://10747366606",["lucide-user"]="rbxassetid://10747373176",["lucide-user-check"]="rbxassetid://10747371901",["lucide-user-cog"]="rbxassetid://10747372167",["lucide-user-minus"]="rbxassetid://10747372346",["lucide-user-plus"]="rbxassetid://10747372702",["lucide-user-x"]="rbxassetid://10747372992",["lucide-users"]="rbxassetid://10747373426",["lucide-utensils"]="rbxassetid://10747373821",["lucide-utensils-crossed"]="rbxassetid://10747373629",["lucide-venetian-mask"]="rbxassetid://10747374003",["lucide-verified"]="rbxassetid://10747374131",["lucide-vibrate"]="rbxassetid://10747374489",["lucide-vibrate-off"]="rbxassetid://10747374269",["lucide-video"]="rbxassetid://10747374938",["lucide-video-off"]="rbxassetid://10747374721",["lucide-view"]="rbxassetid://10747375132",["lucide-voicemail"]="rbxassetid://10747375281",["lucide-volume"]="rbxassetid://10747376008",["lucide-volume-1"]="rbxassetid://10747375450",["lucide-volume-2"]="rbxassetid://10747375679",["lucide-volume-x"]="rbxassetid://10747375880",["lucide-wallet"]="rbxassetid://10747376205",["lucide-wand"]="rbxassetid://10747376565",["lucide-wand-2"]="rbxassetid://10747376349",["lucide-watch"]="rbxassetid://10747376722",["lucide-waves"]="rbxassetid://10747376931",["lucide-webcam"]="rbxassetid://10747381992",["lucide-wifi"]="rbxassetid://10747382504",["lucide-wifi-off"]="rbxassetid://10747382268",["lucide-wind"]="rbxassetid://10747382750",["lucide-wrap-text"]="rbxassetid://10747383065",["lucide-wrench"]="rbxassetid://10747383470",["lucide-x"]="rbxassetid://10747384394",["lucide-x-circle"]="rbxassetid://10747383819",["lucide-x-octagon"]="rbxassetid://10747384037",["lucide-x-square"]="rbxassetid://10747384217",["lucide-zoom-in"]="rbxassetid://10747384552",["lucide-zoom-out"]="rbxassetid://10747384679"}}
local cloneref = cloneref or function(o) return o end
local COREGUI = cloneref(game:GetService("CoreGui"))
local Players = cloneref(game:GetService("Players"))
local UserInputService = game:GetService("UserInputService")
local TweenService = game:GetService("TweenService")
local RunService = game:GetService("RunService")
local LocalPlayer = Players.LocalPlayer
local Mouse = LocalPlayer:GetMouse()
local HttpService = game:GetService("HttpService")
local Sections = {}
local Lighting = game:GetService("Lighting")
local ThemeUpdateConnections = {}
local currentFont = Enum.Font.GothamBold
local currentWindowSize = 1
local savedSizeBeforeMax = nil
local savedPosBeforeMax = nil
local isMaximized = false
local savedSizeBeforeMax = nil
local savedPosBeforeMax = nil
local savedAnchorBeforeMax = nil
local SettingsPanelOpen = false
local currentWindowScaleX = 1
local currentWindowScaleY = 1
local function GetAsset(id, defaultExt)
if type(id) ~= "string" or not id:match("^https?://") then
        return id
    end
    local cleanUrl = id:gsub("%?.*", "") 
    local ext = cleanUrl:match("%.(%w+)$") or defaultExt or "mp3"
    local fileName = "asset_" .. HttpService:GenerateGUID(false) .. "." .. ext
    local success, data = pcall(function() return game:HttpGet(id) end)
    if success and data then
        writefile(fileName, data)
        return getcustomasset(fileName)
    end
    return id
end

local XOR_SEEDS = {
    math.random(1,255),
    math.random(1,255),
    math.random(1,255),
    math.random(1,255)
}

local function RotateBits(v, s)
    return bit32.band(
        bit32.bor(
            bit32.lshift(v, s),
            bit32.rshift(v, 8 - s)
        ),
        255
    )
end

local function XorEncode(str)
    local buffer = table.create(#str)

    for i = 1, #str do
        local byte = string.byte(str, i)

        local k1 = XOR_SEEDS[((i - 1) % #XOR_SEEDS) + 1]
        local k2 = bit32.band((i * 73) + k1, 255)
        local k3 = RotateBits(bit32.bxor(k1, k2), (i % 7) + 1)

        local encoded = bit32.bxor(byte, k1)
        encoded = bit32.bxor(encoded, k2)
        encoded = bit32.bxor(encoded, k3)

        encoded = RotateBits(encoded, (i % 5) + 1)

        buffer[i] = string.char(encoded)
    end

    return table.concat(buffer)
end

local ENC = {
    MainFrame = XorEncode("MainFrame"),
    TopFrame = XorEncode("TopFrame"),
    Title = XorEncode("Title"),
    ServersHoldFrame = XorEncode("ServersHoldFrame"),
    ServersHold = XorEncode("ServersHold"),
    ServersHoldLayout = XorEncode("ServersHoldLayout"),
    ServersHoldPadding = XorEncode("ServersHoldPadding"),
    ChannelsHoldFrame = XorEncode("ChannelsHoldFrame"),
    ChannelsHold = XorEncode("ChannelsHold"),
    ChannelsHoldLayout = XorEncode("ChannelsHoldLayout"),
    Shadow = XorEncode("Shadow"),
    ServerSelectionBg = XorEncode("ServerSelectionBg"),
    ServerIcon = XorEncode("ServerIcon"),
    ServerIconBorder = XorEncode("ServerIconBorder"),
    ChannelSelectionBg = XorEncode("ChannelSelectionBg"),
    ChannelGlow = XorEncode("ChannelGlow"),
    ChannelIndicator = XorEncode("ChannelIndicator"),
    ChannelIcon = XorEncode("ChannelIcon"),
    ChannelLabel = XorEncode("ChannelLabel"),
    SectionLayout = XorEncode("SectionLayout"),
    SectionPadding = XorEncode("SectionPadding"),
    SectionTitle = XorEncode("SectionTitle"),
    Ripple = XorEncode("Ripple"),
    ButtonTitle = XorEncode("ButtonTitle"),
    ButtonDesc = XorEncode("ButtonDesc"),
    ToggleLabel = XorEncode("ToggleLabel"),
    ToggleDesc = XorEncode("ToggleDesc"),
    ToggleFrame = XorEncode("ToggleFrame"),
    ToggleFill = XorEncode("ToggleFill"),
    ToggleCircle = XorEncode("ToggleCircle"),
    ToggleFillGradient = XorEncode("ToggleFillGradient"),
    BindTitle = XorEncode("BindTitle"),
    BindDesc = XorEncode("BindDesc"),
    BindButtonBorder = XorEncode("BindButtonBorder"),
    BindButton = XorEncode("BindButton"),
    STitle = XorEncode("STitle"),
    SVal = XorEncode("SVal"),
    SDesc = XorEncode("SDesc"),
    SB = XorEncode("SB"),
    SFL = XorEncode("SFL"),
    SFG = XorEncode("SFG"),
    SBtn = XorEncode("SBtn"),
    DTitle = XorEncode("DTitle"),
    DDesc = XorEncode("DDesc"),
    DArrow = XorEncode("DArrow"),
    MDTitle = XorEncode("MDTitle"),
    MDCount = XorEncode("MDCount"),
    MDDesc = XorEncode("MDDesc"),
    MDArrow = XorEncode("MDArrow"),
    MDList = XorEncode("MDList"),
    TTBTitle = XorEncode("TTBTitle"),
    TTBDesc = XorEncode("TTBDesc"),
    TSTitle = XorEncode("TSTitle"),
    TSDesc = XorEncode("TSDesc"),
    TextboxTitle = XorEncode("TextboxTitle"),
    TextboxDesc = XorEncode("TextboxDesc"),
    ParagraphTitle = XorEncode("ParagraphTitle"),
    ParagraphContent = XorEncode("ParagraphContent"),
    ColorDisplay = XorEncode("ColorDisplay"),
    ColorButton = XorEncode("ColorButton"),
    ColorButtonBorder = XorEncode("ColorButtonBorder"),
    CPTitle = XorEncode("CPTitle"),
    CPOverlay = XorEncode("CPOverlay"),
    CPPopup = XorEncode("CPPopup"),
    SearchBox = XorEncode("SearchBox"),
    DropdownList = XorEncode("DropdownList"),
    TC = XorEncode("TC"),
    TF = XorEncode("TF"),
    TCircle = XorEncode("TCircle"),
    TBtn = XorEncode("TBtn"),
    SF = XorEncode("SF"),
    SV = XorEncode("SV"),
    CK = XorEncode("CK"),
    OL = XorEncode("OL"),
    WindowControls      = XorEncode("WindowControls"),
    CtrlBtn_Maximize    = XorEncode("CtrlBtn_Maximize"),
    CtrlBtn_Minimize    = XorEncode("CtrlBtn_Minimize"),
    CtrlBtn_Settings    = XorEncode("CtrlBtn_Settings"),
    CtrlBtn_Search      = XorEncode("CtrlBtn_Search"),
    SearchOverlay       = XorEncode("SearchOverlay"),
    SearchPanel         = XorEncode("SearchPanel"),
    SearchInput         = XorEncode("SearchInput"),
    SearchResults       = XorEncode("SearchResults"),
    SearchResultItem    = XorEncode("SearchResultItem"),
    SettingsOverlay     = XorEncode("SettingsOverlay"),
    SettingsPanel       = XorEncode("SettingsPanel"),
    SettingsTitle       = XorEncode("SettingsTitle"),
    SettingsClose       = XorEncode("SettingsClose"),
    SettingsContent     = XorEncode("SettingsContent"),
    SettingsSearch      = XorEncode("SettingsSearch"),
    SettingsSection     = XorEncode("SettingsSection"),
    SettingsOption      = XorEncode("SettingsOption"),
    RestoreBtn          = XorEncode("RestoreBtn"),
    CloseBtn            = XorEncode("CloseBtn"),
    MaxBtn              = XorEncode("MaxBtn"),
    MinBtn              = XorEncode("MinBtn"),
    SetBtn              = XorEncode("SetBtn"),
    SearchBtn           = XorEncode("SearchBtn"),
    SearchHint          = XorEncode("SearchHint"),
    BorderHolder = XorEncode("BorderHolder"),
    BorderFrame = XorEncode("BorderFrame"),
    ProgressBg = XorEncode("ProgressBg"),
    ProgressFill = XorEncode("ProgressFill"),
    AccentBar = XorEncode("AccentBar"),
    IconFrame = XorEncode("IconFrame"),
    Icon = XorEncode("Icon"),
    CloseBtn = XorEncode("CloseBtn"),
    NotificationMain = XorEncode("NotificationMain"),
    GradientBorder = XorEncode("GradientBorder"),
    ContentFrame = XorEncode("ContentFrame"),
    Background = XorEncode("Background"),
    DialogMain = XorEncode("DialogMain"),
    Border = XorEncode("Border"),
    KeyInput = XorEncode("KeyInput"),
    AB = XorEncode("AB"),
    ABE = XorEncode("ABE"),
    SDGlow = XorEncode("SDGlow"),
    MDBtn = XorEncode("MDBtn"),
    ToggleButton = XorEncode("ToggleButton"),
    ChevronIcon = XorEncode("ChevronIcon"),
    CheckIcon = XorEncode("CheckIcon")
}

local ENC_PREFIX = {
    Seperator = XorEncode("Seperator"),
    Toggle_ = XorEncode("Toggle_"),
    Bind_ = XorEncode("Bind_"),
    Slider_ = XorEncode("Slider_"),
    ToggleSlider_ = XorEncode("ToggleSlider_"),
    ToggleTextbox_ = XorEncode("ToggleTextbox_"),
    Colorpicker_ = XorEncode("Colorpicker_"),
    Textbox_ = XorEncode("Textbox_"),
    Dropdown_ = XorEncode("Dropdown_"),
    MultiDropdown_ = XorEncode("MultiDropdown_"),
    Button_ = XorEncode("Button_"),
    Paragraph_ = XorEncode("Paragraph_"),
    Label_ = XorEncode("Label_"),
    Opt_ = XorEncode("Opt_"),
    CK_ = XorEncode("CK_"),
    SettingsRow_    = XorEncode("SettingsRow_"),
    SearchResult_   = XorEncode("SearchResult_"),
    CtrlBtn         = XorEncode("CtrlBtn"),
    OL_ = XorEncode("OL_"),
    DialogButton_ = XorEncode("DialogButton_"),
    Model_ = XorEncode("Model_"),
    Audio_ = XorEncode("Audio_"),
    Video_ = XorEncode("Video_"),
    Image_ = XorEncode("Image_"),
    SectionFrame = XorEncode("SectionFrame")
}

getgenv().ABC3728 = false
getgenv().ABC3616 = false
getgenv().ABC7472 = false
getgenv().ABC8281 = false

local function protectGui(gui)
    if get_hidden_gui or gethui then
        gui.Parent = (get_hidden_gui or gethui)()
    elseif syn and syn.protect_gui then
        syn.protect_gui(gui)
        gui.Parent = game.CoreGui
    elseif game.CoreGui:FindFirstChild("RobloxGui") then
        gui.Parent = game.CoreGui:FindFirstChild("RobloxGui")
    else
        gui.Parent = game.CoreGui
    end
end
local Themes = {
    Dark = {
        Main = Color3.fromRGB(25, 25, 30),
        Secondary = Color3.fromRGB(35, 35, 42),
        Tertiary = Color3.fromRGB(45, 45, 55),
        Accent = Color3.fromRGB(100, 140, 255),
        AccentGradient = Color3.fromRGB(140, 100, 255),
        Text = Color3.fromRGB(255, 255, 255),
        TextMuted = Color3.fromRGB(160, 165, 175),
        Userpad = Color3.fromRGB(30, 30, 38),
        UserIcon = Color3.fromRGB(40, 40, 50),
        Hover = Color3.fromRGB(55, 55, 68),
        Border = Color3.fromRGB(60, 60, 75),
        Shadow = Color3.fromRGB(0, 0, 0),
        ServerBorder = Color3.fromRGB(100, 140, 255),
        NotificationBg = Color3.fromRGB(30, 30, 38),
        NotificationBorder = Color3.fromRGB(100, 140, 255)
    },
    Light = {
        Main = Color3.fromRGB(240, 242, 248),
        Secondary = Color3.fromRGB(228, 230, 238),
        Tertiary = Color3.fromRGB(215, 218, 228),
        Accent = Color3.fromRGB(80, 120, 255),
        AccentGradient = Color3.fromRGB(120, 80, 255),
        Text = Color3.fromRGB(20, 20, 30),
        TextMuted = Color3.fromRGB(120, 125, 140),
        Userpad = Color3.fromRGB(235, 237, 244),
        UserIcon = Color3.fromRGB(220, 222, 232),
        Hover = Color3.fromRGB(240, 242, 250),
        Border = Color3.fromRGB(180, 185, 200),
        Shadow = Color3.fromRGB(100, 100, 120),
        ServerBorder = Color3.fromRGB(80, 120, 255),
        NotificationBg = Color3.fromRGB(235, 237, 244),
        NotificationBorder = Color3.fromRGB(80, 120, 255)
    },
    Amoled = {
        Main = Color3.fromRGB(0, 0, 0),
        Secondary = Color3.fromRGB(8, 8, 12),
        Tertiary = Color3.fromRGB(15, 15, 22),
        Accent = Color3.fromRGB(100, 140, 255),
        AccentGradient = Color3.fromRGB(140, 100, 255),
        Text = Color3.fromRGB(255, 255, 255),
        TextMuted = Color3.fromRGB(140, 145, 155),
        Userpad = Color3.fromRGB(5, 5, 10),
        UserIcon = Color3.fromRGB(12, 12, 18),
        Hover = Color3.fromRGB(20, 20, 30),
        Border = Color3.fromRGB(30, 30, 40),
        Shadow = Color3.fromRGB(0, 0, 0),
        ServerBorder = Color3.fromRGB(100, 140, 255),
        NotificationBg = Color3.fromRGB(5, 5, 10),
        NotificationBorder = Color3.fromRGB(100, 140, 255)
    }
}
local PredefinedColors = {
    White = Color3.fromRGB(255, 255, 255),
    Black = Color3.fromRGB(0, 0, 0),
    Red = Color3.fromRGB(255, 0, 0),
    Green = Color3.fromRGB(0, 255, 0),
    Blue = Color3.fromRGB(0, 0, 255),
    Yellow = Color3.fromRGB(255, 255, 0),
    Cyan = Color3.fromRGB(0, 255, 255),
    Magenta = Color3.fromRGB(255, 0, 255),
    Orange = Color3.fromRGB(255, 165, 0),
    Purple = Color3.fromRGB(128, 0, 128),
    Pink = Color3.fromRGB(255, 192, 203),
    Brown = Color3.fromRGB(165, 42, 42),
    Gray = Color3.fromRGB(128, 128, 128),
    Silver = Color3.fromRGB(192, 192, 192),
    Gold = Color3.fromRGB(255, 215, 0),
    DiscordBlurple = Color3.fromRGB(88, 101, 242),
    DiscordGreen = Color3.fromRGB(87, 242, 135),
    DiscordRed = Color3.fromRGB(242, 63, 67),
    NeonPink = Color3.fromRGB(255, 20, 147),
    NeonBlue = Color3.fromRGB(77, 77, 255),
    Midnight = Color3.fromRGB(25, 25, 50),
    Ocean = Color3.fromRGB(0, 105, 148),
    Lava = Color3.fromRGB(255, 69, 0),
    Ice = Color3.fromRGB(173, 216, 230),
    Mint = Color3.fromRGB(189, 252, 201)
}

local AdvancedThemes = {
    Hacker = {Main=Color3.fromRGB(0,10,0),Secondary=Color3.fromRGB(0,20,0),Tertiary=Color3.fromRGB(0,35,0),Accent=Color3.fromRGB(0,255,0),AccentGradient=Color3.fromRGB(0,180,0),Text=Color3.fromRGB(0,255,0),TextMuted=Color3.fromRGB(0,150,0),Hover=Color3.fromRGB(0,50,0),Border=Color3.fromRGB(0,80,0),Shadow=Color3.fromRGB(0,0,0),ServerBorder=Color3.fromRGB(0,255,0),NotificationBg=Color3.fromRGB(0,15,0),NotificationBorder=Color3.fromRGB(0,255,0),Userpad=Color3.fromRGB(0,15,0),UserIcon=Color3.fromRGB(0,25,0)},
    ["Mario Bros"] = {Main=Color3.fromRGB(40,30,30),Secondary=Color3.fromRGB(60,20,20),Tertiary=Color3.fromRGB(80,30,30),Accent=Color3.fromRGB(255,50,50),AccentGradient=Color3.fromRGB(255,150,50),Text=Color3.fromRGB(255,255,255),TextMuted=Color3.fromRGB(255,200,150),Hover=Color3.fromRGB(100,40,40),Border=Color3.fromRGB(255,215,0),Shadow=Color3.fromRGB(0,0,0),ServerBorder=Color3.fromRGB(255,215,0),NotificationBg=Color3.fromRGB(50,20,20),NotificationBorder=Color3.fromRGB(255,50,50),Userpad=Color3.fromRGB(50,20,20),UserIcon=Color3.fromRGB(70,25,25)},
    ["Ocean Blue"] = {Main=Color3.fromRGB(10,20,40),Secondary=Color3.fromRGB(15,30,60),Tertiary=Color3.fromRGB(20,45,80),Accent=Color3.fromRGB(0,150,255),AccentGradient=Color3.fromRGB(0,200,200),Text=Color3.fromRGB(200,230,255),TextMuted=Color3.fromRGB(100,160,200),Hover=Color3.fromRGB(30,60,100),Border=Color3.fromRGB(0,100,200),Shadow=Color3.fromRGB(0,0,20),ServerBorder=Color3.fromRGB(0,150,255),NotificationBg=Color3.fromRGB(12,25,50),NotificationBorder=Color3.fromRGB(0,200,255),Userpad=Color3.fromRGB(12,25,50),UserIcon=Color3.fromRGB(18,35,65)},
    Sunset = {Main=Color3.fromRGB(40,20,30),Secondary=Color3.fromRGB(60,25,40),Tertiary=Color3.fromRGB(80,30,50),Accent=Color3.fromRGB(255,100,50),AccentGradient=Color3.fromRGB(255,50,150),Text=Color3.fromRGB(255,220,200),TextMuted=Color3.fromRGB(200,150,130),Hover=Color3.fromRGB(100,35,60),Border=Color3.fromRGB(255,150,100),Shadow=Color3.fromRGB(20,0,10),ServerBorder=Color3.fromRGB(255,100,50),NotificationBg=Color3.fromRGB(50,22,35),NotificationBorder=Color3.fromRGB(255,150,100),Userpad=Color3.fromRGB(50,22,35),UserIcon=Color3.fromRGB(65,28,45)},
    ["Neon City"] = {Main=Color3.fromRGB(10,5,25),Secondary=Color3.fromRGB(20,10,40),Tertiary=Color3.fromRGB(30,15,55),Accent=Color3.fromRGB(255,0,255),AccentGradient=Color3.fromRGB(0,255,255),Text=Color3.fromRGB(255,255,255),TextMuted=Color3.fromRGB(200,150,255),Hover=Color3.fromRGB(40,20,70),Border=Color3.fromRGB(255,0,255),Shadow=Color3.fromRGB(0,0,0),ServerBorder=Color3.fromRGB(0,255,255),NotificationBg=Color3.fromRGB(15,8,30),NotificationBorder=Color3.fromRGB(255,0,255),Userpad=Color3.fromRGB(15,8,30),UserIcon=Color3.fromRGB(25,12,45)},
    Cyberpunk = {Main=Color3.fromRGB(15,5,25),Secondary=Color3.fromRGB(25,10,40),Tertiary=Color3.fromRGB(40,15,55),Accent=Color3.fromRGB(255,200,0),AccentGradient=Color3.fromRGB(255,0,255),Text=Color3.fromRGB(255,255,100),TextMuted=Color3.fromRGB(200,150,50),Hover=Color3.fromRGB(50,20,70),Border=Color3.fromRGB(255,200,0),Shadow=Color3.fromRGB(0,0,0),ServerBorder=Color3.fromRGB(255,0,255),NotificationBg=Color3.fromRGB(20,8,30),NotificationBorder=Color3.fromRGB(255,200,0),Userpad=Color3.fromRGB(20,8,30),UserIcon=Color3.fromRGB(30,12,45)},
    Sakura = {Main=Color3.fromRGB(40,25,35),Secondary=Color3.fromRGB(55,30,45),Tertiary=Color3.fromRGB(70,35,55),Accent=Color3.fromRGB(255,150,200),AccentGradient=Color3.fromRGB(255,200,220),Text=Color3.fromRGB(255,220,240),TextMuted=Color3.fromRGB(200,150,180),Hover=Color3.fromRGB(85,40,65),Border=Color3.fromRGB(255,180,210),Shadow=Color3.fromRGB(20,10,15),ServerBorder=Color3.fromRGB(255,150,200),NotificationBg=Color3.fromRGB(45,28,38),NotificationBorder=Color3.fromRGB(255,200,220),Userpad=Color3.fromRGB(45,28,38),UserIcon=Color3.fromRGB(60,32,48)},
    Lava = {Main=Color3.fromRGB(40,10,5),Secondary=Color3.fromRGB(55,15,8),Tertiary=Color3.fromRGB(70,20,10),Accent=Color3.fromRGB(255,100,0),AccentGradient=Color3.fromRGB(255,200,0),Text=Color3.fromRGB(255,200,150),TextMuted=Color3.fromRGB(200,120,80),Hover=Color3.fromRGB(85,25,15),Border=Color3.fromRGB(255,150,0),Shadow=Color3.fromRGB(20,5,0),ServerBorder=Color3.fromRGB(255,100,0),NotificationBg=Color3.fromRGB(45,12,8),NotificationBorder=Color3.fromRGB(255,200,0),Userpad=Color3.fromRGB(45,12,8),UserIcon=Color3.fromRGB(60,18,10)},
    Ice = {Main=Color3.fromRGB(20,30,50),Secondary=Color3.fromRGB(25,40,65),Tertiary=Color3.fromRGB(30,50,80),Accent=Color3.fromRGB(100,200,255),AccentGradient=Color3.fromRGB(200,230,255),Text=Color3.fromRGB(220,240,255),TextMuted=Color3.fromRGB(150,190,220),Hover=Color3.fromRGB(35,60,95),Border=Color3.fromRGB(150,210,255),Shadow=Color3.fromRGB(0,10,30),ServerBorder=Color3.fromRGB(100,200,255),NotificationBg=Color3.fromRGB(22,35,55),NotificationBorder=Color3.fromRGB(200,230,255),Userpad=Color3.fromRGB(22,35,55),UserIcon=Color3.fromRGB(28,45,70)},
    Vampire = {Main=Color3.fromRGB(30,5,10),Secondary=Color3.fromRGB(45,10,15),Tertiary=Color3.fromRGB(60,15,20),Accent=Color3.fromRGB(200,0,0),AccentGradient=Color3.fromRGB(150,0,50),Text=Color3.fromRGB(255,200,200),TextMuted=Color3.fromRGB(200,120,120),Hover=Color3.fromRGB(75,20,25),Border=Color3.fromRGB(150,0,0),Shadow=Color3.fromRGB(15,0,0),ServerBorder=Color3.fromRGB(200,0,0),NotificationBg=Color3.fromRGB(35,8,12),NotificationBorder=Color3.fromRGB(150,0,50),Userpad=Color3.fromRGB(35,8,12),UserIcon=Color3.fromRGB(50,12,18)}
}
local CONFIG_DIR = "DisLibPro/Configs"
local currentConfigData = {}

local function sanitizeForSave(value)
    local t = typeof(value)
    if t == "Color3" then
        return {R = value.R, G = value.G, B = value.B}
    elseif t == "table" then
        local new = {}
        for k, v in pairs(value) do
            if type(k) == "string" then new[k] = sanitizeForSave(v) end
        end
        return new
    elseif t == "string" or t == "number" or t == "boolean" or value == nil then
        return value
    end
    return nil
end

function DiscordLib:SaveConfig(configName)
    if not (writefile and makefolder and isfolder) then return false end
    configName = tostring(configName or getgenv().ConfigName or "Default")
    local filePath = CONFIG_DIR .. "/" .. configName .. ".json"
    local function ensureFolder(path)
        local current = ""
        for folder in string.gmatch(path, "[^/]+") do
            current = (current == "" and folder) or (current .. "/" .. folder)
            local ok, exists = pcall(isfolder, current)
            if not ok or not exists then pcall(makefolder, current) end
        end
    end
    ensureFolder(CONFIG_DIR)
    local settings = self:ExportSettings()
    local wsX, wsY, ws = settings.windowSizeX, settings.windowSizeY, settings.windowSize
    if isMaximized and savedSizeBeforeMax then
        wsX = savedSizeBeforeMax.X.Offset / 619
        wsY = savedSizeBeforeMax.Y.Offset / 389
        ws = math.min(wsX, wsY)
    end
    local saveData = {
        windowSize = ws,
        windowSizeX = wsX,
        windowSizeY = wsY,
        font = settings.font,
        themeName = settings.themeName,
        theme = sanitizeForSave(settings.theme)
    }
    local ok, encoded = pcall(function() return HttpService:JSONEncode(saveData) end)
    if not ok then return false end
    local success = pcall(function() writefile(filePath, encoded) end)
    if success then currentConfigData = saveData end
    return success
end

local AUTOLOAD_FILE = CONFIG_DIR .. "/_autoload.json"

local function ensureConfigFolder()
    if not (makefolder and isfolder) then return false end
    local current = ""
    for folder in string.gmatch(CONFIG_DIR, "[^/]+") do
        current = (current == "" and folder) or (current .. "/" .. folder)
        local ok, exists = pcall(isfolder, current)
        if not ok or not exists then pcall(makefolder, current) end
    end
    return true
end

function DiscordLib:GetAutoLoad()
    if not (isfile and readfile) then return false, nil end
    local okE, exists = pcall(isfile, AUTOLOAD_FILE)
    if not okE or not exists then return false, nil end
    local okR, raw = pcall(readfile, AUTOLOAD_FILE)
    if not okR then return false, nil end
    local okD, data = pcall(function() return HttpService:JSONDecode(raw) end)
    if not okD or type(data) ~= "table" then return false, nil end
    return data.enabled == true, tostring(data.config or "Default")
end

function DiscordLib:SetAutoLoad(enabled, configName)
    if not (writefile and makefolder and isfolder) then return false end
    ensureConfigFolder()
    local _, current = self:GetAutoLoad()
    local data = {
        enabled = enabled == true,
        config = tostring(configName or current or getgenv().ConfigName or "Default"),
    }
    local ok, encoded = pcall(function() return HttpService:JSONEncode(data) end)
    if not ok then return false end
    return (pcall(writefile, AUTOLOAD_FILE, encoded))
end

function DiscordLib:LoadConfig(configName)
    configName = tostring(configName or getgenv().ConfigName or "Default")
    local filePath = CONFIG_DIR .. "/" .. configName .. ".json"
    local exists = false
    if isfile then
        local ok, r = pcall(isfile, filePath); exists = ok and r
    else
        local ok, r = pcall(readfile, filePath); exists = ok and r
    end
    if not exists then return false end
    local okR, content = pcall(readfile, filePath)
    if not okR then return false end
    local ok, data = pcall(function() return HttpService:JSONDecode(content) end)
    if not ok or type(data) ~= "table" then return false end
    currentConfigData = data

    local sx = tonumber(data.windowSizeX) or tonumber(data.windowSize)
    local sy = tonumber(data.windowSizeY) or tonumber(data.windowSize)
    if sx and sy then
        local cam = workspace.CurrentCamera
        local vp = cam and cam.ViewportSize or Vector2.new(1280, 720)
        sx = math.clamp(sx, 0.7, math.max(0.7, (vp.X - 20) / 619))
        sy = math.clamp(sy, 0.7, math.max(0.7, (vp.Y - 20) / 389))
        pcall(function() self:SetWindowSize(sx, sy) end)
    end

    if data.themeName then
        pcall(function() self:SetTheme(data.themeName, true) end)
    elseif data.theme and next(data.theme) then
        local t = {}
        for k, v in pairs(data.theme) do
            if type(v) == "table" and v.R and v.G and v.B then
                t[k] = Color3.new(v.R, v.G, v.B)
            end
        end
        if next(t) then pcall(function() self:SetAdvancedTheme(t, true) end) end
    end

    if data.font then
        local okF, fontEnum = pcall(function() return Enum.Font[data.font] end)
        if okF and fontEnum then pcall(function() self:SetFont(fontEnum, true) end) end
    end
    return true
end

function DiscordLib:DeleteConfig(configName)
    configName = tostring(configName or getgenv().ConfigName or "Default")
    local filePath = CONFIG_DIR .. "/" .. configName .. ".json"
    local ok = pcall(function() delfile(filePath) end)
    if ok then currentConfigData = {} end
    return ok
end

function DiscordLib:GetConfigInfo(configName)
    configName = tostring(configName or getgenv().ConfigName or "Default")
    local filePath = CONFIG_DIR .. "/" .. configName .. ".json"
    local exists = isfile and isfile(filePath)
    if not exists then return nil end
    local content = readfile(filePath)
    local ok, data = pcall(function() return HttpService:JSONDecode(content) end)
    return ok and data or nil
end
local currentTheme = Themes.Dark
local currentTransparency = 0

local ServerButtons = {}
local ServerChannels = {}

local function CreateFrame(e,t,n,o,i,s,r)
  local a=Instance.new("Frame")
  a.Name=t or XorEncode("");a.Parent=e;a.BackgroundColor3=n or currentTheme.Tertiary
  a.BackgroundTransparency=o ~= nil and o or 1;a.BorderSizePixel=0
  a.Size=i or UDim2.new(0,370,0,50);a.Position=s or UDim2.new(0,0,0,0)
  a.ZIndex=r or 1;a.ClipsDescendants=true;return a
end

local function CreateCorner(e,t)
  local n=Instance.new("UICorner")
  n.CornerRadius=UDim.new(0,t or 6);n.Name=EncriptyText(math.random(6,12));n.Parent=e;return n
end

local function CreateLabel(e,t,n,o,i,s,r,a,l)
  local c=Instance.new("TextLabel")
  c.Name=t or XorEncode("");c.Parent=e;c.BackgroundTransparency=1
  c.Size=r or UDim2.new(0,200,0,20);c.Position=a or UDim2.new(0,10,0,0)
  c.Font=s or currentFont;c.Text=n or XorEncode("");c.TextColor3=o or currentTheme.Text
  c.TextSize=i or 14;c.TextXAlignment=Enum.TextXAlignment.Left;c.ZIndex=l or 7;return c
end

local function CreateTextButton(e,t,n,o,i)
  local s=Instance.new("TextButton")
  s.Name=t or XorEncode("");s.Parent=e;s.BackgroundColor3=currentTheme.Tertiary;s.BorderSizePixel=0
  s.Size=n or UDim2.new(0,200,0,30);s.Position=o or UDim2.new(0,0,0,0)
  s.Text=XorEncode("");s.Font=currentFont;s.TextColor3=currentTheme.Text;s.TextSize=14
  s.AutoButtonColor=false;s.ZIndex=i or 7;s.ClipsDescendants=true;return s
end

local GuiService = game:GetService("GuiService")
local TextService = game:GetService("TextService")

local IconAssets = (type(IconData) == "table" and type(IconData.assets) == "table") and IconData.assets or {}

local function ResolveIcon(name)
    if type(name) == "number" then return "rbxassetid://" .. tostring(name) end
    if type(name) ~= "string" or name == "" then return nil end
    if name:match("^%d+$") then return "rbxassetid://" .. name end
    if name:find("://", 1, true) then return name end
    if IconAssets[name] then return IconAssets[name] end
    local base = name:lower():gsub("^lucide%-", ""):gsub("[_%s]+", "-")
    return IconAssets["lucide-" .. base]
end

local function IsGlyphName(name)
    return type(name) == "string" and name ~= "" and not name:find("://", 1, true) and not name:match("^%d+$")
end

function DiscordLib:GetIcon(name) return ResolveIcon(name) end

function DiscordLib:AddIcons(tbl)
    if type(tbl) ~= "table" then return end
    local src = (type(tbl.assets) == "table") and tbl.assets or tbl
    for k, v in pairs(src) do
        if type(k) == "string" then
            if type(v) == "number" then v = "rbxassetid://" .. tostring(v) end
            IconAssets[k] = v
        end
    end
end

local function CreateIcon(parent, name, size, color, position, zindex)
    local img = Instance.new("ImageLabel")
    img.Name = EncriptyText(math.random(6, 10))
    img.BackgroundTransparency = 1
    img.BorderSizePixel = 0
    img.Size = UDim2.new(0, size or 16, 0, size or 16)
    img.Position = position or UDim2.new(0, 0, 0, 0)
    img.Image = ResolveIcon(name) or ""
    img.ImageColor3 = color or currentTheme.Text
    img.ScaleType = Enum.ScaleType.Fit
    img.ZIndex = zindex or 7
    img.Parent = parent
    return img
end

local function SetIcon(img, name)
    if img and img.Parent then img.Image = ResolveIcon(name) or "" end
end

local function CreateIconButton(parent, iconName, size, iconSize, zindex, color)
    local b = Instance.new("TextButton")
    b.Name = EncriptyText(math.random(6, 10))
    b.AutoButtonColor = false
    b.Text = ""
    b.BackgroundColor3 = currentTheme.Hover
    b.BackgroundTransparency = 1
    b.BorderSizePixel = 0
    b.Size = UDim2.new(0, size, 0, size)
    b.ZIndex = zindex or 7
    b.Parent = parent
    CreateCorner(b, 6)
    local ic = CreateIcon(b, iconName, iconSize or (size - 10), color or currentTheme.TextMuted,
        UDim2.new(0.5, -math.floor((iconSize or (size - 10)) / 2), 0.5, -math.floor((iconSize or (size - 10)) / 2)),
        (zindex or 7) + 1)
    return b, ic
end

local function SetChevron(btn, expanded)
    if not btn then return end
    btn.Text = ""
    if expanded == nil then expanded = btn:GetAttribute("Exp") == true end
    btn:SetAttribute("Exp", expanded and true or false)
    local ic = btn:FindFirstChild(ENC.ChevronIcon)
    if not ic then
        ic = CreateIcon(btn, "lucide-chevron-down", 16, currentTheme.Accent, UDim2.new(0.5, -8, 0.5, -8), (btn.ZIndex or 7) + 1)
        ic.Name = ENC.ChevronIcon
    end
    ic.Image = ResolveIcon(expanded and "lucide-chevron-up" or "lucide-chevron-down") or ""
    ic.ImageColor3 = currentTheme.Accent
end

local function SetCheckIcon(holder, on)
    if not holder then return end
    holder.Text = ""
    local ic = holder:FindFirstChild(ENC.CheckIcon)
    if not ic then
        ic = CreateIcon(holder, "lucide-square", 16, currentTheme.Text, UDim2.new(0.5, -8, 0.5, -8), (holder.ZIndex or 11) + 1)
        ic.Name = ENC.CheckIcon
    end
    ic.Image = ResolveIcon(on and "lucide-check-square" or "lucide-square") or ""
    ic.ImageColor3 = currentTheme.Text
end

local function CreateBlindOverlay(target, radius)
    local Overlay = Instance.new("TextButton")
    Overlay.Name = EncriptyText(math.random(8, 14))
    Overlay.AutoButtonColor = false
    Overlay.Text = ""
    Overlay.Size = UDim2.new(1, 0, 1, 0)
    Overlay.Position = UDim2.new(0, 0, 0, 0)
    Overlay.BackgroundColor3 = Color3.fromRGB(0, 0, 0)
    Overlay.BackgroundTransparency = 1
    Overlay.BorderSizePixel = 0
    Overlay.ZIndex = 60
    Overlay.Visible = false
    Overlay.Active = true
    Overlay.Selectable = false
    Overlay.ClipsDescendants = true
    Overlay.Parent = target
    CreateCorner(Overlay, radius or 6)

    local Lock = CreateIcon(Overlay, "lucide-lock", 18, Color3.fromRGB(255, 255, 255), UDim2.new(1, -30, 0.5, -9), 61)
    Lock.ImageTransparency = 1

    local state = false
    local obj = { Instance = Overlay }
    function obj:Set(v)
        v = v and true or false
        state = v
        if not (Overlay and Overlay.Parent) then return end
        if v then
            Overlay.Visible = true
            TweenService:Create(Overlay, TweenInfo.new(0.2), { BackgroundTransparency = 0.5 }):Play()
            TweenService:Create(Lock, TweenInfo.new(0.2), { ImageTransparency = 0 }):Play()
        else
            TweenService:Create(Overlay, TweenInfo.new(0.2), { BackgroundTransparency = 1 }):Play()
            TweenService:Create(Lock, TweenInfo.new(0.2), { ImageTransparency = 1 }):Play()
            task.delay(0.2, function()
                if not state and Overlay and Overlay.Parent then Overlay.Visible = false end
            end)
        end
    end
    function obj:Get() return state end
    function obj:Destroy() if Overlay then Overlay:Destroy() end end
    return obj
end

local function AttachBlindMethods(holder, api, radius)
    local ov = CreateBlindOverlay(holder, radius or 6)
    rawset(api, "Blind", function(_, value)
        if value == nil then return ov:Get() end
        ov:Set(value)
        return ov:Get()
    end)
    rawset(api, "Unblind", function() ov:Set(false); return false end)
    rawset(api, "IsBlinded", function() return ov:Get() end)
    return api
end

local function GetPointerPos(input)
    local inset = GuiService:GetGuiInset()
    if input and input.UserInputType == Enum.UserInputType.Touch then
        return Vector2.new(input.Position.X + inset.X, input.Position.Y + inset.Y)
    end
    return UserInputService:GetMouseLocation()
end

local function IsPointerOver(gui, input)
    if not gui or not gui.Parent then return false end
    local p = GetPointerPos(input)
    local pos, size = gui.AbsolutePosition, gui.AbsoluteSize
    return p.X >= pos.X and p.X <= pos.X + size.X and p.Y >= pos.Y and p.Y <= pos.Y + size.Y
end

local function EscapeRich(s)
    s = tostring(s or "")
    s = s:gsub("&", "&amp;"):gsub("<", "&lt;"):gsub(">", "&gt;")
    return s
end

local function ToRGBString(c)
    return string.format("rgb(%d,%d,%d)", math.floor(c.R * 255 + 0.5), math.floor(c.G * 255 + 0.5), math.floor(c.B * 255 + 0.5))
end

local function MeasureText(text, size, font, width)
    local ok, v = pcall(function()
        return TextService:GetTextSize(tostring(text or ""), size, font or currentFont, Vector2.new(width, 10000))
    end)
    if ok and v then return v end
    return Vector2.new(width, size + 4)
end

local function StripRich(s)
    return (tostring(s or ""):gsub("<[^>]->", ""))
end

local function MeasureDescH(text, size, width)
    local v = MeasureText(StripRich(text), size, currentFont, math.max(width or 300, 40))
    return math.ceil(v.Y)
end

local function MakeNullObject()
    local obj
    obj = setmetatable({}, {
        __index = function() return function() return obj end end,
        __call = function() return obj end,
    })
    return obj
end

local DDStyle = { Title = 13, Desc = 11, Count = 11 }

local function NewGradient(parent, a, b, rotation)
    local g = Instance.new("UIGradient")
    g.Rotation = rotation or 0
    g.Color = ColorSequence.new({ ColorSequenceKeypoint.new(0, a), ColorSequenceKeypoint.new(1, b) })
    g.Parent = parent
    return g
end

local function NewStroke(parent, color, thickness, transparency)
    local s = Instance.new("UIStroke")
    s.Color = color
    s.Thickness = thickness or 1
    s.Transparency = transparency or 0
    s.ApplyStrokeMode = Enum.ApplyStrokeMode.Border
    s.Parent = parent
    return s
end

function EncriptyText(Y)
local length = Y or math.random(10, 20)
    local array = {}
    for i = 1, length do
        array[i] = string.char(math.random(32, 126))
    end
    return table.concat(array)
end

if not getgenv().NewNameY or getgenv().NewNameY == nil or getgenv().NewNameY == "" then
    getgenv().NewNameY = EncriptyText()
else
    for _, XP in pairs(game:GetService("CoreGui"):GetDescendants()) do
        if XP.Name == getgenv().NewNameY then XP:Destroy() end
    end
end

if not getgenv().NameButton3817 or getgenv().NameButton3817 == nil or getgenv().NameButton3817 == "" then
    getgenv().NameButton3817 = EncriptyText()
else
    for _, XP in pairs(game:GetService("CoreGui"):GetDescendants()) do
        if XP.Name == getgenv().NameButton3817 then XP:Destroy() end
    end
end

local activeNotifications = {}
local currentServer = ""
local currentChannel = ""


local function CreateShadow(e,t,n)
  local o=Instance.new("ImageLabel")
  o.Name=ENC.Shadow;o.Parent=e;o.BackgroundTransparency=1
  o.Image="rbxassetid://6014261993";o.ImageColor3=currentTheme.Shadow
  o.ImageTransparency=0.7;o.ScaleType=Enum.ScaleType.Slice
  o.SliceCenter=Rect.new(49,49,49,49)
  o.Size=t or UDim2.new(1,30,1,30)
  o.Position=n or UDim2.new(0,-15,0,-15)
  o.ZIndex=0;return o
end

local function MakeDraggable(e,t)
  local n,o,i,s
  e.InputBegan:Connect(function(e)
    if isMaximized then return end
    if e.UserInputType==Enum.UserInputType.MouseButton1 or e.UserInputType==Enum.UserInputType.Touch then
      n=true;i=e.Position;s=t.Position
      e.Changed:Connect(function()if e.UserInputState==Enum.UserInputState.End then n=false end end)
    end
  end)
  e.InputChanged:Connect(function(e)
    if e.UserInputType==Enum.UserInputType.MouseMovement or e.UserInputType==Enum.UserInputType.Touch then o=e end
  end)
  local dragConn = UserInputService.InputChanged:Connect(function(e)
    if e==o and n then
      local r=e.Position-i
      t.Position=UDim2.new(s.X.Scale,s.X.Offset+r.X,s.Y.Scale,s.Y.Offset+r.Y)
    end
  end)
  t.Destroying:Connect(function() dragConn:Disconnect() end)
end

pcall(function()
    local old = getgenv().DiscordLibParentY
    if old and old.Parent then old:Destroy() end
end)
local Discord = Instance.new("ScreenGui")
Discord.IgnoreGuiInset = true
Discord.ResetOnSpawn = false
Discord.DisplayOrder = 100
Discord.Name = getgenv().NewNameY
Discord.ZIndexBehavior = Enum.ZIndexBehavior.Global
protectGui(Discord)
getgenv().DiscordLibParentY = Discord

local isMinimized = false
local savedSize = UDim2.new(0, 619, 0, 389)
local savedPosition = UDim2.new(0.5, 0, 0.5, 0)
local minimizeAnimating = false
local UpdateProtectedTitle = nil
local TitleSetHub = "Discord UI"
function DiscordLib:MinimizeUI()
  if minimizeAnimating then return end
  if isMaximized and DiscordLib.RestoreWindow then DiscordLib.RestoreWindow(true) end
  local e=Discord:FindFirstChild(ENC.MainFrame)
  if not e then return end
  local scale=e:FindFirstChildOfClass("UIScale")
  if not scale then return end
  minimizeAnimating=true
  isMinimized=not isMinimized
  getgenv().IsMinimized=isMinimized
  if type(UpdateProtectedTitle) == "function" then
    UpdateProtectedTitle(isMinimized and "[Minimized]" or (TitleSetHub or "Discord UI"))
  end
  if isMinimized then
    savedSize=e.Size;savedPosition=e.Position
    local tw=TweenService:Create(scale,TweenInfo.new(0.3,Enum.EasingStyle.Quart,Enum.EasingDirection.In),{Scale=0.001})
    tw:Play()
    task.wait(0.32)
    e.Visible=false
  else
    scale.Scale=0.001
    e.Visible=true
    local tw=TweenService:Create(scale,TweenInfo.new(0.32,Enum.EasingStyle.Quart,Enum.EasingDirection.Out),{Scale=1})
    tw:Play()
    task.wait(0.34)
    scale.Scale=1
    local key=tostring(currentServer or "")..":"..tostring(currentChannel or "")
    for t,n in pairs(Sections)do if n and n.Parent then n.Visible=t==key end end
  end
  minimizeAnimating=false
end

local function createMinimizeButton()
  local e=Instance.new("ScreenGui")
  e.Name=getgenv().NameButton3817;e.ResetOnSpawn=false
  protectGui(e)
  e.ZIndexBehavior=Enum.ZIndexBehavior.Global;e.IgnoreGuiInset=true
  getgenv().Abc4717=true
  local t=100
  local n=35
  local o=math.floor(t*currentWindowSize)
  local i=math.floor(n*currentWindowSize)
  local s=Instance.new("TextButton")
  s.Name=ENC.ToggleButton;s.Parent=e;s.BackgroundColor3=currentTheme.Main;s.BorderSizePixel=0
  s.Position=UDim2.new(0.8,0,0.9,0);s.Size=UDim2.new(0,o,0,i)
  s.Font=currentFont;s.TextColor3=currentTheme.Text
  s.TextSize=math.floor(16*currentWindowSize)
  s.ZIndex=2;s.AutoButtonColor=false;s.ClipsDescendants=true;s.Draggable=true
  CreateCorner(s,math.floor(10*currentWindowSize))
  local r=CreateFrame(e,ENC.BorderHolder,nil,1,UDim2.new(0,o+4,0,i+4),UDim2.new(0.8,-2,0.9,-2),1)
  local a=CreateFrame(r,ENC.BorderFrame,currentTheme.Accent,0,UDim2.new(1,0,1,0),nil,1)
  CreateCorner(a,math.floor(12*currentWindowSize))
  local l=Instance.new("UIGradient")
  l.Rotation=45
  l.Color=ColorSequence.new({ColorSequenceKeypoint.new(0,currentTheme.Accent),ColorSequenceKeypoint.new(0.5,currentTheme.AccentGradient),ColorSequenceKeypoint.new(1,currentTheme.Accent)})
  l.Parent=a
  s:GetPropertyChangedSignal("Position"):Connect(function()
    if r and r.Parent then r.Position=UDim2.new(s.Position.X.Scale,s.Position.X.Offset-2,s.Position.Y.Scale,s.Position.Y.Offset-2)end
  end)
  TweenService:Create(l,TweenInfo.new(3,Enum.EasingStyle.Linear,Enum.EasingDirection.In,-1),{Rotation=405}):Play()
  TweenService:Create(a,TweenInfo.new(2,Enum.EasingStyle.Sine,Enum.EasingDirection.InOut,-1,true),{BackgroundTransparency=0.3}):Play()
  local function c()
    if not s or not s.Parent then return end
    local e=currentWindowSize or 1
    if type(e)~="number"then e=1 end
    local n=math.floor(t*e)
    local i=math.floor(35*e)
    local c=math.floor(10*e)
    local d=math.floor(12*e)
    local h=math.floor(16*e)
    s.Size=UDim2.new(0,n,0,i)
    s.TextSize=h
    local u=s:FindFirstChildOfClass("UICorner")
    if u then u.CornerRadius=UDim.new(0,c)end
    if r and r.Parent then
      r.Size=UDim2.new(0,n+4,0,i+4)
      r.Position=UDim2.new(s.Position.X.Scale,s.Position.X.Offset-2,s.Position.Y.Scale,s.Position.Y.Offset-2)
      if a and a.Parent then
        local e=a:FindFirstChildOfClass("UICorner")
        if e then e.CornerRadius=UDim.new(0,d)end
      end
    end
  end
  local d=DiscordLib.SetWindowSize
  if d then
    DiscordLib.SetWindowSize=function(e,t,y)
      if t and type(t)=="number"then d(e,t,y);c()end
    end
  end
  local h=currentWindowSize
  local p=false
  local u
  u=RunService.Heartbeat:Connect(function()
    if not s or not s.Parent then if u then u:Disconnect()end;return end
    local e=currentWindowSize or 1
    if e~=h then h=e;c()end
    local vis=(getgenv().IsMinimized~=true)
    if vis~=p then p=vis;s.Text=p and"Hide"or"Show";s.BackgroundColor3=p and currentTheme.Accent or currentTheme.Main end
  end)
  s.AncestryChanged:Connect(function()if not s.Parent and u then u:Disconnect()end end)
  local f=function()
    if not getgenv().Abc4717 then return end
    local e=currentWindowSize or 1
    local n=math.floor(t*e)
    local o=math.floor(35*e)
    p=(getgenv().IsMinimized==true)
    local i=p and currentTheme.Accent or currentTheme.Main
    TweenService:Create(s,TweenInfo.new(0.3,Enum.EasingStyle.Quad,Enum.EasingDirection.Out),{BackgroundColor3=i}):Play()
    s.Text=p and"Hide"or"Show"
    s.TextColor3=p and currentTheme.Text or currentTheme.Text
    local r=1.05
    TweenService:Create(s,TweenInfo.new(0.15),{Size=UDim2.new(0,math.floor(n*r),0,math.floor(o*r))}):Play()
    task.wait(0.15)
    TweenService:Create(s,TweenInfo.new(0.15),{Size=UDim2.new(0,n,0,o)}):Play()
    if Discord and getgenv().Abc4717 then
      task.spawn(function()getgenv().Abc4717=false;task.wait(2);getgenv().Abc4717=true end)
      DiscordLib:MinimizeUI()
    end
  end
  local m=Vector2.new(0,0)
  s.InputBegan:Connect(function(v)
    if v.UserInputType==Enum.UserInputType.MouseButton1 or v.UserInputType==Enum.UserInputType.Touch then
      m=Vector2.new(v.Position.X,v.Position.Y)
    end
  end)
  local y=false
  s.MouseButton1Click:Connect(function()
    if not getgenv().Abc4717 then return end
    if y then return end
    y=true
    local v=m or Vector2.new(s.AbsolutePosition.X+s.AbsoluteSize.X/2,s.AbsolutePosition.Y+s.AbsoluteSize.Y/2)
    local b=Instance.new("Frame")
    b.Name=ENC.Ripple;b.Parent=s;b.AnchorPoint=Vector2.new(0.5,0.5)
    b.BackgroundColor3=currentTheme.Accent;b.BackgroundTransparency=0.5
    b.BorderSizePixel=0;b.ZIndex=10;b.ClipsDescendants=false
    local g=s.AbsolutePosition
    local w=v.X-g.X;local _=v.Y-g.Y
    b.Position=UDim2.new(0,w,0,_)
    b.Size=UDim2.new(0,2,0,2)
    local D=Instance.new("UICorner")
    D.CornerRadius=UDim.new(0,1);D.Parent=b
    TweenService:Create(b,TweenInfo.new(0.6,Enum.EasingStyle.Quad,Enum.EasingDirection.Out),{Size=UDim2.new(0,80,0,80),BackgroundTransparency=1}):Play()
    task.spawn(function()
      local E=0;while E<0.6 and b and b.Parent do
        local S=b.AbsoluteSize.X
        if S>0 then pcall(function()D.CornerRadius=UDim.new(0,S/2)end)end;task.wait(0.025);E=E+0.025
      end
    end)
    task.delay(0.6,function()if b and b.Parent then b:Destroy()end end)
    f()
    task.delay(0.6,function()y=false end)
  end)
  local v=function()
    if not s or not s.Parent then
      for B,A in ipairs(ThemeUpdateConnections)do
        if A==v then table.remove(ThemeUpdateConnections,B);break end
      end
      return
    end
    s.BackgroundColor3=p and currentTheme.Accent or currentTheme.Main
    s.TextColor3=currentTheme.Text
    a.BackgroundColor3=currentTheme.Accent
    l.Color=ColorSequence.new({ColorSequenceKeypoint.new(0,currentTheme.Accent),ColorSequenceKeypoint.new(0.5,currentTheme.AccentGradient),ColorSequenceKeypoint.new(1,currentTheme.Accent)})
  end
  table.insert(ThemeUpdateConnections,v)
  v()
  p=(getgenv().IsMinimized~=true);s.Text=p and"Hide"or"Show";s.BackgroundColor3=p and currentTheme.Accent or currentTheme.Main;s.TextColor3=currentTheme.Text
  getgenv().MinimizeButton=s
  c()
end

local function UpdateAllSizes(ratioX, ratioY, liveOnly)
    ratioX = ratioX or currentWindowScaleX or currentWindowSize or 1
    ratioY = ratioY or currentWindowScaleY or currentWindowSize or 1
    local uiRatio = math.min(ratioX, ratioY)

    local mainFrame = Discord:FindFirstChild(ENC.MainFrame)
    if not mainFrame then return end
    if DiscordLib._applySettingsScale then pcall(DiscordLib._applySettingsScale) end
    local serversFrame = mainFrame:FindFirstChild(ENC.ServersHoldFrame)
    if serversFrame then
        local sfw = math.floor(60 * ratioX)
        local sfh = math.floor(350 * ratioY)
        serversFrame.Size = UDim2.new(0, sfw, 1, -42)
        serversFrame.Position = UDim2.new(0.01, 0, 0, 34)
        local serversHold = serversFrame:FindFirstChild(ENC.ServersHold)
        if serversHold then 
            serversHold.Size = UDim2.new(0, math.floor(50 * ratioX), 1, -10) 
            for _, child in ipairs(serversHold:GetChildren()) do
                if child:IsA("TextButton") then
                    local ss = math.floor(40 * uiRatio)
                    child.Size = UDim2.new(0, ss, 0, ss)
                    child.TextSize = math.floor(14 * uiRatio)
                    local corner = child:FindFirstChildOfClass("UICorner")
                    if corner then
                        corner.CornerRadius = UDim.new(0, math.floor(20 * uiRatio))
                    end
                    local icon = child:FindFirstChild(ENC.ServerIcon)
                    if icon then
                        icon.Size = UDim2.new(0, ss - 4, 0, ss - 4)
                        icon.Position = UDim2.new(0, 2, 0, 2)
                        local iconCorner = icon:FindFirstChildOfClass("UICorner")
                        if iconCorner then
                            iconCorner.CornerRadius = UDim.new(0, math.floor(18 * uiRatio))
                        end
                    end
                    local bg = child:FindFirstChild(ENC.ServerSelectionBg)
                    if bg then 
                    end
                end
            end
        end
    end
    local channelsFrame = mainFrame:FindFirstChild(ENC.ChannelsHoldFrame)
    if channelsFrame then
        local cfw = math.floor(130 * ratioX)
        local cfh = math.floor(350 * ratioY)
        channelsFrame.Size = UDim2.new(0, cfw, 1, -42)
        channelsFrame.Position = UDim2.new(0.12, 0, 0, 34)
        local channelsHold = channelsFrame:FindFirstChild(ENC.ChannelsHold)
        if channelsHold then 
            local chw = math.floor(120 * ratioX)
            channelsHold.Size = UDim2.new(0, chw, 1, -10)
            channelsHold.Position = UDim2.new(0, math.floor(5 * ratioX), 0, 5)
            for _, child in ipairs(channelsHold:GetChildren()) do
                if child:IsA("TextButton") then
                    local newCw = math.floor(110 * ratioX)
                    local newChh = math.floor(24 * uiRatio)
                    child.Size = UDim2.new(0, newCw, 0, newChh)
                    local corner = child:FindFirstChildOfClass("UICorner")
                    if corner then
                        corner.CornerRadius = UDim.new(0, math.floor(6 * uiRatio))
                    end
                    local icon = child:FindFirstChild(ENC.ChannelIcon)
                    if icon then
                        icon.Size = UDim2.new(0, math.floor(14 * uiRatio), 0, math.floor(14 * uiRatio))
                    end
                    local label = child:FindFirstChild(ENC.ChannelLabel)
                    if label then
                        label.TextSize = math.floor(12 * uiRatio)
                        label.Size = UDim2.new(0, newCw - 36, 0, newChh)
                    end
                    local indicator = child:FindFirstChild(ENC.ChannelIndicator)
                    if indicator and indicator.Visible then
                        indicator.Size = UDim2.new(0, 3, 0, math.max(6, math.floor(newChh * 0.58)))
                    end
                    local selBg = child:FindFirstChild(ENC.ChannelSelectionBg)
                    if selBg then
                        local selCorner = selBg:FindFirstChildOfClass("UICorner")
                        if selCorner then
                            selCorner.CornerRadius = UDim.new(0, math.floor(6 * uiRatio))
                        end
                    end
                end
            end
        end
    end
    for _, sectionFrame in pairs(Sections) do
        if sectionFrame and sectionFrame.Parent and (not liveOnly or sectionFrame.Visible) then
            local secW = math.floor(390 * ratioX)
            local secH = math.floor(350 * ratioY)
            sectionFrame.Size = UDim2.new(0.63, 0, 1, -42)
        sectionFrame.Position = UDim2.new(0.35, 0, 0, 34)
            local sectionTitle = sectionFrame:FindFirstChild(ENC.SectionTitle)
            if sectionTitle then
                sectionTitle.TextSize = math.floor(16 * uiRatio)
                sectionTitle.Size = UDim2.new(0, secW - 10, 0, math.floor(25 * uiRatio))
            end
            for _, child in ipairs(sectionFrame:GetChildren()) do
                if child:IsA("Frame") or child:IsA("TextButton") then
                    local cname = child.Name or ""
                    local prefijoSeperator = ENC_PREFIX.Seperator
                    local prefijoToggle = ENC_PREFIX.Toggle_
                    local prefijoBind = ENC_PREFIX.Bind_
                    local prefijoSlider = ENC_PREFIX.Slider_
                    local prefijoToggleSlider = ENC_PREFIX.ToggleSlider_
                    local prefijoToggleTextbox = ENC_PREFIX.ToggleTextbox_
                    local prefijoColorpicker = ENC_PREFIX.Colorpicker_
                    local prefijoTextbox = ENC_PREFIX.Textbox_
                    local prefijoDropdown = ENC_PREFIX.Dropdown_
                    local prefijoMultiDropdown = ENC_PREFIX.MultiDropdown_
                    local prefijoButton = ENC_PREFIX.Button_
                    local prefijoParagraph = ENC_PREFIX.Paragraph_
                    local prefijoLabel = ENC_PREFIX.Label_
                    
                    if cname == prefijoSeperator then 
                        child.Size = UDim2.new(0, secW - 15, 0, 2)
                    elseif string.sub(cname, 1, #prefijoLabel) == prefijoLabel then 
                        child.Size = UDim2.new(0, secW - 10, 0, child.Size.Y.Offset)
                        child.TextSize = math.floor(11 * uiRatio)
                    elseif string.sub(cname, 1, #prefijoToggle) == prefijoToggle then 
                        child.Size = UDim2.new(0, secW - 15, 0, child.Size.Y.Offset)
                        local tf = child:FindFirstChild(ENC.ToggleFrame)
                        if tf then 
                            tf.Position = UDim2.new(0, secW - 40, 0, tf.Position.Y.Offset) 
                        end
                    elseif string.sub(cname, 1, #prefijoBind) == prefijoBind then 
                        child.Size = UDim2.new(0, secW - 14, 0, child.Size.Y.Offset)
                        local bbb = child:FindFirstChild(ENC.BindButtonBorder)
                        if bbb then 
                            bbb.Position = UDim2.new(0, secW - 130, 0.5, -12) 
                        end
                    elseif string.sub(cname, 1, #prefijoSlider) == prefijoSlider and string.sub(cname, 1, #prefijoToggleSlider) ~= prefijoToggleSlider then 
                        child.Size = UDim2.new(0, secW - 15, 0, child.Size.Y.Offset)
                        local sv = child:FindFirstChild(ENC.SVal)
                        if sv then 
                            sv.Position = UDim2.new(0, secW - 95, 0, sv.Position.Y.Offset) 
                        end
                        local sb = child:FindFirstChild(ENC.SB)
                        if sb then 
                            sb.Size = UDim2.new(0, secW - 40, 0, 10) 
                        end
                    elseif string.sub(cname, 1, #prefijoToggleSlider) == prefijoToggleSlider then 
    child.Size = UDim2.new(0, secW, 0, child.Size.Y.Offset)
    local tc = child:FindFirstChild(ENC.TC)
    if tc then 
        local ratioX = currentWindowScaleX or 1
        local ratioY = currentWindowScaleY or 1
        tc.Position = UDim2.new(0, math.floor(290 * ratioX), 0, math.floor(5 * ratioY))
    end
    local sv = child:FindFirstChild(ENC.SV)
    if sv then 
        sv.Position = UDim2.new(0, math.floor(220 * ratioX), 0, math.floor(5 * ratioY))
    end
    local sf = child:FindFirstChild(ENC.SF)
    if sf then 
        sf.Size = UDim2.new(0, secW - 20, 0, 32)
        local sb = sf:FindFirstChild(ENC.SB)
        if sb then 
            sb.Size = UDim2.new(0, secW - 40, 0, 10) 
        end
        local sliderFill = sb and sb:FindFirstChild(ENC.SFL)
        local knob = sb and sb:FindFirstChild(ENC.SBtn)
        if knob and sliderFill and sb then
            local percent = sliderFill.Size.X.Scale
            local sbWidth = sb.Size.X.Offset
            local bs = 16
            knob.Position = UDim2.new(0, math.clamp(percent * sbWidth - bs/2, 0, sbWidth - bs), 0.5, -bs/2)
        end
    end
                    elseif string.sub(cname, 1, #prefijoToggleTextbox) == prefijoToggleTextbox then 
    child.Size = UDim2.new(1, -5, 0, child.Size.Y.Offset)
    local tc = child:FindFirstChild(ENC.TC)
    if tc then 
        tc.Position = UDim2.new(1, -30, 0, 5)
    end
    local txf = child:FindFirstChild(ENC.SF)
    if txf then 
        txf.Size = UDim2.new(1, -14, 0, 34)
        local tbox = txf:FindFirstChild(XorEncode("Textbox"))
        if tbox then 
            tbox.Size = UDim2.new(1, -10, 0, 24) 
        end
    end
                    elseif string.sub(cname, 1, #prefijoColorpicker) == prefijoColorpicker then 
    child.Size = UDim2.new(0, secW - 14, 0, child.Size.Y.Offset)
    local cbb = child:FindFirstChild(ENC.ColorButtonBorder)
    if cbb then 
        local ratio = currentWindowSize or 1
        local btnW = math.floor(60 * ratio)
        cbb.Size = UDim2.new(0, btnW + 4, 0, math.floor(24 * ratio))
        cbb.Position = UDim2.new(1, -23, 0.5, 0)
        local innerBtn = cbb:FindFirstChild(ENC.ColorButton)
        if innerBtn then
            innerBtn.Size = UDim2.new(0, btnW, 0, math.floor(20 * ratio))
            local colorDisplay = innerBtn:FindFirstChild(ENC.ColorDisplay)
            if colorDisplay then
                colorDisplay.Size = UDim2.new(0, btnW - 4, 1, -4)
            end
        end
    end
                    elseif string.sub(cname, 1, #prefijoTextbox) == prefijoTextbox then 
                        child.Size = UDim2.new(0, secW - 15, 0, 58)
                        local tx = child:FindFirstChild(XorEncode("Textbox"))
                        if tx then 
                            tx.Size = UDim2.new(0, secW - 40, 0, 24) 
                        end
                    elseif string.sub(cname, 1, #prefijoDropdown) == prefijoDropdown then 
                        child.Size = UDim2.new(1, -14, 0, child.Size.Y.Offset)
                        local dlf = child:FindFirstChild(ENC.DropdownList)
                        if dlf and dlf.Visible then
                            dlf.Size = UDim2.new(1, 0, 0, dlf.Size.Y.Offset)
                            for _, opt in ipairs(dlf:GetChildren()) do
                                if opt:IsA("TextButton") and string.sub(opt.Name, 1, #ENC_PREFIX.Opt_) == ENC_PREFIX.Opt_ then
                                    opt.Size = UDim2.new(1, -10, 0, 28)
                                end
                            end
                        end
                        local sb = child:FindFirstChild(ENC.SearchBox)
                        if sb then
                            sb.Size = UDim2.new(1, -10, 0, 24)
                        end
                    elseif string.sub(cname, 1, #prefijoMultiDropdown) == prefijoMultiDropdown then 
                        child.Size = UDim2.new(1, -14, 0, child.Size.Y.Offset)
                        local dlf = child:FindFirstChild(ENC.MDList)
                        if dlf and dlf.Visible then
                            dlf.Size = UDim2.new(1, 0, 0, dlf.Size.Y.Offset)
                            for _, opt in ipairs(dlf:GetChildren()) do
                                if opt:IsA("TextButton") and string.sub(opt.Name, 1, #ENC_PREFIX.Opt_) == ENC_PREFIX.Opt_ then
                                    opt.Size = UDim2.new(1, -10, 0, 28)
                                end
                            end
                        end
                        local sb = child:FindFirstChild(ENC.SearchBox)
                        if sb then
                            sb.Size = UDim2.new(1, -10, 0, 24)
                        end
                    elseif string.sub(cname, 1, #prefijoButton) == prefijoButton or string.sub(cname, 1, #prefijoParagraph) == prefijoParagraph then 
    local innerDesc = child:FindFirstChild(ENC.ButtonDesc)
        or child:FindFirstChild(ENC.ParagraphContent)
    if innerDesc then
        innerDesc.Size = innerDesc.Size
    end
    local innerDesc = child:FindFirstChild(ENC.ButtonDesc)
    if innerDesc then
        local neededH = innerDesc.TextBounds.Y
        if neededH > 0 then
            local newH = 20 + neededH + 8 + 24
            child.Size = UDim2.new(1, -8, 0, math.max(child.Size.Y.Offset, newH))
        end
    end
                    end
                    local prefijoModel = ENC_PREFIX.Model_
                    local prefijoVideo = ENC_PREFIX.Video_
                    local prefijoAudio = ENC_PREFIX.Audio_
                    local prefijoImage = ENC_PREFIX.Image_
                    if string.sub(cname,1,#prefijoModel)==prefijoModel or string.sub(cname,1,#prefijoVideo)==prefijoVideo or string.sub(cname,1,#prefijoAudio)==prefijoAudio then
                        local desiredWidth = secW
                        local desiredHeight = math.floor(child.Size.Y.Offset)

                        child.Size = UDim2.new(0, desiredWidth - 15, 0, desiredHeight)

                        for _,obj in ipairs(child:GetDescendants()) do
                            if obj:IsA("ViewportFrame") or obj:IsA("VideoFrame") then
                                local paddingX = 20
                                local paddingY = 78

                                local newWidth = math.max(desiredWidth - paddingX, 0)
                                local newHeight = math.max(desiredHeight - paddingY, 0)

                                obj.Size = UDim2.new(0, newWidth, 0, newHeight)
                            end
                        end
                    elseif string.sub(cname,1,#prefijoImage)==prefijoImage then
                        local desiredWidth = secW
                        local desiredHeight = math.floor(child.Size.Y.Offset)
                        child.Size = UDim2.new(0, desiredWidth - 15, 0, desiredHeight)

                        local imgTitle = child:FindFirstChild(ENC.SectionTitle)
                        if imgTitle then
                            imgTitle.Size = UDim2.new(1, -20, 0, imgTitle.Size.Y.Offset)
                            imgTitle.TextSize = math.floor(14 * uiRatio)
                        end
                        local imgDesc = child:FindFirstChild(ENC.ButtonDesc)
                        if imgDesc then
                            imgDesc.Size = UDim2.new(1, -20, 0, imgDesc.Size.Y.Offset)
                            imgDesc.TextSize = math.floor(12 * uiRatio)
                        end
                        for _, obj in ipairs(child:GetChildren()) do
                            if obj:IsA("ImageLabel") then
                                obj.Size = UDim2.new(1, -20, 0, obj.Size.Y.Offset)
                            elseif obj:IsA("TextButton") and obj.Name == XorEncode("ImageClick") then
                                obj.Size = UDim2.new(1, -20, 0, obj.Size.Y.Offset)
                            end
                        end
                    end
                end
            end
        end
    end
end

local BASE_WINDOW_SIZE = Vector2.new(619, 389)
local WindowUIScale

local MIN_SCALE_AXIS = 0.7
local MAX_SCALE_AXIS = 10

local recalcDebounce = nil
local function RecalculateWindowScale(liveOnly, forceW, forceH)
    local mainFrame = Discord and Discord:FindFirstChild(ENC.MainFrame)
    if not mainFrame then return end
    if minimizeAnimating or isMinimized then return end

    local width = forceW or mainFrame.AbsoluteSize.X
    local height = forceH or mainFrame.AbsoluteSize.Y
    if width < 10 or height < 10 then return end

    local scaleX = math.clamp(width / BASE_WINDOW_SIZE.X, MIN_SCALE_AXIS, MAX_SCALE_AXIS)
    local scaleY = math.clamp(height / BASE_WINDOW_SIZE.Y, MIN_SCALE_AXIS, MAX_SCALE_AXIS)

    currentWindowScaleX = scaleX
    currentWindowScaleY = scaleY
    currentWindowSize = math.min(scaleX, scaleY)

    if WindowUIScale and math.abs(WindowUIScale.Scale - 1) > 0.001 then
        WindowUIScale.Scale = 1
    end

    pcall(UpdateAllSizes, scaleX, scaleY, liveOnly)
end
local function RecalculateWindowScaleDebounced()
    if recalcDebounce then
        task.cancel(recalcDebounce)
    end
    recalcDebounce = task.delay(0.05, function()
        recalcDebounce = nil
        RecalculateWindowScale()
    end)
end

function DiscordLib:SetWindowSize(scaleX, scaleY)
    if isMaximized then return false end
    scaleX = tonumber(scaleX) or 1
    scaleY = tonumber(scaleY) or scaleX
    local mainFrame = Discord and Discord:FindFirstChild(ENC.MainFrame)
    if not mainFrame then return end
    local newW = math.floor(BASE_WINDOW_SIZE.X * scaleX)
    local newH = math.floor(BASE_WINDOW_SIZE.Y * scaleY)
    mainFrame.Size = UDim2.new(0, newW, 0, newH)
    savedSize = mainFrame.Size
    RecalculateWindowScale(false, newW, newH)
end

local ABC3662 = 0
local currentThemeName = "Dark"
function DiscordLib:SetTheme(themeName, force)
    local currentTime = tick()
    if not force and currentTime - ABC3662 < 0.3 then
        return
    end
    ABC3662 = currentTime
    local newTheme
    if type(themeName) == "string" then
        local selectedTheme = Themes[themeName]
        if not selectedTheme then
            themeName = "Dark"
            selectedTheme = Themes.Dark
        end
        currentThemeName = themeName
        newTheme = {}
        for key, value in pairs(selectedTheme) do
            if typeof(value) == "Color3" then
                newTheme[key] = value
            else
                newTheme[key] = value
            end
        end
    elseif typeof(themeName) == "Color3" then
        currentThemeName = nil
        local isLight = (themeName.R * 0.299 + themeName.G * 0.587 + themeName.B * 0.114) > 0.5
        newTheme = {
            Main = themeName,
            Secondary = themeName:lerp(Color3.new(0, 0, 0), isLight and 0.15 or 0.2),
            Tertiary = themeName:lerp(Color3.new(0, 0, 0), isLight and 0.25 or 0.3),
            Accent = themeName:lerp(Color3.new(isLight and 0 or 1, isLight and 0 or 1, isLight and 0 or 1), isLight and 0.7 or 0.4),
            AccentGradient = themeName:lerp(Color3.new(isLight and 0 or 1, 0, isLight and 0 or 1), isLight and 0.7 or 0.4),
            Text = isLight and Color3.new(0, 0, 0) or Color3.new(1, 1, 1),
            TextMuted = isLight and Color3.new(0.3, 0.3, 0.3) or Color3.new(0.7, 0.7, 0.7),
            Userpad = themeName:lerp(Color3.new(0, 0, 0), isLight and 0.2 or 0.4),
            UserIcon = themeName:lerp(Color3.new(0, 0, 0), isLight and 0.3 or 0.5),
            Hover = themeName:lerp(Color3.new(isLight and 0 or 1, isLight and 0 or 1, isLight and 0 or 1), isLight and 0.1 or 0.2),
            Border = isLight and Color3.new(0.7, 0.7, 0.7) or Color3.new(0, 0, 0),
            Shadow = isLight and Color3.new(0.5, 0.5, 0.5) or Color3.new(0, 0, 0),
            ServerBorder = isLight and themeName:lerp(Color3.new(0, 0, 0), 0.7) or themeName:lerp(Color3.new(1, 1, 1), 0.4),
            NotificationBg = themeName:lerp(Color3.new(0, 0, 0), isLight and 0.15 or 0.3),
            NotificationBorder = isLight and themeName:lerp(Color3.new(0, 0, 0), 0.7) or themeName:lerp(Color3.new(1, 1, 1), 0.4)
        }
    elseif type(themeName) == "table" then
        currentThemeName = nil
        newTheme = {}
        for key, value in pairs(themeName) do
            newTheme[key] = value
        end
    else
        currentThemeName = "Dark"
        newTheme = {}
        for key, value in pairs(Themes.Dark) do
            newTheme[key] = value
        end
    end
    currentTheme = newTheme
    for _, updateFunc in ipairs(ThemeUpdateConnections) do
        pcall(updateFunc)
    end
end

local function CreateWindowControlButton(parent, name, iconName, order, tooltipText)
    local btn = Instance.new("TextButton")
    btn.Name = name
    btn.Parent = parent
    btn.BackgroundColor3 = currentTheme.Hover
    btn.BackgroundTransparency = 1
    btn.BorderSizePixel = 0
    btn.Size = UDim2.new(0, 26, 0, 22)
    btn.LayoutOrder = order
    btn.Text = ""
    btn.AutoButtonColor = false
    btn.ZIndex = 950
    CreateCorner(btn, 5)
    local icon = CreateIcon(btn, iconName, 14, currentTheme.TextMuted, UDim2.new(0.5, -7, 0.5, -7), 951)

    local hovered = false
    btn.MouseEnter:Connect(function()
        hovered = true
        TweenService:Create(btn, TweenInfo.new(0.15), { BackgroundTransparency = 0.3, BackgroundColor3 = currentTheme.Hover }):Play()
        TweenService:Create(icon, TweenInfo.new(0.15), { ImageColor3 = currentTheme.Text }):Play()
    end)
    btn.MouseLeave:Connect(function()
        hovered = false
        TweenService:Create(btn, TweenInfo.new(0.15), { BackgroundTransparency = 1 }):Play()
        TweenService:Create(icon, TweenInfo.new(0.15), { ImageColor3 = currentTheme.TextMuted }):Play()
    end)
    table.insert(ThemeUpdateConnections, function()
        if not btn.Parent then return end
        btn.BackgroundColor3 = currentTheme.Hover
        icon.ImageColor3 = hovered and currentTheme.Text or currentTheme.TextMuted
    end)
    return btn, icon
end

function DiscordLib:Window(XyZ)
    if DiscordLib._keyAborted then return MakeNullObject() end
    TitleSetHub = XyZ or "Discord UI"
    do
        local old = Discord:FindFirstChild(ENC.MainFrame)
        if old then old:Destroy() end
        table.clear(ServerButtons)
        table.clear(ServerChannels)
        table.clear(Sections)
        currentServer = ""
        currentChannel = ""
        isMinimized = false
        isMaximized = false
        getgenv().IsMinimized = false
        getgenv().IsMaximized = false
        SettingsPanelOpen = false
    end
    local MainFrame = CreateFrame(Discord, ENC.MainFrame, currentTheme.Main, 0, UDim2.new(0, 619, 0, 389), UDim2.new(0.5, 0, 0.5, 0), 1)
    MainFrame.AnchorPoint = Vector2.new(0.5, 0.5)
    CreateCorner(MainFrame, 10)
    local mainShadow = CreateShadow(MainFrame)
    WindowUIScale = Instance.new("UIScale")
    WindowUIScale.Scale = 1
    WindowUIScale.Parent = MainFrame
MainFrame:GetPropertyChangedSignal("AbsoluteSize"):Connect(RecalculateWindowScaleDebounced)

    DiscordLib._conns = DiscordLib._conns or {}
    for _, c in ipairs(DiscordLib._conns) do pcall(function() c:Disconnect() end) end
    DiscordLib._conns = {}
    local function Track(c) table.insert(DiscordLib._conns, c); return c end

    local TOP_H = 30
    local MainCorner = MainFrame:FindFirstChildOfClass("UICorner")

    local ResizeGrip = Instance.new("Frame")
    ResizeGrip.Name = EncriptyText(math.random(8, 14))
    ResizeGrip.AnchorPoint = Vector2.new(1, 1)
    ResizeGrip.Position = UDim2.new(1, 0, 1, 0)
    ResizeGrip.Size = UDim2.new(0, 22, 0, 22)
    ResizeGrip.BackgroundTransparency = 1
    ResizeGrip.Active = true
    ResizeGrip.ZIndex = 50
    ResizeGrip.Parent = MainFrame

    local GripIcon = CreateIcon(ResizeGrip, "lucide-move-diagonal-2", 12, currentTheme.TextMuted, UDim2.new(1, -16, 1, -16), 51)
    GripIcon.ImageTransparency = 0.45
    table.insert(ThemeUpdateConnections, function() GripIcon.ImageColor3 = currentTheme.TextMuted end)

    do
        local resizing, startInputPos, startSizeVec = false, nil, nil
        local targetW, targetH = nil, nil
        local stepConn = nil

        local function applyResize()
            if not resizing or not targetW then return end
            if isMaximized or isMinimized then return end
            local cur = MainFrame.Size
            if cur.X.Offset ~= targetW or cur.Y.Offset ~= targetH then
                MainFrame.Size = UDim2.new(0, targetW, 0, targetH)
                savedSize = MainFrame.Size
                RecalculateWindowScale(true, targetW, targetH)
            end
        end

        local function stopResize()
            if not resizing then return end
            if targetW then applyResize() end
            resizing = false
            if stepConn then stepConn:Disconnect(); stepConn = nil end
            if not isMaximized then savedSize = MainFrame.Size end
            targetW, targetH = nil, nil
            RecalculateWindowScale()
        end

        Track(ResizeGrip.InputBegan:Connect(function(input)
            if isMaximized or isMinimized or minimizeAnimating then return end
            if input.UserInputType == Enum.UserInputType.MouseButton1 or input.UserInputType == Enum.UserInputType.Touch then
                resizing = true
                startInputPos = Vector2.new(input.Position.X, input.Position.Y)
                startSizeVec = Vector2.new(MainFrame.AbsoluteSize.X, MainFrame.AbsoluteSize.Y)
                targetW, targetH = nil, nil
                if stepConn then stepConn:Disconnect() end
                stepConn = RunService.RenderStepped:Connect(applyResize)
            end
        end))
        Track(UserInputService.InputChanged:Connect(function(input)
            if not resizing then return end
            if isMaximized then
                stopResize()
                return
            end
            if input.UserInputType == Enum.UserInputType.MouseMovement or input.UserInputType == Enum.UserInputType.Touch then
                local delta = Vector2.new(input.Position.X, input.Position.Y) - startInputPos
                local minW = math.floor(BASE_WINDOW_SIZE.X * MIN_SCALE_AXIS)
                local minH = math.floor(BASE_WINDOW_SIZE.Y * MIN_SCALE_AXIS)
                local screen = Discord.AbsoluteSize
                local fx = 1 / math.max(1 - MainFrame.AnchorPoint.X, 0.25)
                local fy = 1 / math.max(1 - MainFrame.AnchorPoint.Y, 0.25)
                targetW = math.clamp(startSizeVec.X + delta.X * fx, minW, math.max(minW, screen.X))
                targetH = math.clamp(startSizeVec.Y + delta.Y * fy, minH, math.max(minH, screen.Y))
            end
        end))
        Track(UserInputService.InputEnded:Connect(function(input)
            if input.UserInputType == Enum.UserInputType.MouseButton1 or input.UserInputType == Enum.UserInputType.Touch then
                stopResize()
            end
        end))
    end

    local TopFrame = CreateFrame(MainFrame, ENC.TopFrame, currentTheme.Main, 0.1, UDim2.new(1, 0, 0, TOP_H), nil, 2)
    CreateCorner(TopFrame, 10)
    local TopIcon = CreateIcon(TopFrame, "lucide-layout-dashboard", 16, currentTheme.Accent, UDim2.new(0, 10, 0.5, -8), 4)
    table.insert(ThemeUpdateConnections, function() TopIcon.ImageColor3 = currentTheme.Accent end)

    local WindowControls = Instance.new("Frame")
    WindowControls.Name = ENC.WindowControls
    WindowControls.Parent = TopFrame
    WindowControls.BackgroundTransparency = 1
    WindowControls.AnchorPoint = Vector2.new(1, 0.5)
    WindowControls.Position = UDim2.new(1, -6, 0.5, 0)
    WindowControls.Size = UDim2.new(0, 110, 0, 22)
    WindowControls.ZIndex = 4
    do
        local l = Instance.new("UIListLayout")
        l.FillDirection = Enum.FillDirection.Horizontal
        l.HorizontalAlignment = Enum.HorizontalAlignment.Right
        l.VerticalAlignment = Enum.VerticalAlignment.Center
        l.SortOrder = Enum.SortOrder.LayoutOrder
        l.Padding = UDim.new(0, 2)
        l.Parent = WindowControls
    end

    local SearchBtnCtrl = CreateWindowControlButton(WindowControls, ENC.SearchBtn, "lucide-search", 1, "Search")
    local SettingsBtnCtrl = CreateWindowControlButton(WindowControls, ENC.SetBtn, "lucide-settings", 2, "Settings")
    local MinBtnCtrl = CreateWindowControlButton(WindowControls, ENC.MinBtn, "lucide-minus", 3, "Minimize")
    local MaxBtnCtrl, MaxIcon = CreateWindowControlButton(WindowControls, ENC.MaxBtn, "lucide-maximize-2", 4, "Maximize")

    local windowAnimating = false

    local function setMaxVisuals(max)
        ResizeGrip.Visible = not max
        SetIcon(MaxIcon, max and "lucide-minimize-2" or "lucide-maximize-2")
        if MainCorner then MainCorner.CornerRadius = UDim.new(0, max and 0 or 10) end
        if DiscordLib._refreshSettings then pcall(DiscordLib._refreshSettings) end
    end

    local function MaximizeWindow()
        if isMaximized or windowAnimating or isMinimized or minimizeAnimating then return end
        windowAnimating = true
        isMaximized = true
        getgenv().IsMaximized = true
        savedSizeBeforeMax = MainFrame.Size
        savedPosBeforeMax = MainFrame.Position
        savedAnchorBeforeMax = MainFrame.AnchorPoint
        setMaxVisuals(true)

        local absPos, absSize = MainFrame.AbsolutePosition, MainFrame.AbsoluteSize
        MainFrame.AnchorPoint = Vector2.new(0, 0)
        MainFrame.Position = UDim2.new(0, absPos.X, 0, absPos.Y)
        MainFrame.Size = UDim2.new(0, absSize.X, 0, absSize.Y)
        local tw = TweenService:Create(MainFrame, TweenInfo.new(0.25, Enum.EasingStyle.Quad, Enum.EasingDirection.Out), {
            Position = UDim2.new(0, 0, 0, 0),
            Size = UDim2.new(1, 0, 1, 0)
        })
        tw:Play()
        tw.Completed:Wait()
        windowAnimating = false
        RecalculateWindowScale()
    end

    local function RestoreWindow(waitDone)
        if not isMaximized then return end
        if windowAnimating and not waitDone then return end
        windowAnimating = true
        isMaximized = false
        getgenv().IsMaximized = false
        local sz = savedSizeBeforeMax or UDim2.new(0, BASE_WINDOW_SIZE.X, 0, BASE_WINDOW_SIZE.Y)
        local ps = savedPosBeforeMax or UDim2.new(0.5, 0, 0.5, 0)
        local ap = savedAnchorBeforeMax or Vector2.new(0.5, 0.5)
        setMaxVisuals(false)
        local screen = Discord.AbsoluteSize
        local w = sz.X.Offset + sz.X.Scale * screen.X
        local h = sz.Y.Offset + sz.Y.Scale * screen.Y
        local tx = ps.X.Scale * screen.X + ps.X.Offset - ap.X * w
        local ty = ps.Y.Scale * screen.Y + ps.Y.Offset - ap.Y * h
        local tw = TweenService:Create(MainFrame, TweenInfo.new(0.25, Enum.EasingStyle.Quad, Enum.EasingDirection.Out), {
            Position = UDim2.new(0, tx, 0, ty),
            Size = UDim2.new(0, w, 0, h)
        })
        local function finish()
            MainFrame.AnchorPoint = ap
            MainFrame.Position = ps
            MainFrame.Size = sz
            savedSize = sz
            windowAnimating = false
            RecalculateWindowScale()
        end
        tw:Play()
        if waitDone then
            tw.Completed:Wait()
            finish()
        else
            tw.Completed:Connect(finish)
        end
    end

    DiscordLib.MaximizeWindow = MaximizeWindow
    DiscordLib.RestoreWindow = RestoreWindow
    DiscordLib.ToggleMaximize = function()
        if isMaximized then RestoreWindow() else MaximizeWindow() end
    end
    DiscordLib.IsMaximized = function() return isMaximized end

    MaxBtnCtrl.MouseButton1Click:Connect(function()
        if isMaximized then RestoreWindow() else MaximizeWindow() end
    end)
    MinBtnCtrl.MouseButton1Click:Connect(function()
        DiscordLib:MinimizeUI()
    end)


    local SearchBarHolder = CreateFrame(MainFrame, XorEncode("SearchBarHolder"), currentTheme.Secondary, 0, UDim2.new(0.63, 0, 0, 34), UDim2.new(0.35, 0, 0, TOP_H + 6), 120)
    SearchBarHolder.Visible = false
    CreateCorner(SearchBarHolder, 8)
    local SearchStroke = NewStroke(SearchBarHolder, currentTheme.Accent, 1, 0.4)
    local SearchIcon = CreateIcon(SearchBarHolder, "lucide-search", 14, currentTheme.TextMuted, UDim2.new(0, 10, 0.5, -7), 121)

    local SearchBarInput = Instance.new("TextBox")
    SearchBarInput.Name = XorEncode("SearchBarInput")
    SearchBarInput.Parent = SearchBarHolder
    SearchBarInput.BackgroundTransparency = 1
    SearchBarInput.BorderSizePixel = 0
    SearchBarInput.Position = UDim2.new(0, 32, 0.5, -12)
    SearchBarInput.Size = UDim2.new(1, -66, 0, 24)
    SearchBarInput.Font = currentFont
    SearchBarInput.PlaceholderText = "Filter this section..."
    SearchBarInput.PlaceholderColor3 = currentTheme.TextMuted
    SearchBarInput.Text = ""
    SearchBarInput.TextColor3 = currentTheme.Text
    SearchBarInput.TextSize = 13
    SearchBarInput.TextXAlignment = Enum.TextXAlignment.Left
    SearchBarInput.ClearTextOnFocus = false
    SearchBarInput.ZIndex = 122

    local SearchBarClose, SearchCloseIcon = CreateIconButton(SearchBarHolder, "lucide-x", 24, 14, 122)
    SearchBarClose.Position = UDim2.new(1, -30, 0.5, -12)

    local function GetElementText(obj)
        local parts = {}
        for _, d in ipairs(obj:GetDescendants()) do
            if d:IsA("TextLabel") or d:IsA("TextButton") or d:IsA("TextBox") then
                if d.Text and d.Text ~= "" then
                    table.insert(parts, d.Text)
                end
            end
        end
        return string.lower(table.concat(parts, " "))
    end

    local function FilterCurrentSection(query)
        query = string.lower(query or "")
        local path = tostring(currentServer or "") .. ":" .. tostring(currentChannel or "")
        local sectionFrame = Sections[path]
        if not sectionFrame or not sectionFrame.Parent then return end
        for _, child in ipairs(sectionFrame:GetChildren()) do
            if (child:IsA("Frame") or child:IsA("TextButton")) and not child:GetAttribute("NoFilter") then
                if query == "" then
                    child.Visible = true
                else
                    child.Visible = string.find(GetElementText(child), query, 1, true) ~= nil
                end
            end
        end
    end

    Track(SearchBarInput:GetPropertyChangedSignal("Text"):Connect(function()
        FilterCurrentSection(SearchBarInput.Text)
    end))

    local function CloseSearchBar()
        SearchBarHolder.Visible = false
        SearchBarInput.Text = ""
        FilterCurrentSection("")
    end

    local function OpenSearchBar()
        SearchBarHolder.Visible = true
        SearchBarInput.Text = ""
        FilterCurrentSection("")
        task.defer(function() SearchBarInput:CaptureFocus() end)
    end

    SearchBarClose.MouseButton1Click:Connect(CloseSearchBar)
    SearchBtnCtrl.MouseButton1Click:Connect(function()
        if SearchBarHolder.Visible then CloseSearchBar() else OpenSearchBar() end
    end)
    DiscordLib._closeSearch = CloseSearchBar

    table.insert(ThemeUpdateConnections, function()
        SearchBarHolder.BackgroundColor3 = currentTheme.Secondary
        SearchStroke.Color = currentTheme.Accent
        SearchIcon.ImageColor3 = currentTheme.TextMuted
        SearchCloseIcon.ImageColor3 = currentTheme.TextMuted
        SearchBarInput.TextColor3 = currentTheme.Text
        SearchBarInput.PlaceholderColor3 = currentTheme.TextMuted
    end)

    do
        local SettingsOverlay = Instance.new("TextButton")
        SettingsOverlay.Name = ENC.SettingsOverlay
        SettingsOverlay.AutoButtonColor = false
        SettingsOverlay.Text = ""
        SettingsOverlay.BackgroundColor3 = Color3.fromRGB(0, 0, 0)
        SettingsOverlay.BackgroundTransparency = 1
        SettingsOverlay.BorderSizePixel = 0
        SettingsOverlay.Size = UDim2.new(1, 0, 1, 0)
        SettingsOverlay.ZIndex = 900
        SettingsOverlay.Visible = false
        SettingsOverlay.Active = true
        SettingsOverlay.Parent = MainFrame
        local overlayCorner = CreateCorner(SettingsOverlay, 10)
        if MainCorner then
            Track(MainCorner:GetPropertyChangedSignal("CornerRadius"):Connect(function()
                overlayCorner.CornerRadius = MainCorner.CornerRadius
            end))
        end

        local SettingsPanel = Instance.new("TextButton")
        SettingsPanel.Name = ENC.SettingsPanel
        SettingsPanel.AutoButtonColor = false
        SettingsPanel.Text = ""
        SettingsPanel.AnchorPoint = Vector2.new(0.5, 0.5)
        SettingsPanel.Position = UDim2.new(0.5, 0, 0.5, 0)
        SettingsPanel.Size = UDim2.new(0.9, 0, 0.86, 0)
        SettingsPanel.BackgroundColor3 = currentTheme.Main
        SettingsPanel.BorderSizePixel = 0
        SettingsPanel.ZIndex = 901
        SettingsPanel.ClipsDescendants = true
        SettingsPanel.Parent = SettingsOverlay
        CreateCorner(SettingsPanel, 12)
        local PanelStroke = NewStroke(SettingsPanel, currentTheme.Border, 1, 0.2)

        local SettingsScale = Instance.new("UIScale")
        local Body = Instance.new("Frame")
        Body.BackgroundTransparency = 1
        Body.BorderSizePixel = 0
        Body.Size = UDim2.new(1, 0, 1, 0)
        Body.ZIndex = 902
        Body.Parent = SettingsPanel
        SettingsScale.Parent = Body
        DiscordLib._applySettingsScale = function()
            local s = math.clamp(currentWindowSize or 1, 0.75, 3)
            SettingsScale.Scale = s
            Body.Size = UDim2.new(1 / s, 0, 1 / s, 0)
        end
        DiscordLib._applySettingsScale()

        local HeaderTile = CreateFrame(Body, nil, currentTheme.Accent, 0, UDim2.new(0, 30, 0, 30), UDim2.new(0, 14, 0, 9), 903)
        CreateCorner(HeaderTile, 8)
        local tileGrad = NewGradient(HeaderTile, currentTheme.Accent, currentTheme.AccentGradient, 45)
        CreateIcon(HeaderTile, "lucide-settings", 16, Color3.new(1, 1, 1), UDim2.new(0.5, -8, 0.5, -8), 904)
        local STitle = CreateLabel(Body, ENC.SettingsTitle, "Settings", currentTheme.Text, 16, currentFont, UDim2.new(1, -120, 0, 18), UDim2.new(0, 54, 0, 9), 903)
        local SSub = CreateLabel(Body, nil, "Customize your library", currentTheme.TextMuted, 11, currentFont, UDim2.new(1, -120, 0, 14), UDim2.new(0, 54, 0, 27), 903)
        local SClose, SCloseIcon = CreateIconButton(Body, "lucide-x", 28, 16, 904)
        SClose.Name = ENC.SettingsClose
        SClose.Position = UDim2.new(1, -40, 0, 10)
        local Divider = CreateFrame(Body, nil, currentTheme.Border, 0.4, UDim2.new(1, -28, 0, 1), UDim2.new(0, 14, 0, 46), 903)

        local Sidebar = CreateFrame(Body, nil, currentTheme.Secondary, 0.2, UDim2.new(0, 118, 1, -60), UDim2.new(0, 10, 0, 52), 903)
        CreateCorner(Sidebar, 10)
        do
            local sl = Instance.new("UIListLayout")
            sl.Padding = UDim.new(0, 4)
            sl.SortOrder = Enum.SortOrder.LayoutOrder
            sl.Parent = Sidebar
            local sp = Instance.new("UIPadding")
            sp.PaddingTop = UDim.new(0, 6)
            sp.PaddingLeft = UDim.new(0, 6)
            sp.PaddingRight = UDim.new(0, 6)
            sp.Parent = Sidebar
        end

        local SettingsContent = Instance.new("ScrollingFrame")
        SettingsContent.Name = ENC.SettingsContent
        SettingsContent.BackgroundTransparency = 1
        SettingsContent.BorderSizePixel = 0
        SettingsContent.Position = UDim2.new(0, 136, 0, 52)
        SettingsContent.Size = UDim2.new(1, -146, 1, -60)
        SettingsContent.CanvasSize = UDim2.new(0, 0, 0, 0)
        SettingsContent.AutomaticCanvasSize = Enum.AutomaticSize.Y
        SettingsContent.ScrollBarThickness = 3
        SettingsContent.ScrollBarImageColor3 = currentTheme.Accent
        SettingsContent.ZIndex = 903
        SettingsContent.Parent = Body
        do
            local cl = Instance.new("UIListLayout")
            cl.Padding = UDim.new(0, 8)
            cl.SortOrder = Enum.SortOrder.LayoutOrder
            cl.Parent = SettingsContent
            local cp = Instance.new("UIPadding")
            cp.PaddingRight = UDim.new(0, 8)
            cp.PaddingBottom = UDim.new(0, 8)
            cp.Parent = SettingsContent
        end

        local currentTab = "Themes"
        local tabButtons = {}
        local rowOrder = 0
        local function nextOrder() rowOrder = rowOrder + 1; return rowOrder end

        local function ClearContent()
            rowOrder = 0
            for _, c in ipairs(SettingsContent:GetChildren()) do
                if not c:IsA("UIListLayout") and not c:IsA("UIPadding") then c:Destroy() end
            end
        end

        local function hoverable(btn, normal, hover, normalT, hoverT)
            btn.MouseEnter:Connect(function()
                TweenService:Create(btn, TweenInfo.new(0.15), { BackgroundColor3 = hover, BackgroundTransparency = hoverT or 0 }):Play()
            end)
            btn.MouseLeave:Connect(function()
                TweenService:Create(btn, TweenInfo.new(0.15), { BackgroundColor3 = normal, BackgroundTransparency = normalT or 0 }):Play()
            end)
        end

        local function sHeader(text)
            local l = CreateLabel(SettingsContent, nil, text, currentTheme.TextMuted, 11, currentFont, UDim2.new(1, 0, 0, 16), nil, 904)
            l.LayoutOrder = nextOrder()
            return l
        end

        local function sGrid(cell)
            local holder = Instance.new("Frame")
            holder.Name = EncriptyText(math.random(6, 10))
            holder.BackgroundTransparency = 1
            holder.BorderSizePixel = 0
            holder.Size = UDim2.new(1, 0, 0, 0)
            holder.AutomaticSize = Enum.AutomaticSize.Y
            holder.LayoutOrder = nextOrder()
            holder.ZIndex = 904
            holder.Parent = SettingsContent
            local g = Instance.new("UIGridLayout")
            g.CellSize = cell
            g.CellPadding = UDim2.new(0, 6, 0, 6)
            g.SortOrder = Enum.SortOrder.LayoutOrder
            g.Parent = holder
            return holder
        end

        local function sAction(iconName, title, desc, onClick, danger)
            local card = CreateTextButton(SettingsContent, nil, UDim2.new(1, 0, 0, 46), nil, 904)
            card.BackgroundColor3 = currentTheme.Tertiary
            card.LayoutOrder = nextOrder()
            CreateCorner(card, 8)
            local tint = danger and Color3.fromRGB(242, 63, 67) or currentTheme.Accent
            local tile = CreateFrame(card, nil, tint, 0.8, UDim2.new(0, 28, 0, 28), UDim2.new(0, 9, 0.5, -14), 905)
            CreateCorner(tile, 7)
            CreateIcon(tile, iconName, 16, tint, UDim2.new(0.5, -8, 0.5, -8), 906)
            CreateLabel(card, nil, title, danger and tint or currentTheme.Text, 13, currentFont, UDim2.new(1, -90, 0, 16), UDim2.new(0, 46, 0, 7), 905)
            CreateLabel(card, nil, desc or "", currentTheme.TextMuted, 11, currentFont, UDim2.new(1, -90, 0, 14), UDim2.new(0, 46, 0, 24), 905)
            CreateIcon(card, "lucide-chevron-right", 14, currentTheme.TextMuted, UDim2.new(1, -24, 0.5, -7), 905)
            hoverable(card, currentTheme.Tertiary, currentTheme.Hover)
            card.MouseButton1Click:Connect(onClick)
            return card
        end

        local function sToggle(iconName, title, desc, initial, onChange)
            local card = CreateTextButton(SettingsContent, nil, UDim2.new(1, 0, 0, 46), nil, 904)
            card.BackgroundColor3 = currentTheme.Tertiary
            card.LayoutOrder = nextOrder()
            CreateCorner(card, 8)
            local tile = CreateFrame(card, nil, currentTheme.Accent, 0.8, UDim2.new(0, 28, 0, 28), UDim2.new(0, 9, 0.5, -14), 905)
            CreateCorner(tile, 7)
            CreateIcon(tile, iconName, 16, currentTheme.Accent, UDim2.new(0.5, -8, 0.5, -8), 906)
            CreateLabel(card, nil, title, currentTheme.Text, 13, currentFont, UDim2.new(1, -110, 0, 16), UDim2.new(0, 46, 0, 7), 905)
            local dLabel = CreateLabel(card, nil, desc or "", currentTheme.TextMuted, 11, currentFont, UDim2.new(1, -110, 0, 14), UDim2.new(0, 46, 0, 24), 905)
            dLabel.TextTruncate = Enum.TextTruncate.AtEnd
            local on = initial and true or false
            local track = CreateFrame(card, nil, on and currentTheme.Accent or currentTheme.Secondary, 0, UDim2.new(0, 38, 0, 20), UDim2.new(1, -50, 0.5, -10), 905)
            CreateCorner(track, 10)
            local knob = CreateFrame(track, nil, Color3.new(1, 1, 1), 0, UDim2.new(0, 14, 0, 14), on and UDim2.new(1, -17, 0.5, -7) or UDim2.new(0, 3, 0.5, -7), 906)
            CreateCorner(knob, 7)
            hoverable(card, currentTheme.Tertiary, currentTheme.Hover)
            local api = {}
            function api.Set(v)
                on = v and true or false
                TweenService:Create(track, TweenInfo.new(0.2), { BackgroundColor3 = on and currentTheme.Accent or currentTheme.Secondary }):Play()
                TweenService:Create(knob, TweenInfo.new(0.2, Enum.EasingStyle.Back), { Position = on and UDim2.new(1, -17, 0.5, -7) or UDim2.new(0, 3, 0.5, -7) }):Play()
            end
            card.MouseButton1Click:Connect(function()
                local want = not on
                api.Set(want)
                if onChange(want) == false then api.Set(not want) end
            end)
            return card, api
        end

        local function sChip(parent, text, selected, onClick)
            local b = CreateTextButton(parent, nil, UDim2.new(1, 0, 1, 0), nil, 904)
            b.Text = text
            b.Font = currentFont
            b.TextSize = 12
            b.TextColor3 = selected and Color3.new(1, 1, 1) or currentTheme.Text
            b.BackgroundColor3 = selected and currentTheme.Accent or currentTheme.Tertiary
            CreateCorner(b, 7)
            if not selected then NewStroke(b, currentTheme.Border, 1, 0.6) end
            hoverable(b, selected and currentTheme.Accent or currentTheme.Tertiary, selected and currentTheme.Accent or currentTheme.Hover)
            b.MouseButton1Click:Connect(onClick)
            return b
        end

        local function sThemeCard(parent, label, palette, selected, onClick)
            local card = CreateTextButton(parent, nil, UDim2.new(1, 0, 0, 52), nil, 904)
            card.BackgroundColor3 = currentTheme.Tertiary
            CreateCorner(card, 8)
            NewStroke(card, selected and currentTheme.Accent or currentTheme.Border, selected and 1.5 or 1, selected and 0 or 0.55)
            local sw = CreateFrame(card, nil, palette.Main, 0, UDim2.new(1, -16, 0, 20), UDim2.new(0, 8, 0, 7), 905)
            CreateCorner(sw, 5)
            NewStroke(sw, currentTheme.Border, 1, 0.5)
            local function dot(color, x)
                local d = CreateFrame(sw, nil, color, 0, UDim2.new(0, 10, 0, 10), UDim2.new(0, x, 0.5, -5), 906)
                CreateCorner(d, 5)
            end
            dot(palette.Accent, 6)
            dot(palette.AccentGradient, 20)
            dot(palette.Secondary, 34)
            local nm = CreateLabel(card, nil, label, currentTheme.Text, 11, currentFont, UDim2.new(1, -34, 0, 16), UDim2.new(0, 8, 0, 31), 905)
            nm.TextTruncate = Enum.TextTruncate.AtEnd
            if selected then
                CreateIcon(card, "lucide-check-circle", 14, currentTheme.Accent, UDim2.new(1, -22, 0, 31), 906)
            end
            hoverable(card, currentTheme.Tertiary, currentTheme.Hover)
            card.MouseButton1Click:Connect(onClick)
            return card
        end

        local function paletteFrom(color)
            return {
                Main = color,
                Secondary = color:Lerp(Color3.new(0, 0, 0), 0.2),
                Accent = color:Lerp(Color3.new(1, 1, 1), 0.4),
                AccentGradient = color:Lerp(Color3.new(0, 0, 0), 0.45),
            }
        end

        local function notify(title, desc, kind)
            DiscordLib:Notification({ title = title, desc = desc, time = 2, type = kind or "Success" })
        end

        local function BuildThemesTab()
            sHeader("PREDEFINED THEMES")
            local g1 = sGrid(UDim2.new(0.333, -4, 0, 52))
            for _, tn in ipairs({ "Dark", "Light", "Amoled" }) do
                local th = Themes[tn]
                local sel = currentTheme.Main == th.Main and currentTheme.Accent == th.Accent
                sThemeCard(g1, tn, th, sel, function()
                    DiscordLib:SetTheme(tn)
                    notify("Theme", tn .. " applied")
                end)
            end

            sHeader("ADVANCED THEMES")
            local g2 = sGrid(UDim2.new(0.333, -4, 0, 52))
            local advNames = {}
            for k in pairs(AdvancedThemes) do table.insert(advNames, k) end
            table.sort(advNames)
            for _, tn in ipairs(advNames) do
                local th = AdvancedThemes[tn]
                local sel = currentTheme.Main == th.Main and currentTheme.Accent == th.Accent
                sThemeCard(g2, tn, th, sel, function()
                    DiscordLib:SetAdvancedTheme(th)
                    notify("Theme", tn .. " applied")
                end)
            end

            sHeader("CUSTOM COLOR")
            local g3 = sGrid(UDim2.new(0.333, -4, 0, 52))
            local colorList = {}
            for k in pairs(PredefinedColors) do table.insert(colorList, k) end
            table.sort(colorList)
            for _, cn in ipairs(colorList) do
                local c = PredefinedColors[cn]
                sThemeCard(g3, cn, paletteFrom(c), currentTheme.Main == c, function()
                    DiscordLib:SetTheme(c)
                    notify("Color", cn .. " applied")
                end)
            end
        end

        local function BuildConfigTab()
            sHeader("CONFIGURATION")
            sAction("lucide-file-text", "Check configuration", "See what is stored on disk", function()
                local data = DiscordLib:GetConfigInfo()
                local info
                if data then
                    info = "Theme: " .. tostring(data.themeName or "Custom") .. "\n" ..
                        "Font: " .. tostring(data.font or "None") .. "\n" ..
                        "Size: " .. tostring(data.windowSize and string.format("%.2fx", data.windowSize) or "None") .. "\n" ..
                        "Auto load: " .. (DiscordLib:GetAutoLoad() and "On" or "Off")
                else
                    info = "No configuration found."
                end
                DiscordLib:Dialog({ Title = "Current Configuration", Content = info, Icon = "lucide-file-text", Buttons = { { Text = "Close" } } })
            end)
            sAction("lucide-save", "Save configuration", "Store theme, font and window size", function()
                if DiscordLib:SaveConfig() then
                    notify("Config", "Configuration saved")
                else
                    notify("Config", "Could not save (executor does not support files)", "Error")
                end
            end)
            sAction("lucide-folder-open", "Load configuration", "Apply the saved configuration", function()
                if DiscordLib:LoadConfig() then
                    notify("Config", "Configuration loaded")
                else
                    notify("Config", "No configuration found", "Warning")
                end
            end)
            do
                local autoOn = DiscordLib:GetAutoLoad()
                sToggle("lucide-refresh-cw", "Auto load configuration", "Apply the saved config on startup", autoOn, function(want)
                    if want then
                        if not DiscordLib:GetConfigInfo() and not DiscordLib:SaveConfig() then
                            notify("Config", "Could not enable (executor does not support files)", "Error")
                            return false
                        end
                        if not DiscordLib:SetAutoLoad(true) then
                            notify("Config", "Could not enable (executor does not support files)", "Error")
                            return false
                        end
                        notify("Config", "Auto load enabled")
                    else
                        DiscordLib:SetAutoLoad(false)
                        notify("Config", "Auto load disabled", "Warning")
                    end
                    return true
                end)
            end
            sAction("lucide-trash-2", "Delete configuration", "This cannot be undone", function()
                DiscordLib:Dialog({
                    Title = "Delete Configuration",
                    Content = "Are you sure? This cannot be undone.",
                    Type = "Warning",
                    Buttons = {
                        { Text = "Cancel" },
                        { Text = "Delete", Style = "Danger", Callback = function()
                            DiscordLib:DeleteConfig()
                            notify("Config", "Configuration deleted")
                        end }
                    }
                })
            end, true)

            sHeader("WINDOW SIZE")
            if isMaximized then
                local amber = Color3.fromRGB(255, 186, 66)
                local notice = CreateFrame(SettingsContent, nil, currentTheme.Tertiary, 0, UDim2.new(1, 0, 0, 48), nil, 904)
                notice.LayoutOrder = nextOrder()
                CreateCorner(notice, 8)
                NewStroke(notice, amber, 1, 0.5)
                local tile = CreateFrame(notice, nil, amber, 0.8, UDim2.new(0, 28, 0, 28), UDim2.new(0, 9, 0.5, -14), 905)
                CreateCorner(tile, 7)
                CreateIcon(tile, "lucide-lock", 16, amber, UDim2.new(0.5, -8, 0.5, -8), 906)
                CreateLabel(notice, nil, "Fullscreen is active", currentTheme.Text, 13, currentFont, UDim2.new(1, -60, 0, 16), UDim2.new(0, 46, 0, 8), 905)
                CreateLabel(notice, nil, "Exit fullscreen to change the window size.", currentTheme.TextMuted, 11, currentFont, UDim2.new(1, -60, 0, 14), UDim2.new(0, 46, 0, 26), 905)
            else
                local g = sGrid(UDim2.new(0.2, -5, 0, 30))
                for _, v in ipairs({ 0.7, 0.8, 0.9, 1.0, 1.1, 1.2, 1.3, 1.4, 1.5 }) do
                    local sel = math.abs((currentWindowScaleX or 1) - v) < 0.05 and math.abs((currentWindowScaleY or 1) - v) < 0.05
                    sChip(g, string.format("%.1fx", v), sel, function()
                        if isMaximized then return end
                        DiscordLib:SetWindowSize(v)
                        notify("Window size", string.format("%.1fx applied", v))
                        task.delay(0.15, function() if SettingsOverlay.Visible then DiscordLib._refreshSettings() end end)
                    end)
                end
            end
        end

        local function BuildFontsTab()
            sHeader("FONTS")
            local g = sGrid(UDim2.new(0.5, -3, 0, 54))
            local fonts = { "Gotham", "GothamBold", "GothamSemibold", "GothamBlack", "Arial", "ArialBold",
                "SourceSans", "SourceSansBold", "SourceSansLight", "SourceSansItalic",
                "SciFi", "Fantasy", "Bodoni", "Highway", "Sarasa", "PermanentMarker",
                "Bangers", "Aldrich", "Arcade", "FredokaOne", "Cartoon" }
            for _, fn in ipairs(fonts) do
                local ok, fontEnum = pcall(function() return Enum.Font[fn] end)
                if ok and fontEnum then
                    local selected = currentFont == fontEnum
                    local card = CreateTextButton(g, nil, UDim2.new(1, 0, 0, 54), nil, 904)
                    card.BackgroundColor3 = currentTheme.Tertiary
                    CreateCorner(card, 8)
                    NewStroke(card, selected and currentTheme.Accent or currentTheme.Border, selected and 1.5 or 1, selected and 0 or 0.55)
                    local prev = CreateLabel(card, nil, "Aa", currentTheme.Text, 20, fontEnum, UDim2.new(0, 40, 1, 0), UDim2.new(0, 10, 0, 0), 905)
                    prev:SetAttribute("KeepFont", true)
                    local nm = CreateLabel(card, nil, fn, currentTheme.TextMuted, 11, fontEnum, UDim2.new(1, -78, 1, 0), UDim2.new(0, 54, 0, 0), 905)
                    nm:SetAttribute("KeepFont", true)
                    nm.TextTruncate = Enum.TextTruncate.AtEnd
                    if selected then
                        CreateIcon(card, "lucide-check-circle", 14, currentTheme.Accent, UDim2.new(1, -22, 0.5, -7), 906)
                    end
                    hoverable(card, currentTheme.Tertiary, currentTheme.Hover)
                    card.MouseButton1Click:Connect(function()
                        DiscordLib:SetFont(fn)
                        notify("Font", fn .. " applied")
                        task.delay(0.1, function() DiscordLib._refreshSettings() end)
                    end)
                end
            end
        end

        local function BuildEffectsTab()
            sHeader("BLUR")
            if not DiscordLib._blurInstance then
                DiscordLib._blurInstance = DiscordLib:CreateAcrylicBlur()
            end
            local blur = DiscordLib._blurInstance

            local card = CreateTextButton(SettingsContent, nil, UDim2.new(1, 0, 0, 46), nil, 904)
            card.BackgroundColor3 = currentTheme.Tertiary
            card.LayoutOrder = nextOrder()
            CreateCorner(card, 8)
            local tile = CreateFrame(card, nil, currentTheme.Accent, 0.8, UDim2.new(0, 28, 0, 28), UDim2.new(0, 9, 0.5, -14), 905)
            CreateCorner(tile, 7)
            CreateIcon(tile, "lucide-droplets", 16, currentTheme.Accent, UDim2.new(0.5, -8, 0.5, -8), 906)
            CreateLabel(card, nil, "Blur effect", currentTheme.Text, 13, currentFont, UDim2.new(1, -110, 0, 16), UDim2.new(0, 46, 0, 7), 905)
            CreateLabel(card, nil, "Acrylic blur behind the window", currentTheme.TextMuted, 11, currentFont, UDim2.new(1, -110, 0, 14), UDim2.new(0, 46, 0, 24), 905)
            local track = CreateFrame(card, nil, blur.IsEnabled() and currentTheme.Accent or currentTheme.Secondary, 0, UDim2.new(0, 38, 0, 20), UDim2.new(1, -50, 0.5, -10), 905)
            CreateCorner(track, 10)
            local knob = CreateFrame(track, nil, Color3.new(1, 1, 1), 0, UDim2.new(0, 14, 0, 14), blur.IsEnabled() and UDim2.new(1, -17, 0.5, -7) or UDim2.new(0, 3, 0.5, -7), 906)
            CreateCorner(knob, 7)
            hoverable(card, currentTheme.Tertiary, currentTheme.Hover)
            card.MouseButton1Click:Connect(function()
                blur.Toggle()
                local on = blur.IsEnabled()
                TweenService:Create(track, TweenInfo.new(0.2), { BackgroundColor3 = on and currentTheme.Accent or currentTheme.Secondary }):Play()
                TweenService:Create(knob, TweenInfo.new(0.2, Enum.EasingStyle.Back), { Position = on and UDim2.new(1, -17, 0.5, -7) or UDim2.new(0, 3, 0.5, -7) }):Play()
            end)

            sHeader("INTENSITY")
            local g = sGrid(UDim2.new(0.2, -5, 0, 30))
            for _, inten in ipairs({ 0, 25, 50, 75, 100 }) do
                local sel = math.abs(blur.GetIntensity() * 100 - inten) < 12.5
                sChip(g, inten .. "%", sel, function()
                    blur.SetIntensity(inten / 100)
                    notify("Blur", "Intensity: " .. inten .. "%")
                    task.delay(0.1, function() DiscordLib._refreshSettings() end)
                end)
            end
        end

        local tabBuilders = { Themes = BuildThemesTab, Config = BuildConfigTab, Fonts = BuildFontsTab, Effects = BuildEffectsTab }

        local function styleTab(name, selected)
            local t = tabButtons[name]
            if not t then return end
            t.Button.BackgroundColor3 = currentTheme.Accent
            t.Button.BackgroundTransparency = selected and 0 or 1
            t.Icon.ImageColor3 = selected and Color3.new(1, 1, 1) or currentTheme.TextMuted
            t.Label.TextColor3 = selected and Color3.new(1, 1, 1) or currentTheme.TextMuted
            t.Selected = selected
        end

        local function SwitchTab(name, keepScroll)
            currentTab = name
            local keep = keepScroll and SettingsContent.CanvasPosition or nil
            for n in pairs(tabButtons) do styleTab(n, n == name) end
            ClearContent()
            local ok, err = pcall(tabBuilders[name])
            if not ok then warn("[DiscordLib] settings tab error: " .. tostring(err)) end
            if keep then task.defer(function() SettingsContent.CanvasPosition = keep end) else SettingsContent.CanvasPosition = Vector2.new(0, 0) end
        end

        for i, def in ipairs({ { "Themes", "lucide-palette" }, { "Config", "lucide-sliders" }, { "Fonts", "lucide-type" }, { "Effects", "lucide-wand-2" } }) do
            local tb = CreateTextButton(Sidebar, nil, UDim2.new(1, 0, 0, 32), nil, 904)
            tb.LayoutOrder = i
            tb.BackgroundColor3 = currentTheme.Accent
            tb.BackgroundTransparency = 1
            CreateCorner(tb, 7)
            local ic = CreateIcon(tb, def[2], 16, currentTheme.TextMuted, UDim2.new(0, 10, 0.5, -8), 905)
            local lb = CreateLabel(tb, nil, def[1], currentTheme.TextMuted, 12, currentFont, UDim2.new(1, -36, 1, 0), UDim2.new(0, 34, 0, 0), 905)
            tabButtons[def[1]] = { Button = tb, Icon = ic, Label = lb, Selected = false }
            tb.MouseEnter:Connect(function()
                local t = tabButtons[def[1]]
                if not t.Selected then
                    TweenService:Create(tb, TweenInfo.new(0.15), { BackgroundColor3 = currentTheme.Hover, BackgroundTransparency = 0.4 }):Play()
                end
            end)
            tb.MouseLeave:Connect(function()
                local t = tabButtons[def[1]]
                if not t.Selected then
                    TweenService:Create(tb, TweenInfo.new(0.15), { BackgroundTransparency = 1 }):Play()
                end
            end)
            tb.MouseButton1Click:Connect(function() SwitchTab(def[1]) end)
        end

        local function OpenSettings()
            if SettingsPanelOpen then return end
            SettingsPanelOpen = true
            if SearchBarHolder.Visible then CloseSearchBar() end
            SettingsOverlay.Visible = true
            SettingsOverlay.BackgroundTransparency = 1
            SettingsPanel.Size = UDim2.new(0.84, 0, 0.8, 0)
            TweenService:Create(SettingsOverlay, TweenInfo.new(0.2), { BackgroundTransparency = 0.45 }):Play()
            TweenService:Create(SettingsPanel, TweenInfo.new(0.25, Enum.EasingStyle.Quad, Enum.EasingDirection.Out), { Size = UDim2.new(0.9, 0, 0.86, 0) }):Play()
            DiscordLib._applySettingsScale()
            SwitchTab(currentTab)
        end

        local function CloseSettings()
            if not SettingsPanelOpen then return end
            SettingsPanelOpen = false
            TweenService:Create(SettingsOverlay, TweenInfo.new(0.18), { BackgroundTransparency = 1 }):Play()
            TweenService:Create(SettingsPanel, TweenInfo.new(0.18, Enum.EasingStyle.Quad, Enum.EasingDirection.In), { Size = UDim2.new(0.84, 0, 0.8, 0) }):Play()
            task.delay(0.2, function()
                if not SettingsPanelOpen then SettingsOverlay.Visible = false end
            end)
        end

        DiscordLib._refreshSettings = function()
            if SettingsPanelOpen then SwitchTab(currentTab, true) end
        end
        DiscordLib._closeSettings = CloseSettings

        SClose.MouseButton1Click:Connect(CloseSettings)
        SettingsOverlay.MouseButton1Click:Connect(CloseSettings)
        SettingsBtnCtrl.MouseButton1Click:Connect(function()
            if SettingsPanelOpen then CloseSettings() else OpenSettings() end
        end)

        Track(UserInputService.InputBegan:Connect(function(input, gpe)
            if not MainFrame.Parent then return end
            if input.KeyCode == Enum.KeyCode.Escape then
                if SettingsPanelOpen then
                    CloseSettings()
                elseif SearchBarHolder.Visible then
                    CloseSearchBar()
                end
                return
            end
            if gpe or isMinimized then return end
            if input.KeyCode == Enum.KeyCode.F and (UserInputService:IsKeyDown(Enum.KeyCode.LeftControl) or UserInputService:IsKeyDown(Enum.KeyCode.RightControl)) then
                if SearchBarHolder.Visible then CloseSearchBar() else OpenSearchBar() end
            end
        end))

        table.insert(ThemeUpdateConnections, function()
            if not SettingsPanel.Parent then return end
            SettingsPanel.BackgroundColor3 = currentTheme.Main
            PanelStroke.Color = currentTheme.Border
            tileGrad.Color = ColorSequence.new({ ColorSequenceKeypoint.new(0, currentTheme.Accent), ColorSequenceKeypoint.new(1, currentTheme.AccentGradient) })
            HeaderTile.BackgroundColor3 = currentTheme.Accent
            STitle.TextColor3 = currentTheme.Text
            SSub.TextColor3 = currentTheme.TextMuted
            SCloseIcon.ImageColor3 = currentTheme.TextMuted
            Divider.BackgroundColor3 = currentTheme.Border
            Sidebar.BackgroundColor3 = currentTheme.Secondary
            SettingsContent.ScrollBarImageColor3 = currentTheme.Accent
            for n in pairs(tabButtons) do styleTab(n, n == currentTab) end
            if SettingsPanelOpen then
                task.defer(function() SwitchTab(currentTab, true) end)
            end
        end)

        for n in pairs(tabButtons) do styleTab(n, n == currentTab) end
    end

    local function CreateProtectedText(parent, text, color, size, font, pos, zindex)
        local TextService = game:GetService("TextService")
        local Holder = Instance.new("Frame")
        Holder.Name = EncriptyText(math.random(8,14))
        Holder.BackgroundTransparency = 1
        Holder.Visible = true
        Holder.BorderSizePixel = 0
        Holder.Size = UDim2.new(0, 350, 0, 28)
        Holder.Position = pos or UDim2.new(0.01, 0, 0, 0)
        Holder.ClipsDescendants = false
        Holder.ZIndex = zindex or 3
        Holder.Parent = parent
        local Offset = 0
        local Labels = {}
        for i = 1, #text do
            local Char = text:sub(i, i)
            local Label = Instance.new("TextLabel")
            Label.Name = EncriptyText(math.random(6,12))
            Label.BackgroundTransparency = 1
            Label.BorderSizePixel = 0
            Label.Font = font
            Label.TextSize = size
            Label.TextColor3 = color
            Label.TextTransparency = 0
            Label.TextXAlignment = Enum.TextXAlignment.Left
            Label.TextYAlignment = Enum.TextYAlignment.Center
            Label.RichText = false
            Label.ClipsDescendants = false
            Label.ZIndex = zindex or 3
            Label.Text = utf8.char(string.byte(Char))
            local Bounds = TextService:GetTextSize(Char, size, font, Vector2.new(math.huge, math.huge))
            local Width = math.max(Bounds.X + math.floor(size * 0.08), 4)
            if Char == " " then Width = math.max(Bounds.X, size * 0.28) end
            Label.Size = UDim2.new(0, Width, 1, 0)
            Label.Position = UDim2.new(0, Offset, 0, 0)
            Label.Parent = Holder
            table.insert(Labels, Label)
            Offset += Width
        end
        Holder.Size = UDim2.new(0, Offset + 4, 0, 28)
        local function UpdateTheme()
            for _, lbl in ipairs(Labels) do
                if lbl and lbl.Parent then
                    lbl.TextColor3 = currentTheme.TextMuted
                    lbl.Font = currentFont
                    lbl.TextSize = 14
                end
            end
        end
        table.insert(ThemeUpdateConnections, UpdateTheme)
        return Holder
    end
    
    local Title = CreateProtectedText(TopFrame, TitleSetHub, currentTheme.TextMuted, 14, currentFont, UDim2.new(0, 32, 0, 1), 3)
    
    UpdateProtectedTitle = function(newText)
        if not Title or not Title.Parent then return end
        for _, child in ipairs(Title:GetChildren()) do child:Destroy() end
        local TextService = game:GetService("TextService")
        local offset = 0
        for i = 1, #newText do
            local Char = newText:sub(i, i)
            local lbl = Instance.new("TextLabel")
            lbl.BackgroundTransparency = 1
            lbl.BorderSizePixel = 0
            lbl.Font = currentFont
            lbl.TextSize = 14
            lbl.TextColor3 = currentTheme.TextMuted
            lbl.TextTransparency = 0
            lbl.TextXAlignment = Enum.TextXAlignment.Left
            lbl.TextYAlignment = Enum.TextYAlignment.Center
            lbl.RichText = false
            lbl.ZIndex = 3
            lbl.Text = utf8.char(string.byte(Char))
            local Bounds = TextService:GetTextSize(Char, 14, currentFont, Vector2.new(math.huge, math.huge))
            local Width = math.max(Bounds.X + math.floor(14 * 0.08), 4)
            if Char == " " then Width = math.max(Bounds.X, 14 * 0.28) end
            lbl.Size = UDim2.new(0, Width, 1, 0)
            lbl.Position = UDim2.new(0, offset, 0, 0)
            lbl.Parent = Title
            offset = offset + Width
        end
        Title.Size = UDim2.new(0, offset + 4, 0, 28)
    end

    MakeDraggable(TopFrame, MainFrame)
    
    local ServersHoldFrame = CreateFrame(MainFrame, ENC.ServersHoldFrame, currentTheme.Secondary, 0.1, UDim2.new(0, 60, 1, -42), UDim2.new(0.01, 0, 0, 34), 2)
    CreateCorner(ServersHoldFrame, 8)
    local ServersHold = Instance.new("ScrollingFrame")
    ServersHold.Name = ENC.ServersHold; ServersHold.Parent = ServersHoldFrame; ServersHold.Active = true
    ServersHold.BackgroundTransparency = 1; ServersHold.BorderSizePixel = 0
    ServersHold.Position = UDim2.new(0, 5, 0, 5); ServersHold.Size = UDim2.new(0, 50, 1, -10)
    ServersHold.CanvasSize = UDim2.new(0, 0, 0, 0); ServersHold.AutomaticCanvasSize = Enum.AutomaticSize.Y; ServersHold.ScrollBarThickness = 0; ServersHold.ZIndex = 3
    local ServersHoldLayout = Instance.new("UIListLayout")
    ServersHoldLayout.Name = ENC.ServersHoldLayout; ServersHoldLayout.Parent = ServersHold
    ServersHoldLayout.HorizontalAlignment = Enum.HorizontalAlignment.Center
    ServersHoldLayout.SortOrder = Enum.SortOrder.LayoutOrder; ServersHoldLayout.Padding = UDim.new(0, 3)
    local ServersHoldPadding = Instance.new("UIPadding")
    ServersHoldPadding.Name = ENC.ServersHoldPadding; ServersHoldPadding.Parent = ServersHold; ServersHoldPadding.PaddingTop = UDim.new(0, 5)
    
    local ChannelsHoldFrame = CreateFrame(MainFrame, ENC.ChannelsHoldFrame, currentTheme.Secondary, 0.1, UDim2.new(0, 130, 1, -42), UDim2.new(0.12, 0, 0, 34), 2)
    CreateCorner(ChannelsHoldFrame, 8)
    local ChannelsHold = Instance.new("ScrollingFrame")
    ChannelsHold.Name = ENC.ChannelsHold; ChannelsHold.Parent = ChannelsHoldFrame; ChannelsHold.Active = true
    ChannelsHold.BackgroundTransparency = 1; ChannelsHold.BorderSizePixel = 0
    ChannelsHold.Position = UDim2.new(0, 5, 0, 5); ChannelsHold.Size = UDim2.new(0, 120, 1, -10)
    ChannelsHold.CanvasSize = UDim2.new(0, 0, 0, 0); ChannelsHold.AutomaticCanvasSize = Enum.AutomaticSize.Y; ChannelsHold.ScrollBarThickness = 4; ChannelsHold.ZIndex = 3
    local ChannelsHoldLayout = Instance.new("UIListLayout")
    ChannelsHoldLayout.Name = ENC.ChannelsHoldLayout; ChannelsHoldLayout.Parent = ChannelsHold
    ChannelsHoldLayout.HorizontalAlignment = Enum.HorizontalAlignment.Left
    ChannelsHoldLayout.SortOrder = Enum.SortOrder.LayoutOrder; ChannelsHoldLayout.Padding = UDim.new(0, 2)
    
    local Servers = {}
    local function registerThemeUpdate(updateFunc) table.insert(ThemeUpdateConnections, updateFunc) end
    
    registerThemeUpdate(function()
        MainFrame.BackgroundColor3 = currentTheme.Main
        TopFrame.BackgroundColor3 = currentTheme.Main
        Title.TextColor3 = currentTheme.TextMuted
        mainShadow.ImageColor3 = currentTheme.Shadow
    end)
    registerThemeUpdate(function()
        ServersHoldFrame.BackgroundColor3 = currentTheme.Secondary
        ChannelsHoldFrame.BackgroundColor3 = currentTheme.Secondary
    end)

    local function ServerKeyOf(s, c) return tostring(s) .. ":" .. tostring(c) end

    local SectionCover = CreateFrame(MainFrame, XorEncode("SectionCover"), currentTheme.Secondary, 1, UDim2.new(0.63, 0, 1, -42), UDim2.new(0.35, 0, 0, 34), 800)
    SectionCover.Visible = false
    SectionCover.Active = false
    CreateCorner(SectionCover, 8)
    registerThemeUpdate(function() SectionCover.BackgroundColor3 = currentTheme.Secondary end)

    local BuildCover = CreateFrame(MainFrame, XorEncode("BuildCover"), currentTheme.Main, 0, UDim2.new(1, 0, 1, 0), UDim2.new(0, 0, 0, 0), 950)
    BuildCover.Active = true
    CreateCorner(BuildCover, 10)
    registerThemeUpdate(function()
        if BuildCover and BuildCover.Parent then BuildCover.BackgroundColor3 = currentTheme.Main end
    end)

    local function paintServer(data, selected, animate)
        local btn = data and data.Button
        if not btn or not btn.Parent then return end
        data.Selected = selected
        local info = TweenInfo.new(animate and 0.25 or 0, Enum.EasingStyle.Quad, Enum.EasingDirection.Out)
        TweenService:Create(btn, info, { BackgroundTransparency = selected and 0 or 0.5 }):Play()
        local ring = btn:FindFirstChild(ENC.ServerSelectionBg)
        if ring then TweenService:Create(ring, info, { Transparency = selected and 0 or 1 }):Play() end
        local ic = btn:FindFirstChild(ENC.ServerIcon)
        if ic then
            local bd = ic:FindFirstChild(ENC.ServerIconBorder)
            if bd then TweenService:Create(bd, info, { Transparency = selected and 0.2 or 0.7 }):Play() end
        end
    end

    local function stopChannelTweens(cd)
        if cd.tweens then
            for _, tw in ipairs(cd.tweens) do pcall(function() tw:Cancel() end) end
            table.clear(cd.tweens)
        else
            cd.tweens = {}
        end
        if cd.hoverTweens then
            for _, tw in ipairs(cd.hoverTweens) do pcall(function() tw:Cancel() end) end
            table.clear(cd.hoverTweens)
        end
    end

    local function chTween(cd, obj, dur, props, style, dir, delay)
        if not obj or not obj.Parent then return end
        if not dur or dur <= 0 then
            for k, v in pairs(props) do pcall(function() obj[k] = v end) end
            return
        end
        local tw = TweenService:Create(obj, TweenInfo.new(dur, style or Enum.EasingStyle.Quint, dir or Enum.EasingDirection.Out, 0, false, delay or 0), props)
        table.insert(cd.tweens, tw)
        tw:Play()
    end

    local function nudgeX(pos, dx)
        return UDim2.new(pos.X.Scale, pos.X.Offset + dx, pos.Y.Scale, pos.Y.Offset)
    end

    local function paintChannel(cd, selected, animate, revealDelay)
        local btn = cd and cd.Button
        if not btn or not btn.Parent then return end
        if animate and not revealDelay and cd.painted and cd.isSelected == selected then return end
        cd.painted = true
        cd.isSelected = selected
        cd.paintToken = (cd.paintToken or 0) + 1
        local token = cd.paintToken
        stopChannelTweens(cd)

        local dur = animate and 0.3 or 0
        local d = 0
        local sbg = btn:FindFirstChild(ENC.ChannelSelectionBg)
        local pill = btn:FindFirstChild(ENC.ChannelIndicator)
        local icon, label = cd.Icon, cd.Label
        local iconBase, labelBase = cd.IconPos, cd.LabelPos
        local pillH = math.max(6, math.floor(btn.Size.Y.Offset * 0.58))
        local white = Color3.new(1, 1, 1)
        local shift = selected and 3 or 0
        local hoverNow = cd.hovered and not selected
        local restBg = hoverNow and currentTheme.Hover or currentTheme.Tertiary
        local restTr = hoverNow and 0.4 or 0.7

        if revealDelay then
            dur = 0.34
            d = revealDelay
            btn.BackgroundTransparency = 1
            if icon and iconBase then icon.ImageTransparency = 1; icon.Position = nudgeX(iconBase, -10) end
            if label and labelBase then label.TextTransparency = 1; label.Position = nudgeX(labelBase, -10) end
            if sbg then sbg.Size = UDim2.new(0, 0, 1, 0); sbg.BackgroundTransparency = 1 end
            if pill then pill.Size = UDim2.new(0, 3, 0, 0) end
        end

        chTween(cd, btn, dur, { BackgroundColor3 = restBg, BackgroundTransparency = restTr }, Enum.EasingStyle.Quad, Enum.EasingDirection.Out, d)

        if sbg then
            if selected then
                sbg.Visible = true
                if dur <= 0 then
                    sbg.Size = UDim2.new(1, 0, 1, 0)
                    sbg.BackgroundTransparency = 0
                else
                    if sbg.BackgroundTransparency > 0.99 or sbg.Size.X.Scale < 0.01 then
                        sbg.Size = UDim2.new(0, 0, 1, 0)
                        sbg.BackgroundTransparency = 0
                    end
                    chTween(cd, sbg, dur, { Size = UDim2.new(1, 0, 1, 0), BackgroundTransparency = 0 }, Enum.EasingStyle.Quint, Enum.EasingDirection.Out, d + (revealDelay and 0.06 or 0))
                end
            else
                chTween(cd, sbg, math.min(dur, 0.2), { BackgroundTransparency = 1 }, Enum.EasingStyle.Quad, Enum.EasingDirection.In, 0)
                task.delay(dur > 0 and 0.22 or 0, function()
                    if cd.paintToken == token and sbg.Parent then sbg.Size = UDim2.new(0, 0, 1, 0) end
                end)
            end
        end

        if pill then
            if selected then
                pill.Visible = true
                chTween(cd, pill, dur, { Size = UDim2.new(0, 3, 0, pillH) }, Enum.EasingStyle.Back, Enum.EasingDirection.Out, d + (revealDelay and 0.1 or 0.05))
            else
                chTween(cd, pill, math.min(dur, 0.2), { Size = UDim2.new(0, 3, 0, 0) }, Enum.EasingStyle.Quad, Enum.EasingDirection.In, 0)
                task.delay(dur > 0 and 0.22 or 0, function()
                    if cd.paintToken == token and pill.Parent then pill.Visible = false end
                end)
            end
        end

        if icon then
            local props = { ImageColor3 = selected and white or currentTheme.TextMuted, ImageTransparency = 0 }
            if iconBase then props.Position = nudgeX(iconBase, shift) end
            chTween(cd, icon, dur, props, Enum.EasingStyle.Quint, Enum.EasingDirection.Out, d)
        end
        if label then
            local props = { TextColor3 = selected and white or currentTheme.Text, TextTransparency = 0 }
            if labelBase then props.Position = nudgeX(labelBase, shift) end
            chTween(cd, label, dur, props, Enum.EasingStyle.Quint, Enum.EasingDirection.Out, d)
        end
    end


    local function showOnlySection(activeKey)
        for key, frame in pairs(Sections) do
            if frame and frame.Parent then
                frame.Visible = (key == activeKey)
            end
        end
    end

    local sectionToken = 0
    local function transitionSection(activeKey, animate, dir)
        sectionToken = sectionToken + 1
        local token = sectionToken
        local slide = (dir and dir < 0) and -14 or 14
        local target = activeKey and Sections[activeKey] or nil
        if target and not target.Parent then target = nil end

        local othersVisible = false
        for _, frame in pairs(Sections) do
            if frame and frame.Parent and frame.Visible and frame ~= target then
                othersVisible = true
                break
            end
        end

        if not animate or isMinimized or not target then
            showOnlySection(activeKey)
            SectionCover.Visible = false
            return
        end

        if target.Visible and not othersVisible then
            if SectionCover.Visible then
                TweenService:Create(SectionCover, TweenInfo.new(0.12, Enum.EasingStyle.Quad, Enum.EasingDirection.Out), { BackgroundTransparency = 1 }):Play()
                task.delay(0.13, function()
                    if token == sectionToken then SectionCover.Visible = false end
                end)
            end
            return
        end

        SectionCover.Visible = true
        local outTime = 0
        if othersVisible then
            outTime = 0.12
            TweenService:Create(SectionCover, TweenInfo.new(outTime, Enum.EasingStyle.Quad, Enum.EasingDirection.In), { BackgroundTransparency = 0 }):Play()
        else
            SectionCover.BackgroundTransparency = 0
        end

        task.delay(outTime, function()
            if token ~= sectionToken then return end
            if not target.Parent then SectionCover.Visible = false return end
            showOnlySection(activeKey)
            local basePos = UDim2.new(0.35, 0, 0, 34)
            target.Position = UDim2.new(0.35, 0, 0, 34 + slide)
            TweenService:Create(target, TweenInfo.new(0.3, Enum.EasingStyle.Quint, Enum.EasingDirection.Out), { Position = basePos }):Play()
            TweenService:Create(SectionCover, TweenInfo.new(0.28, Enum.EasingStyle.Quad, Enum.EasingDirection.Out), { BackgroundTransparency = 1 }):Play()
            task.delay(0.3, function()
                if token == sectionToken then SectionCover.Visible = false end
            end)
        end)
    end

    local function RefreshSelection(animate, prevServer, prevChannel)
        local activeKey = nil
        if currentServer ~= nil and currentServer ~= "" and currentChannel ~= nil and currentChannel ~= "" then
            activeKey = ServerKeyOf(currentServer, currentChannel)
        end
        local serverChanged = animate and prevServer ~= currentServer
        for name, data in pairs(ServerButtons) do
            paintServer(data, name == currentServer, animate)
        end
        for sName, chs in pairs(ServerChannels) do
            local show = (sName == currentServer)
            local index = 0
            for _, cName in ipairs(chs._order or {}) do
                local cd = chs[cName]
                if type(cd) == "table" and cd.Button then
                    local selected = show and cName == currentChannel
                    if show and serverChanged then
                        cd.Button.Visible = true
                        paintChannel(cd, selected, false, math.min(index * 0.04, 0.3))
                        index = index + 1
                    else
                        cd.Button.Visible = show
                        paintChannel(cd, selected, animate and show)
                    end
                end
            end
        end
        local dir = 1
        if animate and prevServer == currentServer and prevChannel and prevChannel ~= "" then
            local pi, ni
            local chs = ServerChannels[currentServer]
            for i, n in ipairs(chs and chs._order or {}) do
                if n == prevChannel then pi = i end
                if n == currentChannel then ni = i end
            end
            if pi and ni and ni < pi then dir = -1 end
        end
        transitionSection(activeKey, animate, dir)
    end

    local buildPhase = true
    local finalizeToken = 0
    local function RunFinalize()
        if not MainFrame.Parent then return end
        pcall(RecalculateWindowScale)
        if buildPhase then
            buildPhase = false
            pcall(RefreshSelection, false)
            if BuildCover and BuildCover.Parent then
                local cover = BuildCover
                TweenService:Create(cover, TweenInfo.new(0.3, Enum.EasingStyle.Quad, Enum.EasingDirection.Out), { BackgroundTransparency = 1 }):Play()
                task.delay(0.32, function() if cover.Parent then cover:Destroy() end end)
            end
        end
    end
    local function ScheduleFinalize(delay)
        finalizeToken = finalizeToken + 1
        local mine = finalizeToken
        task.delay(delay or 0.12, function()
            if mine ~= finalizeToken then return end
            RunFinalize()
        end)
    end

    function DiscordLib:SelectServer(Name)
        if not Name or not ServerButtons[Name] then return end
        local chs = ServerChannels[Name] or {}
        local target = chs._savedChannel
        if not (target and type(chs[target]) == "table") then
            target = chs._order and chs._order[1] or nil
        end
        local prevServer, prevChannel = currentServer, currentChannel
        currentServer = Name
        currentChannel = target or ""
        if target then chs._savedChannel = target end
        ChannelsHold.CanvasPosition = Vector2.new(0, 0)
        if DiscordLib._closeSearch then DiscordLib._closeSearch() end
        RefreshSelection(true, prevServer, prevChannel)
    end

    function DiscordLib:SelectChannel(serverName, channelName)
        if not (serverName and channelName and ServerChannels[serverName] and type(ServerChannels[serverName][channelName]) == "table") then return end
        ServerChannels[serverName]._savedChannel = channelName
        if currentServer == serverName and currentChannel == channelName then return end
        local prevServer, prevChannel = currentServer, currentChannel
        currentServer = serverName
        currentChannel = channelName
        if DiscordLib._closeSearch then DiscordLib._closeSearch() end
        RefreshSelection(true, prevServer, prevChannel)
    end


    function Servers:Server(Name, Image)
        if ServerButtons[Name] then
            return ServerButtons[Name].Button
        end
        ServerChannels[Name] = ServerChannels[Name] or {}
        ServerChannels[Name]._order = ServerChannels[Name]._order or {}
        local ratio = currentWindowSize or 1
        local serverSize = math.floor(40 * ratio)
        local count = 0
        for _ in pairs(ServerButtons) do count = count + 1 end

        local ServerBtn = CreateTextButton(ServersHold, XorEncode(Name), UDim2.new(0, serverSize, 0, serverSize), nil, 4)
        ServerBtn.BackgroundTransparency = 0.5
        ServerBtn.Text = ""
        ServerBtn.LayoutOrder = count + 1
        CreateCorner(ServerBtn, math.floor(20 * ratio))

        local Ring = Instance.new("UIStroke")
        Ring.Name = ENC.ServerSelectionBg
        Ring.Color = Color3.new(1, 1, 1)
        Ring.Thickness = 2
        Ring.Transparency = 1
        Ring.ApplyStrokeMode = Enum.ApplyStrokeMode.Border
        Ring.Parent = ServerBtn
        local RingGradient = NewGradient(Ring, currentTheme.Accent, currentTheme.AccentGradient, 45)

        local ServerIcon = Instance.new("ImageLabel")
        ServerIcon.Name = ENC.ServerIcon
        ServerIcon.Parent = ServerBtn
        ServerIcon.BackgroundTransparency = 1
        ServerIcon.Size = UDim2.new(0, serverSize - 4, 0, serverSize - 4)
        ServerIcon.Position = UDim2.new(0, 2, 0, 2)
        ServerIcon.ZIndex = 5
        CreateCorner(ServerIcon, math.floor(18 * ratio))

        local glyph = nil
        local img = (Image ~= nil and Image ~= "") and Image or "lucide-server"
        if IsGlyphName(img) then
            glyph = CreateIcon(ServerIcon, img, 10, currentTheme.Text, UDim2.new(0.5, 0, 0.5, 0), 6)
            glyph.AnchorPoint = Vector2.new(0.5, 0.5)
            glyph.Size = UDim2.new(0.55, 0, 0.55, 0)
            if glyph.Image == "" then glyph.Image = ResolveIcon("lucide-server") or "" end
        else
            ServerIcon.Image = ResolveIcon(img) or tostring(img)
            ServerIcon.ScaleType = Enum.ScaleType.Crop
        end

        local ServerIconBorder = Instance.new("UIStroke")
        ServerIconBorder.Name = ENC.ServerIconBorder
        ServerIconBorder.Parent = ServerIcon
        ServerIconBorder.Color = currentTheme.ServerBorder
        ServerIconBorder.Transparency = 0.7
        ServerIconBorder.Thickness = 1.5
        ServerIconBorder.ApplyStrokeMode = Enum.ApplyStrokeMode.Border

        local data = { Button = ServerBtn, Selected = false }
        ServerButtons[Name] = data

        registerThemeUpdate(function()
            if not ServerBtn.Parent then return end
            ServerBtn.BackgroundColor3 = currentTheme.Tertiary
            RingGradient.Color = ColorSequence.new({ ColorSequenceKeypoint.new(0, currentTheme.Accent), ColorSequenceKeypoint.new(1, currentTheme.AccentGradient) })
            ServerIconBorder.Color = currentTheme.ServerBorder
            if glyph then glyph.ImageColor3 = currentTheme.Text end
        end)

        ServerBtn.MouseButton1Click:Connect(function()
            if minimizeAnimating then return end
            DiscordLib:SelectServer(Name)
        end)
        ServerBtn.MouseEnter:Connect(function()
            if not data.Selected then TweenService:Create(ServerBtn, TweenInfo.new(0.15), { BackgroundTransparency = 0.3 }):Play() end
        end)
        ServerBtn.MouseLeave:Connect(function()
            if not data.Selected then TweenService:Create(ServerBtn, TweenInfo.new(0.15), { BackgroundTransparency = 0.5 }):Play() end
        end)

        if currentServer == nil or currentServer == "" then
            DiscordLib:SelectServer(Name)
        end
        ScheduleFinalize()
        return ServerBtn
    end

    function Servers:Channel(serverName, channelName, iconName)
        if not serverName or not channelName then return {} end
        ServerChannels[serverName] = ServerChannels[serverName] or {}
        local chs = ServerChannels[serverName]
        chs._order = chs._order or {}
        if type(chs[channelName]) == "table" and chs[channelName].SectionAPI then
            return chs[channelName].SectionAPI
        end

        local ratio = currentWindowSize or 1
        local cw = math.floor(110 * ratio)
        local chh = math.floor(24 * ratio)
        local ChannelBtn = CreateTextButton(ChannelsHold, XorEncode(channelName), UDim2.new(0, cw, 0, chh), nil, 4)
        ChannelBtn.BackgroundColor3 = currentTheme.Tertiary
        ChannelBtn.BackgroundTransparency = 0.7
        ChannelBtn.Visible = (currentServer == serverName)
        ChannelBtn.Text = ""
        ChannelBtn.LayoutOrder = #chs._order + 1
        CreateCorner(ChannelBtn, math.floor(6 * ratio))

        local ChannelSelectionBg = CreateFrame(ChannelBtn, ENC.ChannelSelectionBg, currentTheme.Accent, 1, UDim2.new(0, 0, 1, 0), nil, 5)
        CreateCorner(ChannelSelectionBg, math.floor(6 * ratio))
        local ChannelSelectionGradient = NewGradient(ChannelSelectionBg, currentTheme.Accent, currentTheme.AccentGradient, 0)
        local ChannelIndicator = CreateFrame(ChannelBtn, ENC.ChannelIndicator, Color3.new(1, 1, 1), 0, UDim2.new(0, 3, 0, 0), UDim2.new(0, 4, 0.5, 0), 7)
        ChannelIndicator.AnchorPoint = Vector2.new(0, 0.5)
        ChannelIndicator.Visible = false
        CreateCorner(ChannelIndicator, 2)

        local iconPx = math.floor(14 * ratio)
        local ChannelIcon = CreateIcon(ChannelBtn, iconName or "lucide-hash", iconPx, currentTheme.TextMuted, UDim2.new(0, 10, 0.5, 0), 8)
        ChannelIcon.Name = ENC.ChannelIcon
        ChannelIcon.AnchorPoint = Vector2.new(0, 0.5)
        if ChannelIcon.Image == "" then ChannelIcon.Image = ResolveIcon("lucide-hash") or "" end
        local ChannelLabel = CreateLabel(ChannelBtn, ENC.ChannelLabel, channelName, currentTheme.Text, math.floor(12 * ratio), currentFont, UDim2.new(0, cw - 36, 0, chh), UDim2.new(0, 30, 0, 0), 8)
        ChannelLabel.TextTruncate = Enum.TextTruncate.AtEnd

        local channelObj = {
            Button = ChannelBtn,
            Icon = ChannelIcon,
            Label = ChannelLabel,
            IconPos = ChannelIcon.Position,
            LabelPos = ChannelLabel.Position,
            isSelected = false,
        }
        chs[channelName] = channelObj
        table.insert(chs._order, channelName)

        table.insert(ThemeUpdateConnections, function()
            if not ChannelBtn.Parent then return end
            ChannelSelectionGradient.Color = ColorSequence.new({ ColorSequenceKeypoint.new(0, currentTheme.Accent), ColorSequenceKeypoint.new(1, currentTheme.AccentGradient) })
            ChannelSelectionBg.BackgroundColor3 = currentTheme.Accent
            paintChannel(channelObj, channelObj.isSelected, false)
        end)

        ChannelBtn.MouseButton1Click:Connect(function()
            if minimizeAnimating then return end
            if currentServer == serverName and currentChannel == channelName then return end
            DiscordLib:SelectChannel(serverName, channelName)
        end)
        local function hoverChannel(on)
            channelObj.hovered = on
            if channelObj.isSelected then return end
            channelObj.hoverTweens = channelObj.hoverTweens or {}
            for _, tw in ipairs(channelObj.hoverTweens) do pcall(function() tw:Cancel() end) end
            table.clear(channelObj.hoverTweens)
            local info = TweenInfo.new(0.18, Enum.EasingStyle.Quad, Enum.EasingDirection.Out)
            local t1 = TweenService:Create(ChannelBtn, info, {
                BackgroundColor3 = on and currentTheme.Hover or currentTheme.Tertiary,
                BackgroundTransparency = on and 0.4 or 0.7
            })
            local t2 = TweenService:Create(ChannelIcon, info, { ImageColor3 = on and currentTheme.Text or currentTheme.TextMuted })
            table.insert(channelObj.hoverTweens, t1)
            table.insert(channelObj.hoverTweens, t2)
            t1:Play(); t2:Play()
        end
        ChannelBtn.MouseEnter:Connect(function() hoverChannel(true) end)
        ChannelBtn.MouseLeave:Connect(function() hoverChannel(false) end)

    local SectionFrame = Instance.new("ScrollingFrame")
    local SectionLayout = Instance.new("UIListLayout")
    local SectionPadding = Instance.new("UIPadding")
    local fullName = serverName .. ":" .. channelName
    SectionFrame.Name = XorEncode(fullName)
    SectionFrame.Parent = MainFrame
    SectionFrame.BackgroundColor3 = currentTheme.Secondary
    SectionFrame.BackgroundTransparency = currentTransparency > 0 and currentTransparency or 0.1
    SectionFrame.BorderSizePixel = 0
    SectionFrame.Position = UDim2.new(0.35, 0, 0, 34)
    SectionFrame.Size = UDim2.new(0.63, 0, 1, -42)
    SectionFrame.CanvasSize = UDim2.new(0, 0, 0, 0)
    SectionFrame.AutomaticCanvasSize = Enum.AutomaticSize.Y
    SectionFrame.ScrollBarThickness = 4
    SectionFrame.Visible = false
    SectionFrame.ZIndex = 5
    CreateCorner(SectionFrame, 8)
    local TitleHolder = Instance.new("Frame")
    TitleHolder.Name = EncriptyText(math.random(6, 10))
    TitleHolder.BackgroundTransparency = 1
    TitleHolder.BorderSizePixel = 0
    TitleHolder.Size = UDim2.new(1, -12, 0, 26)
    TitleHolder.ZIndex = 6
    TitleHolder:SetAttribute("NoFilter", true)
    TitleHolder.Parent = SectionFrame
    local TitleIcon = CreateIcon(TitleHolder, iconName or "lucide-hash", 16, currentTheme.TextMuted, UDim2.new(0, 4, 0.5, -8), 7)
    if TitleIcon.Image == "" then TitleIcon.Image = ResolveIcon("lucide-hash") or "" end
    local SectionTitle = CreateLabel(TitleHolder, ENC.SectionTitle, "", currentTheme.Text, 16, currentFont, UDim2.new(1, -28, 1, 0), UDim2.new(0, 28, 0, 0), 7)
    SectionTitle.RichText = true
    SectionTitle.Text = string.format('%s  <font transparency="0.55">%s</font>', EscapeRich(channelName), EscapeRich(serverName))
    SectionTitle.TextTruncate = Enum.TextTruncate.AtEnd
    table.insert(ThemeUpdateConnections, function() TitleIcon.ImageColor3 = currentTheme.TextMuted end)
    SectionLayout.Name = ENC.SectionLayout
    SectionLayout.Parent = SectionFrame
    SectionLayout.HorizontalAlignment = Enum.HorizontalAlignment.Left
    SectionLayout.SortOrder = Enum.SortOrder.LayoutOrder
    SectionLayout.Padding = UDim.new(0, 3)
    SectionPadding.Name = ENC.SectionPadding
    SectionPadding.Parent = SectionFrame
    SectionPadding.PaddingLeft = UDim.new(0, 6)
    SectionPadding.PaddingTop = UDim.new(0, 6)
    SectionPadding.PaddingBottom = UDim.new(0, 12)
    Sections[fullName] = SectionFrame
    table.insert(ThemeUpdateConnections, function()
        SectionFrame.BackgroundColor3 = currentTheme.Secondary
        SectionTitle.TextColor3 = currentTheme.Text
    end)
local function GetSectionContentWidth()
    if not SectionFrame or not SectionFrame.Parent then return 370 end
    local pad = SectionFrame:FindFirstChild(ENC.SectionPadding)
    local padLeft = pad and pad.PaddingLeft.Offset or 0
    local totalW = SectionFrame.AbsoluteSize.X
    if totalW <= 0 then return 370 end
    return math.max(totalW - padLeft - 10, 100)
end
    local Section = {}
    function Section:Label(text)
        local Label = CreateLabel(SectionFrame, ENC_PREFIX.Label_ .. XorEncode(text), text, currentTheme.Text, 11, currentFont, UDim2.new(0, 370, 0, 18), UDim2.new(0, 10, 0, 5), 6)
        Label.TextWrapped = true; Label.RichText = true; Label.LineHeight = 1.2; Label.AutomaticSize = Enum.AutomaticSize.Y
        Label:GetPropertyChangedSignal("AbsoluteSize"):Connect(function() SectionFrame.CanvasSize = UDim2.new(0, 0, 0, SectionLayout.AbsoluteContentSize.Y + 35) end)
        SectionFrame.CanvasSize = UDim2.new(0, 0, 0, SectionLayout.AbsoluteContentSize.Y + 35)
        registerThemeUpdate(function() Label.TextColor3 = currentTheme.Text end)
        return Label
    end
function Section:Paragraph(title, content)
    local ParagraphFrame = CreateFrame(SectionFrame, ENC_PREFIX.Paragraph_ .. XorEncode(title), currentTheme.Tertiary, 0, UDim2.new(1, -14, 0, 50), nil, 6)
    CreateCorner(ParagraphFrame, 6)
    local TitleLabel = CreateLabel(ParagraphFrame, ENC.ParagraphTitle, tostring(title or ""), currentTheme.Text, 14, currentFont, UDim2.new(1, -20, 0, 0), UDim2.new(0, 10, 0, 8), 7)
    TitleLabel.TextWrapped = true
    TitleLabel.RichText = false
    TitleLabel.AutomaticSize = Enum.AutomaticSize.Y
    TitleLabel.TextYAlignment = Enum.TextYAlignment.Top
    local ContentLabel = CreateLabel(ParagraphFrame, ENC.ParagraphContent, tostring(content or ""), currentTheme.TextMuted, 12, currentFont, UDim2.new(1, -20, 0, 0), UDim2.new(0, 10, 0, 8), 7)
    ContentLabel.TextWrapped = true
    ContentLabel.RichText = false
    ContentLabel.AutomaticSize = Enum.AutomaticSize.Y
    ContentLabel.TextYAlignment = Enum.TextYAlignment.Top
    local function updateParagraphSize()
        if not ParagraphFrame or not ParagraphFrame.Parent then return end
        local fw = ParagraphFrame.AbsoluteSize.X
        if fw <= 0 then fw = 370 end
        TitleLabel.Size = UDim2.new(0, fw - 20, 0, 0)
        ContentLabel.Size = UDim2.new(0, fw - 20, 0, 0)
        task.wait()
        local titleH = TitleLabel.TextBounds.Y
        local contentH = ContentLabel.TextBounds.Y
        local th = titleH + contentH + 30
        ContentLabel.Position = UDim2.new(0, 10, 0, titleH + 12)
        ParagraphFrame.Size = UDim2.new(1, -14, 0, th)
        SectionFrame.CanvasSize = UDim2.new(0, 0, 0, SectionLayout.AbsoluteContentSize.Y + 35)
    end
    TitleLabel:GetPropertyChangedSignal("TextBounds"):Connect(updateParagraphSize)
    ContentLabel:GetPropertyChangedSignal("TextBounds"):Connect(updateParagraphSize)
    ParagraphFrame:GetPropertyChangedSignal("AbsoluteSize"):Connect(updateParagraphSize)
    task.wait()
    updateParagraphSize()
    registerThemeUpdate(function()
        ParagraphFrame.BackgroundColor3 = currentTheme.Tertiary
        TitleLabel.TextColor3 = currentTheme.Text
        ContentLabel.TextColor3 = currentTheme.TextMuted
        task.defer(updateParagraphSize)
    end)
    local API = {}
    function API:SetTitle(t)
        TitleLabel.Text = tostring(t or "")
        task.defer(updateParagraphSize)
        return self
    end
    function API:SetContent(c)
        ContentLabel.Text = tostring(c or "")
        task.defer(updateParagraphSize)
        return self
    end
    function API:SetBoth(t, c)
        TitleLabel.Text = tostring(t or "")
        ContentLabel.Text = tostring(c or "")
        task.defer(updateParagraphSize)
        return self
    end
    function API:SetVisible(v)
        ParagraphFrame.Visible = v
        return self
    end
    function API:Destroy()
        ParagraphFrame:Destroy()
    end
    setmetatable(API, {
        __index = function(_, key)
            if rawget(API, key) then return rawget(API, key) end
            local v = ParagraphFrame[key]
            if type(v) == "function" then
                return function(_, ...) return v(ParagraphFrame, ...) end
            end
            return v
        end,
        __newindex = function(_, key, value)
            ParagraphFrame[key] = value
        end
    })
    return API
end
    function Section:Seperator()
        local Sep = CreateFrame(SectionFrame, ENC_PREFIX.Seperator, currentTheme.TextMuted, 0.5, UDim2.new(0, 370, 0, 2), nil, 6)
        CreateCorner(Sep, 1)
        local pt = Instance.new("UIPadding"); pt.Parent = Sep; pt.PaddingTop = UDim.new(0, 5); pt.PaddingBottom = UDim.new(0, 5)
        SectionFrame.CanvasSize = UDim2.new(0, 0, 0, SectionLayout.AbsoluteContentSize.Y + 40)
        registerThemeUpdate(function() Sep.BackgroundColor3 = currentTheme.TextMuted end)
        return Sep
    end

function Section:Button(e,t,n)
    if type(t)=="function"then n=t;t=nil end
    local i=12; local s=20; local r=8; local a=12; local l=36; local c=t~=nil
    local realW = SectionFrame.AbsoluteSize.X
    if realW <= 0 then realW = 370 end
    if c then
        local el=CreateLabel(SectionFrame,nil,t,nil,a,currentFont,UDim2.new(0,realW-i*2,0,5000))
        el.TextWrapped=true
        el.RichText=true
        el.Visible=false
        task.wait()
        l = s + el.TextBounds.Y + 24
        el:Destroy()
    end
    local d = CreateFrame(SectionFrame, ENC_PREFIX.Button_ .. XorEncode(e), currentTheme.Tertiary, 0, UDim2.new(1, -14, 0, l), nil, 6)
    CreateCorner(d,6)
    local h=CreateTextButton(d,XorEncode(e.."Btn"),UDim2.new(1,0,1,0),nil,7)
    h.BackgroundTransparency=1; h.Text=""
    local u=CreateLabel(d,ENC.ButtonTitle,e,currentTheme.Text,14,currentFont,
        UDim2.new(1,-i*2,0,s),UDim2.new(0,i,0,c and r or 0),8)
    u.TextYAlignment=Enum.TextYAlignment.Center
    local p
    if c then
        p=CreateLabel(d,ENC.ButtonDesc,t,currentTheme.TextMuted,a,currentFont,
            UDim2.new(1,-i*2,0,l-s-r-4),UDim2.new(0,i,0,r+s+2),8)
        p.TextWrapped=true; p.RichText=true
    end

    local BlindObj = CreateBlindOverlay(d, 6)

    registerThemeUpdate(function()
        d.BackgroundColor3=currentTheme.Tertiary
        u.TextColor3=currentTheme.Text
        if p then p.TextColor3=currentTheme.TextMuted end
    end)

    local currentCallback   = n
    local longPressCallback = nil
    local longPressTime     = 5
    local cooldownTime      = 0
    local lastClickTime     = 0
    local isInCooldown      = false
    local longPressThread   = nil
    local longPressFired    = false
    local blinded           = false

    local f=false;local m=false;local y=Vector2.new(0,0)

    h.InputBegan:Connect(function(v)
        if blinded then return end
        if v.UserInputType==Enum.UserInputType.MouseButton1 or v.UserInputType==Enum.UserInputType.Touch then
            y=Vector2.new(v.Position.X,v.Position.Y)
            longPressFired = false
            if longPressCallback then
                longPressThread = task.delay(longPressTime, function()
                    if not blinded and not longPressFired and d and d.Parent then
                        longPressFired = true
                        task.spawn(function()
                            pcall(longPressCallback, true)
                        end)
                    end
                end)
            end
        end
    end)
    h.InputEnded:Connect(function(v)
        if v.UserInputType==Enum.UserInputType.MouseButton1 or v.UserInputType==Enum.UserInputType.Touch then
            if longPressThread then
                pcall(function() task.cancel(longPressThread) end)
                longPressThread = nil
            end
        end
    end)
    h.MouseEnter:Connect(function()
        if blinded then return end
        if getgenv().ABC8281 or getgenv().ABC3616 or getgenv().ABC3728 then return end
        f=true
        if not m and not isInCooldown then
            TweenService:Create(d,TweenInfo.new(0.15),{BackgroundColor3=currentTheme.Hover,BackgroundTransparency=0.1}):Play()
        end
    end)
    h.MouseLeave:Connect(function()
        if blinded then return end
        f=false
        if not m and not isInCooldown then
            TweenService:Create(d,TweenInfo.new(0.15),{BackgroundColor3=currentTheme.Tertiary,BackgroundTransparency=0}):Play()
        end
    end)
    h.MouseButton1Click:Connect(function()
        if blinded then return end
        if minimizeAnimating or m then return end
        if getgenv().ABC8281 or getgenv().ABC3616 then return end
        if getgenv().ABC3728 then return end
        local now = tick()
        if isInCooldown or (now - lastClickTime) < cooldownTime then
            return
        end
        lastClickTime = now
        if longPressFired then
            return
        end
        m=true
        TweenService:Create(d,TweenInfo.new(0.08),{BackgroundColor3=currentTheme.Hover,BackgroundTransparency=0.1}):Play()
        local v=y or Vector2.new(d.AbsolutePosition.X+d.AbsoluteSize.X/2,d.AbsolutePosition.Y+d.AbsoluteSize.Y/2)
        local b=Instance.new("Frame")
        b.Name=ENC.Ripple;b.Parent=d;b.AnchorPoint=Vector2.new(0.5,0.5)
        b.BackgroundColor3=Color3.fromRGB(255,255,255);b.BackgroundTransparency=0.65
        b.BorderSizePixel=0;b.ZIndex=10;b.ClipsDescendants=false
        local g=d.AbsolutePosition
        local w=v.X-g.X;local _=v.Y-g.Y
        b.Position=UDim2.new(0,w,0,_)
        b.Size=UDim2.new(0,2,0,2)
        local D=Instance.new("UICorner")
        D.CornerRadius=UDim.new(0,1);D.Parent=b
        TweenService:Create(b,TweenInfo.new(0.6,Enum.EasingStyle.Quad,Enum.EasingDirection.Out),{Size=UDim2.new(0,80,0,80),BackgroundTransparency=1}):Play()
        task.spawn(function()
            local E=0;while E<0.6 and b and b.Parent do
                local S=b.AbsoluteSize.X
                if S>0 then pcall(function()D.CornerRadius=UDim.new(0,S/2)end)end;task.wait(0.025);E=E+0.025
            end
        end)
        task.delay(0.1,function()
            m=false
            if d and d.Parent and not blinded then
                TweenService:Create(d,TweenInfo.new(0.1),{BackgroundColor3=f and currentTheme.Hover or currentTheme.Tertiary,BackgroundTransparency=f and 0.1 or 0}):Play()
            end
        end)
        task.delay(0.6,function()if b and b.Parent then b:Destroy()end end)
        if cooldownTime > 0 then
            isInCooldown = true
            TweenService:Create(d, TweenInfo.new(0.2), {BackgroundTransparency = 0.6}):Play()
            task.delay(cooldownTime, function()
                isInCooldown = false
                if d and d.Parent and not blinded then
                    TweenService:Create(d, TweenInfo.new(0.2), {
                        BackgroundTransparency = f and 0.1 or 0,
                        BackgroundColor3 = f and currentTheme.Hover or currentTheme.Tertiary
                    }):Play()
                end
            end)
        end
        if currentCallback and not blinded then
            task.spawn(function() pcall(currentCallback) end)
        end
    end)
    SectionFrame.CanvasSize=UDim2.new(0,0,0,SectionLayout.AbsoluteContentSize.Y+35)

    local API = {}
    function API:SetTitle(text)
        u.Text = tostring(text or "")
        return self
    end
    function API:SetDesc(text)
        if p then
            p.Text = tostring(text or "")
            task.defer(function()
                if d and d.Parent and p and p.Parent then
                    local needed = s + p.TextBounds.Y + r + 24
                    d.Size = UDim2.new(1, -14, 0, math.max(l, needed))
                    SectionFrame.CanvasSize = UDim2.new(0, 0, 0, SectionLayout.AbsoluteContentSize.Y + 35)
                end
            end)
        end
        return self
    end
    function API:NewCallback(fn)
        currentCallback = fn
        return self
    end
    function API:LongPress(fn)
        longPressCallback = fn
        return self
    end
    function API:TimePress(seconds)
        longPressTime = tonumber(seconds) or 5
        return self
    end
    function API:WaitClick(seconds)
        cooldownTime = tonumber(seconds) or 0
        return self
    end

    function API:Blind(value)
        if value == nil then return blinded end
        local newState = value and true or false
        if newState == blinded then return blinded end
        blinded = newState

        if blinded then
            if longPressThread then
                pcall(function() task.cancel(longPressThread) end)
                longPressThread = nil
            end
            longPressFired = false
            f = false
            if not isInCooldown then
                TweenService:Create(d, TweenInfo.new(0.15),
                    {BackgroundColor3 = currentTheme.Tertiary, BackgroundTransparency = 0}):Play()
            end
            BlindObj:Set(true)
        else
            BlindObj:Set(false)
        end
        return blinded
    end
    function API:Unblind()     return self:Blind(false) end
    function API:IsBlinded()   return blinded end

    setmetatable(API, {
        __index = function(_, key)
            if rawget(API, key) then return rawget(API, key) end
            local v = d[key]
            if type(v) == "function" then
                return function(_, ...) return v(d, ...) end
            end
            return v
        end,
        __newindex = function(_, key, value)
            d[key] = value
        end
    })

    return API
end

    function Section:Model(text, desc, modelOrCallback)
        local model = nil
        if typeof(modelOrCallback) == "Instance" then 
            model = modelOrCallback 
        end
        
        local Holder = CreateFrame(
            SectionFrame, 
            ENC_PREFIX.Model_..XorEncode(text), 
            currentTheme.Tertiary, 
            0, 
            UDim2.new(0, 370, 0, 220), 
            nil, 
            6
        )
        CreateCorner(Holder, 6)
        
        local Title = CreateLabel(
            Holder, 
            ENC.ModelTitle, 
            text, 
            currentTheme.Text, 
            14, 
            currentFont, 
            UDim2.new(1, -20, 0, 20), 
            UDim2.new(0, 10, 0, 8), 
            7
        )
        
        local Desc = desc and CreateLabel(
            Holder, 
            ENC.ModelDesc, 
            desc, 
            currentTheme.TextMuted, 
            12, 
            currentFont, 
            UDim2.new(1, -20, 0, 16), 
            UDim2.new(0, 10, 0, 28), 
            7
        )
        
        local Viewport = Instance.new("ViewportFrame")
        Viewport.Name = ENC.ModelViewport or "Viewport"
        Viewport.Parent = Holder
        Viewport.BackgroundColor3 = currentTheme.Secondary
        Viewport.BackgroundTransparency = 0
        Viewport.BorderSizePixel = 0
        Viewport.Position = UDim2.new(0, 5, 0, desc and 48 or 32)
        Viewport.Size = UDim2.new(1, -30, 1, desc and -52 or -42)
        Viewport.ZIndex = 7
        Viewport.Ambient = Color3.fromRGB(200, 200, 200)
        Viewport.LightColor = Color3.fromRGB(255, 255, 255)
        Viewport.LightDirection = Vector3.new(-1, -2, -1)
        CreateCorner(Viewport, 6)
        
        local InputCatcher = Instance.new("TextButton")
        InputCatcher.Name = "InputCatcher"
        InputCatcher.BackgroundTransparency = 1
        InputCatcher.Text = ""
        InputCatcher.Size = UDim2.new(1, 0, 1, 0)
        InputCatcher.Active = true
        InputCatcher.ZIndex = 8
        InputCatcher.Parent = Viewport

        local Shield = Instance.new("TextButton")
        Shield.Name = "InteractionShield"
        Shield.BackgroundTransparency = 1
        Shield.Text = ""
        Shield.Size = UDim2.new(100, 0, 100, 0)
        Shield.Position = UDim2.new(-50, 0, -50, 0)
        Shield.Active = true
        Shield.ZIndex = 99999
        Shield.Visible = false
        Shield.Parent = Holder

        local WorldModel = Instance.new("WorldModel")
        WorldModel.Parent = Viewport

        local cam = Instance.new("Camera")
        cam.FieldOfView = 70
        cam.Parent = Viewport
        Viewport.CurrentCamera = cam

        local camCenter = Vector3.new(0, 0, 0)
        local camRadius = 10
        local camAngleX = 0
        local camAngleY = math.rad(20)
        
        local isDragging = false
        local isPinching = false
        local initialPinchR = 10
        local currentDragInput = nil
        local lastMousePos = Vector2.new()
        
        local lockID = "Model_" .. tostring(math.random(1000, 9999))
        
        local rsConn
        rsConn = RunService.RenderStepped:Connect(function(dt)
            if not Viewport.Parent then
                rsConn:Disconnect()
                return
            end
            
            if not isDragging and not isPinching then
                camAngleX = camAngleX + (math.rad(15) * dt)
            end
            
            local height = math.sin(camAngleY) * camRadius
            local horizDist = math.cos(camAngleY) * camRadius
            local posX = math.sin(camAngleX) * horizDist
            local posZ = math.cos(camAngleX) * horizDist
            
            local finalPos = camCenter + Vector3.new(posX, height, posZ)
            cam.CFrame = CFrame.lookAt(finalPos, camCenter)
        end)

        InputCatcher.InputBegan:Connect(function(input)
            local isMouse = input.UserInputType == Enum.UserInputType.MouseButton1
            local isTouch = input.UserInputType == Enum.UserInputType.Touch
            
            if isMouse or isTouch then
                local abc = getgenv().ABC3728
                if abc and abc ~= lockID then return end
                if currentDragInput then return end
                
                currentDragInput = input
                isDragging = true
                lastMousePos = Vector2.new(
                    input.Position.X, 
                    input.Position.Y
                )
                
                getgenv().ABC3728 = lockID
                Shield.Visible = true
                
                if SectionFrame:IsA("ScrollingFrame") then
                    SectionFrame.ScrollingEnabled = false
                end
            end
        end)

        InputCatcher.InputChanged:Connect(function(input)
            if input.UserInputType == Enum.UserInputType.MouseWheel then
                local zoomDelta = input.Position.Z * (camRadius * 0.15)
                camRadius = math.clamp(
                    camRadius - zoomDelta, 
                    0.5, 
                    500
                )
            end
        end)

        UserInputService.TouchPinch:Connect(function(pos, scale, vel, state)
            if not Viewport.Parent then return end
            
            local center = Vector2.new(0, 0)
            if #pos > 0 then
                for _, p in ipairs(pos) do
                    center = center + p
                end
                center = center / #pos
            end
            
            local absPos = InputCatcher.AbsolutePosition
            local absSize = InputCatcher.AbsoluteSize
            local inX = center.X >= absPos.X and center.X <= absPos.X + absSize.X
            local inY = center.Y >= absPos.Y and center.Y <= absPos.Y + absSize.Y
            
            if (inX and inY) or isPinching then
                if state == Enum.UserInputState.Begin then
                    local abc = getgenv().ABC3728
                    if abc and abc ~= lockID then return end
                    
                    isPinching = true
                    initialPinchR = camRadius
                    
                    getgenv().ABC3728 = lockID
                    Shield.Visible = true
                    
                    if SectionFrame:IsA("ScrollingFrame") then
                        SectionFrame.ScrollingEnabled = false
                    end
                    
                elseif state == Enum.UserInputState.Change then
                    if isPinching then
                        camRadius = math.clamp(
                            initialPinchR / scale, 
                            0.5, 
                            500
                        )
                    end
                    
                elseif state == Enum.UserInputState.End then
                    isPinching = false
                    
                    if not isDragging then
                        if getgenv().ABC3728 == lockID then
                            getgenv().ABC3728 = nil
                        end
                        Shield.Visible = false
                        
                        if SectionFrame:IsA("ScrollingFrame") then
                            SectionFrame.ScrollingEnabled = true
                        end
                    end
                end
            end
        end)

        UserInputService.InputChanged:Connect(function(input)
            if isDragging and input == currentDragInput then
                local currentPos = Vector2.new(
                    input.Position.X, 
                    input.Position.Y
                )
                local delta = currentPos - lastMousePos
                lastMousePos = currentPos
                
                camAngleX = camAngleX - math.rad(delta.X * 0.6)
                local newY = camAngleY + math.rad(delta.Y * 0.6)
                camAngleY = math.clamp(
                    newY, 
                    math.rad(-85), 
                    math.rad(85)
                )
            end
        end)

        UserInputService.InputEnded:Connect(function(input)
            if isDragging and input == currentDragInput then
                isDragging = false
                currentDragInput = nil
                
                if not isPinching then
                    if getgenv().ABC3728 == lockID then
                        getgenv().ABC3728 = nil
                    end
                    Shield.Visible = false
                    
                    if SectionFrame:IsA("ScrollingFrame") then
                        SectionFrame.ScrollingEnabled = true
                    end
                end
            end
        end)

        local function setModel(inst)
            for _, c in ipairs(WorldModel:GetChildren()) do
                pcall(function() c:Destroy() end)
            end

            if not inst or typeof(inst) ~= "Instance" then return end

            local clone
            local ok = pcall(function()
                local oldArch = inst.Archivable
                inst.Archivable = true
                clone = inst:Clone()
                inst.Archivable = oldArch
            end)

            if not ok or not clone then return end

            pcall(function()
                for _, part in ipairs(clone:GetDescendants()) do
                    if part:IsA("BasePart") then
                        part.CastShadow = false
                    end
                    if part:IsA("Script") 
                    or part:IsA("LocalScript") 
                    or part:IsA("ModuleScript") then
                        part:Destroy()
                    end
                end
            end)

            local wrapper = clone
            if not clone:IsA("Model") then
                wrapper = Instance.new("Model")
                clone.Parent = wrapper
            end

            wrapper.Parent = WorldModel

            task.defer(function()
                if not WorldModel.Parent then return end
                if not wrapper.Parent then return end

                pcall(function()
                    wrapper:PivotTo(CFrame.new(0, 0, 0))
                end)

                local cf, size = CFrame.new(0,0,0), Vector3.new(4,4,4)
                pcall(function()
                    cf, size = wrapper:GetBoundingBox()
                end)

                local maxDim = math.max(size.X, size.Y, size.Z)
                if maxDim <= 0.001 then maxDim = 4 end

                camCenter = cf.Position
                local fovRad = math.rad(cam.FieldOfView)
                local dist = (maxDim / 2) / math.tan(fovRad / 2)
                camRadius = dist * 1.35
            end)
        end

        if model then setModel(model) end

        registerThemeUpdate(function()
            Holder.BackgroundColor3 = currentTheme.Tertiary
            Title.TextColor3 = currentTheme.Text
            if Desc then 
                Desc.TextColor3 = currentTheme.TextMuted 
            end
            Viewport.BackgroundColor3 = currentTheme.Secondary
        end)
        
        local tgSize = SectionLayout.AbsoluteContentSize.Y + 35
        SectionFrame.CanvasSize = UDim2.new(0, 0, 0, tgSize)

        local ModelObj = {Viewport = Viewport, Camera = cam}
        function ModelObj:SetModel(inst) setModel(inst) end
        return ModelObj
    end

function Section:Audio(text, description, soundId, callback)
    local args = {description, soundId, callback}
    description, soundId, callback = nil, nil, nil
    for _,v in ipairs(args) do
        if type(v)=="function" then callback=v
        elseif type(v)=="string" then 
            if v:match("^https?://") or v:match("^rbxassetid") or v:match("^%d+$") or v=="" then soundId=v else description=v end 
        end 
    end

    local baseH = description and 90 or 70
    local Holder = CreateFrame(SectionFrame, ENC_PREFIX.Audio_..XorEncode(text), currentTheme.Tertiary, 0, UDim2.new(1, -20, 0, baseH), nil, 6)
    CreateCorner(Holder, 6)

    local TitleLabel = CreateLabel(Holder, ENC.AudioTitle, text, currentTheme.Text, 14, currentFont, UDim2.new(1, -150, 0, 20), UDim2.new(0, 10, 0, 8), 7)
    TitleLabel.TextTruncate = Enum.TextTruncate.AtEnd
    
    local DescLabel
    if description and description ~= "" then 
        DescLabel = CreateLabel(Holder, XorEncode(text.."_desc"), description, currentTheme.TextMuted, 11, currentFont, UDim2.new(1, -150, 0, 16), UDim2.new(0, 10, 0, 26), 7) 
        DescLabel.TextWrapped = true
        DescLabel.TextTruncate = Enum.TextTruncate.AtEnd
    end

    local Sound = Instance.new("Sound", Holder)
    Sound.Name = XorEncode(text.."_sound")
    Sound.SoundId = GetAsset(soundId or "", "mp3")
    Sound.Volume = 0.5

    local function CreateAudioBtn(name, txt, xOffset)
        local b = CreateTextButton(Holder, XorEncode(text..name), UDim2.new(0, 55, 0, 24), nil, 8)
        b.AnchorPoint = Vector2.new(1, 0)
        b.Position = UDim2.new(1, xOffset, 0, 8)
        b.Text = txt
        b.TextColor3 = currentTheme.Text
        b.BackgroundColor3 = currentTheme.Secondary
        CreateCorner(b, 6)
        return b
    end

    local PlayBtn = CreateAudioBtn("Play", "Play", -10)
    local RestartBtn = CreateAudioBtn("Restart", "Restart", -70)
    local LoopBtn = CreateAudioBtn("Loop", "Loop: Off", -130)

    local SB = CreateFrame(Holder, XorEncode(text.."_sliderback"), currentTheme.Secondary, 0, UDim2.new(1, -20, 0, 8), UDim2.new(0, 10, 1, -25), 8)
    SB.AnchorPoint = Vector2.new(0, 1) 
    CreateCorner(SB, 4)
    
    local SF = CreateFrame(SB, XorEncode(text.."_sliderfill"), currentTheme.Accent, 0, UDim2.new(0, 0, 1, 0), nil, 9)
    CreateCorner(SF, 4)
    
    local Knob = Instance.new("Frame", Holder)
    Knob.Name = XorEncode(text.."_knob")
    Knob.Size = UDim2.new(0, 14, 0, 14)
    Knob.AnchorPoint = Vector2.new(0.5, 0.5)
    Knob.BackgroundColor3 = Color3.new(1,1,1)
    Knob.ZIndex = 20
    CreateCorner(Knob, 50)

    local TimeLabel = CreateLabel(Holder, XorEncode(text.."_time"), "0:00 / 0:00", currentTheme.TextMuted, 10, currentFont, UDim2.new(0, 80, 0, 16), UDim2.new(1, -15, 1, -40), 8)
    TimeLabel.AnchorPoint = Vector2.new(1, 1)
    TimeLabel.TextXAlignment = Enum.TextXAlignment.Right

    local drag = false
    local function updateSliderVisual(rel)
        rel = math.clamp(rel, 0, 1)
        SF.Size = UDim2.new(rel, 0, 1, 0)
        local absX = SB.AbsolutePosition.X
        local absW = SB.AbsoluteSize.X
        local knobX = absX + (rel * absW)
        
        Knob.Position = UDim2.new(0, knobX - Holder.AbsolutePosition.X, 1, -28) 
    end

    SB.InputBegan:Connect(function(i) 
        if i.UserInputType == Enum.UserInputType.MouseButton1 or i.UserInputType == Enum.UserInputType.Touch then drag=true; updateSliderVisual((i.Position.X - SB.AbsolutePosition.X) / SB.AbsoluteSize.X) end 
    end)
    
    game:GetService("UserInputService").InputChanged:Connect(function(i)
        if drag and (i.UserInputType == Enum.UserInputType.MouseMovement or i.UserInputType == Enum.UserInputType.Touch) then
            local rel = math.clamp((i.Position.X - SB.AbsolutePosition.X) / SB.AbsoluteSize.X, 0, 1)
            if Sound.TimeLength > 0 then Sound.TimePosition = rel * Sound.TimeLength end
            updateSliderVisual(rel)
        end
    end)
    
    game:GetService("UserInputService").InputEnded:Connect(function(i) 
        if i.UserInputType == Enum.UserInputType.MouseButton1 or i.UserInputType == Enum.UserInputType.Touch then drag=false end 
    end)

    PlayBtn.MouseButton1Click:Connect(function()
        if Sound.IsPlaying then 
            Sound:Pause()
            PlayBtn.Text = "Play" 
        else 
            Sound:Resume()
            PlayBtn.Text = "Pause" 
        end
    end)

    RestartBtn.MouseButton1Click:Connect(function() 
        Sound.TimePosition = 0
        Sound:Play()
        PlayBtn.Text = "Pause" 
    end)

    LoopBtn.MouseButton1Click:Connect(function(b) 
        Sound.Looped = not Sound.Looped
        b.Text = Sound.Looped and "Loop: On" or "Loop: Off" 
    end)

    game:GetService("RunService").RenderStepped:Connect(function()
        if not Holder.Parent then return end
        local c, d = Sound.TimePosition, Sound.TimeLength
        TimeLabel.Text = string.format("%d:%02d / %d:%02d", math.floor(c/60), c%60, math.floor(d/60), d%60)
        if not drag and d > 0 then updateSliderVisual(c/d) end
    end)

    Sound.Ended:Connect(function() 
        PlayBtn.Text = "Play" 
    end)

    registerThemeUpdate(function()
        Holder.BackgroundColor3 = currentTheme.Tertiary
        TitleLabel.TextColor3 = currentTheme.Text
        if DescLabel then DescLabel.TextColor3 = currentTheme.TextMuted end
        PlayBtn.BackgroundColor3 = currentTheme.Secondary; PlayBtn.TextColor3 = currentTheme.Text
        RestartBtn.BackgroundColor3 = currentTheme.Secondary; RestartBtn.TextColor3 = currentTheme.Text
        LoopBtn.BackgroundColor3 = currentTheme.Secondary; LoopBtn.TextColor3 = currentTheme.Text
        SB.BackgroundColor3 = currentTheme.Secondary
        SF.BackgroundColor3 = currentTheme.Accent
        TimeLabel.TextColor3 = currentTheme.TextMuted
    end)
    return {
        Sound=Sound, 
        Play=function() Sound:Resume(); PlayBtn.Text="Pause" end, 
        Stop=function() Sound:Stop(); PlayBtn.Text="Play" end, 
        Time=function(s) Sound.TimePosition=s end,
        SetAudio=function(id) Sound:Stop(); Sound.SoundId=GetAsset(id, "mp3"); PlayBtn.Text="Play" end
    }
end

function Section:Image(imageId, title, description, callback)
    if type(title) == "function" then
        callback = title
        title = ""
        description = ""
    elseif type(description) == "function" then
        callback = description
        description = ""
    end

    title = title or ""
    description = description or ""
    imageId = imageId or ""

    local finalImage
    if type(imageId) == "string" and imageId:match("^https?://") then
        finalImage = GetAsset(imageId, "png")
    else
        finalImage = imageId
    end

    local hasTitle = title ~= ""
    local hasDesc  = description ~= ""


    local textHeight = (hasTitle and 22 or 0) + (hasDesc and 20 or 0)
    local imgHeight  = 160
    local holderHeight = 10 + textHeight + imgHeight + 10

    local Holder = CreateFrame(
        SectionFrame,
        ENC_PREFIX.Image_ .. XorEncode(tostring(os.clock())),
        currentTheme.Tertiary,
        0,
        UDim2.new(0, 370, 0, holderHeight),
        nil,
        6
    )
    CreateCorner(Holder, 6)

    local currentY = 10

    local TitleLabel
    if hasTitle then
        TitleLabel = CreateLabel(
            Holder,
            ENC.SectionTitle,
            title,
            currentTheme.Text,
            14,
            currentFont,
            UDim2.new(1, -20, 0, 20),
            UDim2.new(0, 10, 0, currentY),
            7
        )
        currentY = currentY + 22
    end

    local DescLabel
    if hasDesc then
        DescLabel = CreateLabel(
            Holder,
            ENC.ButtonDesc,
            description,
            currentTheme.TextMuted,
            12,
            currentFont,
            UDim2.new(1, -20, 0, 18),
            UDim2.new(0, 10, 0, currentY),
            7
        )
        currentY = currentY + 20
    end


    local ImageLabel = Instance.new("ImageLabel")
    ImageLabel.Name = ENC.Icon
    ImageLabel.Parent = Holder
    ImageLabel.BackgroundTransparency = 1
    ImageLabel.Position = UDim2.new(0, 10, 0, currentY)
    ImageLabel.Size = UDim2.new(1, -20, 0, imgHeight)
    ImageLabel.Image = finalImage
    ImageLabel.ScaleType = Enum.ScaleType.Fit
    ImageLabel.ZIndex = 7

    local ClickZone = nil
    if callback then
        ClickZone = Instance.new("TextButton")
        ClickZone.Name = XorEncode("ImageClick")
        ClickZone.Parent = Holder
        ClickZone.BackgroundTransparency = 1
        ClickZone.Position = ImageLabel.Position
        ClickZone.Size = ImageLabel.Size
        ClickZone.Text = ""
        ClickZone.ZIndex = 8
        ClickZone.AutoButtonColor = false
        ClickZone.MouseButton1Click:Connect(callback)
    end

    registerThemeUpdate(function()
        Holder.BackgroundColor3 = currentTheme.Tertiary
        if TitleLabel then TitleLabel.TextColor3 = currentTheme.Text end
        if DescLabel then DescLabel.TextColor3 = currentTheme.TextMuted end
    end)

    local api = {}

    function api:Callback(fn)
        if ClickZone then
            ClickZone.MouseButton1Click:Connect(fn)
        else
            ClickZone = Instance.new("TextButton")
            ClickZone.Name = XorEncode("ImageClick")
            ClickZone.Parent = Holder
            ClickZone.BackgroundTransparency = 1
            ClickZone.Position = ImageLabel.Position
            ClickZone.Size = ImageLabel.Size
            ClickZone.Text = ""
            ClickZone.ZIndex = 8
            ClickZone.AutoButtonColor = false
            ClickZone.MouseButton1Click:Connect(fn)
        end
    end

    function api:SetTitle(text)
        if TitleLabel then TitleLabel.Text = text end
    end

    function api:SetDescription(text)
        if DescLabel then DescLabel.Text = text end
    end

    function api:SetImage(id)
        if type(id) == "string" and id:match("^https?://") then
            ImageLabel.Image = GetAsset(id, "png")
        else
            ImageLabel.Image = id or ""
        end
    end
    return api
end

function Section:Video(text, arg2, arg3, arg4)
    local description = ""
    local videoId = ""
    local callback = nil

    if type(arg2) == "string" and (arg2:find("rbxassetid") or arg2:find("http")) then
        videoId = arg2
        callback = arg3
    else
        description = arg2
        videoId = arg3
        callback = arg4
    end

    local success, finalVideoId = pcall(function() return GetAsset(videoId or "", "mp4") end)
    if not success then finalVideoId = videoId end

    local hasDesc = (description ~= "" and description ~= nil)
    local holderHeight = hasDesc and 350 or 320
    
    local Holder = CreateFrame(SectionFrame, ENC_PREFIX.Video_..XorEncode(text), currentTheme.Tertiary, 0, UDim2.new(1, -20, 0, holderHeight), nil, 6)
    CreateCorner(Holder, 6)

    local Title = CreateLabel(Holder, ENC.VideoTitle or "VideoTitle", text or "Video", currentTheme.Text, 14, currentFont, UDim2.new(1,-20,0,30), UDim2.new(0,10,0,0), 7)
    local DescLabel
    if hasDesc then
        DescLabel = CreateLabel(Holder, "VideoDesc", description, currentTheme.TextMuted, 12, currentFont, UDim2.new(1,-20,0,20), UDim2.new(0,10,0,25), 7)
        DescLabel.TextWrapped = true
    end

    local videoY = hasDesc and 50 or 35
    local VideoFrame = Instance.new("VideoFrame")
    VideoFrame.Name = ENC.VideoFrame or "VideoFrame"
    VideoFrame.Parent = Holder
    VideoFrame.Video = finalVideoId 
    VideoFrame.BackgroundColor3 = currentTheme.Secondary
    VideoFrame.BorderSizePixel = 0
    VideoFrame.Position = UDim2.new(0,10,0,videoY)
    VideoFrame.Size = UDim2.new(1,-20,0,160)
    VideoFrame.ZIndex = 7
    VideoFrame.Looped = true
    CreateCorner(VideoFrame, 6)

    local ControlsFrame = CreateFrame(Holder, "Controls", nil, 1, UDim2.new(1, -20, 0, 60), UDim2.new(0, 10, 1, -70), 8)
    ControlsFrame.BackgroundTransparency = 1

    local SliderTrack = CreateTextButton(ControlsFrame, "VideoSlider", UDim2.new(1,0,0,10), UDim2.new(0,0,0,0), 8)
    SliderTrack.BackgroundColor3 = currentTheme.Secondary
    SliderTrack.Text = ""
    CreateCorner(SliderTrack, 6)
    
    local SliderBar = Instance.new("Frame", SliderTrack)
    SliderBar.Name = "ProgressBar"
    SliderBar.Size = UDim2.new(0, 0, 1, 0)
    SliderBar.BackgroundColor3 = currentTheme.Accent
    SliderBar.BorderSizePixel = 0
    CreateCorner(SliderBar, 6)

    local ButtonsRow = CreateFrame(ControlsFrame, "Buttons", nil, 1, UDim2.new(1, 0, 0, 30), UDim2.new(0, 0, 0, 20), 8)
    ButtonsRow.BackgroundTransparency = 1
    
    local function VidBtn(name, txt, posX)
        local b = CreateTextButton(ButtonsRow, name, UDim2.new(0,75,0,24), UDim2.new(0, posX, 0, 0), 8)
        b.Text = txt
        CreateCorner(b, 6)
        return b
    end
    
    local PlayBtn = VidBtn("VideoPlay", "Pause", 0)
    local RestartBtn = VidBtn("VideoRestart", "Restart", 85)
    local LoopBtn = VidBtn("VideoLoop", "Loop: On", 170)
    local MuteBtn = VidBtn("VideoMute", "Mute", 255)

    local TimeLabel = CreateLabel(ControlsFrame, "VideoTimer", "0:00 / 0:00", currentTheme.Text, 12, currentFont, UDim2.new(1, -90, 0, 20), UDim2.new(1, 0, 0, 25), 8)
    TimeLabel.TextXAlignment = Enum.TextXAlignment.Right

    SliderTrack.MouseButton1Click:Connect(function()
        local mouse = game.Players.LocalPlayer:GetMouse()
        local relativeX = mouse.X - SliderTrack.AbsolutePosition.X
        local percentage = math.clamp(relativeX / SliderTrack.AbsoluteSize.X, 0, 1)
        VideoFrame.TimePosition = percentage * VideoFrame.TimeLength
    end)

    PlayBtn.MouseButton1Click:Connect(function()
        if VideoFrame.Playing then VideoFrame:Pause(); PlayBtn.Text = "Play"
        else VideoFrame:Play(); PlayBtn.Text = "Pause" end
    end)
    
    RestartBtn.MouseButton1Click:Connect(function() 
        VideoFrame.TimePosition = 0; VideoFrame:Play(); PlayBtn.Text = "Pause" 
    end)
    
    LoopBtn.MouseButton1Click:Connect(function()
        VideoFrame.Looped = not VideoFrame.Looped
        LoopBtn.Text = VideoFrame.Looped and "Loop: On" or "Loop: Off"
    end)
    
    MuteBtn.MouseButton1Click:Connect(function()
        VideoFrame.Volume = (VideoFrame.Volume > 0) and 0 or 1
        MuteBtn.Text = (VideoFrame.Volume == 0) and "Unmute" or "Mute"
    end)

    RunService.RenderStepped:Connect(function()
        if VideoFrame.TimeLength > 0 then
            local p = VideoFrame.TimePosition / VideoFrame.TimeLength
            SliderBar.Size = UDim2.new(p, 0, 1, 0)
            local cur = math.floor(VideoFrame.TimePosition)
            local tot = math.floor(VideoFrame.TimeLength)
            TimeLabel.Text = string.format("%d:%02d / %d:%02d", math.floor(cur/60), cur%60, math.floor(tot/60), tot%60)
        end
    end)

    registerThemeUpdate(function()
        Holder.BackgroundColor3 = currentTheme.Tertiary
        Title.TextColor3 = currentTheme.Text
        if DescLabel then DescLabel.TextColor3 = currentTheme.TextMuted end
        
        VideoFrame.BackgroundColor3 = currentTheme.Secondary
        SliderTrack.BackgroundColor3 = currentTheme.Secondary
        SliderBar.BackgroundColor3 = currentTheme.Accent
        TimeLabel.TextColor3 = currentTheme.Text
        
        local btnBg = currentTheme.Secondary
        local btnTxt = currentTheme.Text
        PlayBtn.BackgroundColor3 = btnBg; PlayBtn.TextColor3 = btnTxt
        RestartBtn.BackgroundColor3 = btnBg; RestartBtn.TextColor3 = btnTxt
        LoopBtn.BackgroundColor3 = btnBg; LoopBtn.TextColor3 = btnTxt
        MuteBtn.BackgroundColor3 = btnBg; MuteBtn.TextColor3 = btnTxt
    end)

    SectionFrame.CanvasSize = UDim2.new(0, 0, 0, SectionLayout.AbsoluteContentSize.Y + 35)
    
    local VideoObj = {VideoFrame = VideoFrame}
    function VideoObj:Play() VideoFrame:Play(); PlayBtn.Text="Pause" end
    function VideoObj:Pause() VideoFrame:Pause(); PlayBtn.Text="Play" end
    function VideoObj:SetTitle(t) Title.Text = t end
    function VideoObj:SetDescription(t) if DescLabel then DescLabel.Text = t end end
    function VideoObj:SetVideo(id) VideoFrame.Video = GetAsset(id, "mp4") end
    return VideoObj
end

function Section:Toggle(text, desc, default, callback)
    if type(desc) == "boolean" then callback = default; default = desc; desc = nil
    elseif type(desc) == "function" then callback = desc; default = false; desc = nil end
    local bh = 38; local ty = 8; local dy = 26; local tgy = 7
    if desc then bh = 38 + MeasureDescH(desc, 12, 300) + 15; dy = 22; tgy = 8 end
    local Toggle = CreateTextButton(SectionFrame, ENC_PREFIX.Toggle_ .. XorEncode(text), UDim2.new(1, -14, 0, bh), nil, 6)
    CreateCorner(Toggle, 6)
    local ToggleLabel = CreateLabel(Toggle, ENC.ToggleLabel, text, currentTheme.Text, 14, currentFont, UDim2.new(0, 280, 0, 18), UDim2.new(0, 10, 0, ty), 7); ToggleLabel.TextYAlignment = Enum.TextYAlignment.Center
    local DescLabel
    if desc then DescLabel = CreateLabel(Toggle, ENC.ToggleDesc, desc, currentTheme.TextMuted, 12, currentFont, UDim2.new(0, 300, 0, bh - 38), UDim2.new(0, 10, 0, dy), 7); DescLabel.TextWrapped = true; DescLabel.RichText = true; DescLabel.AutomaticSize = Enum.AutomaticSize.Y end
    local ToggleFrame = CreateFrame(Toggle, ENC.ToggleFrame, currentTheme.Secondary, 0, UDim2.new(0, 44, 0, 24), UDim2.new(1, -10, 0, tgy), 7)
    ToggleFrame.AnchorPoint = Vector2.new(1, 0)
    ToggleFrame.BorderSizePixel = 1; ToggleFrame.BorderColor3 = currentTheme.Border; CreateCorner(ToggleFrame, 12)
    local ToggleFill = CreateFrame(ToggleFrame, ENC.ToggleFill, currentTheme.Accent, 0, UDim2.new(0, 0, 1, 0), nil, 8); CreateCorner(ToggleFill, 12)
    local ToggleFillGradient = Instance.new("UIGradient"); ToggleFillGradient.Rotation = 90; ToggleFillGradient.Color = ColorSequence.new({ColorSequenceKeypoint.new(0, currentTheme.Accent), ColorSequenceKeypoint.new(1, currentTheme.AccentGradient)}); ToggleFillGradient.Parent = ToggleFill; ToggleFillGradient.Name = ENC.ToggleFillGradient
    local ToggleCircle = CreateFrame(ToggleFrame, ENC.ToggleCircle, Color3.fromRGB(255, 255, 255), 0, UDim2.new(0, 18, 0, 18), UDim2.new(0, 3, 0.5, -9), 9); CreateCorner(ToggleCircle, 12)

    local BlindObj = CreateBlindOverlay(Toggle, 6)

    local toggled  = default or false
    local isAnimating = false
    local blinded  = false

    if toggled then
        ToggleFill.Size = UDim2.new(1, 0, 1, 0)
        ToggleFrame.BackgroundColor3 = currentTheme.Accent
        ToggleCircle.Position = UDim2.new(1, -21, 0.5, -9)
    end

    registerThemeUpdate(function()
        Toggle.BackgroundColor3 = currentTheme.Tertiary; ToggleLabel.TextColor3 = currentTheme.Text
        if DescLabel then DescLabel.TextColor3 = currentTheme.TextMuted end
        ToggleFrame.BorderColor3 = currentTheme.Border
        ToggleFrame.BackgroundColor3 = toggled and currentTheme.Accent or currentTheme.Secondary
        ToggleFillGradient.Color = ColorSequence.new({ColorSequenceKeypoint.new(0, currentTheme.Accent), ColorSequenceKeypoint.new(1, currentTheme.AccentGradient)})
    end)

    local function updateToggle()
        if minimizeAnimating or isAnimating or blinded then return end
        isAnimating = true; toggled = not toggled
        if toggled then
            TweenService:Create(ToggleFrame, TweenInfo.new(0.25), {BackgroundColor3 = currentTheme.Accent}):Play()
            TweenService:Create(ToggleFill, TweenInfo.new(0.3, Enum.EasingStyle.Back), {Size = UDim2.new(1, 0, 1, 0)}):Play()
            TweenService:Create(ToggleCircle, TweenInfo.new(0.3, Enum.EasingStyle.Back), {Position = UDim2.new(1, -21, 0.5, -9)}):Play()
            task.delay(0.35, function() isAnimating = false end)
        else
            TweenService:Create(ToggleFrame, TweenInfo.new(0.25), {BackgroundColor3 = currentTheme.Secondary}):Play()
            TweenService:Create(ToggleFill, TweenInfo.new(0.25, Enum.EasingStyle.Quad, Enum.EasingDirection.In), {Size = UDim2.new(0, 0, 1, 0)}):Play()
            TweenService:Create(ToggleCircle, TweenInfo.new(0.25, Enum.EasingStyle.Back), {Position = UDim2.new(0, 3, 0.5, -9)}):Play()
            task.delay(0.3, function() isAnimating = false end)
        end
        if callback then callback(toggled) end
    end

    Toggle.MouseButton1Click:Connect(function()
        if blinded then return end
        updateToggle()
    end)

    if toggled and callback then task.spawn(function() callback(toggled) end) end
    SectionFrame.CanvasSize = UDim2.new(0, 0, 0, SectionLayout.AbsoluteContentSize.Y + 35)

    local function applyBlindVisual(state)
        BlindObj:Set(state)
    end

    local api = setmetatable({
        Blind = function(self, value)
            if value == nil then return blinded end
            local newState = value and true or false
            if newState == blinded then return blinded end
            blinded = newState
            applyBlindVisual(blinded)
            return blinded
        end,
        Unblind   = function(self) return self:Blind(false) end,
        IsBlinded = function(self) return blinded end,
        Get       = function(self) return toggled end,
        Toggle    = function(self)
            if blinded then return toggled end
            updateToggle()
            return toggled
        end,
        Set       = function(self, value)
            if blinded then return toggled end
            local target = value and true or false
            if target == toggled then return toggled end
            updateToggle()
            return toggled
        end,
        Button = Toggle
    }, {
        __index = function(t, k)
            local v = Toggle[k]
            if type(v) == "function" then
                return function(...)
                    local args = { ... }
                    if args[1] == t then args[1] = Toggle end
                    return v(table.unpack(args))
                end
            end
            return v
        end,
        __newindex = function(t, k, v) Toggle[k] = v end
    })

    return api
end
function Section:Colorpicker(e,t,n,o)
    if type(t)== "userdata" and typeof(t)== "Color3" then o=n;n=t;t=nil end
    local i=38;local s=60;local r=370-s-14
    if t then i=38+MeasureDescH(t,12,360)+8 end
    
    local a=CreateFrame(SectionFrame,ENC_PREFIX.Colorpicker_..XorEncode(e),currentTheme.Tertiary,0,UDim2.new(0,350,0,i),nil,6);CreateCorner(a,6)
    local c=(i/2)-12 

    local d=CreateFrame(a,ENC.ColorButtonBorder,currentTheme.Border,0,UDim2.new(0,s+4,0,24),UDim2.new(1,-s+35,0,c+10),7);
    d.AnchorPoint = Vector2.new(1, 0.5) 
    CreateCorner(d,5)
    
    local h=CreateTextButton(d,ENC.ColorButton,UDim2.new(0,s,0,20),UDim2.new(0,2,0,2),8);h.BackgroundColor3=currentTheme.Secondary
    local u=n or Color3.fromRGB(255,255,255);local p=u
    local f=CreateFrame(h,ENC.ColorDisplay,u,0,UDim2.new(0,s-4,1,-4),UDim2.new(0,2,0,2),9);CreateCorner(f,4)
    
    local m=CreateLabel(a,ENC.CPTitle,e,currentTheme.Text,13,currentFont,UDim2.new(1,-s-24,0,t and 18 or i),UDim2.new(0,10,0,t and 5 or 0),7);m.TextYAlignment=Enum.TextYAlignment.Center
    local y=nil
    if t then y=CreateLabel(a,XorEncode("ColorpickerDesc"),t,currentTheme.TextMuted,12,currentFont,UDim2.new(1,-s-24,0,i-28),UDim2.new(0,10,0,26),7);y.TextWrapped=true;y.RichText=true;y.TextYAlignment=Enum.TextYAlignment.Top end
    
    local v=false;local b=nil;local g=nil;local k={};local w=nil
    
    local function Cleanup()
        for e,t in ipairs(k)do if t then pcall(function()t:Disconnect()end)end end;table.clear(k)
        if w then pcall(function()w:Disconnect()end);w=nil end
    end
    
    local function ClosePopup()
        if not v then return end;v=false; Cleanup()
        if g then g:Destroy();g=nil end;b=nil
        if getgenv().ABC3728== "ColorPicker" then getgenv().ABC3728=nil end
    end
    
    local function OpenPopup()
        if v or minimizeAnimating then return end;v=true
        g=Instance.new("TextButton");g.Name=ENC.CPOverlay;g.Parent=MainFrame;g.Size=UDim2.new(1,0,1,0)
        g.Position=UDim2.new(0,0,0,0);g.BackgroundColor3=Color3.new(0,0,0);g.BackgroundTransparency=1
        g.Text=" ";g.AutoButtonColor=false;g.BorderSizePixel=0;g.Modal=true;g.ZIndex=999
        
        b=CreateFrame(g,ENC.CPPopup,currentTheme.Main,0,UDim2.new(0,340,0,310),UDim2.new(0.5,-170,0.5,-155),1000);CreateCorner(b,12)
        
        local E=CreateLabel(b,nil,e,currentTheme.Text,18,currentFont,UDim2.new(0,310,0,24),UDim2.new(0,15,0,10),1001)
        local T=CreateFrame(b,nil,currentTheme.Border,0,UDim2.new(0,310,0,1),UDim2.new(0,15,0,38),1001)
        local A=CreateLabel(b,nil,"Custom Color",currentTheme.Text,12,currentFont,UDim2.new(0,100,0,18),UDim2.new(0,15,0,48),1001)
        local S=CreateFrame(b,nil,Color3.new(1,1,1),0,UDim2.new(0,310,0,16),UDim2.new(0,15,0,70),1001);CreateCorner(S,8)
        local R=Instance.new("UIGradient");R.Color=ColorSequence.new({ColorSequenceKeypoint.new(0,Color3.fromRGB(255,0,0)),ColorSequenceKeypoint.new(0.17,Color3.fromRGB(255,255,0)),ColorSequenceKeypoint.new(0.33,Color3.fromRGB(0,255,0)),ColorSequenceKeypoint.new(0.5,Color3.fromRGB(0,255,255)),ColorSequenceKeypoint.new(0.67,Color3.fromRGB(0,0,255)),ColorSequenceKeypoint.new(0.83,Color3.fromRGB(255,0,255)),ColorSequenceKeypoint.new(1,Color3.fromRGB(255,0,0))});R.Parent=S
        local N=CreateFrame(b,nil,Color3.new(1,1,1),0,UDim2.new(0,8,0,18),UDim2.new(0,0,0,69),1005);N.BorderSizePixel=2;N.BorderColor3=Color3.fromRGB(40,40,40);CreateCorner(N,4)
        local O=Color3.new(p.R,p.G,p.B)
        local I={};local C={};local V={};local P={};local H={};local G=false;local F={false,false,false}
        local M=100;local U=80
        local W={{"R",Color3.fromRGB(255,0,0)},{"G",Color3.fromRGB(0,255,0)},{"B",Color3.fromRGB(0,0,255)}}
        
        for X=1,3 do
            local Y=15+(X-1)*105
            local Z=CreateFrame(b,nil,currentTheme.Tertiary,0,UDim2.new(0,90,0,55),UDim2.new(0,Y,0,M),1001);CreateCorner(Z,6)
            P[X]=CreateLabel(Z,nil,W[X][1]..": 0",currentTheme.Text,12,currentFont,UDim2.new(0,80,0,16),UDim2.new(0,5,0,2),1002)
            I[X]=CreateTextButton(Z,nil,UDim2.new(0,80,0,10),UDim2.new(0,5,0,22),1002);I[X].BackgroundColor3=currentTheme.Secondary;I[X].Text=" ";CreateCorner(I[X],5)
            C[X]=CreateFrame(I[X],nil,W[X][2],0,UDim2.new(0,0,1,0),nil,1003);CreateCorner(C[X],5)
            V[X]=CreateFrame(b,nil,Color3.new(1,1,1),0,UDim2.new(0,14,0,18),UDim2.new(0,0,0,0),1006);V[X].BorderSizePixel=2;V[X].BorderColor3=Color3.fromRGB(40,40,40);CreateCorner(V[X],7)
            H[X]=Instance.new("TextBox");H[X].Parent=Z;H[X].BackgroundColor3=currentTheme.Secondary;H[X].BorderSizePixel=0;H[X].Position=UDim2.new(0,5,0,34);H[X].Size=UDim2.new(0,80,0,18);H[X].Font=currentFont;H[X].TextSize=11;H[X].TextColor3=currentTheme.Text;H[X].ZIndex=1002;CreateCorner(H[X],4)
        end
        
        local X=CreateLabel(b,nil,"Preview",currentTheme.Text,12,currentFont,UDim2.new(0,60,0,20),UDim2.new(0,15,0,168),1001)
        local Y=CreateFrame(b,nil,currentTheme.Tertiary,0,UDim2.new(0,100,0,40),UDim2.new(0,15,0,190),1001);CreateCorner(Y,6)
        local Z=CreateFrame(Y,nil,O,0,UDim2.new(0,90,0,30),UDim2.new(0,5,0,5),1002);CreateCorner(Z,4)
        local Q=Instance.new("TextBox");Q.Parent=b;Q.BackgroundColor3=currentTheme.Secondary;Q.BorderSizePixel=0;Q.Position=UDim2.new(0,125,0,190);Q.Size=UDim2.new(0,200,0,40);Q.Font=currentFont;Q.TextSize=14;Q.TextColor3=currentTheme.Text;Q.ZIndex=1002;CreateCorner(Q,6)
        local J=CreateTextButton(b,nil,UDim2.new(0,150,0,32),UDim2.new(0,15,0,250),1010);J.Text="Confirm";J.TextColor3=Color3.new(1,1,1);J.BackgroundColor3=currentTheme.Accent;CreateCorner(J,8)
        local K=Instance.new("UIGradient");K.Rotation=90;K.Color=ColorSequence.new({ColorSequenceKeypoint.new(0,currentTheme.Accent),ColorSequenceKeypoint.new(1,currentTheme.AccentGradient)});K.Parent=J
        local ee=CreateTextButton(b,nil,UDim2.new(0,150,0,32),UDim2.new(0,175,0,250),1010);ee.Text="Cancel";ee.TextColor3=currentTheme.Text;ee.BackgroundColor3=currentTheme.Tertiary;CreateCorner(ee,8)
        
        local function B(e) N.Position=UDim2.new(0,(e*310)-4,0,69) end
        local function te()
            Z.BackgroundColor3=O;local e=Color3.toHSV(O);B(e)
            local t={math.floor(O.R*255),math.floor(O.G*255),math.floor(O.B*255)}
            for n=1,3 do local o=t[n]/255;C[n].Size=UDim2.new(o,0,1,0)
                local r=I[n].AbsolutePosition;local s=I[n].AbsoluteSize
                V[n].Position=UDim2.new(0,r.X-b.AbsolutePosition.X+(o*s.X)-7,0,r.Y-b.AbsolutePosition.Y-4)
                P[n].Text=W[n][1]..":  "..t[n];H[n].Text=tostring(t[n])
            end
            Q.Text=string.format("#%02X%02X%02X",t[1],t[2],t[3])
        end
        local function ne(e) local t=e.Position.X-S.AbsolutePosition.X;local n=math.clamp(t/S.AbsoluteSize.X,0,1);O=Color3.fromHSV(n,1,1);te() end
        local function oe(e,t)
            local n=t.Position.X-I[e].AbsolutePosition.X;local o=math.clamp(n/I[e].AbsoluteSize.X,0,1)
            if e==1 then O=Color3.new(o,O.G,O.B)elseif e==2 then O=Color3.new(O.R,o,O.B)else O=Color3.new(O.R,O.G,o)end;te()
        end
        
        table.insert(k,S.InputBegan:Connect(function(e) if e.UserInputType==Enum.UserInputType.MouseButton1 or e.UserInputType==Enum.UserInputType.Touch then if getgenv().ABC3728 then return end G=true;getgenv().ABC3728="ColorPicker";ne(e) end end))
        table.insert(k,N.InputBegan:Connect(function(e) if e.UserInputType==Enum.UserInputType.MouseButton1 or e.UserInputType==Enum.UserInputType.Touch then if getgenv().ABC3728 then return end G=true;getgenv().ABC3728="ColorPicker";ne(e) end end))
        for e=1,3 do
            table.insert(k,I[e].InputBegan:Connect(function(t) if t.UserInputType==Enum.UserInputType.MouseButton1 or t.UserInputType==Enum.UserInputType.Touch then if getgenv().ABC3728 then return end F[e]=true;getgenv().ABC3728="ColorPicker";oe(e,t) end end))
            table.insert(k,V[e].InputBegan:Connect(function(t) if t.UserInputType==Enum.UserInputType.MouseButton1 or t.UserInputType==Enum.UserInputType.Touch then if getgenv().ABC3728 then return end F[e]=true;getgenv().ABC3728="ColorPicker";oe(e,t) end end))
            table.insert(k,H[e].FocusLost:Connect(function() local t=tonumber(H[e].Text);if t then t=math.clamp(t,0,255)/255 if e==1 then O=Color3.new(t,O.G,O.B)elseif e==2 then O=Color3.new(O.R,t,O.B)else O=Color3.new(O.R,O.G,t)end;te()end end))
        end
        table.insert(k,Q.FocusLost:Connect(function() local e=Q.Text:gsub("#","");if#e==6 then local t=tonumber(e:sub(1,2),16);local n=tonumber(e:sub(3,4),16);local o=tonumber(e:sub(5,6),16);if t and n and o then O=Color3.fromRGB(t,n,o);te()end end end))
        table.insert(k,UserInputService.InputChanged:Connect(function(e) if e.UserInputType==Enum.UserInputType.MouseMovement or e.UserInputType==Enum.UserInputType.Touch then if G then ne(e)end;for t=1,3 do if F[t]then oe(t,e)end end end end))
        table.insert(k,UserInputService.InputEnded:Connect(function(e) if e.UserInputType==Enum.UserInputType.MouseButton1 or e.UserInputType==Enum.UserInputType.Touch then G=false;for t=1,3 do F[t]=false end;if getgenv().ABC3728=="ColorPicker"then getgenv().ABC3728=nil end end end))
        table.insert(k,J.MouseButton1Click:Connect(function()p=O;f.BackgroundColor3=p;if o then task.spawn(o,p)end;ClosePopup()end))
        table.insert(k,ee.MouseButton1Click:Connect(ClosePopup))
        table.insert(k,g.InputBegan:Connect(function(e) if e.UserInputType==Enum.UserInputType.MouseButton1 or e.UserInputType==Enum.UserInputType.Touch then local t=Vector2.new(e.Position.X,e.Position.Y) local n=b.AbsolutePosition;local i=b.AbsoluteSize if t.X<n.X or t.X>n.X+i.X or t.Y<n.Y or t.Y>n.Y+i.Y then ClosePopup()end end end))
        
        w=RunService.Heartbeat:Connect(function()
            if not b or not b.Parent then return end
            b.BackgroundColor3=currentTheme.Main;E.TextColor3=currentTheme.Text;T.BackgroundColor3=currentTheme.Border;A.TextColor3=currentTheme.Text;X.TextColor3=currentTheme.Text;Y.BackgroundColor3=currentTheme.Tertiary;Q.BackgroundColor3=currentTheme.Secondary;Q.TextColor3=currentTheme.Text;ee.BackgroundColor3=currentTheme.Tertiary;ee.TextColor3=currentTheme.Text;J.BackgroundColor3=currentTheme.Accent
            K.Color=ColorSequence.new({ColorSequenceKeypoint.new(0,currentTheme.Accent),ColorSequenceKeypoint.new(1,currentTheme.AccentGradient)})
            for e=1,3 do P[e].TextColor3=currentTheme.Text;H[e].BackgroundColor3=currentTheme.Secondary;H[e].TextColor3=currentTheme.Text;I[e].BackgroundColor3=currentTheme.Secondary end
        end)
        TweenService:Create(g,TweenInfo.new(0.25),{BackgroundTransparency=0.5}):Play();te()
    end
    
registerThemeUpdate(function()
    a.BackgroundColor3=currentTheme.Tertiary
    d.BackgroundColor3=currentTheme.Border
    h.BackgroundColor3=currentTheme.Secondary
    m.TextColor3=currentTheme.Text
    if y then y.TextColor3=currentTheme.TextMuted end 
    local ratio = currentWindowSize or 1
    local btnW = math.floor(s * ratio)
    d.Size = UDim2.new(0, btnW + 4, 0, math.floor(24 * ratio))
    h.Size = UDim2.new(0, btnW, 0, math.floor(20 * ratio))
    f.Size = UDim2.new(0, btnW - 4, 1, -4)
end)
    
    h.MouseButton1Click:Connect(OpenPopup)
    d.InputBegan:Connect(function(e)if e.UserInputType==Enum.UserInputType.MouseButton1 or e.UserInputType==Enum.UserInputType.Touch then OpenPopup()end end)
    SectionFrame.CanvasSize=UDim2.new(0,0,0,SectionLayout.AbsoluteContentSize.Y+35)
    return{SetColor=function(_,e)p=e;f.BackgroundColor3=e;if o then task.spawn(o,e)end end,GetColor=function()return p end,Frame=a}
end
function Section:Bind(e,t,n,o)
    if type(t)=="userdata"and typeof(t)=="EnumItem"then o=n;n=t;t=nil
    elseif type(t)=="function"then o=t;t=nil;n=nil
    elseif type(n)=="function"then
        if type(t)=="string"then o=n;n=nil
        else o=n;n=t;t=nil end
    end
    local i=type(n)=="userdata"and typeof(n)=="EnumItem"and n or Enum.KeyCode.Unknown
    local s=32
    if t and type(t)=="string"then s=32+MeasureDescH(t,12,340)+12 end
    local r=CreateFrame(SectionFrame,ENC_PREFIX.Bind_..XorEncode(e),currentTheme.Tertiary,0,UDim2.new(0,370,0,s),nil,6);CreateCorner(r,6)
    local a=CreateLabel(r,ENC.BindTitle,e,currentTheme.Text,14,currentFont,UDim2.new(0,240,0,20),UDim2.new(0,10,0,t and 5 or 8),7);a.TextYAlignment=Enum.TextYAlignment.Center;a.TextTruncate=Enum.TextTruncate.AtEnd;a.ClipsDescendants=true
    local c=CreateFrame(r,ENC.BindButtonBorder,currentTheme.Border,0,UDim2.new(0,104,0,24),UDim2.new(0,256,0,t and 4 or 5),7);CreateCorner(c,5)
    local d=CreateTextButton(c,ENC.BindButton,UDim2.new(0,100,0,20),UDim2.new(0,2,0,2),8);d.BackgroundColor3=currentTheme.Secondary;d.Text=tostring(i):gsub("Enum.KeyCode.","");d.TextColor3=currentTheme.TextMuted;d.TextSize=13;d.AutoButtonColor=false
    local h
    if t and type(t)=="string"then h=CreateLabel(r,ENC.BindDesc,t,currentTheme.TextMuted,12,currentFont,UDim2.new(0,350,0,18),UDim2.new(0,10,0,28),7);h.TextWrapped=true;h.RichText=true;h.AutomaticSize=Enum.AutomaticSize.Y;h.ClipsDescendants=true end
    local u=false;local p=false;local f=i
    local m=function()
        if not r or not r.Parent then
            for B,A in ipairs(ThemeUpdateConnections)do if A==m then table.remove(ThemeUpdateConnections,B);break end end
            return
        end
        r.BackgroundColor3=currentTheme.Tertiary;a.TextColor3=currentTheme.Text
        c.BackgroundColor3=currentTheme.Border;d.BackgroundColor3=currentTheme.Secondary;d.TextColor3=currentTheme.TextMuted
        if h then h.TextColor3=currentTheme.TextMuted end
    end
    table.insert(ThemeUpdateConnections,m)
    local y=function()
        if u then return end;u=true;d.Text="..."
        local el=UserInputService.InputBegan:Connect(function(t)
            if t.UserInputType==Enum.UserInputType.Keyboard then
                f=t.KeyCode;d.Text=tostring(f):gsub("Enum.KeyCode.","")
                if o then task.spawn(o,f)end
                el:Disconnect();u=false
            end
        end)
        task.delay(10,function()if u then el:Disconnect();u=false;d.Text=tostring(f):gsub("Enum.KeyCode.","")end end)
    end
    d.MouseButton1Click:Connect(function()
        if minimizeAnimating or u then return end
        if getgenv().ABC8281 or getgenv().ABC3616 then return end
        if getgenv().ABC3728 then return end
        if p then return end;p=true
        TweenService:Create(d,TweenInfo.new(0.1),{BackgroundColor3=currentTheme.Hover}):Play()
        task.delay(0.1,function()p=false;if d and d.Parent then TweenService:Create(d,TweenInfo.new(0.1),{BackgroundColor3=currentTheme.Secondary}):Play()end end)
        y()
    end)
    SectionFrame.CanvasSize=UDim2.new(0,0,0,SectionLayout.AbsoluteContentSize.Y+35)
    return{
        SetBind=function(_,el)f=el;d.Text=tostring(f):gsub("Enum.KeyCode.","");if o then o(f)end end,
        GetBind=function()return f end,
        Frame=r
    }
end
function Section:ToggleTextbox(e, t, n, o, i, s, r)
    if type(e) ~= "boolean" then
        r = s; s = i; i = o; o = n; n = t; t = e; e = false
    end
    if type(t) ~= "string" then t = "ToggleTextbox" end
    if type(n) == "function" then
        r = n; n = nil; o = ""; i = nil; s = ""
    elseif type(o) == "function" then
        r = o; o = ""; i = nil; s = ""
    elseif type(i) == "function" then
        r = i; i = nil; s = ""
    elseif type(s) == "function" then
        r = s; s = ""
    end
    local VALID_TYPES = {
        ["number"] = true, ["numbers"] = true,
        ["integer"] = true, ["int"] = true,
        ["float"] = true,
        ["letter"] = true, ["letters"] = true,
        ["alphanumeric"] = true, ["alphanum"] = true
    }
    if type(n) == "string" and VALID_TYPES[string.lower(n)] then
        local newCb  = (type(s) == "function" and s) or (type(r) == "function" and r)
        local newDef = (type(i) == "string" and i) or ""
        local newPh  = (type(o) == "string" and o) or ""
        local newTy  = n
        n = nil
        o = newPh
        i = newTy
        s = newDef
        r = newCb
    end
    if type(n) ~= "string" or n == "" then n = nil end
    if type(o) ~= "string" then o = "" end
    if type(s) ~= "string" then s = tostring(s or "") end
    if type(i) == "string" then
        local lower = string.lower(i)
        if VALID_TYPES[lower] then i = lower else i = nil end
    else
        i = nil
    end
    if type(r) ~= "function" then r = nil end
    local function ApplyFilter(text, filterType)
        if type(text) ~= "string" then text = tostring(text or "") end
        if not filterType then return text end
        local ft = string.lower(filterType)

        if ft == "number" or ft == "numbers" or ft == "float" then
            local cleaned = text:gsub("[^%d%.%-]", "")
            local out, hasDot = "", false
            for ci = 1, #cleaned do
                local ch = cleaned:sub(ci, ci)
                if ch == "-" then
                    if ci == 1 then out = out .. "-" end
                elseif ch == "." then
                    if not hasDot then hasDot = true; out = out .. "." end
                else
                    out = out .. ch
                end
            end
            return out
        elseif ft == "integer" or ft == "int" then
            local cleaned = text:gsub("[^%d%-]", "")
            local out = ""
            for ci = 1, #cleaned do
                local ch = cleaned:sub(ci, ci)
                if ch == "-" then
                    if ci == 1 then out = out .. "-" end
                else
                    out = out .. ch
                end
            end
            return out
        elseif ft == "letter" or ft == "letters" then
            return text:gsub("[^%a]", "")
        elseif ft == "alphanumeric" or ft == "alphanum" then
            return text:gsub("[^%w]", "")
        end
        return text
    end
    local hasDesc = n ~= nil
    local frameH = hasDesc and 86 or 66
    local h = CreateFrame(
        SectionFrame,
        ENC_PREFIX.ToggleTextbox_ .. XorEncode(t),
        currentTheme.Tertiary, 0,
        UDim2.new(1, -16, 0, frameH),
        nil, 6
    )
    CreateCorner(h, 6)
    local u = CreateLabel(h, ENC.TTBTitle, t, currentTheme.Text, 14, currentFont,
        UDim2.new(1, -70, 0, 20), UDim2.new(0, 10, 0, 5), 7)
    u.TextYAlignment = Enum.TextYAlignment.Center
    local p
    if hasDesc then
        p = CreateLabel(h, ENC.TTBDesc, n, currentTheme.TextMuted, 12, currentFont,
            UDim2.new(1, -20, 0, 16), UDim2.new(0, 10, 0, 24), 7)
        p.TextWrapped = true
        p.RichText = true
    end
    local f = 5
    local m = CreateFrame(h, ENC.TC, currentTheme.Secondary, 0,
        UDim2.new(0, 46, 0, 26), UDim2.new(1, -10, 0, f), 7)
    m.AnchorPoint = Vector2.new(1, 0)
    m.BorderSizePixel = 1
    m.BorderColor3 = currentTheme.Border
    m.ClipsDescendants = true
    CreateCorner(m, 13)
    local y = CreateFrame(m, ENC.TF, currentTheme.Accent, 0,
        UDim2.new(0, 0, 1, 0), UDim2.new(0, 0, 0, 0), 8)
    y.ClipsDescendants = true
    CreateCorner(y, 13)
    local v = Instance.new("UIGradient")
    v.Rotation = 90
    v.Color = ColorSequence.new({
        ColorSequenceKeypoint.new(0, currentTheme.Accent),
        ColorSequenceKeypoint.new(1, currentTheme.AccentGradient)
    })
    v.Parent = y
    local b = CreateFrame(m, ENC.TCircle, currentTheme.Text, 0,
        UDim2.new(0, 18, 0, 18), UDim2.new(0, 3, 0.5, -9), 9)
    CreateCorner(b, 9)
    local inputY = hasDesc and 48 or 32
    local k = Instance.new("TextBox")
    k.Name = XorEncode("Textbox")
    k.Parent = h
    k.BackgroundColor3 = currentTheme.Secondary
    k.BorderSizePixel = 0
    k.Size = UDim2.new(1, -28, 0, 28)
    k.Position = UDim2.new(0, 8, 0, inputY)
    k.Font = currentFont
    k.Text = ApplyFilter(s, i) 
    k.TextColor3 = currentTheme.Text
    k.PlaceholderText = o
    k.PlaceholderColor3 = currentTheme.TextMuted
    k.TextSize = 14
    k.ClearTextOnFocus = false
    k.ZIndex = 8
    k.TextXAlignment = Enum.TextXAlignment.Center
    k.TextYAlignment = Enum.TextYAlignment.Center
    CreateCorner(k, 6)
    local enabledState = e and true or false
    local animating = false
    local lastValid = k.Text
    local function fireCallback()
        if r then
            task.spawn(function()
                pcall(r, k.Text, enabledState)
            end)
        end
    end
    local function applyVisual(instant)
        local bgC = enabledState and currentTheme.Accent or currentTheme.Secondary
        local fillS = enabledState and UDim2.new(1, 0, 1, 0) or UDim2.new(0, 0, 1, 0)
        local circleP = enabledState and UDim2.new(1, -21, 0.5, -9) or UDim2.new(0, 3, 0.5, -9)
        if instant then
            m.BackgroundColor3 = bgC
            y.Size = fillS
            b.Position = circleP
        else
            TweenService:Create(m, TweenInfo.new(0.25, Enum.EasingStyle.Quad, Enum.EasingDirection.Out),
                {BackgroundColor3 = bgC}):Play()
            TweenService:Create(y, TweenInfo.new(0.3, Enum.EasingStyle.Back),
                {Size = fillS}):Play()
            TweenService:Create(b, TweenInfo.new(0.3, Enum.EasingStyle.Back),
                {Position = circleP}):Play()
        end
    end
    local function doToggle()
        if animating then return end
        animating = true
        enabledState = not enabledState
        applyVisual(false)
        task.delay(0.35, function() animating = false end)
        fireCallback()
    end
    local function doSet(state, silent)
        state = state and true or false
        if state == enabledState then return end
        enabledState = state
        applyVisual(true)
        if not silent then fireCallback() end
    end
    m.InputBegan:Connect(function(input)
        if minimizeAnimating then return end
        if input.UserInputType == Enum.UserInputType.MouseButton1
        or input.UserInputType == Enum.UserInputType.Touch then
            doToggle()
        end
    end)
    k.FocusLost:Connect(function()
        lastValid = k.Text
    end)
    k:GetPropertyChangedSignal("Text"):Connect(function()
        local filtered = ApplyFilter(k.Text, i)
        if filtered ~= k.Text then
            local cursor = k.CursorPosition
            k.Text = filtered
            pcall(function()
                k.CursorPosition = math.min(cursor - 1, #k.Text + 1)
            end)
        end
    end)
    local function applyTheme()
        local currentW = h.AbsoluteSize.X
        if currentW <= 0 then return end
        if p then p.Size = UDim2.new(1, -20, 0, 16) end
        u.Size = UDim2.new(1, -70, 0, 20)
        h.BackgroundColor3 = currentTheme.Tertiary
        u.TextColor3 = currentTheme.Text
        if p then p.TextColor3 = currentTheme.TextMuted end
        m.BorderColor3 = currentTheme.Border
        v.Color = ColorSequence.new({
            ColorSequenceKeypoint.new(0, currentTheme.Accent),
            ColorSequenceKeypoint.new(1, currentTheme.AccentGradient)
        })
        b.BackgroundColor3 = currentTheme.Text
        k.BackgroundColor3 = currentTheme.Secondary
        k.TextColor3 = currentTheme.Text
        k.PlaceholderColor3 = currentTheme.TextMuted
        if not animating then applyVisual(true) end
    end
    table.insert(ThemeUpdateConnections, applyTheme)
    local parentFrame = SectionFrame.Parent
    if parentFrame and parentFrame:IsA("Frame") then
        parentFrame:GetPropertyChangedSignal("AbsoluteSize"):Connect(applyTheme)
    end
    SectionFrame.CanvasSize = UDim2.new(0, 0, 0, SectionLayout.AbsoluteContentSize.Y + 35)
    applyTheme()
    applyVisual(true)
    local API = {
        ToggleFrame = h,
        Textbox = k,
    }
    function API:SetText(text)
        local tt = ApplyFilter(tostring(text or ""), i)
        k.Text = tt
        lastValid = tt
        return self
    end
    function API:GetText()
        return k.Text
    end
    function API:SetValue(value)
        doSet(value, false)
        return self
    end
    function API:GetValue()
        return enabledState
    end
    function API:SetState(value)
        doSet(value, false)
        return self
    end
    function API:GetState()
        return enabledState
    end
    function API:SetEnabled(value)
        doSet(value, false)
        return self
    end
    function API:IsEnabled()
        return enabledState
    end
    function API:SetFilter(filterType)
        if type(filterType) == "string" then
            local lower = string.lower(filterType)
            if VALID_TYPES[lower] then
                i = lower
                k.Text = ApplyFilter(k.Text, i)
            end
        else
            i = nil
        end
        return self
    end
    function API:GetFilter()
        return i
    end
    function API:SetPlaceholder(text)
        k.PlaceholderText = tostring(text or "")
        return self
    end
    function API:SetTitle(text)
        u.Text = tostring(text or "")
        return self
    end
    function API:SetDescription(text)
        if p then p.Text = tostring(text or "") end
        return self
    end
    function API:TextboxXP(fn)
        if type(fn) == "function" then
            k.FocusLost:Connect(function(enterPressed)
                if enterPressed then
                    task.spawn(function() pcall(fn, k.Text) end)
                end
            end)
        end
        return self
    end
    function API:Destroy()
        h:Destroy()
    end
    return API
end
        function Section:Textbox(e,t,n,o,i)
            if type(t)=="string"and type(n)=="string"then
            elseif type(t)=="string"and type(n)~="string"then
                i=i or(type(o)=="function"and o or nil)
                o=type(n)=="boolean"and n or false
                n=t;t=nil
            else t=nil end
            if type(o)=="function"then i=o;o=false end
            n=type(n)=="string"and n or""
            o=type(o)=="boolean"and o or false
            i=type(i)=="function"and i or function()end
            local s=game:GetService("TextService")
            local r=370;local a=10;local l=18;local c=6;local d=11;local h=24;local u=4;local p=0
            local f=type(t)=="string"and t~=""
            local m=0
            if f then
                local el=s:GetTextSize(t,d,currentFont,Vector2.new(r-a*2-20,math.huge))
                m=el.Y
            end
            local y=c;local v=y+l+u;local b
            if f then b=v+m+u else b=y+l+u end
            local g=b+h+c
            local k=CreateFrame(SectionFrame,ENC_PREFIX.Textbox_..XorEncode(e),currentTheme.Tertiary,0,UDim2.new(1,-p,0,g),nil,6)
            k.Size=UDim2.new(1,-p,0,g)
            CreateCorner(k,6)
            local w=CreateLabel(k,ENC.TextboxTitle,e,currentTheme.Text,13,currentFont,UDim2.new(1,-a*2-20,0,l),UDim2.new(0,a,0,y),8)
            local _
            if f then
                _=CreateLabel(k,ENC.TextboxDesc,t,currentTheme.TextMuted,d,currentFont,UDim2.new(1,-a*2-20,0,m),UDim2.new(0,a,0,v),8)
                _.TextWrapped=true;_.RichText=true;_.Size=UDim2.new(1,-a*2-20,0,m)
            end
            local D=Instance.new("TextBox")
            D.Name=XorEncode("Textbox");D.Parent=k;D.BackgroundColor3=currentTheme.Secondary;D.BorderSizePixel=0
            D.Size=UDim2.new(1,-a*2,0,h);D.Position=UDim2.new(0,a,0,b);D.Font=currentFont
            D.Text="";D.TextColor3=currentTheme.Text;D.PlaceholderColor3=currentTheme.TextMuted
            D.PlaceholderText=n;D.TextSize=12;D.ClearTextOnFocus=false;D.ZIndex=8
            CreateCorner(D,4)
            local L=Instance.new("UIPadding");L.Parent=D;L.PaddingLeft=UDim.new(0,6)
            local function E()
                local el=m
                if f and _ then
                    local t=s:GetTextSize(_.Text,_.TextSize,_.Font,Vector2.new(_.AbsoluteSize.X,math.huge))
                    el=t.Y;_.Size=UDim2.new(1,-a*2-20,0,el)
                end
                local t
                if f then t=v+el+u else t=y+l+u end
                D.Position=UDim2.new(0,a,0,t)
                local n=t+h+c;k.Size=UDim2.new(1,-p,0,n)
                SectionFrame.CanvasSize=UDim2.new(0,0,0,SectionLayout.AbsoluteContentSize.Y+35)
            end
            if f and _ then _:GetPropertyChangedSignal("AbsoluteSize"):Connect(E)end
            registerThemeUpdate(function()
                k.BackgroundColor3=currentTheme.Tertiary;w.TextColor3=currentTheme.Text
                if _ then _.TextColor3=currentTheme.TextMuted end
                D.BackgroundColor3=currentTheme.Secondary;D.TextColor3=currentTheme.Text;D.PlaceholderColor3=currentTheme.TextMuted;E()
            end)
            if o then
                D:GetPropertyChangedSignal("Text"):Connect(function()
                    local el=D.Text:gsub("[^%d%-]","")
                    local t=0;local n=""
                    for o=1,#el do
                        local i=el:sub(o,o)
                        if i=="-"then t=t+1;if t==1 and o==1 then n=n..i end
                        else n=n..i end
                    end
                    if n~=D.Text then local el=D.CursorPosition;D.Text=n;D.CursorPosition=math.min(el,#D.Text+1)end
                end)
            end
            D.Focused:Connect(function()TweenService:Create(D,TweenInfo.new(0.15),{BackgroundColor3=currentTheme.Hover:Lerp(currentTheme.Secondary,0.95)}):Play()end)
            D.FocusLost:Connect(function(el)
                TweenService:Create(D,TweenInfo.new(0.15),{BackgroundColor3=currentTheme.Secondary}):Play()
                if el then i(D.Text)end
            end)
            E()
            return{SetText=function(_,el)D.Text=tostring(el or"")end,GetText=function()return D.Text end,SetVisible=function(_,el)k.Visible=el;E()end,Destroy=function()k:Destroy();SectionFrame.CanvasSize=UDim2.new(0,0,0,SectionLayout.AbsoluteContentSize.Y+35)end}
        end
        function Section:Slider(text, desc, min, max, default, callback)
            if type(desc) == "number" then callback = default; default = max; max = min; min = desc; desc = nil end
            local bh = 70
            local descMeasured = 0
            if desc then descMeasured = MeasureDescH(desc, 12, 340); bh = 70 + descMeasured + 15 end
            local SF = CreateFrame(SectionFrame, ENC_PREFIX.Slider_ .. XorEncode(text), currentTheme.Tertiary, 0, UDim2.new(0, 370, 0, bh), nil, 6); CreateCorner(SF, 6)
            local STitle = CreateLabel(SF, ENC.STitle, text, currentTheme.Text, 14, currentFont, UDim2.new(0, 250, 0, 18), UDim2.new(0, 10, 0, 8), 7); STitle.TextYAlignment = Enum.TextYAlignment.Center
            local VL = CreateLabel(SF, ENC.SVal, tostring(default), currentTheme.Accent, 14, currentFont, UDim2.new(0, 50, 0, 18), UDim2.new(0, 300, 0, 8), 7); VL.TextXAlignment = Enum.TextXAlignment.Right; VL.TextYAlignment = Enum.TextYAlignment.Center
            local DL
            if desc then DL = CreateLabel(SF, ENC.SDesc, desc, currentTheme.TextMuted, 12, currentFont, UDim2.new(0, 340, 0, 18), UDim2.new(0, 10, 0, 28), 7); DL.TextWrapped = true; DL.RichText = true; DL.AutomaticSize = Enum.AutomaticSize.Y end
            local by = desc and (descMeasured + 42) or 50
            local SB = CreateFrame(SF, ENC.SB, currentTheme.Secondary, 0, UDim2.new(0, 350, 0, 10), UDim2.new(0, 10, 0, by), 7); CreateCorner(SB, 5); SB.ClipsDescendants = false
            local SFL = CreateFrame(SB, ENC.SFL, currentTheme.Accent, 0, UDim2.new((default-min)/(max-min), 0, 1, 0), nil, 8)
            local SFG = Instance.new("UIGradient"); SFG.Color = ColorSequence.new({ColorSequenceKeypoint.new(0,currentTheme.Accent),ColorSequenceKeypoint.new(1,currentTheme.AccentGradient)}); SFG.Parent = SFL; SFG.Name = ENC.SFG; CreateCorner(SFL, 5)
            local bs = 16
            local SBtn = CreateTextButton(SF, ENC.SBtn, UDim2.new(0, bs, 0, bs), UDim2.new(0, 0, 0, 0), 10)
            SBtn.BackgroundColor3 = Color3.fromRGB(255,255,255); SBtn.Text = ""; CreateCorner(SBtn, 8); SBtn.ZIndex = 10
            local function updateButtonPosition()
                if not SBtn or not SBtn.Parent then return end
                local percent = SFL.Size.X.Scale
                local sbWidth = SB.Size.X.Offset
                local minPos = 10 - bs/2 + 2
                local maxPos = 10 + sbWidth - bs/2 - 2
                pcall(function()
                    SBtn.Position = UDim2.new(0, math.clamp(10 + percent * sbWidth - bs/2, minPos, maxPos), 0, by-3)
                end)
            end
            updateButtonPosition()
            registerThemeUpdate(function() 
                SF.BackgroundColor3 = currentTheme.Tertiary; STitle.TextColor3 = currentTheme.Text; VL.TextColor3 = currentTheme.Accent; 
                if DL then DL.TextColor3 = currentTheme.TextMuted end; SB.BackgroundColor3 = currentTheme.Secondary; 
                SFG.Color = ColorSequence.new({ColorSequenceKeypoint.new(0,currentTheme.Accent),ColorSequenceKeypoint.new(1,currentTheme.AccentGradient)}) 
            end)
            local val = default; local dragging = false; local sliderId = "Slider_" .. tostring({})
            local function updateSlider(input) 
                if minimizeAnimating then return end
                if not SB or not SB.Parent then return end
                if getgenv().ABC3728 and getgenv().ABC3728 ~= sliderId then return end
                local percent = math.clamp((input.Position.X - SB.AbsolutePosition.X) / SB.AbsoluteSize.X, 0, 1)
                val = math.floor((min + (max-min)*percent)*100)/100
                VL.Text = tostring(val)
                SFL.Size = UDim2.new(percent, 0, 1, 0)
                updateButtonPosition()
                if callback then callback(val) end
            end
            SB.InputBegan:Connect(function(i) 
                if i.UserInputType == Enum.UserInputType.MouseButton1 or i.UserInputType == Enum.UserInputType.Touch then 
                    if getgenv().ABC3728 then return end; getgenv().ABC3728 = sliderId; dragging = true; updateSlider(i) 
                end 
            end)
            SBtn.InputBegan:Connect(function(i) 
                if i.UserInputType == Enum.UserInputType.MouseButton1 or i.UserInputType == Enum.UserInputType.Touch then 
                    if getgenv().ABC3728 then return end; getgenv().ABC3728 = sliderId; dragging = true; updateSlider(i) 
                end 
            end)
            UserInputService.InputChanged:Connect(function(i) 
                if dragging and (i.UserInputType == Enum.UserInputType.MouseMovement or i.UserInputType == Enum.UserInputType.Touch) then 
                    updateSlider(i) 
                end 
            end)
            UserInputService.InputEnded:Connect(function(i) 
                if i.UserInputType == Enum.UserInputType.MouseButton1 or i.UserInputType == Enum.UserInputType.Touch then 
                    if dragging then dragging = false; getgenv().ABC3728 = nil end 
                end 
            end)
            local sizeConnection
            sizeConnection = SF:GetPropertyChangedSignal("AbsoluteSize"):Connect(function()
                updateButtonPosition()
            end)
            SectionFrame.CanvasSize = UDim2.new(0, 0, 0, SectionLayout.AbsoluteContentSize.Y + 40)
            return {
                Change = function(_, nv) 
                    nv = math.clamp(nv, min, max); val = nv; 
                    local p = (val-min)/(max-min); VL.Text = tostring(math.floor(val*100)/100); 
                    SFL.Size = UDim2.new(p,0,1,0); 
                    updateButtonPosition(); 
                    if callback then callback(val) end 
                end, 
                GetValue = function(_) return val end,
                Destroy = function(_)
                    if sizeConnection then sizeConnection:Disconnect() end
                    SF:Destroy()
                end
            }
        end
function Section:ToggleSlider(e,t,n,o,i,s,r)
    if type(o)=="function"then r=o;o=i;i=n;n=e;e=false
    elseif type(i)=="function"then r=i;i=o;o=n;n=e;e=false
    elseif type(s)=="function"then r=s;s=i;i=o;o=n;n=e;e=false
    elseif type(n)=="function"then r=n;n=o;o=i;i=200;e=false end
    local a=85
    local tsDescH=0
    if t then tsDescH=MeasureDescH(t,12,340);a=85+tsDescH+12 end
    local l=CreateFrame(SectionFrame,ENC_PREFIX.ToggleSlider_..XorEncode(e),currentTheme.Tertiary,0,UDim2.new(0,370,0,a),nil,6);CreateCorner(l,6)
    local c=CreateLabel(l,ENC.TSTitle,e,currentTheme.Text,14,currentFont,UDim2.new(0,170,0,18),UDim2.new(0,10,0,8),7);c.TextYAlignment=Enum.TextYAlignment.Center
    local d=CreateLabel(l,ENC.SV,tostring(s or i or 0),currentTheme.Accent,15,currentFont,UDim2.new(0,60,0,24),UDim2.new(0,220,0,5),7);d.TextXAlignment=Enum.TextXAlignment.Center;d.TextYAlignment=Enum.TextYAlignment.Center
    local h=CreateFrame(l,ENC.TC,currentTheme.Secondary,0,UDim2.new(0,46,0,26),UDim2.new(0,290,0,5),7);h.BorderSizePixel=1;h.BorderColor3=currentTheme.Border;CreateCorner(h,13);h.ClipsDescendants=false
    local u=CreateFrame(h,ENC.TF,currentTheme.Accent,0,UDim2.new(0,0,1,0),nil,8);CreateCorner(u,13)
    local p=Instance.new("UIGradient");p.Rotation=90;p.Color=ColorSequence.new({ColorSequenceKeypoint.new(0,currentTheme.Accent),ColorSequenceKeypoint.new(1,currentTheme.AccentGradient)});p.Parent=u
    local f=CreateFrame(h,ENC.TCircle,Color3.fromRGB(255,255,255),0,UDim2.new(0,20,0,20),UDim2.new(0,3,0.5,-10),9);CreateCorner(f,10)
    local m=CreateTextButton(h,ENC.TBtn,UDim2.new(1,0,1,0),nil,10);m.BackgroundTransparency=1;m.ZIndex=10
    local y
    if t then y=CreateLabel(l,ENC.TSDesc,t,currentTheme.TextMuted,12,currentFont,UDim2.new(0,340,0,18),UDim2.new(0,10,0,30),7);y.TextWrapped=true;y.RichText=true;y.AutomaticSize=Enum.AutomaticSize.Y end
    local v=t and (tsDescH+42) or 48
    local b=CreateFrame(l,ENC.SF,currentTheme.Secondary,0,UDim2.new(0,360,0,32),UDim2.new(0,5,0,v),6);CreateCorner(b,8)
    local g=CreateFrame(b,ENC.SB,currentTheme.Tertiary,0,UDim2.new(0,340,0,10),UDim2.new(0,10,0.5,-5),7);CreateCorner(g,5);g.ClipsDescendants=false
    local k=CreateFrame(g,ENC.SFL,currentTheme.Accent,0,UDim2.new(((s or i or 0)-(o or 0))/((i or 200)-(o or 0)),0,1,0),nil,8)
    local w=Instance.new("UIGradient");w.Color=ColorSequence.new({ColorSequenceKeypoint.new(0,currentTheme.Accent),ColorSequenceKeypoint.new(1,currentTheme.AccentGradient)});w.Parent=k;CreateCorner(k,5)
    local _=16
    local D=CreateTextButton(g,ENC.SBtn,UDim2.new(0,_,0,_),UDim2.new(0,0,0,0),10)
    D.BackgroundColor3=Color3.fromRGB(255,255,255);D.Text="";CreateCorner(D,8);D.ZIndex=10
    local function L()
        if not D or not D.Parent then return end
        local el=k.Size.X.Scale
        local t=g.Size.X.Offset
        pcall(function()D.Position=UDim2.new(0,el*t-_/2,0.5,-_/2)end)
    end
    L()
    registerThemeUpdate(function()
        l.BackgroundColor3=currentTheme.Tertiary;c.TextColor3=currentTheme.Text;d.TextColor3=currentTheme.Accent
        h.BorderColor3=currentTheme.Border
        if not O then h.BackgroundColor3=E and currentTheme.Accent or currentTheme.Secondary end
        p.Color=ColorSequence.new({ColorSequenceKeypoint.new(0,currentTheme.Accent),ColorSequenceKeypoint.new(1,currentTheme.AccentGradient)})
        if y then y.TextColor3=currentTheme.TextMuted end;b.BackgroundColor3=currentTheme.Secondary;g.BackgroundColor3=currentTheme.Tertiary
        w.Color=ColorSequence.new({ColorSequenceKeypoint.new(0,currentTheme.Accent),ColorSequenceKeypoint.new(1,currentTheme.AccentGradient)})
        task.defer(L)
    end)
    local E=n or false;local T,A=o or 0,i or 200;local S=math.clamp(s or i or T,T,A);local R=false;local N=false;local I="ToggleSlider_"..tostring({});local C=nil
    if E then u.Size=UDim2.new(1,0,1,0);h.BackgroundColor3=currentTheme.Accent;f.Position=UDim2.new(1,-23,0.5,-10)end
    local function V(el)
        if minimizeAnimating then return end
        if not g or not g.Parent then return end
        if getgenv().ABC3728 and getgenv().ABC3728~=I then return end
        local t=math.clamp((el.Position.X-g.AbsolutePosition.X)/g.AbsoluteSize.X,0,1)
        local n=math.floor((T+(A-T)*t)*100)/100
        if n~=S then
            S=n;d.Text=tostring(n);k.Size=UDim2.new(t,0,1,0);L()
            if E and r then r(E,n)end
            if E and C then C(n)end
        end
    end
    g.InputBegan:Connect(function(el)
        if el.UserInputType==Enum.UserInputType.MouseButton1 or el.UserInputType==Enum.UserInputType.Touch then
            if getgenv().ABC3728 then return end;getgenv().ABC3728=I;R=true;V(el)
        end
    end)
    D.InputBegan:Connect(function(el)
        if el.UserInputType==Enum.UserInputType.MouseButton1 or el.UserInputType==Enum.UserInputType.Touch then
            if getgenv().ABC3728 then return end;getgenv().ABC3728=I;R=true;V(el)
        end
    end)
    UserInputService.InputChanged:Connect(function(el)
        if R and(el.UserInputType==Enum.UserInputType.MouseMovement or el.UserInputType==Enum.UserInputType.Touch)then V(el)end
    end)
    UserInputService.InputEnded:Connect(function(el)
        if el.UserInputType==Enum.UserInputType.MouseButton1 or el.UserInputType==Enum.UserInputType.Touch then
            if R then R=false;getgenv().ABC3728=nil end
        end
    end)
    local O=false
    local B
    B=l:GetPropertyChangedSignal("AbsoluteSize"):Connect(function()L()end)
    local function F(el)
        if minimizeAnimating or N then return end;N=true;E=not E
        if E then
            TweenService:Create(h,TweenInfo.new(0.25),{BackgroundColor3=currentTheme.Accent}):Play()
            TweenService:Create(u,TweenInfo.new(0.3,Enum.EasingStyle.Back),{Size=UDim2.new(1,0,1,0)}):Play()
            TweenService:Create(f,TweenInfo.new(0.3,Enum.EasingStyle.Back),{Position=UDim2.new(1,-23,0.5,-10)}):Play()
            task.delay(0.35,function()N=false;L()end)
        else
            TweenService:Create(h,TweenInfo.new(0.25),{BackgroundColor3=currentTheme.Secondary}):Play()
            TweenService:Create(u,TweenInfo.new(0.25,Enum.EasingStyle.Quad,Enum.EasingDirection.In),{Size=UDim2.new(0,0,1,0)}):Play()
            TweenService:Create(f,TweenInfo.new(0.25,Enum.EasingStyle.Back),{Position=UDim2.new(0,3,0.5,-10)}):Play()
            task.delay(0.3,function()N=false;L()end)
        end
        if not el and r then r(E,S)end
        if not el and C then C(S)end
    end
    m.MouseButton1Click:Connect(function()F(false)end)
    SectionFrame.CanvasSize=UDim2.new(0,0,0,SectionLayout.AbsoluteContentSize.Y+35)
    local G={SetValue=function(_,el)
        el=math.clamp(el,T,A)
        if el~=S then S=el;local t=(S-T)/(A-T);d.Text=tostring(math.floor(S*100)/100);k.Size=UDim2.new(t,0,1,0);L()
            if E and r then r(E,S)end
            if E and C then C(S)end
        end
    end,GetValue=function(_)return S end,SetState=function(_,el,t)if el~=E then F(t or false)end end,GetState=function(_)return E end,Value=function(_)return S end,SetRange=function(_,el,t)
        T,A=el,t;S=math.clamp(S,T,A);local n=(S-T)/(A-T);d.Text=tostring(S);k.Size=UDim2.new(n,0,1,0);L()
        if E and r then r(E,S)end
        if E and C then C(S)end
    end,GetRange=function(_)return T,A end,Destroy=function(_)if B then B:Disconnect()end;l:Destroy()end,SliderXP=function(_,el)C=el;return G end}
    return G
end
        function Section:Dropdown(text, desc, options, callback)
            if type(desc) == "table" then callback = options; options = desc; desc = nil end
            local TITLE_Y, TITLE_H, GAP = 8, 16, 3
            local hasDesc = desc ~= nil and desc ~= ""
            local secW = SectionFrame.AbsoluteSize.X
            if secW <= 0 then secW = math.floor(390 * (currentWindowScaleX or 1)) end
            local descH = hasDesc and MeasureDescH(desc, DDStyle.Desc, secW - 14 - 20) or 0
            local baseH = hasDesc and (TITLE_Y + TITLE_H + GAP + descH + 10) or 34
            local DF = CreateFrame(SectionFrame, ENC_PREFIX.Dropdown_ .. XorEncode(text), currentTheme.Tertiary, 0, UDim2.new(1, -14, 0, baseH), nil, 6)
            DF.ClipsDescendants = false
            CreateCorner(DF, 6)
            local TL = CreateLabel(DF, ENC.DTitle, text .. ":", currentTheme.Text, DDStyle.Title, currentFont, UDim2.new(1, -50, 0, TITLE_H), UDim2.new(0, 10, 0, TITLE_Y), 7)
            TL.TextYAlignment = Enum.TextYAlignment.Center
            TL.TextTruncate = Enum.TextTruncate.AtEnd
            local DL
            if hasDesc then
                DL = CreateLabel(DF, ENC.DDesc, desc, currentTheme.TextMuted, DDStyle.Desc, currentFont, UDim2.new(1, -20, 0, descH), UDim2.new(0, 10, 0, TITLE_Y + TITLE_H + GAP), 7)
                DL.TextWrapped = true; DL.RichText = true
                DL.TextYAlignment = Enum.TextYAlignment.Top
                DL.AutomaticSize = Enum.AutomaticSize.Y
            end
            local DA = CreateTextButton(DF, ENC.DArrow, UDim2.new(0, 24, 0, 24), UDim2.new(1, -30, 0, 4), 7); SetChevron(DA, false); DA.BackgroundTransparency = 1
            local SB = Instance.new("TextBox"); SB.Name = ENC.SearchBox; SB.Parent = DF; SB.BackgroundColor3 = currentTheme.Secondary; SB.BorderSizePixel = 0
            SB.Position = UDim2.new(0, 5, 0, baseH); SB.Size = UDim2.new(1, -10, 0, 24); SB.Font = currentFont; SB.PlaceholderText = "Search..."; SB.Text = ""; SB.TextColor3 = currentTheme.Text; SB.PlaceholderColor3 = currentTheme.TextMuted; SB.TextSize = 12; SB.Visible = false; SB.ZIndex = 9; CreateCorner(SB, 5)
            local DLF = Instance.new("ScrollingFrame"); DLF.Name = ENC.DropdownList; DLF.Parent = DF; DLF.BackgroundColor3 = currentTheme.Secondary
            DLF.BorderSizePixel = 1; DLF.BorderColor3 = currentTheme.Border; DLF.Visible = false; DLF.ScrollBarThickness = 6; DLF.ScrollBarImageColor3 = currentTheme.Accent; DLF.ZIndex = 9; DLF.AutomaticCanvasSize = Enum.AutomaticSize.Y; DLF.ScrollingDirection = Enum.ScrollingDirection.Y; DLF.CanvasSize = UDim2.new(0,0,0,0); CreateCorner(DLF, 6)
            local DLL = Instance.new("UIListLayout"); DLL.Parent = DLF; DLL.Padding = UDim.new(0, 2); DLL.HorizontalAlignment = Enum.HorizontalAlignment.Center
            registerThemeUpdate(function() DF.BackgroundColor3 = currentTheme.Tertiary; TL.TextColor3 = currentTheme.Text; SetChevron(DA); if DL then DL.TextColor3 = currentTheme.TextMuted end; DLF.BackgroundColor3 = currentTheme.Secondary; DLF.BorderColor3 = currentTheme.Border; DLF.ScrollBarImageColor3 = currentTheme.Accent; SB.BackgroundColor3 = currentTheme.Secondary end)
            local expanded = false; local selected = nil; local items = {}; local optionButtons = {}
            local function updateDropdownSize()
                if expanded then
                    local sh = (#items > 10 and 28 or 0)
                    local ch = DLL.AbsoluteContentSize.Y
                    local th = math.min(ch, 200)
                    SB.Position = UDim2.new(0, 5, 0, baseH)
                    DLF.Position = UDim2.new(0, 0, 0, baseH + sh)
                    DLF.Size = UDim2.new(1, 0, 0, th)
                    DF.Size = UDim2.new(1, -14, 0, baseH + sh + th + 4)
                else
                    DLF.Size = UDim2.new(1, 0, 0, 0)
                    DF.Size = UDim2.new(1, -14, 0, baseH)
                end
                SectionFrame.CanvasSize = UDim2.new(0, 0, 0, SectionLayout.AbsoluteContentSize.Y + 35)
            end
            if DL then
                DL:GetPropertyChangedSignal("AbsoluteSize"):Connect(function()
                    local h = TITLE_Y + TITLE_H + GAP + math.ceil(DL.AbsoluteSize.Y) + 10
                    if DL.AbsoluteSize.Y > 0 and math.abs(h - baseH) >= 1 then baseH = h; updateDropdownSize() end
                end)
            end
            local function collapse()
                expanded = false; DLF.Visible = false; SB.Visible = false; SB.Text = ""; SetChevron(DA, false); updateDropdownSize()
            end
            local function filterOptions(st) st = st:lower(); for o, b in pairs(optionButtons) do b.Visible = (st == "" or o:lower():find(st, 1, true) ~= nil) end; if expanded then updateDropdownSize() end end
            SB:GetPropertyChangedSignal("Text"):Connect(function() filterOptions(SB.Text) end)
            local dropdownObject = {}
            function dropdownObject:Add(option)
                if optionButtons[option] then return end; table.insert(items, option)
                local OB = CreateTextButton(DLF, ENC_PREFIX.Opt_ .. XorEncode(option), UDim2.new(1, -10, 0, 28), nil, 10); OB.Text = option; OB.TextColor3 = currentTheme.Text; OB.TextSize = 13; OB.BackgroundColor3 = currentTheme.Tertiary; OB.BackgroundTransparency = 0.3; CreateCorner(OB, 5)
                OB.MouseButton1Click:Connect(function() if minimizeAnimating then return end; selected = option; TL.Text = text .. ": " .. selected; if callback then callback(option) end; collapse() end)
                optionButtons[option] = OB; updateDropdownSize()
            end
            function dropdownObject:Remove(option) local b = optionButtons[option]; if b then b:Destroy(); optionButtons[option] = nil; if selected == option then selected = nil; TL.Text = text .. ":"; if callback then callback(nil) end end; for i,v in ipairs(items) do if v == option then table.remove(items,i); break end end; updateDropdownSize() end end
            function dropdownObject:Clear() for o,b in pairs(optionButtons) do b:Destroy() end; optionButtons={}; items={}; selected=nil; TL.Text=text..":"; if callback then callback(nil) end; updateDropdownSize() end
            function dropdownObject:GetOptions() return items end
            function dropdownObject:GetSelected() return selected end
            function dropdownObject:SetSelected(option) if optionButtons[option] then selected=option; TL.Text=text..": "..selected; if callback then callback(selected) end; if expanded then collapse() end end end
            DA.MouseButton1Click:Connect(function() if minimizeAnimating then return end; expanded = not expanded; if expanded then if #items > 10 then SB.Visible = true; SB.Text = "" end; DLF.Visible = true; SetChevron(DA, true) else SB.Visible = false; SB.Text = ""; DLF.Visible = false; SetChevron(DA, false) end; updateDropdownSize() end)
            local inputConnection
            inputConnection = UserInputService.InputBegan:Connect(function(input)
                if expanded and (input.UserInputType == Enum.UserInputType.MouseButton1 or input.UserInputType == Enum.UserInputType.Touch) then
                    if not IsPointerOver(DF, input) then collapse() end
                end
            end)
            DF.AncestryChanged:Connect(function() if not DF.Parent and inputConnection then inputConnection:Disconnect() end end)
            for _, o in ipairs(options or {}) do dropdownObject:Add(o) end
            SectionFrame.CanvasSize = UDim2.new(0, 0, 0, SectionLayout.AbsoluteContentSize.Y + 35)
            return dropdownObject
        end

        function Section:MultiDropdown(text, desc, options, callback)
            if type(desc) == "table" then callback = options; options = desc; desc = nil end
            local TITLE_Y, TITLE_H, GAP = 8, 16, 3
            local hasDesc = desc ~= nil and desc ~= ""
            local secW = SectionFrame.AbsoluteSize.X
            if secW <= 0 then secW = math.floor(390 * (currentWindowScaleX or 1)) end
            local descH = hasDesc and MeasureDescH(desc, DDStyle.Desc, secW - 14 - 20) or 0
            local baseH = hasDesc and (TITLE_Y + TITLE_H + GAP + descH + 10) or 34
            local MDF = CreateFrame(SectionFrame, ENC_PREFIX.MultiDropdown_ .. XorEncode(text), currentTheme.Tertiary, 0, UDim2.new(1, -14, 0, baseH), nil, 6); CreateCorner(MDF, 6); MDF.ClipsDescendants = false
            local TL = CreateLabel(MDF, ENC.MDTitle, text .. ":", currentTheme.Text, DDStyle.Title, currentFont, UDim2.new(1, -150, 0, TITLE_H), UDim2.new(0, 10, 0, TITLE_Y), 7)
            TL.TextYAlignment = Enum.TextYAlignment.Center
            TL.TextTruncate = Enum.TextTruncate.AtEnd
            local CL = CreateLabel(MDF, ENC.MDCount, "(0 selected)", currentTheme.Accent, DDStyle.Count, currentFont, UDim2.new(0, 100, 0, TITLE_H), UDim2.new(1, -36, 0, TITLE_Y), 7)
            CL.AnchorPoint = Vector2.new(1, 0)
            CL.TextXAlignment = Enum.TextXAlignment.Right
            CL.TextYAlignment = Enum.TextYAlignment.Center
            local DL
            if hasDesc then
                DL = CreateLabel(MDF, ENC.MDDesc, desc, currentTheme.TextMuted, DDStyle.Desc, currentFont, UDim2.new(1, -20, 0, descH), UDim2.new(0, 10, 0, TITLE_Y + TITLE_H + GAP), 7)
                DL.TextWrapped = true; DL.RichText = true
                DL.TextYAlignment = Enum.TextYAlignment.Top
                DL.AutomaticSize = Enum.AutomaticSize.Y
            end
            local DA = CreateTextButton(MDF, ENC.MDArrow, UDim2.new(0, 24, 0, 24), UDim2.new(1, -30, 0, 4), 7); SetChevron(DA, false); DA.BackgroundTransparency = 1
            local SB = Instance.new("TextBox"); SB.Name = ENC.SearchBox; SB.Parent = MDF; SB.BackgroundColor3 = currentTheme.Secondary; SB.BorderSizePixel = 0; SB.Font = currentFont; SB.PlaceholderText = "Search..."; SB.Text = ""; SB.TextColor3 = currentTheme.Text; SB.PlaceholderColor3 = currentTheme.TextMuted; SB.TextSize = 12; SB.Visible = false; SB.ZIndex = 9; CreateCorner(SB, 5)
            local DBtn = CreateTextButton(MDF, ENC.MDBtn, UDim2.new(1, 0, 0, baseH), nil, 8); DBtn.BackgroundTransparency = 1
            local DLF = Instance.new("ScrollingFrame"); DLF.Name = ENC.MDList; DLF.Parent = MDF; DLF.BackgroundColor3 = currentTheme.Secondary; DLF.BorderSizePixel = 1; DLF.BorderColor3 = currentTheme.Border; DLF.Visible = false; DLF.ScrollBarThickness = 6; DLF.ScrollBarImageColor3 = currentTheme.Accent; DLF.ZIndex = 9; DLF.AutomaticCanvasSize = Enum.AutomaticSize.Y; DLF.ScrollingDirection = Enum.ScrollingDirection.Y; DLF.CanvasSize = UDim2.new(0,0,0,0); CreateCorner(DLF, 6)
            local DLL = Instance.new("UIListLayout"); DLL.Parent = DLF; DLL.Padding = UDim.new(0, 2); DLL.HorizontalAlignment = Enum.HorizontalAlignment.Center
            registerThemeUpdate(function() MDF.BackgroundColor3 = currentTheme.Tertiary; TL.TextColor3 = currentTheme.Text; CL.TextColor3 = currentTheme.Accent; SetChevron(DA); if DL then DL.TextColor3 = currentTheme.TextMuted end; DLF.BackgroundColor3 = currentTheme.Secondary; DLF.BorderColor3 = currentTheme.Border; DLF.ScrollBarImageColor3 = currentTheme.Accent; SB.BackgroundColor3 = currentTheme.Secondary end)
            local expanded = false; local selectedOptions = {}; local items = {}; local optionButtons = {}
            local function updateMDSize()
                DBtn.Size = UDim2.new(1, 0, 0, baseH)
                if expanded then
                    local sh = (#items > 8 and 28 or 0)
                    if #items > 8 then
                        SB.Position = UDim2.new(0, 5, 0, baseH)
                        SB.Size = UDim2.new(1, -10, 0, 24)
                    end
                    local ly = baseH + sh
                    DLF.Position = UDim2.new(0, 0, 0, ly)
                    local ch = DLL.AbsoluteContentSize.Y
                    local th = math.min(ch, 200)
                    DLF.Size = UDim2.new(1, 0, 0, th)
                    MDF.Size = UDim2.new(1, -14, 0, ly + th + 4)
                else
                    DLF.Size = UDim2.new(1, 0, 0, 0)
                    MDF.Size = UDim2.new(1, -14, 0, baseH)
                end
                SectionFrame.CanvasSize = UDim2.new(0, 0, 0, SectionLayout.AbsoluteContentSize.Y + 35)
            end
            local secConn = SectionFrame:GetPropertyChangedSignal("AbsoluteSize"):Connect(function()
                task.defer(updateMDSize)
            end)
            MDF.AncestryChanged:Connect(function() if not MDF.Parent and secConn then secConn:Disconnect() end end)
            if DL then
                DL:GetPropertyChangedSignal("AbsoluteSize"):Connect(function()
                    local h = TITLE_Y + TITLE_H + GAP + math.ceil(DL.AbsoluteSize.Y) + 10
                    if DL.AbsoluteSize.Y > 0 and math.abs(h - baseH) >= 1 then baseH = h; updateMDSize() end
                end)
            end
            local function uc() local c=0; for _ in pairs(selectedOptions) do c=c+1 end; CL.Text="("..c.." selected)" end
            local function tc() if callback then local sl={}; for o,_ in pairs(selectedOptions) do table.insert(sl,o) end; callback(sl) end end
            local function fo(st) st=st:lower(); for o,d in pairs(optionButtons) do if d and d.Button then d.Button.Visible = (st=="" or o:lower():find(st,1,true) ~= nil) end end; if expanded then updateMDSize() end end
            SB:GetPropertyChangedSignal("Text"):Connect(function() fo(SB.Text) end)
            local function to(option, sc) if selectedOptions[option] then selectedOptions[option]=nil; local d=optionButtons[option]; if d then d.Selected=false; SetCheckIcon(d.Checkmark, false); TweenService:Create(d.Button, TweenInfo.new(0.2), {BackgroundColor3=currentTheme.Tertiary, BackgroundTransparency=0.3}):Play() end else selectedOptions[option]=true; local d=optionButtons[option]; if d then d.Selected=true; SetCheckIcon(d.Checkmark, true); TweenService:Create(d.Button, TweenInfo.new(0.2), {BackgroundColor3=currentTheme.Accent, BackgroundTransparency=0}):Play() end end; uc(); if not sc then tc() end end
            local mdo = {}
            function mdo:Add(option) if optionButtons[option] then return end; table.insert(items, option)
                local OB = CreateTextButton(DLF, ENC_PREFIX.Opt_ .. XorEncode(option), UDim2.new(1, -10, 0, 28), nil, 10); OB.Text = ""; OB.TextColor3 = currentTheme.Text; OB.TextSize = 13; OB.BackgroundColor3 = currentTheme.Tertiary; OB.BackgroundTransparency = 0.3; CreateCorner(OB, 5)
                local CK = CreateLabel(OB, ENC.CK, "", currentTheme.Text, 16, currentFont, UDim2.new(0, 20, 0, 28), UDim2.new(0, 8, 0, 0), 11); CK.TextXAlignment=Enum.TextXAlignment.Center; CK.TextYAlignment=Enum.TextYAlignment.Center; SetCheckIcon(CK, false)
                local OL = CreateLabel(OB, ENC.OL, option, currentTheme.Text, 13, currentFont, UDim2.new(1, -40, 0, 28), UDim2.new(0, 32, 0, 0), 11); OL.TextYAlignment=Enum.TextYAlignment.Center; OL.TextTruncate = Enum.TextTruncate.AtEnd
                optionButtons[option] = {Button=OB, Checkmark=CK, Label=OL, Selected=false}
                OB.MouseButton1Click:Connect(function() if minimizeAnimating then return end; to(option, false) end); updateMDSize()
            end
            function mdo:Remove(option) local d=optionButtons[option]; if d then if selectedOptions[option] then selectedOptions[option]=nil; uc(); tc() end; d.Button:Destroy(); optionButtons[option]=nil; for i,v in ipairs(items) do if v==option then table.remove(items,i); break end end; updateMDSize() end end
            function mdo:Clear() for o,d in pairs(optionButtons) do d.Button:Destroy() end; optionButtons={}; items={}; selectedOptions={}; uc(); tc(); updateMDSize() end
            function mdo:GetOptions() return items end
            function mdo:GetSelected() local sl={}; for o,_ in pairs(selectedOptions) do table.insert(sl,o) end; return sl end
            function mdo:SetSelected(option, state) if optionButtons[option] then local cs = selectedOptions[option]~=nil; if cs~=state then to(option,true); tc() end end end
            function mdo:SelectAll() for _,o in ipairs(items) do if not selectedOptions[o] then selectedOptions[o]=true; local d=optionButtons[o]; if d then d.Selected=true; SetCheckIcon(d.Checkmark, true); TweenService:Create(d.Button, TweenInfo.new(0.2), {BackgroundColor3=currentTheme.Accent, BackgroundTransparency=0}):Play() end end end; uc(); tc() end
            function mdo:UnSelectAll() for o,_ in pairs(selectedOptions) do local d=optionButtons[o]; if d then d.Selected=false; SetCheckIcon(d.Checkmark, false); TweenService:Create(d.Button, TweenInfo.new(0.2), {BackgroundColor3=currentTheme.Tertiary, BackgroundTransparency=0.3}):Play() end end; selectedOptions={}; uc(); tc() end
            function mdo:ToggleDropdown() if minimizeAnimating then return end; expanded = not expanded; if expanded then if #items > 8 then SB.Visible=true; SB.Text="" end; DLF.Visible=true; SetChevron(DA, true) else SB.Visible=false; SB.Text=""; DLF.Visible=false; SetChevron(DA, false) end; updateMDSize() end
            DBtn.MouseButton1Click:Connect(function() mdo:ToggleDropdown() end)
            local inputConnection
            inputConnection = UserInputService.InputBegan:Connect(function(input)
                if expanded and (input.UserInputType == Enum.UserInputType.MouseButton1 or input.UserInputType == Enum.UserInputType.Touch) then
                    if not IsPointerOver(MDF, input) then
                        expanded = false; DLF.Visible = false; SB.Visible = false; SB.Text = ""; SetChevron(DA, false); updateMDSize()
                    end
                end
            end)
            MDF.AncestryChanged:Connect(function() if not MDF.Parent and inputConnection then inputConnection:Disconnect() end end)
            for _, o in ipairs(options or {}) do mdo:Add(o) end
            SectionFrame.CanvasSize = UDim2.new(0, 0, 0, SectionLayout.AbsoluteContentSize.Y + 35)
            return mdo
        end


        local blindable = { "Paragraph", "Model", "Audio", "Image", "Video", "Colorpicker", "Bind",
            "ToggleTextbox", "Textbox", "Slider", "ToggleSlider", "Dropdown", "MultiDropdown" }
        for _, mname in ipairs(blindable) do
            local original = Section[mname]
            if type(original) == "function" then
                Section[mname] = function(self, ...)
                    local before = {}
                    for _, c in ipairs(SectionFrame:GetChildren()) do before[c] = true end
                    local result = original(self, ...)
                    if type(result) == "table" and rawget(result, "Blind") == nil then
                        local holder
                        for _, c in ipairs(SectionFrame:GetChildren()) do
                            if not before[c] and c:IsA("GuiObject") then holder = c end
                        end
                        if holder then AttachBlindMethods(holder, result, 6) end
                    end
                    return result
                end
            end
        end
        for name, fn in pairs(Section) do
            if type(fn) == "function" then
                Section[name] = function(...)
                    local packed = table.pack(fn(...))
                    ScheduleFinalize()
                    return table.unpack(packed, 1, packed.n)
                end
            end
        end
        channelObj.SectionAPI = Section

        if currentServer == serverName and (currentChannel == nil or currentChannel == "") then
            DiscordLib:SelectChannel(serverName, channelName)
        end
        ScheduleFinalize()
        return Section
    end
local WindowObject = {}
    function WindowObject:Server(Name, Image) return Servers:Server(Name, Image) end
    function WindowObject:Channel(serverName, channelName) return Servers:Channel(serverName, channelName) end
    function WindowObject:CreateSection(serverName, channelName) return Servers:Channel(serverName, channelName) end

    local function bind(name)
        return function(first, ...)
            if first == WindowObject then return DiscordLib[name](DiscordLib, ...) end
            return DiscordLib[name](DiscordLib, first, ...)
        end
    end
    for _, n in ipairs({ "SelectServer", "SelectChannel", "SetTheme", "SetFont", "SetWindowSize", "SetTransparency",
        "Dialog", "MinimizeUI", "Notification", "Destroy", "SetAdvancedTheme", "SaveConfig", "LoadConfig",
        "SetAutoLoad", "GetAutoLoad" }) do
        WindowObject[n] = bind(n)
    end
    WindowObject.Maximize = function() return DiscordLib.MaximizeWindow() end
    WindowObject.Restore = function() return DiscordLib.RestoreWindow() end
    WindowObject.ToggleMaximize = function() return DiscordLib.ToggleMaximize() end
local function RegisterSearchItem(path, itemType, text, extra)

end

DiscordLib._RegisterSearchItem = RegisterSearchItem

    do
        local okA, autoOn, autoName = pcall(function() return DiscordLib:GetAutoLoad() end)
        if okA and autoOn then
            pcall(function() DiscordLib:LoadConfig(autoName) end)
        end
    end
    ScheduleFinalize(0.3)
    return WindowObject
end
function DiscordLib:CreateAcrylicBlur()
    local ae = false
    local ai = 0.5
    local af = nil
    local be = nil
    local rsConnection = nil
    
    local function cbe()
        if be then return end
        be = Instance.new("BlurEffect")
        be.Name = ENC.ABE
        be.Parent = Lighting
        be.Size = 0
        be.Enabled = false
    end
    
    local function caf()
        if af then return end
        local mf = Discord:FindFirstChild(ENC.MainFrame)
        if not mf then return end
        af = CreateFrame(Discord, ENC.AB, Color3.fromRGB(30,30,30), 1, mf.Size, mf.Position, 0)
        af.AnchorPoint = mf.AnchorPoint
        af.Active = false
        CreateCorner(af, 10)
        mf:GetPropertyChangedSignal("Position"):Connect(function()
            if af and af.Parent then af.Position = mf.Position end
        end)
        mf:GetPropertyChangedSignal("Size"):Connect(function()
            if af and af.Parent then af.Size = mf.Size end
        end)
    end
    
    local function updateBlur()
        if not ae then return end
        if getgenv().IsMinimized then
            if be and be.Parent then
                be.Enabled = false
                be.Size = 0
            end
            if af and af.Parent then
                af.BackgroundTransparency = 1
            end
        else
            if be and be.Parent then
                be.Enabled = true
                be.Size = 24 * ai
            end
            if af and af.Parent then
                af.BackgroundTransparency = 0.85 + (ai * 0.1)
            end
        end
    end
    
    local function Enable()
        if ae then return end
        cbe()
        caf()
        ae = true
        getgenv().BlurEnabled = true
        updateBlur()
        if not rsConnection then
            rsConnection = RunService.RenderStepped:Connect(updateBlur)
        end
    end
    
    local function Disable()
        ae = false
        getgenv().BlurEnabled = false
        if be and be.Parent then
            be.Enabled = false
            be.Size = 0
        end
        if af and af.Parent then
            af.BackgroundTransparency = 1
        end
        if rsConnection then
            rsConnection:Disconnect()
            rsConnection = nil
        end
    end
    
    local function SetIntensity(intensity)
        ai = math.clamp(intensity, 0, 1)
        if ae then
            updateBlur()
        end
    end
    
    local function Toggle()
        if ae then
            Disable()
        else
            Enable()
        end
    end
    
    return {
        Enable = Enable,
        Disable = Disable,
        Toggle = Toggle,
        SetIntensity = SetIntensity,
        GetIntensity = function() return ai end,
        IsEnabled = function() return ae end,
        GetBlurEffect = function() return be end
    }
end

local function CreateScreenGui(prefix, displayOrder)
    local g = Instance.new("ScreenGui")
    g.Name = XorEncode(prefix) .. EncriptyText()
    g.ResetOnSpawn = false
    g.IgnoreGuiInset = true
    g.DisplayOrder = displayOrder or 100
    g.ZIndexBehavior = Enum.ZIndexBehavior.Global
    protectGui(g)
    return g
end

local function CreateModalCard(parent, w, h, z)
    local card = Instance.new("CanvasGroup")
    card.Name = EncriptyText(math.random(8, 14))
    card.AnchorPoint = Vector2.new(0.5, 0.5)
    card.Position = UDim2.new(0.5, 0, 0.5, 0)
    card.Size = UDim2.new(0, w, 0, h)
    card.BackgroundColor3 = currentTheme.Main
    card.BorderSizePixel = 0
    card.GroupTransparency = 1
    card.Active = true
    card.ZIndex = z
    card.Parent = parent
    CreateCorner(card, 12)
    local stroke = NewStroke(card, currentTheme.Border, 1, 0.15)
    local scale = Instance.new("UIScale")
    scale.Scale = 0.92
    scale.Parent = card

    local absorber = Instance.new("TextButton")
    absorber.Name = EncriptyText(math.random(6, 10))
    absorber.AutoButtonColor = false
    absorber.Text = ""
    absorber.BackgroundTransparency = 1
    absorber.Size = UDim2.new(1, 0, 1, 0)
    absorber.ZIndex = z
    absorber.Parent = card
    return card, stroke, scale
end

local function CardIn(card, scale)
    TweenService:Create(card, TweenInfo.new(0.3, Enum.EasingStyle.Quad, Enum.EasingDirection.Out), { GroupTransparency = 0 }):Play()
    TweenService:Create(scale, TweenInfo.new(0.35, Enum.EasingStyle.Back, Enum.EasingDirection.Out), { Scale = 1 }):Play()
end

local function CardOut(card, scale, dur, base)
    dur = dur or 0.22
    TweenService:Create(card, TweenInfo.new(dur, Enum.EasingStyle.Quad, Enum.EasingDirection.In), { GroupTransparency = 1 }):Play()
    TweenService:Create(scale, TweenInfo.new(dur, Enum.EasingStyle.Quad, Enum.EasingDirection.In), { Scale = (base or 1) * 0.94 }):Play()
end

local DANGER_COLOR = Color3.fromRGB(242, 63, 67)
local function StyleButton(btn, style)
    btn.Font = currentFont
    btn.TextSize = 13
    if style == "Danger" then
        btn.BackgroundColor3 = DANGER_COLOR
        btn.TextColor3 = Color3.new(1, 1, 1)
        return nil
    elseif style == "Primary" then
        btn.BackgroundColor3 = Color3.new(1, 1, 1)
        btn.TextColor3 = Color3.new(1, 1, 1)
        return NewGradient(btn, currentTheme.Accent, currentTheme.AccentGradient, 0)
    else
        btn.BackgroundColor3 = currentTheme.Tertiary
        btn.TextColor3 = currentTheme.Text
        NewStroke(btn, currentTheme.Border, 1, 0.5)
        return nil
    end
end

local function HideLibrary()
    local btnGui = getgenv().MinimizeButton and getgenv().MinimizeButton.Parent
    local state = {
        discord = Discord.Enabled,
        btnGui = btnGui,
        btnEnabled = btnGui and btnGui.Enabled
    }
    Discord.Enabled = false
    if btnGui then btnGui.Enabled = false end
    return state
end

local function ShowLibrary(state)
    pcall(function()
        Discord.Enabled = (state == nil) and true or (state.discord ~= false)
        if state and state.btnGui and state.btnGui.Parent then
            state.btnGui.Enabled = state.btnEnabled ~= false
        end
    end)
end

local function MakeGlow(parent, color, diameter, peak, zindex)
    local holder = Instance.new("Frame")
    holder.Name = EncriptyText(8)
    holder.BackgroundTransparency = 1
    holder.BorderSizePixel = 0
    holder.AnchorPoint = Vector2.new(0.5, 0.5)
    holder.Size = UDim2.new(0, diameter, 0, diameter)
    holder.Position = UDim2.new(0.5, 0, 0.5, 0)
    holder.ZIndex = zindex or 1
    holder.Parent = parent
    local steps = 6
    for i = 1, steps do
        local f = Instance.new("Frame")
        f.Name = EncriptyText(6)
        f.BackgroundColor3 = color
        f.BackgroundTransparency = 1 - peak / steps
        f.BorderSizePixel = 0
        f.AnchorPoint = Vector2.new(0.5, 0.5)
        f.Position = UDim2.new(0.5, 0, 0.5, 0)
        f.Size = UDim2.new(i / steps, 0, i / steps, 0)
        f.ZIndex = zindex or 1
        f.Parent = holder
        local c = Instance.new("UICorner")
        c.CornerRadius = UDim.new(0.5, 0)
        c.Parent = f
    end
    return holder
end

local function MakeSoftShadow(parent, color, spread, steps, peak, radius, yOffset, zindex, collect)
    for i = 1, steps do
        local grow = spread * i / steps
        local f = Instance.new("Frame")
        f.Name = EncriptyText(6)
        f.BackgroundColor3 = color
        f.BackgroundTransparency = collect and 1 or (1 - peak / steps)
        f.BorderSizePixel = 0
        f.AnchorPoint = Vector2.new(0.5, 0.5)
        f.Position = UDim2.new(0.5, 0, 0.5, yOffset or 0)
        f.Size = UDim2.new(1, grow * 2, 1, grow * 2)
        f.ZIndex = zindex or 1
        f.Parent = parent
        local c = Instance.new("UICorner")
        c.CornerRadius = UDim.new(0, radius + grow)
        c.Parent = f
        if collect then table.insert(collect, { frame = f, final = 1 - peak / steps }) end
    end
end

local function MakeVignette(parent, zindex)
    local function edge(anchor, pos, size, rot)
        local f = Instance.new("Frame")
        f.Name = EncriptyText(8)
        f.BackgroundColor3 = Color3.new(0, 0, 0)
        f.BorderSizePixel = 0
        f.AnchorPoint = anchor
        f.Position = pos
        f.Size = size
        f.ZIndex = zindex
        f.Parent = parent
        local g = Instance.new("UIGradient")
        g.Rotation = rot
        g.Transparency = NumberSequence.new({ NumberSequenceKeypoint.new(0, 0.55), NumberSequenceKeypoint.new(1, 1) })
        g.Parent = f
    end
    edge(Vector2.new(0, 0), UDim2.new(0, 0, 0, 0), UDim2.new(1, 0, 0.28, 0), 90)
    edge(Vector2.new(0, 1), UDim2.new(0, 0, 1, 0), UDim2.new(1, 0, 0.28, 0), 270)
    edge(Vector2.new(0, 0), UDim2.new(0, 0, 0, 0), UDim2.new(0.18, 0, 1, 0), 0)
    edge(Vector2.new(1, 0), UDim2.new(1, 0, 0, 0), UDim2.new(0.18, 0, 1, 0), 180)
end

local function CreateStageCard(parent, w, h, z)
    local holder = Instance.new("Frame")
    holder.Name = EncriptyText(8)
    holder.BackgroundTransparency = 1
    holder.BorderSizePixel = 0
    holder.AnchorPoint = Vector2.new(0.5, 0.5)
    holder.Position = UDim2.new(0.5, 0, 0.5, 0)
    holder.Size = UDim2.new(0, w, 0, h)
    holder.ZIndex = z - 1
    holder.Parent = parent

    local layers = {}
    MakeSoftShadow(holder, Color3.new(0, 0, 0), 22, 6, 0.40, 12, 8, z - 1, layers)
    MakeSoftShadow(holder, currentTheme.Accent, 30, 6, 0.16, 12, 0, z - 1, layers)

    local card = Instance.new("CanvasGroup")
    card.Name = EncriptyText(8)
    card.AnchorPoint = Vector2.new(0.5, 0.5)
    card.Position = UDim2.new(0.5, 0, 0.5, 0)
    card.Size = UDim2.new(1, 0, 1, 0)
    card.BackgroundColor3 = currentTheme.Main
    card.BorderSizePixel = 0
    card.GroupTransparency = 1
    card.Active = true
    card.ZIndex = z
    card.Parent = holder
    CreateCorner(card, 12)
    local stroke = NewStroke(card, currentTheme.Border, 1, 0.15)
    local scale = Instance.new("UIScale")
    scale.Scale = 0.92
    scale.Parent = card

    local absorber = Instance.new("TextButton")
    absorber.Name = EncriptyText(6)
    absorber.AutoButtonColor = false
    absorber.Text = ""
    absorber.BackgroundTransparency = 1
    absorber.Size = UDim2.new(1, 0, 1, 0)
    absorber.ZIndex = z
    absorber.Parent = card
    return card, stroke, scale, holder, layers
end

local function StageIn(card, scale, layers)
    CardIn(card, scale)
    for _, l in ipairs(layers) do
        TweenService:Create(l.frame, TweenInfo.new(0.45, Enum.EasingStyle.Quad, Enum.EasingDirection.Out), { BackgroundTransparency = l.final }):Play()
    end
end

local function StageOut(card, scale, layers, dur)
    dur = dur or 0.22
    CardOut(card, scale, dur)
    for _, l in ipairs(layers) do
        TweenService:Create(l.frame, TweenInfo.new(dur, Enum.EasingStyle.Quad, Enum.EasingDirection.In), { BackgroundTransparency = 1 }):Play()
    end
end

local function CreateIconTextRow(parent, iconName, text, color, textSize, zindex, gap)
    local row = Instance.new("Frame")
    row.Name = EncriptyText(8)
    row.BackgroundTransparency = 1
    row.BorderSizePixel = 0
    row.Size = UDim2.new(1, 0, 1, 0)
    row.ZIndex = zindex
    row.Parent = parent
    local layout = Instance.new("UIListLayout")
    layout.FillDirection = Enum.FillDirection.Horizontal
    layout.HorizontalAlignment = Enum.HorizontalAlignment.Center
    layout.VerticalAlignment = Enum.VerticalAlignment.Center
    layout.SortOrder = Enum.SortOrder.LayoutOrder
    layout.Padding = UDim.new(0, gap or 8)
    layout.Parent = row
    local icon
    if iconName then
        icon = CreateIcon(row, iconName, textSize + 3, color, nil, zindex)
        icon.LayoutOrder = 1
    end
    local label = Instance.new("TextLabel")
    label.Name = EncriptyText(8)
    label.BackgroundTransparency = 1
    label.AutomaticSize = Enum.AutomaticSize.X
    label.Size = UDim2.new(0, 0, 1, 0)
    label.Font = currentFont
    label.Text = text
    label.TextSize = textSize
    label.TextColor3 = color
    label.ZIndex = zindex
    label.LayoutOrder = 2
    label.Parent = row
    return row, label, icon
end

local NOTIF_WIDTH  = 330
local NOTIF_GAP    = 8
local NOTIF_TOP    = 16
local NOTIF_MARGIN = 16

local NotificationTypes = {
    Success = { Color3.fromRGB(87, 242, 135), "lucide-check-circle" },
    Error   = { Color3.fromRGB(242, 63, 67),  "lucide-x-circle" },
    Warning = { Color3.fromRGB(255, 186, 66), "lucide-alert-triangle" },
    Info    = { Color3.fromRGB(100, 140, 255), "lucide-info" },
}

local function ResolveNotifType(t)
    if type(t) ~= "string" or t == "" then return nil, nil end
    local key = t:sub(1, 1):upper() .. t:sub(2):lower()
    return NotificationTypes[key], key
end

local NotifGui = nil
local function GetNotifGui()
    if NotifGui and NotifGui.Parent then return NotifGui end
    pcall(function()
        if getgenv().DiscordNotifGui then getgenv().DiscordNotifGui:Destroy() end
    end)
    NotifGui = CreateScreenGui("Notif_", 10000)
    getgenv().DiscordNotifGui = NotifGui
    return NotifGui
end

local function RepositionNotifications()
    local y = NOTIF_TOP
    for _, entry in ipairs(activeNotifications) do
        if entry.Frame and entry.Frame.Parent and not entry.dismissed then
            TweenService:Create(entry.Frame,
                TweenInfo.new(0.4, Enum.EasingStyle.Quint, Enum.EasingDirection.Out),
                { Position = UDim2.new(1, -NOTIF_MARGIN, 0, y) }
            ):Play()
            y = y + entry.Height + NOTIF_GAP
        end
    end
end

function DiscordLib:Notification(options)
    if DiscordLib._keyAborted then return nil end
    if type(options) == "string" then options = { title = "Notification", desc = options } end
    options = options or {}
    local title    = tostring(options.title or options.Title or "Notification")
    local desc     = tostring(options.desc or options.Description or options.Desc or "")
    local duration = tonumber(options.time or options.duration or options.Duration or 3) or 3
    local typeInfo, typeKey = ResolveNotifType(options.type or options.Type)
    local clickCb  = options.callback or options.Callback or options.onClick
    local iconName = options.icon or options.Icon or (typeInfo and typeInfo[2]) or "lucide-bell"

    local function accentOf()
        if typeInfo then return typeInfo[1] end
        return currentTheme.Accent
    end
    local function accent2Of()
        if typeInfo then return typeInfo[1]:Lerp(Color3.new(1, 1, 1), 0.3) end
        return currentTheme.AccentGradient or currentTheme.Accent
    end

    local gui = GetNotifGui()

    local padL, iconSize, gap, closeW = 20, 34, 12, 32
    local textX = padL + iconSize + gap
    local textW = NOTIF_WIDTH - textX - closeW
    local titleH = 18
    local function calcHeight(d)
        local dh = 0
        if d ~= "" then dh = math.max(14, MeasureText(d, 12, currentFont, textW).Y) end
        return math.max(64, 14 + titleH + (dh > 0 and (4 + dh) or 0) + 20), dh
    end
    local height, descH = calcHeight(desc)

    local Card = CreateFrame(gui, ENC.NotificationMain, currentTheme.Main, 0.02,
        UDim2.new(0, NOTIF_WIDTH, 0, height),
        UDim2.new(1, NOTIF_WIDTH + 40, 0, NOTIF_TOP), 500)
    Card.AnchorPoint = Vector2.new(1, 0)
    CreateCorner(Card, 10)
    local stroke = NewStroke(Card, currentTheme.Border, 1, 0.2)

    local bar = CreateFrame(Card, ENC.AccentBar, accentOf(), 0, UDim2.new(0, 3, 1, -20), UDim2.new(0, 8, 0, 10), 502)
    CreateCorner(bar, 2)

    local tile = CreateFrame(Card, ENC.IconFrame, accentOf(), 0.82, UDim2.new(0, iconSize, 0, iconSize), UDim2.new(0, padL, 0, 14), 502)
    CreateCorner(tile, 9)
    local iconImg = CreateIcon(tile, iconName, 18, accentOf(), UDim2.new(0.5, -9, 0.5, -9), 503)
    iconImg.Name = ENC.Icon
    if iconImg.Image == "" then iconImg.Image = ResolveIcon("lucide-bell") or "" end

    local titleLabel = CreateLabel(Card, ENC.Title, title, currentTheme.Text, 14, currentFont,
        UDim2.new(0, textW, 0, titleH), UDim2.new(0, textX, 0, 12), 503)
    titleLabel.TextTruncate = Enum.TextTruncate.AtEnd
    titleLabel.TextYAlignment = Enum.TextYAlignment.Center

    local descLabel = CreateLabel(Card, ENC.ButtonDesc, desc, currentTheme.TextMuted, 12, currentFont,
        UDim2.new(0, textW, 0, descH), UDim2.new(0, textX, 0, 34), 503)
    descLabel.TextWrapped = true
    descLabel.TextYAlignment = Enum.TextYAlignment.Top
    descLabel.Visible = desc ~= ""

    local closeBtn, closeIcon = CreateIconButton(Card, "lucide-x", 22, 12, 504)
    closeBtn.Name = ENC.CloseBtn
    closeBtn.Position = UDim2.new(1, -30, 0, 8)
    closeBtn.MouseEnter:Connect(function()
        TweenService:Create(closeBtn, TweenInfo.new(0.15), { BackgroundTransparency = 0.4 }):Play()
        TweenService:Create(closeIcon, TweenInfo.new(0.15), { ImageColor3 = currentTheme.Text }):Play()
    end)
    closeBtn.MouseLeave:Connect(function()
        TweenService:Create(closeBtn, TweenInfo.new(0.15), { BackgroundTransparency = 1 }):Play()
        TweenService:Create(closeIcon, TweenInfo.new(0.15), { ImageColor3 = currentTheme.TextMuted }):Play()
    end)

    local progressBg = CreateFrame(Card, ENC.ProgressBg, currentTheme.Tertiary, 0.2, UDim2.new(1, -(padL + 14), 0, 3), UDim2.new(0, padL, 1, -9), 502)
    CreateCorner(progressBg, 2)
    local progressFill = CreateFrame(progressBg, ENC.ProgressFill, accentOf(), 0, UDim2.new(1, 0, 1, 0), nil, 503)
    CreateCorner(progressFill, 2)
    local progGrad = NewGradient(progressFill, accentOf(), accent2Of(), 0)

    local entry = { Frame = Card, dismissed = false, Height = height }
    table.insert(activeNotifications, 1, entry)
    RepositionNotifications()

    local hovered = false
    Card.MouseEnter:Connect(function() hovered = true end)
    Card.MouseLeave:Connect(function() hovered = false end)

    local function dismiss()
        if entry.dismissed then return end
        entry.dismissed = true
        TweenService:Create(Card, TweenInfo.new(0.3, Enum.EasingStyle.Quad, Enum.EasingDirection.In), {
            Position = UDim2.new(1, NOTIF_WIDTH + 40, 0, Card.Position.Y.Offset),
        }):Play()
        task.delay(0.32, function()
            for i, n in ipairs(activeNotifications) do
                if n == entry then table.remove(activeNotifications, i); break end
            end
            if Card and Card.Parent then Card:Destroy() end
            RepositionNotifications()
        end)
        RepositionNotifications()
    end
    closeBtn.MouseButton1Click:Connect(dismiss)

    if type(clickCb) == "function" then
        local hit = Instance.new("TextButton")
        hit.Name = EncriptyText(math.random(6, 10))
        hit.AutoButtonColor = false
        hit.Text = ""
        hit.BackgroundTransparency = 1
        hit.Size = UDim2.new(1, 0, 1, 0)
        hit.ZIndex = 501
        hit.Parent = Card
        hit.MouseButton1Click:Connect(function()
            task.spawn(function() pcall(clickCb) end)
            dismiss()
        end)
    end

    if duration > 0 then
        task.spawn(function()
            local elapsed = 0
            while Card and Card.Parent and not entry.dismissed do
                local dt = task.wait()
                if not hovered then elapsed = elapsed + dt end
                local remaining = math.max(0, 1 - elapsed / duration)
                if progressFill and progressFill.Parent then
                    progressFill.Size = UDim2.new(remaining, 0, 1, 0)
                end
                if remaining <= 0 then dismiss(); break end
            end
        end)
    else
        progressBg.Visible = false
    end

    local function applyTheme()
        if not (Card and Card.Parent) then return end
        local a, a2 = accentOf(), accent2Of()
        Card.BackgroundColor3 = currentTheme.Main
        stroke.Color = currentTheme.Border
        bar.BackgroundColor3 = a
        tile.BackgroundColor3 = a
        iconImg.ImageColor3 = a
        titleLabel.TextColor3 = currentTheme.Text
        descLabel.TextColor3 = currentTheme.TextMuted
        closeIcon.ImageColor3 = currentTheme.TextMuted
        progressBg.BackgroundColor3 = currentTheme.Tertiary
        progressFill.BackgroundColor3 = a
        progGrad.Color = ColorSequence.new({ ColorSequenceKeypoint.new(0, a), ColorSequenceKeypoint.new(1, a2) })
    end
    table.insert(ThemeUpdateConnections, applyTheme)

    return {
        Frame = Card,
        Dismiss = dismiss,
        SetTitle = function(t) titleLabel.Text = tostring(t or "") end,
        SetDescription = function(d)
            d = tostring(d or "")
            descLabel.Text = d
            descLabel.Visible = d ~= ""
            local newH, newDH = calcHeight(d)
            descLabel.Size = UDim2.new(0, textW, 0, newDH)
            Card.Size = UDim2.new(0, NOTIF_WIDTH, 0, newH)
            entry.Height = newH
            RepositionNotifications()
        end,
        SetType = function(t)
            typeInfo, typeKey = ResolveNotifType(t)
            SetIcon(iconImg, typeInfo and typeInfo[2] or iconName)
            applyTheme()
        end,
    }
end

function DiscordLib:Loader(e)
    if DiscordLib._keyAborted then return nil end
    if getgenv().ABC3616 or getgenv().ABC8281 or getgenv().ABC7472 then return nil end
    e = e or {}
    if e.useLoader == false then return end

    local title = tostring(e.title or "Loading...")
    local desc = tostring(e.desc or "")
    local total = tonumber(e.time) or 3
    if total < 0.5 then total = 0.5 end
    local image = e.image

    local stepList = {}
    if type(e.steps) == "table" and #e.steps > 0 then
        for i, s in ipairs(e.steps) do
            table.insert(stepList, { tostring(s), i / #e.steps, total / #e.steps })
        end
    else
        stepList = {
            { "Initializing...", 0.25, total * 0.30 },
            { "Loading modules...", 0.55, total * 0.30 },
            { "Setting up UI...", 0.80, total * 0.25 },
            { "Almost ready...", 0.95, total * 0.10 },
            { "Complete!", 1, total * 0.05 },
        }
    end

    local SUCCESS = Color3.fromRGB(87, 242, 135)
    local hints = {
        "Please wait while we prepare everything...",
        "Optimizing interface resources...",
        "Synchronizing modules...",
        "Applying final details...",
        "Hang tight, almost there...",
    }

    getgenv().ABC7472 = true
    local saved = HideLibrary()
    local gui = CreateScreenGui("LG_", 5000)

    local alive = true
    local completed = false
    local startTime = tick()
    local conns = {}
    local function track(c) table.insert(conns, c); return c end
    local function later(d, fn) task.delay(d, function() if alive then pcall(fn) end end) end

    local ok, err = pcall(function()
        local overlay = CreateFrame(gui, nil, Color3.new(0, 0, 0), 1, UDim2.new(1, 0, 1, 0), nil, 10)
        overlay.ClipsDescendants = true
        overlay.Active = true

        local particles = {}
        for i = 1, 30 do
            local size = math.random(2, 6)
            local p = Instance.new("Frame")
            p.Name = EncriptyText(8)
            p.BackgroundColor3 = (i % 3 == 0) and currentTheme.AccentGradient or currentTheme.Accent
            if i % 5 == 0 then p.BackgroundColor3 = Color3.new(1, 1, 1) end
            p.BackgroundTransparency = math.random(70, 92) / 100
            p.BorderSizePixel = 0
            p.Size = UDim2.new(0, size, 0, size)
            p.Position = UDim2.new(math.random(), 0, math.random(), 0)
            p.ZIndex = 9
            p.Parent = overlay
            CreateCorner(p, 50)
            particles[i] = {
                inst = p,
                x = p.Position.X.Scale,
                y = p.Position.Y.Scale,
                speed = 0.03 + math.random() * 0.07,
                amp = 0.004 + math.random() * 0.014,
                sway = 0.6 + math.random() * 1.6,
                phase = math.random() * math.pi * 2,
            }
        end

        local blobA = MakeGlow(overlay, currentTheme.Accent, 520, 0.12, 9)
        local blobB = MakeGlow(overlay, currentTheme.AccentGradient, 460, 0.10, 9)

        track(RunService.RenderStepped:Connect(function(dt)
            if not alive then return end
            local t = tick()
            for _, p in ipairs(particles) do
                p.y = p.y - p.speed * dt
                if p.y < -0.04 then
                    p.y = 1.04
                    p.x = math.random()
                end
                local xx = p.x + math.sin(t * p.sway + p.phase) * p.amp
                if p.inst.Parent then
                    p.inst.Position = UDim2.new(xx, 0, p.y, 0)
                end
            end
            if blobA.Parent then
                blobA.Position = UDim2.new(0.5 + math.sin(t * 0.35) * 0.06, 0, 0.42 + math.cos(t * 0.28) * 0.05, 0)
            end
            if blobB.Parent then
                blobB.Position = UDim2.new(0.5 - math.sin(t * 0.3) * 0.07, 0, 0.56 - math.cos(t * 0.33) * 0.05, 0)
            end
        end))

        local W, pad = 430, 26
        local iconHolderSize, tileSize = 78, 52
        local textW = W - pad * 2 - iconHolderSize - 16
        local descH = (desc ~= "") and math.max(14, MeasureText(desc, 12, currentFont, textW).Y) or 0
        local headerH = math.max(iconHolderSize, 24 + (descH > 0 and (4 + descH) or 0))
        local sep1Y = pad + headerH + 14
        local barLabelY = sep1Y + 11
        local trackY = barLabelY + 19
        local dotsY = trackY + 12 + 18
        local dotsH = 20
        local statusY = dotsY + dotsH + 13
        local sep2Y = statusY + 20 + 13
        local footerY = sep2Y + 9
        local H = footerY + 14 + 18

        local card, cardStroke, scale, cardHolder, shadowLayers = CreateStageCard(overlay, W, H, 11)
        cardStroke.Thickness = 1.4
        cardStroke.Transparency = 0.25

        local borderGrad = Instance.new("UIGradient")
        borderGrad.Rotation = 0
        borderGrad.Color = ColorSequence.new({
            ColorSequenceKeypoint.new(0, currentTheme.Accent),
            ColorSequenceKeypoint.new(0.5, currentTheme.AccentGradient),
            ColorSequenceKeypoint.new(1, currentTheme.Accent),
        })
        borderGrad.Parent = cardStroke

        local topLine = CreateFrame(card, nil, currentTheme.Accent, 0, UDim2.new(0.55, 0, 0, 3), UDim2.new(0.225, 0, 0, 0), 12)
        CreateCorner(topLine, 2)
        NewGradient(topLine, currentTheme.Accent, currentTheme.AccentGradient, 0)

        local innerGlow = CreateFrame(card, nil, Color3.new(1, 1, 1), 0, UDim2.new(1, -2, 0, 42), UDim2.new(0, 1, 0, 1), 11)
        local igGrad = Instance.new("UIGradient")
        igGrad.Rotation = 90
        igGrad.Transparency = NumberSequence.new({
            NumberSequenceKeypoint.new(0, 0.9),
            NumberSequenceKeypoint.new(1, 1),
        })
        igGrad.Parent = innerGlow

        local iconGlowBlob = MakeGlow(card, currentTheme.Accent, 120, 0.16, 11)
        iconGlowBlob.Position = UDim2.new(0, pad + iconHolderSize / 2, 0, pad + iconHolderSize / 2)

        local iconHolder = CreateFrame(card, nil, currentTheme.Secondary, 1, UDim2.new(0, iconHolderSize, 0, iconHolderSize), UDim2.new(0, pad, 0, pad), 12)
        iconHolder.ClipsDescendants = false
        CreateCorner(iconHolder, iconHolderSize / 2)
        local holderStroke = NewStroke(iconHolder, currentTheme.Accent, 1, 0.7)

        local tile = CreateFrame(iconHolder, nil, currentTheme.Accent, 0, UDim2.new(0, tileSize, 0, tileSize), UDim2.new(0.5, -tileSize / 2, 0.5, -tileSize / 2), 13)
        CreateCorner(tile, 14)
        NewGradient(tile, currentTheme.Accent, currentTheme.AccentGradient, 45)
        NewStroke(tile, Color3.new(1, 1, 1), 1, 0.72)

        if image and tostring(image) ~= "" then
            local img = Instance.new("ImageLabel")
            img.BackgroundTransparency = 1
            img.Size = UDim2.new(1, -10, 1, -10)
            img.Position = UDim2.new(0, 5, 0, 5)
            img.Image = ResolveIcon(image) or tostring(image)
            img.ScaleType = Enum.ScaleType.Fit
            img.ZIndex = 14
            img.Parent = tile
            CreateCorner(img, 10)
        else
            CreateIcon(tile, "lucide-rocket", 26, Color3.new(1, 1, 1), UDim2.new(0.5, -13, 0.5, -13), 14)
        end

        local orbitDots = {}
        for i = 1, 3 do
            local od = CreateFrame(iconHolder, nil, currentTheme.Accent, 0, UDim2.new(0, 6, 0, 6), nil, 15)
            CreateCorner(od, 50)
            if i == 2 then od.BackgroundColor3 = currentTheme.AccentGradient end
            if i == 3 then od.BackgroundColor3 = Color3.new(1, 1, 1); od.Size = UDim2.new(0, 4, 0, 4) end
            orbitDots[i] = od
        end

        track(RunService.RenderStepped:Connect(function(dt)
            if not alive then return end
            local t = tick()
            local cx, cy = iconHolderSize / 2, iconHolderSize / 2
            local speeds = { 1.6, -2.2, 2.8 }
            local offsets = { 0, 2.1, 4.2 }
            local radius = iconHolderSize / 2 + 9
            for i, od in ipairs(orbitDots) do
                if od.Parent then
                    local a = t * speeds[i] + offsets[i]
                    od.Position = UDim2.new(0, cx + math.cos(a) * radius - od.Size.X.Offset / 2, 0, cy + math.sin(a) * radius - od.Size.Y.Offset / 2)
                    od.BackgroundTransparency = 0.15 + math.sin(t * 2 + i) * 0.2
                end
            end
            local pulse = (math.sin(t * 2.2) + 1) / 2
            if holderStroke.Parent then
                holderStroke.Transparency = 0.75 - pulse * 0.45
                holderStroke.Thickness = 1 + pulse * 0.8
            end
            if iconGlowBlob.Parent then
                local gk = 120 * (1 + pulse * 0.10)
                iconGlowBlob.Size = UDim2.new(0, gk, 0, gk)
            end
        end))

        local tx = pad + iconHolderSize + 16
        local tl = CreateLabel(card, nil, title, currentTheme.Text, 19, currentFont, UDim2.new(0, textW, 0, 24), UDim2.new(0, tx, 0, pad + 4), 12)
        tl.TextTruncate = Enum.TextTruncate.AtEnd
        tl.TextXAlignment = Enum.TextXAlignment.Left
        local dl
        if descH > 0 then
            dl = CreateLabel(card, nil, desc, currentTheme.TextMuted, 12, currentFont, UDim2.new(0, textW, 0, descH), UDim2.new(0, tx, 0, pad + 30), 12)
            dl.TextWrapped = true
            dl.RichText = true
            dl.TextYAlignment = Enum.TextYAlignment.Top
        end

        local sep1 = CreateFrame(card, nil, currentTheme.Border, 1, UDim2.new(1, -pad * 2, 0, 1), UDim2.new(0, pad, 0, sep1Y), 12)

        local barTag = CreateLabel(card, nil, "PROGRESS", currentTheme.TextMuted, 10, currentFont, UDim2.new(0, 120, 0, 12), UDim2.new(0, pad, 0, barLabelY), 12)
        barTag.TextXAlignment = Enum.TextXAlignment.Left
        local eta = CreateLabel(card, nil, string.format("0.0s / %.1fs", total), currentTheme.TextMuted, 10, currentFont, UDim2.new(0, 120, 0, 12), UDim2.new(1, -pad - 120, 0, barLabelY), 12)
        eta.TextXAlignment = Enum.TextXAlignment.Right

        local trackBar = CreateFrame(card, nil, currentTheme.Tertiary, 1, UDim2.new(1, -pad * 2, 0, 12), UDim2.new(0, pad, 0, trackY), 12)
        CreateCorner(trackBar, 6)
        NewStroke(trackBar, currentTheme.Border, 1, 0.6)

        local fill = CreateFrame(trackBar, nil, currentTheme.Accent, 0, UDim2.new(0, 0, 1, 0), nil, 13)
        CreateCorner(fill, 6)
        local fillGrad = NewGradient(fill, currentTheme.Accent, currentTheme.AccentGradient, 0)

        local shimmer = CreateFrame(fill, nil, Color3.new(1, 1, 1), 0, UDim2.new(0, 34, 1, 0), UDim2.new(0, -34, 0, 0), 14)
        CreateCorner(shimmer, 6)
        shimmer.Visible = false
        local shGrad = Instance.new("UIGradient")
        shGrad.Rotation = 18
        shGrad.Transparency = NumberSequence.new({
            NumberSequenceKeypoint.new(0, 1),
            NumberSequenceKeypoint.new(0.5, 0.55),
            NumberSequenceKeypoint.new(1, 1),
        })
        shGrad.Parent = shimmer

        local tipGlow = MakeGlow(card, currentTheme.Accent, 30, 0.45, 11)
        tipGlow.Position = UDim2.new(0, pad, 0, trackY + 6)
        tipGlow.Visible = false

        local dotsHolder = CreateFrame(card, nil, nil, 1, UDim2.new(1, -pad * 2, 0, dotsH), UDim2.new(0, pad, 0, dotsY), 12)
        local totalSteps = #stepList
        local availW = W - pad * 2
        local gap = totalSteps > 1 and math.min(64, availW / (totalSteps - 1)) or 0
        local startX = (availW - gap * (totalSteps - 1)) / 2
        local dots, connFills = {}, {}
        for i = 1, totalSteps do
            local cx = startX + (i - 1) * gap
            if i < totalSteps then
                local conn = CreateFrame(dotsHolder, nil, currentTheme.Border, 0.55, UDim2.new(0, gap - 10, 0, 2), UDim2.new(0, cx + 5, 0, dotsH / 2 - 1), 12)
                local cf = CreateFrame(conn, nil, currentTheme.Accent, 0, UDim2.new(0, 0, 1, 0), nil, 13)
                CreateCorner(cf, 1)
                connFills[i] = cf
            end
            local dot = CreateFrame(dotsHolder, nil, currentTheme.Tertiary, 0, UDim2.new(0, 8, 0, 8), UDim2.new(0, cx - 4, 0, dotsH / 2 - 4), 13)
            CreateCorner(dot, 50)
            local ds = NewStroke(dot, currentTheme.Border, 1, 0.3)
            dots[i] = { frame = dot, stroke = ds, x = cx }
        end

        local spinner = CreateIcon(card, "lucide-loader-2", 15, currentTheme.Accent, UDim2.new(0, pad, 0, statusY + 2), 12)
        local status = CreateLabel(card, nil, stepList[1][1], currentTheme.Text, 13, currentFont, UDim2.new(1, -pad * 2 - 150, 0, 16), UDim2.new(0, pad + 24, 0, statusY + 2), 12)
        status.TextXAlignment = Enum.TextXAlignment.Left
        local stepCounter = CreateLabel(card, nil, "1/" .. totalSteps, currentTheme.TextMuted, 11, currentFont, UDim2.new(0, 60, 0, 16), UDim2.new(1, -pad - 118, 0, statusY + 3), 12)
        stepCounter.TextXAlignment = Enum.TextXAlignment.Right
        local pct = CreateLabel(card, nil, "0%", currentTheme.Accent, 14, currentFont, UDim2.new(0, 52, 0, 18), UDim2.new(1, -pad - 52, 0, statusY + 2), 12)
        pct.TextXAlignment = Enum.TextXAlignment.Right

        local sep2 = CreateFrame(card, nil, currentTheme.Border, 1, UDim2.new(1, -pad * 2, 0, 1), UDim2.new(0, pad, 0, sep2Y), 12)
        local footer = CreateLabel(card, nil, hints[1], currentTheme.TextMuted, 10, currentFont, UDim2.new(1, -pad * 2, 0, 14), UDim2.new(0, pad, 0, footerY), 12)
        footer.TextXAlignment = Enum.TextXAlignment.Center
        footer.TextTransparency = 1

        local beamClip = Instance.new("Frame")
        beamClip.Name = EncriptyText(8)
        beamClip.BackgroundTransparency = 1
        beamClip.Size = UDim2.new(1, 0, 1, 0)
        beamClip.ClipsDescendants = true
        beamClip.ZIndex = 20
        beamClip.Parent = card
        CreateCorner(beamClip, 12)

        local beam = CreateFrame(beamClip, nil, Color3.new(1, 1, 1), 0, UDim2.new(0, 70, 1, 40), UDim2.new(-0.35, 0, 0, -20), 21)
        beam.Rotation = 18
        beam.Visible = false
        local beamGrad = Instance.new("UIGradient")
        beamGrad.Transparency = NumberSequence.new({
            NumberSequenceKeypoint.new(0, 1),
            NumberSequenceKeypoint.new(0.5, 0.9),
            NumberSequenceKeypoint.new(1, 1),
        })
        beamGrad.Parent = beam

        track(RunService.RenderStepped:Connect(function(dt)
            if not alive then return end
            if borderGrad.Parent then
                borderGrad.Rotation = (borderGrad.Rotation + 40 * dt) % 360
            end
            if spinner and spinner.Parent then
                if not completed then
                    spinner.Rotation = (spinner.Rotation + 420 * dt) % 360
                end
                local p = fill.Size.X.Scale
                pct.Text = math.floor(p * 100 + 0.5) .. "%"
                pct.TextColor3 = currentTheme.Accent:Lerp(SUCCESS, math.clamp((p - 0.8) / 0.2, 0, 1))
                local el = math.clamp(tick() - startTime, 0, total)
                if not completed then
                    eta.Text = string.format("%.1fs / %.1fs", el, total)
                end
                local tw = trackBar.AbsoluteSize.X
                if tw > 0 and tipGlow.Parent then
                    tipGlow.Visible = p > 0.02 and not completed
                    tipGlow.Position = UDim2.new(0, pad + p * tw, 0, trackY + 6)
                end
            end
        end))

        local parX, parY = 0, 0
        if UserInputService.MouseEnabled then
            track(RunService.RenderStepped:Connect(function(dt)
                if not alive or not card.Parent then return end
                local m = UserInputService:GetMouseLocation()
                local sz = card.AbsoluteSize
                if sz.X <= 0 then return end
                local cp = card.AbsolutePosition
                local nx = math.clamp((m.X - (cp.X + sz.X / 2)) / sz.X, -1, 1)
                local ny = math.clamp((m.Y - (cp.Y + sz.Y / 2)) / sz.Y, -1, 1)
                local k = math.min(dt * 5, 1)
                parX = parX + (nx * 5 - parX) * k
                parY = parY + (ny * 4 - parY) * k
                cardHolder.Position = UDim2.new(0.5, parX, 0.5, parY)
            end))
        end

        local function slideSwap(label, text, color)
            local base = label.Position
            TweenService:Create(label, TweenInfo.new(0.12, Enum.EasingStyle.Quad, Enum.EasingDirection.In), { TextTransparency = 1 }):Play()
            task.delay(0.12, function()
                if not (alive and label and label.Parent) then return end
                label.Text = text
                if color then label.TextColor3 = color end
                label.Position = base + UDim2.new(0, 0, 0, 5)
                TweenService:Create(label, TweenInfo.new(0.22, Enum.EasingStyle.Quint, Enum.EasingDirection.Out), {
                    TextTransparency = 0,
                    Position = base,
                }):Play()
            end)
        end

        task.spawn(function()
            task.wait(0.6)
            while alive do
                if fill.Size.X.Scale > 0.06 and shimmer.Parent then
                    shimmer.Visible = true
                    shimmer.Position = UDim2.new(0, -34, 0, 0)
                    TweenService:Create(shimmer, TweenInfo.new(0.7, Enum.EasingStyle.Quad, Enum.EasingDirection.InOut), { Position = UDim2.new(1, 0, 0, 0) }):Play()
                    task.wait(0.75)
                    shimmer.Visible = false
                    task.wait(0.35)
                else
                    task.wait(0.2)
                end
            end
        end)

        task.spawn(function()
            task.wait(0.9)
            while alive do
                if beam and beam.Parent then
                    beam.Visible = true
                    beam.Position = UDim2.new(-0.35, 0, 0, -20)
                    TweenService:Create(beam, TweenInfo.new(1.2, Enum.EasingStyle.Sine, Enum.EasingDirection.InOut), { Position = UDim2.new(1.15, 0, 0, -20) }):Play()
                end
                task.wait(2.4)
            end
        end)

        task.spawn(function()
            local hi = 1
            while alive do
                task.wait(1.7)
                if not alive or completed then break end
                hi = hi % #hints + 1
                TweenService:Create(footer, TweenInfo.new(0.2), { TextTransparency = 1 }):Play()
                task.wait(0.2)
                if not alive or completed then break end
                footer.Text = hints[hi]
                TweenService:Create(footer, TweenInfo.new(0.25), { TextTransparency = 0.25 }):Play()
            end
        end)

        local tileScale = Instance.new("UIScale")
        tileScale.Scale = 0.5
        tileScale.Parent = iconHolder

        TweenService:Create(overlay, TweenInfo.new(0.45, Enum.EasingStyle.Quart, Enum.EasingDirection.Out), { BackgroundTransparency = 0.42 }):Play()
        StageIn(card, scale, shadowLayers)

        later(0.10, function()
            TweenService:Create(tileScale, TweenInfo.new(0.5, Enum.EasingStyle.Back, Enum.EasingDirection.Out), { Scale = 1 }):Play()
            TweenService:Create(iconHolder, TweenInfo.new(0.3), { BackgroundTransparency = 0.55 }):Play()
        end)
        later(0.16, function() TweenService:Create(tl, TweenInfo.new(0.35), { TextTransparency = 0 }):Play() end)
        later(0.22, function() if dl then TweenService:Create(dl, TweenInfo.new(0.35), { TextTransparency = 0 }):Play() end end)
        later(0.28, function()
            TweenService:Create(sep1, TweenInfo.new(0.3), { BackgroundTransparency = 0.5 }):Play()
            TweenService:Create(barTag, TweenInfo.new(0.3), { TextTransparency = 0 }):Play()
            TweenService:Create(eta, TweenInfo.new(0.3), { TextTransparency = 0 }):Play()
            TweenService:Create(trackBar, TweenInfo.new(0.3), { BackgroundTransparency = 0.15 }):Play()
        end)
        later(0.34, function()
            TweenService:Create(status, TweenInfo.new(0.3), { TextTransparency = 0 }):Play()
            TweenService:Create(stepCounter, TweenInfo.new(0.3), { TextTransparency = 0 }):Play()
            TweenService:Create(pct, TweenInfo.new(0.3), { TextTransparency = 0 }):Play()
        end)
        later(0.40, function()
            TweenService:Create(sep2, TweenInfo.new(0.3), { BackgroundTransparency = 0.6 }):Play()
            TweenService:Create(footer, TweenInfo.new(0.35), { TextTransparency = 0.25 }):Play()
        end)

        task.wait(0.45)

        for idx, st in ipairs(stepList) do
            slideSwap(status, st[1])
            stepCounter.Text = idx .. "/" .. totalSteps

            local d = dots[idx]
            if d then
                TweenService:Create(d.frame, TweenInfo.new(0.4, Enum.EasingStyle.Back, Enum.EasingDirection.Out), {
                    BackgroundColor3 = currentTheme.Accent,
                    Size = UDim2.new(0, 10, 0, 10),
                    Position = UDim2.new(0, d.x - 5, 0, dotsH / 2 - 5),
                }):Play()
                TweenService:Create(d.stroke, TweenInfo.new(0.3), { Color = currentTheme.Accent, Transparency = 0 }):Play()
            end
            if idx > 1 and connFills[idx - 1] then
                TweenService:Create(connFills[idx - 1], TweenInfo.new(math.max(0.25, st[3] * 0.8), Enum.EasingStyle.Quad, Enum.EasingDirection.Out), { Size = UDim2.new(1, 0, 1, 0) }):Play()
            end

            TweenService:Create(fill, TweenInfo.new(st[3], Enum.EasingStyle.Quad, Enum.EasingDirection.Out), { Size = UDim2.new(st[2], 0, 1, 0) }):Play()
            task.wait(st[3])
        end

        completed = true
        task.wait(0.15)

        fillGrad.Color = ColorSequence.new({
            ColorSequenceKeypoint.new(0, SUCCESS),
            ColorSequenceKeypoint.new(1, SUCCESS:Lerp(Color3.new(1, 1, 1), 0.25)),
        })
        eta.Text = string.format("%.1fs / %.1fs", total, total)

        TweenService:Create(spinner, TweenInfo.new(0.16, Enum.EasingStyle.Quad, Enum.EasingDirection.In), { ImageTransparency = 1 }):Play()
        task.wait(0.16)
        spinner.Image = ResolveIcon("lucide-check-circle-2") or spinner.Image
        spinner.ImageColor3 = SUCCESS
        spinner.Rotation = 0
        spinner.Size = UDim2.new(0, 10, 0, 10)
        TweenService:Create(spinner, TweenInfo.new(0.4, Enum.EasingStyle.Back, Enum.EasingDirection.Out), { ImageTransparency = 0, Size = UDim2.new(0, 17, 0, 17) }):Play()

        slideSwap(status, "Ready!", SUCCESS)
        stepCounter.Text = totalSteps .. "/" .. totalSteps
        pct.Text = "100%"
        pct.TextColor3 = SUCCESS

        TweenService:Create(footer, TweenInfo.new(0.2), { TextTransparency = 1 }):Play()
        later(0.2, function()
            footer.Text = "All done! Launching..."
            TweenService:Create(footer, TweenInfo.new(0.25), { TextTransparency = 0.15 }):Play()
        end)

        do
            local colors = { currentTheme.Accent, currentTheme.AccentGradient, SUCCESS, Color3.new(1, 1, 1) }
            local pieces = {}
            for i = 1, 18 do
                local f = Instance.new("Frame")
                f.Name = EncriptyText(6)
                f.BackgroundColor3 = colors[math.random(#colors)]
                f.BorderSizePixel = 0
                f.Size = UDim2.new(0, math.random(3, 6), 0, math.random(3, 6))
                f.Position = UDim2.new(0.5, 0, 0, trackY + 6)
                f.ZIndex = 22
                f.Parent = card
                if math.random() > 0.5 then CreateCorner(f, 50) end
                pieces[i] = {
                    inst = f,
                    vx = (math.random() - 0.5) * 320,
                    vy = -math.random(90, 230),
                    vr = (math.random() - 0.5) * 540,
                }
            end
            local t0 = tick()
            local bc
            bc = RunService.RenderStepped:Connect(function(dt)
                local el = tick() - t0
                for _, pp in ipairs(pieces) do
                    if pp.inst.Parent then
                        local x = pp.vx * el
                        local y = pp.vy * el + 420 * el * el
                        pp.inst.Position = UDim2.new(0.5, x, 0, trackY + 6 + y)
                        pp.inst.Rotation = pp.inst.Rotation + pp.vr * dt
                        pp.inst.BackgroundTransparency = math.clamp(el / 0.95, 0, 1)
                    end
                end
                if el > 1 then
                    bc:Disconnect()
                    for _, pp in ipairs(pieces) do
                        if pp.inst.Parent then pp.inst:Destroy() end
                    end
                end
            end)
        end

        task.wait(0.75)

        StageOut(card, scale, shadowLayers, 0.3)
        TweenService:Create(overlay, TweenInfo.new(0.35, Enum.EasingStyle.Quad, Enum.EasingDirection.In), { BackgroundTransparency = 1 }):Play()
        task.wait(0.4)
    end)

    alive = false
    for _, c in ipairs(conns) do pcall(function() c:Disconnect() end) end
    pcall(function() gui:Destroy() end)
    ShowLibrary(saved)
    getgenv().ABC7472 = false
    if not ok then warn("[DiscordLib] Loader error: " .. tostring(err)) end
end

function DiscordLib:KeySystem(e)
    if DiscordLib._keyAborted then return nil end
    if getgenv().ABC7472 or getgenv().ABC8281 or getgenv().ABC3616 then return nil end
    e = e or {}
    local haltOnFail = e.haltOnFail ~= false
    local keys = {}
    local function addKey(k) if type(k) == "string" and k ~= "" then keys[k] = true end end
    if type(e.key) == "table" then for _, k in ipairs(e.key) do addKey(k) end else addKey(e.key) end
    if type(e.encryptedKey) == "table" then for _, k in ipairs(e.encryptedKey) do addKey(k) end else addKey(e.encryptedKey) end
    local validate = type(e.validate) == "function" and e.validate or nil
    local title = tostring(e.title or "Key System")
    local note = tostring(e.note or "")
    local image = e.image
    local onSuccess = e.callback
    local onCancel = e.cancelCallback
    local link = e.link or e.keyLink or e.getKey
    local maxAttempts = tonumber(e.maxAttempts) or 5
    local SUCCESS = Color3.fromRGB(87, 242, 135)
    local WARNING = Color3.fromRGB(255, 186, 66)

    getgenv().ABC3616 = true
    local saved = HideLibrary()
    local gui = CreateScreenGui("KeySystem_", 5000)
    local finished = false
    local alive = true
    local conns = {}
    local api = {}

    local function track(c) table.insert(conns, c); return c end
    local function later(d, fn) task.delay(d, function() if alive then pcall(fn) end end) end

    local function finish(kind)
        if finished then return end
        finished = true
        alive = false
        for _, c in ipairs(conns) do pcall(function() c:Disconnect() end) end
        pcall(function() gui:Destroy() end)
        api.Success = (kind == "success")
        if kind == "success" then
            ShowLibrary(saved)
            getgenv().ABC3616 = false
            if type(onSuccess) == "function" then task.spawn(onSuccess) end
        else
            DiscordLib._keyAborted = true
            pcall(function() DiscordLib:Destroy() end)
            getgenv().ABC3616 = false
            if type(onCancel) == "function" then task.spawn(onCancel) end
        end
    end

    local ok, err = pcall(function()
        local overlay = CreateFrame(gui, nil, Color3.new(0, 0, 0), 1, UDim2.new(1, 0, 1, 0), nil, 10)
        overlay.ClipsDescendants = true
        overlay.Active = true

        MakeVignette(overlay, 8)

        local particles = {}

        local function randColor()
            local r = math.random()
            if r < 0.45 then return currentTheme.Accent end
            if r < 0.70 then return currentTheme.AccentGradient end
            if r < 0.85 then return Color3.new(1, 1, 1) end
            return currentTheme.TextMuted
        end

        for i = 1, 18 do
            local size = math.random(2, 3)
            local p = Instance.new("Frame")
            p.Name = EncriptyText(8)
            p.BackgroundColor3 = randColor()
            p.BackgroundTransparency = math.random(74, 92) / 100
            p.BorderSizePixel = 0
            p.Size = UDim2.new(0, size, 0, size)
            p.Position = UDim2.new(math.random(), 0, math.random(), 0)
            p.ZIndex = 9
            p.Parent = overlay
            CreateCorner(p, 50)
            particles[#particles + 1] = {
                inst = p, kind = "dot",
                x = p.Position.X.Scale, y = p.Position.Y.Scale,
                speed = 0.015 + math.random() * 0.03,
                amp = 0.003 + math.random() * 0.008,
                sway = 0.4 + math.random() * 1.0,
                phase = math.random() * math.pi * 2,
                twSpeed = 0.8 + math.random() * 1.4,
                twPhase = math.random() * math.pi * 2,
                baseT = p.BackgroundTransparency,
            }
        end

        local nodes = {}
        for i = 1, 10 do
            local size = math.random(3, 5)
            local p = Instance.new("Frame")
            p.Name = EncriptyText(8)
            p.BackgroundColor3 = randColor()
            p.BackgroundTransparency = math.random(55, 80) / 100
            p.BorderSizePixel = 0
            p.Size = UDim2.new(0, size, 0, size)
            p.Position = UDim2.new(math.random(), 0, math.random(), 0)
            p.ZIndex = 10
            p.Parent = overlay
            CreateCorner(p, 50)
            local obj = {
                inst = p, kind = "node",
                x = p.Position.X.Scale, y = p.Position.Y.Scale,
                speed = 0.03 + math.random() * 0.05,
                amp = 0.006 + math.random() * 0.014,
                sway = 0.6 + math.random() * 1.6,
                phase = math.random() * math.pi * 2,
                twSpeed = 1.0 + math.random() * 1.6,
                twPhase = math.random() * math.pi * 2,
                baseT = p.BackgroundTransparency,
            }
            particles[#particles + 1] = obj
            nodes[#nodes + 1] = obj
        end

        local sparkles = {}
        for i = 1, 6 do
            local size = math.random(6, 10)
            local col = randColor()
            local c = Instance.new("Frame")
            c.Name = EncriptyText(8)
            c.BackgroundTransparency = 1
            c.Size = UDim2.new(0, size, 0, size)
            c.Position = UDim2.new(math.random(), 0, math.random(), 0)
            c.ZIndex = 10
            c.Parent = overlay
            local h = Instance.new("Frame")
            h.BackgroundColor3 = col; h.BorderSizePixel = 0
            h.Size = UDim2.new(1, 0, 0, 1); h.Position = UDim2.new(0, 0, 0.5, -0.5)
            h.ZIndex = 10; h.Parent = c
            local v = Instance.new("Frame")
            v.BackgroundColor3 = col; v.BorderSizePixel = 0
            v.Size = UDim2.new(0, 1, 1, 0); v.Position = UDim2.new(0.5, -0.5, 0, 0)
            v.ZIndex = 10; v.Parent = c
            sparkles[#sparkles + 1] = {
                inst = c, h = h, v = v,
                x = c.Position.X.Scale, y = c.Position.Y.Scale,
                speed = 0.02 + math.random() * 0.035,
                amp = 0.004 + math.random() * 0.01,
                sway = 0.5 + math.random() * 1.2,
                phase = math.random() * math.pi * 2,
                rot = math.random() * 360,
                rotSpeed = (math.random() > 0.5 and 1 or -1) * (20 + math.random() * 40),
                twSpeed = 1.2 + math.random() * 1.6,
                twPhase = math.random() * math.pi * 2,
            }
        end

        local rings = {}
        for i = 1, 4 do
            local size = math.random(10, 18)
            local ring = Instance.new("Frame")
            ring.Name = EncriptyText(8)
            ring.BackgroundTransparency = 1
            ring.Size = UDim2.new(0, size, 0, size)
            ring.Position = UDim2.new(math.random(), 0, math.random(), 0)
            ring.ZIndex = 9
            ring.Parent = overlay
            CreateCorner(ring, 50)
            local rs = NewStroke(ring, randColor(), 1, math.random(60, 80) / 100)
            rings[#rings + 1] = {
                inst = ring, stroke = rs,
                x = ring.Position.X.Scale, y = ring.Position.Y.Scale,
                speed = 0.012 + math.random() * 0.02,
                amp = 0.003 + math.random() * 0.007,
                sway = 0.3 + math.random() * 0.8,
                phase = math.random() * math.pi * 2,
                twSpeed = 0.6 + math.random() * 0.9,
                twPhase = math.random() * math.pi * 2,
            }
        end

        local MAX_LINES = 20
        local linePool = {}
        for i = 1, MAX_LINES do
            local ln = Instance.new("Frame")
            ln.Name = EncriptyText(8)
            ln.BackgroundColor3 = currentTheme.Accent
            ln.BackgroundTransparency = 0.9
            ln.BorderSizePixel = 0
            ln.AnchorPoint = Vector2.new(0.5, 0.5)
            ln.ZIndex = 9
            ln.Visible = false
            ln.Parent = overlay
            linePool[i] = ln
        end

        local blobA = MakeGlow(overlay, currentTheme.Accent, 500, 0.12, 8)
        local blobB = MakeGlow(overlay, currentTheme.AccentGradient, 430, 0.10, 8)

        local parX, parY = 0, 0
        local shakeX, shakeY = 0, 0
        local cardRef = nil

        track(RunService.RenderStepped:Connect(function(dt)
            if not alive then return end
            local t = tick()
            local sz = overlay.AbsoluteSize


            for _, p in ipairs(particles) do
                p.y = p.y - p.speed * dt
                if p.y < -0.04 then p.y = 1.04; p.x = math.random() end
                local xx = p.x + math.sin(t * p.sway + p.phase) * p.amp
                if p.inst.Parent then
                    p.inst.Position = UDim2.new(xx, 0, p.y, 0)
                    local tw = math.sin(t * p.twSpeed + p.twPhase)
                    p.inst.BackgroundTransparency = math.clamp(p.baseT + tw * 0.15, 0.3, 1)
                end
            end

            for _, s in ipairs(sparkles) do
                s.y = s.y - s.speed * dt
                if s.y < -0.05 then s.y = 1.05; s.x = math.random() end
                local xx = s.x + math.sin(t * s.sway + s.phase) * s.amp
                s.rot = (s.rot + s.rotSpeed * dt) % 360
                if s.inst.Parent then
                    s.inst.Position = UDim2.new(xx, 0, s.y, 0)
                    s.inst.Rotation = s.rot
                    local tw = (math.sin(t * s.twSpeed + s.twPhase) + 1) / 2
                    local alpha = 0.55 + tw * 0.4
                    s.h.BackgroundTransparency = 1 - alpha
                    s.v.BackgroundTransparency = 1 - alpha
                end
            end

            for _, r in ipairs(rings) do
                r.y = r.y - r.speed * dt
                if r.y < -0.06 then r.y = 1.06; r.x = math.random() end
                local xx = r.x + math.sin(t * r.sway + r.phase) * r.amp
                if r.inst.Parent then
                    r.inst.Position = UDim2.new(xx, 0, r.y, 0)
                    local tw = (math.sin(t * r.twSpeed + r.twPhase) + 1) / 2
                    r.stroke.Transparency = 0.85 - tw * 0.35
                end
            end

            if sz.X > 0 then
                local nodePos = {}
                for i = 1, #nodes do
                    nodePos[i] = Vector2.new(nodes[i].x * sz.X, nodes[i].y * sz.Y)
                end
                local lineIdx = 0
                local threshold = 140
                for i = 1, #nodes do
                    for j = i + 1, #nodes do
                        if lineIdx >= MAX_LINES then break end
                        local d = (nodePos[i] - nodePos[j]).Magnitude
                        if d < threshold then
                            lineIdx = lineIdx + 1
                            local ln = linePool[lineIdx]
                            ln.Visible = true
                            local mid = (nodePos[i] + nodePos[j]) * 0.5
                            local ang = math.atan2(nodePos[j].Y - nodePos[i].Y, nodePos[j].X - nodePos[i].X)
                            ln.Size = UDim2.new(0, d, 0, 1)
                            ln.Position = UDim2.new(0, mid.X, 0, mid.Y)
                            ln.Rotation = math.deg(ang)
                            local strength = 1 - (d / threshold)
                            ln.BackgroundTransparency = 0.96 - strength * 0.28
                        end
                    end
                end
                for i = lineIdx + 1, MAX_LINES do linePool[i].Visible = false end
            end

            if blobA.Parent then
                blobA.Position = UDim2.new(0.5 + math.sin(t * 0.3) * 0.05, 0, 0.4 + math.cos(t * 0.25) * 0.04, 0)
            end
            if blobB.Parent then
                blobB.Position = UDim2.new(0.5 - math.sin(t * 0.28) * 0.06, 0, 0.6 - math.cos(t * 0.3) * 0.04, 0)
            end

            if cardRef and cardRef.Parent then
                if UserInputService.MouseEnabled then
                    local m = UserInputService:GetMouseLocation()
                    local csz = cardRef.AbsoluteSize
                    if csz.X > 0 then
                        local cp = cardRef.AbsolutePosition
                        local nx = math.clamp((m.X - (cp.X + csz.X / 2)) / csz.X, -1, 1)
                        local ny = math.clamp((m.Y - (cp.Y + csz.Y / 2)) / csz.Y, -1, 1)
                        local k = math.min(dt * 4, 1)
                        parX = parX + (nx * 5 - parX) * k
                        parY = parY + (ny * 4 - parY) * k
                    end
                end
                cardRef.Position = UDim2.new(0.5, parX + shakeX, 0.5, parY + shakeY)
            end
        end))

        local W = 420
        local pad = 28
        local noteH = (note ~= "") and math.max(14, MeasureText(note, 12, currentFont, W - pad * 2).Y) or 0
        local logoSize = 76
        local tileSize = 50

        local y = pad + 6
        local logoY = y
        y = y + logoSize + 18
        local titleY = y
        y = y + 26
        local noteY = y + 2
        if noteH > 0 then y = noteY + noteH end
        y = y + 14
        local sep1Y = y
        y = y + 14
        local inputLabelY = y
        y = y + 18
        local inputY = y
        y = y + 48 + 8
        local attemptsY = y
        y = y + 22 + 10
        local statusY = y
        y = y + 20 + 12
        local btnY = y
        y = y + 44
        local linkY
        if link then y = y + 10; linkY = y; y = y + 34 end
        local H = y + pad

        local card, cardStroke, scale, cardHolder, shadowLayers = CreateStageCard(overlay, W, H, 11)
        cardRef = cardHolder
        cardStroke.Thickness = 1.5
        cardStroke.Transparency = 0.2

        local borderGrad = Instance.new("UIGradient")
        borderGrad.Rotation = 0
        borderGrad.Color = ColorSequence.new({
            ColorSequenceKeypoint.new(0, currentTheme.Accent),
            ColorSequenceKeypoint.new(0.5, currentTheme.AccentGradient),
            ColorSequenceKeypoint.new(1, currentTheme.Accent),
        })
        borderGrad.Parent = cardStroke

        track(RunService.RenderStepped:Connect(function(dt)
            if not alive then return end
            if borderGrad.Parent then
                borderGrad.Rotation = (borderGrad.Rotation + 30 * dt) % 360
            end
        end))

        local topLine = CreateFrame(card, nil, currentTheme.Accent, 0, UDim2.new(0.5, 0, 0, 3), UDim2.new(0.25, 0, 0, 0), 12)
        CreateCorner(topLine, 2)
        NewGradient(topLine, currentTheme.Accent, currentTheme.AccentGradient, 0)

        local innerGlow = CreateFrame(card, nil, Color3.new(1, 1, 1), 0, UDim2.new(1, -2, 0, 50), UDim2.new(0, 1, 0, 1), 11)
        local igGrad = Instance.new("UIGradient")
        igGrad.Rotation = 90
        igGrad.Transparency = NumberSequence.new({
            NumberSequenceKeypoint.new(0, 0.92),
            NumberSequenceKeypoint.new(1, 1),
        })
        igGrad.Parent = innerGlow

        local scanClip = Instance.new("Frame")
        scanClip.Name = EncriptyText(8)
        scanClip.BackgroundTransparency = 1
        scanClip.Size = UDim2.new(1, 0, 1, 0)
        scanClip.ClipsDescendants = true
        scanClip.ZIndex = 20
        scanClip.Parent = card
        CreateCorner(scanClip, 12)
        local scan = CreateFrame(scanClip, nil, Color3.new(1, 1, 1), 0, UDim2.new(1, 40, 0, 60), UDim2.new(0, -20, 0, -80), 21)
        scan.Rotation = 12
        scan.Visible = false
        local scanGrad = Instance.new("UIGradient")
        scanGrad.Rotation = 90
        scanGrad.Transparency = NumberSequence.new({
            NumberSequenceKeypoint.new(0, 1),
            NumberSequenceKeypoint.new(0.5, 0.94),
            NumberSequenceKeypoint.new(1, 1),
        })
        scanGrad.Parent = scan

        task.spawn(function()
            task.wait(1.0)
            while alive do
                if scan and scan.Parent then
                    scan.Visible = true
                    scan.Position = UDim2.new(0, -20, 0, -80)
                    TweenService:Create(scan, TweenInfo.new(1.6, Enum.EasingStyle.Sine, Enum.EasingDirection.InOut), {
                        Position = UDim2.new(0, -20, 1, 20)
                    }):Play()
                    task.wait(1.7)
                    scan.Visible = false
                end
                task.wait(3.2)
            end
        end)

        local iconGlowBlob = MakeGlow(card, currentTheme.Accent, 124, 0.16, 11)
        iconGlowBlob.Position = UDim2.new(0.5, 0, 0, logoY + logoSize / 2)

        local iconHolder = CreateFrame(card, nil, currentTheme.Secondary, 1, UDim2.new(0, logoSize, 0, logoSize), UDim2.new(0.5, -logoSize / 2, 0, logoY), 12)
        iconHolder.ClipsDescendants = false
        CreateCorner(iconHolder, logoSize / 2)
        local holderStroke = NewStroke(iconHolder, currentTheme.Accent, 1, 0.7)

        local decoRing = Instance.new("Frame")
        decoRing.Name = EncriptyText(8)
        decoRing.BackgroundTransparency = 1
        decoRing.Size = UDim2.new(0, logoSize + 14, 0, logoSize + 14)
        decoRing.Position = UDim2.new(0.5, -(logoSize + 14) / 2, 0.5, -(logoSize + 14) / 2)
        decoRing.ZIndex = 12
        decoRing.Parent = iconHolder
        CreateCorner(decoRing, 50)
        local decoStroke = NewStroke(decoRing, currentTheme.Accent, 1, 0.75)

        local tile = CreateFrame(iconHolder, nil, currentTheme.Accent, 0, UDim2.new(0, tileSize, 0, tileSize), UDim2.new(0.5, -tileSize / 2, 0.5, -tileSize / 2), 13)
        CreateCorner(tile, 14)
        NewGradient(tile, currentTheme.Accent, currentTheme.AccentGradient, 45)
        NewStroke(tile, Color3.new(1, 1, 1), 1, 0.75)

        if image and tostring(image) ~= "" then
            local img = Instance.new("ImageLabel")
            img.BackgroundTransparency = 1
            img.Size = UDim2.new(1, -8, 1, -8)
            img.Position = UDim2.new(0, 4, 0, 4)
            img.Image = ResolveIcon(image) or tostring(image)
            img.ScaleType = Enum.ScaleType.Fit
            img.ZIndex = 14
            img.Parent = tile
            CreateCorner(img, 10)
        else
            CreateIcon(tile, "lucide-key", 26, Color3.new(1, 1, 1), UDim2.new(0.5, -13, 0.5, -13), 14)
        end

        local orbitDots = {}
        for i = 1, 3 do
            local od = CreateFrame(iconHolder, nil, currentTheme.Accent, 0, UDim2.new(0, 6, 0, 6), nil, 15)
            CreateCorner(od, 50)
            if i == 2 then od.BackgroundColor3 = currentTheme.AccentGradient end
            if i == 3 then od.BackgroundColor3 = Color3.new(1, 1, 1); od.Size = UDim2.new(0, 4, 0, 4) end
            orbitDots[i] = od
        end

        track(RunService.RenderStepped:Connect(function(dt)
            if not alive then return end
            local t = tick()
            local cx, cy = logoSize / 2, logoSize / 2
            local speeds = { 1.4, -2.0, 2.6 }
            local offsets = { 0, 2.1, 4.2 }
            local radius = logoSize / 2 + 7
            for i, od in ipairs(orbitDots) do
                if od.Parent then
                    local a = t * speeds[i] + offsets[i]
                    od.Position = UDim2.new(0, cx + math.cos(a) * radius - od.Size.X.Offset / 2, 0, cy + math.sin(a) * radius - od.Size.Y.Offset / 2)
                    od.BackgroundTransparency = 0.15 + math.sin(t * 2 + i) * 0.2
                end
            end
            local pulse = (math.sin(t * 2.0) + 1) / 2
            if holderStroke.Parent then
                holderStroke.Transparency = 0.75 - pulse * 0.4
                holderStroke.Thickness = 1 + pulse * 0.7
            end
            if iconGlowBlob.Parent then
                local gk = 124 * (1 + pulse * 0.10)
                iconGlowBlob.Size = UDim2.new(0, gk, 0, gk)
            end

            if iconHolder.Parent then
                local bob = math.sin(t * 1.5) * 3
                iconHolder.Position = UDim2.new(0.5, -logoSize / 2, 0, logoY + bob)
                iconGlowBlob.Position = UDim2.new(0.5, 0, 0, logoY + logoSize / 2 + bob)
            end

            if decoRing.Parent then
                decoRing.Rotation = (t * 40) % 360
                decoStroke.Transparency = 0.7 + math.sin(t * 2.2) * 0.15
            end
        end))

        local tl = CreateLabel(card, nil, title, currentTheme.Text, 20, currentFont, UDim2.new(1, -pad * 2, 0, 26), UDim2.new(0, pad, 0, titleY), 12)
        tl.TextXAlignment = Enum.TextXAlignment.Center
        tl.TextTransparency = 1

        local nl
        if noteH > 0 then
            nl = CreateLabel(card, nil, note, currentTheme.TextMuted, 12, currentFont, UDim2.new(1, -pad * 2, 0, noteH), UDim2.new(0, pad, 0, noteY), 12)
            nl.TextXAlignment = Enum.TextXAlignment.Center
            nl.TextYAlignment = Enum.TextYAlignment.Top
            nl.TextWrapped = true
            nl.RichText = true
            nl.TextTransparency = 1
        end

        local sep1 = CreateFrame(card, nil, currentTheme.Border, 1, UDim2.new(1, -pad * 2, 0, 1), UDim2.new(0, pad, 0, sep1Y), 12)
        sep1.BackgroundTransparency = 1

        local inputTag = CreateLabel(card, nil, "ACCESS KEY", currentTheme.TextMuted, 10, currentFont, UDim2.new(0, 120, 0, 14), UDim2.new(0, pad, 0, inputLabelY), 12)
        inputTag.TextXAlignment = Enum.TextXAlignment.Left
        inputTag.TextTransparency = 1

        local inputGlow = CreateFrame(card, nil, currentTheme.Accent, 1, UDim2.new(1, -pad * 2 + 8, 0, 56), UDim2.new(0, pad - 4, 0, inputY - 4), 11)
        CreateCorner(inputGlow, 14)

        local inputFrame = CreateFrame(card, nil, currentTheme.Secondary, 1, UDim2.new(1, -pad * 2, 0, 48), UDim2.new(0, pad, 0, inputY), 12)
        CreateCorner(inputFrame, 10)
        local inputStroke = NewStroke(inputFrame, currentTheme.Border, 1.2, 0.3)

        local lockIcon = CreateIcon(inputFrame, "lucide-lock", 18, currentTheme.TextMuted, UDim2.new(0, 16, 0.5, -9), 13)
        lockIcon.ImageTransparency = 1

        local KeyInput = Instance.new("TextBox")
        KeyInput.Name = ENC.KeyInput
        KeyInput.Parent = inputFrame
        KeyInput.BackgroundTransparency = 1
        KeyInput.BorderSizePixel = 0
        KeyInput.Position = UDim2.new(0, 44, 0, 0)
        KeyInput.Size = UDim2.new(1, -58, 1, 0)
        KeyInput.Font = currentFont
        KeyInput.PlaceholderText = "Enter your key..."
        KeyInput.PlaceholderColor3 = currentTheme.TextMuted
        KeyInput.Text = ""
        KeyInput.TextColor3 = currentTheme.Text
        KeyInput.TextSize = 14
        KeyInput.TextXAlignment = Enum.TextXAlignment.Left
        KeyInput.ClearTextOnFocus = false
        KeyInput.ZIndex = 13
        KeyInput.TextTransparency = 1
        KeyInput.PlaceholderColor3 = currentTheme.Secondary

        local focusBar = CreateFrame(inputFrame, nil, currentTheme.Accent, 0, UDim2.new(0, 0, 0, 2), UDim2.new(0.5, 0, 1, -1), 14)
        focusBar.AnchorPoint = Vector2.new(0.5, 0)
        CreateCorner(focusBar, 1)
        NewGradient(focusBar, currentTheme.Accent, currentTheme.AccentGradient, 0)

        KeyInput.Focused:Connect(function()
            TweenService:Create(inputStroke, TweenInfo.new(0.25, Enum.EasingStyle.Quad, Enum.EasingDirection.Out), { Color = currentTheme.Accent, Transparency = 0 }):Play()
            TweenService:Create(lockIcon, TweenInfo.new(0.25), { ImageColor3 = currentTheme.Accent }):Play()
            TweenService:Create(inputGlow, TweenInfo.new(0.35, Enum.EasingStyle.Quad, Enum.EasingDirection.Out), { BackgroundTransparency = 0.82 }):Play()
            TweenService:Create(focusBar, TweenInfo.new(0.35, Enum.EasingStyle.Back, Enum.EasingDirection.Out), { Size = UDim2.new(1, -28, 0, 2) }):Play()
        end)
        KeyInput.FocusLost:Connect(function()
            TweenService:Create(inputStroke, TweenInfo.new(0.25), { Color = currentTheme.Border, Transparency = 0.3 }):Play()
            TweenService:Create(lockIcon, TweenInfo.new(0.25), { ImageColor3 = currentTheme.TextMuted }):Play()
            TweenService:Create(inputGlow, TweenInfo.new(0.3), { BackgroundTransparency = 1 }):Play()
            TweenService:Create(focusBar, TweenInfo.new(0.25), { Size = UDim2.new(0, 0, 0, 2) }):Play()
        end)

        local attemptsLabel = CreateLabel(card, nil, "Attempts remaining:", currentTheme.TextMuted, 11, currentFont, UDim2.new(0, 130, 0, 16), UDim2.new(0, pad, 0, attemptsY + 3), 12)
        attemptsLabel.TextXAlignment = Enum.TextXAlignment.Left
        attemptsLabel.TextTransparency = 1

        local attemptDots = {}
        local dotsStartX = pad + 135
        for i = 1, maxAttempts do
            local dot = CreateFrame(card, nil, currentTheme.Accent, 1, UDim2.new(0, 8, 0, 8), UDim2.new(0, dotsStartX + (i - 1) * 15 + 4, 0, attemptsY + 11), 12)
            dot.AnchorPoint = Vector2.new(0.5, 0.5)
            CreateCorner(dot, 50)
            NewStroke(dot, currentTheme.Border, 0.5, 0.5)
            attemptDots[i] = dot
        end

        track(RunService.RenderStepped:Connect(function(dt)
            if not alive then return end
            local t = tick()
            for i, dot in ipairs(attemptDots) do
                if dot.Parent and dot.BackgroundTransparency < 0.5 then
                    local s = 1 + math.sin(t * 2.5 + i * 0.5) * 0.12
                    dot.Size = UDim2.new(0, math.floor(8 * s), 0, math.floor(8 * s))
                end
            end
        end))

        local function updateAttemptDots(used)
            for i = 1, maxAttempts do
                if i <= (maxAttempts - used) then
                    TweenService:Create(attemptDots[i], TweenInfo.new(0.3), { BackgroundColor3 = currentTheme.Accent, BackgroundTransparency = 0 }):Play()
                else
                    TweenService:Create(attemptDots[i], TweenInfo.new(0.4, Enum.EasingStyle.Back, Enum.EasingDirection.Out), { BackgroundColor3 = DANGER_COLOR, BackgroundTransparency = 0.35 }):Play()
                end
            end
        end

        local statusIcon = CreateIcon(card, "lucide-info", 14, currentTheme.TextMuted, UDim2.new(0, pad, 0, statusY + 3), 12)
        statusIcon.ImageTransparency = 1
        local statusLabel = CreateLabel(card, nil, "", currentTheme.TextMuted, 12, currentFont, UDim2.new(1, -pad * 2 - 22, 0, 18), UDim2.new(0, pad + 22, 0, statusY), 12)
        statusLabel.TextTransparency = 1

        local function setStatus(text, color, iconName)
            statusLabel.Text = text
            statusLabel.TextColor3 = color
            statusIcon.ImageColor3 = color
            statusIcon.Image = ResolveIcon(iconName) or ""
            if text ~= "" then
                local basePos = statusLabel.Position
                statusLabel.Position = basePos + UDim2.new(0, 0, 0, 6)
                statusIcon.Position = UDim2.new(0, pad, 0, statusY + 9)
                TweenService:Create(statusIcon, TweenInfo.new(0.25, Enum.EasingStyle.Quint, Enum.EasingDirection.Out), { ImageTransparency = 0, Position = UDim2.new(0, pad, 0, statusY + 3) }):Play()
                TweenService:Create(statusLabel, TweenInfo.new(0.25, Enum.EasingStyle.Quint, Enum.EasingDirection.Out), { TextTransparency = 0, Position = basePos }):Play()
            else
                TweenService:Create(statusIcon, TweenInfo.new(0.2), { ImageTransparency = 1 }):Play()
                TweenService:Create(statusLabel, TweenInfo.new(0.2), { TextTransparency = 1 }):Play()
            end
        end

        local half = (W - pad * 2 - 10) / 2
        local unlock = CreateTextButton(card, nil, UDim2.new(0, half, 0, 44), UDim2.new(0, pad, 0, btnY), 12)
        unlock.Text = ""
        CreateCorner(unlock, 10)
        StyleButton(unlock, "Primary")
        local _, unlockLabel, unlockIcon = CreateIconTextRow(unlock, "lucide-log-in", "Unlock", Color3.new(1, 1, 1), 13, 13, 8)
        unlockLabel.TextTransparency = 1
        if unlockIcon then unlockIcon.ImageTransparency = 1 end
        local unlockScale = Instance.new("UIScale")
        unlockScale.Scale = 1
        unlockScale.Parent = unlock

        local cancel = CreateTextButton(card, nil, UDim2.new(0, half, 0, 44), UDim2.new(0, pad + half + 10, 0, btnY), 12)
        cancel.Text = ""
        CreateCorner(cancel, 10)
        StyleButton(cancel, "Secondary")
        local _, cancelLabel, cancelIcon = CreateIconTextRow(cancel, "lucide-x", "Cancel", currentTheme.Text, 13, 13, 8)
        cancelLabel.TextTransparency = 1
        if cancelIcon then cancelIcon.ImageTransparency = 1 end
        local cancelScale = Instance.new("UIScale")
        cancelScale.Scale = 1
        cancelScale.Parent = cancel

        local function ripple(btn)
            local r = Instance.new("Frame")
            r.Name = EncriptyText(6)
            r.BackgroundColor3 = Color3.new(1, 1, 1)
            r.BackgroundTransparency = 0.6
            r.BorderSizePixel = 0
            r.AnchorPoint = Vector2.new(0.5, 0.5)
            r.Size = UDim2.new(0, 4, 0, 4)
            r.Position = UDim2.new(0.5, 0, 0.5, 0)
            r.ZIndex = 15
            r.Parent = btn
            CreateCorner(r, 50)
            TweenService:Create(r, TweenInfo.new(0.5, Enum.EasingStyle.Quad, Enum.EasingDirection.Out), {
                Size = UDim2.new(0, 110, 0, 110),
                BackgroundTransparency = 1
            }):Play()
            task.delay(0.55, function() if r.Parent then r:Destroy() end end)
        end

        unlock.MouseEnter:Connect(function()
            TweenService:Create(unlockScale, TweenInfo.new(0.18, Enum.EasingStyle.Back, Enum.EasingDirection.Out), { Scale = 1.03 }):Play()
            TweenService:Create(unlock, TweenInfo.new(0.18), { BackgroundTransparency = 0.1 }):Play()
        end)
        unlock.MouseLeave:Connect(function()
            TweenService:Create(unlockScale, TweenInfo.new(0.18), { Scale = 1 }):Play()
            TweenService:Create(unlock, TweenInfo.new(0.18), { BackgroundTransparency = 0 }):Play()
        end)
        cancel.MouseEnter:Connect(function()
            TweenService:Create(cancelScale, TweenInfo.new(0.18, Enum.EasingStyle.Back, Enum.EasingDirection.Out), { Scale = 1.03 }):Play()
            TweenService:Create(cancel, TweenInfo.new(0.18), { BackgroundColor3 = currentTheme.Hover }):Play()
        end)
        cancel.MouseLeave:Connect(function()
            TweenService:Create(cancelScale, TweenInfo.new(0.18), { Scale = 1 }):Play()
            TweenService:Create(cancel, TweenInfo.new(0.18), { BackgroundColor3 = currentTheme.Tertiary }):Play()
        end)

        local lb, lbLabel, lbIcon
        if link then
            lb = CreateTextButton(card, nil, UDim2.new(1, -pad * 2, 0, 34), UDim2.new(0, pad, 0, linkY), 12)
            lb.Text = ""
            lb.BackgroundTransparency = 1
            lb.Font = currentFont
            lb.TextSize = 12
            lb.TextColor3 = currentTheme.Accent
            CreateCorner(lb, 8)
            local lbRow
            lbRow, lbLabel, lbIcon = CreateIconTextRow(lb, "lucide-external-link", "Get key", currentTheme.Accent, 12, 13, 7)
            lbLabel.TextTransparency = 1
            if lbIcon then lbIcon.ImageTransparency = 1 end
            lb.MouseButton1Click:Connect(function()
                local copied = false
                if setclipboard then copied = pcall(setclipboard, tostring(link)) end
                if copied then
                    setStatus("Link copied to clipboard", currentTheme.Accent, "lucide-check-circle")
                else
                    setStatus(tostring(link), currentTheme.Accent, "lucide-link")
                end
            end)
            lb.MouseEnter:Connect(function()
                TweenService:Create(lb, TweenInfo.new(0.15), { BackgroundTransparency = 0.85, BackgroundColor3 = currentTheme.Accent }):Play()
            end)
            lb.MouseLeave:Connect(function()
                TweenService:Create(lb, TweenInfo.new(0.15), { BackgroundTransparency = 1 }):Play()
            end)
        end

        local busy = false
        local attempts = 0

        local function closeWith(kind, delay)
            if busy then return end
            busy = true
            if delay then task.wait(delay) end
            StageOut(card, scale, shadowLayers, 0.28)
            TweenService:Create(overlay, TweenInfo.new(0.32, Enum.EasingStyle.Quad, Enum.EasingDirection.In), { BackgroundTransparency = 1 }):Play()
            task.wait(0.36)
            finish(kind)
        end
        api.Close = function() task.spawn(closeWith, "cancel") end

        local function shake()
            task.spawn(function()
                for i = 1, 4 do
                    local inten = 8 - i * 1.5
                    shakeX = inten; task.wait(0.032)
                    shakeX = -inten; task.wait(0.032)
                end
                shakeX = 0
            end)
        end

        local function successCelebration()
            TweenService:Create(cardStroke, TweenInfo.new(0.35), { Color = SUCCESS, Transparency = 0 }):Play()
            local colors = { SUCCESS, currentTheme.Accent, Color3.new(1, 1, 1), currentTheme.AccentGradient }
            for i = 1, 16 do
                local f = Instance.new("Frame")
                f.Name = EncriptyText(6)
                f.BackgroundColor3 = colors[math.random(#colors)]
                f.BorderSizePixel = 0
                f.Size = UDim2.new(0, math.random(3, 6), 0, math.random(3, 6))
                f.Position = UDim2.new(0.5, 0, 0, logoY + logoSize / 2)
                f.ZIndex = 22
                f.Parent = card
                if math.random() > 0.5 then CreateCorner(f, 50) end
                local vx = (math.random() - 0.5) * 300
                local vy = -math.random(80, 220)
                task.spawn(function()
                    local t0 = tick()
                    while alive and f.Parent do
                        local el = tick() - t0
                        local x = vx * el
                        local yy = vy * el + 400 * el * el
                        f.Position = UDim2.new(0.5, x, 0, logoY + logoSize / 2 + yy)
                        f.Rotation = f.Rotation + math.random(-8, 8)
                        f.BackgroundTransparency = math.clamp(el / 0.85, 0, 1)
                        if el > 0.9 then f:Destroy(); break end
                        task.wait()
                    end
                end)
            end
        end

        local function submit()
            if busy then return end
            local text = KeyInput.Text:gsub("^%s+", ""):gsub("%s+$", "")
            if #text < 1 then
                setStatus("Please enter a key", WARNING, "lucide-alert-circle")
                shake()
                return
            end
            local valid = keys[text] == true
            if not valid and validate then
                local okv, res = pcall(validate, text)
                valid = okv and res == true
            end
            if valid then
                busy = true
                KeyInput.TextEditable = false
                setStatus("Key accepted! Entering...", SUCCESS, "lucide-check-circle")
                TweenService:Create(inputStroke, TweenInfo.new(0.3), { Color = SUCCESS, Transparency = 0 }):Play()
                TweenService:Create(lockIcon, TweenInfo.new(0.3), { ImageColor3 = SUCCESS }):Play()
                SetIcon(lockIcon, "lucide-unlock")
                TweenService:Create(tile, TweenInfo.new(0.5, Enum.EasingStyle.Back, Enum.EasingDirection.Out), { Rotation = 360 }):Play()
                successCelebration()
                task.spawn(function()
                    task.wait(0.9)
                    busy = false
                    closeWith("success")
                end)
            else
                attempts = attempts + 1
                KeyInput.Text = ""
                updateAttemptDots(attempts)
                if attempts >= maxAttempts then
                    setStatus("Too many attempts. Closing...", DANGER_COLOR, "lucide-x-circle")
                    TweenService:Create(inputStroke, TweenInfo.new(0.3), { Color = DANGER_COLOR, Transparency = 0 }):Play()
                    shake()
                    KeyInput.TextEditable = false
                    task.spawn(function() closeWith("cancel", 1.5) end)
                else
                    setStatus(string.format("Invalid key (%d/%d remaining)", maxAttempts - attempts, maxAttempts), DANGER_COLOR, "lucide-x-circle")
                    TweenService:Create(inputStroke, TweenInfo.new(0.15), { Color = DANGER_COLOR, Transparency = 0 }):Play()
                    shake()
                    task.delay(1.2, function()
                        if alive and not busy then
                            TweenService:Create(inputStroke, TweenInfo.new(0.35), { Color = currentTheme.Border, Transparency = 0.3 }):Play()
                        end
                    end)
                    KeyInput:CaptureFocus()
                end
            end
        end

        unlock.MouseButton1Click:Connect(function() ripple(unlock); submit() end)
        cancel.MouseButton1Click:Connect(function() ripple(cancel); task.spawn(closeWith, "cancel") end)
        KeyInput.FocusLost:Connect(function(enterPressed)
            if enterPressed then submit() end
        end)

        TweenService:Create(overlay, TweenInfo.new(0.5, Enum.EasingStyle.Quart, Enum.EasingDirection.Out), { BackgroundTransparency = 0.42 }):Play()
        StageIn(card, scale, shadowLayers)

        local tileScale = Instance.new("UIScale")
        tileScale.Scale = 0.3
        tileScale.Parent = iconHolder

        later(0.08, function()
            TweenService:Create(tileScale, TweenInfo.new(0.6, Enum.EasingStyle.Back, Enum.EasingDirection.Out), { Scale = 1 }):Play()
            TweenService:Create(iconHolder, TweenInfo.new(0.35), { BackgroundTransparency = 0.5 }):Play()
        end)
        later(0.16, function()
            TweenService:Create(tl, TweenInfo.new(0.45, Enum.EasingStyle.Quint, Enum.EasingDirection.Out), { TextTransparency = 0 }):Play()
        end)
        later(0.22, function()
            if nl then TweenService:Create(nl, TweenInfo.new(0.45), { TextTransparency = 0 }):Play() end
        end)
        later(0.28, function()
            TweenService:Create(sep1, TweenInfo.new(0.35), { BackgroundTransparency = 0.5 }):Play()
            TweenService:Create(inputTag, TweenInfo.new(0.35), { TextTransparency = 0 }):Play()
        end)
        later(0.34, function()
            TweenService:Create(inputFrame, TweenInfo.new(0.35), { BackgroundTransparency = 0 }):Play()
            TweenService:Create(lockIcon, TweenInfo.new(0.35), { ImageTransparency = 0 }):Play()
            TweenService:Create(KeyInput, TweenInfo.new(0.35), { TextTransparency = 0, PlaceholderColor3 = currentTheme.TextMuted }):Play()
        end)
        later(0.40, function()
            TweenService:Create(attemptsLabel, TweenInfo.new(0.35), { TextTransparency = 0 }):Play()
            for _, dot in ipairs(attemptDots) do
                TweenService:Create(dot, TweenInfo.new(0.25), { BackgroundTransparency = 0 }):Play()
            end
        end)
        later(0.46, function()
            local info = TweenInfo.new(0.35, Enum.EasingStyle.Back, Enum.EasingDirection.Out)
            TweenService:Create(unlockLabel, info, { TextTransparency = 0 }):Play()
            if unlockIcon then TweenService:Create(unlockIcon, info, { ImageTransparency = 0 }):Play() end
            TweenService:Create(cancelLabel, info, { TextTransparency = 0 }):Play()
            if cancelIcon then TweenService:Create(cancelIcon, info, { ImageTransparency = 0 }):Play() end
        end)
        later(0.52, function()
            if lb then
                TweenService:Create(lbLabel, TweenInfo.new(0.35), { TextTransparency = 0 }):Play()
                if lbIcon then TweenService:Create(lbIcon, TweenInfo.new(0.35), { ImageTransparency = 0 }):Play() end
            end
        end)

        task.delay(0.6, function()
            if not finished and KeyInput.Parent then KeyInput:CaptureFocus() end
        end)
    end)

    if not ok then
        warn("[DiscordLib] KeySystem error: " .. tostring(err))
        finish("cancel")
    end
    while not finished do task.wait() end

    if not api.Success and haltOnFail then
        error("[DiscordLib] Key system closed without a valid key - script stopped.", 0)
    end
    return api
end

function DiscordLib:Dialog(e)
    if DiscordLib._keyAborted then return nil end
    if getgenv().ABC3616 or getgenv().ABC7472 then return nil end
    e = e or {}
    local title = tostring(e.Title or e.title or "Dialog")
    local content = tostring(e.Content or e.content or e.Description or "")
    local typeInfo = ResolveNotifType(e.Type or e.type)
    local iconName = e.Icon or e.icon or (typeInfo and typeInfo[2]) or "lucide-info"
    local tint = typeInfo and typeInfo[1] or currentTheme.Accent

    local buttons = {}
    if type(e.Buttons) == "table" then
        for _, btn in ipairs(e.Buttons) do
            if btn ~= nil then
                local text, cb, style
                if type(btn) == "string" then
                    text = btn
                elseif type(btn) == "table" then
                    text = btn.Text or btn.text or btn.Name or btn.name
                    cb = btn.Callback or btn.callback
                    style = btn.Style or btn.style
                else
                    text = tostring(btn)
                end
                if text == nil or text == "" then text = "Button " .. tostring(#buttons + 1) end
                table.insert(buttons, { Text = tostring(text), Callback = cb, Style = style })
            end
        end
    end
    if #buttons == 0 then buttons = { { Text = "OK" } } end

    getgenv().ABC8281 = true

    local mainFrame = Discord:FindFirstChild(ENC.MainFrame)
    local inWindow = mainFrame ~= nil and mainFrame.Visible and Discord.Enabled and not isMinimized
        and mainFrame.AbsoluteSize.X > 220 and mainFrame.AbsoluteSize.Y > 160

    local standaloneGui = nil
    local host
    local baseZ
    if inWindow then
        host = mainFrame
        baseZ = 1500
    else
        standaloneGui = CreateScreenGui("Dialog_", 6000)
        host = standaloneGui
        baseZ = 10
    end

    local overlay = Instance.new("TextButton")
    overlay.Name = ENC.Background
    overlay.AutoButtonColor = false
    overlay.Text = ""
    overlay.BackgroundColor3 = Color3.new(0, 0, 0)
    overlay.BackgroundTransparency = 1
    overlay.BorderSizePixel = 0
    overlay.Size = UDim2.new(1, 0, 1, 0)
    overlay.ZIndex = baseZ
    overlay.Active = true
    overlay.Parent = host
    if inWindow then CreateCorner(overlay, isMaximized and 0 or 10) end

    local uiScale = inWindow and math.clamp(currentWindowSize or 1, 0.8, 2.2) or 1
    local hostW = overlay.AbsoluteSize.X
    local cardW = 340
    if hostW > 0 then cardW = math.min(340, math.max(220, (hostW - 24) / uiScale)) end
    local pad = 18
    local contentW = cardW - pad * 2
    local plain = StripRich(content)
    local contentH = (plain ~= "") and math.max(16, MeasureText(plain, 13, currentFont, contentW).Y) or 0

    local n = #buttons
    local stacked = n > 3
    local btnH, btnGap = 34, 8
    local btnAreaH = stacked and (n * btnH + (n - 1) * btnGap) or btnH
    local headerY = pad
    local contentY = headerY + 36 + 12
    local btnY = contentY + (contentH > 0 and (contentH + 18) or 6)
    local cardH = btnY + btnAreaH + pad

    local card, _, scale = CreateModalCard(overlay, cardW, cardH, baseZ + 1)
    local cardUIScale = scale

    local tile = CreateFrame(card, nil, tint, 0.82, UDim2.new(0, 36, 0, 36), UDim2.new(0, pad, 0, headerY), baseZ + 2)
    CreateCorner(tile, 10)
    local di = CreateIcon(tile, iconName, 20, tint, UDim2.new(0.5, -10, 0.5, -10), baseZ + 3)
    if di.Image == "" then di.Image = ResolveIcon("lucide-info") or "" end

    local titleLabel = CreateLabel(card, XorEncode("Title"), title, currentTheme.Text, 16, currentFont, UDim2.new(0, cardW - pad * 2 - 36 - 12, 0, 36), UDim2.new(0, pad + 36 + 12, 0, headerY), baseZ + 2)
    titleLabel.TextTruncate = Enum.TextTruncate.AtEnd
    titleLabel.TextYAlignment = Enum.TextYAlignment.Center
    local contentLabel
    if contentH > 0 then
        contentLabel = CreateLabel(card, XorEncode("Content"), content, currentTheme.TextMuted, 13, currentFont, UDim2.new(0, contentW, 0, contentH), UDim2.new(0, pad, 0, contentY), baseZ + 2)
        contentLabel.TextWrapped = true
        contentLabel.RichText = true
        contentLabel.TextYAlignment = Enum.TextYAlignment.Top
    end

    local isClosed = false
    local selectedResponse = nil
    local escConn = nil

    local function closeDialog(response)
        if isClosed then return end
        isClosed = true
        selectedResponse = response
        if escConn then escConn:Disconnect(); escConn = nil end
        CardOut(card, cardUIScale, 0.2, uiScale)
        TweenService:Create(overlay, TweenInfo.new(0.22), { BackgroundTransparency = 1 }):Play()
        task.delay(0.25, function()
            if standaloneGui then pcall(function() standaloneGui:Destroy() end) end
            if overlay and overlay.Parent then overlay:Destroy() end
            getgenv().ABC8281 = false
        end)
    end

    for idx, data in ipairs(buttons) do
        local style = data.Style
        if style == nil then style = (idx == n) and "Primary" or "Secondary" end
        local btn = CreateTextButton(card, ENC_PREFIX.DialogButton_ .. XorEncode(tostring(idx)), UDim2.new(0, 10, 0, btnH), UDim2.new(0, 0, 0, 0), baseZ + 2)
        btn.Text = data.Text
        CreateCorner(btn, 9)
        StyleButton(btn, tostring(style))
        if stacked then
            btn.Size = UDim2.new(0, contentW, 0, btnH)
            btn.Position = UDim2.new(0, pad, 0, btnY + (idx - 1) * (btnH + btnGap))
        else
            local w = (contentW - (n - 1) * btnGap) / n
            btn.Size = UDim2.new(0, w, 0, btnH)
            btn.Position = UDim2.new(0, pad + (idx - 1) * (w + btnGap), 0, btnY)
        end
        btn.MouseEnter:Connect(function()
            if isClosed then return end
            if tostring(style) == "Secondary" then
                TweenService:Create(btn, TweenInfo.new(0.15), { BackgroundColor3 = currentTheme.Hover }):Play()
            else
                TweenService:Create(btn, TweenInfo.new(0.15), { BackgroundTransparency = 0.12 }):Play()
            end
        end)
        btn.MouseLeave:Connect(function()
            if isClosed then return end
            if tostring(style) == "Secondary" then
                TweenService:Create(btn, TweenInfo.new(0.15), { BackgroundColor3 = currentTheme.Tertiary }):Play()
            else
                TweenService:Create(btn, TweenInfo.new(0.15), { BackgroundTransparency = 0 }):Play()
            end
        end)
        btn.MouseButton1Click:Connect(function()
            if isClosed then return end
            local cb = data.Callback
            if cb then task.spawn(function() pcall(cb, data.Text) end) end
            closeDialog(data.Text)
        end)
    end

    overlay.MouseButton1Click:Connect(function() closeDialog(nil) end)
    escConn = UserInputService.InputBegan:Connect(function(input)
        if input.KeyCode == Enum.KeyCode.Escape then closeDialog(nil) end
    end)

    TweenService:Create(overlay, TweenInfo.new(0.25), { BackgroundTransparency = 0.45 }):Play()
    TweenService:Create(card, TweenInfo.new(0.3, Enum.EasingStyle.Quad, Enum.EasingDirection.Out), { GroupTransparency = 0 }):Play()
    TweenService:Create(cardUIScale, TweenInfo.new(0.35, Enum.EasingStyle.Back, Enum.EasingDirection.Out), { Scale = uiScale }):Play()

    return {
        Close = function() closeDialog(nil) end,
        IsOpen = function() return not isClosed end,
        GetResponse = function() return selectedResponse end,
        WaitForResponse = function()
            while not isClosed do task.wait() end
            return selectedResponse
        end
    }
end

local ABC6151 = 0
function DiscordLib:SetFont(e, force)
    local currentTime = tick()
    if not force and currentTime - ABC6151 < 0.3 then return end
    ABC6151 = currentTime
  local t
  if type(e)=="string"then
    t=Enum.Font[e]
  elseif typeof(e)=="EnumItem"then
    t=e
  end
  if not t then return end
  currentFont=t
  local n=Discord:FindFirstChild(ENC.MainFrame)
  if not n then return end
  local function o(r)
    for _,i in ipairs(r:GetDescendants())do
      if (i:IsA("TextLabel")or i:IsA("TextButton")or i:IsA("TextBox")) and not i:GetAttribute("KeepFont") then
        i.Font=currentFont
      end
    end
  end
  o(n)
  local s=getgenv().MinimizeButton
  if s and s.Parent then
    s.Font=currentFont
    o(s.Parent)
  end
end

local ABC2661 = 0
function DiscordLib:SetAdvancedTheme(themeConfig, force)
    local currentTime = tick()
    if not force and currentTime - ABC2661 < 0.3 then
        return
    end
    ABC2661 = currentTime

    if type(themeConfig) ~= "table" then
        return
    end

    if themeConfig.Font then
        local fontEnum

        if type(themeConfig.Font) == "string" then
            fontEnum = Enum.Font[themeConfig.Font]
        elseif typeof(themeConfig.Font) == "EnumItem" then
            fontEnum = themeConfig.Font
        end

        if fontEnum then
            currentFont = fontEnum

            local mainFrame = Discord:FindFirstChild(ENC.MainFrame)
            if mainFrame then
                for _, child in ipairs(mainFrame:GetDescendants()) do
                    if (child:IsA("TextLabel") or child:IsA("TextButton") or child:IsA("TextBox")) and not child:GetAttribute("KeepFont") then
                        child.Font = currentFont
                    end
                end
            end

            local minimizeBtn = getgenv().MinimizeButton
            if minimizeBtn and minimizeBtn.Parent then
                minimizeBtn.Font = currentFont

                for _, child in ipairs(minimizeBtn.Parent:GetDescendants()) do
                    if (child:IsA("TextLabel") or child:IsA("TextButton") or child:IsA("TextBox")) and not child:GetAttribute("KeepFont") then
                        child.Font = currentFont
                    end
                end
            end
        end
    end

    if themeConfig.ThemeName and type(themeConfig.ThemeName) == "string" and Themes[themeConfig.ThemeName] then
        currentThemeName = themeConfig.ThemeName

        currentTheme = {}
        for key, value in pairs(Themes[themeConfig.ThemeName]) do
            currentTheme[key] = value
        end
    elseif themeConfig.themeName and type(themeConfig.themeName) == "string" and Themes[themeConfig.themeName] then
        currentThemeName = themeConfig.themeName

        currentTheme = {}
        for key, value in pairs(Themes[themeConfig.themeName]) do
            currentTheme[key] = value
        end
    elseif themeConfig.Theme and type(themeConfig.Theme) == "string" and Themes[themeConfig.Theme] then
        currentThemeName = themeConfig.Theme

        currentTheme = {}
        for key, value in pairs(Themes[themeConfig.Theme]) do
            currentTheme[key] = value
        end
    elseif themeConfig.theme and type(themeConfig.theme) == "string" and Themes[themeConfig.theme] then
        currentThemeName = themeConfig.theme

        currentTheme = {}
        for key, value in pairs(Themes[themeConfig.theme]) do
            currentTheme[key] = value
        end
    elseif not currentTheme then
        currentThemeName = "Dark"
        currentTheme = {}

        for key, value in pairs(Themes.Dark) do
            currentTheme[key] = value
        end
    end

    local tKeys = {
        "Main",
        "Secondary",
        "Tertiary",
        "Accent",
        "AccentGradient",
        "Text",
        "TextMuted",
        "Userpad",
        "UserIcon",
        "Hover",
        "Border",
        "Shadow",
        "ServerBorder",
        "NotificationBg",
        "NotificationBorder"
    }

    for _, key in ipairs(tKeys) do
        if themeConfig[key] and typeof(themeConfig[key]) == "Color3" then
            currentTheme[key] = themeConfig[key]
            currentThemeName = nil
        end
    end

    if themeConfig.Transparency then
        currentTransparency = themeConfig.Transparency
    end

    if themeConfig.WindowSize then
        if type(themeConfig.WindowSize) == "table" then
            local wx = themeConfig.WindowSize.X or themeConfig.WindowSize.x or 1
            local wy = themeConfig.WindowSize.Y or themeConfig.WindowSize.y or wx
            DiscordLib:SetWindowSize(wx, wy)
        else
            DiscordLib:SetWindowSize(themeConfig.WindowSize)
        end
    end

    for _, updateFunc in ipairs(ThemeUpdateConnections) do
        pcall(updateFunc)
    end

    if currentTheme.Accent and currentTheme.AccentGradient then
        local mainFrame = Discord:FindFirstChild(ENC.MainFrame)
        if mainFrame then
            for _, obj in ipairs(mainFrame:GetDescendants()) do
                if obj:IsA("UIGradient")
                    and obj.Parent
                    and obj.Parent.Name:find("SelectionBg") then
                    obj.Color = ColorSequence.new({
                        ColorSequenceKeypoint.new(0, currentTheme.Accent),
                        ColorSequenceKeypoint.new(1, currentTheme.AccentGradient)
                    })
                end
            end
        end
    end
    if currentTheme.ServerBorder then
        local mainFrame = Discord:FindFirstChild(ENC.MainFrame)
        if mainFrame then
            for _, obj in ipairs(mainFrame:GetDescendants()) do
                if obj:IsA("UIStroke") and obj.Name == ENC.ServerIconBorder then
                    obj.Color = currentTheme.ServerBorder
                end
            end
        end
    end
end

function DiscordLib:SetMinimizeKey(e)
  if type(e)=="string"then e=Enum.KeyCode[e]end
  if not e or typeof(e)~="EnumItem"then return end
  if getgenv().ABC6261 then getgenv().ABC6261:Disconnect()end
  getgenv().ABC6261=UserInputService.InputBegan:Connect(function(t)
    if t.KeyCode==e and not t.GameProcessedEvent then
      if not getgenv().ABC3616 and not getgenv().ABC8281 then
        if getgenv().MinimizeButton and getgenv().MinimizeButton.Parent then
          local n=getgenv().MinimizeButton
          if getgenv().Abc4717 then
            local o=currentWindowSize or 1
            local i=math.floor(100*o)
            local s=math.floor(35*o)
            local r=not getgenv().IsMinimized
            local a=r and currentTheme.Text or currentTheme.Main
            local l=r and currentTheme.Main or currentTheme.Text
            TweenService:Create(n,TweenInfo.new(0.3,Enum.EasingStyle.Quad,Enum.EasingDirection.Out),{BackgroundColor3=a}):Play()
            n.Text=r and"Hide"or"Show";n.TextColor3=l
            local c=1.05
            TweenService:Create(n,TweenInfo.new(0.15),{Size=UDim2.new(0,math.floor(i*c),0,math.floor(s*c))}):Play()
            task.wait(0.15)
            TweenService:Create(n,TweenInfo.new(0.15),{Size=UDim2.new(0,i,0,s)}):Play()
            if Discord then
              task.spawn(function()getgenv().Abc4717=false;task.wait(2);getgenv().Abc4717=true end)
              DiscordLib:MinimizeUI()
            end
          end
        else DiscordLib:MinimizeUI()end
      end
    end
  end)
  return getgenv().ABC6261
end
function DiscordLib:GetMinimizeKey()return getgenv().ABC6261 end
function DiscordLib:DisableMinimizeKey()
  if getgenv().ABC6261 then getgenv().ABC6261:Disconnect();getgenv().ABC6261=nil end
end

local function isMobile()
  return UserInputService.TouchEnabled and not UserInputService.KeyboardEnabled and not UserInputService.MouseEnabled
end

if isMobile() then
  createMinimizeButton()
else
  DiscordLib:SetMinimizeKey(Enum.KeyCode.RightShift)
end

function DiscordLib:ExportSettings()
    local themeSnapshot = {}
    local themeKeys = {
        "Main",
        "Secondary",
        "Tertiary",
        "Accent",
        "AccentGradient",
        "Text",
        "TextMuted",
        "Userpad",
        "UserIcon",
        "Hover",
        "Border",
        "Shadow",
        "ServerBorder",
        "NotificationBg",
        "NotificationBorder"
    }

    for _, key in ipairs(themeKeys) do
        if currentTheme[key] and typeof(currentTheme[key]) == "Color3" then
            themeSnapshot[key] = currentTheme[key]
        end
    end

    local fontName = currentFont
    if typeof(currentFont) == "EnumItem" then
        fontName = currentFont.Name
    end

    return {
        windowSize = currentWindowSize,
        windowSizeX = currentWindowScaleX,
        windowSizeY = currentWindowScaleY,
        font = fontName,
        theme = themeSnapshot,
        themeName = type(currentThemeName) == "string" and currentThemeName or nil
    }
end

function DiscordLib:SetTransparency(value)
    value = math.clamp(tonumber(value) or 0.1, 0, 1)
    currentTransparency = value
    local mf = Discord:FindFirstChild(ENC.MainFrame)
    if not mf then return end
    for _, nm in ipairs({ ENC.ServersHoldFrame, ENC.ChannelsHoldFrame }) do
        local f = mf:FindFirstChild(nm)
        if f then f.BackgroundTransparency = value end
    end
    for _, sec in pairs(Sections) do
        if sec and sec.Parent then sec.BackgroundTransparency = value end
    end
end

function DiscordLib:Destroy()
    DiscordLib._destroyed = true
    for _, c in ipairs(DiscordLib._conns or {}) do pcall(function() c:Disconnect() end) end
    DiscordLib._conns = {}
    pcall(function() if getgenv().DiscordNotifGui then getgenv().DiscordNotifGui:Destroy() end end)
    pcall(function()
        local b = getgenv().MinimizeButton
        if b and b.Parent then b.Parent:Destroy() end
    end)
    pcall(function() Discord:Destroy() end)
    getgenv().ABC3616 = false
    getgenv().ABC7472 = false
    getgenv().ABC8281 = false
end

do
    local function reparent(gui)
        if gui and gui.Parent == nil then
            pcall(function() gui.ResetOnSpawn = false end)
            pcall(protectGui, gui)
        end
    end
    local function reassert()
        if DiscordLib._destroyed then return end
        reparent(Discord)
        local btn = getgenv().MinimizeButton
        if btn and btn.Parent then
            pcall(function() btn.Parent.ResetOnSpawn = false end)
            reparent(btn.Parent)
        end
        if not getgenv().ABC7472 and not getgenv().ABC3616 then
            pcall(function()
                if Discord.Parent and not Discord.Enabled then Discord.Enabled = true end
                local b = getgenv().MinimizeButton
                if b and b.Parent and b.Parent:IsA("ScreenGui") and not b.Parent.Enabled then b.Parent.Enabled = true end
            end)
        end
    end
    task.spawn(function()
        while not DiscordLib._destroyed do
            task.wait(1)
            reassert()
        end
    end)
    pcall(function()
        UserInputService.WindowFocused:Connect(function() task.defer(reassert) end)
    end)
    pcall(function()
        LocalPlayer.CharacterAdded:Connect(function() task.defer(reassert) end)
    end)
end

return DiscordLib
