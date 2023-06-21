package com.whizlab_shop.util;

import lombok.NoArgsConstructor;

@NoArgsConstructor
public class Paging {

    int nowPage = 1;
    // 현재 위치한 페이지. 초기 화면에서는 제일 첫번째 페이지를 띄워야 하므로 1로 초기화 해 준다.

    int numPerPage = 10;
    // 페이지 하나에 보여져야 할 게시물의 수

    int totalCount = 0;
    // 총 게시물의 수.

    int pagePerBlock = 5;
    // 페이지 묶음. 다섯개 묶음이니까 < 1 2 3 4 5 > 로 나타난다.

    int totalPage = 0;
    // 전체 페이지 수. totalCount를 알고 있어야 구할 수 있다.

    int begin;
    // 한 페이지에서 시작될 글 번호.

    int end;
    // 한 페이지에서 끝날 글 번호.

    int startPage;
    // 페이지 블럭에서 시작하는 페이지. < 1 2 3 4 5 > 에선 1번이다.

    int endPage;
    // 페이지 블럭에서 끝나는 페이지. < 1 2 3 4 5 > 에선 5 번이다.

    public int getNowPage() {
        return nowPage;
    }

    public void setNowPage(int nowPage) {

        if(nowPage > totalPage) { // nowPage가 totalPage보다 크다면?
            nowPage = totalPage;
        }

        // 각 페이지의 시작과 끝 (begin, end) 을 지정한다.

        begin = (nowPage-1)*numPerPage+1;
        // 해석하면 시작하는 페이지가 1 이라면,
        // (1-1)*10(한 페이지에 보여야 할 게시글 갯수)+1 = 시작하는 숫자는 1
        end = nowPage*numPerPage;
        // 해석하면
        // 1 * 10 = 끝나는 숫자는 10

        // 시작하는 글 번호와 끝나는 글의 번호를 구했으니, startPage와 endPage를 구한다!

        startPage = ((nowPage-1)/pagePerBlock)*pagePerBlock+1;
        // 해석하면, 시작 페이지가 1 일 때
        // ((1-1)/5)*5+1 = 1
        endPage = startPage+pagePerBlock-1;
        // 1 + 5 - 1 = 5

        // 마지막으로, endPage이 totalPage보다 클 수 있으므로
        // 그럴 경우에는 endPage = totalPage 로 맞춰 준다.

        if(endPage > totalPage) {
            endPage = totalPage;
        }
    }

    public int getNumPerPage() {
        return numPerPage;
    }

    public void setNumPerPage(int numPerPage) {
        this.numPerPage = numPerPage;
    }

    public int getTotalCount() {
        return totalCount;
    }

    public void setTotalCount(int totalCount) {
        this.totalCount = totalCount;

        // 게시글의 갯수에 따라 페이지 수가 바뀌므로, 페이지 수를 설정해 준다.
        totalPage = (int)Math.ceil((double)totalCount/numPerPage);
        // 해석해 보면 totalCount = 101 이라는 가정하에
        // 101 (총 게시글 수) / 10 (한 페이지에 보여야 할 게시글 수) = 10.xxx
        // ceil 함수는 나머지 값이 있다면 무조건 올림을 해 주는 함수이므로,
        // totalPage = 11 이 저장된다.
    }

    public int getBegin() {
        return begin;
    }

    public void setBegin(int begin) {
        this.begin = begin;
    }

    public int getEnd() {
        return end;
    }

    public void setEnd(int end) {
        this.end = end;
    }

}
