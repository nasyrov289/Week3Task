package com.nasyrov;

import org.hibernate.Session;

public class TestClass {
    public static void main(String[] args) {
        Session session = HibernateUtil.getSessionFactory().openSession();

        session.beginTransaction();

        Admin admin = new Admin();
        admin.setUserID(5);
        session.delete(admin);
        session.getTransaction().commit();
    }
}
