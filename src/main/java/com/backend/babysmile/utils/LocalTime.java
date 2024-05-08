package com.backend.babysmile.utils;

import java.util.Date;
import java.util.Calendar;
import java.util.TimeZone;

public class LocalTime {
    public static Date getCurrentDate() {
        Calendar calendar = Calendar.getInstance(TimeZone.getDefault());
        return calendar.getTime();
    }

    public static void main(String[] args) {
        System.out.println(getCurrentDate());
    }
}