Received: from out28-193.mail.aliyun.com (out28-193.mail.aliyun.com [115.124.28.193])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AFB58392819;
	Thu, 10 Sep 2026 08:27:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=115.124.28.193
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789028884; cv=none; b=lDD0c/hpvkIbV2uyi1oy+xV5nic4Ejt76cw4czxYAqPus6Yh79SxvaDQMl2IjEjbtDy5507IqFZIuLlqpDWVyh3JsZGyJcZ1LwfTukXiD08FRgo1T5XOcJjs+RvGE0ZmXsGApeOaPOarD5d9q4qIaz3U8enNK1q2ciQU5DiYRyI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789028884; c=relaxed/simple;
	bh=c8SKgYkSJURp0ia/ucGtZk91QBnGcA1QJPzgcrn33ow=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=o9baeMWwj2x0a7dc4QM8xfttVvYDQK3/l3xZ9tLoxn0ygBkxoCHYoPF/LHNqlU2ctGRUZcQLo51vQiQRy0/V0dy9UtR6kk9XS8OEOfhIjVv2k1lisMTUaRx/d1f6jMD1T1ly2T3UWgO2YH7yGbySykGheYpkvkIk5dAGn+CXM2Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=open-hieco.net; spf=pass smtp.mailfrom=open-hieco.net; arc=none smtp.client-ip=115.124.28.193
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=open-hieco.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=open-hieco.net
X-Alimail-AntiSpam:AC=CONTINUE;BC=0.0743752|-1;CH=green;DM=|CONTINUE|false|;DS=CONTINUE|ham_alarm|0.00635557-0.00123426-0.99241;FP=14413116730169444571|0|0|0|0|-1|-1|-1;HT=maildocker-contentspam033037006180;MF=wanglin@open-hieco.net;NM=1;PH=DS;RN=15;RT=15;SR=0;TI=SMTPD_---.jAJ355l_1789028868;
Received: from localhost.localdomain(mailfrom:wanglin@open-hieco.net fp:SMTPD_---.jAJ355l_1789028868 cluster:ay29)
          by smtp.aliyun-inc.com;
          Thu, 10 Sep 2026 16:27:48 +0800
From: Lin Wang <wanglin@open-hieco.net>
To: Borislav Petkov <bp@alien8.de>,
	Yazen Ghannam <yazen.ghannam@amd.com>,
	Mario Limonciello <mario.limonciello@amd.com>
Cc: Pu Wen <puwen@hygon.cn>,
	Thomas Gleixner <tglx@kernel.org>,
	Ingo Molnar <mingo@redhat.com>,
	Dave Hansen <dave.hansen@linux.intel.com>,
	"H. Peter Anvin" <hpa@zytor.com>,
	Tony Luck <tony.luck@intel.com>,
	Clemens Ladisch <clemens@ladisch.de>,
	Guenter Roeck <linux@roeck-us.net>,
	x86@kernel.org,
	linux-edac@vger.kernel.org,
	linux-hwmon@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v5 2/8] x86/hygon: Map CPU NodeIds to DF nodes
Date: Thu, 10 Sep 2026 16:27:28 +0800
Message-ID: <20260910082734.3771675-3-wanglin@open-hieco.net>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260910082734.3771675-1-wanglin@open-hieco.net>
References: <20260910082734.3771675-1-wanglin@open-hieco.net>
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

On bare-metal Hygon systems, CPUID 0x8000001E ECX[7:0] encodes a
CPU's socket and local CDD ordinal. The value is sparse across sockets
and cannot be used as an index into the dense DF node cache.

Translate the CPUID value through the CDDs sorted by socket and DFID.
The NodeId reported by CPUID in a guest may not describe the physical
DF topology. Return -ENODEV in guests or when the NodeId does not
identify an enumerated CDD.

Signed-off-by: Lin Wang <wanglin@open-hieco.net>
---
 arch/x86/include/asm/hygon/node.h | 22 +++++++++++++
 arch/x86/kernel/hygon_node.c      | 51 +++++++++++++++++++++++++++++++
 2 files changed, 73 insertions(+)

diff --git a/arch/x86/include/asm/hygon/node.h b/arch/x86/include/asm/hygon/node.h
index 77e9f5354837..8ed44addedd4 100644
--- a/arch/x86/include/asm/hygon/node.h
+++ b/arch/x86/include/asm/hygon/node.h
@@ -77,6 +77,23 @@ u16 hygon_cdd_num(void);
  */
 int hygon_node_get_info(u16 node, struct hygon_node_info *info);
 
