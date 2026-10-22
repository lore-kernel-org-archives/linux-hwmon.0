Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=115.124.28.49
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792654964;
	b=kTEq/MiSaNn3UOrl6LHLpwbEbbL3m0xKU000ZuhBoNOVwtgndJitjw5sAT8slcaHlDmB
	 qr2FALgNtDL/A+MceRtSCOG3hUKBuFLlTHeTJrpjetsiX+4dBMdTMV8amDdVNQG0mMH/2
	 UjmzwWCmm/pjgHRpt4MyXg1c1IGBit/7hht6fzOnaASv7XHYoH2XiHMYHfqq92o0mHeRR
	 o3R/6yc83T7+tXQgh7oC1WzD5e0Qt/pwukShoTUpD6gZz6JH3zu6Z9/w4YCbQ4PAhegOU
	 VzydaBR9l6WOCq82Tz+VZKWVgvtyzNdv0/7GMEnWzNv4gQoO9hsvnu27NLJo9peeh7g==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792654964;
	h=DMARC-Filter:X-Alimail-AntiSpam:Received:From:To:Cc:Subject:Date:
	 Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding;
	bh=LO7kULQbd/RvNyzNlhIL/SC1uMZ4kwTcOMF3Y6R/cmw=;
	b=uhTUygdK1IM8bbsUk2hSRfZS60QHcYkcNTtTR1W7ve1qyq7fKhT5pKPzt0gC5lcn9n5z
	 mBhRenPUSGtyaBqIm/Nln1FFZjcNMC3BBTd38Tg7VABomGLYm/E8DS6UuEcNlLfKIq36H
	 BR6ZKq7kKwinO2NR+1D1Yb1J47ZqODlrf7WeKHU82iSHWRlA8+vrB/CeWPS8IWotpNhwP
	 eNgCNe/dpch82HN9Xh9k4/4WsU6tO2jSQ5AcrmSVizThI0yR7qi1tXdYjljDkGQLfCpfh
	 jaADgnVYU5McDTu/R4k0LaBiHdBwKxVNj94FhAhIpnR/0kHhUpWEXnuaGgiONSU5bHQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=open-hieco.net;
	spf=pass smtp.mailfrom=open-hieco.net;
	arc=none smtp.remote-ip=115.124.28.49
Received: from out28-49.mail.aliyun.com (out28-49.mail.aliyun.com [115.124.28.49])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 698FE606A31B;
	Thu, 22 Oct 2026 07:42:42 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 698FE606A31B
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=open-hieco.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=open-hieco.net
X-Alimail-AntiSpam:AC=CONTINUE;BC=0.1085944|-1;CH=green;DM=|CONTINUE|false|;DS=CONTINUE|ham_alarm|0.00706148-0.0109065-0.982032;FP=5300217843762596315|0|0|0|0|-1|-1|-1;HT=maildocker-contentspam033045038069;MF=wanglin@open-hieco.net;NM=1;PH=DS;RN=14;RT=14;SR=0;TI=SMTPD_---.jn83zbK_1792654950;
Received: from localhost.localdomain(mailfrom:wanglin@open-hieco.net fp:SMTPD_---.jn83zbK_1792654950 cluster:ay29)
          by smtp.aliyun-inc.com;
          Thu, 22 Oct 2026 15:42:31 +0800
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
Subject: [PATCH v8 5/7] x86/amd_nb: Restrict the northbridge framework to AMD CPUs
Date: Thu, 22 Oct 2026 15:42:15 +0800
Message-ID: <20261022074218.667049-6-wanglin@open-hieco.net>
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

The AMD northbridge cache previously discovered Hygon F3 devices by PCI
ID. It now derives the node count from CPU topology and locates node
functions at fixed PCI slots. Hygon DF devices do not follow that
layout, so the Hygon branch no longer builds a usable cache.

amd64_edac and ATL no longer use this cache on Hygon. Restrict
northbridge initialization and the early northbridge check to AMD CPUs.
Keep amd_get_mmconfig_range() available on Hygon because it reads the
MMCONFIG MSR without using the northbridge cache.

Signed-off-by: Lin Wang <wanglin@open-hieco.net>
Reviewed-by: Yazen Ghannam <yazen.ghannam@amd.com>
---
 arch/x86/kernel/amd_nb.c | 6 ++----
 1 file changed, 2 insertions(+), 4 deletions(-)

diff --git a/arch/x86/kernel/amd_nb.c b/arch/x86/kernel/amd_nb.c
index 5d364540673d..848ed2ca17c3 100644
--- a/arch/x86/kernel/amd_nb.c
+++ b/arch/x86/kernel/amd_nb.c
@@ -125,8 +125,7 @@ bool __init early_is_amd_nb(u32 device)
 	const struct pci_device_id *id;
 	u32 vendor = device & 0xffff;
 
-	if (boot_cpu_data.x86_vendor != X86_VENDOR_AMD &&
-	    boot_cpu_data.x86_vendor != X86_VENDOR_HYGON)
+	if (boot_cpu_data.x86_vendor != X86_VENDOR_AMD)
 		return false;
 
 	if (cpu_feature_enabled(X86_FEATURE_ZEN))
@@ -315,8 +314,7 @@ static __init void fix_erratum_688(void)
 
 static __init int init_amd_nbs(void)
 {
-	if (boot_cpu_data.x86_vendor != X86_VENDOR_AMD &&
-	    boot_cpu_data.x86_vendor != X86_VENDOR_HYGON)
+	if (boot_cpu_data.x86_vendor != X86_VENDOR_AMD)
 		return 0;
 
 	amd_cache_northbridges();
-- 
2.43.0

