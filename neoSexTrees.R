#2217
ggtree(tree[[1]], branch.length = "none") + geom_nodelab(aes(labels = node),hjust = 1.5, vjust = -0.5, size = 4) + geom_tiplab() + geom_cladelabel(18, "W", offset = 0.6, barsize = 1.5, color = "deepskyblue2", fontsize = 10) + geom_cladelabel(14, "Z", offset = 0.6, barsize = 1.5, color = "coral2", fontsize = 10)

#2312
ggtree(tree[[2]], branch.length = "none") + geom_tiplab() + geom_nodelab(aes(labels = node), hjust = 1.5, vjust = -0.5, size = 4) + geom_cladelabel(17, "W", offset = 0.6, barsize = 1.5, color = "deepskyblue2", fontsize = 10) + geom_cladelabel(c(14,15,21), "Z", offset = 0.6, barsize = 1.5, color = "coral2", fontsize = 10) + geom_strip("CW_Z","BC_Z", barsize = 1.5, color = "coral2", offset = 0.6)

#2459
rotate(rotate(ggtree(tree[[3]], branch.length = "none") + geom_tiplab() + geom_nodelab(aes(labels = node), hjust = 1.5, vjust = -0.5, size = 4) ,15), 20) + geom_cladelabel(18, "Z", offset = 0.6, fontsize = 10, color = "coral2", barsize = 1.5) + geom_cladelabel(16, "W", offset = 0.6, fontsize = 10, color = "deepskyblue2", barsize = 1.5)

#2815
ggtree(tree[[4]], branch.length = "none") + geom_tiplab() + geom_nodelab(aes(labels = node), hjust = 1.5, vjust = -0.5, size = 4) + geom_cladelabel(18, "W", barsize = 1.5, color = "deepskyblue2", fontsize = 10, offset = 0.6) + geom_cladelabel(c(14,16,17), "Z", barsize = 1.5, color = "coral2", fontsize = 10, offset = 0.6) + geom_strip("BC_Z","CW_Z", barsize = 1.5, color = "coral2", offset = 0.6)

#2892
ggtree(tree[[5]], branch.length = "none") + geom_tiplab() + geom_nodelab(aes(labels = node), hjust = 1.5, vjust = -0.5, size = 4) + geom_cladelabel(18, "W", barsize = 1.5, color = "deepskyblue2", fontsize = 10, offset = 0.6) + geom_cladelabel(14,"Z", barsize = 1.5, color = "coral2", fontsize = 10, offset = 0.6)

#2898
ggtree(tree[[6]], branch.length = "none") + geom_tiplab() + geom_nodelab(aes(labels = node), hjust = 1.5, vjust = -0.5, size = 4) + geom_cladelabel(18, "W", barsize = 1.5, color = "deepskyblue2", fontsize = 10, offset = 0.6) + geom_cladelabel(15,"Z", barsize = 1.5, color = "coral2", fontsize = 10, offset = 0.6) + geom_strip("BC_Z","CW_Z", barsize = 1.5, color = "coral2", offset = 0.6)

#2927
ggtree(tree[[7]], branch.length = "none") + geom_tiplab() + geom_nodelab(aes(labels = node), hjust = 1.5, vjust = -0.5, size = 4) + geom_cladelabel(18, "W", barsize = 1.5, color = "deepskyblue2", fontsize = 10, offset = 0.6) + geom_cladelabel(14,"Z", barsize = 1.5, color = "coral2", fontsize = 10, offset = 0.6)

#2947
ggtree(tree[[8]], branch.length = "none") + geom_tiplab() + geom_nodelab(aes(labels = node), hjust = 1.5, vjust = -0.5, size = 4) + geom_cladelabel(17,"W",barsize = 1.5, color = "deepskyblue2", fontsize = 10, offset = 0.6) + geom_cladelabel(c(15,16), "Z", barsize = 1.5, color = "coral2", fontsize = 10, offset = 0.6) + geom_strip("GRW_Z","CRW_Z", barsize = 1.5, color = "coral2", offset = 0.6) + geom_cladelabel(21, "W", barsize = 1.5, color = "deepskyblue2", fontsize = 10, offset = 0.6) + geom_cladelabel(20,"Z",barsize = 1.5, color = "coral2", fontsize = 10, offset = 0.6)

#2979
ggtree(tree[[9]], branch.length = "none") + geom_tiplab() + geom_nodelab(aes(labels = node), hjust = 1.5, vjust = -0.5, size = 4) + geom_cladelabel(16,"W", barsize = 1.5, color = "deepskyblue2", fontsize = 10, offset = 0.6) + geom_cladelabel(c(15,18), "Z", barsize = 1.5, color = "coral2", fontsize = 10, offset = 0.6) 

