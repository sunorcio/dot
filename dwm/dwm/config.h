/* See LICENSE file for copyright and license details. */

#include <X11/XF86keysym.h>

/* appearance */
static const unsigned int borderpx  = 0;        /* border pixel of windows */
static const unsigned int snap      = 64;       /* snap pixel */
static const int showbar            = 1;        /* 0 means no bar */
static const int topbar             = 1;        /* 0 means bottom bar */

/*
static const char *fonts[]          = { "monospace:size=10" };
static const char dmenufont[]       = "monospace:size=10";
*/
static const char *fonts[]          = { "BmPlus ToshibaSat 8x16:pixelsize=16" };
static const char dmenufont[]       = "BmPlus ToshibaSat 8x16:pixelsize=16";

static const char col_gray1[]       = "#222222";
static const char col_gray2[]       = "#444444";
static const char col_gray3[]       = "#bbbbbb";
static const char col_gray4[]       = "#eeeeee";
static const char col_cyan[]        = "#005577";
static const char *colors[][3]      = {
	/*               fg         bg         border   */
	[SchemeNorm] = { col_gray3, col_gray1, col_gray2 },
	[SchemeSel]  = { col_gray4, col_cyan,  col_cyan  },
};

/* tagging */
static const char *tags[] = { "1", "2", "3", "4", "5", "6", "7", "8", "9" };

static const Rule rules[] = {
	/* xprop(1):
	 *	WM_CLASS(STRING) = instance, class
	 *	WM_NAME(STRING) = title
	 */
	/* class		instance    title       tags mask		isfloating		monitor */
	{ "Name",		NULL,       NULL,       1 << 0,			0,				-1 },
};

/* layout(s) */
static const float mfact     = 0.5; /* factor of master area size [0.05..0.95] */
static const int nmaster     = 1;    /* number of clients in master area */
static const int resizehints = 1;    /* 1 means respect size hints in tiled resizals */
static const int lockfullscreen = 1; /* 1 will force focus on the fullscreen window */

static const Layout layouts[] = {
	/* symbol     arrange function */
	{ "[M]",      monocle },
	{ "[]=",      tile },    /* first entry is default */
	{ "><>",      NULL },    /* no layout function means floating behavior */
};

/* key definitions */
#define MODKEY Mod4Mask
#define TAGKEYS(KEY,TAG) \
	{ MODKEY,                       KEY,      view,           {.ui = 1 << TAG} }, \
	{ MODKEY|ShiftMask,             KEY,      tag,            {.ui = 1 << TAG} }, \
/* 	{ Mod1Mask|ControlMask,			KEY,      toggleview,     {.ui = 1 << TAG} }, \
	{ Mod1Mask|ShiftMask,			KEY,      toggletag,      {.ui = 1 << TAG} }, */

/* helper for spawning shell commands in the pre dwm-5.0 fashion */
#define SHCMD(cmd) { .v = (const char*[]){ "/bin/sh", "-c", cmd, NULL } }

/* commands */
static const char *dmenucmd[] = { "dmenu_run", "-fn", dmenufont, "-nb", col_gray1, "-nf", col_gray3, "-sb", col_cyan, "-sf", col_gray4, NULL };
static const char *termcmd[]  = { "st", NULL };
static const char *vmt[]  = { "amixer","set","Master","toggle", NULL };
static const char *vdn[]  = { "/home/santi/dot/dwm/voldn", NULL };
static const char *vup[]  = { "/home/santi/dot/dwm/volup", NULL };
static const char *mmt[]  = { "amixer","set","Capture","toggle", NULL };
static const char *bdn[]  = { "/home/santi/dot/dwm/brightdn", NULL };
static const char *bup[]  = { "/home/santi/dot/dwm/brightup", NULL };
static const char *opt[]  = { "st","-e","btop", NULL };
static const char *loc[]  = { "st","-T","Type search query:","-e","/home/santi/dot/dwm/search", NULL };
static const char *scr[]  = { "scrot","-s","-F","/home/santi/scrot/scrot", NULL };
static const char *clk[]  = { "/home/santi/dot/dwm/date", NULL };
static const char *now[]  = { "/home/santi/dot/dwm/now", NULL };
static const char *lsh[]  = { "/home/santi/dot/dwm/lsh", NULL };
static const char *jrn[]  = { "st","-e","/home/santi/dot/dwm/jrn", NULL };
static const char *lck[]  = { "slock", NULL };

