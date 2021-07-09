<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="custom" uri="/tags/custom-taglib" %>
<%@ taglib prefix="tags" tagdir="/WEB-INF/tags" %>
<%@ page trimDirectiveWhitespaces="true" %>
<c:set var="REQUEST_CONTEXT_PATH" value="${pageContext.request.contextPath}" />

<!-- Messages -->
<c:if test="${not empty message}">
	<script type="text/javascript">
		alert("${message}");
		location.href = "list?imageFilePackageIdSq=${imageFileInfo.imageFilePackageIdSq}";
	</script>
</c:if>

<script type="text/javascript">
<!--

	$(function(){
		var obj = JSON.parse('${imageJsonFileInfo.imageJsonFileDesc}');
		var str = JSON.stringify(obj, undefined, 4);
		$("#imageJsonFileDesc").html(str);
	});

	// 저장
	function fnImageFileSave() {
		var frm = $('form:last');
		if (frm.valid()) {
			if (confirm('<spring:message code="save.isSave" />')) {
				$.ajax({
					type: 'POST',
					url: '${REQUEST_CONTEXT_PATH}/image/imagePackageInfo/imageInfo/update',
					data: frm.serialize(),
					success: function(data) {
						if (data.resultCd == 'success') { // 성공
							alert(data.resultMsg);
							getImageFileList();
						} else { // 실패
							alert(data.resultMsg);
						}
					},
					error: function(xhr) {
						alert('error : ' + xhr.status + '\n' + xhr.statusText);
					}, complete: function(XMLHttpRequest, textStatus) {
						//alert(XMLHttpRequest + '\n' + textStatus);
					}
				});
			}
		}
	}
//-->
</script>

