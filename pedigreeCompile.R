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


compilePedigree <- function(pedData)
{
  print("Compile Pedigree Start")
  
  uniqueID <-
    unique(pedData[, "ID"])  #isolated only unique ID values
  
  pedigree <- data.frame(
    ID = character(),
    famID = numeric(),
    paternalID = numeric(),
    maternalID = numeric(),
    sexID = numeric(),
    affectionID = numeric()
  )
  
  for (i in 1:length(uniqueID))
  {
    subset <-
      unique(pedData[which(pedData[, "ID"] == uniqueID[i]), ]) #isolate subset of file entries sharing same ID
    famSubset <-
      unique(pedData[which(pedData[, "familyID"] == uniqueID[i]), ])
    
    ID <-
      uniqueID[i] #the ID of the individual entry is iterator value
    
    if (length(subset[, "familyID"]) > 1)
    {
      print(paste("Error: Multiple Family ID Detected for", uniqueID[i]))
    }
    
    famID <-
      subset[, "familyID"] #initially set famID to index ID *** MAY BE OVERWRITTEN LATER
    if (length(famID) == 0 || is.na(famID)) {
      famID = 0
    }
    
    paternalID <-
      famSubset[which(famSubset[, "familyStatus"] == "Father"), "ID"]
    maternalID <-
      famSubset[which(famSubset[, "familyStatus"] == "Mother"), "ID"]
    
    if (length(paternalID) == 0) {
      paternalID = 0
      
    }
    if (length(maternalID) == 0) {
      maternalID = 0
    }
    
    sexID <- unique(subset[, "genderID"])
    affectionID <- unique(subset[, "affectionID"])
    
    entry <- c(famID, ID, paternalID, maternalID, sexID, affectionID)
    
    
    
    
    pedigree <- rbind(pedigree, entry)
    
  }
  colnames(pedigree) <-
    c("famID",
      "ID",
      "paternalID",
      "maternalID",
      "sexID",
      "affectionID")
  return(pedigree)
}

test <- read.csv("test.csv")
test <- test[, -1]
pruned <- test[, c(3, 4, 5, 6, 9)]
colnames(pruned) <-
  c("ID", "familyID", "familyStatus", "genderID", "affectionID")
pedigree <- compilePedigree(pruned)

