VIRTUALTEMPLATE_list_video=list_video
VIRTUALDIR_list_video=edu/phys/video/
VIRTUALOUT_list_video=	\
	mech/index.html
VIRTUALREQ_list_video=scripts/list_video.sh
VIRTUALREQRULE_list_video=C,(.*)/index.html,data/edu/phys/video/\1.psv,

VIRTUALTEMPLATE_show_video=	show_video
VIRTUALDIR_show_video=	${VIRTUALDIR_list_video}
VIRTUALREQ_show_video=	scripts/show_video.sh
VIRTUALOUT_show_video!=	scripts/list_video_targets.sh
