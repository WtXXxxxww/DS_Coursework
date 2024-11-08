/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package encrypt;

/**
 * This program generates public and private keys for asymmetric cryptosystem.
 * Default encryption algorithm is RSA (Rivest-Shamir-Adleman). Created for
 * CBSCC311 Lab
 *
 * @author Scott Piao
 */
import java.io.File;
import java.io.FileInputStream;
import java.io.FileNotFoundException;
import java.io.FileOutputStream;
import java.io.IOException;
import java.security.KeyFactory;
import java.security.KeyPair;
import java.security.KeyPairGenerator;
import java.security.NoSuchAlgorithmException;
import java.security.NoSuchProviderException;
import java.security.PrivateKey;
import java.security.PublicKey;
import java.security.spec.PKCS8EncodedKeySpec;
import java.security.spec.X509EncodedKeySpec;
import java.util.Base64;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.crypto.Cipher;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

public class AsymmetricCryptoSystem {

    private KeyPairGenerator keyGenerator;
    private KeyPair keyPair;
    private PrivateKey privateKey;
    private PublicKey publicKey;
    private static final String ALGORITHM = "RSA"; //Rivest-Shamir-Adleman
    
    // 数据库连接信息
    private static final String DB_URL = "jdbc:mysql://bj-cynosdbmysql-grp-3uoflkim.sql.tencentcdb.com:20820/library?autoReconnect=true&useSSL=false";
    private static final String USER = "root";
    private static final String PASS = "Ds123456";

    /*Default constrctor*/
    public AsymmetricCryptoSystem() throws NoSuchAlgorithmException, NoSuchProviderException {
        int keyLength = 2048;

        //We need to tell which alforithm to use (RSA fir this case).
        keyGenerator = KeyPairGenerator.getInstance(ALGORITHM);
        //keyGenerator = KeyPairGenerator.getInstance("DSA");
        keyGenerator.initialize(keyLength);

        keyPair = keyGenerator.generateKeyPair();
        privateKey = keyPair.getPrivate();
        publicKey = keyPair.getPublic();
    }

    /**Default constructor with parameter of key length.
     * @param keyLeng Length of Key. Minimum 2048 is suggested.
     */
    public AsymmetricCryptoSystem(int keyLeng) throws NoSuchAlgorithmException, NoSuchProviderException {
        keyGenerator = KeyPairGenerator.getInstance(ALGORITHM);
        keyGenerator.initialize(keyLeng);

        keyPair = keyGenerator.generateKeyPair();
        privateKey = keyPair.getPrivate();
        publicKey = keyPair.getPublic();
    }

    /**
     * @return private key
     */
    public PrivateKey getPrivateKey() {
        return privateKey;
    }

    /**
     * @return public key
     */
    public PublicKey getPublicKey() {
        return publicKey;
    }
    
    /** 
     * Encrypt input text using public key.
     * @param key
     * @param inputText
     * @return 
     */
    public byte[] encrypt(PublicKey key, byte[] inputText)
            throws Exception {
        
        Cipher cipher = Cipher.getInstance(ALGORITHM);
        cipher.init(Cipher.ENCRYPT_MODE, key);

        byte[] encryptedBytes = cipher.doFinal(inputText);

        return encryptedBytes;
    }
    
    /** 
     * Encrypt input text using private key.
     * @param key
     * @param inputText
     * @return  
     */
    public byte[] encrypt(PrivateKey key, byte[] inputText)
            throws Exception {

        //PublicKey key = KeyFactory.getInstance(ALGORITHM).generatePublic(new X509EncodedKeySpec(publicKey));
        Cipher cipher = Cipher.getInstance(ALGORITHM);
        cipher.init(Cipher.ENCRYPT_MODE, key);

        byte[] encryptedBytes = cipher.doFinal(inputText);

        return encryptedBytes;
    }

    /** 
     * Decrypt input cipher text using private key.
     * @param key
     * @param cipherText generated with public key
     * @return 
     * @throws java.lang.Exception 
     */
    public byte[] decrypt(PrivateKey key, byte[] cipherText)
            throws Exception {

        //PKCS8EncodedKeySpec privateKeySpecs = new PKCS8EncodedKeySpec(privateKey);
        //PrivateKey key = KeyFactory.getInstance(ALGORITHM).generatePrivate(privateKeySpecs);
        Cipher cipher = Cipher.getInstance(ALGORITHM);
        cipher.init(Cipher.DECRYPT_MODE, key);

        byte[] decryptedBytes = cipher.doFinal(cipherText);

        return decryptedBytes;
    }
    
