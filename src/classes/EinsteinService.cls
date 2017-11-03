/**
 * EinsteinService class.
 * 
 * @author      Last Khajiit
 * @since       17/10/2017
 **/
global class EinsteinService {
    public SentimentAnalysisResponse findSentiment(String text) {
        EinsteinAPI api = new EinsteinApi();        
        SentimentAnalysisResponse resp = api.findSentiment(text);        
        return resp;
    }
}
