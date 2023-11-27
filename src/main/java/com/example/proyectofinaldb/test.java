package com.example.proyectofinaldb;

import com.example.proyectofinaldb.util.DBDao;

public class test {
    public static void main(String[] args) {
        DBDao dao = new DBDao();

        System.out.println(dao.getColumuns("articulos"));


    }
}
