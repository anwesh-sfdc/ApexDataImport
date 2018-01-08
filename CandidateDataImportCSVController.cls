/*author:anwesh
 * description:import candidates data csv file through apex and visualforce 
*/
public class CandidateDataImportCSVController {
public Blob csvFileBody{get;set;}
public string csvAsString{get;set;}
public String[] csvFileLines{get;set;}
public List<Candidates__c> candlist{get;set;}
  public CandidateDataImportCSVController(){
    csvFileLines = new String[]{};
    candlist = New List<Candidates__c>(); 
  }
  public void importCSVFile(){
       try{
           csvAsString = csvFileBody.toString();
           csvFileLines = csvAsString.split('\n'); 
            
           for(Integer i=1;i<csvFileLines.size();i++){
               Candidates__c canObj = new Candidates__c() ;
               string[] csvRecordData = csvFileLines[i].split(',');
               canObj.First_Name__c = csvRecordData[0] ;             
               canObj.Last_Name__c = csvRecordData[1];
               canObj.Phone__c = csvRecordData[2];
               canObj.Email__c = csvRecordData[3];   
               canObj.City__c = csvRecordData[4];                                                                             
               candlist.add(canObj);   
           }
        //insert candlist;
        }
        catch (Exception e)
        {
            ApexPages.Message errorMessage = new ApexPages.Message(ApexPages.severity.ERROR,'An error has occured while importin data Please make sure input csv file is correct');
            ApexPages.addMessage(errorMessage);
        }  
  }
}
