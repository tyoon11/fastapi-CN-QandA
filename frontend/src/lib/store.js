import { writable } from 'svelte/store'

// 로컬 스토리지와 연동되는 Svelte writable 스토어 생성
const persist_storage = (key, initValue) => {
    // 로컬 스토리지에서 초기값 가져오기
    const storedValueStr = localStorage.getItem(key)
    const store = writable(storedValueStr != null ? JSON.parse(storedValueStr) : initValue)
    
    // 값 변경 시 로컬 스토리지에 저장
    store.subscribe((val) => {
        localStorage.setItem(key, JSON.stringify(val))
    })
    return store
}


export const page = persist_storage("page", 1)
export const access_token = persist_storage("access_token", "")
export const username = persist_storage("username", "")
export const is_login = persist_storage("is_login", false)
export const keyword = persist_storage("keyword", "")