/**
 * EinsteinService class.
 * 
 * @author      Last Khajiit
 * @since       10/17/2017
 **/
global class EinsteinService {
    webservice static SentimentAnalysisResponse findSentiment(String text) {
        EinsteinAPI api = new EinsteinApi();        
        SentimentAnalysisResponse resp = api.findSentiment(text);        
        return resp;
    }
}