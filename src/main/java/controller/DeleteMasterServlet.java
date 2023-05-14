package controller;

import dao.ConnectionProperty;
import dao.EmpConnBuilder;
import domain.Master;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import java.io.FileNotFoundException;
import java.io.IOException;
import java.io.PipedReader;
import java.sql.*;
import java.util.ArrayList;

@WebServlet("/deletemaster")

public class DeleteMasterServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;
    ConnectionProperty prop;

    String select_all_master = "SELECT id, full_name, post, phone FROM master ORDER BY id";
    String select_master_ById = "SELECT id, full_name, post, phone FROM master WHERE id = ?";
    String delete_master = "DELETE FROM master WHERE id = ?";

    ArrayList<Master> masters = new ArrayList<Master>();
    ArrayList<Master> mastersDelete = new ArrayList<Master>();
    String userPath;

    public DeleteMasterServlet() throws FileNotFoundException, IOException {
        super();
        prop = new ConnectionProperty();
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        response.setContentType("text/html");
        EmpConnBuilder builder = new EmpConnBuilder();
        try (Connection conn = builder.getConnection()) {
            String strId = request.getParameter("id");
            Long id = null;
            if (strId != null) {
                id = Long.parseLong(strId);
            }
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

            try (PreparedStatement preparedStatement = conn.prepareStatement(select_master_ById)) {
                preparedStatement.setLong(1, id);
                rs = preparedStatement.executeQuery();
                if (rs != null) {
                    mastersDelete.clear();
                    while (rs.next()) {
                        mastersDelete.add(new Master(
                                rs.getLong("id"),
                                rs.getString("full_name"),
                                rs.getString("post"),
                                rs.getString("phone")));
                    }
                    rs.close();
                    request.setAttribute("mastersDelete", mastersDelete);
                } else {
                    System.out.println("Ошибка загрузки master");
                }
            } catch (SQLException e) {
                throw new RuntimeException(e);
            }
        } catch (SQLException e) {
            throw new RuntimeException(e);
        }

        userPath = request.getServletPath();
        if ("/deletemaster".equals(userPath)) {
            request.getRequestDispatcher("/views/delete-master.jsp").forward(request, response);
        }
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        EmpConnBuilder builder = new EmpConnBuilder();
        try (Connection conn = builder.getConnection()) {
            String strId = request.getParameter("id");
            Long id = null;
            if (strId != null) {
                id = Long.parseLong(strId);
            }

            try(PreparedStatement preparedStatement = conn.prepareStatement(delete_master)) {
                preparedStatement.setLong(1, id);
                int result = preparedStatement.executeUpdate();
            } catch (SQLException e) {
                throw new RuntimeException(e);
            }
        } catch (SQLException e) {
            throw new RuntimeException(e);
        }

        doGet(request, response);
    }
}
