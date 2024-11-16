<script>
    import { push } from 'svelte-spa-router'
    import fastapi from "../lib/api"
    import Error from "../components/Error.svelte"

    export let params = {}
    const question_id = params.question_id

    let error = {detail:[]}
    let subject = ''
    let content = ''

    //  질문 세부 정보 조회 API 호출
    fastapi("get", "/api/question/detail/" + question_id, {}, (json) => {
        subject = json.subject
        content = json.content
    })

    // 질문 수정 함수
    function update_question(event) {
        event.preventDefault()
        let url = "/api/question/update"
        let params = {
            question_id: question_id,
            subject: subject,
            content: content,
        }
        // 질문 수정 API 호출
        fastapi('put', url, params, 
            (json) => {
                push('/detail/'+question_id) // 수정 성공 시 질문 상세 페이지로 이동
            },
            (json_error) => {
                error = json_error
            }
        )
    }
</script>

<!-- 질문 수정 UI -->
<div class="container">
    <h5 class="my-3 border-bottom pb-2">질문 수정</h5> <!-- 질문 수정 페이지 제목 -->
    <Error error={error} />
    <form method="post" class="my-3">
        <div class="mb-3">
            <label for="subject">제목</label> <!-- 제목 입력 레이블 -->
            <input type="text" class="form-control" bind:value="{subject}"> <!-- 제목 입력 필드 -->
        </div>
        <div class="mb-3">
            <label for="content">내용</label> <!-- 내용 입력 레이블 -->
            <textarea class="form-control" rows="10" bind:value="{content}"></textarea> <!-- 내용 입력 필드 -->
        </div>
        <button class="btn btn-primary" on:click="{update_question}">수정하기</button> <!-- 질문 수정 버튼 -->
    </form>
</div>
