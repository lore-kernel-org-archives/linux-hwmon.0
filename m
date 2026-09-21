Received: from out28-74.mail.aliyun.com (out28-74.mail.aliyun.com [115.124.28.74])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 781D0369D66;
	Mon, 21 Sep 2026 05:56:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=115.124.28.74
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789970197; cv=none; b=oPWgPFcCD4WRCx9/sh3gleMmmfjBnQhRfFh3XuF5eAQAxmi7GN+eluCNzU3w1yKVDUymx9o9NuqQV/fDABldQvNvsJ7DAPI4GIkmvkCulq/sNcXeN03kpcYODp+lyTX1M/SQHhBmqzZxhgyqWK9ScgT+FW1H25vbp3SddgyD+F8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789970197; c=relaxed/simple;
	bh=gAXN7vJN3KL194iCrO3inFV0GNoyn37f9MiEYQVUpB0=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=Li9mfRpS1u0VBkhYM4nzCcppZdgmg+nNUOngwVUZTyN1xfN4kjD4epxyPCJqOpyffCo+QKA9SkIOcr0v4QbbPcTGjByjGzUGobiVT/OroBpOLwq3Omr/CAJoeVAqK1FgmmHEjwQN3ptvhDWLj2KcqWlfu5rZZNnAFg6+8hSc914=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=open-hieco.net; spf=pass smtp.mailfrom=open-hieco.net; arc=none smtp.client-ip=115.124.28.74
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=open-hieco.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=open-hieco.net
X-Alimail-AntiSpam:AC=CONTINUE;BC=0.07436259|-1;CH=green;DM=|CONTINUE|false|;DS=CONTINUE|ham_alarm|0.00852627-4.91589e-05-0.991425;FP=18014799132210578666|1|1|1|0|-1|-1|-1;HT=maildocker-contentspam033023018039;MF=wanglin@open-hieco.net;NM=1;PH=DS;RN=15;RT=15;SR=0;TI=SMTPD_---.jIkm1x1_1789970183;
Received: from localhost.localdomain(mailfrom:wanglin@open-hieco.net fp:SMTPD_---.jIkm1x1_1789970183 cluster:ay29)
          by smtp.aliyun-inc.com;
          Mon, 21 Sep 2026 13:56:24 +0800
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
Subject: [PATCH v6 8/8] x86/hygon: Add Family 0x18 SMN access
Date: Mon, 21 Sep 2026 13:56:03 +0800
Message-ID: <20260921055603.25112-9-wanglin@open-hieco.net>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260921055603.25112-1-wanglin@open-hieco.net>
References: <20260921055603.25112-1-wanglin@open-hieco.net>
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Hygon Family 0x18 DF nodes in a socket share an SMN ingress. The root
groups therefore need to be associated with sockets before they can be
expanded to the dense DF node indices.

Build the node-to-root map after DF enumeration. Retain a reference to
and reserve PCI config space for every enumerated root, and serialize
each index/data transaction. Make Hygon SMN access available only after
setup succeeds; a failure leaves the DF node cache usable without SMN
access.

Signed-off-by: Lin Wang <wanglin@open-hieco.net>
---
 arch/x86/include/asm/hygon/node.h |  40 ++++-
 arch/x86/kernel/hygon_node.c      | 248 +++++++++++++++++++++++++++++-
 2 files changed, 285 insertions(+), 3 deletions(-)

diff --git a/arch/x86/include/asm/hygon/node.h b/arch/x86/include/asm/hygon/node.h
index 23af0d44a432..a2048f552d02 100644
--- a/arch/x86/include/asm/hygon/node.h
+++ b/arch/x86/include/asm/hygon/node.h
@@ -2,8 +2,8 @@
 /*
  * Hygon Family 0x18 Data Fabric node enumeration API
  *
- * This header declares Hygon Fam18h DF node enumeration and function
- * access interfaces.
+ * DF node identity, CPU-to-DF-node translation, DF function lookup and
+ * SMN access for Hygon Family 0x18.
  */
 #ifndef _ASM_X86_HYGON_NODE_H
 #define _ASM_X86_HYGON_NODE_H
