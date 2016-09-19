<xs:schema  xmlns:xs="http://www.w3.org/2001/XMLSchema" 			
 			xmlns:fn="http://www.w3.org/2005/xpath-functions"
			xmlns:vc="http://www.w3.org/2007/XMLSchema-versioning"
			vc:minVersion="1.1">
			
	<xs:annotation>
	    <xs:documentation xml:lang="en">
	     	XML Schema for Diversicon LMF XMLs
	     	
	     	Note it uses assertions to check constraints among *values*, so it requires XSD 1.1 
	     	compatible parsers. 
	     		     	
	     	Derived from DTD
	     	https://github.com/DavidLeoni/diversicon/blob/master/src/main/resources/diversicon-1.0.dtd
	     	
	     	Which in turn is derived from original UBY DTD at v0.7.0:
	     	https://github.com/dkpro/dkpro-uby/blob/de.tudarmstadt.ukp.uby-0.7.0/de.tudarmstadt.ukp.uby.lmf.model-asl/src/main/resources/dtd/UBY_LMF.dtd
	     		     		     
	    </xs:documentation>
	  </xs:annotation> 				
 				
	<xs:complexType name="Lexicon" >
		<xs:attribute name="id" type="xs:string"/>
	</xs:complexType>

		<xs:complexType name="LexicalResource" >
	 		 	 		
		<xs:sequence>
			<xs:element name="Lexicon" type="Lexicon" minOccurs="1" maxOccurs="unbounded">				
			</xs:element>			
		</xs:sequence>		
		<xs:attribute name="id" type="xs:string"/>
		<xs:attribute name="prefix" type="xs:string"/>
		<xs:attribute name="name" type="xs:string"/>
	
		<xs:assert test="every $prefixed-elem in .//* satisfies fn:starts-with($prefixed-elem/@id, fn:concat(@prefix, ':'))">		
			<xs:annotation>
			      <xs:appinfo>
			        Value of the "min" attribute can not be greater than that of the "max"
			        attribute.
			      </xs:appinfo>
			      <xs:documentation>
			        When this assertion fails, the content of the above "appinfo" is used
			        to produce the error message.
			      </xs:documentation>
	    	</xs:annotation>		
		</xs:assert>
	 	
	</xs:complexType>
	
	<xs:element name="LexicalResource" type="LexicalResource" ></xs:element> 			
			
</xs:schema> 				
