package controller;

import dao.ConnectionProperty;
import dao.EmpConnBuilder;
import domain.Master;
import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.Servlet;
import jakarta.servlet.ServletContext;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import org.eclipse.tags.shaded.org.apache.bcel.generic.ACONST_NULL;

import java.io.FileNotFoundException;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.*;
import java.util.ArrayList;

@WebServlet("/masters")
public class MasterServlet extends HttpServlet implements Servlet {
    private static final long serialVersionUID = 1L;

    ConnectionProperty prop;
    String select_all_master = "SELECT id, full_name, post, phone FROM master";
    String insert_master = "INSERT INTO master(full_name, post, phone) VALUES(?, ?, ?)";
    ArrayList<Master> masters = new ArrayList<Master>();
    String userPath;

    public MasterServlet() throws FileNotFoundException, IOException {
        prop = new ConnectionProperty();
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        response.setContentType("text/html");

        EmpConnBuilder builder = new EmpConnBuilder();

        // Загрузка всех мастеров

        try (Connection conn = builder.getConnection()) {
            Statement stmt = conn.createStatement();
            ResultSet rs = stmt.executeQuery(select_all_master);
            if (rs != null) {
                masters.clear();
                while (rs.next()) {
                    masters.add(new Master(
                            rs.getLong("id"),
                            rs.getString("full_name"),
                            rs.getString("post"),
                            rs.getString("phone")));
                }
                rs.close();
                request.setAttribute("masters", masters);
            }
        } catch (SQLException e) {
            System.out.println(e);
            throw new RuntimeException(e);
        }
        userPath = request.getServletPath();

        if ("/masters".equals(userPath)) {
            request.getRequestDispatcher("/views/master.jsp").forward(request, response);
        }
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        EmpConnBuilder builder = new EmpConnBuilder();
        try (Connection conn = builder.getConnection()) {
            String fullName = request.getParameter("fullName");
            String post = request.getParameter("post");
            String phone = request.getParameter("phone");
            Master newMaster = new Master(fullName, post, phone);

            try (PreparedStatement preparedStatement = conn.prepareStatement(insert_master)) {
                preparedStatement.setString(1, newMaster.getFullName());
                preparedStatement.setString(2, newMaster.getPost());
                preparedStatement.setString(3, newMaster.getPhone());

                int result = preparedStatement.executeUpdate();
            } catch (Exception e) {
                System.out.println(e);
            }
        } catch (SQLException e) {
            getServletContext().getRequestDispatcher("/views/master.jsp").forward(request, response);
            throw new RuntimeException(e);
        }

        doGet(request, response);
    }
}