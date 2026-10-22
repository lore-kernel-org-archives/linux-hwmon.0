Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=115.124.28.5
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792654959;
	b=AS4LBN0KcoJhDJy/oDF8X3H5cMmoPWTHtO57sWnpTaljTvkCZjxOvwl0M5Y3+ntqINN+
	 5ODiEVtyAibQkMVMWB5yemynpGYZsQW05Otr1r3hJ+C6Vmtn6WD4Ti6RN8ir/F20resQE
	 hub9qc6FUUHmmpvHeesnWy1KYg0kJWw/ST26bLKdL/AUKxlA8O1kW8YALJ7WOm6AxT3Ti
	 QXs/n/f4y3uONHUYe/ezARLuyfmkdHtm05LG1S+mlQPk2IIRD3z70yQWfEOjQsz8iq+fd
	 HS/nSQEQCJ78wRQX0wkfuOd6RCy8hQ8/b0f7q3m8p0//CJKA/76Xe8bnOjzGOQCbfTA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792654959;
	h=DMARC-Filter:X-Alimail-AntiSpam:Received:From:To:Cc:Subject:Date:
	 Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding;
	bh=3UDEKgZUPckUGfKZJ0o0xSTXDylJXQWn0mYSGDOxAlI=;
	b=wxN1fG2Lx5fA6lG4jRqlNibK95e53Gf04ajkm3/vJNCaIHVxJCQ0K2tFBCc/rrfecwJ8
	 SJHE8/tj3Yt+vzQ/JMyEXrbHimtG/D66bdIf+gUQ0l6fYQdX0mz244o4F7PTtKj6rp9Id
	 iJn0te4NRixG1T31NxTshQeWPn4cintn7Q+cOy6Yx8NlcoS6eAv6J+WJWOrK1F7+fodEz
	 7vWPvwXlcBi7mfT+HpAE7CjFfGzcn85KfO/HkqgD3QVELfBx+DAby8QNrc9nDjdT7hq6j
	 gpKzXlkLX1mpuzEWFdS7eiu1qCNs0okq7Nck/Mmm9f3n0SYCJqXp4BbJYSGVrMKsrfw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=open-hieco.net;
	spf=pass smtp.mailfrom=open-hieco.net;
	arc=none smtp.remote-ip=115.124.28.5
Received: from out28-5.mail.aliyun.com (out28-5.mail.aliyun.com [115.124.28.5])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8B52C606A31E;
	Thu, 22 Oct 2026 07:42:37 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 8B52C606A31E
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=open-hieco.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=open-hieco.net
X-Alimail-AntiSpam:AC=CONTINUE;BC=0.07469408|-1;CH=green;DM=|CONTINUE|false|;DS=CONTINUE|ham_alarm|0.00447277-0.0011769-0.99435;FP=13836726345535406299|0|0|0|0|-1|-1|-1;HT=maildocker-contentspam033037034017;MF=wanglin@open-hieco.net;NM=1;PH=DS;RN=14;RT=14;SR=0;TI=SMTPD_---.jn83zY._1792654947;
Received: from localhost.localdomain(mailfrom:wanglin@open-hieco.net fp:SMTPD_---.jn83zY._1792654947 cluster:ay29)
          by smtp.aliyun-inc.com;
          Thu, 22 Oct 2026 15:42:28 +0800
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
Subject: [PATCH v8 2/7] x86/hygon: Map CPU NodeIds to DF nodes
Date: Thu, 22 Oct 2026 15:42:12 +0800
Message-ID: <20261022074218.667049-3-wanglin@open-hieco.net>
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

On bare-metal Hygon systems, CPUID 0x8000001E ECX[7:0] encodes a
CPU's socket and local CDD ordinal. The value is sparse across sockets
and cannot directly index the dense DF node cache.

Resolve the encoded socket and local ordinal against CDD entries in the
cache, which are ordered by socket and DFID. The NodeId reported by
CPUID in a guest may not describe the physical DF topology, so return
-ENODEV in guests or when it does not identify an enumerated CDD.

Hygon EDAC and ATL support will use this mapping. Keep it local until
that support is added.

Signed-off-by: Lin Wang <wanglin@open-hieco.net>
Reviewed-by: Yazen Ghannam <yazen.ghannam@amd.com>
---
 arch/x86/kernel/hygon_node.c | 54 ++++++++++++++++++++++++++++++++++++
 1 file changed, 54 insertions(+)

diff --git a/arch/x86/kernel/hygon_node.c b/arch/x86/kernel/hygon_node.c
index 6a5278f8e5ca..03c723aab97e 100644
--- a/arch/x86/kernel/hygon_node.c
+++ b/arch/x86/kernel/hygon_node.c
@@ -24,6 +24,7 @@
 #include <linux/processor.h>
 #include <linux/slab.h>
 #include <linux/sort.h>
+#include <linux/topology.h>
 
 #include <asm/cpu_device_id.h>
 #include <asm/hygon/node.h>
@@ -481,6 +482,44 @@ static int __init sort_and_classify(struct df_node_cache *cache)
 	return 0;
 }
 
+#define NODE_ID_SOCKET	GENMASK(7, 4)
+#define NODE_ID_LOCAL	GENMASK(3, 0)
+
+/*
+ * Translate a Hygon Fam18h phys_node_id (CPUID 8000001E ECX[7:0]) to a
+ * dense DF CDD index. On supported models, CPUID reports this
+ * encoding:
+ *
+ *   phys_node_id = (socket_id << 4) | local_cdd_index_in_dfid_order
+ *
+ * The CDD region of df_cache.nodes[] is sorted by (socket_id, dfid), so
+ * return the index of the CDD whose socket_id matches and whose
+ * socket-local ordinal is @local.
+ *
+ * Return -ENODEV if the cache is unavailable or no CDD matches.
+ */
+static int phys_nid_to_df_node(unsigned int phys_nid)
+{
+	unsigned int socket, local, ordinal = 0;
+	u16 i;
+
+	socket = FIELD_GET(NODE_ID_SOCKET, phys_nid);
+	local  = FIELD_GET(NODE_ID_LOCAL, phys_nid);
+
+	if (!df_cache.nodes)
+		return -ENODEV;
+
+	for (i = 0; i < df_cache.num_cdd; i++) {
+		if (df_cache.nodes[i].socket_id != socket)
+			continue;
+
+		if (ordinal++ == local)
+			return i;
+	}
+
+	return -ENODEV;
+}
+
 static int __init build_cache(void)
 {
 	struct df_node_cache cache = { };
@@ -533,6 +572,21 @@ static int __maybe_unused hygon_node_get_info(u16 node, struct hygon_node_info *
 	return 0;
 }
 
+static int __maybe_unused cpu_to_df_node(unsigned int cpu)
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
+	return phys_nid_to_df_node(topology_amd_node_id(cpu));
+}
+
 /* Return a referenced DF device; the caller must call pci_dev_put(). */
 static __maybe_unused struct pci_dev *hygon_node_get_func(u16 node, u8 func)
 {
-- 
2.43.0

