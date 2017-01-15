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

classifyPedigree <- function(ped)
{
  
  familyID <- unique(ped[,"famID"]) #determined unique famIDs in pedigree - order ascending

  familyData <- data.frame(famID=numeric(),type = character(),typeID = numeric(),numMembers=numeric(),stringsAsFactors = FALSE)

  for(i in 1:length(familyID))
  {

    famID <- familyID[i]
    
    
    subset <- pedigree[which(pedigree[,"famID"]==famID),]
    
    numMembers <- nrow(subset)
    
    type <- character(0)
    
    typeID <- numeric(0)
    
    
    if(subset[which(subset[,"ID"]==famID),"paternalID"]!=0)
    {
      
      if(subset[which(subset[,"ID"]==famID),"maternalID"]!=0)
      {
        type = "Trio"
        typeID = 1
      }else
      {
        type = "Fonly"
        typeID = 2
      }
      
    }else
    {
      if(subset[which(subset[,"ID"]==famID),"maternalID"]!=0)
      {
        type = "MOnly"
        typeID = 3
      }else
      {
        type = "Singleton"
        typeID =  4
      }
    }
  
    entry <- data.frame(famID,type,typeID,numMembers)

    familyData <- rbind(familyData,entry)
    
  }
  
  colnames(familyData) <- c("famID","type","typeID","numMembers")
  return(familyData)
  
}

c <- classifyPedigree(pedigree)