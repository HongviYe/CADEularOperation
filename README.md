

# 基于B-rep的建模操作及其算法
上了高老师的cad课，高老师的课十几年来不变的大作业就是基于半边结构的5个欧拉操作和sweep扫成cad模型的实现，以下是高老师上课时讲的一些干货，brep的基础知识请自行百度。
## 欧拉操作
1. 欧拉公式
欧拉公式是基于初中的欧拉公式v-e+f=2的拓展，在有内环（洞）的时候也能成立，欧拉操作就是基于欧拉公式的操作
> v(`vertice`)-e(`edge`)+f(`front`)=2(s(`solid`)-h(`handle`穿透))+r(`内环`)    整体构造成5维超平面

2. 欧拉操作的基本思想
    
    * 提供一组$\underline{通用的完备的}$拓扑结构生成操作
    * 基于欧拉公式使其具有一定的$\underline{有效性}$    
3. 欧拉操作的选取

    | v | e | f | h | r | s | meaning |
    | ------ | ------ | ------ | ------ | ------ | ------ | ------ |
    | 1 | 1 | 0 | 0 | 0 | 0 | mev |
    | 0 | 1 | 1 | 0 | 0 | 0 | mef |
    | 1 | 0 | 1 | 0 | 0 | 1 | mvfs |
    | 0 | -1 | 0 | 0 | 1 | 0 | kemr |
    | 0 | 0 | -1 | 1 | 1 | 0 | kfmre |
    * 其中k=kill m=make vfs如上 
    * 有时s=split 
    * 增加一个操作semv
    * 每个操作都有一个逆操作 用k替换m用m替换k 总计12个操作
4. 欧拉操作的功能与实现
    以简单的两个操作为例：
    * mvfs
      * 构造一个体，外面和边，这里编程时注意，在构造一个无依赖边的点的时候也构造了一个空面和一个空体
      * lp->ledge=NULL
    * mev
      * 构造一个新点，和一个接新点和给定点的边
      * HalfEdge * mev（v1，lp） lp=loop
  有效性原则，使得新定义的半边与其所属环中的其他半边形成一个有向封闭的环。
  ## 数据结构
  本项目主要基于qt5开发
  图形交互界面
![在这里插入图片描述](https://img-blog.csdnimg.cn/20181128155812225.png?x-oss-process=image/watermark,type_ZmFuZ3poZW5naGVpdGk,shadow_10,text_aHR0cHM6Ly9ibG9nLmNzZG4ubmV0L3loZl9uYWl2ZQ==,size_16,color_FFFFFF,t_70)

