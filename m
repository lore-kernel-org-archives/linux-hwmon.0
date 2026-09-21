Received: from out28-4.mail.aliyun.com (out28-4.mail.aliyun.com [115.124.28.4])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 909BB367F36;
	Mon, 21 Sep 2026 05:56:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=115.124.28.4
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789970196; cv=none; b=tqFeGOmlm/mAyBC7ZjmyF0XlxuTkq9VzuY/Y3TWuAu/7qJ12/4D5hIM1uufiIyJ+NRi9mW09acZQz1sYCNedzieKx/HPqTd8hF0EOGQYu/AxZNI6ELZSic/Ojcmb4sYyR1l4+Yrfqn07Y3xLQSzb0donAf1/4qpS3YhOaxIyAk8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789970196; c=relaxed/simple;
	bh=bkvlccMVkNJNgMPa5KZtN0Rj9B2vVWUR+4ZVGEMptx0=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=MscxUk5c6j9SQksbQTDRo+hOBHTbr3xGw9V7LjHN8mAvu7uAzhQ2l9li3JPFTQ+pXv1u9ktZf02VuTmDA3ZJt9+NnADKHaLQFkYD7FL9O1ek4YoOx5OiLCP76GNR9uPbKVg7/vZVKPGxfPqQpXBx+LcmpVoeVHx3vHDm+fZIYz8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=open-hieco.net; spf=pass smtp.mailfrom=open-hieco.net; arc=none smtp.client-ip=115.124.28.4
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=open-hieco.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=open-hieco.net
X-Alimail-AntiSpam:AC=CONTINUE;BC=0.08401445|-1;CH=green;DM=|CONTINUE|false|;DS=CONTINUE|ham_alarm|0.00227817-0.00107444-0.996647;FP=6920001056461840522|1|1|1|0|-1|-1|-1;HT=maildocker-contentspam033037071049;MF=wanglin@open-hieco.net;NM=1;PH=DS;RN=15;RT=15;SR=0;TI=SMTPD_---.jIkm1vY_1789970182;
Received: from localhost.localdomain(mailfrom:wanglin@open-hieco.net fp:SMTPD_---.jIkm1vY_1789970182 cluster:ay29)
          by smtp.aliyun-inc.com;
          Mon, 21 Sep 2026 13:56:23 +0800
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
Subject: [PATCH v6 7/8] x86/amd_node: Restrict SMN setup to AMD CPUs
Date: Mon, 21 Sep 2026 13:56:02 +0800
Message-ID: <20260921055603.25112-8-wanglin@open-hieco.net>
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

amd_smn_init() divides host bridge roots among amd_num_nodes() entries
in PCI enumeration order. Hygon DF nodes instead share one SMN ingress
per socket, so the AMD root map cannot provide Hygon SMN access.

amd64_edac, ATL and k10temp no longer depend on AMD northbridge or SMN
state on Hygon. Restrict AMD SMN setup and root discovery to AMD CPUs,
leaving the Hygon roots available for the Hygon node layer.

Signed-off-by: Lin Wang <wanglin@open-hieco.net>
---
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

