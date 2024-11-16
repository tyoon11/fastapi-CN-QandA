<script>
    import { push } from 'svelte-spa-router'
    import fastapi from "../lib/api"
    import Error from "../components/Error.svelte"    
    import { access_token, username, is_login } from "../lib/store"

    let error = {detail:[]}
    let login_username = ""
    let login_password = ""

    // 로그인 함수
    function login(event) {
        event.preventDefault()
        let url = "/api/user/login"
        let params = {
            username: login_username,
            password: login_password,
        }
        // 사용자 로그인 API 호출
        fastapi('login', url, params, 
            (json) => {
                $access_token = json.access_token
                $username = json.username
                $is_login = true
                push("/") // 성공 시 메인 페이지로 이동
            },
            (json_error) => {
                error = json_error
            }
        )
    }
</script>

<!-- 로그인 UI -->
<div class="container">
    <h5 class="my-3 border-bottom pb-2">로그인</h5> <!-- 로그인 페이지 제목 -->
    <Error error={error} /> 
    <form method="post"> 
        <div class="mb-3">
            <label for="username">사용자 이름</label> <!-- 사용자 이름 입력 레이블 -->
            <input type="text" class="form-control" id="username" bind:value="{login_username}"> <!-- 사용자 이름 입력 필드 -->
        </div>
        <div class="mb-3">
            <label for="password">비밀번호</label> <!-- 비밀번호 입력 레이블 -->
            <input type="password" class="form-control" id="password" bind:value="{login_password}"> <!-- 비밀번호 입력 필드 -->
        </div>
        <button type="submit" class="btn btn-primary" on:click="{login}">로그인</button> <!-- 로그인 버튼 -->
    </form>
</div>
