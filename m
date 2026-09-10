Received: from out28-122.mail.aliyun.com (out28-122.mail.aliyun.com [115.124.28.122])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 841BA3F1ADA;
	Thu, 10 Sep 2026 08:28:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=115.124.28.122
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789028885; cv=none; b=q+pfr0n6miHmilQjg/yIWFRya00hb5fj6nundwy9QBE1trzDE46JqfZf6a2OfWp9/7WWoJFEX0NJxxjsTA77QkBOVCnzPiqkv0vK6MjQACd0yjwHmiw+dodNpciNO/4q7yoeGtxqb1mpfJYZYbILpQm5sZkasuzMVoMaml/dqoo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789028885; c=relaxed/simple;
	bh=+Ih/mzzz23PxzgsInvOf1KV3e+Ff5Pd8XQ6TygF9OkQ=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=BwqpSVZ5v7mmmTIh7BTZmaLCwpGG2dBjVUQXcjPFFUgFOydHO1mJCwRXEKs4ZxTd+C1ereNbma5/NCACEfrp/cr9bLgpoaaR4qE2Lz7vQwPrW3rK+6YBYdOl17UymPRVFdzVc5S6pusgMqsklfkRm7gk3SUUb+34Okw91OQpH2E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=open-hieco.net; spf=pass smtp.mailfrom=open-hieco.net; arc=none smtp.client-ip=115.124.28.122
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=open-hieco.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=open-hieco.net
X-Alimail-AntiSpam:AC=CONTINUE;BC=0.1959432|-1;CH=green;DM=|CONTINUE|false|;DS=CONTINUE|ham_system_inform|0.0220792-0.18182-0.796101;FP=7902404667849131669|0|0|0|0|-1|-1|-1;HT=maildocker-contentspam033045220102;MF=wanglin@open-hieco.net;NM=1;PH=DS;RN=15;RT=15;SR=0;TI=SMTPD_---.jAJ357r_1789028870;
Received: from localhost.localdomain(mailfrom:wanglin@open-hieco.net fp:SMTPD_---.jAJ357r_1789028870 cluster:ay29)
          by smtp.aliyun-inc.com;
          Thu, 10 Sep 2026 16:27:50 +0800
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
Subject: [PATCH v5 4/8] RAS/AMD/ATL: Match AMD CPUs only
Date: Thu, 10 Sep 2026 16:27:30 +0800
Message-ID: <20260910082734.3771675-5-wanglin@open-hieco.net>
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

The ATL CPU table matches Hygon through X86_FEATURE_SMCA and
X86_FEATURE_ZEN, but the library obtains its node count and F4 devices
from the AMD northbridge cache. That cache maps dense node indices to
fixed PCI slots. Hygon PCI slots do not encode node identity, and CPU
NodeIds are sparse across sockets. The cache therefore cannot represent
the Hygon topology or provide ATL with a valid node-to-F4 mapping.

A failed fixed-slot F3 lookup leaves the cache empty, so amd_atl_init()
exits at its amd_nb_num() check.

Limit both feature matches to AMD. Hygon address translation requires
the Hygon node interfaces and will be added separately.

Signed-off-by: Lin Wang <wanglin@open-hieco.net>
---
 drivers/ras/amd/atl/core.c | 9 ++++-----
 1 file changed, 4 insertions(+), 5 deletions(-)

diff --git a/drivers/ras/amd/atl/core.c b/drivers/ras/amd/atl/core.c
index d77dacdd4f56..fe84fc52c657 100644
--- a/drivers/ras/amd/atl/core.c
+++ b/drivers/ras/amd/atl/core.c
@@ -176,18 +176,17 @@ static void check_for_legacy_df_access(void)
 }
 
 /*
- * This library provides functionality for AMD-based systems with a Data Fabric.
+ * This library provides functionality for AMD systems with a Data Fabric.
  * The set of systems with a Data Fabric is equivalent to the set of Zen-based systems
  * and the set of systems with the Scalable MCA feature at this time. However, these
  * are technically independent things.
  *
  * It's possible to match on the PCI IDs of the Data Fabric devices, but this will be
- * an ever expanding list. Instead, match on the SMCA and Zen features to cover all
- * relevant systems.
+ * an ever expanding list. Instead, match AMD CPUs with the SMCA and Zen features.
  */
 static const struct x86_cpu_id amd_atl_cpuids[] = {
-	X86_MATCH_FEATURE(X86_FEATURE_SMCA, NULL),
-	X86_MATCH_FEATURE(X86_FEATURE_ZEN, NULL),
+	X86_MATCH_VENDOR_FEATURE(AMD, X86_FEATURE_SMCA, NULL),
+	X86_MATCH_VENDOR_FEATURE(AMD, X86_FEATURE_ZEN, NULL),
 	{ }
 };
 
-- 
2.43.0

