<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>Insert title here</title>
</head>
<body>
	<input type="text"  name="addr1" id="postcode" placeholder="�����ȣ"/>
	<input type="button" onclick="execDaumPostcode()" value="�����ȣ ã��"/><br>
	<input type="text" name="addr2" id="address" placeholder="�ּ�" /><br>
	<input type="text" name="addr3" id="detailAddress" placeholder="���ּ�" /><br>
	<input type="text" name="addr4" id="extraAddress" placeholder="�����׸�" />
	<input type="button" onclick="submitAddress()" value="Ȯ��"/><br>
</body>
<script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
<script type="text/javascript">
	function execDaumPostcode() {
	    new daum.Postcode({
	        oncomplete: function(data) {
	            // �˾����� �˻���� �׸��� Ŭ�������� ������ �ڵ带 �ۼ��ϴ� �κ�.
	
	            // �� �ּ��� ���� ��Ģ�� ���� �ּҸ� �����Ѵ�.
	            // �������� ������ ���� ���� ��쿣 ����('')���� �����Ƿ�, �̸� �����Ͽ� �б� �Ѵ�.
	            var addr = ''; // �ּ� ����
	            var extraAddr = ''; // �����׸� ����
	
	            //����ڰ� ������ �ּ� Ÿ�Կ� ���� �ش� �ּ� ���� �����´�.
	            if (data.userSelectedType === 'R') { // ����ڰ� ���θ� �ּҸ� �������� ���
	                addr = data.roadAddress;
	            } else { // ����ڰ� ���� �ּҸ� �������� ���(J)
	                addr = data.jibunAddress;
	            }
	
	            // ����ڰ� ������ �ּҰ� ���θ� Ÿ���϶� �����׸��� �����Ѵ�.
	            if(data.userSelectedType === 'R'){
	                // ���������� ���� ��� �߰��Ѵ�. (�������� ����)
	                // �������� ��� ������ ���ڰ� "��/��/��"�� ������.
	                if(data.bname !== '' && /[��|��|��]$/g.test(data.bname)){
	                    extraAddr += data.bname;
	                }
	                // �ǹ����� �ְ�, ���������� ��� �߰��Ѵ�.
	                if(data.buildingName !== '' && data.apartment === 'Y'){
	                    extraAddr += (extraAddr !== '' ? ', ' + data.buildingName : data.buildingName);
	                }
	                // ǥ���� �����׸��� ���� ���, ��ȣ���� �߰��� ���� ���ڿ��� �����.
	                if(extraAddr !== ''){
	                    extraAddr = ' (' + extraAddr + ')';
	                }
	                // ���յ� �����׸��� �ش� �ʵ忡 �ִ´�.
	                document.getElementById("extraAddress").value = extraAddr;
	            
	            } else {
	                document.getElementById("extraAddress").value = '';
	            }
	
	            // �����ȣ�� �ּ� ������ �ش� �ʵ忡 �ִ´�.
	            document.getElementById("postcode").value = data.zonecode;
	            document.getElementById("address").value = addr;
	            // Ŀ���� ���ּ� �ʵ�� �̵��Ѵ�.
	            document.getElementById("detailAddress").focus();
	        }
	    }).open();
	}
	
	function submitAddress() {
		var address=opener.document.getElementsByName("address")[0];
		address.value = "[" + document.getElementById("postcode").value +"] "
							+ document.getElementById("address").value + " "
							+ document.getElementById("detailAddress").value
							+ document.getElementById("extraAddress").value;
		address.focus();
		self.close();
	}
</script> 
</html>