@@ -118,6 +118,30 @@ struct pci_dev *hygon_node_get_func(u16 node, u8 func);
  */
 int hygon_pci_dev_to_df_node(struct pci_dev *pdev);
 
+/**
+ * hygon_smn_read() - Read a 32-bit value from a Hygon SMN address
+ * @node: DF node index in [0, hygon_node_num())
+ * @address: SMN address
+ * @value: Output value
+ *
+ * Return: 0 on success, -EINVAL if @value is NULL, -ENODEV if Hygon
+ * SMN is not initialized or @node is out of range, or a negative
+ * errno from the underlying PCI config access.
+ */
+int __must_check hygon_smn_read(u16 node, u32 address, u32 *value);
+
+/**
+ * hygon_smn_write() - Write a 32-bit value to a Hygon SMN address
+ * @node: DF node index in [0, hygon_node_num())
+ * @address: SMN address
+ * @value: Value to write
+ *
+ * Return: 0 on success, -ENODEV if Hygon SMN is not initialized or
+ * @node is out of range, or a negative errno from the underlying
+ * PCI config access.
+ */
+int __must_check hygon_smn_write(u16 node, u32 address, u32 value);
+
 #else /* !CONFIG_HYGON_NODE */
 
 static inline u16 hygon_node_num(void)
@@ -150,6 +174,18 @@ static inline int hygon_pci_dev_to_df_node(struct pci_dev *pdev)
 	return -ENODEV;
 }
 
+static inline int __must_check hygon_smn_read(u16 node, u32 address,
+					      u32 *value)
+{
+	return -ENODEV;
+}
+
+static inline int __must_check hygon_smn_write(u16 node, u32 address,
+					       u32 value)
+{
+	return -ENODEV;
+}
+
 #endif /* CONFIG_HYGON_NODE */
 
 #endif /* _ASM_X86_HYGON_NODE_H */
