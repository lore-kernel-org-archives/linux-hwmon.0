Received: from out28-173.mail.aliyun.com (out28-173.mail.aliyun.com [115.124.28.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 72AFC3CD8CC;
	Thu, 10 Sep 2026 08:28:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=115.124.28.173
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789028888; cv=none; b=Pfal+JEEHtjznzZR/F7JgfPAy0ZiLoHu+q6yUnTzz+0m1G3iiLpr/I3hERE7F6HGA45ODXZySoZEOMiJgpv6GMV/Ss2dqt0MIi1H0c24zOXr5CrmvZS0vDs3U06y7v55nJ/kAdwEIVNOVZby11adsDuRlz52SwWGfv59ghdAaoE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789028888; c=relaxed/simple;
	bh=5N6j6OVlQygKnyi3loXRCpMJogtm3EHBuAGkOZz9364=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=SH7pbiKl0QeMxphbr/yKt0+a55OEM6yQnXBLTBr42QCQbI3Yipx5ytl5jHve7Vz1aHR1da3/bZqgicvhwaEfrmNfnyB222ZsTxMNzvjGbUBzJxl6xrBRYoEjXrsdQoFH1TRGcz29Kqo1zJoria93TaIdcuYfQV6/IPR8t7yBetA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=open-hieco.net; spf=pass smtp.mailfrom=open-hieco.net; arc=none smtp.client-ip=115.124.28.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=open-hieco.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=open-hieco.net
X-Alimail-AntiSpam:AC=CONTINUE;BC=0.08866867|-1;CH=green;DM=|CONTINUE|false|;DS=CONTINUE|ham_alarm|0.00722971-0.0111682-0.981602;FP=4740927069331392975|0|0|0|0|-1|-1|-1;HT=maildocker-contentspam033037021217;MF=wanglin@open-hieco.net;NM=1;PH=DS;RN=15;RT=15;SR=0;TI=SMTPD_---.jAJ35AB_1789028872;
Received: from localhost.localdomain(mailfrom:wanglin@open-hieco.net fp:SMTPD_---.jAJ35AB_1789028872 cluster:ay29)
          by smtp.aliyun-inc.com;
          Thu, 10 Sep 2026 16:27:52 +0800
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
Subject: [PATCH v5 6/8] x86/amd_nb: Restrict the northbridge framework to AMD CPUs
Date: Thu, 10 Sep 2026 16:27:32 +0800
Message-ID: <20260910082734.3771675-7-wanglin@open-hieco.net>
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

amd_cache_northbridges() obtains function 3 and function 4 for node N
from fixed PCI slot 0x18 + N. Hygon DF devices are discovered by PCI
ID and their slots do not encode node identity, so this cache cannot
represent the Hygon topology.

The preceding patches remove the Hygon matches from amd64_edac and ATL.
Restrict the northbridge initialization and early device check to AMD
CPUs. Keep amd_get_mmconfig_range() available on Hygon because it reads
the MMCONFIG MSR without using the northbridge cache.

Reviewed-by: Yazen Ghannam <yazen.ghannam@amd.com>
Signed-off-by: Lin Wang <wanglin@open-hieco.net>
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

