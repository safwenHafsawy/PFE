create or replace PACKAGE BODY "MANAGE_MESSAGES" AS

/*
 * 
 * ADMIN SUPPORT CONVERSATIONS 
 *.
 */

----------------------------------------------------------------------------
-- Function: Send Issue To Administration 
----------------------------------------------------------------------------
PROCEDURE send_issue_to_admin (
    p_customer_id IN NUMBER,
    p_topic IN NUMBER,
    p_content IN VARCHAR2,
    p_issue_number OUT NUMBER
) IS
BEGIN
    INSERT INTO issue_records (customer_id, topic_id, content)
        VALUES ( p_customer_id, p_topic, p_content)
        RETURNING issue_record_id INTO p_issue_number;
END send_issue_to_admin;



/*
 * 
 * CUSTOMER TO CUSTOMER CONVERSATIONS 
 *.
 */

----------------------------------------------------------------------------
-- Function: Get or Create Conversation
----------------------------------------------------------------------------

FUNCTION get_or_create_conversation(
    p_participant_1_id IN NUMBER, 
    p_participant_2_id IN NUMBER
) RETURN NUMBER IS
    l_conv_exists NUMBER := 0;
    l_new_conv_id NUMBER;
BEGIN
    SELECT COUNT(*)
    INTO l_conv_exists
    FROM conversations
    WHERE (participant_1_id = p_participant_1_id AND participant_2_id = p_participant_2_id)
       OR (participant_2_id = p_participant_1_id AND participant_1_id = p_participant_2_id);

    IF l_conv_exists = 0 THEN 
        INSERT INTO conversations (participant_1_id, participant_2_id)
        VALUES (p_participant_1_id, p_participant_2_id)
        RETURNING conversation_id INTO l_new_conv_id;
    ELSE 
        SELECT conversation_id
        INTO l_new_conv_id
        FROM conversations
        WHERE (participant_1_id = p_participant_1_id AND participant_2_id = p_participant_2_id)
           OR (participant_2_id = p_participant_1_id AND participant_1_id = p_participant_2_id);
    END IF;

    RETURN l_new_conv_id;
END get_or_create_conversation;

----------------------------------------------------------------------------
-- Procedure: Send New Message
----------------------------------------------------------------------------

PROCEDURE send_message (
    p_participant_1_id IN NUMBER, -- used to check for conversation existence
    p_participant_2_id IN NUMBER, -- used to check for conversation existence
    p_sender_id IN NUMBER,
    p_message IN VARCHAR2, 
    p_current_date OUT TIMESTAMP, 
    p_sender_name OUT VARCHAR2
) IS
    l_conv_id NUMBER;
BEGIN
    l_conv_id := get_or_create_conversation(p_participant_1_id, p_participant_2_id);

    INSERT INTO messages (conversation_id, message_content, message_sender_id, sent_at, status)
        VALUES (
            l_conv_id,
            p_message,
            p_sender_id,
            (SELECT SYSTIMESTAMP FROM DUAL),
            'Unread'
        )
        RETURNING
            (SELECT SYSTIMESTAMP FROM DUAL),
            (SELECT firstname || '  ' || lastname FROM customer WHERE customer_id = p_sender_id)
        INTO p_current_date, p_sender_name;
END send_message;


END "MANAGE_MESSAGES";
/