    /** 
     * Decrypt input cipher text using public key. The input cipher text must be produced with private key.
     * @param key
     * @param cipherText encoded with private key.
     * @return 
     * @throws java.lang.Exception 
     */
    public byte[] decrypt(PublicKey key, byte[] cipherText)
            throws Exception {

        //PKCS8EncodedKeySpec privateKeySpecs = new PKCS8EncodedKeySpec(privateKey);
        //PrivateKey key = KeyFactory.getInstance(ALGORITHM).generatePrivate(privateKeySpecs);
        Cipher cipher = Cipher.getInstance(ALGORITHM);
        cipher.init(Cipher.DECRYPT_MODE, key);

        byte[] decryptedBytes = cipher.doFinal(cipherText);

        return decryptedBytes;
    }
    
    /**
     * 将公钥和私钥存储到数据库中。
     * @param userName 用户名称
     * @param encryptedPassword 加密的密码
     */
    public void storeKeysInDB(String userName, String encryptedPassword) {
        String publicKeyStr = Base64.getEncoder().encodeToString(publicKey.getEncoded());
        String privateKeyStr = Base64.getEncoder().encodeToString(privateKey.getEncoded());
 
        String sql = "INSERT INTO security (user_name, encrypted_password, public_key, private_key) VALUES (?, ?, ?, ?)";
 
        try (Connection conn = DriverManager.getConnection(DB_URL, USER, PASS);
             PreparedStatement pstmt = conn.prepareStatement(sql)) {
            pstmt.setString(1, userName);
            pstmt.setString(2, encryptedPassword);
            pstmt.setString(3, publicKeyStr);
            pstmt.setString(4, privateKeyStr);
            pstmt.executeUpdate();
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }
    
     /**
     * 从数据库中检索公钥。
     * @param userName 用户名称
     * @return 公钥对象
     */
    public PublicKey getPublicKeyFromDB(String userName) {
        String sql = "SELECT public_key FROM security WHERE user_name = ?";
 
        try (Connection conn = DriverManager.getConnection(DB_URL, USER, PASS);
             PreparedStatement pstmt = conn.prepareStatement(sql)) {
            pstmt.setString(1, userName);
            ResultSet rs = pstmt.executeQuery();
            if (rs.next()) {
                String publicKeyStr = rs.getString("public_key");
                byte[] publicKeyBytes = Base64.getDecoder().decode(publicKeyStr);
                return KeyFactory.getInstance(ALGORITHM).generatePublic(new X509EncodedKeySpec(publicKeyBytes));
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return null;
    }
 
    /**
     * 从数据库中检索私钥。
     * @param userName 用户名称
     * @return 私钥对象
     */
    public PrivateKey getPrivateKeyFromDB(String userName) {
        String sql = "SELECT private_key FROM security WHERE user_name = ?";
 
        try (Connection conn = DriverManager.getConnection(DB_URL, USER, PASS);
             PreparedStatement pstmt = conn.prepareStatement(sql)) {
            pstmt.setString(1, userName);
            ResultSet rs = pstmt.executeQuery();
            if (rs.next()) {
                String privateKeyStr = rs.getString("private_key");
                byte[] privateKeyBytes = Base64.getDecoder().decode(privateKeyStr);
                return KeyFactory.getInstance(ALGORITHM).generatePrivate(new PKCS8EncodedKeySpec(privateKeyBytes));
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return null;
    }
    
     /**
     * Save public or private key in a file.
     * @param filePath Full file path or file name.
     * @param key Public or private key as byte array.
     */
    public void saveKeyToFile(String filePath, byte[] key) throws IOException {
        File file = new File(filePath);
        //file.getParentFile().mkdirs();
        try (FileOutputStream os = new FileOutputStream(file)) {
            os.write(key);
            os.flush();
            os.close();
        }
    }
    
    
    /** 
     * Read public or private key from file and return the key as byte array.
     * @param filePath Full path or file name of the key file (either public or private key)    
     * @return Return the key as byte array.
     */
    public byte[] getKeyFromFile(String filePath) {
                
        try {
            File keyFile = new File(filePath);
            FileInputStream stream = new FileInputStream(filePath);
            byte[] encodedKey = new byte[(int) keyFile.length()];
            stream.read(encodedKey);
            stream.close();
            
            return encodedKey;
        } catch (FileNotFoundException ex) {
            ex.printStackTrace();
            return null;
        } catch (IOException ex) {
            ex.printStackTrace();
            return null;
        }
    
    }
    
    
}