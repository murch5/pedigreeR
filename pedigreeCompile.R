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
  conflictList <- data.frame()
  
  print("Compile Pedigree Start")
  
  uniqueID <- unique(pedData[,"ID"])  #isolated only unique ID values
  
  pedigree <- lapply(uniqueID, function(y){
    
      subset <- unique(unique(pedData[which(pedData[,"ID"] == y || pedData[,"FamilyID"] == y),])) #isolate subset of file entries sharing same ID
      
      famID <- unique(subset[,"FamilyID"])
      paternalID <- unique(subset[,"paternalID"])
      maternalID <- unique(subset[,"maternalID"])
      sexID <- unique(subset[,"sexID"])
      affectionID <- unique(subset[,"affectionID"])
      
      if(nrow(famID) > 1)
      {
        #Conflicting Family IDs
        
      }
      
      paternalID <- unique(subset)
      
      
      return(entry)
    
    
  })
  
  
  return(pedigree)
}
