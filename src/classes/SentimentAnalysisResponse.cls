/**
 * SentimentAnalysisResponse class.
 * 
 * @author      Last Khajiit
 * @since       10/13/2017
 **/
global class SentimentAnalysisResponse {
    webservice List<Probabilities> probabilities { get; set; } 
    
    global class Probabilities {
        webservice String label { get; set; } 
        webservice Double probability { get; set; }
    }
}