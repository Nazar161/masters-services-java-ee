Вариант моделей предметной области №8
<Details><Summary>сведения</Summary>

<img width="802" alt="image" src="https://user-images.githubusercontent.com/49819458/236662344-ed04312d-95d5-453b-814a-d5fce1b4438e.png">

</Details>

---
Лабораторная №9 (dev1)
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
Лабораторная №10 (dev2)
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
Лабораторная №11 (dev3)
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
Лабораторная №12 (dev4)
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
Лабораторная №13 (dev5)
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

---
Лабораторная №14 (dev6)
---

Ссылка на ветку — https://github.com/Nazar161/masters-services-java-ee/tree/dev6

Редактирование и удаление записей в базе данных
В проект был добавен Bootstrap для стилизации элементов на странице
<Details><Summary>Измененные страницы мастеров и сервисов(добавились кнопки редактирования и удаления записей)</Summary>

<img width="1437" alt="image" src="https://github.com/Nazar161/masters-services-java-ee/assets/49819458/38506542-80e1-4cd1-a8b8-2a479bd6e1bb">

<img width="1438" alt="image" src="https://github.com/Nazar161/masters-services-java-ee/assets/49819458/f6643e7c-828e-44d3-984c-26749bd5656e">

</Details>

<Details><Summary>Страница редактирования мастера</Summary>

<img width="1438" alt="image" src="https://github.com/Nazar161/masters-services-java-ee/assets/49819458/e1ac56f4-6381-4c58-b38e-ed1cb3320829">

Для примера отредактируем номер телефона последнего мастера с кодом 10 на 89895555555

состояние БД до редактирования:
<img width="594" alt="image" src="https://github.com/Nazar161/masters-services-java-ee/assets/49819458/24c2fc8d-7ef1-4b20-bc5f-9a8e2258241e">

состояние БД после редактирования:
<img width="621" alt="image" src="https://github.com/Nazar161/masters-services-java-ee/assets/49819458/d5508a16-fd5c-4ffb-96fb-8973091f747c">

<img width="1437" alt="image" src="https://github.com/Nazar161/masters-services-java-ee/assets/49819458/39b77936-6c42-4ae2-8c91-46c134c2e81a">

</Details>

<Details><Summary>Страница удаление мастера</Summary>

<img width="1436" alt="image" src="https://github.com/Nazar161/masters-services-java-ee/assets/49819458/d5c5ceae-2dc3-44c2-af16-476445cd1024">

состояние БД до удаления записи:
<img width="630" alt="image" src="https://github.com/Nazar161/masters-services-java-ee/assets/49819458/ce45c008-e37a-4b61-b0b2-85e2a15dcbae">

состояние БД после удаления записи:

<img width="634" alt="image" src="https://github.com/Nazar161/masters-services-java-ee/assets/49819458/cc2af32f-0139-4987-976d-b66e7b979707">

</Details>

<Details><Summary>страница редактирования сервисов</Summary>
<img width="1431" alt="image" src="https://github.com/Nazar161/masters-services-java-ee/assets/49819458/7a3fb0c5-adbf-4e63-bd12-cf6a50cf89f1">

для примера поменяем цену сервиса с кодом 9 с 2250 на 1900
состояние БД до редактирования:
<img width="441" alt="image" src="https://github.com/Nazar161/masters-services-java-ee/assets/49819458/d276c4ad-fbc6-4ae5-bbf7-790b5be98377">

состояние БД после редактирования:
<img width="450" alt="image" src="https://github.com/Nazar161/masters-services-java-ee/assets/49819458/25c719dd-4fd9-4412-b2ca-d1c28348af0c">

<img width="997" alt="image" src="https://github.com/Nazar161/masters-services-java-ee/assets/49819458/6552c139-4a50-4552-a2b5-d6f8ce594503">

</Details>

<Details><Summary>Страница удаления сервиса</Summary>

<img width="1420" alt="image" src="https://github.com/Nazar161/masters-services-java-ee/assets/49819458/960db299-6e60-422a-a749-964772e28572">
Удалим  последнюю тестовую услугу с кодом 10 

состояние БД до удаления записи:
<img width="447" alt="image" src="https://github.com/Nazar161/masters-services-java-ee/assets/49819458/f8d25690-5895-4e88-875f-f43c28a9ada9">

состояние БД после удаления записи:
<img width="449" alt="image" src="https://github.com/Nazar161/masters-services-java-ee/assets/49819458/ebd0b817-8e6f-4700-a872-c5a542ea1145">

<img width="1016" alt="image" src="https://github.com/Nazar161/masters-services-java-ee/assets/49819458/ef3ca812-1336-413e-8a79-1e2d183fb114">

</Details>
