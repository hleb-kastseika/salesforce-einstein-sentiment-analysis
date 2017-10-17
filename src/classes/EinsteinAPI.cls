/**
 * EinsteinAPI class.
 * 
 * @author      Last Khajiit
 * @since       10/13/2017
 **/
public class EinsteinAPI {
    public String tokenEndpoint {
        get {
            EinsteinAPISettings__c settings =
            		EinsteinAPISettings__c.getInstance(UserInfo.getOrganizationId());
            return settings.TokenEndpoint__c;
        }
    }
    
    public Decimal tokenExpirationSeconds {
        get {
            EinsteinAPISettings__c settings =
            		EinsteinAPISettings__c.getInstance(UserInfo.getOrganizationId());
            return settings.TokenExpirationSeconds__c;
        }
    }
    
    public String registeredEmail {
        get {
            EinsteinAPISettings__c settings =
            		EinsteinAPISettings__c.getInstance(UserInfo.getOrganizationId());
            return settings.RegisteredEmail__c;
        }
    }
    
    public String sentimentEndpoint {
        get {
            EinsteinAPISettings__c settings =
            		EinsteinAPISettings__c.getInstance(UserInfo.getOrganizationId());
            return settings.SentimentEndpoint__c;
        }
    }
    
    public String sentimentModelId {
        get {
            EinsteinAPISettings__c settings =
            		EinsteinAPISettings__c.getInstance(UserInfo.getOrganizationId());
            return settings.SentimentModelId__c;
        }
    }
    
    public String getAccessToken() {
        ContentVersion base64Content = [
            SELECT  Title, VersionData
            FROM    ContentVersion
            WHERE   Title = 'einstein_platform'
            OR      Title = 'predictive_services'
            ORDER BY Title
            LIMIT 1
        ];
        
        String keyContents = base64Content.VersionData.tostring();
        keyContents = keyContents.replace('-----BEGIN RSA PRIVATE KEY-----', '');
        keyContents = keyContents.replace('-----END RSA PRIVATE KEY-----', '');
        keyContents = keyContents.replace('\n', '');
        JWT jwt = new JWT('RS256');
        jwt.pkcs8 = keyContents; 
        jwt.iss = 'developer.force.com';
        jwt.sub = registeredEmail;
        jwt.aud = tokenEndpoint;
        jwt.exp = String.valueOf(tokenExpirationSeconds);
        String access_token = JWTBearerFlow.getAccessToken(tokenEndpoint, jwt);
        return access_token;
    }
    
    public SentimentAnalysisResponse findSentiment(String text) {
        String key = getAccessToken();        
        Http http = new Http();        
        HttpRequest req = new HttpRequest();
        req.setMethod('POST');
        req.setEndpoint(sentimentEndpoint);
        req.setHeader('Authorization', 'Bearer ' + key);
        req.setHeader('Content-type', 'application/json');        
        String body = '{\"modelId\":\"'+ sentimentModelId + '\",\"document\":\"' + text + '\"}';
        req.setBody(body);        
        HTTPResponse res = http.send(req);        
        SentimentAnalysisResponse resp =
        		(SentimentAnalysisResponse) JSON.deserialize(res.getBody(), SentimentAnalysisResponse.class);
        return resp;
    }
}