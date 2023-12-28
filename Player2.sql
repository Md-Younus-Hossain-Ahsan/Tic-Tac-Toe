CLEAR SCREEN;
SET SERVEROUTPUT ON;
SET VERIFY OFF;

BEGIN
	DBMS_OUTPUT.PUT_LINE('--| 1 ' || '| 2 ' || '| 3 |');
	DBMS_OUTPUT.PUT_LINE('  ---------------');
	
	FOR R IN (SELECT * FROM PLAY_BOARD) LOOP
		DBMS_OUTPUT.PUT_LINE(R.ROW_LEBEL || ' | ' || R.POS1 || ' | ' || R.POS2 || ' | ' || R.POS3 || ' |');
		DBMS_OUTPUT.PUT_LINE('---------------');	
	END LOOP;
END;
/

ACCEPT X NUMBER PROMPT "ROW : ";
ACCEPT Y NUMBER PROMPT "COLUMN : ";

BEGIN
	FOR R IN (SELECT * FROM PLAY_BOARD) LOOP
		IF (&X = R.ROW_LEBEL) THEN
			IF (&Y = 1) THEN
				UPDATE PLAY_BOARD SET POS1 = '#' WHERE ROW_LEBEL = &X AND POS1 != '*';
			ELSIF (&Y = 2) THEN
				UPDATE PLAY_BOARD SET POS2 = '#' WHERE ROW_LEBEL = &X AND POS2 != '*';
			ELSIF (&Y = 3) THEN
				UPDATE PLAY_BOARD SET POS3 = '#' WHERE ROW_LEBEL = &X AND POS3 != '*';
			END IF;
		END IF;
	END LOOP;
	
	
	DBMS_OUTPUT.PUT_LINE('--| 1 ' || '| 2 ' || '| 3 |');
	DBMS_OUTPUT.PUT_LINE('  ---------------');
	
	FOR R IN (SELECT * FROM PLAY_BOARD) LOOP
		DBMS_OUTPUT.PUT_LINE(R.ROW_LEBEL || ' | ' || R.POS1 || ' | ' || R.POS2 || ' | ' || R.POS3 || ' |');
		DBMS_OUTPUT.PUT_LINE('---------------');	
	END LOOP;
	
END;
/

DECLARE
	DRAW NUMBER;
	INPUT1 VARCHAR2(10);
	INPUT2 VARCHAR2(10);
	INPUT3 VARCHAR2(10);
