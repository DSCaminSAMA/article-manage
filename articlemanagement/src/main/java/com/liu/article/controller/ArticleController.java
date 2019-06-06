package com.liu.article.controller;

import com.liu.article.pojo.Article;
import com.liu.article.pojo.Reply;
import com.liu.article.pojo.Words;
import com.liu.article.service.ArticleService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import javax.servlet.http.HttpServletRequest;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

@Controller
@RequestMapping(value = "/article")
public class ArticleController {

    /**
     * 声明一个变量用于区分我访问的是文章管理界面还是回收站界面
     * 0.访问的是文章管理界面   1.表示访问的回收站界面
     */
    private int goId = 0;

    @Autowired
    private ArticleService articleService;

    @RequestMapping(value = "/toArticleWrite")
    public String toArticleWrite(){
        return "view/article/articleWrite";
    }

    @RequestMapping(value = "/toArticleManage")
    public String toArticleManage(){
        //表示访问的是文章管理界面
        goId = 0;
        return "redirect:findByPage.do";
    }

    @RequestMapping(value = "/toArticleTrash")
    public String toArticleTrash(){
        //表示访问的回收站界面
        goId = 1;
        return "redirect:findByPage.do";
    }

    @RequestMapping(value = "/saveArtcile")
    public String saveArtcile(Article article, Model model){
        try {
            articleService.saveArticle(article);
            model.addAttribute("message","文章添加成功");
            return "view/info/message";
        }catch (Exception e){
            e.printStackTrace();
        }
        return null;
    }

    /**
     * 分页查询
     * @param pageCode
     * @param pageSize
     * @param request
     * @param model
     * @return
     */
    @RequestMapping(value = "findByPage")
    public String findByPage(@RequestParam(value = "pageCode", defaultValue = "1", required = false) int pageCode,
                             @RequestParam(value = "pageSize", defaultValue = "3", required = false) int pageSize,
                             HttpServletRequest request,
                             Model model) {
        // 封装分页数据
        String verify = request.getParameter("r_verify");
        String publish = request.getParameter("r_publish");
        String status = request.getParameter("r_status");
        int r_verify = 0, r_publish = 0, r_status = 0;
        if (verify != null) {
            if (verify.equals("已审核")) {
                r_verify = 1;
            } else if (verify.equals("未审核")) {
                r_verify = 0;
            }
        }
        if (publish != null) {
            if (publish.equals("已发布")) {
                r_publish = 1;
            } else if (verify.equals("未发布")) {
                r_publish = 0;
            }
        }
        if (status != null) {
            if (status.equals("存在")) {
                r_status = 0;
            } else if (status.equals("已删除")) {
                r_status = 1;
            }
        }
        Map<String, Object> conMap = new HashMap<String, Object>();
        conMap.put("r_verify", r_verify);
        conMap.put("r_publish", r_publish);
        conMap.put("r_status", r_status);

        //把状态码也放入Map集合中
        conMap.put("goId", goId);

        //回显数据
        model.addAttribute("page", articleService.findByPage(pageCode, pageSize, conMap));
        if (goId == 1) {
            return "/view/article/articleTrash";
        }
        return "view/article/articleManage";
    }

    /**
     * 删除功能
     * @param r_id
     * @return
     */
    @RequestMapping(value = "/delete")
    public String delete(@RequestParam int r_id){
        articleService.delete(r_id);
        return "redirect:findByPage.do";
    }

    /**
     * 跳转到更新文章界面
     * @param r_id
     * @param model
     * @return
     */
    @RequestMapping(value = "toEditPage")
    public String toEditPage(@RequestParam int r_id,Model model){
        //先查询
        Article article = articleService.findById(r_id);
        if (article != null){
            model.addAttribute("article",article);
            return "view/article/articleUpdate";
        }else {
            return null;
        }
    }

    /**
     * 文章放入回收站(改变state的值)
     */
    @RequestMapping(value = "/clean")
    public String clean(@RequestParam int r_id){
        articleService.clean(r_id);
        return "redirect:findByPage.do";
    }

    /**
     * 恢复文章(从回收站中取出)
     * @param r_id
     * @return
     */
    @RequestMapping(value = "/restore")
    public String restore(@RequestParam int r_id){
        articleService.restore(r_id);
        return "redirect:/findByPage.do";
    }

    /**
     * 更新文章
     * @param article
     * @param model
     * @return
     */
    @RequestMapping(value = "/update")
    public String update(Article article,Model model){
        if (article != null){
            articleService.update(article);
            return "redirect:toArticleManage.do";
        }else {
            model.addAttribute("message","文章获取失败");
            return "view/info/message";
        }
    }

    @RequestMapping(value = "/saveWords")
    public String saveWords(Words words){
        if (words != null){
            String r_id = words.getLw_for_article_id();
            articleService.saveWords(words);
            return "redirect:toArticleView.do?r_id="+r_id;
        }else {
            return null;
        }
    }

    @RequestMapping(value = "/saveReply")
    public String saveReply(Reply reply){
        if (reply != null){
            articleService.saveReply(reply);
            String r_id = reply.getLr_for_article_id();
            return "redirect:toArticleView.do?r_id="+r_id;
        }else {
            return null;
        }
    }

    /**
     * 跳转到查询文章内容页面
     * @param r_id
     * @param model
     * @return
     */
    private List<Words> lw_list;
    private List<Reply> lr_list;
    @RequestMapping(value = "/toArticleView")
    public String toArticleView(@RequestParam int r_id,Model model){
        //封装留言信息
        lw_list = articleService.findByWords();
        model.addAttribute("lw_list",lw_list);

        //封装回复信息
        lr_list = articleService.findByReply();
        model.addAttribute("lr_list",lr_list);

        //查询文章信息
        Article article = articleService.findById(r_id);
        System.out.println("查询当前的文章ID为"+article.getR_id());
        if (article != null){
            model.addAttribute("article",article);
            return "view/article/articleView";
        }else {
            return null;
        }
    }
}