static const Key keys[] = {
	/* modifier                     key                         function        argument */
	{ MODKEY,						XK_Escape,					spawn,           {.v = lck } },
	{ MODKEY|ShiftMask,             XK_Return,                  spawn,           {.v = dmenucmd } },
	{ MODKEY,                       XK_Return,                  spawn,           {.v = termcmd } },
	{ MODKEY,                       XK_q,	                    spawn,           {.v = lsh } },
	{ MODKEY,                       XK_r,                       togglebar,       {0} },
	{ MODKEY,                       XK_f,                       setlayout,	     {.v = &layouts[0] } },
	{ MODKEY,                       XK_j,                       focusstack,      {.i = +1 } },
	{ MODKEY,                       XK_k,                       focusstack,      {.i = -1 } },
	{ MODKEY,			            XK_i,                       incnmaster,      {.i = +1 } },
	{ MODKEY,						XK_n,                       incnmaster,      {.i = 0 } },//reset to 1
	{ MODKEY,                       XK_h,	                    viewreldn,	     {0} },
	{ MODKEY,                       XK_l,	                    viewrelup,	     {0} },
	{ MODKEY,                       XK_Left,                    viewreldn,	     {0} },
	{ MODKEY,                       XK_Right,                   viewrelup,	     {0} },
	{ MODKEY,                       XK_Down,                    focusstack,      {.i = +1 } },
	{ MODKEY,						XK_o,                       setmfact,        {.f = -0.01 } },
	{ MODKEY,						XK_m,                       setmfact,        {.f = +0.01 } },
	{ MODKEY,				        XK_u,						togglefullscreen,{0} },
	{ MODKEY,			            XK_space,                   zoom,	         {0} },
	{ MODKEY|ShiftMask,	            XK_space,                   setlayout,       {.v = &layouts[1] } },
	{ MODKEY,                       XK_t,	                    setlayout,	     {.v = &layouts[1] } },
	{ MODKEY|ShiftMask,             XK_f,	                    setlayout,	     {.v = &layouts[2] } },
	{ MODKEY,			            XK_b,	                    setlayout,	     {.v = &layouts[2] } },
	{ MODKEY,                       XK_Tab,                     focusstack,      {.i = +1 } },
	{ MODKEY,                       XK_0,                       view,            {.ui = ~0 } },
	{ MODKEY|ShiftMask,             XK_0,                       tag,             {.ui = ~0 } },
	{ MODKEY,                       XK_comma,                   focusmon,        {.i = -1 } },
	{ MODKEY,                       XK_period,                  focusmon,        {.i = +1 } },
	{ MODKEY|ShiftMask,             XK_comma,                   tagmon,          {.i = -1 } },
	{ MODKEY|ShiftMask,             XK_period,                  tagmon,          {.i = +1 } },
	{ 0,							XF86XK_AudioMute,			spawn,           {.v = vmt } },
	{ 0,							XF86XK_AudioLowerVolume,	spawn,           {.v = vdn } },
	{ 0,							XF86XK_AudioRaiseVolume,	spawn,           {.v = vup } },
	{ 0,							XF86XK_AudioMicMute,		spawn,           {.v = mmt } },
	{ 0,							XF86XK_MonBrightnessDown,	spawn,           {.v = bdn } },
	{ 0,							XF86XK_MonBrightnessUp,		spawn,           {.v = bup } },
	{ 0,							XF86XK_Tools,				spawn,           {.v = opt } },
	{ 0,							XF86XK_Search,				spawn,           {.v = loc } },
	{ 0,							XF86XK_LaunchA,				spawn,           {.v = dmenucmd } },
	{ 0,							XF86XK_Display,				spawn,           {.v = scr } },
	{ 0,							XF86XK_Explorer,			spawn,           {.v = lsh } },
	TAGKEYS(                        XK_1,                       0)
	TAGKEYS(                        XK_2,                       1)
	TAGKEYS(                        XK_3,                       2)
	TAGKEYS(                        XK_4,                       3)
	TAGKEYS(                        XK_5,                       4)
	TAGKEYS(                        XK_6,                       5)
	TAGKEYS(                        XK_7,                       6)
	TAGKEYS(                        XK_8,                       7)
	TAGKEYS(                        XK_9,                       8)
	{ MODKEY|ShiftMask,             XK_w,                       killclient,       {0} },
	{ MODKEY|ShiftMask|Mod1Mask,	XK_q,                       quit,             {0} },
};

/* button definitions */
/* click can be ClkTagBar, ClkLtSymbol, ClkStatusText, ClkWinTitle, ClkClientWin, or ClkRootWin */
static const Button buttons[] = {
	/* click                event mask      button          function        argument */
	{ ClkLtSymbol,          0,              Button1,        setlayout,      {.v = &layouts[0]} },
	{ ClkLtSymbol,          0,              Button2,        setlayout,      {.v = &layouts[1]} },
	{ ClkLtSymbol,          0,              Button3,        setlayout,      {.v = &layouts[2]} },
 	{ ClkWinTitle,          0,              Button1,        focusstack,     {.i = +1 } },
/* 	{ ClkWinTitle,          0,              Button2,        spawn,			{.v = dmenucmd } }, */
	{ ClkStatusText,        0,              Button1,        spawn,          {.v = clk } },
 	{ ClkStatusText,        0,              Button2,        spawn,          {.v = jrn } },
	{ ClkStatusText,        0,              Button3,        spawn,          {.v = now } },
	{ ClkClientWin,         MODKEY,         Button1,        movemouse,      {0} },
	{ ClkClientWin,         MODKEY,         Button2,        resizemouse,    {0} },
	{ ClkClientWin,         MODKEY,         Button3,        togglefloating, {0} },
	{ ClkTagBar,            0,              Button1,        view,           {0} },
	{ ClkTagBar,            0,              Button2,        tag,		    {0} },
	{ ClkTagBar,            MODKEY,         Button1,        toggleview,		{0} },
	{ ClkTagBar,            MODKEY,         Button2,        toggletag,		{0} },
};

