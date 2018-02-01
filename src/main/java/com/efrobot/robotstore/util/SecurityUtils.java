package com.efrobot.robotstore.util;


import java.io.UnsupportedEncodingException;
import java.math.BigInteger;
import java.security.InvalidKeyException;
import java.security.Key;
import java.security.KeyFactory;
import java.security.KeyPair;
import java.security.KeyPairGenerator;
import java.security.MessageDigest;
import java.security.NoSuchAlgorithmException;
import java.security.PublicKey;
import java.security.Security;
import java.security.spec.InvalidKeySpecException;
import java.security.spec.KeySpec;
import java.security.spec.RSAPublicKeySpec;

import javax.crypto.Cipher;
import javax.crypto.NoSuchPaddingException;
import javax.crypto.spec.SecretKeySpec;


/**
 * <P>
 * 安全处理操作，负责处理常见的安全操作，包括数据加密、解密等。
 * Copyright 2011 AsiaInfo-Linkage Inc. All Rights Reserved.
 * </p>
 * @author miaofc. Email:miaofc@asiainfo-linkage.com
 * @version 2.0, Nov 23, 2011
 * @see com.ailk.dazzle.util.SecurityUtils 
 * @since
 */
public class SecurityUtils {
	
	
	// ---------------------------------MD5---------------------------------

	/**
	 * 得到MD5字符串
	 * 
	 * @param plaintext
	 *            明文
	 * @return 密文
	 * @author miaofc
	 * @throws NoSuchAlgorithmException
	 * @throws UnsupportedEncodingException
	 * @date Nov 24, 2011 11:36:34 AM
	 */
	public static String encryptByMD5(String plaintext) throws NoSuchAlgorithmException, UnsupportedEncodingException {
		byte[] data = encryptByMD5(plaintext.getBytes());
		String hexStr = StringUtils.byteArray2HexStr(data);
		return hexStr;
	}

	/**
	 * 得到MD5字符串
	 * 
	 * @param plaintext
	 *            明文
	 * @param charset
	 *            字符集
	 * @return 密文
	 * @author miaofc
	 * @throws UnsupportedEncodingException
	 * @throws NoSuchAlgorithmException
	 * @date Nov 25, 2011 3:03:54 PM
	 */
	public static String encryptByMD5(String plaintext, String charset) throws UnsupportedEncodingException, NoSuchAlgorithmException {
		byte[] data = encryptByMD5(plaintext.getBytes(charset));
		String hexStr = StringUtils.byteArray2HexStr(data);
		return hexStr;
	}

	/**
	 * 得到MD5字符串的字节数组
	 * 
	 * @param plaintext
	 *            明文
	 * @return 密文
	 * @author miaofc
	 * @throws NoSuchAlgorithmException
	 * @date Nov 24, 2011 11:39:16 AM
	 */
	public static byte[] encryptByMD5(byte[] plaintext) throws NoSuchAlgorithmException {
		MessageDigest md = MessageDigest.getInstance("MD5");
		md.update(plaintext);
		byte[] result = md.digest();
		return result;
	}

	// ---------------------------------DES---------------------------------

	/**
	 * 获得DES密钥
	 * 
	 * @param arrBTmp
	 *            字节数组形式的密钥
	 * @return 密钥对象
	 * @throws Exception
	 */
	private static Key getDESKey(byte[] arrBTmp) throws Exception {
		byte[] arrB = new byte[8];
		for (int i = 0; i < arrBTmp.length && i < arrB.length; i++) {
			arrB[i] = arrBTmp[i];
		}
		Key key = new SecretKeySpec(arrB, "DES");
		return key;
	}

	/**
	 * DES加密
	 * 
	 * @param plaintext
	 *            明文
	 * @param key
	 *            密钥
	 * @return 密文
	 * @author miaofc
	 * @throws Exception
	 * @throws InvalidKeyException
	 * @date Nov 24, 2011 11:48:30 AM
	 */
	public static byte[] encryptByDES(byte[] plaintext, String key) throws Exception {
		Cipher encryptCipher = Cipher.getInstance("DES");
		encryptCipher.init(Cipher.ENCRYPT_MODE, getDESKey(key.getBytes()));
		return encryptCipher.doFinal(plaintext);
	}

