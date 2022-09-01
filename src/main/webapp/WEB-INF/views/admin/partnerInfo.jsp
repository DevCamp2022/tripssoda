<%@ page contentType="text/html;charset=UTF-8" language="java" %>


<div class="content">
    zzzzzzzzzzzzzzzzzzzzzzzzzzzz

    <table>
        <tr class="con-td">
            <td class="con" name="userId">${partnerDto.id}</td>
            <td class="con" name="userId">${partnerDto.userId}</td>
            <td class="con" name="companyName">${partnerDto.companyName}</td>
            <td class="con" name="serviceRegion">${partnerDto.serviceRegion}</td>
            <td class="con" name="productType" data-menu-code="${partner.productType}">${partnerDto.productType}</td>
            <td class="con" name="conclusionDate">${partnerDto.onPartnership==0? '심사대기' : '파트너'}</td>
        </tr>
        <tr>
            <button>승인</button>
            <button>거절</button>
        </tr>
    </table>

</div>