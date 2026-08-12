Received: from outbound.ci.icloud.com (ci-2002a-snip4-11.eps.apple.com [57.103.88.141])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EF6964746D7
	for <linux-hwmon@vger.kernel.org>; Wed, 12 Aug 2026 16:38:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=57.103.88.141
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786552740; cv=none; b=GV/8Y05er1H5fm8j1wozQkTA4LBkyyT7yc2SsDuEPRSkuwhkz0F3bKNnwcWwE+z8hw3Ly1lW7LaS3jFI4+tGk9UAW6qHr2ib1uv47ScQW1ZkROKbprfJjbANNubfsL8qb3VGCIitzFpy3yvPB/JzRUvVk7JPcbXGmwm5RdnT/fI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786552740; c=relaxed/simple;
	bh=3KWM+G9yOMgofh49bmABxH7luKbXpqQaZz2tOb5IqqM=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=FhXb8ijY165bdA1PUuLnRO1aD/9Th2O4YfPCMtpxed0Ijpd3BYewHsDkSwKlwcddgRMVcupUKAFD6AU7HTDE/xGycVWpI76uU+7iwVJzoUF2s8IzqbWr2Pg9cxq3tqyMLFqOn9aQdsls8YYHG/ABPdNr/kzIfVAqQ5H8TZzhaTo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=gford.dev; spf=pass smtp.mailfrom=gford.dev; dkim=pass (2048-bit key) header.d=gford.dev header.i=@gford.dev header.b=GXmWoFDW; arc=none smtp.client-ip=57.103.88.141
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=gford.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gford.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gford.dev header.i=@gford.dev header.b="GXmWoFDW"
Received: from outbound.ci.icloud.com (unknown [127.0.0.2])
	by p00-icloudmta-asmtp-us-central-1k-20-percent-0 (Postfix) with ESMTPS id 642DA1800169;
	Wed, 12 Aug 2026 16:38:56 +0000 (UTC)
X-ICL-RepId: 019ff6d7-5a4a-7ff5-bbe9-8babb2ed8b17
X-ICL-Out-Info: HUtFAUMHWwJACUgBTUQeDx5WFlZNRAJCTQhKCkMFWgdeCE4HQwZSAFBcHA4KVglAGVwUcwpRBEAUFxxWGxcNVk1eHlwfU0VWFU9YQQ4KXhIYXBRcUFgeRhJWDV0JGQhbXlAbXwJCDxwTVhUTHUMZDysISgRDB0UCXgslEwlTVlUWVgpXQ1MORFBUEVdQC1kCQg9IC1wFWgRDAUkBQwVcBEAUSR4KVglAGVwUcwpRBEAUFxxWGwlLRglJHQ4OQhhGH1QnVwJaClse
Dkim-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gford.dev; s=sig1; t=1786552737; x=1789144737; bh=rscPCEEPD3dboROIl+EaQhjc3YhT99/NZGT5fYF3k4c=; h=From:To:Subject:Date:Message-ID:MIME-Version:x-icloud-hme; b=GXmWoFDWdhJ5C/vQ4QVQN+/Elvfr3ywH7oKDY7c8csapP+yL/I+JUP7gIxjzZLwCpWiGs5xY2SjdD7O7sx7WcrzezJ1AbL2ztRy5e+qVXFftjtYHAy2ERbmkjsK9FQa7j7mk3CNDpp2slw8ZXYq5COa4RghvZr1vq/PIzalj0NhctZE25TGMBc89THHTHt8O4Sy7JrKdGjopsrUU9GWilZaVY20ffyWCb09OoCD5zo8pmIl0SEc5LOCyKW7KKitbk1bfxSKg1BvUh2XHSiT+XM3si+oEwQMvyOxC8xP3EGRTC7Ky4gYMjpSlBwA8mlzU3Jnp40KT4KXu8ofCTHuN5w==
mail-alias-created-date: 1786411807802
Received: from n17.. (unknown [17.57.156.36])
	by p00-icloudmta-asmtp-us-central-1k-20-percent-0 (Postfix) with ESMTPSA id 1A63E180033A;
	Wed, 12 Aug 2026 16:38:55 +0000 (UTC)
