--建表
--1.创建学籍管理（XJMS）数据库
create database XJMS
--2.创建一个学院（Collage）表
CREATE TABLE Collage
(Cono varchar(10) PRIMARY KEY,
Coname varchar(20) NOT NULL,
Coheader varchar(8) NOT NULL,
);
--3.创建一个专业（Professional）表
CREATE TABLE Professional
(Spno varchar(10) PRIMARY KEY ,
Spname varchar(20) NOT NULL,
Spheader varchar(10) NOT NULL,
Cono varchar(10) NOT NULL,
FOREIGN KEY (Cono) REFERENCES Collage(Cono)
ON UPDATE CASCADE
ON DELETE CASCADE
);
--4.创建一个学生基本信息（Student）表
CREATE TABLE Student
(Sno varchar(10)  PRIMARY KEY , 
Sname varchar(8)  NOT NULL,
Ssex varchar(4)  CHECK (Ssex IN('男','女')),
Sbirthday varchar(8) NOT NULL,
Sid varchar(18) NOT NULL,
Spno varchar(10)  NOT NULL, 
Sxz int  NOT NULL,
Cono varchar(10)  NOT NULL,
Sclass varchar(10) NOT NULL,
Sarea varchar(10) NOT NULL,
Sage int,
Szzmm varchar(10) NOT NULL,
Snation varchar(10) NOT NULL,
Sxjzt varchar(20) NOT NULL,
Remark varchar(50) ,
CHECK (Sxz BETWEEN 2 AND 5),
CHECK (Sno BETWEEN 0000000000 AND 9999999999),
FOREIGN  KEY  (Cono)  REFERENCES  Collage(Cono)
ON UPDATE CASCADE
ON DELETE CASCADE,
FOREIGN KEY (Spno) REFERENCES Professional (Spno)
);
--5.创建一个课程（Course）表
CREATE TABLE Course
(Cno varchar(10) PRIMARY KEY ,
Cname varchar(20) NOT NULL,
Credit float CHECK (Credit BETWEEN 0.5 AND 20),
);
--6.创建一个教师基本信息（Teacher）表
CREATE TABLE Teacher
(Tno varchar(10) PRIMARY KEY,
Tname varchar(8) NOT NULL,
Tsex varchar(4) CHECK (Tsex IN('男','女')),
Tage int CHECK (Tage BETWEEN 25 AND 75),
Cono varchar(10) NOT NULL,
);
--7.创建一个选课（SC）表
CREATE TABLE SC
(Sno varchar(10) NOT NULL,
Cno varchar(10) NOT NULL,
Grade int CHECK (Grade BETWEEN 0 AND 100),
CHECK (Sno BETWEEN 0000000000 AND 9999999999),
PRIMARY KEY (Sno,Cno),
FOREIGN KEY (Sno) REFERENCES  Student(Sno)
ON UPDATE CASCADE
ON DELETE CASCADE,
FOREIGN KEY (Cno) REFERENCES  Course(Cno)
ON UPDATE CASCADE
ON DELETE CASCADE
);
--8.创建一个授课（TC）表
CREATE TABLE TC
(Tno varchar(10) NOT NULL,
Cno varchar(10) NOT NULL,
Student int, CHECK (student BETWEEN 30 AND 150),
PRIMARY KEY (Tno,Cno),
FOREIGN KEY (Tno) REFERENCES  Teacher(Tno)
ON UPDATE CASCADE
ON DELETE CASCADE,
FOREIGN KEY (Cno) REFERENCES  Course(Cno)
ON UPDATE CASCADE
ON DELETE CASCADE,
);
--9.创建一个奖惩类型（JC）表
CREATE TABLE JC
(JCno varchar(10) NOT NULL,
JCname varchar(40) NOT NULL,
PRIMARY KEY (JCno)
);
--10.创建一个奖惩记录（JCS）表
CREATE TABLE JCS
(JCno varchar(10) NOT NULL,
Sno varchar(10) NOT NULL,
JCtime varchar(8) NOT NULL,
PRIMARY KEY (JCno,Sno),
FOREIGN KEY (JCno) REFERENCES JC(JCno)
ON UPDATE CASCADE
ON DELETE CASCADE,
FOREIGN KEY (Sno) REFERENCES Student(Sno)
ON UPDATE CASCADE
ON DELETE CASCADE
);
--插入数据
--1.在学院（Collage）表中插入数据
INSERT INTO Collage(Cono,Coname,Coheader)
VALUES ('03','安全科学与工程学院','刘剑')
INSERT INTO Collage(Cono,Coname,Coheader)
VALUES ('05','电气与控制工程学院','郭凤仪')
INSERT INTO Collage(Cono,Coname,Coheader)
VALUES ('06','电子与信息工程学院','孙劲光')
INSERT INTO Collage(Cono,Coname,Coheader)
VALUES ('10','工商管理学院','赵宝福')
INSERT INTO Collage(Cono,Coname,Coheader)
VALUES ('18','营销管理学院','李宝库')
INSERT INTO Collage(Cono,Coname,Coheader)
VALUES ('20','软件学院','刘万军')
INSERT INTO Collage(Cono,Coname,Coheader)
VALUES ('26','矿业技术学院','卢国斌')
--2.在专业（Professional）表中插入数据
INSERT INTO Professional(Spno,Spname,Spheader,Cono)
VALUES ('2001','软件工程','郭伟','20')
INSERT INTO Professional(Spno,Spname,Spheader,Cono)
VALUES ('2002','网络工程','陈虹','20')
INSERT INTO Professional(Spno,Spname,Spheader,Cono)
VALUES ('2003','嵌入式软件工程','崔丽群','20')
INSERT INTO Professional(Spno,Spname,Spheader,Cono)
VALUES ('0301','安全工程','张三','03')
INSERT INTO Professional(Spno,Spname,Spheader,Cono)
VALUES ('0302','安全工程矿山通风','李四','03')
INSERT INTO Professional(Spno,Spname,Spheader,Cono)
VALUES ('0501','自动化 ','王五','05')
INSERT INTO Professional(Spno,Spname,Spheader,Cono)
VALUES ('0502','智能电网信息工程','赵六','05')
INSERT INTO Professional(Spno,Spname,Spheader,Cono)
VALUES ('0503','电气工程与智能控制','钱七','05')
INSERT INTO Professional(Spno,Spname,Spheader,Cono)
VALUES ('0504','电气工程及其自动化','孙八','05')
INSERT INTO Professional(Spno,Spname,Spheader,Cono)
VALUES ('0505','测控技术与仪器','李九','05')
INSERT INTO Professional(Spno,Spname,Spheader,Cono)
VALUES ('0601','计算机科学与技术','周十','06')
INSERT INTO Professional(Spno,Spname,Spheader,Cono)
VALUES ('0602','通信工程','吴十一','06')
INSERT INTO Professional(Spno,Spname,Spheader,Cono)
VALUES ('0603','电子信息工程','郑十二','06')
INSERT INTO Professional(Spno,Spname,Spheader,Cono)
VALUES ('0604','电子科学与技术','王十三','06')
INSERT INTO Professional(Spno,Spname,Spheader,Cono)
VALUES ('1001','工程管理','张十四','10')
INSERT INTO Professional(Spno,Spname,Spheader,Cono)
VALUES ('1002','会计','赵十五','10')
INSERT INTO Professional(Spno,Spname,Spheader,Cono)
VALUES ('1003','信息管理与信息系统','钱十六','10')
INSERT INTO Professional(Spno,Spname,Spheader,Cono)
VALUES ('1801','市场营销','孙十七','18')
INSERT INTO Professional(Spno,Spname,Spheader,Cono)
VALUES ('1802','电子商务','李十八','18')
INSERT INTO Professional(Spno,Spname,Spheader,Cono)
VALUES ('2601','安全工程','张三','26')
INSERT INTO Professional(Spno,Spname,Spheader,Cono)
VALUES ('2602','自动化 ','王五','26')
INSERT INTO Professional(Spno,Spname,Spheader,Cono)
VALUES ('2603','工程管理','张十四','26')
--3.在教师基本信息（Teacher）表中插入数据
INSERT INTO Teacher(Tno,Tname,Tsex,Tage,Cono) 
VALUES ('11001','刘万军','男',55,'20')
INSERT INTO Teacher(Tno,Tname,Tsex,Tage,Cono) 
VALUES ('11002','王永贵','男',55,'20')
INSERT INTO Teacher(Tno,Tname,Tsex,Tage,Cono)  
VALUES ('11003','邱云飞','男',55,'20')
INSERT INTO Teacher(Tno,Tname,Tsex,Tage,Cono)  
VALUES ('11004','张海涛','男',55,'20')
INSERT INTO Teacher(Tno,Tname,Tsex,Tage,Cono)  
VALUES ('11005','陈虹','女',55,'20')
INSERT INTO Teacher(Tno,Tname,Tsex,Tage,Cono)  
VALUES ('11006','崔丽群','女',55,'20')
INSERT INTO Teacher(Tno,Tname,Tsex,Tage,Cono)   
VALUES ('11007','郭伟','女',55,'20')
INSERT INTO Teacher(Tno,Tname,Tsex,Tage,Cono)  
VALUES ('11008','肖振久','男',55,'20')
INSERT INTO Teacher(Tno,Tname,Tsex,Tage,Cono)  
VALUES ('11009','齐向明','男',55,'20')
INSERT INTO Teacher(Tno,Tname,Tsex,Tage,Cono)   
VALUES ('11010','任自然','男',55,'20')
INSERT INTO Teacher(Tno,Tname,Tsex,Tage,Cono)  
VALUES ('11011','王光','男',55,'20')
INSERT INTO Teacher(Tno,Tname,Tsex,Tage,Cono)  
VALUES ('11012','肖成龙','男',30,'20')
INSERT INTO Teacher(Tno,Tname,Tsex,Tage,Cono)  
VALUES ('11013','常戬','男',55,'20')
INSERT INTO Teacher(Tno,Tname,Tsex,Tage,Cono)  
VALUES ('11014','郭羽含','男',30,'20')
INSERT INTO Teacher(Tno,Tname,Tsex,Tage,Cono)   
VALUES ('11015','郭鹏飞','男',30,'20')
INSERT INTO Teacher(Tno,Tname,Tsex,Tage,Cono)   
VALUES ('11016','曲海成','男',30,'20')
INSERT INTO Teacher(Tno,Tname,Tsex,Tage,Cono)  
VALUES ('11017','曲长波','男',50,'20')
INSERT INTO Teacher(Tno,Tname,Tsex,Tage,Cono)  
VALUES ('11018','胡志红','女',50,'20')
INSERT INTO Teacher(Tno,Tname,Tsex,Tage,Cono) 
VALUES ('11019','冯永安', '男',30, '20')
INSERT INTO Teacher(Tno,Tname,Tsex,Tage,Cono) 
VALUES ('11020','刘佳旭', '男',30, '20')
INSERT INTO Teacher(Tno,Tname,Tsex,Tage,Cono) 
VALUES ('11021','靳小川', '男',30, '20')
INSERT INTO Teacher(Tno,Tname,Tsex,Tage,Cono) 
VALUES ('11022','刘亮', '男',30, '20')
INSERT INTO Teacher(Tno,Tname,Tsex,Tage,Cono) 
VALUES ('11023','孙宁', '女',30, '20')
INSERT INTO Teacher(Tno,Tname,Tsex,Tage,Cono) 
VALUES ('11024','刘腊梅', '女',30, '20')
INSERT INTO Teacher(Tno,Tname,Tsex,Tage,Cono) 
VALUES ('11025','武丹凤', '女',30, '20')
INSERT INTO Teacher(Tno,Tname,Tsex,Tage,Cono) 
VALUES ('11026','赵雪', '女',30, '20')
INSERT INTO Teacher(Tno,Tname,Tsex,Tage,Cono) 
VALUES ('11027','刘玲玲', '女',30, '20')
INSERT INTO Teacher(Tno,Tname,Tsex,Tage,Cono) 
VALUES ('11028','刘金光', '女',30, '20')
INSERT INTO Teacher(Tno,Tname,Tsex,Tage,Cono) 
VALUES ('11029','徐珊珊', '女',30, '20')
INSERT INTO Teacher(Tno,Tname,Tsex,Tage,Cono) 
VALUES ('11030','徐娇月', '女',30, '20')
INSERT INTO Teacher(Tno,Tname,Tsex,Tage,Cono) 
VALUES ('11031','李婕娜', '女',30, '20')
INSERT INTO Teacher(Tno,Tname,Tsex,Tage,Cono) 
VALUES ('11032','于美娜', '女',30, '20')
INSERT INTO Teacher(Tno,Tname,Tsex,Tage,Cono) 
VALUES ('11033','白雪', '女',30, '20')
INSERT INTO Teacher(Tno,Tname,Tsex,Tage,Cono) 
VALUES ('11034','姜彦吉', '男',30, '20')
INSERT INTO Teacher(Tno,Tname,Tsex,Tage,Cono) 
VALUES ('11035','唐晓亮', '男',30, '20')
INSERT INTO Teacher(Tno,Tname,Tsex,Tage,Cono) 
VALUES ('11036','刘宪国', '男',30, '20')
INSERT INTO Teacher(Tno,Tname,Tsex,Tage,Cono) 
VALUES ('11037','杨帆', '女',30, '20')
INSERT INTO Teacher(Tno,Tname,Tsex,Tage,Cono) 
VALUES ('11038','刘丽', '女',30, '20')
INSERT INTO Teacher(Tno,Tname,Tsex,Tage,Cono) 
VALUES ('11039','姜文涛', '女',30, '20')
INSERT INTO Teacher(Tno,Tname,Tsex,Tage,Cono) 
VALUES ('11040','王珊珊', '女',30, '20')
INSERT INTO Teacher(Tno,Tname,Tsex,Tage,Cono) 
VALUES ('11041','罗静静', '女',30, '20')
INSERT INTO Teacher(Tno,Tname,Tsex,Tage,Cono) 
VALUES ('11042','张辉', '男',30, '20')
INSERT INTO Teacher(Tno,Tname,Tsex,Tage,Cono) 
VALUES ('11043','张晶', '男',30, '20')
INSERT INTO Teacher(Tno,Tname,Tsex,Tage,Cono) 
VALUES ('11044','吕欢欢', '女',30, '20')
INSERT INTO Teacher(Tno,Tname,Tsex,Tage,Cono) 
VALUES ('11045','张三', '男',30, '03')
INSERT INTO Teacher(Tno,Tname,Tsex,Tage,Cono) 
VALUES ('11046','李四', '男',30, '03')
INSERT INTO Teacher(Tno,Tname,Tsex,Tage,Cono) 
VALUES ('11047','王五', '男',30, '03')
INSERT INTO Teacher(Tno,Tname,Tsex,Tage,Cono) 
VALUES ('11048','赵六', '女',30, '03')
INSERT INTO Teacher(Tno,Tname,Tsex,Tage,Cono) 
VALUES ('11049','钱七', '女',30, '03')
INSERT INTO Teacher(Tno,Tname,Tsex,Tage,Cono) 
VALUES ('11050','张三', '男',30, '05')
INSERT INTO Teacher(Tno,Tname,Tsex,Tage,Cono) 
VALUES ('11051','李四', '男',30, '05')
INSERT INTO Teacher(Tno,Tname,Tsex,Tage,Cono) 
VALUES ('11052','王五', '男',30, '05')
INSERT INTO Teacher(Tno,Tname,Tsex,Tage,Cono) 
VALUES ('11053','赵六', '女',30, '05')
INSERT INTO Teacher(Tno,Tname,Tsex,Tage,Cono) 
VALUES ('11054','钱七', '女',30, '05')
INSERT INTO Teacher(Tno,Tname,Tsex,Tage,Cono) 
VALUES ('11055','张三', '男',30, '06')
INSERT INTO Teacher(Tno,Tname,Tsex,Tage,Cono) 
VALUES ('11056','李四', '男',30, '06')
INSERT INTO Teacher(Tno,Tname,Tsex,Tage,Cono) 
VALUES ('11057','王五', '男',30, '06')
INSERT INTO Teacher(Tno,Tname,Tsex,Tage,Cono) 
VALUES ('11058','赵六', '女',30, '06')
INSERT INTO Teacher(Tno,Tname,Tsex,Tage,Cono) 
VALUES ('11059','钱七', '女',30, '06')
INSERT INTO Teacher(Tno,Tname,Tsex,Tage,Cono) 
VALUES ('11060','张三', '男',30, '10')
INSERT INTO Teacher(Tno,Tname,Tsex,Tage,Cono) 
VALUES ('11061','李四', '男',30, '10')
INSERT INTO Teacher(Tno,Tname,Tsex,Tage,Cono) 
VALUES ('11062','王五', '男',30, '10')
INSERT INTO Teacher(Tno,Tname,Tsex,Tage,Cono) 
VALUES ('11063','赵六', '女',30, '10')
INSERT INTO Teacher(Tno,Tname,Tsex,Tage,Cono) 
VALUES ('11064','钱七', '女',30, '10')
INSERT INTO Teacher(Tno,Tname,Tsex,Tage,Cono) 
VALUES ('11065','张三', '男',30, '18')
INSERT INTO Teacher(Tno,Tname,Tsex,Tage,Cono) 
VALUES ('11066','李四', '男',30, '18')
INSERT INTO Teacher(Tno,Tname,Tsex,Tage,Cono) 
VALUES ('11067','王五', '男',30, '18')
INSERT INTO Teacher(Tno,Tname,Tsex,Tage,Cono) 
VALUES ('11068','赵六', '女',30, '18')
INSERT INTO Teacher(Tno,Tname,Tsex,Tage,Cono) 
VALUES ('11069','钱七', '女',30, '18')
INSERT INTO Teacher(Tno,Tname,Tsex,Tage,Cono) 
VALUES ('11070','张三', '男',30, '26')
INSERT INTO Teacher(Tno,Tname,Tsex,Tage,Cono) 
VALUES ('11071','李四', '男',30, '26')
INSERT INTO Teacher(Tno,Tname,Tsex,Tage,Cono) 
VALUES ('11072','王五', '男',30, '26')
INSERT INTO Teacher(Tno,Tname,Tsex,Tage,Cono) 
VALUES ('11073','赵六', '女',30, '26')
INSERT INTO Teacher(Tno,Tname,Tsex,Tage,Cono) 
VALUES ('11074','钱七', '女',30, '26')
--4.在课程（Course）表中插入数据
INSERT INTO Course(Cno,Cname,Credit) 
VALUES ('H200121064','操作系统',4.0)
INSERT INTO Course(Cno,Cname,Credit) 
VALUES ('H200126032','专业外语',2.0)
INSERT INTO Course(Cno,Cname,Credit) 
VALUES ('H200130064','面向对象分析与设计',4.0)
INSERT INTO Course(Cno,Cname,Credit) 
VALUES ('H200138064','计算机网络',4.0)
INSERT INTO Course(Cno,Cname,Credit) 
VALUES ('H200143032','嵌入式系统基础',2.0)
INSERT INTO Course(Cno,Cname,Credit) 
VALUES ('H200124048 ','软件工程',3.0)
INSERT INTO Course(Cno,Cname,Credit) 
VALUES ('H200136064 ','面向对象的程序设计',4.0)
INSERT INTO Course(Cno,Cname,Credit) 
VALUES ('H200135072 ','数据结构',4.5)
INSERT INTO Course(Cno,Cname,Credit) 
VALUES ('H200124056','数据库原理及应用',3.5)
INSERT INTO Course(Cno,Cname,Credit) 
VALUES ('H200139064',' .NET框架程序设计',4.0)
INSERT INTO Course(Cno,Cname,Credit) 
VALUES ('H200137040',' 微机原理及应用',2.5)
--5.在学生基本信息（Student）表中插入数据
INSERT  INTO Student
(Sno,Sname,Ssex,Sbirthday,Sid,Spno,Sxz,Cono,Sclass,Sarea,Sage,Szzmm,Snation,Sxjzt,Remark)
VALUES
('1620980101', '张三', '男', '19940101', '210102199401010101', '2001', '2', '20', '软升本16-1', '辽宁', '22', '共青团员', '汉', '正常', '无')
INSERT  INTO Student
(Sno,Sname,Ssex,Sbirthday,Sid,Spno,Sxz,Cono,Sclass,Sarea,Sage,Szzmm,Snation,Sxjzt,Remark)
VALUES
('1620980102', '李四', '男', '19940101', '210102199401010101', '2001', '2', '20', '软升本16-1', '辽宁', '22', '共青团员', '汉', '正常', '无')
INSERT  INTO Student
(Sno,Sname,Ssex,Sbirthday,Sid,Spno,Sxz,Cono,Sclass,Sarea,Sage,Szzmm,Snation,Sxjzt,Remark)
VALUES
('1620980103', '王五', '男', '19940101', '210102199401010101', '2001', '2', '20', '软升本16-1', '辽宁', '22', '共青团员', '汉', '退学', '无')
INSERT  INTO Student
(Sno,Sname,Ssex,Sbirthday,Sid,Spno,Sxz,Cono,Sclass,Sarea,Sage,Szzmm,Snation,Sxjzt,Remark)
VALUES
('1620980104', '赵六', '男', '19940101', '210102199401010101', '2001', '2', '20', '软升本16-1', '辽宁', '22', '共青团员', '汉', '休学', '无')
INSERT  INTO Student
(Sno,Sname,Ssex,Sbirthday,Sid,Spno,Sxz,Cono,Sclass,Sarea,Sage,Szzmm,Snation,Sxjzt,Remark)
VALUES
('1603010101', '张三', '男', '19940101', '210102199401010101', '0301', '4', '03', '安全16-1', '辽宁', '22', '共青团员', '汉', '正常', '无')
INSERT  INTO Student
(Sno,Sname,Ssex,Sbirthday,Sid,Spno,Sxz,Cono,Sclass,Sarea,Sage,Szzmm,Snation,Sxjzt,Remark)
VALUES
('1603010102', '李四', '男', '19940101', '210102199401010101', '0301', '4', '03', '安全16-1', '辽宁', '22', '共青团员', '汉', '正常', '无')
INSERT  INTO Student
(Sno,Sname,Ssex,Sbirthday,Sid,Spno,Sxz,Cono,Sclass,Sarea,Sage,Szzmm,Snation,Sxjzt,Remark)
VALUES
('1603010103', '王五', '男', '19940101', '210102199401010101', '0301', '4', '03', '安全16-1', '辽宁', '22', '共青团员', '汉', '退学', '无')
INSERT  INTO Student
(Sno,Sname,Ssex,Sbirthday,Sid,Spno,Sxz,Cono,Sclass,Sarea,Sage,Szzmm,Snation,Sxjzt,Remark)
VALUES
('1603010104', '赵六', '男', '19940101', '210102199401010101', '0301', '4', '03', '安全16-1', '辽宁', '22', '共青团员', '汉', '休学', '无')
INSERT  INTO Student
(Sno,Sname,Ssex,Sbirthday,Sid,Spno,Sxz,Cono,Sclass,Sarea,Sage,Szzmm,Snation,Sxjzt,Remark)
VALUES
('1605010101', '张三', '男', '19940101', '210102199401010101', '0501', '4', '05', '自动化16-1', '辽宁', '22', '共青团员', '汉', '正常', '无')
INSERT  INTO Student
(Sno,Sname,Ssex,Sbirthday,Sid,Spno,Sxz,Cono,Sclass,Sarea,Sage,Szzmm,Snation,Sxjzt,Remark)
VALUES
('1605010102', '李四', '男', '19940101', '210102199401010101', '0501', '4', '05', '自动化16-1', '辽宁', '22', '共青团员', '汉', '正常', '无')
INSERT  INTO Student
(Sno,Sname,Ssex,Sbirthday,Sid,Spno,Sxz,Cono,Sclass,Sarea,Sage,Szzmm,Snation,Sxjzt,Remark)
VALUES
('1605010103', '王五', '男', '19940101', '210102199401010101', '0501', '4', '05', '自动化16-1', '辽宁', '22', '共青团员', '汉', '退学', '无')
INSERT  INTO Student
(Sno,Sname,Ssex,Sbirthday,Sid,Spno,Sxz,Cono,Sclass,Sarea,Sage,Szzmm,Snation,Sxjzt,Remark)
VALUES
('1605010104', '赵六', '男', '19940101', '210102199401010101', '0501', '4', '05', '自动化16-1', '辽宁', '22', '共青团员', '汉', '休学', '无')
--6.在选课（SC）表中插入数据
INSERT INTO SC(Sno,Cno,Grade) 
VALUES ('1620980101','H200121064',70)
INSERT INTO SC(Sno,Cno,Grade) 
VALUES ('1620980102','H200121064',68)
INSERT INTO SC(Sno,Cno,Grade) 
VALUES ('1620980101','H200124048',70)
INSERT INTO SC(Sno,Cno,Grade) 
VALUES ('1620980102','H200124048',68)
INSERT INTO SC(Sno,Cno,Grade) 
VALUES ('1603010101','H200126032',70)
INSERT INTO SC(Sno,Cno,Grade) 
VALUES ('1603010102','H200126032',80)
INSERT INTO SC(Sno,Cno,Grade) 
VALUES ('1603010101','H200136064',70)
INSERT INTO SC(Sno,Cno,Grade) 
VALUES ('1603010102','H200136064',74)
INSERT INTO SC(Sno,Cno,Grade) 
VALUES ('1605010101','H200126032',70)
INSERT INTO SC(Sno,Cno,Grade) 
VALUES ('1605010102','H200126032',80)
INSERT INTO SC(Sno,Cno,Grade) 
VALUES ('1605010101','H200136064',70)
INSERT INTO SC(Sno,Cno,Grade) 
VALUES ('1605010102','H200136064',74)
--7.在授课（TC）表中插入数据
INSERT 
INTO TC(Tno,Cno,student) 
VALUES ('11001','H200121064',120)
INSERT 
INTO TC(Tno,Cno,student) 
VALUES ('11002','H200124048',120)
INSERT 
INTO TC(Tno,Cno,student) 
VALUES ('11003','H200126032',120)
INSERT 
INTO TC(Tno,Cno,student) 
VALUES ('11004','H200136064',120)
--8.在奖惩类型（JC）表中插入数据
INSERT 
INTO JC(JCno,JCname) 
VALUES('1','表扬')
INSERT 
INTO JC(JCno,JCname) 
VALUES('2','惩罚')
INSERT 
INTO JC(JCno,JCname) 
VALUES('3','颁奖')
INSERT 
INTO JC(JCno,JCname) 
VALUES('4','通告')
--9.在奖惩记录（JCS）表中插入数据
INSERT 
INTO JCS(JCno,Sno,JCtime) 
VALUES('1','1620980101','20161101')
INSERT 
INTO JCS(JCno,Sno,JCtime) 
VALUES('1','1603010101','20161101')
INSERT 
INTO JCS(JCno,Sno,JCtime) 
VALUES('1','1605010101','20161101')
INSERT 
INTO JCS(JCno,Sno,JCtime) 
VALUES('2','1620980102','20161101')
INSERT 
INTO JCS(JCno,Sno,JCtime) 
VALUES('2','1603010102','20161101')
INSERT 
INTO JCS(JCno,Sno,JCtime) 
VALUES('2','1605010102','20161101')
--测试
--1.更新学生信息
UPDATE Student
SET Sxjzt='正常'
WHERE Sno='1603010103'
--2.更新成绩信息
UPDATE SC
SET Grade='85'
WHERE Sno=' 1620980102'
AND Cno=' H200124048'
--3.更新奖惩信息
UPDATE JC
SET JCname='物质奖励'
WHERE JCno='1'
--4.查询成绩信息
SELECT Student.Sno, Sname, Course.Cno,Cname, Teacher.Tno, Tname,Grade
FROM SC,Course,Student,Teacher,TC
WHERE SC.Cno=Course.Cno AND SC.Sno=Student.Sno AND TC.Cno=SC.Cno AND TC.Tno=Teacher.Tno
--5.简历信息查询
SELECT * FROM Student
--6.学籍状态查询
SELECT Sno,Sname,Sxjzt
FROM Student
--7.奖惩信息查询
SELECT Student.Sno,Sname,JC.JCno,JCname,JCtime
FROM JC,JCS,Student
WHERE JC.JCno=JCS.JCno AND JCS.Sno=Student.Sno
--8.资料统计
select  
(select (count(Grade)*1.0/(select count(sNo)as"总人数"from SC))as "90-100分的百分率" from SC Where Grade >=90 And Grade <=100)as "90-100分的百分率",
(select (count(Grade)*1.0/(select count(sNo)as"总人数"from SC))as "80-89分的百分率" from SC Where Grade >=80 And Grade <=89)as "80-89分的百分率",
(select (count(Grade)*1.0/(select count(sNo)as"总人数"from SC))as "70-79分的百分率" from SC Where Grade >=70 And Grade <=79)as "70-79分的百分率",
(select (count(Grade)*1.0/(select count(sNo)as"总人数"from SC))as "60-69分的百分率" from SC Where Grade >=60 And Grade <=69)as "60-69分的百分率",
(select (count(Grade)*1.0/(select count(sNo)as"总人数"from SC))as "60分的以下的百分率" from SC Where Grade <60)as "60分的以下的百分率",
(select count(Sage)as"16岁的人数" from Student where Sage=16)as"16岁的人数",
(select count(Sage)as"17岁的人数" from Student where Sage=17)as"17岁的人数",
(select count(Sage)as"18岁的人数" from Student where Sage=18)as"18岁的人数",
(select count(Sage)as"19岁的人数" from Student where Sage=19)as"19岁的人数",
(select count(Sage)as"20岁的人数" from Student where Sage=20)as"20岁的人数",
(select count(Sage)as"21岁的人数" from Student where Sage=21)as"21岁的人数",
(select count(Sage)as"22岁的人数" from Student where Sage=22)as"21岁的人数",
(select count(Sarea)as"地区来自辽宁的人数" from Student where Sarea='辽宁')as"地区来自辽宁的人数",
(select count(Szzmm)as"政治面貌为共青团员的人数" from Student where Szzmm='共青团员')as"政治面貌为共青团员的人数"