package controller;

import dao.ConnectionProperty;
import dao.EmpConnBuilder;
import domain.Master;
import domain.Service;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import java.io.FileNotFoundException;
import java.io.IOException;
import java.sql.*;
import java.util.ArrayList;

@WebServlet("/deleteservice")
public class DeleteServiceServlet extends HttpServlet{
    private static final long serialVersionUID = 1L;
    ConnectionProperty prop;

    String select_all_service = "SELECT id, title, price, duration, master_id FROM service ORDER BY id";
    String select_all_master = "SELECT id, full_name, post, phone FROM master";

    String select_service_ById = "SELECT id, master_id, title, price, duration FROM service WHERE id = ?";

    String delete_service = "DELETE FROM service WHERE id = ?";

    ArrayList<Master> masters = new ArrayList<>();
    ArrayList<Service> services = new ArrayList<>();
    ArrayList<Service> servicesDelete = new ArrayList<>();
    String userPath;

    public DeleteServiceServlet() throws FileNotFoundException, IOException {
        super();
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
            String strId = request.getParameter("id");
            Long idServiceSelected = null;
            if (strId != null) {
                idServiceSelected = Long.parseLong(strId);
            }

            // загрузка всех мастеров
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

            stmt = conn.createStatement();
            Long masterId;
            rs = stmt.executeQuery(select_all_service);
            if (rs != null) {
                services.clear();
                while (rs.next()) {
                    masterId = rs.getLong("master_id");
                    services.add(new Service(
                            rs.getLong("id"),
                            rs.getString("title"),
                            rs.getFloat("price"),
                            rs.getFloat("duration"),
                            masterId,
                            FindById(masterId, masters)
                    ));
                }
                rs.close();
                request.setAttribute("services", services);
            } else {
                System.out.println("Ошибка загрузки service");
            }

            try (PreparedStatement preparedStatement = conn.prepareStatement(select_service_ById)) {
                preparedStatement.setLong(1, idServiceSelected);
                rs = preparedStatement.executeQuery();
                if (rs != null) {
                    servicesDelete.clear();
                    while (rs.next()) {
                        servicesDelete.add(new Service(
                                rs.getLong("id"),
                                rs.getString("title"),
                                rs.getFloat("price"),
                                rs.getFloat("duration"),
                                rs.getLong("master_id"),
                                FindById(rs.getLong("master_id"), masters)
                        ));
                    }
                    rs.close();
                    request.setAttribute("servicesDelete", servicesDelete);
                } else {
                    System.out.println("Ошибка загрузки service");
                }
            } catch (SQLException e) {
                throw new RuntimeException(e);
            }

        } catch (SQLException e) {
            throw new RuntimeException(e);
        }

        userPath = request.getServletPath();
        if ("/deleteservice".equals(userPath)) {
            request.getRequestDispatcher("/views/delete-service.jsp").forward(request, response);
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

            try (PreparedStatement preparedStatement = conn.prepareStatement(delete_service)) {
                preparedStatement.setLong(1, id);
                int result = preparedStatement.executeUpdate();
            }catch (SQLException e) {
                throw new RuntimeException(e);
            }
        } catch (SQLException e) {
            throw new RuntimeException(e);
        }
        doGet(request, response);
    }
}
