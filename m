Return-Path: <linux-hwmon-owner@vger.kernel.org>
Received: from mail-pl1-f195.google.com ([209.85.214.195]:34506 "EHLO
        mail-pl1-f195.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726821AbeKOQBJ (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>);
        Thu, 15 Nov 2018 11:01:09 -0500
Received: by mail-pl1-f195.google.com with SMTP id f12-v6so8968449plo.1
        for <linux-hwmon@vger.kernel.org>; Wed, 14 Nov 2018 21:54:43 -0800 (PST)
From: Huacai Chen <chenhc@lemote.com>
To: Jean Delvare <jdelvare@suse.com>
Cc: Guenter Roeck <linux@roeck-us.net>, linux-hwmon@vger.kernel.org,
        Fuxin Zhang <zhangfx@lemote.com>,
        Huacai Chen <chenhc@lemote.com>
Subject: [PATCH V5 6/8] MIPS: Reserve extra memory for crash dump
Date: Thu, 15 Nov 2018 13:50:55 +0800
Message-Id: <1542261057-6019-7-git-send-email-chenhc@lemote.com>
In-Reply-To: <1542261057-6019-1-git-send-email-chenhc@lemote.com>
References: <1542261057-6019-1-git-send-email-chenhc@lemote.com>
Sender: linux-hwmon-owner@vger.kernel.org
List-Id: linux-hwmon@vger.kernel.org

Traditionally, MIPS's contiguous low memory can be as less as 256M, so
crashkernel=X@Y may be unable to large enough in some cases. Moreover,
for the "multi numa node + sparse memory model" case, it is attempt to
allocate section_mem_maps on every node. Thus, if the total memory of a
node is more than 1GB, we reserve the top 128MB for the crash kernel.

Signed-off-by: Huacai Chen <chenhc@lemote.com>
---
 arch/mips/kernel/setup.c | 51 ++++++++++++++++++++++++++++++++++++++++++++++++
 1 file changed, 51 insertions(+)

diff --git a/arch/mips/kernel/setup.c b/arch/mips/kernel/setup.c
index ea09ed6..070234b 100644
--- a/arch/mips/kernel/setup.c
+++ b/arch/mips/kernel/setup.c
@@ -27,6 +27,7 @@
 #include <linux/dma-contiguous.h>
 #include <linux/decompress/generic.h>
 #include <linux/of_fdt.h>
+#include <linux/crash_dump.h>
 
 #include <asm/addrspace.h>
 #include <asm/bootinfo.h>
@@ -756,6 +757,48 @@ static void __init request_crashkernel(struct resource *res)
 #define BUILTIN_EXTEND_WITH_PROM	\
 	IS_ENABLED(CONFIG_MIPS_CMDLINE_BUILTIN_EXTEND)
 
+/* Traditionally, MIPS's contiguous low memory is 256M, so crashkernel=X@Y is
+ * unable to be large enough in some cases. Thus, if the total memory of a node
+ * is more than 1GB, we reserve the top 128MB for the crash kernel */
+static void reserve_crashm_region(int node, unsigned long s0, unsigned long e0)
+{
+#ifdef CONFIG_KEXEC
+	if (crashk_res.start == crashk_res.end)
+		return;
+
+	if ((e0 - s0) <= (SZ_1G >> PAGE_SHIFT))
+		return;
+
+	s0 = e0 - (SZ_128M >> PAGE_SHIFT);
+
+	memblock_reserve(PFN_PHYS(s0), (e0 - s0) << PAGE_SHIFT);
+#endif
+}
+
+static void reserve_oldmem_region(int node, unsigned long s0, unsigned long e0)
+{
+#ifdef CONFIG_CRASH_DUMP
+	unsigned long s1, e1;
+
+	if (!is_kdump_kernel())
+		return;
+
+	if ((e0 - s0) > (SZ_1G >> PAGE_SHIFT))
+		e0 = e0 - (SZ_128M >> PAGE_SHIFT);
+
+	/* boot_mem_map.map[0] is crashk_res reserved by primary kernel */
+	s1 = PFN_UP(boot_mem_map.map[0].addr);
+	e1 = PFN_DOWN(boot_mem_map.map[0].addr + boot_mem_map.map[0].size);
+
+	if (node == 0) {
+		memblock_reserve(PFN_PHYS(s0), (s1 - s0) << PAGE_SHIFT);
+		memblock_reserve(PFN_PHYS(e1), (e0 - e1) << PAGE_SHIFT);
+	} else {
+		memblock_reserve(PFN_PHYS(s0), (e0 - s0) << PAGE_SHIFT);
+	}
+#endif
+}
+
 /*
  * arch_mem_init - initialize memory management subsystem
  *
@@ -780,6 +823,8 @@ static void __init request_crashkernel(struct resource *res)
  */
 static void __init arch_mem_init(char **cmdline_p)
 {
+	unsigned int node;
+	unsigned long start_pfn, end_pfn;
 	struct memblock_region *reg;
 	extern void plat_mem_setup(void);
 
@@ -877,6 +922,12 @@ static void __init arch_mem_init(char **cmdline_p)
 		memblock_reserve(crashk_res.start,
 				 crashk_res.end - crashk_res.start + 1);
 #endif
+	for_each_online_node(node) {
+		get_pfn_range_for_nid(node, &start_pfn, &end_pfn);
+		reserve_crashm_region(node, start_pfn, end_pfn);
+		reserve_oldmem_region(node, start_pfn, end_pfn);
+	}
+
 	device_tree_init();
 	sparse_init();
 	plat_swiotlb_setup();
-- 
2.7.0
