Received: from out28-77.mail.aliyun.com (out28-77.mail.aliyun.com [115.124.28.77])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0422131618B;
	Thu, 10 Sep 2026 08:27:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=115.124.28.77
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789028878; cv=none; b=c80HS1zuPYTExQhXet2BBrpOBMLgqpgwPbblYnJot51IoduomYGozGqR+UXkstAoHv1CPPPv6QAgiFVTWH78e1bU166eyKXg7ww2k6jHUGrOddF4R0rtO08w9M0pa1c4uMoDW9myrz7r2/XhnKTeezH2XcZonIIHedQoXMAU/Dk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789028878; c=relaxed/simple;
	bh=Qv6hp8fgfMpjkWuIfTwgPZPpJKlX770kKGly5G+3tbI=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=JmZwysTO+eJrUu+hY0m3SZbk558zDKnx6zF/CAhFhWD2QvQqtPL9wHKdU7eGtZoEYlUA+xNha+9iRa7LhwvApOyX/WV+0gOw9kgDkdgQWtGiRdkXwUvcQSnXbxe6kLXKUnA7IlB9itNNmf56rA5NSXmUAZMSlUA72il2zmwnQsA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=open-hieco.net; spf=pass smtp.mailfrom=open-hieco.net; arc=none smtp.client-ip=115.124.28.77
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=open-hieco.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=open-hieco.net
X-Alimail-AntiSpam:AC=CONTINUE;BC=0.07436259|-1;CH=green;DM=|CONTINUE|false|;DS=CONTINUE|ham_alarm|0.0152599-0.000727868-0.984012;FP=14657946299256292603|0|0|0|0|-1|-1|-1;HT=maildocker-contentspam033037021217;MF=wanglin@open-hieco.net;NM=1;PH=DS;RN=15;RT=15;SR=0;TI=SMTPD_---.jAJ354b_1789028867;
Received: from localhost.localdomain(mailfrom:wanglin@open-hieco.net fp:SMTPD_---.jAJ354b_1789028867 cluster:ay29)
          by smtp.aliyun-inc.com;
          Thu, 10 Sep 2026 16:27:47 +0800
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
Subject: [PATCH v5 1/8] x86/hygon: Add Family 0x18 DF node enumeration
Date: Thu, 10 Sep 2026 16:27:27 +0800
Message-ID: <20260910082734.3771675-2-wanglin@open-hieco.net>
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

The AMD node code locates function 3 for node N at PCI slot 0x18 + N.
Hygon has no equivalent node-index-to-slot mapping: DF F3 devices are
discovered by PCI ID and the PCI BDF is only an access point.

F1x200 supplies the socket ID and SocketPresent mask. The DFID comes
from F1x200 or F5x180, depending on the CPU model. The (socket ID,
DFID) pair identifies a DF node. The cache is published only when the
socket IDs observed during PCI enumeration match SocketPresent.

The resulting cache places Core and DDR Dies (CDDs) before I/O Dies
(IODs), with each group ordered by socket and DFID. The node interfaces
provide node counts and identity, F3/F4 lookup, and PCI device-to-node
lookup.

Signed-off-by: Lin Wang <wanglin@open-hieco.net>
---
 MAINTAINERS                       |   3 +
 arch/x86/Kconfig                  |   4 +
 arch/x86/include/asm/hygon/node.h | 133 ++++++
 arch/x86/kernel/Makefile          |   1 +
 arch/x86/kernel/hygon_node.c      | 685 ++++++++++++++++++++++++++++++
 5 files changed, 826 insertions(+)
 create mode 100644 arch/x86/include/asm/hygon/node.h
 create mode 100644 arch/x86/kernel/hygon_node.c

diff --git a/MAINTAINERS b/MAINTAINERS
index c392ded5322a..43e24c81c0b2 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -12134,9 +12134,12 @@ F:	drivers/input/touchscreen/hycon-hy46xx.c
 
 HYGON PROCESSOR SUPPORT
 M:	Pu Wen <puwen@hygon.cn>
+M:	Lin Wang <wanglin@open-hieco.net>
 L:	linux-kernel@vger.kernel.org
 S:	Maintained
+F:	arch/x86/include/asm/hygon/
 F:	arch/x86/kernel/cpu/hygon.c
+F:	arch/x86/kernel/hygon_node.c
 
 HYNIX HI556 SENSOR DRIVER
 M:	Sakari Ailus <sakari.ailus@linux.intel.com>
diff --git a/arch/x86/Kconfig b/arch/x86/Kconfig
index 15fd9ec5ecac..6d72e62d87f7 100644
--- a/arch/x86/Kconfig
+++ b/arch/x86/Kconfig
@@ -3078,6 +3078,10 @@ config AMD_NODE
 	def_bool y
 	depends on CPU_SUP_AMD && PCI
 
