package com.mangosoft.util;

import java.io.ByteArrayOutputStream;
import java.io.DataOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.net.URL;
import java.security.KeyManagementException;
import java.security.NoSuchAlgorithmException;
import java.security.cert.CertificateException;
import java.security.cert.X509Certificate;
import java.util.Map;

import javax.net.ssl.HostnameVerifier;
import javax.net.ssl.HttpsURLConnection;
import javax.net.ssl.SSLContext;
import javax.net.ssl.SSLSession;
import javax.net.ssl.TrustManager;
import javax.net.ssl.X509TrustManager;

import net.sf.json.JSONArray;
import net.sf.json.JSONObject;

public class HttpsPostData  {
	private static class TrustAnyTrustManager implements X509TrustManager {
		  
	        public void checkClientTrusted(X509Certificate[] chain, String authType)
	                throws CertificateException {
	        }
	 
	        public void checkServerTrusted(X509Certificate[] chain, String authType)
	                throws CertificateException {
	        }
	 
	        public X509Certificate[] getAcceptedIssuers() {
	            return new X509Certificate[] {};
	        }
	    
	}
	    private static class TrustAnyHostnameVerifier implements HostnameVerifier {
	        public boolean verify(String hostname, SSLSession session) {
	            return true;
	        }
	    }
	 
	    /**
	     * post方式请求服务器(https协议)
	     * 
	     * @param url
	     *            请求地址
	     * @param content
	     *            参数
	     * @param charset
	     *            编码
	     * @return
	     * @throws NoSuchAlgorithmException
	     * @throws KeyManagementException
	     * @throws IOException
	     */
	    public   String post(String url, String content, String charset)
	            throws NoSuchAlgorithmException, KeyManagementException,
	            IOException {
	        SSLContext sc = SSLContext.getInstance("SSL");
	        sc.init(null, new TrustManager[] { new TrustAnyTrustManager() },
	                new java.security.SecureRandom());
	 
	        URL console = new URL(url);
	        HttpsURLConnection conn = (HttpsURLConnection) console.openConnection();
	        conn.setSSLSocketFactory(sc.getSocketFactory());
	        conn.setHostnameVerifier(new TrustAnyHostnameVerifier());
	        conn.setDoOutput(true);
	        conn.connect();
	        DataOutputStream out = new DataOutputStream(conn.getOutputStream());
	        out.write(content.getBytes(charset));
	        // 刷新、关闭
	        out.flush();
	        out.close();
	        InputStream is = conn.getInputStream();
	        if (is != null) {
	            ByteArrayOutputStream outStream = new ByteArrayOutputStream();
	            byte[] buffer = new byte[1024];
	            int len = 0;
	            while ((len = is.read(buffer)) != -1) {
	                outStream.write(buffer, 0, len);
	            }
	            is.close();
	            conn.disconnect();
	            return outStream.toByteArray().toString();
	        }
	        return null;
	    }
//	    public static void main(String[] args){
//	    	String rs = "";
//	    
//	      
//	    	JSONObject object = new JSONObject();
//	    
//	    	object.put("touser", "oOa6Dsz1jBagLzJo2_kss1HqNtGk");
//	    	object.put("msgtype", "text");
//	    
//	    	JSONObject text = new JSONObject();
//	        text.put("content", "sfefsfefsefef");
//	        object.put("text", text);
//	    
//	    	String jsonstr = object.toString();
//	    	System.out.println(jsonstr);
//	    	
//	       try {
//			 rs = post("https://api.weixin.qq.com/cgi-bin/message/custom/send?access_token=qn7TyQbxBN0kGnaT_d91D6ROGHnIz5o10zAHgNIH0HbiCpX4e_bJAQhH0KsEVGM2P-l6ZCl_D7XKKqned5p5r3lLtm9ZDYm633-BKctx58gYBOgAIAGJW",jsonstr,"gbk");
//		} catch (KeyManagementException e) {
//			// TODO Auto-generated catch block
//			e.printStackTrace();
//		} catch (NoSuchAlgorithmException e) {
//			// TODO Auto-generated catch block
//			e.printStackTrace();
//		} catch (IOException e) {
//			// TODO Auto-generated catch block
//			e.printStackTrace();
//		}
//		System.out.println(rs);
//	    }
}
