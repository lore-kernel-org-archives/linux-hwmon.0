Received: from out28-121.mail.aliyun.com (out28-121.mail.aliyun.com [115.124.28.121])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D6EE93DA7D2;
	Thu, 10 Sep 2026 08:27:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=115.124.28.121
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789028881; cv=none; b=A0ckP4zVLvOnaKlxap2QyEmSOoW8vUEnaooBMNgVqqMe/k2rhmSV46Z1xmq+t40Yy6pozTyxLTGXB7sdJ84vXn5p4STE1VoUQJJ46HgKuUzUA5EX+RQhgd3td53yhEkKfFYS9P1WMa/xarYAGa9X8UHF/F5bAreyquAAAJlKAZk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789028881; c=relaxed/simple;
	bh=Pr39XLfcd9qbwdpM7fxPS4rXL2HDyQxMto1UfwirwJI=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=EXNBBBov8yAatfNmvdliDDAQhyRhcOOyrI3E7y7c4t0hOZ/FIDqHR3Slant7rwPpu5Q/kSgRw4rA3aWiklXE1shcu3K+DdzHBBld4dhk9HT9gwFuIPDj+VsnYGh1HfyI2JYNIL8uOc7Rya4TFC/+XMORMFgbj0C9tmFPVc4dKwg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=open-hieco.net; spf=pass smtp.mailfrom=open-hieco.net; arc=none smtp.client-ip=115.124.28.121
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=open-hieco.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=open-hieco.net
X-Alimail-AntiSpam:AC=CONTINUE;BC=0.08564156|-1;CH=green;DM=|CONTINUE|false|;DS=CONTINUE|ham_system_inform|0.0038488-0.00194723-0.994204;FP=16179964844508209290|0|0|0|0|-1|-1|-1;HT=maildocker-contentspam033037028158;MF=wanglin@open-hieco.net;NM=1;PH=DS;RN=15;RT=15;SR=0;TI=SMTPD_---.jAJ35BI_1789028873;
Received: from localhost.localdomain(mailfrom:wanglin@open-hieco.net fp:SMTPD_---.jAJ35BI_1789028873 cluster:ay29)
          by smtp.aliyun-inc.com;
          Thu, 10 Sep 2026 16:27:53 +0800
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
Subject: [PATCH v5 7/8] x86/amd_node: Restrict SMN setup to AMD CPUs
Date: Thu, 10 Sep 2026 16:27:33 +0800
Message-ID: <20260910082734.3771675-8-wanglin@open-hieco.net>
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

amd_smn_init() divides host bridge roots among amd_num_nodes() entries
in PCI enumeration order. Hygon DF nodes instead share one SMN ingress
per socket, so the AMD root map cannot provide Hygon SMN access.

The preceding patches remove the Hygon matches from amd64_edac, ATL and
k10temp. Restrict AMD SMN setup and root discovery to AMD CPUs, leaving
the Hygon roots available for the Hygon node layer.

Signed-off-by: Lin Wang <wanglin@open-hieco.net>
---
 arch/x86/kernel/amd_node.c | 6 ++++--
 1 file changed, 4 insertions(+), 2 deletions(-)

diff --git a/arch/x86/kernel/amd_node.c b/arch/x86/kernel/amd_node.c
index 762585775b5a..a7190cec6995 100644
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
 	struct pci_dev *root;
 
+	if (boot_cpu_data.x86_vendor != X86_VENDOR_AMD)
+		return 0;
+
 	if (!cpu_feature_enabled(X86_FEATURE_ZEN))
 		return 0;
 
-- 
2.43.0

