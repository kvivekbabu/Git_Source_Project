public with sharing class Readxmlfile {
	
	public string fileName{get;set;}
	public blob body{get;set;}
	
	public map<string,string> xmlcolletions {get;set;}
	
	
	public pagereference getparsingdata(){
		
		DOM.Document xmlDOC = new DOM.Document();
				
		fileName = body.toString();
		xmlDOC.load(fileName);
		
		system.debug('testing xml file'+fileName);
		
		DOM.Xmlnode rootElement = xmlDOC.getRootElement();
		
		system.debug('Root elements'+rootElement);		
		system.debug('Get root Main element'+xmlDOC.getRootElement().getName());
		xmlcolletions = new map<string,string>();
		
		for(Dom.Xmlnode nodeobj: xmlDoc.getRootElement().getChildElements()){
						
			loadxml(nodeobj);
		}
		
		system.debug('getting values'+xmlcolletions.values());
		return null;
	}
	
	
	public void loadxml(dom.Xmlnode nodesdata){
		
		for(dom.Xmlnode objnode: nodesdata.getChildElements()){
		
		    if(objnode.getText() !=null){
		    	xmlcolletions.put(objnode.getName(),objnode.getText());
		    	
		    	system.debug('node text Tag name'+objnode.getName() +'node text value'+ objnode.getText());
		    
		    }
		}
		system.debug('xmlcolletionstesttttt'+xmlcolletions);
	
	}

}