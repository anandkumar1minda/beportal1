package idc.emp;

import java.util.Random;
import java.util.UUID;

public class HashGenerator {
	
	private static final String dCase = "abcdefghijklmnopqrstuvwxyz";
    private static final String uCase = "ABCDEFGHIJKLMNOPQRSTUVWXYZ";
    private static final String sChar = "!@#$%^&*";
    private static final String intChar = "0123456789";
    private static Random r = new Random();
    private static StringBuilder pass = new StringBuilder();

	    	    public static void main(String[] args) {
	    	    	//HashGenerator hashGenerator = new HashGenerator();
	    	      //  System.out.println(hashGenerator.generateString());
	    	       // hashGenerator.newRandom();
	    	      //  System.out.println(hashGenerator.generateUniqueToken(100));
	    	    }
              
	    	    public static String generateString() {
	    	        String uuid = UUID.randomUUID().toString();
	    	        return "uuid = " + uuid; 
	    	    }
	    	    
	    	    public static void newRandom(){
	    	    	
	    	    	System.out.println("Generating pass...");
	    	    	
	    	        while (pass.length () != 16){
	    	            int rPick = r.nextInt(4);
	    	            if (rPick == 0){
	    	                int spot = r.nextInt(26);
	    	                pass.append(dCase.charAt(spot));
	    	            } else if (rPick == 1) {
	    	                int spot = r.nextInt(26);
	    	                pass.append(uCase.charAt(spot));
	    	            } else if (rPick == 2) {
	    	                int spot = r.nextInt(8);
	    	                pass.append(sChar.charAt(spot));
	    	            } else {
	    	                int spot = r.nextInt(10);
	    	                pass.append(intChar.charAt(spot));
	    	            }
	    	        }
	    	        
	    	        System.out.println ("Generated Pass: " + pass.toString());
	    	        
	    	    }
	    	    
	    	    public synchronized String generateUniqueToken(Integer length){ 
	    	        byte random[] = new byte[length];
	    	        Random randomGenerator = new Random();
	    	        StringBuffer buffer = new StringBuffer();

	    	        randomGenerator.nextBytes(random);

	    	        for (int j = 0; j < random.length; j++) {
	    	            byte b1 = (byte) ((random[j] & 0xf0) >> 4);
	    	            byte b2 = (byte) (random[j] & 0x0f);
	    	            if (b1 < 10)
	    	                buffer.append((char) ('0' + b1));
	    	            else
	    	                buffer.append((char) ('A' + (b1 - 10)));
	    	            if (b2 < 10)
	    	                buffer.append((char) ('0' + b2));
	    	            else
	    	                buffer.append((char) ('A' + (b2 - 10)));
	    	        }
	    	        return (buffer.toString());
	    	    }
	   }
