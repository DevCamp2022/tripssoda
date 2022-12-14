-- combined_board 테이블 데이터 읽기

select * from combined_board;


select * from user_permission;
select * from menu;
delete from menu;
select * from menu_code;

select * from user_info;

desc combined_board;
select * from combined_board;
select * from combined_board_content;
select * from notice;
select * from promotion;
select * from faq;
select * from inquiry;

SELECT * from combined_board where menu_code = 'M003'




-- combined_board 테이블 데이터 넣기


'1', 'M001', '3', '기존 회원 로그인 방식 변경 안내', '안녕하세요, 트립소다입니다.', '0', '0', '2022-08-11 06:12:25', '0', '2022-08-11 06:12:25', '0'
'2', 'M001', '3', '트립소다 여행 커뮤니티 론칭 알림', '안녕하세요! 혼자여도 괜찮은 여행, 트립소다입니다.', '1', '0', '2022-08-11 06:12:25', '0', '2022-08-11 06:12:25', '0'
'3', 'M001', '3', '트립소다 앱 런칭 알림', '안녕하세요. 혼자여도 괜찮은 여행 트립소다입니다 :)', '1', '0', '2022-08-11 06:12:25', '0', '2022-08-11 06:12:25', '0'
'4', 'M002', '3', '[이벤트] 신규회원 가입 즉시 ₩2,000 적립금 증정!', '안녕하세요, 트립소다입니다.', '0', '0', '2022-08-11 06:12:25', '0', '2022-08-11 06:12:25', '0'
'5', 'M002', '3', '[이벤트 종료] 프랑스 동행글 작성하고 3만원 할인받자!', '안녕하세요 :) 혼자여도 괜찮은 여행 트립소다입니다.', '0', '0', '2022-08-11 06:12:25', '0', '2022-08-11 06:12:25', '0'
'6', 'M002', '3', '[이벤트] 트립소다 X 신라면세점 제휴 이벤트', '이미징', '0', '0', '2022-08-11 06:12:25', '0', '2022-08-11 06:12:25', '0'
'7', 'M003', '3', '[구매] 공동구매 방식에 대해 궁금해요.', '트립소다 공동구매 방식은 아래와 같이 작동합니다.', '4', '0', '2022-08-11 06:12:25', '0', '2022-08-11 06:12:25', '0'
'8', 'M003', '3', '[구매] 기본가격은 무엇을 뜻하나요?', '투어 운영사가 정해놓은 투어 가격을 기본가격이라 칭합니다.', '3', '0', '2022-08-11 06:12:25', '0', '2022-08-11 06:12:25', '0'
'9', 'M003', '3', '[구매] 환급되는 금액은 어떻게 산정되나요?', '환급되는 금액은 최종 예약인원에 따라 산정됩니다. 다만 투어 파트너사 별로 상이할 수 있습니다.', '1', '0', '2022-08-11 06:12:25', '0', '2022-08-11 06:12:25', '0'
'10', 'M003', '3', '[구매] 참여인원 정보가 보이지 않아요.', '참여인원 정보는 해당 날짜에 1명 이상의 고객이 구매했을 경우에만 노출됩니다.', '1', '0', '2022-08-11 23:07:38', '0', '2022-08-11 23:07:38', '0'
'11', 'M003', '3', '[예약] 예약 확정은 언제 되나요?', '투어는 미리 고지된 투어 최소 출발인원 이상의 고객이 구매 시 자동 예약 확정됩니다.', '0', '0', '2022-08-11 23:07:38', '0', '2022-08-11 23:07:38', '0'
'12', 'M003', '3', '[예약] 예약 번호는 어디에서 확인하나요?', '예약번호는 마이페이지 - 예약내역 항목에서 해당 예약 건 상단에서 확인 가능합니다.', '1', '0', '2022-08-11 23:07:38', '0', '2022-08-11 23:07:38', '0'


INSERT INTO `tripssoda`.`menu`
(`menu_id`,
 `menu_name`,
 `created_at`,
 `created_by`,
 `updated_at`,
 `updated_by`)
VALUES
    (<{menu_id: }>,
        <{menu_name: }>,
        <{created_at: CURRENT_TIMESTAMP}>,
        <{created_by: }>,
        <{updated_at: CURRENT_TIMESTAMP}>,
        <{updated_by: }>);


'M001', '공지사항', '2022-08-17 11:58:40', '41', '2022-08-17 11:58:40', '41'
'M002', '프로모션', '2022-08-17 11:58:40', '41', '2022-08-17 11:58:40', '41'
'M003', '자주묻는질문', '2022-08-17 11:58:40', '41', '2022-08-17 11:58:40', '41'
'M004', '일대일문의', '2022-08-17 11:58:40', '41', '2022-08-17 11:58:40', '41'
'M005', '파트너페이지', '2022-08-17 11:58:40', '41', '2022-08-17 11:58:40', '41'
'M006', '관리자페이지', '2022-08-17 11:58:40', '41', '2022-08-17 11:58:40', '41'









select * from user_permission;
select * from menu;
delete from menu;
select * from menu_code;

select * from user_info;

select * from ip_ban_list;
delete from ip_ban_list;

INSERT into ip_ban_list
(ip) value ('0:0:0:0:0:0:0:1');

SELECT ip
FROM ip_ban_list;

-- INSERT INTO `tripssoda`.`ip_ban_list`
-- (`ip`,
-- `bandate`)
-- VALUES
-- (<{ip: }>,
-- <{bandate: CURRENT_TIMESTAMP}>);

desc combined_board;
select * from combined_board;
select * from combined_board_content;
select * from combined_board_history;
desc combined_board_history;
select * from notice;
select * from promotion;
select * from faq;
select * from inquiry;

select * from partner;
select * from product;
select * from category_code;
-- UPDATE `-- tripssoda`.`continent_code`
-- SET
-- `continent_code` = <{continent_code: }>,
-- `continent_name` = <{continent_name: }>
-- WHERE `continent_code` = <{expr}>;

select * from accompany;
select * from menu_code;
SELECT * from combined_board where menu_code = 'M003';

SELECT count(*)
FROM accompany
WHERE user_id = 57 and created_at = current_date ();

-- -UPDATE combined_board
--         SET   status = 0
--         where  WHERE id = 30 and user_id = 3;



--  create table IPBANLIST(
--  			IP varchar(25) primary key not null,
--  			BANDATE datetime default current_timestamp);


SELECT CURRENT_USER();

select now();

select * from user_info;
select * from user_authority;
select * from menu_authority;

select * from group_authority;

INSERT INTO `tripssoda`.`group_authority`
(`group_id`,
 `group_name`,
 `created_at`,
 `created_by`,
 `updated_at`,
 `updated_by`)
VALUES
    ('U001', '일반회원', now(), 41, now(),41);

select * from menu;

select * from user_info;
