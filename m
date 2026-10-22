Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=115.124.28.148
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792654966;
	b=4kYZ9eNxSuPMiPPdnFbhg94y5qzpBJCig8CGBvp6HcCvGL8kciV6PpAcYdwuy7kzbHWz
	 JMeYyb7TIjSqa6aaGAhFDXjgFkSnaGi6CU8zNPfx5Mk73yiqJKGpA8OgWUoHEAjzpYyDM
	 dF2K1HY+V7sTedSSXfzIaZWS1gQ9wpXcujKmdUf14xQPWe1wxKWLcVGfcdiDGi+8UbRda
	 x/rlKn5yap6KF9Xr66NybhHL05479bW6g0+KX/ECY0VWiAcKgMC5HtnesLfwU48xUE1Tp
	 iG052J3Skg7O8pAefc11nRbg/jXZbC60mxi0xrFlvtqnrrR4FRAbkbBG0q/b20EgzAQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792654966;
	h=DMARC-Filter:X-Alimail-AntiSpam:Received:From:To:Cc:Subject:Date:
	 Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding;
	bh=a33329czHCD1ho9c6zx5Py0m9JNhHlWkNi5JGt21dnM=;
	b=0dTAXUdfqIs975GKhcczzwgAzuJKalTnYM3vV1wgXVBY1qvGXWEV3dRnjaY7muS/yDos
	 JZlgq/9IK0/TDPEsndNZsUB4c32tegRSAVxqLgy0+duJ7KRTLsbbG3XO8efhYOoL1rvqf
	 9axyvagnMkCI+7I9Xm1USkDn4ej/tRd0MR0t4Pmsy3ukbQwxKW1Mlf1r2MxXqlw+ZiQNO
	 adwPQlXfSvUcFCYdPEPo7KyK1QGOJBOlIFuUpeFkQFpzj3SIpf9KTVaXW5pjsx8x4TJt/
	 FaXxjXDRSgWtd6VLAIsMQhVcYHZoHsLJHPgmtVZ8nxcl4vz/sqwg3FJXfZxX1s6WcRA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=open-hieco.net;
	spf=pass smtp.mailfrom=open-hieco.net;
	arc=none smtp.remote-ip=115.124.28.148
Received: from out28-148.mail.aliyun.com (out28-148.mail.aliyun.com [115.124.28.148])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3B2E5606A334;
	Thu, 22 Oct 2026 07:42:43 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 3B2E5606A334
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=open-hieco.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=open-hieco.net
X-Alimail-AntiSpam:AC=CONTINUE;BC=0.07436259|-1;CH=green;DM=|CONTINUE|false|;DS=CONTINUE|ham_alarm|0.00588346-5.86965e-05-0.994058;FP=16289918284477580522|0|0|0|0|-1|-1|-1;HT=maildocker-contentspam033037034184;MF=wanglin@open-hieco.net;NM=1;PH=DS;RN=14;RT=14;SR=0;TI=SMTPD_---.jn83zdL_1792654952;
Received: from localhost.localdomain(mailfrom:wanglin@open-hieco.net fp:SMTPD_---.jn83zdL_1792654952 cluster:ay29)
          by smtp.aliyun-inc.com;
          Thu, 22 Oct 2026 15:42:33 +0800
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
	Guenter Roeck <linux@roeck-us.net>,
	x86@kernel.org,
	linux-edac@vger.kernel.org,
	linux-hwmon@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v8 7/7] x86/hygon: Add Family 0x18 SMN access
Date: Thu, 22 Oct 2026 15:42:17 +0800
Message-ID: <20261022074218.667049-8-wanglin@open-hieco.net>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261022074218.667049-1-wanglin@open-hieco.net>
References: <20261022074218.667049-1-wanglin@open-hieco.net>
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Post: <mailto:linux-hwmon@vger.kernel.org>
List-Help: <mailto:linux-hwmon+help@vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-hwmon+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

All DF nodes in a Hygon socket share one SMN ingress, so SMN accesses
for a node have to go through a root of the node's socket rather than a
root per node.

After DF enumeration, map each DF node to the first root of its socket.
The roots do not expose their socket IDs, so group them by socket
in PCI enumeration order. Hold a reference to every root, reserve its
config space, and serialize each index/data transaction. Enable SMN
access only after setup succeeds; on failure the DF node cache remains
usable without it.

Hygon drivers such as EDAC need SMN access. Keep the SMN read and write
helpers local to hygon_node.c until such drivers are added.

Signed-off-by: Lin Wang <wanglin@open-hieco.net>
Reviewed-by: Yazen Ghannam <yazen.ghannam@amd.com>
---
 arch/x86/kernel/hygon_node.c | 231 ++++++++++++++++++++++++++++++++++-
 1 file changed, 230 insertions(+), 1 deletion(-)

diff --git a/arch/x86/kernel/hygon_node.c b/arch/x86/kernel/hygon_node.c
index 03c723aab97e..7b0a18cd7027 100644
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
@@ -17,8 +17,10 @@
 
 #include <linux/bitfield.h>
 #include <linux/bitops.h>
+#include <linux/cleanup.h>
 #include <linux/cpufeature.h>
 #include <linux/init.h>
+#include <linux/mutex.h>
 #include <linux/pci.h>
 #include <linux/pci_ids.h>
 #include <linux/processor.h>
@@ -629,6 +631,229 @@ static int __maybe_unused hygon_pci_dev_to_df_node(struct pci_dev *pdev)
 	return -ENODEV;
 }
 
