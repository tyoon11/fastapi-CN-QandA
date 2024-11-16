<script>
    import { push } from 'svelte-spa-router'
    import fastapi from "../lib/api"
    import Error from "../components/Error.svelte"

    let error = {detail:[]}
    let username = ''
    let password1 = ''
    let password2 = ''
    let email = ''

    // 회원 가입 함수
    function post_user(event) {
        event.preventDefault()
        let url = "/api/user/create"
        let params = {
            username: username,
            password1: password1,
            password2: password2,
            email: email
        }
        // 사용자 생성 API 호출
        fastapi('post', url, params, 
            (json) => {
                push('/user-login') // 성공 시 로그인 페이지 이동
            },
            (json_error) => {
                error = json_error
            }
        )
    }
</script>

<!-- 회원 가입 UI -->
<div class="container">
    <h5 class="my-3 border-bottom pb-2">회원 가입</h5> <!-- 회원 가입 페이지 제목 -->
    <Error error={error} /> 
    <form method="post"> 
        <div class="mb-3">
            <label for="username">사용자 이름</label> <!-- 사용자 이름 입력 레이블 -->
            <input type="text" class="form-control" id="username" bind:value="{username}"> <!-- 사용자 이름 입력 필드 -->
        </div>
        <div class="mb-3">
            <label for="password1">비밀번호</label> <!-- 비밀번호 입력 레이블 -->
            <input type="password" class="form-control" id="password1" bind:value="{password1}"> <!-- 비밀번호 입력 필드 -->
        </div>
        <div class="mb-3">
            <label for="password2">비밀번호 확인</label> <!-- 비밀번호 확인 입력 레이블 -->
            <input type="password" class="form-control" id="password2" bind:value="{password2}"> <!-- 비밀번호 확인 입력 필드 -->
        </div>
        <div class="mb-3">
            <label for="email">이메일</label> <!-- 이메일 입력 레이블 -->
            <input type="text" class="form-control" id="email" bind:value="{email}"> <!-- 이메일 입력 필드 -->
        </div>
        <button type="submit" class="btn btn-primary" on:click="{post_user}">생성하기</button> <!-- 사용자 생성 버튼 -->
    </form>
</div>