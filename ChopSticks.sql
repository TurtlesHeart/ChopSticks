-- --------------------------------------------------------
-- 호스트:                          127.0.0.1
-- 서버 버전:                        5.7.23-log - MySQL Community Server (GPL)
-- 서버 OS:                        Win64
-- HeidiSQL 버전:                  9.5.0.5196
-- --------------------------------------------------------

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET NAMES utf8 */;
/*!50503 SET NAMES utf8mb4 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;

-- 테이블 chopsticks.board 구조 내보내기
CREATE TABLE IF NOT EXISTS `board` (
  `code` int(11) NOT NULL AUTO_INCREMENT COMMENT '글번호',
  `id` varchar(32) NOT NULL COMMENT '아이디',
  `board_code` int(11) DEFAULT NULL COMMENT '게시판코드',
  `title` varchar(64) NOT NULL COMMENT '제목',
  `contents` varchar(50) NOT NULL COMMENT '내용',
  `ref` int(11) NOT NULL DEFAULT '0' COMMENT '조회',
  `good` int(11) NOT NULL DEFAULT '0' COMMENT '추천',
  `reg_date` datetime NOT NULL COMMENT '작성일자',
  `filename` varchar(25) DEFAULT NULL COMMENT '첨부파일',
  PRIMARY KEY (`code`),
  KEY `FK_USER_TO_board` (`id`),
  CONSTRAINT `FK_USER_TO_board` FOREIGN KEY (`id`) REFERENCES `user` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COMMENT='공지사항';

-- 테이블 데이터 chopsticks.board:~0 rows (대략적) 내보내기
/*!40000 ALTER TABLE `board` DISABLE KEYS */;
INSERT INTO `board` (`code`, `id`, `board_code`, `title`, `contents`, `ref`, `good`, `reg_date`, `filename`) VALUES
	(1, 'admin', NULL, '공지사항입니다.', '<p>ㅎ</p>', 0, 0, '2018-12-03 17:49:45', NULL);
/*!40000 ALTER TABLE `board` ENABLE KEYS */;