	/**
	 * DES加密
	 * 
	 * @param plaintext
	 *            明文
	 * @param key
	 *            密钥
	 * @return 密文
	 * @author miaofc
	 * @throws Exception
	 * @date Nov 24, 2011 11:48:42 AM
	 */
	public static String encryptByDES(String plaintext, String key) throws Exception {
		byte[] data = encryptByDES(plaintext.getBytes(), key);
		String hexStr = StringUtils.byteArray2HexStr(data);
		return hexStr;
	}

	/**
	 * DES加密
	 * 
	 * @param plaintext
	 *            明文
	 * @param key
	 *            密钥
	 * @param charset
	 *            字符集
	 * @return 密文
	 * @author miaofc
	 * @throws Exception
	 * @date Nov 24, 2011 11:52:23 AM
	 */
	public static String encryptByDES(String plaintext, String key, String charset) throws Exception {
		byte[] data = encryptByDES(plaintext.getBytes(charset), key);
		String hexStr = StringUtils.byteArray2HexStr(data);
		return hexStr;
	}

	/**
	 * DES解密
	 * 
	 * @param crypttext
	 *            密文
	 * @param key
	 *            密钥
	 * @return 明文
	 * @author miaofc
	 * @throws Exception
	 * @date Nov 24, 2011 11:48:49 AM
	 */
	public static byte[] decryptByDES(byte[] crypttext, String key) throws Exception {
		Cipher decryptCipher = Cipher.getInstance("DES");
		decryptCipher.init(Cipher.DECRYPT_MODE, getDESKey(key.getBytes()));
		return decryptCipher.doFinal(crypttext);
	}

	/**
	 * DES解密
	 * 
	 * @param crypttext
	 *            密文
	 * @param key
	 *            密钥
	 * @return 明文
	 * @author miaofc
	 * @throws Exception
	 * @date Nov 24, 2011 11:48:58 AM
	 */
	public static String decryptByDES(String crypttext, String key) throws Exception {
		byte[] data = StringUtils.hexStr2ByteArray(crypttext);
		byte[] result = decryptByDES(data, key);
		return new String(result);
	}

	/**
	 * DES解密
	 * 
	 * @param crypttext
	 *            密文
	 * @param key
	 *            密钥
	 * @param charset
	 *            字符集
	 * @return 明文
	 * @author miaofc
	 * @throws Exception
	 * @date Nov 24, 2011 11:53:56 AM
	 */
	public static String decryptByDES(String crypttext, String key, String charset) throws Exception {
		byte[] data = StringUtils.hexStr2ByteArray(crypttext);
		byte[] result = decryptByDES(data, key);
		return new String(result, charset);
	}

	// ---------------------------------RSA---------------------------------

	/**
	 * 生成RSA公私密钥对，默认长度为1024
	 * 
	 * @return 密钥对
	 */
	public static KeyPair getRSAKeyPair() {
		return getRSAKeyPair(1024);
	}

	/**
	 * 生成RSA公私密钥对
	 * 
	 * @param length
	 *            密钥长度
	 * @return 密钥对
	 */
	public static KeyPair getRSAKeyPair(int length) {
		// 创建‘密匙对’生成器
		KeyPairGenerator kpg = null;
		try {
			kpg = KeyPairGenerator.getInstance("RSA");
		} catch (NoSuchAlgorithmException e) {
			e.printStackTrace();
		}
		// 指定密匙长度（取值范围：512～2048）
		kpg.initialize(length);
		// 生成公私密钥对
		KeyPair keyPair = kpg.genKeyPair();
		return keyPair;
	}

