INSERT INTO APPROVAL_STATE
(
    NO,
    STATE_NAME
)
VALUES
(
    1,
    '승인'
);

INSERT INTO APPROVAL_STATE
(
    NO,
    STATE_NAME
)
VALUES
(
    2,
    '반려'
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
    '품의서',
    '<div class="document-form">
        <div class="document-title">
            품 의 서
        </div>
        <div class="approval-line">
            <table class="approval-line-table">
                <tr class="table-header-rank">
                    <th class="vertical-cell" rowspan="4">상신인</th>
                    <th class="table-rank sender-rank"></th>
                    <th class="vertical-cell" rowspan="4">결재자</th>
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
                        <th class="info-header">기안자</th>
                        <td class="info-text drafter-name"></td>
                    </tr>
                    <tr>
                        <th class="info-header">소속</th>
                        <td class="info-text drafter-depart"></td>
                    </tr>
                    <tr>
                        <th class="info-header">기안일</th>
                        <td class="info-text draft-date">
                        </td>
                    </tr>
                    <tr>
                        <th class="info-header">문서번호</th>
                        <td class="info-text document-no"></td>
                    </tr>
                </table>
            </div>
            <div class="approval-inst">
                <table>
                    <tr>
                        <th class="inst-header">결재자 지시사항</th>
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
                    <td class="table-title">제목</td>
                    <td class="title-input-cell">
                        <input class="title-input" type="text" name="title">
                    </td>
                </tr>
                <tr>
                    <td class="table-main-area" colspan="2">
                        <div class="main-form1">아래와 같이 보고하오니 검토 후 재가 바랍니다.</div>
                        <div class="main-form2">-아 래-</div>
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
    '휴가신청서',
    '<div class="document-form">
        <div class="document-title">
            휴 가 신 청 서
        </div>
        <div class="approval-line">
            <table class="approval-line-table">
                <tr class="table-header-rank">
                    <th class="vertical-cell" rowspan="4">상신인</th>
                    <th class="table-rank sender-rank"></th>
                    <th class="vertical-cell" rowspan="4">결재자</th>
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
                        <th class="info-header">기안자</th>
                        <td class="info-text drafter-name"></td>
                    </tr>
                    <tr>
                        <th class="info-header">소속</th>
                        <td class="info-text drafter-depart"></td>
                    </tr>
                    <tr>
                        <th class="info-header">기안일</th>
                        <td class="info-text draft-date">
                    </tr>
                    <tr>
                        <th class="info-header">문서번호</th>
                        <td class="info-text document-no"></td>
                    </tr>
                </table>
            </div>
            <div class="leave-info">
                <table class="leave-info-table">
                    <tr class="leave-table-row">
                        <th class="leave-table-header">휴가 시작일</th>
                        <td class="leave-table-body">
                            <input type="date" name="startDate">
                        </td>
                    </tr>
                    <tr>
                        <th class="leave-table-header">휴가 복귀일</th>
                        <td class="leave-table-body">
                            <input type="date" name="endDate">
                        </td>
                    </tr>
                    <tr>
                        <th class="leave-table-header">휴가 일수</th>
                        <td class="leave-table-body">
                            <input type="text" class="date">
                        </td>
                    </tr>
                    <tr>
                        <th class="leave-table-header">휴가 유형</th>
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
                        휴가 사유
                        <input type="text" name="title" class="invisible-input" value="휴가 신청서">
                    </td>
                </tr>
                <tr>
                    <td class="table-main-area" colspan="2">
                        <textarea name="reason" class="leave-reason" ></textarea>
                        <div class="main-form1">위와 같이 휴가를 신청하오니 허락하여 주시기 바랍니다.</div>
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
    '근무신청서',
    '<div class="document-form">
        <div class="document-title">
            휴일/연장 근무 신청서
        </div>
        <div class="approval-line">
            <table class="approval-line-table">
                <tr class="table-header-rank">
                    <th class="vertical-cell" rowspan="4">상신인</th>
                    <th class="table-rank sender-rank"></th>
                    <th class="vertical-cell" rowspan="4">결재자</th>
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
                        <th class="info-header">기안자</th>
                        <td class="info-text drafter-name"></td>
                    </tr>
                    <tr>
                        <th class="info-header">소속</th>
                        <td class="info-text drafter-depart"></td>
                    </tr>
                    <tr>
                        <th class="info-header">기안일</th>
                        <td class="info-text draft-date">
                        </td>
                    </tr>
                    <tr>
                        <th class="info-header">문서번호</th>
                        <td class="info-text document-no"></td>
                    </tr>
                </table>
            </div>

            <div class="leave-info">
                <table class="leave-info-table">
                    <tr class="leave-table-row">
                        <th class="leave-table-header">근무 유형</th>
                        <td class="leave-table-body">
                            <div class="extra-work-category"></div>
                        </td>
                    </tr>
                    <tr>
                        <th class="leave-table-header">근무 날짜</th>
                        <td class="leave-table-body">
                            <input type="date" name="date">
                        </td>
                    </tr>
                    <tr>
                        <th class="leave-table-header">시작 시간</th>
                        <td class="leave-table-body">
                            <input type="time" name="startTime">
                        </td>
                    </tr>
                    <tr>
                        <th class="leave-table-header">종료 시간</th>
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
                    <td class="table-title">근무 사유</td>
                    <input type="text" name="title" class="invisible-input" value="휴일/연장 근무 신청서">
                </tr>
                <tr>
                    <td class="table-main-area" colspan="2">
                        <textarea name="extraWorkReason" class="leave-reason" ></textarea>
                        <div class="main-form1">위와 같이 휴일/연장 근무를 신청하오니 허락하여 주시기 바랍니다.</div>
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
    '지출결의서',
    '<div class="document-form">
        <div class="document-title">
            지 출 결 의 서
        </div>
        
        <div class="info-inst">
            <div class="approval-info">
                <table class="info-table">
                    <tr>
                        <th class="info-header">기안자</th>
                        <td class="info-text drafter-name"></td>
                    </tr>
                    <tr>
                        <th class="info-header">소속</th>
                        <td class="info-text drafter-depart"></td>
                    </tr>
                    <tr>
                        <th class="info-header">기안일</th>
                        <td class="info-text draft-date">
                        </td>
                    </tr>
                    <tr>
                        <th class="info-header">문서번호</th>
                        <td class="info-text document-no"></td>
                    </tr>
                </table>
            </div>

            <div class="approval-line">
                <table class="approval-line-table">
                    <tr class="table-header-rank">
                        <th class="vertical-cell" rowspan="4">상신인</th>
                        <th class="table-rank sender-rank"></th>
                        <th class="vertical-cell" rowspan="4">결재자</th>
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
                    <td class="table-title">제목</td>
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
                                        <th class="receipt-category">항목</th>
                                        <th class="receipt-breakdown">내역</th>
                                        <th class="receipt-cost">금액</th>
                                        <th class="receipt-note">비고</th>
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
                        <div class="main-form1">위 금액을 청구하오니 결재 바랍니다.</div>
                    </td>
                </tr>
            </table>
        </div>
    </div>'
);






    
    