INSERT INTO APPROVAL_STATE
(
    NO,
    STATE_NAME
)
VALUES
(
    1,
    '����'
);

INSERT INTO APPROVAL_STATE
(
    NO,
    STATE_NAME
)
VALUES
(
    2,
    '�ݷ�'
);



INSERT INTO APPROVAL_CATEGORY
(
    "NO",
    "CATEGORY",
    "FORM"
)
VALUES
(
    1,
    'ǰ�Ǽ�',
    '<div class="document-form">
        <div class="document-title">
            ǰ �� ��
        </div>
        <div class="approval-line">
            <table class="approval-line-table">
                <tr class="table-header-rank">
                    <th class="vertical-cell" rowspan="4">�����</th>
                    <th class="table-rank sender-rank"></th>
                    <th class="vertical-cell" rowspan="4">������</th>
                </tr>
                <tr class="table-body-name">
                    <td class="table-name sender-name">
                    </td>
                    <input class="sender-no" name="SenderNo" type="text">
                </tr>
                <tr class="approval-result">
                    <td class="table-approval"></td>
                </tr>
                <tr class="table-date-area">
                    <td class="table-date"></td>
                </tr>
            </table>
        </div>
        <div class="info-inst">
            <div class="approval-info">
                <table class="info-table">
                    <tr>
                        <th class="info-header">�����</th>
                        <td class="info-text drafter-name"></td>
                    </tr>
                    <tr>
                        <th class="info-header">�Ҽ�</th>
                        <td class="info-text drafter-depart"></td>
                    </tr>
                    <tr>
                        <th class="info-header">�����</th>
                        <td class="info-text draft-date">
                        </td>
                    </tr>
                    <tr>
                        <th class="info-header">������ȣ</th>
                        <td class="info-text document-no"></td>
                    </tr>
                </table>
            </div>
            <div class="approval-inst">
                <table>
                    <tr>
                        <th class="inst-header">������ ���û���</th>
                    </tr>
                    <tr>
                        <td class="inst-text">
                            <input name="instruction" class="instruction" type="text">
                        </td>
                    </tr>
                </table>
            </div>
        </div>
        <div class="main-text-area">
            <table class="main-text-table">
                <tr>
                    <td class="table-title">����</td>
                    <td class="title-input-cell">
                        <input class="title-input" type="text" name="title">
                    </td>
                </tr>
                <tr>
                    <td class="table-main-area" colspan="2">
                        <div class="main-form1">�Ʒ��� ���� �����Ͽ��� ���� �� �簡 �ٶ��ϴ�.</div>
                        <div class="main-form2">-�� ��-</div>
                        <textarea name="content" id="approval-main-text"></textarea>
                    </td>
                </tr>
            </table>
        </div>
    </div>'
);

INSERT INTO APPROVAL_CATEGORY
(
    "NO",
    "CATEGORY",
    "FORM"
)
VALUES
(
    2,
    '�ް���û��',
    '<div class="document-form">
        <div class="document-title">
            �� �� �� û ��
        </div>
        <div class="approval-line">
            <table class="approval-line-table">
                <tr class="table-header-rank">
                    <th class="vertical-cell" rowspan="4">�����</th>
                    <th class="table-rank sender-rank"></th>
                    <th class="vertical-cell" rowspan="4">������</th>
                </tr>
                <tr class="table-body-name">
                    <td class="table-name sender-name">
                    </td>
                    <input class="sender-no" name="SenderNo" type="text">
                </tr>
                <tr class="approval-result">
                    <td class="table-approval"></td>
                </tr>
                <tr class="table-date-area">
                    <td class="table-date"></td>
                </tr>
            </table>
        </div>
        <div class="info-inst">
            <div class="approval-info">
                <table class="info-table">
                    <tr>
                        <th class="info-header">�����</th>
                        <td class="info-text drafter-name"></td>
                    </tr>
                    <tr>
                        <th class="info-header">�Ҽ�</th>
                        <td class="info-text drafter-depart"></td>
                    </tr>
                    <tr>
                        <th class="info-header">�����</th>
                        <td class="info-text draft-date">
                    </tr>
                    <tr>
                        <th class="info-header">������ȣ</th>
                        <td class="info-text document-no"></td>
                    </tr>
                </table>
            </div>
            <div class="leave-info">
                <table class="leave-info-table">
                    <tr class="leave-table-row">
                        <th class="leave-table-header">�ް� ������</th>
                        <td class="leave-table-body">
                            <input type="date" name="startDate">
                        </td>
                    </tr>
                    <tr>
                        <th class="leave-table-header">�ް� ������</th>
                        <td class="leave-table-body">
                            <input type="date" name="endDate">
                        </td>
                    </tr>
                    <tr>
                        <th class="leave-table-header">�ް� �ϼ�</th>
                        <td class="leave-table-body">
                            <input type="text" class="date">
                        </td>
                    </tr>
                    <tr>
                        <th class="leave-table-header">�ް� ����</th>
                        <td class="leave-table-body leave-category">
                        </td>
                    </tr>
                </table>
            </div>
        </div>
        <div class="main-text-area">
            <table class="main-text-table">
                <tr>
                    <td class="table-title">
                        �ް� ����
                        <input type="text" name="title" class="invisible-input" value="�ް� ��û��">
                    </td>
                </tr>
                <tr>
                    <td class="table-main-area" colspan="2">
                        <textarea name="reason" class="leave-reason" ></textarea>
                        <div class="main-form1">���� ���� �ް��� ��û�Ͽ��� ����Ͽ� �ֽñ� �ٶ��ϴ�.</div>
                    </td>
                </tr>
            </table>
        </div>
    </div>'
);

