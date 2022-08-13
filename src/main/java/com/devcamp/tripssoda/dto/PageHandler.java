package com.devcamp.tripssoda.dto;

import org.apache.ibatis.type.Alias;

@Alias("PageHandler")
public class PageHandler {

    private SearchCondition sc;

    private int totalCnt; //총 게시물 갯수
    private int naviSize = 10; //페이지 네이게이션의 크기
    private int totalPage; //전체 페이지의 갯수
    private int beginPage; //네이게이션의 첫번째 페이지
    private int endPage; //네비게이션의 마지막 페이지
    private boolean showPrev; //이전 페이지로 이동하는 링크를 보여줄 것인지의 여부
    private boolean showNext; //다음 페이지로 이동하는 링크를 보여줄 것인지의 여부

    public PageHandler(int totalCnt, SearchCondition sc){
        this.totalCnt = totalCnt;
        this.sc = sc;

        doPaging(totalCnt, sc);
    }

    public void doPaging(int totalCnt, SearchCondition sc){
        this.totalCnt = totalCnt;

        totalPage = (int)Math.ceil(totalCnt/(double)sc.getPageSize());
        beginPage = (sc.getPage()-1)/naviSize*naviSize+1;
        endPage = Math.min(beginPage+naviSize-1, totalPage);
        showPrev = beginPage!=1;
        showNext = endPage!=totalPage;
    }

    void print(){
        System.out.println("page = " + sc.getPage());
        System.out.print(showPrev? "[PREV]" : "");
        for(int i=beginPage; i<=endPage; i++){
            System.out.print(i+" ");
        }
        System.out.println(showNext? " [NEXT]" : "");
    }

    public SearchCondition getSc() {
        return sc;
    }

    public void setSc(SearchCondition sc) {
        this.sc = sc;
    }

    public int getTotalCnt() {
        return totalCnt;
    }

    public void setTotalCnt(int totalCnt) {
        this.totalCnt = totalCnt;
    }

    public int getNaviSize() {
        return naviSize;
    }

    public void setNaviSize(int naviSize) {
        this.naviSize = naviSize;
    }

    public int getTotalPage() {
        return totalPage;
    }

    public void setTotalPage(int totalPage) {
        this.totalPage = totalPage;
    }

    public int getBeginPage() {
        return beginPage;
    }

    public void setBeginPage(int beginPage) {
        this.beginPage = beginPage;
    }

    public int getEndPage() {
        return endPage;
    }

    public void setEndPage(int endPage) {
        this.endPage = endPage;
    }

    public boolean isShowPrev() {
        return showPrev;
    }

    public void setShowPrev(boolean showPrev) {
        this.showPrev = showPrev;
    }

    public boolean isShowNext() {
        return showNext;
    }

    public void setShowNext(boolean showNext) {
        this.showNext = showNext;
    }

    @Override
    public String toString() {
        return "PageHandler{" +
                "sc=" + sc +
                ", totalCnt=" + totalCnt +
                ", naviSize=" + naviSize +
                ", totalPage=" + totalPage +
                ", beginPage=" + beginPage +
                ", endPage=" + endPage +
                ", showPrev=" + showPrev +
                ", showNext=" + showNext +
                '}';
    }
}