diff --git a/arch/x86/kernel/hygon_node.c b/arch/x86/kernel/hygon_node.c
index 8c21190a19c2..6aeea04c30f2 100644
--- a/arch/x86/kernel/hygon_node.c
+++ b/arch/x86/kernel/hygon_node.c
@@ -1,6 +1,6 @@
 // SPDX-License-Identifier: GPL-2.0-only
 /*
- * Hygon Family 0x18 Data Fabric node enumeration
+ * Hygon Family 0x18 Data Fabric node enumeration and SMN access
  *
  * A DF instance exposes sibling PCI functions in one slot. Function 3
  * is the misc device used for enumeration, function 4 is the link
@@ -17,10 +17,12 @@
 
 #include <linux/bitfield.h>
 #include <linux/bitops.h>
+#include <linux/cleanup.h>
 #include <linux/cpu.h>
 #include <linux/cpufeature.h>
 #include <linux/export.h>
 #include <linux/init.h>
+#include <linux/mutex.h>
 #include <linux/pci.h>
 #include <linux/pci_ids.h>
 #include <linux/processor.h>
@@ -641,6 +643,246 @@ int hygon_pci_dev_to_df_node(struct pci_dev *pdev)
 }
 EXPORT_SYMBOL_GPL(hygon_pci_dev_to_df_node);
 
+/*
+ * SMN index/data register pair offsets in the host-bridge PCI config
+ * space.  Reads and writes to a (node, address) pair are issued as a
+ * two-step transaction: write the SMN address to the index register,
+ * then read or write the value at the data register.
+ */
+#define HYGON_SMN_INDEX_OFFSET	0x60
+#define HYGON_SMN_DATA_OFFSET	0x64
+
+/*
+ * Runtime SMN state.
+ *
+ * The hygon_smn_reserved_roots array owns the independent PCI references and
+ * config-space reservations for the lifetime of the built-in node layer. The
+ * hygon_smn_roots array contains per-node aliases and is published only after
+ * setup succeeds.
+ */
+static struct pci_dev	**hygon_smn_roots;
+static struct pci_dev	**hygon_smn_reserved_roots;
+static u16		hygon_smn_num_nodes;
+static DEFINE_MUTEX(hygon_smn_mutex);
+
+/* Internal cache accessors used by SMN setup. */
+static u8 __init hygon_node_socket(u16 node)
+{
+	if (!hygon_cache.nodes || node >= hygon_cache.num_nodes)
+		return U8_MAX;
+	return hygon_cache.nodes[node].socket_id;
+}
+
+static u16 __init hygon_socket_num(void)
+{
+	return hygon_cache.num_sockets;
+}
+
+/*
+ * Walk PCI host-bridge devices matching the Hygon vendor. The SMN
+ * index/data registers live in function 0 of each root complex. This
+ * follows pci_get_class() iterator semantics: @root is consumed and the
+ * returned device has an iterator reference. A retained device needs an
+ * independent reference before the iterator advances.
+ */
+static struct pci_dev * __init hygon_get_next_root(struct pci_dev *root)
+{
+	while ((root = pci_get_class(PCI_CLASS_BRIDGE_HOST << 8, root))) {
+		if (root->devfn)
+			continue;
+		if (root->vendor != PCI_VENDOR_ID_HYGON)
+			continue;
+		break;
+	}
+	return root;
+}
+
+/* Release each config region before dropping its owning device reference. */
+static void __init hygon_release_reserved_roots(struct pci_dev **roots,
+						u16 count)
+{
+	u16 i;
+
+	for (i = 0; i < count; i++) {
+		pci_release_config_region(roots[i], 0, PCI_CFG_SPACE_SIZE);
+		pci_dev_put(roots[i]);
+	}
+}
+
+/*
+ * Select one root from each contiguous per-socket enumeration group,
+ * then map every DF node to the root for its socket. The root socket ID
+ * cannot be read back, so the grouping follows PCI enumeration order.
+ *
+ * The hygon_smn_reserved_roots array owns the PCI references and config
+ * regions. The hygon_smn_roots array contains per-node aliases. Enable SMN
+ * access only after both arrays are complete.
+ */
+static int __init hygon_smn_setup(void)
+{
+	u16 num_roots, roots_per_socket, node, num_nodes, num_sockets, reserved;
+	struct pci_dev **reserved_roots, **roots;
+	struct pci_dev *root = NULL;
+	u8 socket_id;
+	int ret;
+
+	num_roots = 0;
+	while ((root = hygon_get_next_root(root)))
+		num_roots++;
+
+	pr_debug("Found %u Hygon SMN root devices\n", num_roots);
+
+	if (!num_roots)
+		return -ENODEV;
+
+	num_nodes = hygon_node_num();
+	if (!num_nodes)
+		return -ENODEV;
+
+	num_sockets = hygon_socket_num();
+	if (!num_sockets)
+		return -ENODEV;
+
+	if (num_roots % num_sockets) {
+		pr_err("Root count %u not divisible by socket count %u\n",
+		       num_roots, num_sockets);
+		return -ENODEV;
+	}
+
+	roots = kcalloc(num_nodes, sizeof(*roots), GFP_KERNEL);
+	if (!roots)
+		return -ENOMEM;
+
+	reserved_roots = kcalloc(num_roots, sizeof(*reserved_roots),
+				 GFP_KERNEL);
+	if (!reserved_roots) {
+		kfree(roots);
+		return -ENOMEM;
+	}
+
+	/* Reserve every root before publishing the node-to-root mapping. */
+	roots_per_socket = num_roots / num_sockets;
+	reserved = 0;
+	while ((root = hygon_get_next_root(root))) {
+		if (reserved >= num_roots) {
+			ret = -ENODEV;
+			goto err_release;
+		}
+
+		pci_dbg(root, "Reserving PCI config space\n");
+
+		/*
+		 * Mark the entire PCI config space kernel-exclusive because it
+		 * contains the SMN index/data registers.
+		 */
+		if (!pci_request_config_region_exclusive(root, 0,
+							 PCI_CFG_SPACE_SIZE,
+							 NULL)) {
+			pci_err(root, "Failed to reserve config space\n");
+			ret = -EEXIST;
+			goto err_release;
+		}
+
+		reserved_roots[reserved++] = pci_dev_get(root);
+	}
+
+	if (reserved != num_roots) {
+		pr_err("Root enumeration changed: expected %u roots, got %u\n",
+		       num_roots, reserved);
+		ret = -ENODEV;
+		goto err_release;
+	}
+
+	for (node = 0; node < num_nodes; node++) {
+		socket_id = hygon_node_socket(node);
+
+		if (socket_id >= num_sockets) {
+			ret = -ENODEV;
+			goto err_release;
+		}
+
+		roots[node] = reserved_roots[socket_id * roots_per_socket];
+
+		pci_dbg(roots[node],
+			"is root for Hygon node %u (socket %u)\n",
+			node, socket_id);
+	}
+
+	hygon_smn_reserved_roots = reserved_roots;
+	hygon_smn_num_nodes = num_nodes;
+	hygon_smn_roots = roots;
+	return 0;
+
+err_release:
+	pci_dev_put(root);
+	hygon_release_reserved_roots(reserved_roots, reserved);
+	kfree(reserved_roots);
+	kfree(roots);
+	return ret;
+}
+
+/*
+ * Serialize the PCI index/data pair between in-kernel SMN users.
+ * The access sequence follows amd_smn_read() and amd_smn_write().
+ * The Hygon node-to-root mapping comes from hygon_smn_setup().
+ */
+static int __hygon_smn_rw(u16 node, u32 address, u32 *value, bool write)
+{
+	struct pci_dev *root;
+	int err;
+
+	if (!hygon_smn_roots || node >= hygon_smn_num_nodes)
+		return -ENODEV;
+
+	root = hygon_smn_roots[node];
+	if (!root)
+		return -ENODEV;
+
+	guard(mutex)(&hygon_smn_mutex);
+
+	err = pci_write_config_dword(root, HYGON_SMN_INDEX_OFFSET, address);
+	if (err) {
+		pr_warn("SMN index write failed (addr 0x%x)\n", address);
+		return pcibios_err_to_errno(err);
+	}
+
+	err = write ? pci_write_config_dword(root, HYGON_SMN_DATA_OFFSET, *value)
+		    : pci_read_config_dword(root, HYGON_SMN_DATA_OFFSET, value);
+
+	return pcibios_err_to_errno(err);
+}
+
+int hygon_smn_read(u16 node, u32 address, u32 *value)
+{
+	int err;
+
+	if (!value)
+		return -EINVAL;
+
+	err = __hygon_smn_rw(node, address, value, false);
+
+	/* Clear the output so callers do not consume a stale value. */
+	if (err) {
+		*value = 0;
+		return err;
+	}
+
+	/* Treat the PCI all-ones value as a missing device. */
+	if (PCI_POSSIBLE_ERROR(*value)) {
+		*value = 0;
+		return -ENODEV;
+	}
+
+	return 0;
+}
+EXPORT_SYMBOL_GPL(hygon_smn_read);
+
+int hygon_smn_write(u16 node, u32 address, u32 value)
+{
+	return __hygon_smn_rw(node, address, &value, true);
+}
+EXPORT_SYMBOL_GPL(hygon_smn_write);
+
 static int __init hygon_node_init(void)
 {
 	int ret;
@@ -659,6 +901,10 @@ static int __init hygon_node_init(void)
 		hygon_cache.num_nodes - hygon_cache.num_cdd,
 		hygon_cache.num_sockets);
 
+	ret = hygon_smn_setup();
+	if (ret)
+		pr_warn("SMN setup failed: %d\n", ret);
+
 	return 0;
 }
 fs_initcall(hygon_node_init);
-- 
2.43.0

