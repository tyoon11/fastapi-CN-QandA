<script>
    import fastapi from "../lib/api"
    import { link } from 'svelte-spa-router'
    import { page, keyword, is_login } from "../lib/store"
    import moment from 'moment/min/moment-with-locales'
    // 한국 날짜 형식
    moment.locale('ko')


    let question_list = []
    let size = 10 // 한 페이지에 표시할 질문 개수
    let total = 0 
    let kw = ''
    $: total_page = Math.ceil(total/size) // 총 페이지 수 계산

    // 페이지 그룹 시작 번호
    $: page_group_start = Math.floor(($page - 1) / 10) * 10 + 1;

    // 질문 목록을 가져오는 함수
    function get_question_list() {
        let params = {
            page: $page,
            size: size,
            keyword: $keyword,
        }
        // 질문 목록 API 호출
        fastapi('get', '/api/question/list', params, (json) => {
            question_list = json.question_list
            total = json.total
            kw = $keyword
        })
    }

    // 페이지나 검색 키워드가 변경될 때 마다 질문 목록을 가져옴
    $:$page, $keyword, get_question_list()
</script>

<!-- 질문 목록 페이지 UI -->
<div class="container my-3">
    <div class="row my-3">
        <div class="col-6">
            <!-- 질문 등록 버튼 -->
            <a use:link href="/question-create" 
                class="btn btn-primary {$is_login ? '' : 'disabled'}">질문 등록하기</a> <!-- 로그인 상태일 때만 활성화 -->
        </div>
        <div class="col-6">
            <!-- 검색 입력 및 버튼 -->
            <div class="input-group">
                <input type="text" class="form-control" bind:value="{kw}">
                <button class="btn btn-outline-secondary" on:click={() => {$keyword = kw, $page = 1}}>
                    찾기 <!-- 검색 버튼 클릭 시 검색 키워드를 설정하고 첫 페이지로 이동 -->
                </button>
            </div>
        </div>
    </div>

    <!-- 질문 목록 테이블 -->
    <table class="table">
        <thead>
        <tr class="text-center table-dark">
            <th>번호</th>
            <th style='width:50%'>제목</th>
            <th>글쓴이</th>
            <th>작성일시</th>
        </tr>
        </thead>
        <tbody>
        {#each question_list as question, i}
        <tr class="text-center">
            <!-- 게시물 번호 (최근 순서로 표시) -->
            <td>{ total - ( ($page - 1) * size) - i}</td>
            <!-- 질문 제목 및 답변 개수 -->
            <td class="text-start">
                <a use:link href="/detail/{question.id}">{question.subject}</a>
                <!-- 답변 개수 있는 경우 표시 -->
                {#if question.answers.length > 0 }
                <span class = "text-danger small mx-2">{question.answers.length}</span>
                {/if}
            </td>
            <!-- 질문 작성자 -->
            <td>{ question.user ? question.user.username : "" }</td>
            <!-- 질문 작성일 -->
            <td>{moment(question.create_date).format("YYYY년 MM월 DD일 hh:mm a")}</td>
        </tr>
        {/each}
        </tbody>
    </table>

    <!-- 페이징 처리 시작 -->
    <ul class="pagination justify-content-center">
        <!-- 이전 페이지 그룹 버튼 -->
        <li class="page-item {page_group_start === 1 && 'disabled'}">
            <button class="page-link" on:click="{() => {
                // 이전 페이지 그룹으로 이동
                const prev_group_start = Math.max(1, page_group_start - 10);
                if (prev_group_start !== page_group_start) {
                    page_group_start = prev_group_start;
                    // 이전 그룹의 마지막 페이지 선택
                    $page = Math.min(page_group_start + 9, total_page);
                }
            }}">이전</button>
        </li>

        <!-- 페이지 번호 버튼들 -->
        {#each Array(total_page) as _, loop_page}
        {#if loop_page + 1 >= page_group_start && loop_page + 1 < page_group_start + 10}
        <li class="page-item {loop_page + 1 === $page && 'active'}">
            <button on:click="{() => $page = loop_page + 1}" class="page-link">{loop_page + 1}</button>
        </li>
        {/if}
        {/each}

        <!-- 다음 페이지 그룹 버튼 -->
        <li class="page-item {page_group_start + 10 >= total_page && 'disabled'}">
            <button class="page-link" on:click="{() => {
                // 다음 페이지 그룹으로 이동
                const next_group_start = Math.min(total_page - 10, page_group_start + 10);
                if (next_group_start !== page_group_start) {
                    page_group_start = next_group_start;
                    // 다음 그룹의 첫 번째 페이지 선택
                    $page = page_group_start;
                }
            }}">다음</button>
        </li>

    </ul>
    <!-- 페이징 처리 끝 -->
</div>
