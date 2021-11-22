package com.company;
import javax.sound.midi.Soundbank;
import java.sql.SQLOutput;
import java.util.Scanner;
import java.util.Random;
public class Main<app_run> {

    public static void main(String[] args) {
        Scanner sc = new Scanner(System.in);
        /* ------------------------------------------------------------------------------------*/
        System.out.println("zadaj km pre prvy den:");
        double km1 = sc.nextInt();
        System.out.println("zadaj cielovy pocet km:");
        int km2 = sc.nextInt();

        double ciel = km2;
        int x = 0;

        while (km1 <= ciel) {
            km1 = (km1 + km1 * 0.1);
            x++;
        }
        if (ciel <= km1) {
            System.out.println("tvoj ciel bude dosiahnuty na den cislo " + x);
            System.out.println("s celkovym poctom km " + km1);
        }
        /*---------------------------------------------------------------------------------------*/
        System.out.println("------------------------------------------------------------");

        System.out.println("zadaj cislo");
        int i = sc.nextInt() - 3;
        int j = 1;
        int z = 0;
        int n = 1;
        int vys = 0;

        System.out.print(j + ",");
        System.out.print(n + ",");

        while (z <= i) {

            vys = j + n;

            System.out.print(vys + ",");

            j = n;
            n = vys;

            z++;

        }
        /*---------------------------------------------------------------------------------------*/
        System.out.println();
        System.out.println("------------------------------------------------------------");

        int applock = 0;
        int money = 100;
        while (money <= 0 || applock != 1) {
            Random rnd = new Random();
            System.out.println("Stav na ciernu alebo cervenu farbu");
            System.out.println("CIERNA-1 CERVENA-2");

            int color = sc.nextInt();
            if (color > 2 || color < 1) {
                System.out.println("Error-neplatna volba");
            } else {
                System.out.println("DOSTUPNE PROSTRIEDKY: " + money);
                System.out.println("zadajte velkost svojej stavky");
                int stavka = sc.nextInt();

                if (stavka > money) {
                    System.out.println("nie je dostatok prostriedkov");
                } else {

                    int moznost = rnd.nextInt(2);

                    if (color == moznost) {
                        System.out.println("CONGRATULATION!");
                        money = money + stavka;
                        System.out.println("Stav vaseho konta : " + money);


                    } else {
                        System.out.println("YOU LOSE!");
                        money = money - stavka;
                        System.out.println("Stav vaseho konta : " + money);
                    }
                    if (money <= 0) {

                        System.out.println("DOSLOS PENIAZOS DIVOCAKOS NEHEHE");
                        break;

                    }
                    System.out.println("pre koniec stlac 1");
                    applock = sc.nextInt();

                }
            }
        }
        /*---------------------------------------------------------------------------------------*/
        System.out.println("------------------------------------------------------------");

        boolean app_run = true;
        while (app_run) {

            System.out.println("zadaj prve cislo");
            int prvecislo = sc.nextInt();
            System.out.println("zadaj druhe cislo");
            int druhecislo = sc.nextInt();
            System.out.println("vyber operaciu 1.scitanie 2.odcitanie 3.nasobenie 4.delenie");
            int vysledok = 0;
            int operacia = sc.nextInt();
            if (operacia == 1) {
                vysledok = prvecislo + druhecislo;
            } else if (operacia == 2) {
                vysledok = prvecislo - druhecislo;
            } else if (operacia == 3) {
                vysledok = prvecislo * druhecislo;
            } else if (operacia == 4) {
                vysledok = prvecislo / druhecislo;
            } else System.out.println("neplatna operacia");
            System.out.println(vysledok);

            System.out.println("chces ukoncit program? stlac 1");
            if (sc.nextInt() == 1) {
                app_run = false;
            }

        }
        /*---------------------------------------------------------------------------------------*/
        System.out.println("------------------------------------------------------------");

        System.out.println("zadaj polomer kruhu");
        double r=sc.nextDouble();
        double pi=3.14;
        double obvod = 2*pi*r;
        double obsah = pi*r*r;
        System.out.println("obvod je: "+obvod);
        System.out.println("obsah je: "+obsah);
    }
}







