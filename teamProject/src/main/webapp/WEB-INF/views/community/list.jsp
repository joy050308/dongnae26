<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<html>
<%@include file="../includes/header.jsp"%>
        
        <!-- Header Start -->
        <div class="container-fluid bg-breadcrumb">
            <div class="container text-center py-5" style="max-width: 900px;">
                <h3 class="text-white display-3 mb-4">커뮤니티 게시판</h3>
                <ol class="breadcrumb justify-content-center mb-0">
                    <li class="breadcrumb-item"><a href="../main">Home</a></li>
                    <li class="breadcrumb-item"><a href="/community/list">커뮤니티 게시판</a></li>
                </ol>    
            </div>
        </div>
        <!-- Header End -->

<head>

    <title>동네26 - 커뮤니티 게시판</title>
    
    <style>
    	/* General Page Layout */
		@media (min-width: 1000px) {
		  #page-wrapper {
		    margin: 0 150px 0 150px;
		    background-color: white;
		  }
		}
		
		#page-wrapper {
		    padding: 50px;
		    background-color: white;
		}
		
		body {
		    background-color: #f5f5f5; /* Outer div background color */
		}
    </style>
</head>
<body>
    <div id="page-wrapper">
    	<div>
	        <form id="searchForm" action="${pageContext.request.contextPath}/community/getList" method="post">
	            <label for="type">검색 유형:</label>
	            <select class="form-select form-control" id="type" name="type">
	                <option value="all">전체</option>
	                <option value="community_title">제목</option>
	                <option value="community_content">내용</option>
	                <option value="region">거주지</option>
	                <option value="writer">작성자</option>
	            </select>
	            <input type="text" name="keyword" placeholder="검색어 입력">
	            <input type="hidden" name="amount" value="10"> <!-- 초기값 10으로 설정 -->
	            <input type="hidden" name="pageNum" value="1"> <!-- 초기값 1로 설정 -->
	            <input type="hidden" name="area" id="selectedArea"> <!-- 선택된 구를 전송하기 위한 hidden 필드 -->
	            <button type="submit">검색</button>
	        </form>
	    </div>
	    <label for="area">지역:</label>
	    <select id="areaSelect" name="area">
	        <option value="" ${selectedArea == '' ? 'selected' : ''}>지역 전체</option>
	        <option value="강남구" ${selectedArea == '강남구' ? 'selected' : ''}>강남구</option>
	        <option value="강동구" ${selectedArea == '강동구' ? 'selected' : ''}>강동구</option>
	        <option value="강북구" ${selectedArea == '강북구' ? 'selected' : ''}>강북구</option>
	        <option value="강서구" ${selectedArea == '강서구' ? 'selected' : ''}>강서구</option>
	        <option value="관악구" ${selectedArea == '관악구' ? 'selected' : ''}>관악구</option>
	        <option value="광진구" ${selectedArea == '광진구' ? 'selected' : ''}>광진구</option>
	        <option value="구로구" ${selectedArea == '구로구' ? 'selected' : ''}>구로구</option>
	        <option value="금천구" ${selectedArea == '금천구' ? 'selected' : ''}>금천구</option>
	        <option value="노원구" ${selectedArea == '노원구' ? 'selected' : ''}>노원구</option>
	        <option value="도봉구" ${selectedArea == '도봉구' ? 'selected' : ''}>도봉구</option>
	        <option value="동대문구" ${selectedArea == '동대문구' ? 'selected' : ''}>동대문구</option>
	        <option value="동작구" ${selectedArea == '동작구' ? 'selected' : ''}>동작구</option>
	        <option value="마포구" ${selectedArea == '마포구' ? 'selected' : ''}>마포구</option>
	        <option value="서대문구" ${selectedArea == '서대문구' ? 'selected' : ''}>서대문구</option>
	        <option value="서초구" ${selectedArea == '서초구' ? 'selected' : ''}>서초구</option>
	        <option value="성북구" ${selectedArea == '성북구' ? 'selected' : ''}>성북구</option>
	        <option value="송파구" ${selectedArea == '송파구' ? 'selected' : ''}>송파구</option>
	        <option value="양천구" ${selectedArea == '양천구' ? 'selected' : ''}>양천구</option>
	        <option value="영등포구" ${selectedArea == '영등포구' ? 'selected' : ''}>영등포구</option>
	        <option value="용산구" ${selectedArea == '용산구' ? 'selected' : ''}>용산구</option>
	        <option value="은평구" ${selectedArea == '은평구' ? 'selected' : ''}>은평구</option>
	        <option value="종로구" ${selectedArea == '종로구' ? 'selected' : ''}>종로구</option>
	        <option value="중구" ${selectedArea == '중구' ? 'selected' : ''}>중구</option>
	        <option value="중랑구" ${selectedArea == '중랑구' ? 'selected' : ''}>중랑구</option>
	    </select>
	    <div>
	        <label>Show 
	            <select id="select1" name="select1">
	                <option value="10">10</option>
	                <option value="15">15</option>
	                <option value="20">20</option>
	            </select>
	        </label>
	    </div>
	    <div id="content">
	        <!-- /.row -->
	            <div class="row">
	                <div class="">
	                    <div class="panel panel-default">
	                        <div class="panel-heading">
	                            Hover Rows
	                        </div>
	                        <!-- /.panel-heading -->
	                        <div class="panel-body">
	                            <div class="table-responsive">
	                                <table id="community_board" class="table table-hover">
	                                    <thead>
	                                        <tr>
	                    <th>글번호</th>
	                    <th>구</th>
	                    <th>제목</th>
	                    <th>내용</th>
	                    <th>작성자</th>
	                    <th>조회수</th>
	                    <th>작성일</th>
	                </tr>
	                                    </thead>
	                                    <tbody id="boardList">
	                                    </tbody>
	                                </table>
	                            </div>
	                            <!-- /.table-responsive -->
	                        </div>
	                        <!-- /.panel-body -->
	                    </div>
	                    <!-- /.panel -->
	                </div>
	               </div> 
	        <div class="pagination" id="pagination">
	            <!-- 페이지네이션 링크를 여기에 렌더링 -->
	        </div>
	    </div>
	    <a href="${pageContext.request.contextPath}/community/register" class="write-link">글 작성</a>
    </div>
    <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
    <script>
    $(document).ready(function() {
        // 초기 페이지 로딩 시 데이터 표시
        loadBoardList();

        // 검색 폼 제출
        $("#searchForm").submit(function(event) {
            event.preventDefault(); // 폼 제출 방지
            $("#searchForm input[name='pageNum']").val(1); // 검색 시 페이지 번호 초기화
            loadBoardList();
        });

        // Show 변경 시 데이터 갱신
        $("#select1").change(function() {
            $("#searchForm input[name='amount']").val($(this).val()); // 선택한 amount 값을 폼에 설정
            $("#searchForm input[name='pageNum']").val(1); // 페이지 번호 초기화
            loadBoardList();
        });

        // 지역 선택 시 데이터 갱신
        $("#areaSelect").change(function() {
            $("#searchForm input[name='area']").val($(this).val()); // 선택한 area 값을 hidden 필드에 설정
            $("#searchForm input[name='pageNum']").val(1); // 페이지 번호 초기화
            loadBoardList();
        });
    });

    function loadBoardList() {
        $.ajax({
            type: "POST",
            url: "${pageContext.request.contextPath}/community/getList",
            data: $("#searchForm").serialize(), // 폼 데이터 직렬화
            dataType: "json",
            success: function(response) {
                var boardList = response.boardlist;
                var pageMaker = response.pageMaker;

                // 게시물 목록 업데이트
                var boardListHtml = "";
                $.each(boardList, function(index, board) {
                    boardListHtml += "<tr>";
                    boardListHtml += "<td>" + board.community_bno + "</td>";
                    boardListHtml += "<td>" + board.region + "</td>";
                    boardListHtml += "<td><a href='${pageContext.request.contextPath}/community/get?community_bno=" + board.community_bno + "'>" + board.community_title + "</a></td>";
                    boardListHtml += "<td>" + board.community_content + "</td>";
                    boardListHtml += "<td>" + board.writer + "</td>";
                    boardListHtml += "<td>" + board.community_viewcnt + "</td>";
                    boardListHtml += "<td>" + board.formattedRegdate + "</td>";
                    boardListHtml += "</tr>";
                });
                $("#boardList").html(boardListHtml);

                // 페이지네이션 업데이트
                var paginationHtml = "";
                if (pageMaker.prev) {
                    paginationHtml += "<a href='#' onclick='loadPage(" + (pageMaker.startPage - 1) + ")'>이전</a> ";
                }
                for (var i = pageMaker.startPage; i <= pageMaker.endPage; i++) {
                    paginationHtml += "<a href='#' onclick='loadPage(" + i + ")'>" + i + "</a> ";
                }
                if (pageMaker.next) {
                    paginationHtml += "<a href='#' onclick='loadPage(" + (pageMaker.endPage + 1) + ")'>다음</a>";
                }
                $("#pagination").html(paginationHtml);
            }
        });
    }

    function loadPage(pageNum) {
        $("#searchForm input[name='pageNum']").val(pageNum);
        loadBoardList();
    }
    </script>
    <%@include file="../includes/footer.jsp"%>
</body>
</html>
