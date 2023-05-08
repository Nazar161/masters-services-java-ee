Вариант моделей предметной области №8
<Details><Summary>сведения</Summary>

<img width="802" alt="image" src="https://user-images.githubusercontent.com/49819458/236662344-ed04312d-95d5-453b-814a-d5fce1b4438e.png">

</Details>

---
Лабораторная №1 (dev1)
---

Ссылка на ветку — https://github.com/Nazar161/masters-services-java-ee/tree/dev1

<Details><Summary>главная страница</Summary>

![image](https://user-images.githubusercontent.com/49819458/236663298-b9cc4107-d447-4129-aea2-2b470f979cdf.png)
Логотип перенес с прошлого Spring проекта
</Details>

<Details><Summary>страница MasterServlet</Summary>

![image](https://user-images.githubusercontent.com/49819458/236663561-af2f1951-c47b-454f-9ef8-4361d0050b8b.png)

</Details>

<Details><Summary>страница ServiceServlet</Summary>

![image](https://user-images.githubusercontent.com/49819458/236663614-b915a378-c9af-4c3d-81c7-22248d4aa525.png)

</Details>

---
Лабораторная №2 (dev2)
---

Ссылка на ветку — https://github.com/Nazar161/masters-services-java-ee/tree/dev2

Добавление домена данных
<Details><Summary>Класс сущности Master</Summary>

https://github.com/Nazar161/masters-services-java-ee/blob/a3b4a85cc19d28b619e786c43b6a32adbb533096/src/main/java/domain/Master.java#L1-L68
</Details>

<Details><Summary>Класс сущности Service</Summary>

https://github.com/Nazar161/masters-services-java-ee/blob/a3b4a85cc19d28b619e786c43b6a32adbb533096/src/main/java/domain/Service.java#L1-L101

</Details>

---
Лабораторная №3 (dev3)
---

Ссылка на ветку — https://github.com/Nazar161/masters-services-java-ee/tree/dev3

Создание представлений
<Details><Summary>Старница мастеров</Summary>

<img width="1438" alt="image" src="https://user-images.githubusercontent.com/49819458/236684079-1cc6b2bb-79b2-41ca-8b49-1c5157a670d7.png">
</Details>

<Details><Summary>Старница услуг</Summary>

<img width="1436" alt="image" src="https://user-images.githubusercontent.com/49819458/236684122-ec96247b-e65f-4ddc-88a6-845d93ca1746.png">

</Details>

---
Лабораторная №4 (dev4)
---

Ссылка на ветку — https://github.com/Nazar161/masters-services-java-ee/tree/dev4

Подключение веб приложения к базе данных
<Details><Summary>SQL скрипты для добавления таблиц и данных в PostgreSQL</Summary>

![image](https://user-images.githubusercontent.com/49819458/236699332-42f5c542-7091-4282-81d3-c6e345b8d6c9.png)
![image](https://user-images.githubusercontent.com/49819458/236699345-ac70df48-16f0-46c6-ab04-ee5246ef12bd.png)

</Details>

Теперь в [master.jsp](https://github.com/Nazar161/masters-services-java-ee/blob/dev4/src/main/webapp/views/master.jsp) и в [service.jsp](https://github.com/Nazar161/masters-services-java-ee/blob/dev4/src/main/webapp/views/service.jsp) нет моковых данных, все данные приходят из БД
<Details><Summary>сведения</Summary>

<img width="616" alt="image" src="https://user-images.githubusercontent.com/49819458/236705532-515c246e-ee7b-4541-9585-2fee2f667a66.png">

<img width="1407" alt="image" src="https://user-images.githubusercontent.com/49819458/236705587-bd412809-ca4a-4b24-abb7-fd940913a79b.png">

<img width="1401" alt="image" src="https://user-images.githubusercontent.com/49819458/236705570-927220ad-b340-418b-b9fe-193cc383bbbd.png">

</Details>

---
Лабораторная №5 (dev5)
---

Ссылка на ветку — https://github.com/Nazar161/masters-services-java-ee/tree/dev5

Создание новых записей в базе данных
<Details><Summary>Создание новой записи в таблице мастеров</Summary>

с помощью формы для добавления мастера, была создана новая запись в БД
`33 Иванов Иван Иванович Сантехник 89897651281`

<img width="1406" alt="image" src="https://user-images.githubusercontent.com/49819458/236758782-a946b6d6-8e06-4d4f-ab01-2be5032d1067.png">
</Details>

<Details><Summary>Создание новой записи в таблице услуг</Summary>

<img width="1412" alt="Снимок экрана 2023-05-08 в 09 36 43" src="https://user-images.githubusercontent.com/49819458/236759232-cee76c75-a340-4f2c-a3f9-8716ce3113ca.png">

после нажатия кнопки Добавить, в таблице появляется новая запись услуги с id 8
<img width="1406" alt="Снимок экрана 2023-05-08 в 09 37 01" src="https://user-images.githubusercontent.com/49819458/236759333-9e69e8fe-062d-4b4a-b2cc-e053a142f00f.png">

</Details>

<Details><Summary>переопределенный метод doPost в классе MasterServlet </Summary>

https://github.com/Nazar161/masters-services-java-ee/blob/f009132ec4a75f4a1ab4aaa79b693693cb301d49/src/main/java/controller/MasterServlet.java#L70-L94
</Details>

<Details><Summary>переопределенный метод doPost в классе ServiceServlet </Summary>

https://github.com/Nazar161/masters-services-java-ee/blob/f009132ec4a75f4a1ab4aaa79b693693cb301d49/src/main/java/controller/ServiceServlet.java#L103-L126
</Details>
