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
#Family ID, Individual ID, Paternal ID, Maternal ID, Sex (1=male; 2=female; other=unknown), Phenotype

compilePedigree <-function(pedData)
{

  print("Compile Pedigree Start")
  
  uniqueID <- unique(pedData[,"ID"])  #isolated only unique ID values
  
  
  pedigree <-lapply(uniqueID, function(y){
    
      subset <- unique(pedData[which(pedData[,"ID"] == y),]) #isolate subset of file entries sharing same ID
      famSubset <- unique(pedData[which(pedData[,"familyID"] == y),]) #isolate family members
      
      paternalID <- famSubset[which(famSubset[,"familyStatus"]=="Father"),"ID"]
      maternalID <- famSubset[which(famSubset[,"familyStatus"]=="Mother"),"ID"]
      
      sexID <- unique(subset[,"genderID"])
      affectionID <- unique(subset[,"affectionID"])

      entry <- c(y,affectionID)
      
      return(entry)
    
  })
  
 
  return(pedigree)
}

test <- read.csv("test.csv")
pruned <- test[,c(4,5,6,7,10)]
colnames(pruned) <- c("ID","familyID","familyStatus","genderID","affectionID")
pedigree <- compilePedigree(pruned)
