#### 架构
1. RT需要使用FrameGraph的形式进行修改。目前postprocess尤其需要这个修改进行不同pass的引用；
2. 使用DeferredShading。目前的one pass deferred能够很好解决deferrd shading占用过多带宽的问题；

#### Bug


#### 优化：
1. 顶点压缩。
  1)使用四元数多normal/tangent/bitangent进行压缩；
  2)使用更多的16bit的顶点数据，以更大程度上压缩顶点占用的数量；
2. 着色器优化。尽可能使用mediump和lowp格式。目前默认全部都是highp格式；
3. 后处理优化
  1) Bloom目前的效果并不好；
  2) 后处理的DoF是时候要解决了。bgfx里面有一个one pass的DoF例子，非常值得参考；
  3) Color Grading需要用于调整颜色；
  4) tonemapping能够预先bake到一张贴图里面，而不需要单独在fragment阶段进行计算。具体要看filament里面的tonemapping的操作；
3. 水渲染；
4. 优化阴影，主要还是提高精度；//2022.09.29已经完成
5. 使用FXAA/TAA，解决bgfx在MSAA下，不同平台直接很多bug的问题。这个功能，很可能就会要求引擎需要延迟渲染的，one pass deferred在很多硬件上面是可行的；
6. ibl的计算应该直接烘培，不应该做在compute shader上；
7. 使用Hi-Z的方式进行剔除；
8. 使用compute shader将MSAA的深度resolve到普通的深度；
9. 增强阴影的效果，使用VSM实现软阴影，或对比使用PCF的效果；
10. 对相同材质的物体进行排序渲染，目前渲染顺序的提交，都是按照提交的先后次序来的。还需要单独对alpha test的物体进行分类（分类的队列顺序应该为：opaque->alpha test-> translucent）。而对于translucent的物体来讲，还需要根据从远到近的排序来渲染（避免alpha blend错误）；

#### 新功能/探索
1. SDF Shadow；
2. Visibility Buffer；
3. GI相关。SSGI，SSR和SDFGI等；
4. LOD；
5. 阴影的VSM；  //2022.09.29已经完成。但效果有待验证


