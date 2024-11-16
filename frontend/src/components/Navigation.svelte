<script>
    import { link } from 'svelte-spa-router'
    import { page, keyword, access_token, username, is_login  } from '../lib/store'
</script>

<!-- 네비게이션바 -->
<nav class="navbar navbar-expand-lg navbar-light bg-light border-bottom">
    <div class="container-fluid">
        <!-- 로고 -->
        <!-- 로고 클릭 시 메인 페이지로 이동하고 검색 키워드 및 페이지 번호 초기화 -->
        <a use:link class="navbar-brand" href="/" on:click="{() => {$keyword = '', $page = 1}}">CN Q&A</a>
        <!-- 네비게이션 메뉴 토글 버튼 -->
        <button
            class="navbar-toggler"
            type="button"
            data-bs-toggle="collapse"
            data-bs-target="#navbarSupportedContent"
            aria-controls="navbarSupportedContent"
            aria-expanded="false"
            aria-label="Toggle navigation">
            <span class="navbar-toggler-icon"></span>
        </button>

        <!-- 네비게이션 메뉴 목록 -->
        <div class="collapse navbar-collapse" id="navbarSupportedContent">
            <ul class="navbar-nav me-auto mb-2 mb-lg-0">
                <!-- 로그인 상태 -->
                {#if $is_login }
                    <li class="nav-item">
                        <a use:link href="/user-login" class="nav-link" on:click={() => {
                            $access_token = ''
                            $username = ''
                            $is_login = false
                        }}>로그아웃 ({$username})</a>
                    </li>
                {:else}
                <!-- 로그아웃 상태 -->
                    <li class="nav-item">
                        <a use:link class="nav-link" href="/user-create">회원가입</a>
                    </li>
                    <li class="nav-item">
                        <a use:link class="nav-link" href="/user-login">로그인</a>
                    </li>
                {/if}
            </ul>
        </div>
    </div>
</nav>