#3009
rotate(rotate(ggtree(tree[[10]], branch.length = "none") + geom_tiplab() + geom_nodelab(aes(labels = node), hjust = 1.5, vjust = -0.5, size = 4) + geom_cladelabel(17, "Z", barsize = 1.5, color = "coral2", fontsize = 10, offset = 0.6) + geom_cladelabel(c(21,15,16), "W", barsize = 1.5, color = "deepskyblue2", fontsize = 10, offset = 0.6) ,18),15) + geom_strip("MW_W","CRW_W", barsize = 1.5, color = "deepskyblue2", offset = 0.6)

#3090
ggtree(tree[[11]], branch.length = "none") + geom_tiplab() + geom_nodelab(aes(labels = node), hjust = 1.5, vjust = -0.5, size = 4) + geom_cladelabel(19, "W", barsize = 1.5, color = "deepskyblue2", fontsize = 10, offset = 0.6) + geom_cladelabel(17, "Z", barsize = 1.5, color = "coral2", fontsize = 10, offset = 0.6) + geom_cladelabel(21,"W",barsize = 1.5, color = "deepskyblue2", fontsize = 10, offset = 0.6) + geom_cladelabel(14,"Z", barsize = 1.5, color = "coral2", fontsize = 10, offset = 0.6)

#3107
ggtree(tree[[12]], branch.length = "none") + geom_tiplab() + geom_nodelab(aes(labels = node), hjust = 1.5, vjust = -0.5, size = 4) + geom_cladelabel(20, "W", barsize = 1.5, color = "deepskyblue2", fontsize = 10, offset = 0.6) + geom_cladelabel(18, "Z", barsize = 1.5, color = "coral2", fontsize = 10, offset = 0.6)

#3108
rotate(rotate(rotate(ggtree(tree[[13]], branch.length = "none") + geom_tiplab() + geom_nodelab(aes(labels = node), hjust = 1.5, vjust = -0.5, size = 4),16),13),18) + geom_cladelabel(14, "W", barsize = 1.5, color = "deepskyblue2", fontsize = 10, offset = 0.6) + geom_cladelabel(20, "Z", barsize = 1.5, color = "coral2", fontsize = 10, offset = 0.6)

#3181
ggtree(tree[[14]], branch.length = "none") + geom_tiplab() + geom_nodelab(aes(labels = node), hjust = 1.5, vjust = -0.5, size = 4) + geom_cladelabel(18, "W", color = "deepskyblue2", barsize = 1.5, fontsize = 10, offset = 0.6) + geom_cladelabel(c(14,15,17), "Z", color = "coral2", barsize = 1.5, fontsize = 10, offset = 0.6)

#3441
ggtree(tree[[15]], branch.length = "none") + geom_tiplab() + geom_nodelab(aes(labels = node), hjust = 1.5, vjust = -0.5, size = 4) + geom_cladelabel(18,"W", barsize = 1.5, color = "deepskyblue2", fontsize = 10, offset = 0.6) + geom_cladelabel(14,"Z", barsize = 1.5, color = "coral2", fontsize = 10, offset = 0.6)

#3507
rotate(rotate(rotate(rotate(ggtree(tree[[16]], branch.length = "none") + geom_tiplab() + geom_nodelab(aes(labels = node), hjust = 1.5, vjust = -0.5, size = 4),13),19),14),17) + geom_cladelabel(14,"W", barsize = 1.5, color = "deepskyblue2", fontsize = 10, offset = 0.6) + geom_cladelabel(21,"W", barsize = 1.5, color = "deepskyblue2", fontsize = 10, offset = 0.6) + geom_cladelabel(17,"Z", barsize = 1.5, color = "coral2", fontsize = 10, offset = 0.6) + geom_cladelabel(20,"Z", barsize = 1.5, color = "coral2", fontsize = 10, offset = 0.6)

#3658
rotate(rotate(ggtree(tree[[17]], branch.length = "none") + geom_tiplab() + geom_nodelab(aes(labels = node), hjust = 1.5, vjust = -0.5, size = 4),17),14) + geom_cladelabel(18,"W",barsize = 1.5, color = "deepskyblue2", fontsize = 10, offset = 0.6) + geom_cladelabel(c(15,21),"Z",barsize = 1.5, color = "coral2", fontsize = 10, offset = 0.6) + geom_strip("CW_W","BC_W", barsize = 1.5, color = "deepskyblue2", offset = 0.6)

geom_text2(aes(subset=!isTip, label=node), hjust=-.3)