BEGIN 
	DRAW := 1;
	FOR R IN (SELECT * FROM PLAY_BOARD WHERE ROW_LEBEL = 1) LOOP
		INPUT1 := R.POS1;
	END LOOP;
	
	FOR R IN (SELECT * FROM PLAY_BOARD WHERE ROW_LEBEL = 2) LOOP
		INPUT2 := R.POS2;
	END LOOP;
	
	FOR R IN (SELECT * FROM PLAY_BOARD WHERE ROW_LEBEL = 3) LOOP
		INPUT3 := R.POS3;
	END LOOP;
	
	IF (INPUT1 = '#' AND INPUT1 = INPUT2 AND INPUT2 = INPUT3) THEN
		DBMS_OUTPUT.PUT_LINE('-# WIN-');	
		UPDATE PLAY_BOARD SET POS1 = ' ', POS2 = ' ', POS3 = ' ';	
	END IF;
	
	
	FOR R IN (SELECT * FROM PLAY_BOARD WHERE ROW_LEBEL = 1) LOOP
		INPUT1 := R.POS3;
	END LOOP;
	
	FOR R IN (SELECT * FROM PLAY_BOARD WHERE ROW_LEBEL = 2) LOOP
		INPUT2 := R.POS2;
	END LOOP;
	
	FOR R IN (SELECT * FROM PLAY_BOARD WHERE ROW_LEBEL = 3) LOOP
		INPUT3 := R.POS1;
	END LOOP;
	
	IF (INPUT1 = '#' AND INPUT1 = INPUT2 AND INPUT2 = INPUT3) THEN
		DBMS_OUTPUT.PUT_LINE('-# WIN-');
		UPDATE PLAY_BOARD SET POS1 = ' ', POS2 = ' ', POS3 = ' ';	
	END IF;
	
	
	FOR R IN (SELECT * FROM PLAY_BOARD WHERE ROW_LEBEL = 1) LOOP
		IF (R.POS1 = '#' AND R.POS1 = R.POS2 AND R.POS2 = R.POS3) THEN
			DBMS_OUTPUT.PUT_LINE('-# WIN-');
			UPDATE PLAY_BOARD SET POS1 = ' ', POS2 = ' ', POS3 = ' ';		
		END IF;
	END LOOP;
	
	
	FOR R IN (SELECT * FROM PLAY_BOARD WHERE ROW_LEBEL = 1) LOOP
		INPUT1 := R.POS1;
	END LOOP;
	
	FOR R IN (SELECT * FROM PLAY_BOARD WHERE ROW_LEBEL = 2) LOOP
		INPUT2 := R.POS1;
	END LOOP;
	
	FOR R IN (SELECT * FROM PLAY_BOARD WHERE ROW_LEBEL = 3) LOOP
		INPUT3 := R.POS1;
	END LOOP;
	
	IF (INPUT1 = '#' AND INPUT1 = INPUT2 AND INPUT2 = INPUT3) THEN
		DBMS_OUTPUT.PUT_LINE('-# WIN-');
		UPDATE PLAY_BOARD SET POS1 = ' ', POS2 = ' ', POS3 = ' ';	
	END IF;
	
	
	FOR R IN (SELECT * FROM PLAY_BOARD WHERE ROW_LEBEL = 1) LOOP
		INPUT1 := R.POS2;
	END LOOP;
	
	FOR R IN (SELECT * FROM PLAY_BOARD WHERE ROW_LEBEL = 2) LOOP
		INPUT2 := R.POS2;
	END LOOP;
	
	FOR R IN (SELECT * FROM PLAY_BOARD WHERE ROW_LEBEL = 3) LOOP
		INPUT3 := R.POS2;
	END LOOP;
	
	IF (INPUT1 = '#' AND INPUT1 = INPUT2 AND INPUT2 = INPUT3) THEN
		DBMS_OUTPUT.PUT_LINE('-# WIN-');	
		UPDATE PLAY_BOARD SET POS1 = ' ', POS2 = ' ', POS3 = ' ';	
	END IF;
	
	
	FOR R IN (SELECT * FROM PLAY_BOARD WHERE ROW_LEBEL = 1) LOOP
		INPUT1 := R.POS3;
	END LOOP;
	
	FOR R IN (SELECT * FROM PLAY_BOARD WHERE ROW_LEBEL = 2) LOOP
		INPUT2 := R.POS3;
	END LOOP;
	
	FOR R IN (SELECT * FROM PLAY_BOARD WHERE ROW_LEBEL = 3) LOOP
		INPUT3 := R.POS3;
	END LOOP;
	
	IF (INPUT1 = '#' AND INPUT1 = INPUT2 AND INPUT2 = INPUT3) THEN
		DBMS_OUTPUT.PUT_LINE('-# WIN-');
		UPDATE PLAY_BOARD SET POS1 = ' ', POS2 = ' ', POS3 = ' ';			
	END IF;
	
	FOR R IN (SELECT * FROM PLAY_BOARD) LOOP
		IF (R.POS1 = ' ' OR R.POS2 = ' ' OR R.POS3 = ' ') THEN
			DRAW := 0;
		END IF;
	END LOOP;
	
	IF (DRAW = 1) THEN
		DBMS_OUTPUT.PUT_LINE('-DRAW-');
	END IF;
	
END;
/

commit;