+/*
+ * SMN index/data register pair offsets in the host-bridge PCI config
+ * space. Reads and writes to a (node, address) pair are issued as a
+ * two-step transaction: write the SMN address to the index register,
+ * then read or write the value at the data register.
+ */
+#define SMN_INDEX_OFFSET	0x60
+#define SMN_DATA_OFFSET		0x64
+
+/*
+ * Runtime SMN state.
+ *
+ * The smn_reserved_roots array owns the independent PCI references and
+ * config-space reservations for the lifetime of the built-in node layer. The
+ * smn_roots array contains per-node aliases and is published only after
+ * setup succeeds.
+ */
+static struct pci_dev	**smn_roots;
+static struct pci_dev	**smn_reserved_roots;
+static u16		smn_num_nodes;
+static DEFINE_MUTEX(smn_mutex);
+
+/*
+ * Walk PCI host-bridge devices matching the Hygon vendor. The SMN
+ * index/data registers live in function 0 of each root complex. This
+ * follows pci_get_class() iterator semantics: @root is consumed and the
+ * returned device has an iterator reference. A retained device needs an
+ * independent reference before the iterator advances.
+ */
+static struct pci_dev * __init get_next_root(struct pci_dev *root)
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
+static void __init release_reserved_roots(struct pci_dev **roots, u16 count)
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
+ * then map every DF node to the root for its socket. The roots do not
+ * expose their socket IDs, so the grouping follows PCI enumeration order.
+ *
+ * The smn_reserved_roots array owns the PCI references and config
+ * regions. The smn_roots array contains per-node aliases. Enable SMN
+ * access only after both arrays are complete.
+ */
+static int __init smn_setup(void)
+{
+	u16 num_roots, roots_per_socket, node, num_nodes, num_sockets, reserved;
+	struct pci_dev **reserved_roots, **roots;
+	struct pci_dev *root = NULL;
+	u8 socket_id;
+	int ret;
+
+	num_roots = 0;
+	while ((root = get_next_root(root)))
+		num_roots++;
+
+	pr_debug("Found %u Hygon SMN root devices\n", num_roots);
+
+	if (!num_roots)
+		return -ENODEV;
+
+	num_nodes = df_cache.num_nodes;
+	if (!num_nodes)
+		return -ENODEV;
+
+	num_sockets = df_cache.num_sockets;
+	if (!num_sockets)
+		return -ENODEV;
+
+	if (num_roots % num_sockets) {
+		pr_err("Root count %u not divisible by socket count %u\n",
+		       num_roots, num_sockets);
+		return -ENODEV;
+	}
+
+	roots = kzalloc_objs(*roots, num_nodes);
+	if (!roots)
+		return -ENOMEM;
+
+	reserved_roots = kzalloc_objs(*reserved_roots, num_roots);
+	if (!reserved_roots) {
+		kfree(roots);
+		return -ENOMEM;
+	}
+
+	/* Reserve every root before publishing the node-to-root mapping. */
+	roots_per_socket = num_roots / num_sockets;
+	reserved = 0;
+	while ((root = get_next_root(root))) {
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
+		socket_id = df_cache.nodes[node].socket_id;
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
+	smn_reserved_roots = reserved_roots;
+	smn_num_nodes = num_nodes;
+	smn_roots = roots;
+	return 0;
+
+err_release:
+	pci_dev_put(root);
+	release_reserved_roots(reserved_roots, reserved);
+	kfree(reserved_roots);
+	kfree(roots);
+	return ret;
+}
+
+/*
+ * Serialize the PCI index/data pair between in-kernel SMN users.
+ * The access sequence follows amd_smn_read() and amd_smn_write().
+ * The Hygon node-to-root mapping comes from smn_setup().
+ */
+static int smn_rw(u16 node, u32 address, u32 *value, bool write)
+{
+	struct pci_dev *root;
+	int err;
+
+	if (!smn_roots || node >= smn_num_nodes)
+		return -ENODEV;
+
+	root = smn_roots[node];
+	if (!root)
+		return -ENODEV;
+
+	guard(mutex)(&smn_mutex);
+
+	err = pci_write_config_dword(root, SMN_INDEX_OFFSET, address);
+	if (err) {
+		pr_warn("SMN index write failed (addr 0x%x)\n", address);
+		return pcibios_err_to_errno(err);
+	}
+
+	err = write ? pci_write_config_dword(root, SMN_DATA_OFFSET, *value)
+		    : pci_read_config_dword(root, SMN_DATA_OFFSET, value);
+
+	return pcibios_err_to_errno(err);
+}
+
+static int __must_check __maybe_unused hygon_smn_read(u16 node, u32 address, u32 *value)
+{
+	int err;
+
+	if (!value)
+		return -EINVAL;
+
+	err = smn_rw(node, address, value, false);
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
+
+static int __must_check __maybe_unused hygon_smn_write(u16 node, u32 address, u32 value)
+{
+	return smn_rw(node, address, &value, true);
+}
+
 static int __init df_node_init(void)
 {
 	int ret;
@@ -648,6 +873,10 @@ static int __init df_node_init(void)
 		df_cache.num_nodes - df_cache.num_cdd,
 		df_cache.num_sockets);
 
+	ret = smn_setup();
+	if (ret)
+		pr_warn("SMN setup failed: %d\n", ret);
+
 	return 0;
 }
 fs_initcall(df_node_init);
-- 
2.43.0

