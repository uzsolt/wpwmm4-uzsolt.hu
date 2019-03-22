_LAYOUT(`note.m4',_title,`Dataframe elemeinek átnevezése',_subtitle,`szótár alapján')
_INCL(`highlight.m4')
Az _filename(`oldname') tartalmazza a régi, a _filename(`newname') pedig az
új neveket, ugyanabban a sorrendben, a _filename(`data') pedig a dataframe.
_highlight(`
oldname <- c("old1","old2","old3")
newname <- c("new1","new2","new3")
existing <- match(oldname,names(data))
names(data)[na.omit(existing)] <- newname[which(!is.na(existing))]',`r')
