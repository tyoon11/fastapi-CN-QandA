import qs from "qs"
import { access_token, username, is_login } from "./store"
import { get } from 'svelte/store'
import { push } from 'svelte-spa-router'

// fastapi 서버와의 http 요청을 처리하는 함수
const fastapi = (operation, url, params, success_callback, failure_callback) => {
    let method = operation
    let content_type = 'application/json'
    let body = JSON.stringify(params)

    // 로그인 요청 시 헤더의 Content-Type 및 body 포맷 변경
    if(operation === 'login') {
        method = 'post'
        content_type = 'application/x-www-form-urlencoded'
        body = qs.stringify(params)
    }

    // 서버 URL 생성
    let _url = import.meta.env.VITE_SERVER_URL+url
    if(method === 'get') {
        //  GET 요청의 경우 URL에 쿼리 파라미터 추가
        _url += "?" + new URLSearchParams(params)
    }
    // HTTP 요청 옵션 설정
    let options = {
        method: method,
        headers: {
            "Content-Type": content_type
        }
    }

    // Access Token이 있을 경우 Authorization 헤더에 추가
    const _access_token = get(access_token)
    if (_access_token) {
        options.headers["Authorization"] = "Bearer " + _access_token
    }
    
    // get 이외의 요청은 body를 포함
    if (method !== 'get') {
        options['body'] = body
    }

    // API 요청
    fetch(_url, options)
        .then(response => {
            if(response.status === 204) {  // No content
                if(success_callback) {
                    success_callback()
                }
                return
            }
            response.json()
                .then(json => {
                    if(response.status >= 200 && response.status < 300) {  // 성공 (200 ~ 299)
                        if(success_callback) {
                            success_callback(json)
                        }
                    }else if(operation !== 'login' && response.status === 401) { // 인증 실패(401)
                        // 인증 토큰 만료 시 처리
                        access_token.set('')
                        username.set('')
                        is_login.set(false)
                        alert("로그인이 필요합니다.")
                        push('/user-login')
                    }else {
                        // 실패 콜백 호출 또는 오류 알림
                        if (failure_callback) {
                            failure_callback(json)
                        }else {
                            alert(JSON.stringify(json))
                        }
                    }
                })
                .catch(error => {
                    // JSON 응답 처리 중 오류 발생 시
                    alert(JSON.stringify(error))
                })
        })
}

export default fastapi