INSERT INTO APPROVAL_CATEGORY
(
    "NO",
    "CATEGORY",
    "FORM"
)
VALUES
(
    3,
    '�ٹ���û��',
    '<div class="document-form">
        <div class="document-title">
            ����/���� �ٹ� ��û��
        </div>
        <div class="approval-line">
            <table class="approval-line-table">
                <tr class="table-header-rank">
                    <th class="vertical-cell" rowspan="4">�����</th>
                    <th class="table-rank sender-rank"></th>
                    <th class="vertical-cell" rowspan="4">������</th>
                </tr>
                <tr class="table-body-name">
                    <td class="table-name sender-name"></td>
                    <input class="sender-no" name="SenderNo" type="text">
                </tr>
                <tr class="approval-result">
                    <td class="table-approval"></td>
                </tr>
                <tr class="table-date-area">
                    <td class="table-date"></td>
                </tr>
            </table>
        </div>
        <div class="info-inst">
            <div class="approval-info">
                <table class="info-table">
                    <tr>
                        <th class="info-header">�����</th>
                        <td class="info-text drafter-name"></td>
                    </tr>
                    <tr>
                        <th class="info-header">�Ҽ�</th>
                        <td class="info-text drafter-depart"></td>
                    </tr>
                    <tr>
                        <th class="info-header">�����</th>
                        <td class="info-text draft-date">
                        </td>
                    </tr>
                    <tr>
                        <th class="info-header">������ȣ</th>
                        <td class="info-text document-no"></td>
                    </tr>
                </table>
            </div>

            <div class="leave-info">
                <table class="leave-info-table">
                    <tr class="leave-table-row">
                        <th class="leave-table-header">�ٹ� ����</th>
                        <td class="leave-table-body">
                            <div class="extra-work-category"></div>
                        </td>
                    </tr>
                    <tr>
                        <th class="leave-table-header">�ٹ� ��¥</th>
                        <td class="leave-table-body">
                            <input type="date" name="date">
                        </td>
                    </tr>
                    <tr>
                        <th class="leave-table-header">���� �ð�</th>
                        <td class="leave-table-body">
                            <input type="time" name="startTime">
                        </td>
                    </tr>
                    <tr>
                        <th class="leave-table-header">���� �ð�</th>
                        <td class="leave-table-body">
                            <input type="time" name="endTime">
                        </td>
                    </tr>
                </table>
            </div>
        </div>
        <div class="main-text-area">
            <table class="main-text-table">
                <tr>
                    <td class="table-title">�ٹ� ����</td>
                    <input type="text" name="title" class="invisible-input" value="����/���� �ٹ� ��û��">
                </tr>
                <tr>
                    <td class="table-main-area" colspan="2">
                        <textarea name="extraWorkReason" class="leave-reason" ></textarea>
                        <div class="main-form1">���� ���� ����/���� �ٹ��� ��û�Ͽ��� ����Ͽ� �ֽñ� �ٶ��ϴ�.</div>
                    </td>
                </tr>
            </table>
        </div>
    </div>'
);




INSERT INTO APPROVAL_CATEGORY
(
    "NO",
    "CATEGORY",
    "FORM"
)
VALUES
(   '4',
    '������Ǽ�',
    '<div class="document-form">
        <div class="document-title">
            �� �� �� �� ��
        </div>
        
        <div class="info-inst">
            <div class="approval-info">
                <table class="info-table">
                    <tr>
                        <th class="info-header">�����</th>
                        <td class="info-text drafter-name"></td>
                    </tr>
                    <tr>
                        <th class="info-header">�Ҽ�</th>
                        <td class="info-text drafter-depart"></td>
                    </tr>
                    <tr>
                        <th class="info-header">�����</th>
                        <td class="info-text draft-date">
                        </td>
                    </tr>
                    <tr>
                        <th class="info-header">������ȣ</th>
                        <td class="info-text document-no"></td>
                    </tr>
                </table>
            </div>

            <div class="approval-line">
                <table class="approval-line-table">
                    <tr class="table-header-rank">
                        <th class="vertical-cell" rowspan="4">�����</th>
                        <th class="table-rank sender-rank"></th>
                        <th class="vertical-cell" rowspan="4">������</th>
                    </tr>
                    <tr class="table-body-name">
                        <td class="table-name sender-name"></td>
                        <input class="sender-no" name="SenderNo" type="text">
                    </tr>
                    <tr class="approval-result">
                        <td class="table-approval"></td>
                    </tr>
                    <tr class="table-date-area">
                        <td class="table-date"></td>
                    </tr>
                </table>
            </div>

        </div>
        <div class="main-text-area">
            <table class="main-text-table">
                <tr>
                    <td class="table-title">����</td>
                    <td class="title-input-cell">
                        <input class="title-input" type="text" name="receiptTitle">
                    </td>
                </tr>
                <tr>
                    <td class="table-main-area" colspan="2">
                        <div class="table-area">
                            <table class="receipt-table">
                                <thead>
                                    <tr>
                                        <th class="receipt-category">�׸�</th>
                                        <th class="receipt-breakdown">����</th>
                                        <th class="receipt-cost">�ݾ�</th>
                                        <th class="receipt-note">���</th>
                                    </tr>
                                </thead>

                                <tbody>
                                    <tr>
                                        <td>
                                            <input type="text">
                                        </td>
                                        <td>
                                            <input type="text">
                                        </td>
                                        <td>
                                            <input type="number">
                                        </td>
                                        <td>
                                            <input type="text">
                                        </td>
                                    </tr>
                                </tbody>
                                
                            </table>
                        </div>
                        <div class="main-form1">�� �ݾ��� û���Ͽ��� ���� �ٶ��ϴ�.</div>
                    </td>
                </tr>
            </table>
        </div>
    </div>'
);






    
    