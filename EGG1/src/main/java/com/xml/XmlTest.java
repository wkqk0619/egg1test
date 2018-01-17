package com.xml;

import java.io.IOException;
import java.net.URL;
import java.util.List;
import org.jdom2.Document;
import org.jdom2.Element;
import org.jdom2.JDOMException;
import org.jdom2.input.SAXBuilder;

public class XmlTest {
	public List<Element> asdf(){
		String url="http://openapi.kised.or.kr/openapi/service/rest/ContentsService/getAnnouncementList?ServiceKey=TAcPXVDYcd5PGo1LfvXTia2fd5pw5eE60IPowYJj%2BZtjFJ8v%2FOu8KWj97T7QoH3WzebCJ3Fow%2BS2gD3%2BpDqRVQ%3D%3D&pageNo=5&numOfRows=50";
		  //?°?´?„° ?½?–´?“¤?´ê¸?(?ŒŒ?„œ?—­?• )
		  SAXBuilder builder = new SAXBuilder();
		  //ë©”ëª¨ë¦¬ì— documentë¥? ë§Œë“ ?‹¤, ?Š¤?Š¸ë¦¼ì„ ?“¸ê²½ìš° ë©”ì„¸ì§??— ?”°?¼ ì²˜ë¦¬?•´ì£¼ë©´?œ?‹¤
		  Document jdomdoc;
		  List<Element> lis_E = null;
		  try {
			   jdomdoc = builder.build(new URL(url));
			   System.out.println("ë£¨íŠ¸:"+jdomdoc.toString());
			   
			   //rootë¥? êº¼ëƒ„(Sample.xml?˜ Family)
			   Element root = jdomdoc.getRootElement();
			   System.out.println("ë£¨íŠ¸ ë§ë‚˜?"+root);
			   
			   //root?˜ ??‹?„ êº¼ëƒ„.
			   Element desc_E = root.getChild("body");
			   System.out.println("??‹?„?"+desc_E);
			   String description = desc_E.getValue();
			   System.out.println("description="+description);
			   
			   
			   //ë°˜ë³µ? ?¸ ?°?´?„°?Š” ë°˜ë³µë¬¸ìœ¼ë¡? êº¼ë‚´?¼
			   Element desc_P = root.getChild("body");
			   Element it = desc_P.getChild("items");
			   System.out.println("body?„??"+desc_P);
			   System.out.println("body?˜ ??‹??"+desc_P.getChildren("items"));
			  //List<Element> lis_E = desc_P.getChildren("items");
			   lis_E = it.getChildren("item");
			   
			   for(int i=0; i<lis_E.size(); i++){
				   Element person_E=lis_E.get(i);
			    System.out.println("item?¸ê°???"+person_E);
			   // System.out.println("ssn="+person_E.getAttributeValue("item"));
			    System.out.println("firstName="+person_E.getValue());
			    //System.out.println("lastName="+person_E.getChild("detailurl").getValue());
			    System.out.println();
			   }
			  } catch (JDOMException | IOException e) {
			   // TODO Auto-generated catch block
			   System.out.println("e="+e.toString());
			  }
		  return lis_E;
	}
}
