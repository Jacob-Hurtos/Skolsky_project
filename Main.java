package com.company;


import java.util.Arrays;
import java.util.Random;
import java.util.Scanner;



public class Main {

    public static void main(String[] args) {
    Scanner sc = new Scanner(System.in);
    int pole[] = new int[10];
    for (int i = 0; i<pole.length;i++) {
        pole[i] = 10 - i;
    }
        for(int prvok : pole){
            System.out.print(prvok + ",");
        };
        System.out.println();
        System.out.println("--------------------------------------------");




    Random rnd = new Random();
    int pole2[] = new int[20];
    double priemer = 0;
    int sucet = 0;


    for (int j = 0; j<pole2.length;j++) {
        int cislo= rnd.nextInt(1,50);
        pole2[j]= cislo;
        }
    for(int prvok :pole2  ){
        System.out.print(prvok + ",");
        }
    for (int j = 0; j <pole2.length; j++) {
        sucet=sucet+pole2[j];
        }
        priemer= sucet / pole2.length;

        Arrays.sort(pole2);
        System.out.println();
        System.out.println("sucet: "+sucet);
        System.out.println("Priemer: "+priemer);
        System.out.println("max cislo je: "+pole2[19]);
        System.out.println("min cislo je: "+pole2[0]);

    }}

