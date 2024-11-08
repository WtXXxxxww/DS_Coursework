/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package encrypt;
 

import java.security.PrivateKey;
import java.security.PublicKey;
import java.util.Base64;
 
/**
 * This program is for testing public-private key encryption and decryption
 * functions of class AsymmetricCryptoSystem.
 * Created for CBSCC311 Lab
 * @author Scott Piao
 */
public class PublicPrivateKeyTest {
   /*
    private static final String USERID = "st1";
    private static final String ORIGINAL_MSG = "userpassword";
 
    public static void main(String[] args) {
        try {
            // Initialize the crypto system
            AsymmetricCryptoSystem kgen = new AsymmetricCryptoSystem();
 
            // Generate keys
            PublicKey pubKey = kgen.getPublicKey();
            PrivateKey privateKey = kgen.getPrivateKey();
 
            // Encrypt the message
            byte[] encryptedMsg = kgen.encrypt(pubKey, ORIGINAL_MSG.getBytes());
            String cipherText = Base64.getEncoder().encodeToString(encryptedMsg);
 
            // Store keys (this is a placeholder; actual implementation depends on the database and storage mechanism)
            kgen.storeKeysInDB(USERID, cipherText);
 
            // Decrypt the message with the private key
            byte[] decryptedMsg = kgen.decrypt(privateKey, Base64.getDecoder().decode(cipherText));
            String decryptedText = new String(decryptedMsg);
 
            // Retrieve the private key from the database and decrypt again
            PrivateKey retrievedPrivateKey = kgen.getPrivateKeyFromDB(USERID);
            byte[] decryptedMsgWithRetrievedKey = kgen.decrypt(retrievedPrivateKey, Base64.getDecoder().decode(cipherText));
            String resultText = new String(decryptedMsgWithRetrievedKey);
 
            // Print results
            printResults(ORIGINAL_MSG, cipherText, decryptedText, resultText);
 
        } catch (Exception e) {
            e.printStackTrace();
        }
    }   
    private static void printResults(String originalMsg, String cipherText, String decryptedText, String resultText) {
        System.out.println("[Original Text]\n" + originalMsg);
        System.out.println("\n[Encrypted Text (Base64 Encoded)]\n" + cipherText);
        System.out.println("\n[Decrypted Text]\n" + decryptedText);
        System.out.println("\n[Decrypted Text with Retrieved Key]\n" + resultText);
    } */
   
}

