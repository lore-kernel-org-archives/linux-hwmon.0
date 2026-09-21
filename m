Received: from out28-149.mail.aliyun.com (out28-149.mail.aliyun.com [115.124.28.149])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7E8A33546FA;
	Mon, 21 Sep 2026 05:56:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=115.124.28.149
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789970189; cv=none; b=T4PzI9ri29II3a+bMibbpnSyCpUgzd+cZAJ0jUr6O3g0uUaanCDE4R/ESouvg2qQLfXEm6Mt2yNcrV7IYXfxEOPUeChWsG4hDeEFpg9sabE4hmLIjenEpMt9ZiCGgVKZvcMtV/Qtw0GgQqTZ9Flvh0T70mYD75SBxq9F1nxM0Sc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789970189; c=relaxed/simple;
	bh=DGdpSE+D8407wX1lx027Mqkdmg7kS/OSqXBc5HGoFRk=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=LVElwqqeZJdd9E+J1a7gSO+yez/7GE92uI/SnIbam2OR9QexvUBLM9MJ042L8HUXva3rt7EiUVjjm4kp/gu8UR0CyPWUHYqtqlkdnIp/fnUfh5Xkrx0Jrl4lWDA8eYQYHuBgXYUuuOtu9dndSvxpJv6vc8YHxyCxNcAHjvFYt3E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=open-hieco.net; spf=pass smtp.mailfrom=open-hieco.net; arc=none smtp.client-ip=115.124.28.149
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=open-hieco.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=open-hieco.net
X-Alimail-AntiSpam:AC=CONTINUE;BC=0.2095796|-1;CH=green;DM=|CONTINUE|false|;DS=CONTINUE|ham_system_inform|0.00854596-0.0196614-0.971793;FP=3456624572916909203|1|1|1|0|-1|-1|-1;HT=maildocker-contentspam033037022039;MF=wanglin@open-hieco.net;NM=1;PH=DS;RN=15;RT=15;SR=0;TI=SMTPD_---.jIkm1py_1789970177;
Received: from localhost.localdomain(mailfrom:wanglin@open-hieco.net fp:SMTPD_---.jIkm1py_1789970177 cluster:ay29)
          by smtp.aliyun-inc.com;
          Mon, 21 Sep 2026 13:56:18 +0800
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
Subject: [PATCH v6 3/8] EDAC/amd64: Stop matching Hygon CPUs
Date: Mon, 21 Sep 2026 13:55:58 +0800
Message-ID: <20260921055603.25112-4-wanglin@open-hieco.net>
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

The Hygon match predates the conversion of the AMD northbridge cache
from PCI-ID discovery to topology-derived node counts and fixed PCI
slots. That conversion removed the Hygon F3 discovery path.

Hygon DF devices do not follow the fixed-slot layout, so the cache is
discarded before amd64_edac can probe a memory controller. Removing
the Hygon match therefore does not disable a working EDAC configuration.

The Family 0x18 case becomes unused and is removed with the match. MCE
decoding in mce_amd.c is independent and remains unchanged. Hygon memory
controller support will use the Hygon node interfaces in a separate
series.

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

