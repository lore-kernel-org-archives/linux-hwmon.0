Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=115.124.28.219
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792654960;
	b=qI4Bqd6py3qod9doR//jSuxOMys9Yt6gJrfHdCFMTDZJ/WpPIowFzRqNyS2iTAyAJGtr
	 RnY/aLtVbyjN2SLUvVGaeGKIwYpSOibmS0FEIY3jyBOPHmyIG2KKSZDjnx/CpdotwRh3+
	 Vp2QmH+AuPMuFzeqU1xi3FwC0rQoKbXGK48muQ/j7mkoV1CUO5CXLxzyQhbGmNtjwz1EV
	 ulej4H+znMsXmY/LIl2OcGLcU/W4mGdlD9XqL0BnFDRtDAShkjYh6bXODv5gPl2152JLm
	 XsZhENHFu0t7/4xZaZR7cowJjR9VURegae6BH/gIevwIirXK26Y3nUEZyqLQxPOQsxg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792654960;
	h=DMARC-Filter:X-Alimail-AntiSpam:Received:From:To:Cc:Subject:Date:
	 Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding;
	bh=5bscZzYbNdNozNQz2i6rpQrEehAPtJuDNBdUBH2QEig=;
	b=svkhdq/7r+5IQhcgpBY5awsllZmVoAQ4s1X/dy83iKc7u7vCmZ3OKHiuF7wZU++5IyQW
	 pNXzDDfntJv9HrmdMI/jRJzin0pOporZY+l1W+rEdrApE/7GSSMC01A5DEZtDrIqedsEa
	 +Dg0gYZc2h6EL+YsdP0g4x4NZaE0+bVamTY+QQULbMBm1tjNn9+lp8vXMPACRa/SpkonQ
	 ZJaX4uE8TBOeYa4lA8J3Eh/MZLZvBu3BWi/SHRe23Obka7mARL1Q8RwZgJWfjeB5DbSLx
	 LQc3R7g88U4mp1IPI+6zkqy0TlPd/PEbv7d+RWUGPxi1XpBerCkPiW/WOPIWFj/S5zg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=open-hieco.net;
	spf=pass smtp.mailfrom=open-hieco.net;
	arc=none smtp.remote-ip=115.124.28.219
Received: from out28-219.mail.aliyun.com (out28-219.mail.aliyun.com [115.124.28.219])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E3553606A320;
	Thu, 22 Oct 2026 07:42:37 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org E3553606A320
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=open-hieco.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=open-hieco.net
X-Alimail-AntiSpam:AC=CONTINUE;BC=0.1979483|-1;CH=green;DM=|CONTINUE|false|;DS=CONTINUE|ham_system_inform|0.0220033-0.181048-0.796949;FP=3290717545082472337|0|0|0|0|-1|-1|-1;HT=maildocker-contentspam033040092104;MF=wanglin@open-hieco.net;NM=1;PH=DS;RN=14;RT=14;SR=0;TI=SMTPD_---.jn83zaG_1792654949;
Received: from localhost.localdomain(mailfrom:wanglin@open-hieco.net fp:SMTPD_---.jn83zaG_1792654949 cluster:ay29)
          by smtp.aliyun-inc.com;
          Thu, 22 Oct 2026 15:42:30 +0800
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
Subject: [PATCH v8 4/7] RAS/AMD/ATL: Match AMD CPUs only
Date: Thu, 22 Oct 2026 15:42:14 +0800
Message-ID: <20261022074218.667049-5-wanglin@open-hieco.net>
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

ATL matches Hygon through X86_FEATURE_SMCA and X86_FEATURE_ZEN, but
relies on the AMD northbridge cache for its node count and F4 devices.
The cache uses fixed PCI slots that do not represent the Hygon topology.

The cache is therefore discarded before ATL can register its decoder,
so excluding Hygon from these feature matches does not disable a
working address translation path.

Qualify both feature matches with the AMD vendor. Hygon address
translation will use the Hygon node interfaces in a separate series.

Signed-off-by: Lin Wang <wanglin@open-hieco.net>
Reviewed-by: Yazen Ghannam <yazen.ghannam@amd.com>
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

