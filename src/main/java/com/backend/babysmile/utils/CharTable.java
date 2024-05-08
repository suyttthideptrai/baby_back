package com.backend.babysmile.utils;

import java.text.Normalizer;
import java.util.regex.Pattern;

public class CharTable {
    public static String buildStringIDPrefix(String vendorName){
        if (vendorName.isEmpty()) {
            throw new IllegalArgumentException("Supplied ID String cannot be empty");
        }
        vendorName = vendorName.trim();
        String normalizedVendorName = Normalizer.normalize(vendorName, Normalizer.Form.NFD);
        //System.out.println(normalizedVendorName);
        Pattern pattern = Pattern.compile("\\p{InCombiningDiacriticalMarks}+");
        normalizedVendorName = normalizedVendorName.replace("đ", "D").replace('Đ', 'D');
        normalizedVendorName = pattern.matcher(normalizedVendorName).replaceAll("");
        System.out.println(normalizedVendorName);
        String[] words = normalizedVendorName.split("\\s+");
        String prefix;
        if (words.length == 1) {
            prefix =  words[0].substring(0, Math.min(words[0].length(), 2)).toUpperCase();
        }else{
            prefix = (words[0].substring(0, Math.min(words[0].length(), 1)).toUpperCase()+ words[1].substring(0, Math.min(words[1].length(), 1)).toUpperCase());
        }
        return prefix;
    }

    public static void main(String[] args) {
        System.out.println(buildStringIDPrefix("đểu"));
    }
}
