Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=115.124.28.220
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792654962;
	b=xTw/rs42I/4LYdZfSPOfc8YXIcKyejPz+hYJcGXLQ487pWjEx1nVWnM1PxeqerALYKC/
	 dTIihZtyA53ArU/0lq9MudYTuGhMd99MiS4SL85Tr2nUpF0B+6sjr1xdTrbn2hEs9XwKc
	 aqPY468VYB9EO2mvlcvUIB3ssC2v/EYCOMryftnG/KoWgY9TJJM895Iwp+dDAzn5Er6WO
	 CcoWuHgxprK1ZLipEWk/uDDk49leokMUrFbDo673pSz05jXb6zTF/tQZt5g2bbdeNtTQE
	 PUvG39DUK5VcOi61YuzQ1uHGwEp7TzyLb3L+ANEuXylOnBc98yMS8nd6uhGZXx/k7zg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792654962;
	h=DMARC-Filter:X-Alimail-AntiSpam:Received:From:To:Cc:Subject:Date:
	 Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding;
	bh=gnrmAKlUPO2OINr4YAOG77jvOqACeQkpcqShk90EPdg=;
	b=uIsRbZ6S57ljGbdUvVzF54rN7nnuqc9ZzpFU6cJGXBUvifzubBrcgAU48aBZ58WNTEnk
	 Rb2evxKigjlJmIghzvUF2ebm+V+YB09rssrwDhivxzbQSecfDAfUvNXXmL07BxX8xAbN1
	 L5weimgrCQtYYxID5P1lxQ+EZrv5Oj2x0gxqB+vJcTMVKgcvmYzh24RQdK32f5FZKj3RS
	 UJgyDvzmkV0XoznicMgyfvZyKSJzrivdPDGhHvKxcsTPRf1pdYuAwL6IrIXGhyHSisc01
	 X52jjtapEPIEm/p+yxfDyWBPD3PV7LYxgVcJVKVx7Y5DiKVp+iimQ8LA774NLs5OR4Q==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=open-hieco.net;
	spf=pass smtp.mailfrom=open-hieco.net;
	arc=none smtp.remote-ip=115.124.28.220
Received: from out28-220.mail.aliyun.com (out28-220.mail.aliyun.com [115.124.28.220])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7D4A5606A331;
	Thu, 22 Oct 2026 07:42:40 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 7D4A5606A331
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=open-hieco.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=open-hieco.net
X-Alimail-AntiSpam:AC=CONTINUE;BC=0.07833075|-1;CH=green;DM=|CONTINUE|false|;DS=CONTINUE|ham_system_inform|0.0018941-0.000829-0.997277;FP=6920001129406808203|0|0|0|0|-1|-1|-1;HT=maildocker-contentspam033037028158;MF=wanglin@open-hieco.net;NM=1;PH=DS;RN=14;RT=14;SR=0;TI=SMTPD_---.jn83zcO_1792654951;
Received: from localhost.localdomain(mailfrom:wanglin@open-hieco.net fp:SMTPD_---.jn83zcO_1792654951 cluster:ay29)
          by smtp.aliyun-inc.com;
          Thu, 22 Oct 2026 15:42:32 +0800
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
Subject: [PATCH v8 6/7] x86/amd_node: Restrict SMN setup to AMD CPUs
Date: Thu, 22 Oct 2026 15:42:16 +0800
Message-ID: <20261022074218.667049-7-wanglin@open-hieco.net>
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

amd_smn_init() also runs on Hygon because Hygon sets X86_FEATURE_ZEN.
It reserves config space on the matching host-bridge roots and groups
them by the CPU-derived node count. Hygon DF nodes are enumerated by
PCI ID, CPU NodeIds are sparse, and the nodes in a socket share one SMN
ingress, so the resulting root map is wrong on Hygon. These reservations
also prevent the Hygon node layer from claiming roots for its own
node-to-root mapping.

Hygon vendor matching has been removed from amd64_edac, amd_atl, and
k10temp modules. The remaining users match AMD PCI IDs or check for an
AMD CPU. With these changes in place, no in-tree Hygon driver uses the
AMD SMN accessors.

Restrict SMN setup and root discovery to AMD CPUs.

Signed-off-by: Lin Wang <wanglin@open-hieco.net>
Reviewed-by: Yazen Ghannam <yazen.ghannam@amd.com>
---

Notes (hygon-node-deps):
    Depends on commit 08e6615c909b ("hwmon: (k10temp) Stop matching Hygon
    devices") in hwmon-next, which is not in mainline yet. It must be merged
    before this patch.

 arch/x86/kernel/amd_node.c | 6 ++++--
 1 file changed, 4 insertions(+), 2 deletions(-)

diff --git a/arch/x86/kernel/amd_node.c b/arch/x86/kernel/amd_node.c
index b7926ba3610a..c36b410d04a4 100644
--- a/arch/x86/kernel/amd_node.c
+++ b/arch/x86/kernel/amd_node.c
@@ -229,8 +229,7 @@ static struct pci_dev *get_next_root(struct pci_dev *root)
 		if (root->devfn)
 			continue;
 
-		if (root->vendor != PCI_VENDOR_ID_AMD &&
-		    root->vendor != PCI_VENDOR_ID_HYGON)
+		if (root->vendor != PCI_VENDOR_ID_AMD)
 			continue;
 
 		break;
@@ -253,6 +252,9 @@ static int __init amd_smn_init(void)
 	u16 count, num_roots, roots_per_node, node, num_nodes;
 	struct pci_dev *root __free(pci_dev_put) = NULL;
 
+	if (boot_cpu_data.x86_vendor != X86_VENDOR_AMD)
+		return 0;
+
 	if (!cpu_feature_enabled(X86_FEATURE_ZEN))
 		return 0;
 
-- 
2.43.0