-- 테이블 chopsticks.daejeon 구조 내보내기
CREATE TABLE IF NOT EXISTS `daejeon` (
  `did` int(11) NOT NULL AUTO_INCREMENT COMMENT '글번호',
  `title` varchar(20) NOT NULL COMMENT '식당명',
  `daddress` varchar(20) DEFAULT NULL COMMENT '주소',
  `dtel` varchar(20) DEFAULT NULL COMMENT '전화번호',
  `filename` varchar(255) DEFAULT NULL COMMENT '이미지',
  `id` varchar(32) DEFAULT NULL COMMENT '아이디',
  `filename2` varchar(255) DEFAULT NULL COMMENT '이미지2',
  `filename3` varchar(255) DEFAULT NULL COMMENT '이미지3',
  `filename4` varchar(255) DEFAULT NULL COMMENT '이미지4',
  `dtime` varchar(50) DEFAULT NULL COMMENT '영업시간',
  `price` varchar(50) DEFAULT NULL COMMENT '가격대',
  `grade` varchar(50) DEFAULT NULL COMMENT '평점',
  PRIMARY KEY (`did`,`title`),
  KEY `FK_USER_TO_daejeon` (`id`),
  CONSTRAINT `FK_USER_TO_daejeon` FOREIGN KEY (`id`) REFERENCES `user` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8 COMMENT='대전근교맛집';

-- 테이블 데이터 chopsticks.daejeon:~2 rows (대략적) 내보내기
/*!40000 ALTER TABLE `daejeon` DISABLE KEYS */;
INSERT INTO `daejeon` (`did`, `title`, `daddress`, `dtel`, `filename`, `id`, `filename2`, `filename3`, `filename4`, `dtime`, `price`, `grade`) VALUES
	(1, '1', '1', '1', 'sushi-932686_1280.jpg', NULL, 'shish-kebab-2709499_1920.png', 'Phantom.jpg', 'nagano-3432005_1280.jpg', '1', '1', '1'),
	(2, '123', '123', '123', 'ChopSticks_ERD.png', NULL, '1.jpg', '20181130_132719.png', '1.jpg', '123', '123', '123');
/*!40000 ALTER TABLE `daejeon` ENABLE KEYS */;

-- 테이블 chopsticks.event 구조 내보내기
CREATE TABLE IF NOT EXISTS `event` (
  `code` int(11) NOT NULL AUTO_INCREMENT COMMENT '글번호',
  `id` varchar(32) DEFAULT NULL COMMENT '아이디',
  `title` varchar(50) DEFAULT NULL COMMENT '제목',
  `contents` varchar(255) DEFAULT NULL COMMENT '내용',
  `reg_date` datetime DEFAULT NULL COMMENT '작성일자',
  PRIMARY KEY (`code`),
  KEY `FK_USER_TO_event` (`id`),
  CONSTRAINT `FK_USER_TO_event` FOREIGN KEY (`id`) REFERENCES `user` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COMMENT='자유게시판';

-- 테이블 데이터 chopsticks.event:~1 rows (대략적) 내보내기
/*!40000 ALTER TABLE `event` DISABLE KEYS */;
INSERT INTO `event` (`code`, `id`, `title`, `contents`, `reg_date`) VALUES
	(1, NULL, '이벤트입니다.', '이벤트 입니다.', '2018-12-03 17:49:26');
/*!40000 ALTER TABLE `event` ENABLE KEYS */;

-- 테이블 chopsticks.reply 구조 내보내기
CREATE TABLE IF NOT EXISTS `reply` (
  `rid` int(11) NOT NULL AUTO_INCREMENT COMMENT '댓글번호',
  `id` varchar(32) DEFAULT NULL COMMENT '아이디',
  `contents` varchar(255) DEFAULT NULL COMMENT '내용',
  `filename` varchar(255) DEFAULT NULL COMMENT '파일',
  `jinwoo` varchar(20) DEFAULT NULL COMMENT '진우',
  `a` varchar(20) DEFAULT NULL COMMENT '에이',
  `did` int(11) DEFAULT NULL COMMENT '글번호',
  `title` varchar(20) DEFAULT NULL COMMENT '식당명',
  `uid` int(11) DEFAULT NULL COMMENT '글번호2',
  PRIMARY KEY (`rid`),
  KEY `FK_USER_TO_reply` (`id`),
  KEY `FK_daejeon_TO_reply` (`did`,`title`),
  KEY `FK_univer_TO_reply` (`uid`,`title`),
  CONSTRAINT `FK_USER_TO_reply` FOREIGN KEY (`id`) REFERENCES `user` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `FK_daejeon_TO_reply` FOREIGN KEY (`did`, `title`) REFERENCES `daejeon` (`did`, `title`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `FK_univer_TO_reply` FOREIGN KEY (`uid`, `title`) REFERENCES `univer` (`uid`, `title`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=utf8 COMMENT='댓글';

-- 테이블 데이터 chopsticks.reply:~4 rows (대략적) 내보내기
/*!40000 ALTER TABLE `reply` DISABLE KEYS */;
INSERT INTO `reply` (`rid`, `id`, `contents`, `filename`, `jinwoo`, `a`, `did`, `title`, `uid`) VALUES
	(7, 'admin', '       		ㅎㅎ', NULL, 'daejeon', 'd', 1, '1', NULL),
	(8, 'admin', '       		123', NULL, 'univer', 'u', NULL, '한남대 - 고씨네', 2),
	(9, 'admin', '       		gg', NULL, 'daejeon', 'd', 1, '1', NULL),
	(10, 'admin', '       		gg', NULL, 'daejeon', 'd', 2, '123', NULL);
/*!40000 ALTER TABLE `reply` ENABLE KEYS */;

-- 테이블 chopsticks.today 구조 내보내기
CREATE TABLE IF NOT EXISTS `today` (
  `tid` int(11) NOT NULL AUTO_INCREMENT COMMENT '투데이아이디',
  `id` varchar(32) DEFAULT NULL COMMENT '아이디',
  `menu` varchar(32) DEFAULT NULL COMMENT '메뉴',
  `contents` varchar(100) DEFAULT NULL COMMENT '내용',
  `filename1` varchar(255) DEFAULT NULL COMMENT '이미지1',
  `filename2` varchar(255) DEFAULT NULL COMMENT '이미지2',
  `filename3` varchar(255) DEFAULT NULL COMMENT '이미지3',
  `filename4` varchar(255) DEFAULT NULL COMMENT '이미지4',
  PRIMARY KEY (`tid`),
  KEY `FK_USER_TO_today` (`id`),
  CONSTRAINT `FK_USER_TO_today` FOREIGN KEY (`id`) REFERENCES `user` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8 COMMENT='오늘의 메뉴';

-- 테이블 데이터 chopsticks.today:~0 rows (대략적) 내보내기
/*!40000 ALTER TABLE `today` DISABLE KEYS */;
/*!40000 ALTER TABLE `today` ENABLE KEYS */;

-- 테이블 chopsticks.todayreply 구조 내보내기
CREATE TABLE IF NOT EXISTS `todayreply` (
  `rid` int(11) NOT NULL AUTO_INCREMENT COMMENT '댓글번호',
  `id` varchar(32) DEFAULT NULL COMMENT '아이디',
  `tid` int(11) DEFAULT NULL COMMENT '투데이아이디',
  `contents` varchar(255) DEFAULT NULL COMMENT '내용',
  `filename` varchar(255) DEFAULT NULL COMMENT '파일',
  `uid` int(11) DEFAULT NULL COMMENT '글번호',
  `hid` int(11) DEFAULT NULL COMMENT '글번호2',
  `did` int(11) DEFAULT NULL COMMENT '글번호3',
  PRIMARY KEY (`rid`),
  KEY `FK_USER_TO_todayreply` (`id`),
  KEY `FK_today_TO_todayreply` (`tid`),
  CONSTRAINT `FK_USER_TO_todayreply` FOREIGN KEY (`id`) REFERENCES `user` (`id`),
  CONSTRAINT `FK_today_TO_todayreply` FOREIGN KEY (`tid`) REFERENCES `today` (`tid`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8 COMMENT='투데이댓글';

-- 테이블 데이터 chopsticks.todayreply:~2 rows (대략적) 내보내기
/*!40000 ALTER TABLE `todayreply` DISABLE KEYS */;
INSERT INTO `todayreply` (`rid`, `id`, `tid`, `contents`, `filename`, `uid`, `hid`, `did`) VALUES
	(2, 'admin', NULL, '       		ㅎㅎ', NULL, NULL, NULL, NULL),
	(3, 'user', NULL, '       		gg', NULL, NULL, NULL, NULL);
/*!40000 ALTER TABLE `todayreply` ENABLE KEYS */;

-- 테이블 chopsticks.univer 구조 내보내기
CREATE TABLE IF NOT EXISTS `univer` (
  `uid` int(11) NOT NULL AUTO_INCREMENT COMMENT '글번호',
  `title` varchar(20) NOT NULL COMMENT '식당명',
  `uaddress` varchar(20) DEFAULT NULL COMMENT '주소',
  `utel` varchar(50) DEFAULT NULL COMMENT '전화번호',
  `filename` varchar(255) DEFAULT NULL COMMENT '이미지1',
  `filename2` varchar(255) DEFAULT NULL COMMENT '이미지2',
  `filename3` varchar(255) DEFAULT NULL COMMENT '이미지3',
  `filename4` varchar(255) DEFAULT NULL COMMENT '이미지4',
  `id` varchar(32) DEFAULT NULL COMMENT '아이디',
  `utime` varchar(50) DEFAULT NULL COMMENT '영업시간',
  `price` varchar(50) DEFAULT NULL COMMENT '가격대',
  `grade` varchar(50) DEFAULT NULL COMMENT '평점',
  PRIMARY KEY (`uid`,`title`),
  KEY `FK_USER_TO_univer` (`id`),
  CONSTRAINT `FK_USER_TO_univer` FOREIGN KEY (`id`) REFERENCES `user` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8 COMMENT='대학가맛집';

-- 테이블 데이터 chopsticks.univer:~2 rows (대략적) 내보내기
/*!40000 ALTER TABLE `univer` DISABLE KEYS */;
INSERT INTO `univer` (`uid`, `title`, `uaddress`, `utel`, `filename`, `filename2`, `filename3`, `filename4`, `id`, `utime`, `price`, `grade`) VALUES
	(2, '한남대 - 고씨네', '대전 대덕구 한남로', '042-111-2222', 'sushi-932686_1280.jpg', 'shish-kebab-2709499_1920.jpg', 'nagano-3432005_1280.jpg', 'Phantom.jpg', NULL, '24시간 영업', '인당 7천원', '4.2'),
	(4, '한남대 - 박씨네', '박씨네집', '042-1122-0777', '오늘의 추천_2.jpg', '오늘의 추천_1.jpg', '오늘의 추천_3.jpg', '오늘의 추천_4.jpg', NULL, '24시간 영업', '인당 1만원', '4.2');
/*!40000 ALTER TABLE `univer` ENABLE KEYS */;

-- 테이블 chopsticks.user 구조 내보내기
CREATE TABLE IF NOT EXISTS `user` (
  `id` varchar(32) NOT NULL COMMENT '아이디',
  `password` varchar(64) DEFAULT NULL COMMENT '패스워드',
  `password2` varchar(64) DEFAULT NULL COMMENT '패스워드확인',
  `name` varchar(64) DEFAULT NULL COMMENT '이름',
  `birth` varchar(64) DEFAULT NULL COMMENT '생년월일',
  `phone` int(11) DEFAULT NULL COMMENT '전화번호',
  `email` varchar(64) DEFAULT NULL COMMENT '이메일',
  `filename` varchar(255) DEFAULT NULL COMMENT '파일',
  `alias` varchar(55) DEFAULT NULL COMMENT '닉네임',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='회원';

-- 테이블 데이터 chopsticks.user:~9 rows (대략적) 내보내기
/*!40000 ALTER TABLE `user` DISABLE KEYS */;
INSERT INTO `user` (`id`, `password`, `password2`, `name`, `birth`, `phone`, `email`, `filename`, `alias`) VALUES
	('admin', '123', '123', NULL, NULL, 123, '123', 'seo2.jpg', NULL),
	('admin1', '1234', '1234', NULL, NULL, 1054560801, 'king2992@naver.com', NULL, NULL),
	('admin11', '1234', '1234', NULL, NULL, 123, '123', NULL, NULL),
	('admind', '123', '123', NULL, NULL, 123, '123', NULL, NULL),
	('dhckddud', '1234', '1234', NULL, NULL, 123, '123', NULL, NULL),
	('dhtmdals', '1234', '1234', NULL, NULL, 123, '123', NULL, NULL),
	('dltkdals', '1234', '1234', NULL, NULL, 123, '123', 'dog.png', NULL),
	('qkrtnwls', '1234', '1234', NULL, NULL, 1234, 'king2992@naver.com', 'dog.png', NULL),
	('user', '123', '123', NULL, NULL, 123, '123', 'dog.png', NULL);
/*!40000 ALTER TABLE `user` ENABLE KEYS */;

/*!40101 SET SQL_MODE=IFNULL(@OLD_SQL_MODE, '') */;
/*!40014 SET FOREIGN_KEY_CHECKS=IF(@OLD_FOREIGN_KEY_CHECKS IS NULL, 1, @OLD_FOREIGN_KEY_CHECKS) */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
