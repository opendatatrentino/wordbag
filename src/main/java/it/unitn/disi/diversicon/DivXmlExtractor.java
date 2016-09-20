package it.unitn.disi.diversicon;

import static it.unitn.disi.diversicon.internal.Internals.checkNotNull;

import org.dom4j.Element;
import org.dom4j.ElementHandler;
import org.dom4j.ElementPath;
import org.dom4j.Namespace;

/**
 * Extracts stuff from a LexicalResource XML structured according to Diversicon schema
 *  
 * @since 0.1.0
 */
class DivXmlExtractor implements ElementHandler {
    
    /**
     * String contained in excpetion messages when the handler signals to stop the parse.
     * 
     * @since 0.1.0
     */
    public static final String FOUND = "** FOUND LEXICAL RESOURCE **";

    private LexResPackage divRes;
    
    private DivXmlExtractor(){            
    }
    
    public DivXmlExtractor(LexResPackage divRes) {
        checkNotNull(divRes);
        
        this.divRes = divRes;
    }
    
    @Override
    public void onStart(ElementPath elementPath) {
        Element el = elementPath.getCurrent();
        String elName = el.getName();

        if ("LexicalResource".equals(elName)) {
            
            String candId = el.attributeValue("id");
            if (candId != null) {
                divRes.setId(candId);
            }               
            
            String candName = el.attributeValue("name");
            if (candName != null) {
                divRes.setName(candName);
            }
            
            String candPrefix = el.attributeValue("prefix");
            if (candPrefix != null) {
                divRes.setPrefix(candPrefix);
            }               

            for (Object obj :  el.content()) {
                if (obj instanceof Namespace){
                    Namespace ns = (Namespace) obj;                         
                    divRes.putNamespace(ns.getPrefix(), ns.getURI());
                }
                
            }
           
            throw new RuntimeException(FOUND);

        }

    }

    @Override
    public void onEnd(ElementPath elementPath) {
        // nothing to do
    }


}