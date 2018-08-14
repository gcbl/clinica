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
import java.util.InputMismatchException;

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

    public static String calculaIdadeAnoMesDia(Date dataNascimento) {
        Calendar calHoje = GregorianCalendar.getInstance();
        int diaHoje = calHoje.get(Calendar.DAY_OF_MONTH);
        int mesHoje = calHoje.get(Calendar.MONTH) + 1;
        int anoHoje = calHoje.get(Calendar.YEAR);
        
        // Data do nascimento
        Calendar calNiver = Calendar.getInstance();
        calNiver.setTime(dataNascimento);
        int diaAniversario = calNiver.get(Calendar.DAY_OF_MONTH);
        int mesAniversario = calNiver.get(Calendar.MONTH) + 1;
        int anoAniversario = calNiver.get(Calendar.YEAR);        
        
        int anos = (calHoje.getTimeInMillis() < calNiver.getTimeInMillis()) ? (anoHoje - anoAniversario - 1) : (anoHoje - anoAniversario);
        int meses;
        int dias;
        
        meses = mesHoje - mesAniversario;
        if (meses > 0) { //Verificando se já fez aniversário ou não
            if (diaHoje < diaAniversario) {
                meses--;
            }
        } else if (meses < 0) { //Se o mês atual for menor que o mês do aniversário
            meses = 12 + meses; //Lembrar que meses está negativo, por isso a soma;
            //Da mesma forma, vamos comparar o dia atual com o dia do aniversário, para sabermos se o mês está completo ou não:
            if (diaHoje < diaAniversario) {
                meses--;
            }
        } else {//Se o mês atual for o mês do aniversário:
            if (diaHoje<diaAniversario) {
                meses = 11;
            } 
        }
        
        dias = diaHoje - diaAniversario;
        if (dias < 0) {// Se dia hoje menor que dia do niver, somar os dias desde o mês anterior:
            if (mesHoje == 5 || mesHoje == 7 || mesHoje == 8 || mesHoje == 10 || mesHoje == 12) {
                dias = 30 - diaAniversario + diaHoje;
            } else if (mesHoje == 1 || mesHoje == 2 || mesHoje == 4 || mesHoje == 6 || mesHoje == 9 || mesHoje == 11) {
                dias = 31 - diaAniversario + diaHoje;
            } else {// Verificando se o ano é bissexto ou não: Esse else é para
                    // o mês 3, cujo anterior é fevereiro:
                if (anoHoje % 4 == 0) {
                    dias = 29 - diaAniversario + diaHoje;
                } else {
                    dias = 28 - diaAniversario + diaHoje;
                }
            }
        }
        
        return anos + " anos, " + meses + " meses e " + dias + " dias";
    }    
    
    // -------
    private static final DecimalFormat CPF_FORMAT = new DecimalFormat("00000000000");
    public static String formatarCPF(long cpf){
        final String stringNumber = CPF_FORMAT.format(cpf);
        return stringNumber.replaceAll("([0-9]{3})([0-9]{3})([0-9]{3})([0-9]{2})", "$1.$2.$3-$4");   
    }

    public static boolean isCPF(String CPF) {
        CPF = (CPF == null) ? "" : CPF; // String vazio se CPF null;
    	CPF = CPF.replace(".", "");
    	CPF = CPF.replace("-", "");
    	
    	// considera-se erro CPF's formados por uma sequencia de numeros iguais
    	    if (CPF.equals("00000000000") || CPF.equals("11111111111") ||
    	        CPF.equals("22222222222") || CPF.equals("33333333333") ||
    	        CPF.equals("44444444444") || CPF.equals("55555555555") ||
    	        CPF.equals("66666666666") || CPF.equals("77777777777") ||
    	        CPF.equals("88888888888") || CPF.equals("99999999999") ||
    	       (CPF.length() != 11))
    	       return(false);
    	 
    	    char dig10, dig11;
    	    int sm, i, r, num, peso;
    	 
    	// "try" - protege o codigo para eventuais erros de conversao de tipo (int)
    	    try {
    	// Calculo do 1o. Digito Verificador
    	      sm = 0;
    	      peso = 10;
    	      for (i=0; i<9; i++) {              
    	// converte o i-esimo caractere do CPF em um numero:
    	// por exemplo, transforma o caractere '0' no inteiro 0         
    	// (48 eh a posicao de '0' na tabela ASCII)         
    	        num = (int)(CPF.charAt(i) - 48); 
    	        sm = sm + (num * peso);
    	        peso = peso - 1;
    	      }
    	 
    	      r = 11 - (sm % 11);
    	      if ((r == 10) || (r == 11))
    	         dig10 = '0';
    	      else dig10 = (char)(r + 48); // converte no respectivo caractere numerico
    	 
    	// Calculo do 2o. Digito Verificador
    	      sm = 0;
    	      peso = 11;
    	      for(i=0; i<10; i++) {
    	        num = (int)(CPF.charAt(i) - 48);
    	        sm = sm + (num * peso);
    	        peso = peso - 1;
    	      }
    	 
    	      r = 11 - (sm % 11);
    	      if ((r == 10) || (r == 11))
    	         dig11 = '0';
    	      else dig11 = (char)(r + 48);
    	 
    	// Verifica se os digitos calculados conferem com os digitos informados.
    	      if ((dig10 == CPF.charAt(9)) && (dig11 == CPF.charAt(10)))
    	         return(true);
    	      else return(false);
    	    } catch (InputMismatchException erro) {
    	        return(false);
    	    }
    	  }

    // --------
}