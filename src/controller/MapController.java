package controller;

import java.io.BufferedReader;
import java.io.InputStreamReader;
import java.net.HttpURLConnection;
import java.net.URL;
import java.net.URLEncoder;

import javax.servlet.http.HttpServletResponse;

import org.json.simple.JSONArray;
import org.json.simple.JSONObject;
import org.json.simple.parser.JSONParser;
import org.json.simple.parser.ParseException;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

@Controller
public class MapController {
	Double katekX, katekY;
	
	///�˻��Ǵ� �ٵǴ� ���̹� �����˻� api

	@RequestMapping(value = "/mapSearch.do", method = RequestMethod.POST)
	@ResponseBody
	public void map(String mapKeyword, HttpServletResponse resp) {

		String clientId = "1aAj908XC0P93DkPzp2n";// ���ø����̼� Ŭ���̾�Ʈ ���̵�";
		String clientSecret = "0qbdXFSZX8";// ���ø����̼� Ŭ���̾�Ʈ ��ũ����";
		try {
			System.out.println(mapKeyword);
			String addr = URLEncoder.encode(mapKeyword, "UTF-8");
			String apiURL = "https://openapi.naver.com/v1/search/local.json?query=" + addr;
			
			// String apiURL = "https://openapi.naver.com/v1/map/geocode.xml?query=" + addr;
			// // xml
			URL url = new URL(apiURL);
			HttpURLConnection con = (HttpURLConnection) url.openConnection();
			con.setRequestMethod("GET");
			con.setRequestProperty("X-Naver-Client-Id", clientId);
			con.setRequestProperty("X-Naver-Client-Secret", clientSecret);
			int responseCode = con.getResponseCode();
			BufferedReader br;
			if (responseCode == 200) { // ���� ȣ��
				br = new BufferedReader(new InputStreamReader(con.getInputStream(), "utf-8"));
			} else { // ���� �߻�
				br = new BufferedReader(new InputStreamReader(con.getErrorStream(), "utf-8"));
			}
			String inputLine;
			StringBuffer response = new StringBuffer();
			while ((inputLine = br.readLine()) != null) {
				response.append(inputLine);
			}
			br.close();
			System.out.println(response.toString());
			
			//parsing//
			String jsonInfo = response.toString();
			
			try {
				 
	            JSONParser jsonParser = new JSONParser();
	             
//	            JSON�����͸� �־� JSON Object �� ����� �ش�.
	            JSONObject jsonObject = (JSONObject) jsonParser.parse(jsonInfo);
	            //books�� �迭�� ����
	            JSONArray bookInfoArray = (JSONArray) jsonObject.get("items");
	            for(int i=0; i<1; i++){	 
	 
	                 
	                //�迭 �ȿ� �ִ°͵� JSON���� �̱� ������ JSON Object �� ����
	                JSONObject bookObject = (JSONObject) bookInfoArray.get(i);
	                
	                Object katekXOb = bookObject.get("mapx");	                
	                String katekXStr = katekXOb.toString();
	                katekX = Double.valueOf(katekXStr).doubleValue();
	                
	                Object katekYOb = bookObject.get("mapy");
	                String katekYStr = katekYOb.toString();
	                katekY = Double.valueOf(katekYStr).doubleValue();
	               
	            }
	 
	 
	        } catch (ParseException e) {
	            e.printStackTrace();
	        }

			resp.setContentType("text/json;charset=utf-8");
			resp.getWriter().print("{\"point\": {\"x\": "+katekX+", \"y\": "+katekY+"}}");

		} catch (Exception e) {
			System.out.println(e);
		}

	}

	///���������θ� �˻��Ǵ� ���̹� ���� api
	
//	@RequestMapping(value = "/mapSearch.do", method = RequestMethod.POST)
//	@ResponseBody
//	public void mapSearch(HttpServletResponse resp, long lat, long lng) {
//
//		String clientId = "1aAj908XC0P93DkPzp2n";// ���ø����̼� Ŭ���̾�Ʈ ���̵�";
//		String clientSecret = "0qbdXFSZX8";// ���ø����̼� Ŭ���̾�Ʈ ��ũ����";
//		try {
			
//			System.out.println(mapKeyword);
//			String x = URLEncoder.encode(mapKeyword, "UTF-8");
//			String apiURL = "https://openapi.naver.com/v1/map/geocode?query=" + addr+"&coord=20";
//			String apiURL = "https://openapi.naver.com/v1/map/reversegeocode?query=" + addr+"&coord=20"; // json
			
			// String apiURL = "https://openapi.naver.com/v1/map/geocode.xml?query=" + addr;
			// // xml
//			URL url = new URL(apiURL);
//			HttpURLConnection con = (HttpURLConnection) url.openConnection();
//			con.setRequestMethod("GET");
//			con.setRequestProperty("X-Naver-Client-Id", clientId);
//			con.setRequestProperty("X-Naver-Client-Secret", clientSecret);
//			int responseCode = con.getResponseCode();
//			BufferedReader br;
//			if (responseCode == 200) { // ���� ȣ��
//				br = new BufferedReader(new InputStreamReader(con.getInputStream(), "utf-8"));
//			} else { // ���� �߻�
//				br = new BufferedReader(new InputStreamReader(con.getErrorStream(), "utf-8"));
//			}
//			String inputLine;
//			StringBuffer response = new StringBuffer();
//			while ((inputLine = br.readLine()) != null) {
//				response.append(inputLine);
//			}
//			br.close();
//			System.out.println(response.toString());
//
//			resp.setContentType("text/json;charset=utf-8");
//			resp.getWriter().print(response.toString());
//
//		} catch (Exception e) {
//			System.out.println(e);
//		}
//
//	}
}