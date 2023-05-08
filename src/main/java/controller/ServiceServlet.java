package controller;

import dao.ConnectionProperty;
import dao.EmpConnBuilder;
import domain.Master;
import domain.Service;
import jakarta.servlet.Servlet;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import java.io.FileNotFoundException;
import java.io.IOException;
import java.sql.*;
import java.util.ArrayList;

@WebServlet("/services")
public class ServiceServlet extends HttpServlet implements Servlet {
    private static final long serialVersionUID = 1L;

    ConnectionProperty prop;
    String select_all_service = "SELECT id, title, price, duration, master_id FROM service";
    String select_all_master = "SELECT id, full_name, post, phone FROM master";
    String insert_service = "INSERT INTO service(master_id, title, price, duration) VALUES(?, ?, ?, ?)";
    ArrayList<Master> masters = new ArrayList<>();
    ArrayList<Service> services = new ArrayList<>();

    String userPath;

    public ServiceServlet() throws FileNotFoundException, IOException {
        prop = new ConnectionProperty();
    }

    private Master FindById(Long id, ArrayList<Master> masters) {
        if (masters != null) {
            for (Master m : masters) {
                if ((m.getId()).equals(id)) {
                    return m;
                }
            }
        } else {
            return null;
        }

        return null;
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        response.setContentType("text/html");
        EmpConnBuilder builder = new EmpConnBuilder();
        try (Connection conn = builder.getConnection()) {
            // Загрузка всех мастеров
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
            } else {
                System.out.println("Ошибка загрузки master");
            }

            // Загрузка всех услуг
            long id;
            stmt = conn.createStatement();
            rs = stmt.executeQuery(select_all_service);
            if (rs != null) {
                services.clear();
                while (rs.next()) {
                    id = rs.getLong("master_id");
                    services.add(new Service(
                            rs.getLong("id"),
                            rs.getString("title"),
                            rs.getFloat("price"),
                            rs.getFloat("duration"),
                            id,
                            FindById(id, masters)
                    ));
                }
                rs.close();
                request.setAttribute("services", services);
            }
        } catch (SQLException e) {
            throw new RuntimeException(e);
        }

        userPath = request.getServletPath();
        if ("/services".equals(userPath)) {
            request.getRequestDispatcher("/views/service.jsp").forward(request, response);
        }
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        EmpConnBuilder builder = new EmpConnBuilder();
        try(Connection conn = builder.getConnection()){
            String title = request.getParameter("title");
            Float duration = Float.parseFloat(request.getParameter("duration"));
            Float price = Float.parseFloat(request.getParameter("price"));
            Long masterId = Long.parseLong(request.getParameter("master"));

            PreparedStatement preparedStatement = conn.prepareStatement(insert_service);
            preparedStatement.setLong(1, masterId);
            preparedStatement.setString(2, title);
            preparedStatement.setFloat(3, price);
            preparedStatement.setFloat(4, duration);

            int rows = preparedStatement.executeUpdate();
        } catch (SQLException e) {
            getServletContext().getRequestDispatcher("/views/service.jsp").forward(request, response);
            throw new RuntimeException(e);
        }


        doGet(request, response);
    }
}