<div class="well">
	<form:form method="post" action="update" modelAttribute="imageFileInfo" cssClass="smart-form" role="form">
		<form:hidden path="imageFileSq" />
		<form:hidden path="imageFilePackageIdSq" />

		<fieldset>
			<legend><i class="fa fa-archive"></i> <spring:message code="admin.image.imageFileInfo" /></legend>

			<div class="row">
				<section class="col col-6">
					<label class="label"><span class="asterisk">*</span><spring:message code="admin.image.imageFileSq" /></label>
					<label class="input">
						<form:input path="imageFileSq" maxlength="10" cssClass="required" disabled="true" />
					</label>
				</section>
				<section class="col col-6">
					<label class="label"><span class="asterisk">*</span><spring:message code="admin.image.imageFilePackageIdSq" /></label>
					<label class="input">
						<form:input path="imageFilePackageIdSq" maxlength="100" cssClass="required" disabled="true" />
					</label>
				</section>
			</div>

			<div class="row">
				<section class="col col-6">
					<label class="label"><span class="asterisk">*</span><spring:message code="admin.image.imageFileNm" /></label>
					<label class="input">
						<form:input path="imageFileNm" maxlength="4" cssClass="required" />
					</label>
				</section>
				<section class="col col-6">
					<label class="label"><span class="asterisk">*</span><spring:message code="admin.image.imageFileSize" /></label>
					<label class="input">
						<form:input path="imageFileSize" maxlength="4" cssClass="required digits" />
					</label>
				</section>
			</div>

			<div class="row">
				<section class="col col-6">
					<label class="label"><span class="asterisk">*</span><spring:message code="admin.image.imageFilePath" /></label>
					<label class="input">
						<form:input path="imageFilePath" maxlength="4" cssClass="required" />
					</label>
				</section>
			</div>

			<div class="row">
				<section class="col col-6">
					<label class="label"><span class="asterisk">*</span><spring:message code="admin.image.imageFileScaleX" /></label>
					<label class="input">
						<form:input path="imageFileScaleX" maxlength="4" cssClass="required digits" />
					</label>
				</section>
				<section class="col col-6">
					<label class="label"><span class="asterisk">*</span><spring:message code="admin.image.imageFileScaleY" /></label>
					<label class="input">
						<form:input path="imageFileScaleY" maxlength="4" cssClass="required digits" />
					</label>
				</section>
			</div>

			<div class="row">
				<section class="col col-6">
					<label class="label"><spring:message code="admin.image.lastUpdateImageFileScaleX" /></label>
					<label class="input">
						<form:input path="lastUpdateImageFileScaleX" maxlength="4" cssClass="digits" />
					</label>
				</section>

				<section class="col col-6">
					<label class="label"><spring:message code="admin.image.lastUpdateImageFileScaleY" /></label>
					<label class="input">
						<form:input path="lastUpdateImageFileScaleY" maxlength="4" cssClass="digits" />
					</label>
				</section>
			</div>

			<div class="row">
				<section class="col col-6">
					<label class="label"><spring:message code="admin.image.lastUpdateImageMagnification" /></label>
					<label class="input">
						<form:input path="lastUpdateImageMagnification" maxlength="8" cssClass="form-control digits"/>
					</label>
				</section>
			</div>

			<div class="row">
				<section class="col col-6">
					<label class="label"><span class="asterisk">*</span><spring:message code="admin.image.imageFileTypeCd" /></label>
    	        	<label class="select">
		                <tags:select name="imageFileTypeCd" group="TA007" value="${imageFileInfo.imageFileTypeCd}">
		                </tags:select>
		                <i></i>
            		</label>
				</section>
				<section class="col col-6">
					<label class="label"><span class="asterisk">*</span><spring:message code="admin.image.imageFileDownloadPathCd" /></label>
    	        	<label class="select">
		                <tags:select name="imageFileDownloadPathCd" group="TA005" value="${imageFileInfo.imageFileDownloadPathCd}">
		                </tags:select>
		                <i></i>
            		</label>
				</section>
			</div>
		</fieldset>

		<fieldset>
			<legend><i class="fa fa-file-text-o"></i> <spring:message code="admin.image.imageJsonFileInfo" /></legend>

			<div class="row">
				<section class="col col-6">
					<label class="label"><span class="asterisk">*</span><spring:message code="admin.image.imageFileSq" /></label>
					<label class="input">
						<form:input path="imageFileSq" maxlength="10" cssClass="required" disabled="true" value="${imageJsonFileInfo.imageFileSq}" />
					</label>
				</section>
			</div>

			<div class="row">
				<section class="col col-6">
					<label class="label"><span class="asterisk">*</span><spring:message code="admin.image.imageJsonFileNm" /></label>
					<label class="input">
						<form:input path="imageJsonFileNm" maxlength="256" cssClass="required" value="${imageJsonFileInfo.imageJsonFileNm}" />
					</label>
				</section>
				<section class="col col-6">
					<label class="label"><span class="asterisk">*</span><spring:message code="admin.image.imageJsonFileSize" /></label>
					<label class="input">
						<form:input path="imageJsonFileSize" maxlength="4" cssClass="required digits" value="${imageJsonFileInfo.imageJsonFileSize}" />
					</label>
				</section>
			</div>

			<div class="row">
				<section class="col col-6">
					<label class="label"><span class="asterisk">*</span><spring:message code="admin.image.imageJsonFilePath" /></label>
					<label class="input">
						<form:input path="imageJsonFilePath" maxlength="512" cssClass="required" value="${imageJsonFileInfo.imageJsonFilePath}" />
					</label>
				</section>
			</div>

			<div class="row">
        		<section class="col col-md-12">
	    	        <label class="label"><spring:message code="admin.image.imageJsonFileDesc" /></label>
	    	         <label class="textarea">
		                <form:textarea path="imageJsonFileDesc" rows="10" maxlength='2000'/>
            		</label>
        		</section>
        	</div>
		</fieldset>
	</form:form>

</div>

<!-- button -->
<div class="row">
	<div class="col-sm-12">
		<div class="btn-group">
			<a href="javascript:getImageList();" class="btn btn-sm btn-default" role="button">
				<i class="fa fa-list"></i> <spring:message code="common.list" />
			</a>
		</div>
		<custom:auth authUrl="/image/imagePackageInfo/" type="UPDATE">
			<div class="btn-group pull-right">
				<button type="button" onclick="fnImageFileSave();" class="btn btn-sm btn-primary" role="button">
					<i class="fa fa-plus"></i> <spring:message code="common.save" />
				</button>
			</div>
		</custom:auth>
	</div>
</div>
<!-- // button -->
