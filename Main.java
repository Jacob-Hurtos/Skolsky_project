package com.company;
import java.util.Arrays;
import java.util.Random;
import java.util.Scanner;

public class Main { int bin_search(int pole[], int first_index, int last_index, int cislo) {
    if (first_index >= last_index) {
        int mid = last_index + (first_index - last_index) / 2;
        if (pole[mid] == cislo)
            return mid;
        if (pole[mid] > cislo)
            return bin_search(pole, first_index, mid - 1, cislo);
        return bin_search(pole, mid + 1, first_index, cislo);
    }

    return -1;
}


    public static void main(String[] args) {

        Scanner sc = new Scanner(System.in);
        Random rnd = new Random();

        int n = rnd.nextInt(25); //nahodne velke pole do 25 prvkov
        System.out.println("pole je o velkosti:" + n);
        int pole[] = new int[n];
        for (int i = 0; i < pole.length; i++) {
            pole[i] = i + n;
        }

        Arrays.sort(pole);
        for (int prvok : pole) {
            System.out.print(prvok + ",");
        }
        System.out.println();
        System.out.println("zadaj hladany prvok");

        int cislo = sc.nextInt();

        int first_index = pole[0];
        int last_index = pole[n - 1];
        int mid = first_index + (last_index - first_index) / 2;
        System.out.println("Stred je:" + mid);

        if (cislo == mid) {
            System.out.println("prvok sa nasiel");
            System.exit(1);
        }
        else if (cislo < mid) {
            System.out.println(mid + " nie je cislo ktore hladam");
            System.out.println(mid + " je > ako " + cislo);

        }

           else if (mid < cislo) {
               System.out.println(mid + " nie je cislo ktore hladam");
            System.out.println(mid + " je < ako " + cislo);
        }

    }
}





