#
#CLASSIFY PEDIGREE
#
#Classifies and subtypes pedigree structures in formatted pedigree file
#
# -passed formatted pedigree spreadsheet
# -returns a data.frame with one row per family with pedigree structure details
#
#arguments:
#   pedigree - formatted pedigree file from pedigreeCompile
#   
#returns:
#
#   familyPed - family specific pedigree data (family type, members present, structure, total number)

classifyPedigree <- function(pedigree)
{
  
  familyID <- sort(unique(pedigree[,"famID"])) #determined unique famIDs in pedigree - order ascending
  familyID <- familyID[-1] #removed zero - will be handled separately as singletons
  
  familyData <- data.frame(famID=numeric(),type = factor(),numMembers=numeric())
  
  for(i in length(familyID))
  {
    
    famID <- familyID[i]
    
    subset <- pedigree[which(pedigree[,"famID"]==famID),]
    
    numMembers <- length(subset)
    
    if(subset[which(subset[,""]),])
    
    entry <- c(famID,type,numMembers)
  
  }
  
  
  print(familyID)
  
  colnames(familyData) <- c("famID","type","numMembers")
  return(familyData)
  
}

classifyPedigree(pedigree)