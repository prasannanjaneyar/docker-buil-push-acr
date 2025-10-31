package com.example;

public class App {
    public static void main(String[] args) throws Exception {
        System.out.println("✅ Java Kubernetes app started!");

        while (true) {
            Thread.sleep(5000);
            System.out.println("💓 still alive inside AKS...");
        }
    }
}