+/**
+ * hygon_cpu_to_df_node() - map CPU to dense DF CDD index
+ * @cpu: CPU index
+ *
+ * Hygon Fam18h exposes sparse physical node IDs via CPUID 0x8000001E
+ * ECX[7:0].
+ * This function translates the per-CPU physical node ID into a dense
+ * DF CDD index in [0, hygon_cdd_num()). The NodeId reported by CPUID in
+ * a guest may not describe the physical DF topology, so the translation
+ * is unavailable in guests.
+ *
+ * Return: DF CDD index on success, -EINVAL if @cpu is out of range,
+ * -ENODEV if CPU-to-DF mapping is unavailable or the physical node ID
+ * does not map to a known DF node.
+ */
+int hygon_cpu_to_df_node(unsigned int cpu);
+
 /**
  * hygon_node_get_func() - get DF function PCI device for a node
  * @node: DF node index in [0, hygon_node_num())
@@ -118,6 +135,11 @@ static inline int hygon_node_get_info(u16 node, struct hygon_node_info *info)
 	return -ENODEV;
 }
 
+static inline int hygon_cpu_to_df_node(unsigned int cpu)
+{
+	return -ENODEV;
+}
+
 static inline struct pci_dev *hygon_node_get_func(u16 node, u8 func)
 {
 	return NULL;
diff --git a/arch/x86/kernel/hygon_node.c b/arch/x86/kernel/hygon_node.c
index 9ba734c09e6f..a7d09a3938c3 100644
--- a/arch/x86/kernel/hygon_node.c
+++ b/arch/x86/kernel/hygon_node.c
@@ -25,6 +25,7 @@
 #include <linux/processor.h>
 #include <linux/slab.h>
 #include <linux/sort.h>
+#include <linux/topology.h>
 
 #include <asm/cpu_device_id.h>
 #include <asm/hygon/node.h>
@@ -553,6 +554,40 @@ static int __init hygon_sort_and_classify(struct hygon_node_cache *cache)
 	return 0;
 }
 
+/*
+ * Translate a Hygon Fam18h phys_node_id (CPUID 8000001E ECX[7:0]) to a
+ * dense DF CDD index.  On supported models, CPUID reports this
+ * encoding:
+ *
+ *   phys_node_id = (socket_id << 4) | local_cdd_index_in_dfid_order
+ *
+ * The cache->nodes[] CDD region is sorted by (socket_id ASC, dfid ASC),
+ * so walk it and return the actual cache index of the CDD whose
+ * socket_id matches and whose socket-local ordinal is @local.
+ *
+ * Return -ENODEV if the cache is unavailable or no CDD matches.
+ */
+static int hygon_phys_nid_to_df_node(unsigned int phys_nid)
+{
+	unsigned int socket = phys_nid >> 4;
+	unsigned int local = phys_nid & 0xf;
+	unsigned int ordinal = 0;
+	u16 i;
+
+	if (!hygon_cache.ready)
+		return -ENODEV;
+
+	for (i = 0; i < hygon_cache.num_cdd; i++) {
+		if (hygon_cache.nodes[i].socket_id != socket)
+			continue;
+
+		if (ordinal++ == local)
+			return i;
+	}
+
+	return -ENODEV;
+}
+
 /*
  * Build the global DF node cache.
  *
@@ -617,6 +652,22 @@ int hygon_node_get_info(u16 node, struct hygon_node_info *info)
 }
 EXPORT_SYMBOL_GPL(hygon_node_get_info);
 
+int hygon_cpu_to_df_node(unsigned int cpu)
+{
+	if (cpu >= nr_cpu_ids)
+		return -EINVAL;
+
+	/*
+	 * The NodeId reported by CPUID in a guest may not describe the
+	 * physical DF topology.
+	 */
+	if (cpu_feature_enabled(X86_FEATURE_HYPERVISOR))
+		return -ENODEV;
+
+	return hygon_phys_nid_to_df_node(topology_amd_node_id(cpu));
+}
+EXPORT_SYMBOL_GPL(hygon_cpu_to_df_node);
+
 struct pci_dev *hygon_node_get_func(u16 node, u8 func)
 {
 	if (!hygon_cache.ready)
-- 
2.43.0

