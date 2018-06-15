package com.pucmg.tcc.gcbl.proposta3.clinica.util;

import java.text.DecimalFormat;
import java.time.DayOfWeek;
import java.time.Instant;
import java.time.LocalDate;
import java.time.LocalDateTime;
import java.time.ZoneId;
import java.util.Calendar;
import java.util.Date;
import java.util.GregorianCalendar;

public class DataUtils {

    public static Date asDate(LocalDate localDate) {
      return Date.from(localDate.atStartOfDay().atZone(ZoneId.systemDefault()).toInstant());
    }

    public static Date asDate(LocalDateTime localDateTime) {
      return Date.from(localDateTime.atZone(ZoneId.systemDefault()).toInstant());
    }

    public static LocalDate asLocalDate(Date date) {
      return Instant.ofEpochMilli(date.getTime()).atZone(ZoneId.systemDefault()).toLocalDate();
    }

    public static LocalDateTime asLocalDateTime(Date date) {
      return Instant.ofEpochMilli(date.getTime()).atZone(ZoneId.systemDefault()).toLocalDateTime();
    }
    
    public static boolean isWeekend(Date data){
        Calendar cal = new GregorianCalendar();
        cal.setTime(data);
        int day = cal.get(Calendar.DAY_OF_WEEK);
        return day == Calendar.SUNDAY || day == Calendar.SATURDAY;
    }
    
    public static boolean isSaturday(Date data){
        Calendar cal = new GregorianCalendar();
        cal.setTime(data);
        int day = cal.get(Calendar.DAY_OF_WEEK);
        return day == Calendar.SATURDAY;
    }
    
    public static boolean isSunday(Date data){
        Calendar cal = new GregorianCalendar();
        cal.setTime(data);
        int day = cal.get(Calendar.DAY_OF_WEEK);
        return day == Calendar.SUNDAY;
    }    
    
    ///
    public static boolean isWeekend(LocalDate data){
        DayOfWeek diaDaSemana = data.getDayOfWeek();
        return diaDaSemana == DayOfWeek.SUNDAY || diaDaSemana == DayOfWeek.SATURDAY;
    }
    
    public static boolean isSaturday(LocalDate data){
        DayOfWeek diaDaSemana = data.getDayOfWeek();
        return diaDaSemana == DayOfWeek.SATURDAY;
    }
    
    public static boolean isSunday(LocalDate data){
        DayOfWeek diaDaSemana = data.getDayOfWeek();
        return diaDaSemana == DayOfWeek.SUNDAY;
    }   
    ///
    
    
    
    
    private static final DecimalFormat CPF_FORMAT = new DecimalFormat("00000000000");
    public String getCpfFormatado(long cpf){
        final String stringNumber = CPF_FORMAT.format(cpf);
        return stringNumber.replaceAll("([0-9]{3})([0-9]{3})([0-9]{3})([0-9]{2})", "$1.$2.$3-$4");   
    }

    
  }