package com.liu.article.service.impl;

import com.liu.article.mapper.ArticleMapper;
import com.liu.article.pojo.Article;
import com.liu.article.pojo.PageBean;
import com.liu.article.pojo.Reply;
import com.liu.article.pojo.Words;
import com.liu.article.service.ArticleService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

@Service
public class ArticleServiceImpl implements ArticleService {

    @Autowired
    private ArticleMapper articleMapper;

    /**
     * 添加文章信息
     * @param article
     */
    @Override
    public void saveArticle(Article article) {
        articleMapper.saveArticle(article);
    }

    /**
     * 分业查询的方法
     * @param pageCode
     * @param pageSize
     * @param conMap
     * @return
     */
    @Override
    public PageBean<Article> findByPage(int pageCode, int pageSize, Map<String, Object> conMap) {
        HashMap<String,Object> map = new HashMap<String,Object>();
        PageBean<Article> pageBean = new PageBean<Article>();

        //获取Controller层封装的状态码
        Integer goId = (Integer)conMap.get("goId");

        //封装数据
        pageBean.setPageCode(pageCode);
        pageBean.setPageSize(pageSize);

        //封装总记录数
        int totalCount = 0;
        if(goId == 0){
            //访问的是文章列表页面
            totalCount = articleMapper.selectCount();
        }else if(goId == 1){
            //访问的是回收站页面
            totalCount = articleMapper.selectCount2();
        }
        pageBean.setTotalCount(totalCount);

        //封装总页数
        double tc = totalCount;
        Double num = Math.ceil(tc / pageSize);
        pageBean.setTotalPage(num.intValue());

        //设置limit起始位置和终止位置
        map.put("start",(pageCode - 1) * pageSize);
        map.put("size",pageBean.getPageSize());

        //封装每页显示的数据
        List<Article> list = articleMapper.findByPage(map);
        pageBean.setBeanList(list);

        for(Object obj : list){
            System.out.println(obj);
        }

        //条件查询的封装
        conMap.put("start",(pageCode - 1) * pageSize);
        conMap.put("size",pageBean.getPageSize());

        List<Article> conList = articleMapper.findConByPage(conMap);
        pageBean.setBeanList(conList);
        return pageBean;
    }

    /**
     * 删除功能
     * @param r_id 需要删除字段的Id值
     */
    @Override
    public void delete(int r_id) {
        articleMapper.delete(r_id);
    }

    /**
     * 更新用户的信息
     * @param article
     */
    @Override
    public void update(Article article) {
        articleMapper.update(article);
    }

    /**
     * 根据Id查询消息
     * @param r_id
     * @return
     */
    @Override
    public Article findById(int r_id) {
        return articleMapper.findById(r_id);
    }

    /**
     * 删除文章，把文章放回到回收站中
     * @param r_id
     */
    @Override
    public void clean(int r_id) {
        articleMapper.clean(r_id);
    }

    /**
     * 恢复文章信息功能
     * @param r_id
     */
    @Override
    public void restore(int r_id) {
        articleMapper.restore(r_id);
    }

    /**
     * 保存留言信息功能
     * @param words
     */
    @Override
    public void saveWords(Words words) {
        articleMapper.saveWords(words);
    }

    /**
     * 保存回复信息内容
     * @param reply
     */
    @Override
    public void saveReply(Reply reply) {
        articleMapper.saveReply(reply);
    }

    /**
     * 查询所有留言信息
     * @return
     */
    @Override
    public List<Words> findByWords() {
        return articleMapper.findByWords();
    }

    /**
     * 查询所有的回复信息
     * @return
     */
    @Override
    public List<Reply> findByReply() {
        return articleMapper.findByReply();
    }
}
