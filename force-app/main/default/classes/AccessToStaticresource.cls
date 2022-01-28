public with sharing class AccessToStaticresource {
    
    public static string getCsvValue(string keyName)
    {
        StaticResource sr = [SELECT Id, Body FROM StaticResource WHERE Name = 'sample_csv' LIMIT 1];
        String csvData = sr.Body.toString();

        SSSCsvReader csvR = new SSSCsvReader(csvData);
        
        Map<string, string> m = new Map<string, string>();
        String[] line = csvR.readLine();
        while(line != null)
        {
            m.put(line[0], line[1]);
            line = csvR.readLine();
        }

        return m.get(keyName);
    }

    public static string getJsonValue(string keyName)
    {
        StaticResource sr = [SELECT Id, Body FROM StaticResource WHERE Name = 'sample_json' LIMIT 1];
        String jsonData = sr.Body.toString();

        Map<String, Object> tmp = (Map<String, Object>) JSON.deserializeUntyped(jsonData);

        return String.valueOf(tmp.get(keyName));
    }
}
