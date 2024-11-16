<script>
    import fastapi from "../lib/api"
    import Error from "../components/Error.svelte"
    import { link, push } from 'svelte-spa-router'
    import { is_login, username } from "../lib/store"
    import moment from 'moment/min/moment-with-locales'
    moment.locale('ko')

    export let params = {}
    let question_id = params.question_id
    let question = {answers:[], voter:[]}
    let content = ""
    let error = {detial:[]}

    // 질문 상세 정보를 가져오는 함수
   function get_question() {
        fastapi("get", "/api/question/detail/" + question_id, {}, (json) => {
            question = json
        })
    }

    // 페이지 로드 시 질문 데이터를 가져옴 
    get_question()

    // 답변 등록 함수
    function post_answer(event) {
        event.preventDefault()
        let url = "/api/answer/create/" + question_id
        let params = {
            content: content
        }

        // 답변 등록 API 호출
        fastapi('post', url, params, 
            (json) => {
                content = ''
                error = {detail:[]}
                get_question()
            },
            (err_json) => {
                error = err_json
            }
        )
    }

    //  질문 삭제 함수
    function delete_question(_question_id) {
        if(window.confirm('정말로 삭제하시겠습니까?')) {
            let url = "/api/question/delete"
            let params = {
                question_id: _question_id
            }
            fastapi('delete', url, params, 
                (json) => {
                    push('/')
                },
                (err_json) => {
                    error = err_json
                }
            )
        }
    }

    // 답변 삭제 함수
    function delete_answer(answer_id) {
        if(window.confirm('정말로 삭제하시겠습니까?')) {
            let url = "/api/answer/delete"
            let params = {
                answer_id: answer_id
            }
            fastapi('delete', url, params, 
                (json) => {
                    get_question()
                },
                (err_json) => {
                    error = err_json
                }
            )
        }
    }

    // 질문 추천 함수
    function vote_question(_question_id) {
        
        let url = "/api/question/vote"
        let params = {
            question_id: _question_id
        }
        fastapi('post', url, params, 
            (json) => {
                get_question()
            },
            (err_json) => {
                error = err_json
            }
        )
        
    }

    // 답변 추천 함수
    function vote_answer(answer_id) {
        
        let url = "/api/answer/vote"
        let params = {
            answer_id: answer_id
        }
        fastapi('post', url, params, 
            (json) => {
                get_question()
            },
            (err_json) => {
                error = err_json
            }
        )
        
    }
</script>

<!-- 질문 및 답변 UI -->
<div class="container my-3">
    <!-- 질문 -->
    <h2 class="border-bottom py-2">{question.subject}</h2>
    <div class="card my-3">
        <div class="card-body">
            <div class="card-text" style="white-space: pre-line;">{question.content}</div> <!-- 질문제목 -->
            <div class="d-flex justify-content-end">
                <!-- 수정일 있을 경우 표시 -->
                {#if question.modify_date }
                <div class="badge bg-light text-dark p-2 text-start mx-3">
                    <div class="mb-2">modified at</div>
                    <div>{moment(question.modify_date).format("YYYY년 MM월 DD일 hh:mm a")}</div>
                </div>
                {/if}
                <!-- 작성자 및 작성 날짜 표시 -->
                <div class="badge bg-light text-dark p-2 text-start">
                    <div class="mb-2">{ question.user ? question.user.username : ""}</div>                    
                    <div>{moment(question.create_date).format("YYYY년 MM월 DD일 hh:mm a")}</div>
                </div>
            </div>
            <!-- 수정 및 추천 버튼 -->
            <div class="my-3">
                <button class="btn btn-sm btn-outline-secondary"
                    on:click="{() => vote_question(question.id)}"> 
                    추천
                    <span class="badge rounded-pill bg-success">{ question.voter.length }</span> <!-- 추천 수 -->
                </button>
                {#if question.user && $username === question.user.username }
                <a use:link href="/question-modify/{question.id}" 
                    class="btn btn-sm btn-outline-secondary">수정</a> <!-- 수정 버튼-->
                <button class="btn btn-sm btn-outline-secondary"
                    on:click={() => delete_question(question.id)}>삭제</button> <!-- 삭제 버튼 -->
                {/if}
            </div>
        </div>
    </div>

    <button class="btn btn-secondary" on:click="{() => {
        push('/')
        }}">목록으로</button> <!-- 목록으로 돌아가기 버튼 -->

    <!-- 답변 목록 -->
    <h5 class="border-bottom my-3 py-2">{question.answers.length}개의 답변이 있습니다.</h5>
    {#each question.answers as answer}
    <div class="card my-3">
        <div class="card-body">
            <div class="card-text" style="white-space: pre-line;">{answer.content}</div> <!-- 답변 내용 -->
            <div class="d-flex justify-content-end">
                <!-- 수정일 있을 경우 표시 -->
                {#if answer.modify_date }
                <div class="badge bg-light text-dark p-2 text-start mx-3">
                    <div class="mb-2">modified at</div>
                    <div>{moment(answer.modify_date).format("YYYY년 MM월 DD일 hh:mm a")}</div>
                </div>
                {/if}
                <!-- 작성자 및 작성 날짜 표시 -->
                <div class="badge bg-light text-dark p-2 text-start">
                    <div class="mb-2">{ answer.user ? answer.user.username : ""}</div>
                    <div>{moment(answer.create_date).format("YYYY년 MM월 DD일 hh:mm a")}</div>
                </div>
            </div>
            <!-- 답변 수정 및 추천 버튼 -->
            <div class="my-3">
                <button class="btn btn-sm btn-outline-secondary"
                    on:click="{() => vote_answer(answer.id)}"> 
                    추천
                    <span class="badge rounded-pill bg-success">{ answer.voter.length }</span> <!-- 추천 수 -->
                </button>
                {#if answer.user && $username === answer.user.username }
                <a use:link href="/answer-modify/{answer.id}" 
                    class="btn btn-sm btn-outline-secondary">수정</a> <!-- 답변 수정 버튼 -->

                <button class="btn btn-sm btn-outline-secondary"
                    on:click={() => delete_answer(answer.id) }>삭제</button> <!-- 답변 삭제 버튼 -->
                {/if}
            </div>
        </div>
    </div>
    {/each}
    <!-- 답변 등록 -->
    <Error error={error} />
    <form method="post" class="my-3">
        <div class="mb-3">
            <textarea rows="10" bind:value={content}
            disabled={$is_login ? "" : "disabled"}
             class="form-control"></textarea> <!-- 답변 내용 입력 -->
        </div>
        <input type="submit" value="답변등록" class="btn btn-primary
        {$is_login ? '' : 'disabled'}"  on:click="{post_answer}" /> <!-- 답변 등록 버튼 -->
    </form>
</div>


