#
#REMAP ID FUNCTION
#
#Used to remap IDs in pedigree/phenotyping file
#
# -passed ID value and map as arugments and returns remapped ID value (or 0 is no match present)
# 
#
#arguments:
#   oldID - ID number to be remapped
#   map - data.frame containing two columns matching old and new IDs (1=old,2=new)
#
#returns:
#
#   newID - remapped ID

remapID <- function(oldID,map)
{
  return (map[which(map[,1]==oldID),2])
}