+config HYGON_NODE
+	def_bool y
+	depends on CPU_SUP_HYGON && PCI
+
 endmenu
 
 menu "Binary Emulations"
diff --git a/arch/x86/include/asm/hygon/node.h b/arch/x86/include/asm/hygon/node.h
new file mode 100644
index 000000000000..77e9f5354837
--- /dev/null
+++ b/arch/x86/include/asm/hygon/node.h
@@ -0,0 +1,133 @@
+/* SPDX-License-Identifier: GPL-2.0-only */
+/*
+ * Hygon Family 0x18 Data Fabric node enumeration API
+ *
+ * This header declares Hygon Fam18h DF node enumeration and function
+ * access interfaces.
+ */
+#ifndef _ASM_X86_HYGON_NODE_H
+#define _ASM_X86_HYGON_NODE_H
+
+#include <linux/errno.h>
+#include <linux/types.h>
+
+struct pci_dev;
+
+/* DF function indices supported by hygon_node_get_func(). */
+#define HYGON_DF_F3	3	/* misc */
+#define HYGON_DF_F4	4	/* link */
+
+/*
+ * Hygon Core and DDR Dies (CDDs) start at DFID 4. Each CDD contains
+ * CPU cores and UMCs. I/O Dies (IODs) occupy DFIDs 0-3.
+ */
+#define HYGON_CDD_DFID_BASE	4
+
+/**
+ * enum hygon_node_type - DF node type, derived from DFID
+ * @HYGON_NODE_IOD: I/O die (DFID < HYGON_CDD_DFID_BASE); no UMC.
+ * @HYGON_NODE_CDD: Core and DDR Die (DFID >= HYGON_CDD_DFID_BASE);
+ *                  contains CPU cores and UMC controllers.
+ */
+enum hygon_node_type {
+	HYGON_NODE_IOD = 0,
+	HYGON_NODE_CDD = 1,
+};
+
+/**
+ * struct hygon_node_info - DF node information
+ * @socket_id: physical socket ID, F1x200[30:28]
+ * @dfid:      Data Fabric ID, model-dependent source
+ * @type:      HYGON_NODE_CDD or HYGON_NODE_IOD
+ */
+struct hygon_node_info {
+	u8			socket_id;
+	u8			dfid;
+	enum hygon_node_type	type;
+};
+
+#ifdef CONFIG_HYGON_NODE
+
+/**
+ * hygon_node_num() - total number of DF nodes (CDD + IOD)
+ *
+ * This is the upper bound for every node index in this API.
+ *
+ * Return: total node count, or 0 if the cache is not ready.
+ */
+u16 hygon_node_num(void);
+
+/**
+ * hygon_cdd_num() - number of Core and DDR Dies (CDD)
+ *
+ * A CDD (DFID >= 4) has CPU cores and UMC controllers; an IOD
+ * (DFID < 4) has neither. CDDs occupy nodes [0, hygon_cdd_num()).
+ *
+ * Return: CDD count, or 0 if the cache is not ready.
+ */
+u16 hygon_cdd_num(void);
+
+/**
+ * hygon_node_get_info() - get information for a DF node
+ * @node: DF node index in [0, hygon_node_num())
+ * @info: output structure (socket_id, dfid, type)
+ *
+ * Return: 0 on success, -EINVAL if @node is out of range or @info is
+ * NULL, -ENODEV if the cache is not ready.
+ */
+int hygon_node_get_info(u16 node, struct hygon_node_info *info);
+
+/**
+ * hygon_node_get_func() - get DF function PCI device for a node
+ * @node: DF node index in [0, hygon_node_num())
+ * @func: HYGON_DF_F3 or HYGON_DF_F4
+ *
+ * Return: referenced pci_dev on success.  NULL if @node is out of
+ * range, @func is unsupported, or the cache is not ready.  The
+ * caller must release the reference with pci_dev_put().
+ */
+struct pci_dev *hygon_node_get_func(u16 node, u8 func);
+
+/**
+ * hygon_pci_dev_to_df_node() - find DF node owning the given PCI device
+ * @pdev: PCI function on the same domain, bus and slot as a cached DF node
+ *
+ * Looks up the DF node whose misc (F3) device shares the same PCI
+ * domain, bus and slot as @pdev.
+ *
+ * Return: DF node index in [0, hygon_node_num()) on success, -EINVAL
+ * if @pdev is NULL, or -ENODEV if no matching node is found or the
+ * cache is not ready.
+ */
+int hygon_pci_dev_to_df_node(struct pci_dev *pdev);
+
+#else /* !CONFIG_HYGON_NODE */
+
+static inline u16 hygon_node_num(void)
+{
+	return 0;
+}
+
+static inline u16 hygon_cdd_num(void)
+{
+	return 0;
+}
+
+static inline int hygon_node_get_info(u16 node, struct hygon_node_info *info)
+{
+	return -ENODEV;
+}
+
+static inline struct pci_dev *hygon_node_get_func(u16 node, u8 func)
+{
+	return NULL;
+}
+
+static inline int hygon_pci_dev_to_df_node(struct pci_dev *pdev)
+{
+	return -ENODEV;
+}
+
+#endif /* CONFIG_HYGON_NODE */
+
+#endif /* _ASM_X86_HYGON_NODE_H */
diff --git a/arch/x86/kernel/Makefile b/arch/x86/kernel/Makefile
index 31f46fd00527..b8430e5e53fb 100644
--- a/arch/x86/kernel/Makefile
+++ b/arch/x86/kernel/Makefile
@@ -136,6 +136,7 @@ obj-$(CONFIG_HPET_TIMER) 	+= hpet.o
 
 obj-$(CONFIG_AMD_NB)		+= amd_nb.o
 obj-$(CONFIG_AMD_NODE)		+= amd_node.o
