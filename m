Received: from out198-18.us.a.mail.aliyun.com (out198-18.us.a.mail.aliyun.com [47.90.198.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8997B365A0F;
	Mon, 21 Sep 2026 05:56:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=47.90.198.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789970205; cv=none; b=VDHDfOg3BY/4Z0gPZyM4We1H2RFAfW4CEQyamxDlLRsaxfjXgXwBwe6P3O4fZ9GB/MO6R7wZDOji6oFKxx/qtJf2RXaa4NxjX2aPI3yCFPzPTsVQkrLN/AlbS9I7nzer+E69JXr7LbWWxE2q+LGawdXt8wf9wCFpdXE68+fbvkU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789970205; c=relaxed/simple;
	bh=Y19hvtuGGIPWGRHUaLnout1jeLW6wcOtdMLMoTiH57s=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=O13YYrw08YHHWnTgdZfJntRKqIjeh2Hwyqt9nzShpwSdCeThZ8X8jLB4nM1QuxL+hg9kep+2BbG8sFUdVsZCK3oFe1H7vecFsVjHZHBXLy9XxQPQwjtVQHNJGDs/La6VJM0cS6LwR5hj6YWRfOKOjSrKCEULfk0u/SYxbaYxjXw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=open-hieco.net; spf=pass smtp.mailfrom=open-hieco.net; arc=none smtp.client-ip=47.90.198.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=open-hieco.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=open-hieco.net
X-Alimail-AntiSpam:AC=CONTINUE;BC=0.105473|-1;CH=green;DM=|CONTINUE|false|;DS=CONTINUE|ham_alarm|0.00706148-0.0109065-0.982032;FP=5300217843762596315|1|1|1|0|-1|-1|-1;HT=maildocker-contentspam033037022039;MF=wanglin@open-hieco.net;NM=1;PH=DS;RN=15;RT=15;SR=0;TI=SMTPD_---.jIkm1uO_1789970180;
Received: from localhost.localdomain(mailfrom:wanglin@open-hieco.net fp:SMTPD_---.jIkm1uO_1789970180 cluster:ay29)
          by smtp.aliyun-inc.com;
          Mon, 21 Sep 2026 13:56:21 +0800
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
Subject: [PATCH v6 6/8] x86/amd_nb: Restrict the northbridge framework to AMD CPUs
Date: Mon, 21 Sep 2026 13:56:01 +0800
Message-ID: <20260921055603.25112-7-wanglin@open-hieco.net>
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

