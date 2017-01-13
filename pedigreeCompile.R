#
#COMPILE PEDIGREE FUNCTION
#
#Used to amalgamate pedigree information into standard format
#
# -parses phenotyping file with multiple individual entries for each trio (will only take unique entries)
# -returns IDs with conflicts (gender,relationship etc)
#
#arguments:
#   pedData - data.frame containing pedigree information (ID, proband ID, gender, affection status)
#   

compilePedigree <-function(pedData)
{
 
  uniqueID <- unique(pedData[,"ID"])  #isolated only unique ID values 
  
  
  
}