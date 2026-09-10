Received: from out28-122.mail.aliyun.com (out28-122.mail.aliyun.com [115.124.28.122])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A8B1B3DB325;
	Thu, 10 Sep 2026 08:27:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=115.124.28.122
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789028884; cv=none; b=n+fXARhsfSLy1xgquVDQk9idZRCEM2AYek1jR/r4Jpx1m6qKv7FqYDaM0yU2fva0GUokijVayZUuBTYD+dwLW1tIkx26khNoC86VcZKLSO2m2ptGj78RLTysgAvjJPfd2MH+T9arclXaRb9iBIkHqzb2Vc2aWQYiJDArMRhqeXU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789028884; c=relaxed/simple;
	bh=+YnLN+VkRDm3/0xrpu5OmkDkoKd4tGFXfYH+dNZnV5Y=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=Eiqqm+oqQudtRHaIZivdnYI1uOBv7NGOnGCPp9yyBWQ791nCI0NhFQjUGZ/M4ScTUrwzOxcxTX2QmAzt6JwqKwoSBCmJ4P9FTcyAvobbr4l1PyP0rFTG9AAVqlrCJkP2oSViIeaaOkcH2/ixxXWTcfnDmHl+Gmx2OGGLKZKwOIE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=open-hieco.net; spf=pass smtp.mailfrom=open-hieco.net; arc=none smtp.client-ip=115.124.28.122
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=open-hieco.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=open-hieco.net
X-Alimail-AntiSpam:AC=CONTINUE;BC=0.09531699|-1;CH=green;DM=|CONTINUE|false|;DS=CONTINUE|ham_system_inform|0.0129748-0.0460928-0.940932;FP=1146291024952902867|0|0|0|0|-1|-1|-1;HT=maildocker-contentspam033037032089;MF=wanglin@open-hieco.net;NM=1;PH=DS;RN=15;RT=15;SR=0;TI=SMTPD_---.jAJ356r_1789028869;
Received: from localhost.localdomain(mailfrom:wanglin@open-hieco.net fp:SMTPD_---.jAJ356r_1789028869 cluster:ay29)
          by smtp.aliyun-inc.com;
          Thu, 10 Sep 2026 16:27:49 +0800
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
Subject: [PATCH v5 3/8] EDAC/amd64: Stop matching Hygon CPUs
Date: Thu, 10 Sep 2026 16:27:29 +0800
Message-ID: <20260910082734.3771675-4-wanglin@open-hieco.net>
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

amd64_edac matches Hygon Family 0x18, but obtains its node count and
F3 devices from the AMD northbridge cache. That cache maps dense node
indices to fixed PCI slots starting at 0x18. Hygon discovers DF devices
by PCI ID and reads their identities from DF registers. Their PCI slots
do not encode node identity, and CPU NodeIds are sparse across sockets.
The cache therefore cannot represent the Hygon topology.

A failed fixed-slot F3 lookup causes amd_cache_northbridges() to discard
the cache, and amd64_edac then exits at its amd_nb_num() check. The
driver has no valid Hygon node count or node-to-F3 mapping.

Remove the Hygon CPU match and the unused Family 0x18 case. Hygon memory
controller support requires the Hygon node interfaces and will be added
separately. This does not affect MCE decoding in mce_amd.c.

Signed-off-by: Lin Wang <wanglin@open-hieco.net>
---
 drivers/edac/amd64_edac.c | 4 ----
 1 file changed, 4 deletions(-)

diff --git a/drivers/edac/amd64_edac.c b/drivers/edac/amd64_edac.c
index 475235c402e8..9e35098d3dd2 100644
--- a/drivers/edac/amd64_edac.c
+++ b/drivers/edac/amd64_edac.c
@@ -3840,9 +3840,6 @@ static int per_family_init(struct amd64_pvt *pvt)
 		}
 		break;
 
-	case 0x18:
-		break;
-
 	case 0x19:
 		switch (pvt->model) {
 		case 0x00 ... 0x0f:
@@ -4120,7 +4117,6 @@ static const struct x86_cpu_id amd64_cpuids[] = {
 	X86_MATCH_VENDOR_FAM(AMD,	0x15, NULL),
 	X86_MATCH_VENDOR_FAM(AMD,	0x16, NULL),
 	X86_MATCH_VENDOR_FAM(AMD,	0x17, NULL),
-	X86_MATCH_VENDOR_FAM(HYGON,	0x18, NULL),
 	X86_MATCH_VENDOR_FAM(AMD,	0x19, NULL),
 	X86_MATCH_VENDOR_FAM(AMD,	0x1A, NULL),
 	{ }
-- 
2.43.0

