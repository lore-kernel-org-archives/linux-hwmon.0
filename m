Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=115.124.28.172
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792654959;
	b=vRUVjEUkVLUmPSLURBEhGopyJqQ3yMbNGK/1+31yQz99BAWm54QUsrh/nRslAn3oIc5e
	 U54kA9NjCMBKCaJFnta5CeQ6W5miFLMUiD2jEl3o0MB2qBx8LHaJLJCWDPocnqyrIW0Jo
	 ULcHGkTc7ZCt1ZGgKeTdDHRvmiP33zpabwg8JDRno4WKmY1IPMeF/j740IMx06bnT8y4K
	 OrxlFPV386baLQZPerNhDdri3x0Dny82lDFQvlHWhIXb18eInnbygOKA+Sihm/Dplw3tT
	 vR+alq190FxWWUx27v1HvCpecGqZ8chVY2lRkpD2LLCwdowzDPu7mUcMClTViN4DaGQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792654959;
	h=DMARC-Filter:X-Alimail-AntiSpam:Received:From:To:Cc:Subject:Date:
	 Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding;
	bh=d2K13RWcRE06nwzeDIJTbD96p6W1W8vKVpLl7tYs9Po=;
	b=O9luuDV3us9KHiqmVSlt6XDV9UYBXxChNkHjTxaj8pWNdFBqUC5FTBRRUOszJOqC+3D2
	 h5D8UOLmJJzBKzc0zTbyFqok/S35V4asop9c12031UuryzK/WBtsPzO52yEZhjg+YBCBc
	 USGbq6vyBPAehXgDGZBaXAZe9CvLe/DHjsXY4GKx3WM4CxIieqErrdiq12US93kpoWwnO
	 BZOgCU0hquyKQTXgkBMSjAzVDD7UnnuzpUv+3MYmllmYQq32cUggJagzfQM9+s66Fq4B6
	 mu+zTloWIukMrivV9ksE9RRIAsqZAQLmJh8FqhZY0ht99c5MuzGcWlU+ur7ioXPQq1A==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=open-hieco.net;
	spf=pass smtp.mailfrom=open-hieco.net;
	arc=none smtp.remote-ip=115.124.28.172
Received: from out28-172.mail.aliyun.com (out28-172.mail.aliyun.com [115.124.28.172])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DEF74606A325;
	Thu, 22 Oct 2026 07:42:36 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org DEF74606A325
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=open-hieco.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=open-hieco.net
X-Alimail-AntiSpam:AC=CONTINUE;BC=0.2085384|-1;CH=green;DM=|CONTINUE|false|;DS=CONTINUE|ham_system_inform|0.0154444-0.0477482-0.936807;FP=3168551345189373651|0|0|0|0|-1|-1|-1;HT=maildocker-contentspam033037034184;MF=wanglin@open-hieco.net;NM=1;PH=DS;RN=14;RT=14;SR=0;TI=SMTPD_---.jn83zYz_1792654948;
Received: from localhost.localdomain(mailfrom:wanglin@open-hieco.net fp:SMTPD_---.jn83zYz_1792654948 cluster:ay29)
          by smtp.aliyun-inc.com;
          Thu, 22 Oct 2026 15:42:29 +0800
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
Subject: [PATCH v8 3/7] EDAC/amd64: Stop matching Hygon CPUs
Date: Thu, 22 Oct 2026 15:42:13 +0800
Message-ID: <20261022074218.667049-4-wanglin@open-hieco.net>
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

amd64_edac gets its node count and DF devices from the AMD northbridge
cache. Since commit 49b96fc0dddc ("x86/amd_nb: Simplify function 3
search"), the cache finds function 3 only at the fixed PCI slots
0x18 + N. Hygon DF devices are not at those slots, so the cache is
discarded on Hygon and amd64_edac_init() returns -ENODEV at its
amd_nb_num() check.

Remove the Hygon match and the empty Family 0x18 case. MCE decoding
in mce_amd.c is separate and unchanged. Hygon memory controller support
will use the Hygon node interfaces in a separate series.

Signed-off-by: Lin Wang <wanglin@open-hieco.net>
Reviewed-by: Yazen Ghannam <yazen.ghannam@amd.com>
---
 drivers/edac/amd64_edac.c | 4 ----
 1 file changed, 4 deletions(-)

diff --git a/drivers/edac/amd64_edac.c b/drivers/edac/amd64_edac.c
index 0c0d11c72925..d10043a2d35f 100644
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

