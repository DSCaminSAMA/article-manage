package com.liu.article.service;

import com.liu.article.pojo.Article;
import com.liu.article.pojo.PageBean;
import com.liu.article.pojo.Reply;
import com.liu.article.pojo.Words;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

public interface ArticleService {

    /**
     * 保存文章
     * @param article
     */
    void saveArticle(Article article);

    /**
     * 按照分业查找
     * @param map
     * @return
     */
    PageBean<Article> findByPage(int pageCode, int pageSize, Map<String,Object> conMap);

    /**
     *  按照回复编号查询
     * @param r_id
     */
    void delete(int r_id);

    /**
     * 更新文章
     * @param article
     */
    void update(Article article);

    /**
     * 查找回复Id
     * @param r_id
     * @return
     */
    Article findById(int r_id);

    /**
     * 删除所有回复
     * @param r_id
     */
    void clean(int r_id);

    void restore(int r_id);

    void saveWords(Words words);

    void saveReply(Reply reply);

    List<Words> findByWords();

    List<Reply> findByReply();

}
