/*
 Navicat Premium Data Transfer

 Source Server         : hqy
 Source Server Type    : MySQL
 Source Server Version : 80025
 Source Host           : localhost:3306
 Source Schema         : bio

 Target Server Type    : MySQL
 Target Server Version : 80025
 File Encoding         : 65001

 Date: 18/01/2023 09:25:19
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for algorithm
-- ----------------------------
DROP TABLE IF EXISTS `algorithm`;
CREATE TABLE `algorithm` (
  `aid` int NOT NULL AUTO_INCREMENT,
  `anameCN` char(100) NOT NULL,
  `anameEN` char(100) NOT NULL,
  `aintro` text NOT NULL,
  `alink` char(100) NOT NULL,
  `atype` char(50) NOT NULL,
  `id` int NOT NULL,
  PRIMARY KEY (`aid`),
  KEY `id` (`id`),
  CONSTRAINT `algorithm_ibfk_1` FOREIGN KEY (`id`) REFERENCES `problem` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=14 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- ----------------------------
-- Records of algorithm
-- ----------------------------
BEGIN;
INSERT INTO `algorithm` VALUES (1, '隐马尔可夫模型', 'HMM', '隐马尔可夫模型（Hidden Markov Model，HMM）是统计模型，它用来描述一个含有隐含未知参数的马尔可夫过程。其难点是从可观察的参数中确定该过程的隐含参数。然后利用这些参数来作进一步的分析，例如模式识别。', 'https://github.com/tostq/Easy_HMM', '寻找最优序列', 1);
INSERT INTO `algorithm` VALUES (2, '矩阵作图法', 'Dot Matrix', '利用数学上矩阵的形式表示因素间的相互关系，从中探索问题所在并得出解决问题的设想。它是进行多元思考，分析问题的方法。矩阵图法就是从多维问题的事件中，找出成对的因素，排列成矩阵图，然后根据矩阵图来分析问题，确定关键点的方法，它是一种通过多因素综合思考，探索问题的好方法。在复杂的质量问题中，往往存在许多成对的质量因素，将这些成对因素找出来，分别排列成行和列，其交点就是其相互关联的程度，在此基础上再找出存在的问题及问题的形态，从而找到解决问题的思路。', 'https://github.com/SummerChaser/DotMatrix/', '两两比对', 1);
INSERT INTO `algorithm` VALUES (3, '滑动窗口法', 'Slide Window Technique', '滑动窗口算法的本质是双指针法中的左右指针法，所谓滑动窗口，就像描述的那样，可以理解成是一个会滑动的窗口，每次记录下窗口的状态，再找出符合条件的适合的窗口。它可以将双层嵌套的循环问题，转换为单层遍历的循环问题。使用两个指针一左一右构成一个窗口，就可以将二维循环的问题转化成一维循环一次遍历，相当于通过旧有的计算结果对搜索空间进行剪枝，使时间复杂度从O(n²)降低至O(n)，比如经典字符串查找算法Rabin-Karp 指纹字符串查找算法，它本质上也使用了滑动窗口的思想，通过公式推导降低窗口滑动时计算子串哈希值的复杂度。', 'https://blog.csdn.net/qq_39559641/article/details/122793321', '两两比对', 1);
INSERT INTO `algorithm` VALUES (4, '全局比对', 'Global Alignment', '全局比对是指将参与比对的两条序列里面的所有字符进行比对。全局比对在全局范围内对两条序列进行比对打分，找出最佳比对，主要被用来寻找关系密切的序列。其可以用来鉴别或证明新序列与已知序列家族的同源性，是进行分子进化分析的重要前提。其代表是Needleman-Wunsch算法。', 'https://blog.csdn.net/qq_51287641/article/details/125402548', '两两比对', 1);
INSERT INTO `algorithm` VALUES (5, '局部比对', 'Subsequence and Global Sequence Alignment', '与全局比对不同，局部比对不必对两个完整的序列进行比对，而是在每个序列中使用某些局部区域片段进行比对。其产生的需求在于、人们发现有的蛋白序列虽然在序列整体上表现出较大的差异性，但是在某些局部区域能独立的发挥相同的功能，序列相当保守。这时候依靠全局比对明显不能得到这些局部相似序列的。其次，在真核生物的基因中，内含子片段表现出了极大变异性，外显子区域却较为保守，这时候全局比对表现出了其局限性，无法找出这些局部相似性序列。其代表是Smith-Waterman局部比对算法。', 'https://blog.csdn.net/EricFrenzy/article/details/120181001', '两两比对', 1);
INSERT INTO `algorithm` VALUES (6, '最大相似子序列比对', 'Maximum Similarity Subsequence Alignment', '搜索最大相似子序列的最佳对齐，搜索矩阵中的最大值这是局部对齐的最佳分数该分数对应于局部对齐的终点返回优化路径，直到开始局部对齐', 'https://blog.csdn.net/m0_55726560/article/details/119375478', '两两比对', 1);
INSERT INTO `algorithm` VALUES (7, '准全局比对', 'Quasi Global Alignment', '准全局比较就是在评价序列比对时不计终端“空缺”（end space，或空位）的得分或代价 。（1）第一行初始值为“0”，表示不计第一个序列的前端空位；（2）寻找最后一行的最大值，表示不计第一个序列的末端空位；（3）第一列初始值为“0”，表示不计第二个序列的前端空位；（4）寻找最后一列的最大值，表示不计第二个序列的末端空位。', 'https://www.jianshu.com/p/4eb9173b8790', '两两比对', 1);
INSERT INTO `algorithm` VALUES (8, '星形比对', 'Star Alignment', '星形比对的基本思想是：在给定的若干序列中，选择一个核心序列，通过该序列与其它序列的两两比对形成所有序列的多重比对a，从而使得a在核心序列和任何一个其它序列方向的投影是最优的两两比对。利用标准的动态规划方法求出所有si和sc的最优两两比对', 'https://blog.csdn.net/weixin_35687240/article/details/117209448', '多序列比对', 1);
INSERT INTO `algorithm` VALUES (9, '贪婪算法', 'Greedy Algorithm', '贪婪算法通过简化覆盖多图，对每一对顶点仅考虑权值最大的边，而去掉其它的边。称经过处理后的新图为F的覆盖图，记为OG（F），贪婪算法的核心思想就是逐步加入满足哈密顿路径条件的最大权值的边', 'https://blog.csdn.net/RUSHXB/article/details/121091411', '片段组装', 2);
INSERT INTO `algorithm` VALUES (10, '拓扑算法', 'Topology Order Algorithm', '拓扑算法利用非循环子图求解哈密顿路径生成节点的拓扑排序，给定一个序列片段集合F和一个非负整数t，在原来覆盖图OG（F）中仅保留权值大于等于t的有向边，形成一个新图OG（F，t）。', 'https://blog.csdn.net/qq_43868654/article/details/115053429', '片段组装', 2);
INSERT INTO `algorithm` VALUES (11, '连锁聚类方法', 'Linkage Clustering', '连锁聚类方法选择距离最小的一对序列将这两个序列合二为一，形成一个新的对象（代表这两个序列的祖先）重新计算这个新的对象与其它序列的距离。', 'https://zhuanlan.zhihu.com/p/562813963?utm_id=0', '绘制进化树', 3);
INSERT INTO `algorithm` VALUES (12, '邻近归并法', 'Neighbor Joining Method', '邻近归并法基本思想：在进行类的合并时，不仅要求待合并的类是相近的，同时还要求待合并的类远离其它的类。重建时将距离最小的两个叶节点连接起来，合并这两个叶节点所代表的分类，形成一个新的分类。在树中增加一个父节点，并在距离矩阵中加入新的分类，同时删除原来的两个分类。重复上一次循环, 直到只剩一个类为止。', 'https://blog.csdn.net/m0_49960764/article/details/121495721', '绘制进化树', 3);
INSERT INTO `algorithm` VALUES (13, '最大简约法', 'Maximum Parsimony', '最大简约法目标：构造一棵反映分类单元之间最小变化的系统发生树。所谓简约就是使代价最小。对于系统发生树最直观的代价计算就是沿着各个分支累加特征变化的数目。', 'https://www.gaptech.cn/docs/423bab37-25bb-49bc-8ff3-e54ae75023ba/', '绘制进化树', 3);
COMMIT;

-- ----------------------------
-- Table structure for lab
-- ----------------------------
DROP TABLE IF EXISTS `lab`;
CREATE TABLE `lab` (
  `lid` int NOT NULL AUTO_INCREMENT,
  `lname` char(100) NOT NULL,
  `lintro` text NOT NULL,
  `llink` char(100) NOT NULL,
  PRIMARY KEY (`lid`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- ----------------------------
-- Records of lab
-- ----------------------------
BEGIN;
INSERT INTO `lab` VALUES (1, 'The Howard Hughes Medical Institute', 'As a nonprofit research organization and philanthropy, HHMI’s mission is to advance the discovery and sharing of scientific knowledge to benefit us all. We employ scientists, provide research and education grants, offer free classroom resources, and share stories of science with audiences worldwide. Across all our work, we encourage talented scientists, educators, and students to stay curious, pursue tough scientific questions, and contribute to making science more inclusive.', 'https://www.hhmi.org/');
INSERT INTO `lab` VALUES (2, 'Department of Biological Sciences, Cork Institute of Technology', 'The department has a number of strategically important research programmes which are operated through the bio-explore research centre located at create.', 'https://biologicalsciences.cit.ie/');
INSERT INTO `lab` VALUES (3, 'Algorithmic Bioinformatics, Heinrich Heine University Düsseldorf', 'The research group Algorithmic Bioinformatics develops data-driven mathematical models and algorithmic methods to better understand biological processes. The work is highly interdisciplinary and is characterized by cooperations with both experimental partners and colleagues within computer science. We currently focus on the following topics: Algorithmic Genomics: Assemblies, Haplotypes and genetic variation; Microbial metagenomics; Analysis of functional genetics screens; Algorithmic Systems Biology: Network biology, Learning logic models; Algorithmic Cheminformatics: Molecular graph models. On the practical side, our focus is on dealing with large data sets and on developing automated and robust analysis pipelines.', 'https://www.cs.hhu.de/en/research-groups/algorithmic-bioinformatics');
INSERT INTO `lab` VALUES (4, 'State Key Laboratory of Agrobiotechnology (CUHK)', 'The Chinese University of Hong Kong has obtained approval from the Ministry of Science and Technology of China to set up the State Key Laboratory of Agrobiotechnology (CUHK) in 2008, a national level laboratory with outstanding research strength. The State Key Laboratory of Agrobiotechnology (SKLA) aims to build a World Class International Research Center in China with mission to uplift China\'s agricultural technology, increase agricultural productivity, safeguard national food security, and improve people\'s nutrition. By combining the strength of modern biotechnology and the traditional wisdom of breeders and farmers, we pledge to serve the society by generating new knowledge, producing novel technological platforms, products, and training high caliber technologists and thereby boosting technical reserves and agricultural productivity in China and beyond.', 'https://skla.cuhk.edu.hk/');
INSERT INTO `lab` VALUES (5, 'Cornell Institute of Biotechnology', 'The mission of the Cornell Institute of Biotechnology (CIB) is to promote research and catalyze entrepreneurial activities in the life sciences. The CIB serves as the hub of Cornell’s biotechnology and life science ecosystem, and helps foster its growth and development by relying on three important pillars: our people, our core facilities, and commercialization expertise.', 'https://www.biotech.cornell.edu/');
INSERT INTO `lab` VALUES (6, 'UConn Health', 'The faculty of the Department of Public Health Sciences are involved in research and scholarship in 5 broad public health areas: Epidemiology, International Public Health, Public Policy, Addictions/Addiction Interventions (including alcohol use on campus), and Health Psychology. Across these 5 public health areas departmental faculty and students investigate cancer, cardiovascular disease, diabetes, chronic pain, addictions and sexual health. The Department’s research is funded by federal, state, local and private sources including the National Institutes of Health (NIDA, NIAAA, NIMH, NIEHS), Centers for Disease Control and Prevention, Substance Abuse and Mental Health Services Administration, the State of Connecticut Departments of Children and Families (DCF), Public Health (DPH) and Mental Health and Addiction Services (DMHAS), Arthritis Foundation, Robert Wood Johnson Foundation, and the Macy Foundation. The List of Recent Publications.pdf reveal the breadth and depth of intra-departmental collaborations and the Department’s work with universities nationally and internationally. During 2017 and 2018, the Department’s faculty have published 150 articles in peer reviewed journals, along with letters and editorials that have appeared in high impact journals such as Nature, Science, JAMA, Lancet and the American Journal of Public Health. The Department manages the editorial offices of two peer-reviewed journals (Journal of Studies on Alcohol and Drugs and Journal of Personality). It also provides considerable amounts of consultation to national and international health agencies through contractual work with the World Health Organization and the Pan American Health Organization.', 'https://health.uconn.edu/');
COMMIT;

-- ----------------------------
-- Table structure for paper
-- ----------------------------
DROP TABLE IF EXISTS `paper`;
CREATE TABLE `paper` (
  `pid` int NOT NULL AUTO_INCREMENT,
  `pname` char(200) NOT NULL,
  `author` char(200) NOT NULL,
  `publisher` char(100) NOT NULL,
  `abstract` text CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `pdate` date NOT NULL,
  `citation` int NOT NULL,
  `plink` char(100) NOT NULL,
  `id` int NOT NULL,
  `aid` int NOT NULL,
  PRIMARY KEY (`pid`),
  KEY `id` (`id`),
  KEY `aid` (`aid`),
  CONSTRAINT `paper_ibfk_1` FOREIGN KEY (`id`) REFERENCES `problem` (`id`),
  CONSTRAINT `paper_ibfk_2` FOREIGN KEY (`aid`) REFERENCES `algorithm` (`aid`)
) ENGINE=InnoDB AUTO_INCREMENT=14 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- ----------------------------
-- Records of paper
-- ----------------------------
BEGIN;
INSERT INTO `paper` VALUES (1, 'What is a hidden Markov model?', 'Sean R Eddy', 'Nature biotechnology', 'Statistical models called hidden Markov models are a recurring theme in computational biology. What are hidden Markov models, and why are they so useful for so many different problems?', '2004-10-01', 580, 'https://rdcu.be/c3vAD', 1, 1);
INSERT INTO `paper` VALUES (2, 'An Overview of Multiple Sequence Alignments and Cloud Computing in Bioinformatics', 'Daugelaite, Jurate, Aisling O\'Driscoll, Roy D. Sleator', 'International Scholarly Research Notices', 'Multiple sequence alignment (MSA) of DNA, RNA, and protein sequences is one of the most essential techniques in the fields of molecular biology, computational biology, and bioinformatics. Next-generation sequencing technologies are changing the biology landscape, flooding the databases with massive amounts of raw sequence data. MSA of ever-increasing sequence data sets is becoming a significant bottleneck. In order to realise the promise of MSA for large-scale sequence data sets, it is necessary for existing MSA algorithms to be run in a parallelised fashion with the sequence data distributed over a computing cluster or server farm. Combining MSA algorithms with cloud computing technologies is therefore likely to improve the speed, quality, and capability for MSA to handle large numbers of sequences. In this review, multiple sequence alignments are discussed, with a specific focus on the ClustalW and Clustal Omega algorithms. Cloud computing technologies and concepts are outlined, and the next generation of cloud base MSA algorithms is introduced.', '2013-07-23', 121, 'https://doi.org/10.1155/2013/615630', 1, 2);
INSERT INTO `paper` VALUES (3, 'iPromoter-2L2.0: Identifying Promoters and Their Types by Combining Smoothing Cutting Window Algorithm and Sequence-Based Features', 'Liu, Bin, and Kai Li', 'Molecular Therapy-Nucleic Acids', 'Promoters are short regions at specific locations of DNA sequences, which are playing key roles in directing gene transcription. They can be grouped into six types. Recently, a predictor called “iPromoter-2L” was constructed to predict the promoters and their six types, which is the first approach to predict all the six types of promoters. However, its predictive quality still needs to be further improved for real-world application requirement. In this study, we proposed the smoothing cutting window algorithm to find the window fragments of the DNA sequences based on the conservation scores to capture the sequence patterns of promoters. For each window fragment, the discriminative features were extracted by using kmer and PseKNC. Combined with support vector machines (SVMs), different predictors were constructed and then clustered into several groups based on their distances. Finally, a new predictor called iPromoter-2L2.0 was constructed to identify the promoters and their six types, which was developed by ensemble learning based on the key predictors selected from the cluster groups. The results showed that iPromoter-2L2.0 outperformed other existing methods for both promoter prediction and identification of their six types, indicating that iPromoter-2L2.0 will be helpful for genomics analysis.', '2019-12-06', 60, 'https://doi.org/10.1016/j.omtn.2019.08.008', 1, 3);
INSERT INTO `paper` VALUES (4, 'A review of protein–protein interaction network alignment: From pathway comparison to global alignment', 'Ma, Cheng-Yu, and Chung-Shou Liao.', ' Computational and Structural Biotechnology Journal', 'Network alignment provides a comprehensive way to discover the similar parts between molecular systems of different species based on topological and biological similarity. With such a strong basis, one can do comparative studies at a systems level in the field of computational biology. In this survey paper, we focus on protein–protein interaction networks and review some representative algorithms for network alignment in the past two decades as well as the state-of-the-art aligners. We also introduce the most popular evaluation measures in the literature to benchmark the performance of these approaches. Finally, we address several future challenges and the possible ways to conquer the existing problems of biological network alignment.', '2020-09-18', 18, 'https://doi.org/10.1016/j.csbj.2020.09.011', 1, 4);
INSERT INTO `paper` VALUES (5, 'LAWS: Local alignment for water sites—Tracking ordered water in simulations', 'Klyshko, Eugene, Justin Sung-Ho Kim, and Sarah Rauscher.', 'bioRxiv', 'Protein solvation plays a crucial role in protein function; accurate modeling of protein-water interactions is important for understanding the molecular basis of protein function. In addition to protein structure, x-ray crystallography provides positions of crystallographic water sites (CWS) coordinated by the protein, which can serve as a strong benchmark for modeling accuracy. Such comparison requires special method-ological considerations that take into account the dynamic nature of proteins. However, existing methods for analyzing CWS in MD simulations rely on global alignment of the protein onto the crystal structure, which introduces substantial errors in the case of significant structural deviations. Here, we propose a method called local alignment for water sites (LAWS), which is based on multilateration — an algorithm widely used in GPS tracking. LAWS considers the contacts formed by CWS and protein atoms in the crystal structure and uses these interaction distances to track the CWS in a simulation. LAWS provides a framework to quantify how perturbations of the local protein environment affect the preservation of crystallographic waters in simulations. We applied our method to a 1 µs simulation of a protein crystal and demonstrate that 76% of CWS are preserved. Compared to existing methods, LAWS identifies more high-confidence (low B-factor) CWS, which are characterized by more prominent water density peaks and a less-perturbed protein environment.', '2022-09-17', 0, 'https://doi.org/10.1016/j.bpj.2022.09.012', 1, 5);
INSERT INTO `paper` VALUES (6, 'Using the longest run subsequence problem within homology-based scaffolding', 'Sven Schrinner, Manish Goel, Michael Wulfert, Philipp Spohr, Korbinian Schneeberger & Gunnar W. Klau', 'Algorithms for Molecular Biology', 'Genome assembly is one of the most important problems in computational genomics. Here, we suggest addressing an issue that arises in homology-based scaffolding, that is, when linking and ordering contigs to obtain larger pseudo-chromosomes by means of a second incomplete assembly of a related species. The idea is to use alignments of binned regions in one contig to find the most homologous contig in the other assembly. We show that ordering the contigs of the other assembly can be expressed by a new string problem, the longest run subsequence problem (LRS). We show that LRS is NP-hard and present reduction rules and two algorithmic approaches that, together, are able to solve large instances of LRS to provable optimality. All data used in the experiments as well as our source code are freely available. We demonstrate its usefulness within an existing larger scaffolding approach by solving realistic instances resulting from partial Arabidopsis thaliana assemblies in short computation time.', '2022-06-28', 0, 'https://doi.org/10.1186/s13015-021-00191-8', 1, 6);
INSERT INTO `paper` VALUES (7, 'Spectral Jaccard Similarity: A New Approach to Estimating Pairwise Sequence Alignments', 'Tavor Z.Baharav, Govinda M.Kamath, David N.Tse, Ilan Shomorony', 'Patterns', 'Pairwise sequence alignment is often a computational bottleneck in genomic analysis pipelines, particularly in the context of third-generation sequencing technologies. To speed up this process, the pairwise k-mer Jaccard similarity is sometimes used as a proxy for alignment size in order to filter pairs of reads, and min-hashes are employed to efficiently estimate these similarities. However, when the k-mer distribution of a dataset is significantly non-uniform (e.g., due to GC biases and repeats), Jaccard similarity is no longer a good proxy for alignment size. In this work, we introduce a min-hash-based approach for estimating alignment sizes called Spectral Jaccard Similarity, which naturally accounts for uneven k-mer distributions. The Spectral Jaccard Similarity is computed by performing a singular value decomposition on a min-hash collision matrix. We empirically show that this new metric provides significantly better estimates for alignment sizes, and we provide a computationally efficient estimator for these spectral similarity scores.', '2020-09-11', 11, 'https://doi.org/10.1016/j.patter.2020.100081', 1, 7);
INSERT INTO `paper` VALUES (8, 'Molecular basis of bacterial resistance to chloramphenicol and florfenicol', 'Stefan Schwarz, Corinna Kehrenberg, Benoît Doublet, Axel Cloeckaert', 'FEMS microbiology reviews', 'Chloramphenicol (Cm) and its fluorinated derivative florfenicol (Ff) represent highly potent inhibitors of bacterial protein biosynthesis. As a consequence of the use of Cm in human and veterinary medicine, bacterial pathogens of various species and genera have developed and/or acquired Cm resistance. Ff is solely used in veterinary medicine and has been introduced into clinical use in the mid-1990s. Of the Cm resistance genes known to date, only a small number also mediates resistance to Ff. In this review, we present an overview of the different mechanisms responsible for resistance to Cm and Ff with particular focus on the two different types of chloramphenicol acetyltransferases (CATs), specific exporters and multidrug transporters. Phylogenetic trees of the different CAT proteins and exporter proteins were constructed on the basis of a multisequence alignment. Moreover, information is provided on the mobile genetic elements carrying Cm or Cm/Ff resistance genes to provide a basis for the understanding of the distribution and the spread of Cm resistance – even in the absence of a selective pressure imposed by the use of Cm or Ff.', '2004-11-28', 778, 'https://doi.org/10.1016/j.femsre.2004.04.001', 1, 8);
INSERT INTO `paper` VALUES (9, 'A greedy algorithm for aligning DNA sequences', 'Zheng Zhang, Scott Schwartz, Lukas Wagner, and Webb Miller', 'Journal of Computational biology', 'For aligning DNA sequences that differ only by sequencing errors, or by equivalent errors from other sources, a greedy algorithm can be much faster than traditional dynamic programming approaches and yet produce an alignment that is guaranteed to be theoretically optimal. We introduce a new greedy alignment algorithm with particularly good performance and show that it computes the same alignment as does a certain dynamic programming algorithm, while executing over 10 times faster on appropriate data. An implementation of this algorithm is currently used in a program that assembles the UniGene database at the National Center for Biotechnology Information.', '2004-07-05', 5510, 'https://doi.org/10.1089/10665270050081478', 2, 9);
INSERT INTO `paper` VALUES (10, 'Reconstructing the maize leaf regulatory network using ChIP-seq data of 104 transcription factors', 'Xiaoyu Tu, María Katherine Mejía-Guerra, Jose A. Valdes Franco, David Tzeng, Po-Yu Chu, Wei Shen, Yingying Wei, Xiuru Dai, Pinghua Li, Edward S. Buckler & Silin Zhong', 'Nature communications', 'The transcription regulatory network inside a eukaryotic cell is defined by the combinatorial actions of transcription factors (TFs). However, TF binding studies in plants are too few in number to produce a general picture of this complex network. In this study, we use large-scale ChIP-seq to reconstruct it in the maize leaf, and train machine-learning models to predict TF binding and co-localization. The resulting network covers 77% of the expressed genes, and shows a scale-free topology and functional modularity like a real-world network. TF binding sequence preferences are conserved within family, while co-binding could be key for their binding specificity. Cross-species comparison shows that core network nodes at the top of the transmission of information being more conserved than those at the bottom. This study reveals the complex and redundant nature of the plant transcription regulatory network, and sheds light on its architecture, organizing principle and evolutionary trajectory.', '2020-10-09', 69, 'https://doi.org/10.1038/s41467-020-18832-8', 2, 10);
INSERT INTO `paper` VALUES (11, 'Efficient Record Linkage Algorithms Using Complete Linkage Clustering', 'Mamun, Abdullah-Al, Robert Aseltine, and Sanguthevar Rajasekaran', 'PloS one', 'Data from different agencies share data of the same individuals. Linking these datasets to identify all the records belonging to the same individuals is a crucial and challenging problem, especially given the large volumes of data. A large number of available algorithms for record linkage are prone to either time inefficiency or low-accuracy in finding matches and non-matches among the records. In this paper we propose efficient as well as reliable sequential and parallel algorithms for the record linkage problem employing hierarchical clustering methods. We employ complete linkage hierarchical clustering algorithms to address this problem. In addition to hierarchical clustering, we also use two other techniques: elimination of duplicate records and blocking. Our algorithms use sorting as a sub-routine to identify identical copies of records. We have tested our algorithms on datasets with millions of synthetic records. Experimental results show that our algorithms achieve nearly 100% accuracy. Parallel implementations achieve almost linear speedups. Time complexities of these algorithms do not exceed those of previous best-known algorithms. Our proposed algorithms outperform previous best-known algorithms in terms of accuracy consuming reasonable run times.', '2016-04-28', 28, 'https://doi.org/10.1371/journal.pone.0154446', 3, 11);
INSERT INTO `paper` VALUES (12, 'The neighbor-joining method: a new method for reconstructing phylogenetic trees', 'Saitou, Naruya, and Masatoshi Nei', 'Molecular biology and evolution', 'A new method called the neighbor-joining method is proposed for reconstructing phylogenetic trees from evolutionary distance data. The principle of this method is to find pairs of operational taxonomic units (OTUs [= neighbors]) that minimize the total branch length at each stage of clustering of OTUs starting with a starlike tree. The branch lengths as well as the topology of a parsimonious tree can quickly be obtained by using this method. Using computer simulation, we studied the efficiency of this method in obtaining the correct unrooted tree in comparison with that of five other tree-making methods: the unweighted pair group method of analysis, Farris\'s method, Sattath and Tversky\'s method, Li\'s method, and Tateno et al.\'s modified Farris method. The new, neighbor-joining method and Sattath and Tversky\'s method are shown to be generally better than the other methods.', '1987-07-04', 67923, 'https://doi.org/10.1093/oxfordjournals.molbev.a040454', 3, 12);
INSERT INTO `paper` VALUES (13, 'Building phylogenetic trees from molecular data with MEGA', 'Hall, Barry G', 'Molecular biology and evolution', 'Phylogenetic analysis is sometimes regarded as being an intimidating, complex process that requires expertise and years of experience. In fact, it is a fairly straightforward process that can be learned quickly and applied effectively. This Protocol describes the several steps required to produce a phylogenetic tree from molecular data for novices. In the example illustrated here, the program MEGA is used to implement all those steps, thereby eliminating the need to learn several programs, and to deal with multiple file formats from one step to another (Tamura K, Peterson D, Peterson N, Stecher G, Nei M, Kumar S. 2011. MEGA5: molecular evolutionary genetics analysis using maximum likelihood, evolutionary distance, and maximum parsimony methods. Mol Biol Evol. 28:2731–2739). The first step, identification of a set of homologous sequences and downloading those sequences, is implemented by MEGA\'s own browser built on top of the Google Chrome toolkit. For the second step, alignment of those sequences, MEGA offers two different algorithms: ClustalW and MUSCLE. For the third step, construction of a phylogenetic tree from the aligned sequences, MEGA offers many different methods. Here we illustrate the maximum likelihood method, beginning with MEGA\'s Models feature, which permits selecting the most suitable substitution model. Finally, MEGA provides a powerful and flexible interface for the final step, actually drawing the tree for publication. Here a step-by-step protocol is presented in sufficient detail to allow a novice to start with a sequence of interest and to build a publication-quality tree illustrating the evolution of an appropriate set of homologs of that sequence. MEGA is available for use on PCs and Macs from www.megasoftware.net.', '2013-05-30', 1230, 'https://doi.org/10.1093/molbev/mst012', 3, 13);
COMMIT;

-- ----------------------------
-- Table structure for problem
-- ----------------------------
DROP TABLE IF EXISTS `problem`;
CREATE TABLE `problem` (
  `id` int NOT NULL AUTO_INCREMENT,
  `problem_name` char(50) NOT NULL,
  `pintro` text NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- ----------------------------
-- Records of problem
-- ----------------------------
BEGIN;
INSERT INTO `problem` VALUES (1, 'Sequence Alignment', 'Sequence Alignment是利用特定的数学模型或者是算法，找到两个或多个序列之间的最大匹配的碱基数或氨基酸残基数，其结果反映了序列之间的相似性关系以及他们的生物学特征。推断序列之间在结构、功能和进化方面的关系。其意义是分析序列之间在单个核苷酸或氨基酸水平上的相似性和差异性。基因预测，分析基因或蛋白质的功能，分析物种进化，检测突变、插⼊或缺失。');
INSERT INTO `problem` VALUES (2, 'Genome Assembly', 'genome assembly使⽤测序⽅法将待测物种的基因组⽣成序列⽚段（即read），并根据reads 之间的重叠区域对⽚段进⾏拼接，先拼接成较⻓的连续序列（contig），再将contigs 拼接成更⻓的允许包含空⽩序列（gap）的scaffolds，通过消除scaffolds 的错误和gaps，将这些scaffolds 定位到染⾊体上，从⽽得到⾼质量的全基因组序列。');
INSERT INTO `problem` VALUES (3, 'Evolutionary Trees', 'Evolutionary Trees进化树在生物学中，用来表示物种之间的进化关系。生物分类学家和进化论者根据各类生物间的亲缘关系的远近，把各类生物安置在有分枝的树状的图表上，简明地表示生物的进化历程和亲缘关系。在进化树上每个叶子结点代表一个物种，如果每一条边都被赋予一个适当的权值，那么两个叶子结点之间的最短距离就可以表示相应的两个物种之间的差异程度。根据蛋白质的序列或结构差异关系可构建分子进化树(evolutionary tree)或种系发生树(phylogenetic tree)。进化树给出分支层次或拓扑图形，它是产生新的基因复制或享有共同祖先的生物体的歧异点的一种反映，树枝的长度反映当这些事件发生时就存在的蛋白质与蛋白质之间的进化距离。根据进化树不仅可以研究从单细胞有机体到多细胞有机体的生物进化过程，而且可以粗略估计现存的各类种属生物的分歧时间。通过蛋白质的分子进化树分析，为从分子水平研究物种进化提供了新的手段，可以比较精确的确定某物种的进化地位。对于物种分类问题，蛋白质的分子进化树亦可作为一个重要的依据。');
COMMIT;

-- ----------------------------
-- Table structure for publish
-- ----------------------------
DROP TABLE IF EXISTS `publish`;
CREATE TABLE `publish` (
  `pubid` int NOT NULL AUTO_INCREMENT,
  `pid` int NOT NULL,
  `lid` int NOT NULL,
  PRIMARY KEY (`pubid`),
  KEY `pid` (`pid`),
  KEY `lid` (`lid`),
  CONSTRAINT `publish_ibfk_1` FOREIGN KEY (`pid`) REFERENCES `paper` (`pid`),
  CONSTRAINT `publish_ibfk_2` FOREIGN KEY (`lid`) REFERENCES `lab` (`lid`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- ----------------------------
-- Records of publish
-- ----------------------------
BEGIN;
INSERT INTO `publish` VALUES (1, 1, 1);
INSERT INTO `publish` VALUES (2, 2, 2);
INSERT INTO `publish` VALUES (3, 6, 3);
INSERT INTO `publish` VALUES (4, 10, 4);
INSERT INTO `publish` VALUES (5, 10, 5);
INSERT INTO `publish` VALUES (6, 11, 6);
COMMIT;

SET FOREIGN_KEY_CHECKS = 1;
