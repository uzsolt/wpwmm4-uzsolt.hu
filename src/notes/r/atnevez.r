oldname <- c("old1","old2","old3")
newname <- c("new1","new2","new3")
existing <- match(oldname,names(data))
names(data)[na.omit(existing)] <- newname[which(!is.na(existing))]''
