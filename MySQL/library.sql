create database Library;
use Library;
create table Books(book_id int auto_increment primary key,title varchar(100) not null,author varchar(100) not null,genre varchar(100),published_year year,is_available boolean 
default true);
create table Members(member_id int auto_increment primary key,name varchar(100) not null,email varchar(100),phone_no varchar(50),join_date date);
create table Librarians(lib_id int auto_increment primary key,name varchar(100) not null,email varchar(50),phone_no varchar(50),hire_date date);
create table Borrowing(loan_id int auto_increment primary key,book_id int,member_id int,borrow_date date,return_date date,lib_id int,foreign key (book_id) references Books(book_id),foreign key(member_id) references Members(member_id),foreign key (lib_id) references Librarians(lib_id));
insert into Books(title,author,genre,published_year) values ('The Great Gatsby', 'F. Scott Fitzgerald', 'Fiction', 1925),('1984', 'George Orwell', 'Dystopian', 1949),
('To Kill a Mockingbird', 'Harper Lee', 'Classic', 1960);
insert into Members(name,email,phone_no) values ('Alen King', 'alenking@example.com', '1234567890'),
('Alece Hofman', 'alecehofman@example.com', '9876543210');
insert into Librarians(name,email,phone_no) values("A","abc@gmail.com",'4899220'),("B","bbc@gmail.com",'78832213');
insert into Borrowing(book_id,member_id,lib_id) values(1,1,1);
select * from Books where is_available=True;
select m.name,b.title,br.borrow_date,br.return_date from Borrowing br join Members m on br.member_id=m.member_id join Books b on br.book_id=b.book_id where m.member_id=1;
select * from Books where author="George Orwell";
select m.member_id,b.title,br.borrow_date,br.return_date from Borrowing br join Members m on br.member_id=m.member_id join Books b on br.book_id=b.book_id where b.title='1960';
select * from Books where genre='Fiction' and is_available=True;
select m.member_id,b.title,br.borrow_date,br.return_date from Borrowing br join Members m on br.member_id=m.member_id join Books b on br.book_id=b.book_id where br.return_date is null and br.borrow_date<current_date-interval 30 day;
select l.name,count(br.loan_id) as total from Borrowing br join Librarians l on br.lib_id=l.lib_id group by l.name order by total desc;
select m.name,b.title,br.borrow_date,br.return_date from Borrowing br join Members m on br.member_id=m.member_id join Books b on br.book_id=b.book_id where br.return_date is null;