	/**
	 * 根据系数和指数得到公钥
	 * 
	 * @param modulus
	 *            公钥模
	 * @param publicExponent
	 *            公钥指数
	 * @return 公钥对象
	 * @author miaofc
	 * @throws InvalidKeyException
	 * @throws NoSuchAlgorithmException 
	 * @throws InvalidKeySpecException 
	 * @date Nov 25, 2011 3:15:32 PM
	 */
	public static PublicKey getPublicKey(String modulus, String publicExponent) throws InvalidKeyException, InvalidKeySpecException, NoSuchAlgorithmException {
//		PublicKey publicKey = new RSAPublicKeyImpl(new BigInteger(modulus), new BigInteger(publicExponent));
		KeySpec keySpec = new RSAPublicKeySpec(new BigInteger(modulus), new BigInteger(publicExponent));
		PublicKey publicKey = KeyFactory.getInstance("RSA").generatePublic(keySpec);
		return publicKey;
	}

	/**
	 * RSA加密
	 * 
	 * @param plaintext
	 *            明文
	 * @param key
	 *            密钥
	 * @return 密文
	 * @author miaofc
	 * @throws Exception
	 * @date Nov 24, 2011 11:59:41 AM
	 */
	public static String encryptByRSA(String plaintext, Key key) throws Exception {
		byte[] data = encryptByRSA(plaintext.getBytes(), key);
		String hexStr = StringUtils.byteArray2HexStr(data);
		return hexStr;
	}

	/**
	 * RSA加密
	 * 
	 * @param plaintext
	 *            明文
	 * @param key
	 *            密钥
	 * @return 密文
	 * @author miaofc
	 * @throws Exception
	 * @date Nov 24, 2011 11:55:03 AM
	 */
	public static String encryptByRSA(String plaintext, Key key, String charset) throws Exception {
		byte[] data = encryptByRSA(plaintext.getBytes(charset), key);
		String hexStr = StringUtils.byteArray2HexStr(data);
		return hexStr;
	}

	/**
	 * RSA加密
	 * 
	 * @param plaintext
	 *            明文
	 * @param key
	 *            密钥
	 * @return 密文
	 * @author miaofc
	 * @throws NoSuchPaddingException
	 * @throws NoSuchAlgorithmException
	 * @throws Exception
	 * @date Nov 24, 2011 11:56:52 AM
	 */
	public static byte[] encryptByRSA(byte[] plaintext, Key key) throws Exception {
		Cipher cipher = Cipher.getInstance("RSA/ECB/PKCS1Padding");
		cipher.init(Cipher.ENCRYPT_MODE, key);
		;
		return cipher.doFinal(plaintext);
	}

	/**
	 * RSA解密
	 * 
	 * @param crypttext
	 *            密文
	 * @param key
	 *            密钥
	 * @return 明文
	 * @author miaofc
	 * @throws Exception
	 * @date Nov 24, 2011 12:00:18 PM
	 */
	public static String decryptByRSA(String crypttext, Key key) throws Exception {
		return decryptByRSA(crypttext, key, System.getProperty("file.encoding"));
	}

	/**
	 * RSA解密
	 * 
	 * @param crypttext
	 *            密文
	 * @param key
	 *            密钥
	 * @param charset
	 *            字符集
	 * @return 明文
	 * @author miaofc
	 * @throws Exception
	 * @date Nov 24, 2011 11:55:41 AM
	 */
	public static String decryptByRSA(String crypttext, Key key, String charset) throws Exception {
		byte[] data = StringUtils.hexStr2ByteArray(crypttext);
		byte[] result = decryptByRSA(data, key);
		return new String(result, charset);
	}

	/**
	 * RSA解密
	 * 
	 * @param crypttext
	 *            密文
	 * @param key
	 *            密钥
	 * @return 明文
	 * @author miaofc
	 * @throws NoSuchPaddingException
	 * @throws NoSuchAlgorithmException
	 * @throws Exception
	 * @date Nov 24, 2011 11:57:55 AM
	 */
	public static byte[] decryptByRSA(byte[] crypttext, Key key) throws Exception {
		Cipher cipher = Cipher.getInstance("RSA/ECB/PKCS1Padding");
		cipher.init(Cipher.DECRYPT_MODE, key);
		return cipher.doFinal(crypttext);
	}
	
}
