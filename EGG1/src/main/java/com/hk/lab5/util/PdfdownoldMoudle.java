package com.hk.lab5.util;

import java.io.ByteArrayInputStream;
import java.io.FileInputStream;
import java.io.FileNotFoundException;
import java.io.IOException;
import java.io.StringReader;
import java.io.UnsupportedEncodingException;
import java.net.URLEncoder;
import java.nio.charset.Charset;

import javax.servlet.http.HttpServletResponse;


import com.itextpdf.text.BadElementException;
import com.itextpdf.text.Document;
import com.itextpdf.text.DocumentException;
import com.itextpdf.text.Image;
import com.itextpdf.text.PageSize;
import com.itextpdf.text.pdf.PdfWriter;
import com.itextpdf.text.pdf.codec.Base64;
import com.itextpdf.tool.xml.XMLWorker;
import com.itextpdf.tool.xml.XMLWorkerFontProvider;
import com.itextpdf.tool.xml.XMLWorkerHelper;
import com.itextpdf.tool.xml.css.CssFile;
import com.itextpdf.tool.xml.css.StyleAttrCSSResolver;
import com.itextpdf.tool.xml.html.CssAppliers;
import com.itextpdf.tool.xml.html.CssAppliersImpl;
import com.itextpdf.tool.xml.html.Tags;
import com.itextpdf.tool.xml.parser.XMLParser;
import com.itextpdf.tool.xml.pipeline.css.CSSResolver;
import com.itextpdf.tool.xml.pipeline.css.CssResolverPipeline;
import com.itextpdf.tool.xml.pipeline.end.PdfWriterPipeline;
import com.itextpdf.tool.xml.pipeline.html.AbstractImageProvider;
import com.itextpdf.tool.xml.pipeline.html.HtmlPipeline;
import com.itextpdf.tool.xml.pipeline.html.HtmlPipelineContext;

public class PdfdownoldMoudle {
	class Base64ImageProvider extends AbstractImageProvider {
		 
        @Override
        public Image retrieve(String src) {
            int pos = src.indexOf("base64,");
            try {
                if (src.startsWith("data") && pos > 0) {
                    byte[] img = Base64.decode(src.substring(pos + 7));
                    return Image.getInstance(img);
                }
                else {
                    return Image.getInstance(src);
                }
            } catch (BadElementException ex) {
                return null;
            } catch (IOException ex) {
                return null;
            }
        }
 
        @Override
        public String getImageRootPath() {
            return null;
        }
    }
	
	public void itextPdfDownold(String fName,String pdfarea, HttpServletResponse response) 
	{
		Document document = new Document(PageSize.B4, 50, 50, 50, 50); // 용지 및 여백 설정
		//System.out.println(pdfarea);
		pdfarea= pdfarea.replaceAll("<br>", "<br></br>"); //에디터에서 엔터를 치면 br 태그가 되니때문에
		pdfarea= pdfarea.replaceAll("class=\"img\">", "class=\"img\"></img>");
		pdfarea= pdfarea.replaceAll("name=\"imgTag\">", "name=\"imgTag\"></img>");
		pdfarea= pdfarea.replaceAll("name=\"imgDataURL\">", "name=\"imgDataURL\"></input>");

//		pdfarea= pdfarea.replaceAll("png\">", "png\"></img>");
//		pdfarea= pdfarea.replaceAll("gif\">", "gif\"></img>");
		
		// br 태그를 p 태그로 바꿔줬다 이걸 안하면 pdf 출력이 안된다.
		System.out.println("replaceAll 을 거친 최종 태그들" + pdfarea);
		
		// PdfWriter 생성
		//PdfWriter writer = PdfWriter.getInstance(document, new FileOutputStream("d:/"+fName+".pdf")); // 바로 다운로드.
		PdfWriter writer = null;
		try {
			writer = PdfWriter.getInstance(document, response.getOutputStream());
			
		} catch (DocumentException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		try {
			writer.setInitialLeading(12.5f);
		} catch (DocumentException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		 
		// 파일 다운로드 설정
		response.setContentType("application/pdf"); //새창으로 pdf보여주기
		response.setContentType("/pdf"); 
		String fileName = null;
		try {
			System.out.println("fName 상태"+fName);
			fileName = URLEncoder.encode(fName, "UTF-8");
		} catch (UnsupportedEncodingException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} // 파일명이 한글일 땐 인코딩 필요
		response.setHeader("Content-Transper-Encoding", "binary");
		response.setHeader("Content-Disposition", "inline; filename=" + fileName + ".pdf");
		 
		// Document 오픈
		document.open();
		/*
		Image image= retrieve(imgDataURL);
		//System.out.println("image 결과는??" + image.getUrl());
		try {
			if(image != null){
				document.add(image);
			}
			
		} catch (DocumentException e1) {
			// TODO Auto-generated catch block
			e1.printStackTrace();
		}
		*/
		XMLWorkerHelper helper = XMLWorkerHelper.getInstance();
		     
		// CSS
		CSSResolver cssResolver = new StyleAttrCSSResolver();
		CssFile cssFile = null;
		try {
			cssFile = helper.getCSS(new FileInputStream("D:\\egg1test\\EGG1\\src\\main\\webapp\\css\\pdftest.css"));
		} catch (FileNotFoundException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		cssResolver.addCss(cssFile);
		     
		// HTML, 폰트 설정
		XMLWorkerFontProvider fontProvider = new XMLWorkerFontProvider(XMLWorkerFontProvider.DONTLOOKFORFONTS);
		fontProvider.register("D:\\egg1test\\EGG1\\src\\main\\webapp\\font\\malgun.ttf", "MalgunGothic"); // MalgunGothic은 alias,
		CssAppliers cssAppliers = new CssAppliersImpl(fontProvider);
		 
		HtmlPipelineContext htmlContext = new HtmlPipelineContext(cssAppliers);
		htmlContext.setTagFactory(Tags.getHtmlTagProcessorFactory());
		htmlContext.setImageProvider(new Base64ImageProvider());
		 
		// Pipelines
		PdfWriterPipeline pdf = new PdfWriterPipeline(document, writer);
		HtmlPipeline html = new HtmlPipeline(htmlContext, pdf);
		CssResolverPipeline css = new CssResolverPipeline(cssResolver, html);
		 
		XMLWorker worker = new XMLWorker(css, true);
		XMLParser xmlParser = new XMLParser(worker, Charset.forName("UTF-8"));
		 
		// 폰트 설정에서 별칭으로 줬던 "MalgunGothic"을 html 안에 폰트로 지정한다.
		
		/*
		String htmlStr = "<html><head><body style='font-family: MalgunGothic;'>"
		            + "<p>PDF 안에 들어갈 내용입니다.</p>"
		            + "<h3>한글, English, 漢字.</h3>"
		        + "</body></head></html>";
		        */
		//String htmlStr = "<html><head></head><body style='font-family: MalgunGothic;'>"+pdfarea+"</body></html>";
		String htmlStr = pdfarea;
		StringReader strReader = new StringReader(htmlStr);
		try {
			System.out.println("출력함 해보자 : " + strReader.toString());
			//xmlParser.parse(strReader);
			//xmlParser.parse(new ByteArrayInputStream(strReader.toString().getBytes()));
			xmlParser.parse(new ByteArrayInputStream(htmlStr.getBytes()));
			document.close();
			writer.close();
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		/*
		document.close();
		writer.close();
		*/
	}
}