From: Gabriel Ford <gabriel@gford.dev>
To: Clemens Ladisch <clemens@ladisch.de>,
	Guenter Roeck <linux@roeck-us.net>,
	linux-hwmon@vger.kernel.org (open list:K10TEMP HARDWARE MONITORING DRIVER),
	linux-kernel@vger.kernel.org (open list)
Cc: Gabriel Ford <gabriel@gford.dev>
Subject: [PATCH] hwmon: (k10temp) Add per-CCD temperature monitoring for Zen5 Turin
Date: Wed, 12 Aug 2026 16:37:58 +0000
Message-ID: <20260812163812.2760-1-gabriel@gford.dev>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODEyMDEzNSBTYWx0ZWRfX8kyJeT+viCbI
 jDLWJlkkzdYrntLZjXD2PfwCeWc59B1IQ6beINi/3/7Csa0TH+1bUGsyprpITcL7t45aPBZyeOd
 MetDJcUNB02LzwZLXc/aC/9W8GB14FYDqjadRgumo9swQgm+sj3QIAE0PMC72OyqILMxToUsHAZ
 F8IgEBvcpFm3lI+eKRFAKV1pdcRlKENv+VE74wM3IzbyObHv84ocsEgKn5G+r3daDnAtCogfCg+
 7T/wA18P26NZOtQi/9+g2snbq88LFKBkZzy5uCBWlHarz4eL+foKIp+342G4bO/Y6QpL6Uo57im
 ai3E8LhJZb99yZ+LP61JgRkAGvLkFZh6TPCM7Chj2LAi0SA7Ttc45PYnwI4fiY=
X-Authority-Info-Out: v=2.4 cv=Dt5bOW/+ c=1 sm=1 tr=0 ts=6a7ca1a0
 cx=c_apl:c_pps:t_out a=2G65uMN5HjSv0sBfM2Yj2w==:117
 a=2G65uMN5HjSv0sBfM2Yj2w==:17 a=Sv0fKeRqtYgA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=rEwK2UKs15_HZtBU5IoA:9
X-Proofpoint-ORIG-GUID: Y7KUfABY_V9Y2oppvRvR8ovstAivjK0d
X-Proofpoint-GUID: Y7KUfABY_V9Y2oppvRvR8ovstAivjK0d

Add support for per-CCD temperature monitoring on Zen 5 Turin (EPYC 9005)
CPUs, as they fall in a different model range with a larger number of
maximum CCDs compared to their desktop counterparts. Tested and working
on an EPYC 9555P.

Signed-off-by: Gabriel Ford <gabriel@gford.dev>
---
 drivers/hwmon/k10temp.c | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/drivers/hwmon/k10temp.c b/drivers/hwmon/k10temp.c
index de0760dc597d..b882fe09ac1b 100644
--- a/drivers/hwmon/k10temp.c
+++ b/drivers/hwmon/k10temp.c
@@ -207,6 +207,10 @@ static const char *k10temp_temp_label[] = {
 	"Tccd10",
 	"Tccd11",
 	"Tccd12",
+	"Tccd13",
+	"Tccd14",
+	"Tccd15",
+	"Tccd16"
 };
 
 static int k10temp_read_labels(struct device *dev,
@@ -515,6 +519,10 @@ static int k10temp_probe(struct pci_dev *pdev, const struct pci_device_id *id)
 		}
 	} else if (boot_cpu_data.x86 == 0x1a) {
 		switch (boot_cpu_data.x86_model) {
+		case 0x00 ... 0x2f:	/* Zen5 Turin */
+			data->ccd_offset = 0x1F0;
+			k10temp_get_ccd_support(data, 16);
+			break;
 		case 0x40 ... 0x4f:	/* Zen5 Ryzen Desktop */
 			data->ccd_offset = 0x308;
 			k10temp_get_ccd_support(data, 8);
-- 
2.43.0

