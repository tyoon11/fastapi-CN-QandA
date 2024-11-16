<script>
    import { push } from 'svelte-spa-router'
    import fastapi from "../lib/api"
    import Error from "../components/Error.svelte"

    let error = {detail:[]}
    let subject = ''
    let content = ''

    // 질문 등록 함수
    function post_question(event) {
        event.preventDefault()
        let url = "/api/question/create"
        let params = {
            subject: subject,
            content: content,
        }

        // 질문 생성 API 호출
        fastapi('post', url, params, 
            (json) => {
                push("/") // 성공 시 메인 페이지로 이동
            },
            (json_error) => {
                error = json_error
            }
        )
    }
</script>

<!-- 질문 등록 UI -->
<div class="container">
    <!-- 질문 등록 페이지 제목 -->
    <h5 class="my-3 border-bottom pb-2">질문 등록</h5> 
    <Error error={error} />
    <form method="post" class="my-3">
        <div class="mb-3">
            <label for="subject">제목</label> <!-- 제목 입력 레이블 -->
            <input type="text" class="form-control" bind:value="{subject}">
        </div>
        <div class="mb-3">
            <label for="content">내용</label> <!-- 내용 입력 레이블 -->
            <textarea class="form-control" rows="10" bind:value="{content}"></textarea> <!-- 내용 입력 필드 -->
        </div>
        <button class="btn btn-primary" on:click="{post_question}">저장하기</button> <!-- 질문 저장 버튼 -->
    </form>
</div>