+obj-$(CONFIG_HYGON_NODE)	+= hygon_node.o
 obj-$(CONFIG_DEBUG_NMI_SELFTEST) += nmi_selftest.o
 
 obj-$(CONFIG_KVM_GUEST)		+= kvm.o kvmclock.o
diff --git a/arch/x86/kernel/hygon_node.c b/arch/x86/kernel/hygon_node.c
new file mode 100644
index 000000000000..9ba734c09e6f
--- /dev/null
+++ b/arch/x86/kernel/hygon_node.c
@@ -0,0 +1,685 @@
+// SPDX-License-Identifier: GPL-2.0-only
+/*
+ * Hygon Family 0x18 Data Fabric node enumeration
+ *
+ * A DF instance exposes sibling PCI functions in one slot. Function 3
+ * is the misc device used for enumeration, function 4 is the link
+ * device, and functions 1 and 5 provide the socket and DF identity.
+ *
+ * Enumerate F3 devices by PCI ID, validate their F4 siblings, read each
+ * node's socket ID and DFID, and validate the enumerated socket set
+ * against SocketPresent. Sort the nodes into a dense cache with Core
+ * and DDR Dies (CDDs) before I/O Dies (IODs), then by socket ID and
+ * DFID.
+ */
+
+#define pr_fmt(fmt) "hygon_node: " fmt
+
+#include <linux/bitops.h>
+#include <linux/cpu.h>
+#include <linux/cpufeature.h>
+#include <linux/export.h>
+#include <linux/init.h>
+#include <linux/pci.h>
+#include <linux/pci_ids.h>
+#include <linux/processor.h>
+#include <linux/slab.h>
+#include <linux/sort.h>
+
+#include <asm/cpu_device_id.h>
+#include <asm/hygon/node.h>
+
+/* Maximum socket count this implementation supports. */
+#define HYGON_MAX_SOCKETS	8
+
+/*
+ * DF register offsets used for node identity discovery.
+ *
+ * F1x200 (SystemCfg) -- present on all supported models:
+ *   [30:28]  MySocketId    - hardware socket ID
+ *   [23:20]  MyDieId       - die ID (equals DFID on some models, see below)
+ *
+ * F5x180 (FabricBlockInstanceInformation3_CS) -- used on Model 06h-08h:
+ *   [19:16]  DFID          - Data Fabric ID for UMC/SMN addressing
+ *
+ * DFID source by model:
+ *   Model 04h/05h:  F1x200[23:20] (MyDieId == DFID)
+ *   Model 06h-08h:  F5x180[19:16] (MyDieId != DFID, different numbering)
+ */
+#define DF_F1_SYSTEM_CFG	0x200
+#define DF_F5_FABRIC_ID		0x180
+
+/* DF function numbers for sibling device access (internal use). */
+#define HYGON_DF_F1	1	/* SystemCfg: socket and die identity */
+#define HYGON_DF_F5	5	/* FabricId: DFID on Model 06h-08h */
+
+/* PCI device IDs used only by Hygon DF node discovery. */
+#define PCI_DEVICE_ID_HYGON_18H_DF_F3		0x1463
+#define PCI_DEVICE_ID_HYGON_18H_DF_F4		0x1464
+#define PCI_DEVICE_ID_HYGON_18H_M04H_DF_F1	0x1491
+#define PCI_DEVICE_ID_HYGON_18H_M04H_DF_F3	0x1493
+#define PCI_DEVICE_ID_HYGON_18H_M04H_DF_F4	0x1494
+#define PCI_DEVICE_ID_HYGON_18H_M05H_DF_F1	0x14b1
+#define PCI_DEVICE_ID_HYGON_18H_M05H_DF_F3	0x14b3
+#define PCI_DEVICE_ID_HYGON_18H_M05H_DF_F4	0x14b4
+#define PCI_DEVICE_ID_HYGON_18H_M06H_DF_F5	0x14b5
+
+/*
+ * Cached identity for one DF instance.  After sorting, CDDs occupy
+ * nodes[0..num_cdd-1].
+ *
+ * The PCI BDF is the access point for a DF node, not its identity.
+ * socket_id and dfid, read from DF registers, together identify the
+ * node in hardware.
+ */
+struct hygon_node {
+	struct pci_dev	*misc;		/* DF function 3 */
+	struct pci_dev	*link;		/* DF function 4 */
+	u8		socket_id;	/* F1x200[30:28] */
+	u8		dfid;		/* model-dependent DFID */
+	bool		is_cdd;		/* DFID >= 4 */
+};
+
+struct hygon_node_cache {
+	struct hygon_node	*nodes;		/* sorted: CDD first, then IOD */
+	u16			num_nodes;	/* CDD + IOD = total */
+	u16			num_cdd;	/* CDD only */
+	u16			num_sockets;
+
+	/* Set after DF node collection, sorting and validation complete. */
+	bool			ready;
+};
+
+struct hygon_df_id {
+	u8	socket_id;
+	u8	dfid;
+};
+
+/* DF sibling device IDs used to read node identity. */
+struct hygon_df_cfg {
+	u16	f1_id;
+	u16	f5_id;			/* 0 = not available */
+};
+
+/* DF misc (F3) device IDs for all supported Hygon Family 0x18 models. */
+static const struct pci_device_id hygon_nb_misc_ids[] = {
+	{ PCI_DEVICE(PCI_VENDOR_ID_HYGON, PCI_DEVICE_ID_HYGON_18H_DF_F3) },
+	{ PCI_DEVICE(PCI_VENDOR_ID_HYGON, PCI_DEVICE_ID_HYGON_18H_M04H_DF_F3) },
+	{ PCI_DEVICE(PCI_VENDOR_ID_HYGON, PCI_DEVICE_ID_HYGON_18H_M05H_DF_F3) },
+	{}
+};
+
+/* DF link (F4) device IDs for supported models. */
+static const struct pci_device_id hygon_nb_link_ids[] = {
+	{ PCI_DEVICE(PCI_VENDOR_ID_HYGON, PCI_DEVICE_ID_HYGON_18H_DF_F4) },
+	{ PCI_DEVICE(PCI_VENDOR_ID_HYGON, PCI_DEVICE_ID_HYGON_18H_M04H_DF_F4) },
+	{ PCI_DEVICE(PCI_VENDOR_ID_HYGON, PCI_DEVICE_ID_HYGON_18H_M05H_DF_F4) },
+	{}
+};
+
+static const struct hygon_df_cfg hygon_m04_df_cfg __initconst = {
+	.f1_id	= PCI_DEVICE_ID_HYGON_18H_M04H_DF_F1,
+};
+
+static const struct hygon_df_cfg hygon_m05_df_cfg __initconst = {
+	.f1_id	= PCI_DEVICE_ID_HYGON_18H_M05H_DF_F1,
+};
+
+static const struct hygon_df_cfg hygon_m06_m08_df_cfg __initconst = {
+	.f1_id	= PCI_DEVICE_ID_HYGON_18H_M05H_DF_F1,
+	.f5_id	= PCI_DEVICE_ID_HYGON_18H_M06H_DF_F5,
+};
+
+static const struct x86_cpu_id hygon_df_cpuids[] __initconst = {
+	X86_MATCH_VENDOR_FAM_MODEL(HYGON, 0x18, 0x04, &hygon_m04_df_cfg),
+	X86_MATCH_VENDOR_FAM_MODEL(HYGON, 0x18, 0x05, &hygon_m05_df_cfg),
+	X86_MATCH_VENDOR_FAM_MODEL(HYGON, 0x18, 0x06, &hygon_m06_m08_df_cfg),
+	X86_MATCH_VENDOR_FAM_MODEL(HYGON, 0x18, 0x07, &hygon_m06_m08_df_cfg),
+	X86_MATCH_VENDOR_FAM_MODEL(HYGON, 0x18, 0x08, &hygon_m06_m08_df_cfg),
+	{}
+};
+
+static struct hygon_node_cache hygon_cache;
+
+static void __init hygon_dump_nodes(const struct hygon_node_cache *cache,
+				    const char *phase)
+{
+	u16 i;
+
+	pr_debug("%s: %u nodes\n", phase, cache->num_nodes);
+
+	for (i = 0; i < cache->num_nodes; i++) {
+		const struct hygon_node *node = &cache->nodes[i];
+
+		pr_debug("%s: node[%u] %04x:%02x:%02x.%u socket=%u dfid=%u type=%s\n",
+			 phase, i, pci_domain_nr(node->misc->bus),
+			 node->misc->bus->number,
+			 PCI_SLOT(node->misc->devfn),
+			 PCI_FUNC(node->misc->devfn),
+			 node->socket_id, node->dfid,
+			 node->is_cdd ? "CDD" : "IOD");
+	}
+}
+
+/*
+ * Iterate Hygon PCI devices, returning the next one that matches @ids.
+ * Follows the pci_get_device() convention: @from is consumed (its
+ * reference is dropped) and the returned device has an elevated
+ * reference count.
+ */
+static struct pci_dev * __init next_hygon_dev(struct pci_dev *from,
+					      const struct pci_device_id *ids)
+{
+	while ((from = pci_get_device(PCI_VENDOR_ID_HYGON, PCI_ANY_ID, from))) {
+		if (pci_match_id(ids, from))
+			return from;
+	}
+
+	return NULL;
+}
+
+/*
+ * Find the DF link (function 4) sibling of a DF misc (function 3)
+ * device.  Both functions share the same PCI bus and slot.
+ */
+static struct pci_dev * __init hygon_get_link(struct pci_dev *misc)
+{
+	struct pci_dev *link;
+
+	link = pci_get_domain_bus_and_slot(pci_domain_nr(misc->bus),
+					   misc->bus->number,
+					   PCI_DEVFN(PCI_SLOT(misc->devfn),
+						     HYGON_DF_F4));
+	if (!link)
+		return NULL;
+
+	if (!pci_match_id(hygon_nb_link_ids, link)) {
+		pci_dev_put(link);
+		return NULL;
+	}
+
+	return link;
+}
+
+/* Find the DF configuration for the boot CPU. */
+static const struct hygon_df_cfg * __init hygon_get_df_cfg(void)
+{
+	const struct x86_cpu_id *id = x86_match_cpu(hygon_df_cpuids);
+
+	return id ? (const void *)id->driver_data : NULL;
+}
+
+/*
+ * Read a config register from a DF sibling function on the same PCI
+ * slot as @misc.  Only functions 1 (F1, SystemCfg) and 5 (F5,
+ * FabricId) are supported.
+ */
+static int __init hygon_read_df_reg(struct pci_dev *misc, u8 func,
+				    int offset, u32 *value)
+{
+	const struct hygon_df_cfg *cfg;
+	struct pci_dev *sibling;
+	u16 expected_device;
+	int err;
+
+	cfg = hygon_get_df_cfg();
+	if (!cfg)
+		return -ENODEV;
+
+	if (func == HYGON_DF_F1) {
+		expected_device = cfg->f1_id;
+
+		/*
+		 * Model 05h uses the M04H F1 device ID when F3 does not use
+		 * the M05H device ID.
+		 */
+		if (boot_cpu_data.x86_model == 0x5 &&
+		    misc->device != PCI_DEVICE_ID_HYGON_18H_M05H_DF_F3)
+			expected_device = PCI_DEVICE_ID_HYGON_18H_M04H_DF_F1;
+	} else if (func == HYGON_DF_F5) {
+		expected_device = cfg->f5_id;
+	} else {
+		return -EINVAL;
+	}
+
+	if (!expected_device)
+		return -ENODEV;
+
+	sibling = pci_get_domain_bus_and_slot(pci_domain_nr(misc->bus),
+					      misc->bus->number,
+					      PCI_DEVFN(PCI_SLOT(misc->devfn),
+							func));
+	if (!sibling)
+		return -ENODEV;
+
+	if (sibling->vendor != PCI_VENDOR_ID_HYGON ||
+	    sibling->device != expected_device) {
+		pci_dev_put(sibling);
+		return -ENODEV;
+	}
+
+	err = pci_read_config_dword(sibling, offset, value);
+	pci_dev_put(sibling);
+
+	if (err) {
+		pr_warn("error reading %04x:%02x:%02x.%u offset 0x%x\n",
+			pci_domain_nr(misc->bus), misc->bus->number,
+			PCI_SLOT(misc->devfn), func, offset);
+		return pcibios_err_to_errno(err);
+	}
+
+	/* Do not parse a PCI error response as DF identity. */
+	if (PCI_POSSIBLE_ERROR(*value)) {
+		pr_warn("error response reading %04x:%02x:%02x.%u offset 0x%x\n",
+			pci_domain_nr(misc->bus), misc->bus->number,
+			PCI_SLOT(misc->devfn), func, offset);
+		return -ENODEV;
+	}
+
+	return 0;
+}
+
+/*
+ * Read the hardware identity for one DF misc device from its sibling
+ * functions.
+ *
+ * Supported models expose F1x200 (SystemCfg): socket_id from [30:28] and a
+ * die identifier (MyDieId) from [23:20].
+ * On Model 06h-08h MyDieId differs from the DFID used by UMC and SMN
+ * addressing, so an additional F5x180 (FabricId) read obtains the DFID
+ * from [19:16].
+ *
+ * The boot CPU model selects the DF register layout for all instances.
+ */
+static int __init hygon_read_df_id(struct pci_dev *misc,
+				   struct hygon_df_id *id)
+{
+	const struct hygon_df_cfg *cfg = hygon_get_df_cfg();
+	u32 reg;
+	int ret;
+
+	if (!cfg)
+		return -ENODEV;
+
+	ret = hygon_read_df_reg(misc, HYGON_DF_F1, DF_F1_SYSTEM_CFG, &reg);
+	if (ret)
+		return ret;
+
+	id->socket_id = (reg >> 28) & 0x7;
+	id->dfid      = (reg >> 20) & 0xf;
+
+	/* Read DFID from F5x180 on models that provide an F5 sibling. */
+	if (cfg->f5_id) {
+		ret = hygon_read_df_reg(misc, HYGON_DF_F5, DF_F5_FABRIC_ID,
+					&reg);
+		if (ret)
+			return ret;
+		id->dfid = (reg >> 16) & 0xf;
+	}
+
+	return 0;
+}
+
+/*
+ * Read the system-wide SocketPresent mask from F1x200[7:0].
+ *
+ * SocketPresent is system-wide rather than per-node. Read it once from
+ * the first DF misc device. A zero mask is invalid on supported models.
+ */
+static int __init hygon_read_socket_present(struct pci_dev *misc,
+					    u8 *socket_present)
+{
+	u32 reg;
+	int ret;
+
+	ret = hygon_read_df_reg(misc, HYGON_DF_F1, DF_F1_SYSTEM_CFG, &reg);
+	if (ret)
+		return ret;
+
+	*socket_present = reg & 0xff;
+	if (!*socket_present) {
+		pr_warn("SocketPresent is zero\n");
+		return -EINVAL;
+	}
+
+	return 0;
+}
+
+static void __init hygon_release_nodes(struct hygon_node *nodes, u16 count)
+{
+	u16 i;
+
+	for (i = 0; i < count; i++) {
+		pci_dev_put(nodes[i].misc);
+		pci_dev_put(nodes[i].link);
+	}
+
+	kfree(nodes);
+}
+
+/*
+ * Walk all DF misc (F3) devices and read per-node identity (socket_id,
+ * dfid) from each, collecting them into a flat array.  The system-wide
+ * SocketPresent mask is sampled once, and the enumerated socket set is
+ * validated against it; socket IDs must also be dense (0..N-1).
+ */
+static int __init hygon_collect_nodes(struct hygon_node_cache *cache)
+{
+	struct hygon_node *nodes;
+	struct pci_dev *misc = NULL;
+	struct pci_dev *link = NULL;
+	u16 capacity = 0, count = 0;
+	u8 observed_socket_mask = 0;
+	u8 socket_present_mask = 0;
+	int ret;
+
+	while ((misc = next_hygon_dev(misc, hygon_nb_misc_ids)))
+		capacity++;
+
+	if (!capacity)
+		return -ENODEV;
+
+	nodes = kcalloc(capacity, sizeof(*nodes), GFP_KERNEL);
+	if (!nodes)
+		return -ENOMEM;
+
+	while ((misc = next_hygon_dev(misc, hygon_nb_misc_ids))) {
+		struct hygon_df_id id;
+
+		link = hygon_get_link(misc);
+		if (!link) {
+			ret = -ENODEV;
+			goto fail_put_devs;
+		}
+
+		ret = hygon_read_df_id(misc, &id);
+		if (ret)
+			goto fail_put_devs;
+
+		/* SocketPresent is system-wide, so sample it once. */
+		if (!count) {
+			ret = hygon_read_socket_present(misc,
+							&socket_present_mask);
+			if (ret)
+				goto fail_put_devs;
+		}
+
+		if (count >= capacity) {
+			ret = -ENODEV;
+			goto fail_put_devs;
+		}
+
+		pr_debug("collect: %04x:%02x:%02x.%u socket=%u dfid=%u\n",
+			 pci_domain_nr(misc->bus), misc->bus->number,
+			 PCI_SLOT(misc->devfn), PCI_FUNC(misc->devfn),
+			 id.socket_id, id.dfid);
+
+		nodes[count].misc      = pci_dev_get(misc);
+		nodes[count].link      = link;
+		link = NULL;
+		nodes[count].socket_id = id.socket_id;
+		nodes[count].dfid      = id.dfid;
+		nodes[count].is_cdd    = (id.dfid >= HYGON_CDD_DFID_BASE);
+		count++;
+
+		observed_socket_mask |= BIT(id.socket_id);
+	}
+
+	if (count != capacity) {
+		pr_warn("DF enumeration changed: expected %u nodes, got %u\n",
+			capacity, count);
+		ret = -ENODEV;
+		goto fail;
+	}
+
+	/*
+	 * Every populated socket must contribute at least one enumerated DF
+	 * misc device. socket_present_mask is guaranteed to be non-zero.
+	 */
+	if (observed_socket_mask != socket_present_mask) {
+		pr_warn("SocketPresent mismatch: observed=0x%x present=0x%x\n",
+			observed_socket_mask, socket_present_mask);
+		ret = -EINVAL;
+		goto fail;
+	}
+
+	cache->nodes       = nodes;
+	cache->num_nodes   = count;
+	cache->num_sockets = hweight8(socket_present_mask);
+
+	if (socket_present_mask != GENMASK(cache->num_sockets - 1, 0)) {
+		pr_warn("sparse socket IDs not supported (SocketPresent=0x%x)\n",
+			socket_present_mask);
+		ret = -EINVAL;
+		goto fail;
+	}
+
+	return 0;
+
+fail_put_devs:
+	pci_dev_put(link);
+	pci_dev_put(misc);
+fail:
+	hygon_release_nodes(nodes, count);
+	cache->nodes = NULL;
+	cache->num_nodes = 0;
+	cache->num_sockets = 0;
+	return ret;
+}
+
+/*
+ * Sort CDD nodes before IOD nodes, then order by hardware
+ * (socket_id, dfid).
+ */
+static int __init hygon_node_cmp(const void *a, const void *b)
+{
+	const struct hygon_node *left = a;
+	const struct hygon_node *right = b;
+
+	if (left->is_cdd != right->is_cdd)
+		return right->is_cdd - left->is_cdd;
+
+	if (left->socket_id != right->socket_id)
+		return (int)left->socket_id - right->socket_id;
+
+	return (int)left->dfid - (int)right->dfid;
+}
+
+/*
+ * Classify the sorted node array and validate that every socket has the
+ * same number of CDDs.
+ */
+static int __init hygon_sort_and_classify(struct hygon_node_cache *cache)
+{
+	u16 cdd_per_socket;
+	u16 i;
+	u8 per_sock_count[HYGON_MAX_SOCKETS] = { 0 };
+
+	hygon_dump_nodes(cache, "before-sort");
+
+	sort(cache->nodes, cache->num_nodes, sizeof(*cache->nodes),
+	     hygon_node_cmp, NULL);
+
+	for (i = 1; i < cache->num_nodes; i++) {
+		const struct hygon_node *prev = &cache->nodes[i - 1];
+		const struct hygon_node *node = &cache->nodes[i];
+
+		if (node->socket_id == prev->socket_id &&
+		    node->dfid == prev->dfid) {
+			pr_warn("duplicate DF node: socket=%u dfid=%u\n",
+				node->socket_id, node->dfid);
+			return -EINVAL;
+		}
+	}
+
+	for (i = 0; i < cache->num_nodes; i++) {
+		if (!cache->nodes[i].is_cdd)
+			break;
+	}
+
+	cache->num_cdd = i;
+
+	if (!cache->num_cdd)
+		return -ENODEV;
+
+	if (cache->num_cdd % cache->num_sockets) {
+		pr_warn("CDD count %u not divisible by %u sockets\n",
+			cache->num_cdd, cache->num_sockets);
+		return -EINVAL;
+	}
+
+	cdd_per_socket = cache->num_cdd / cache->num_sockets;
+	if (!cdd_per_socket)
+		return -EINVAL;
+
+	for (i = 0; i < cache->num_cdd; i++) {
+		u8 socket_id = cache->nodes[i].socket_id;
+
+		if (socket_id >= cache->num_sockets)
+			return -EINVAL;
+		per_sock_count[socket_id]++;
+	}
+
+	for (i = 0; i < cache->num_sockets; i++) {
+		if (per_sock_count[i] != cdd_per_socket) {
+			pr_warn("socket %u: %u CDDs, expected %u\n",
+				i, per_sock_count[i], cdd_per_socket);
+			return -EINVAL;
+		}
+	}
+
+	hygon_dump_nodes(cache, "after-sort");
+
+	return 0;
+}
+
+/*
+ * Build the global DF node cache.
+ *
+ * Called once from hygon_node_init() at fs_initcall, so no locking is
+ * required. Set ready after node collection and sorting.
+ */
+static int __init hygon_build_cache(void)
+{
+	int err;
+
+	err = hygon_collect_nodes(&hygon_cache);
+	if (err)
+		return err;
+
+	err = hygon_sort_and_classify(&hygon_cache);
+	if (err)
+		goto fail;
+
+	hygon_cache.ready = true;
+
+	return 0;
+
+fail:
+	hygon_release_nodes(hygon_cache.nodes, hygon_cache.num_nodes);
+	hygon_cache.nodes = NULL;
+	hygon_cache.num_nodes = 0;
+	hygon_cache.num_cdd = 0;
+	hygon_cache.num_sockets = 0;
+	return err;
+}
+
+u16 hygon_node_num(void)
+{
+	return hygon_cache.ready ? hygon_cache.num_nodes : 0;
+}
+EXPORT_SYMBOL_GPL(hygon_node_num);
+
+u16 hygon_cdd_num(void)
+{
+	return hygon_cache.ready ? hygon_cache.num_cdd : 0;
+}
+EXPORT_SYMBOL_GPL(hygon_cdd_num);
+
+int hygon_node_get_info(u16 node, struct hygon_node_info *info)
+{
+	const struct hygon_node *n;
+
+	if (!info)
+		return -EINVAL;
+
+	if (!hygon_cache.ready)
+		return -ENODEV;
+
+	if (node >= hygon_cache.num_nodes)
+		return -EINVAL;
+
+	n = &hygon_cache.nodes[node];
+	info->socket_id = n->socket_id;
+	info->dfid      = n->dfid;
+	info->type      = n->is_cdd ? HYGON_NODE_CDD : HYGON_NODE_IOD;
+	return 0;
+}
+EXPORT_SYMBOL_GPL(hygon_node_get_info);
+
+struct pci_dev *hygon_node_get_func(u16 node, u8 func)
+{
+	if (!hygon_cache.ready)
+		return NULL;
+
+	if (node >= hygon_cache.num_nodes)
+		return NULL;
+
+	switch (func) {
+	case HYGON_DF_F3:
+		return pci_dev_get(hygon_cache.nodes[node].misc);
+	case HYGON_DF_F4:
+		return pci_dev_get(hygon_cache.nodes[node].link);
+	default:
+		return NULL;
+	}
+}
+EXPORT_SYMBOL_GPL(hygon_node_get_func);
+
+int hygon_pci_dev_to_df_node(struct pci_dev *pdev)
+{
+	u16 i;
+
+	if (!pdev)
+		return -EINVAL;
+
+	if (!hygon_cache.ready)
+		return -ENODEV;
+
+	for (i = 0; i < hygon_cache.num_nodes; i++) {
+		struct pci_dev *misc = hygon_cache.nodes[i].misc;
+
+		if (pci_domain_nr(misc->bus) == pci_domain_nr(pdev->bus) &&
+		    misc->bus->number       == pdev->bus->number      &&
+		    PCI_SLOT(misc->devfn)   == PCI_SLOT(pdev->devfn))
+			return i;
+	}
+
+	return -ENODEV;
+}
+EXPORT_SYMBOL_GPL(hygon_pci_dev_to_df_node);
+
+/*
+ * Build the Hygon DF node cache at fs_initcall.
+ */
+static int __init hygon_node_init(void)
+{
+	int ret;
+
+	if (!hygon_get_df_cfg())
+		return 0;
+
+	ret = hygon_build_cache();
+	if (ret) {
+		pr_warn("DF node cache build failed: %d\n", ret);
+		return ret;
+	}
+
+	pr_info("%u DF nodes (%u CDDs, %u IODs) across %u sockets\n",
+		hygon_cache.num_nodes, hygon_cache.num_cdd,
+		hygon_cache.num_nodes - hygon_cache.num_cdd,
+		hygon_cache.num_sockets);
+
+	return 0;
+}
+fs_initcall(hygon_node_init);
-- 
2.43.0

