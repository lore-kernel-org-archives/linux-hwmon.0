Received: from outbound.ms.icloud.com (ms-2006d-snip4-11.eps.apple.com [57.103.75.23])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 76EBA415F30
	for <linux-hwmon@vger.kernel.org>; Thu, 13 Aug 2026 17:03:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=57.103.75.23
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786640591; cv=none; b=CV/BriJV7J1MHJFWtkU/GhutnwHoW4q1LefZ22ke6h8ush5k4JwtRciPV8e5bOmuPZXzIAr7ISAzu0KJyUGIYVo6PRQ+4O5FWmmtYA7dQ4PbIzfzp24TnsVonryIduofDOol56crS2hQdadx7bnj0jxXsyUA1+F5sh5KTnF+Ku4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786640591; c=relaxed/simple;
	bh=GIaGv6tpvB6wVwa+XiaVPgH8yPGdiJChnOHKvEiFm2U=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=GMVJkJCSf9UQMqvNqQR19DeqggVwx+oIL+ZQXIxWc1V3R98HN0KHJeUWx0dv/VZGru1c347ttTy1RcH7J5k9WjaJgpohHhCXcpesuxMPqy3GwnAlp7zoQvGmpvdpC47a43qdv/3aS/3ITYJ1Dqxi41opERt8ivVQ8yAsdL7R+Qw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=gford.dev; spf=pass smtp.mailfrom=gford.dev; dkim=pass (2048-bit key) header.d=gford.dev header.i=@gford.dev header.b=RsYblrGD; arc=none smtp.client-ip=57.103.75.23
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=gford.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gford.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gford.dev header.i=@gford.dev header.b="RsYblrGD"
Received: from outbound.ms.icloud.com (unknown [127.0.0.2])
	by p00-icloudmta-asmtp-us-west-3a-100-percent-8 (Postfix) with ESMTPS id 71C9618016E1;
	Thu, 13 Aug 2026 17:03:07 +0000 (UTC)
X-ICL-RepId: 019ffc13-da58-70f5-be8d-032a07d8aaaa
X-ICL-Out-Info: HUtFAUMHWwJACUgBTUQeDx5WFlZNRAJCTQhKCkMFWgdeCE4HQwZSAFBcHA4KVglAGVwUcwpRBEAUFxxWGxcNVk1eHlwfU0VWFU9YQQ4KXhIYXBRcUFgeRhJWDV0JGQZBXlAbXwJCDxwTVhUTHUMZDysISgRDB0UCXgslEwlTVlUWVgpXQ1MORFBUEVdQC1kCQg9IC1wEWgVAC0sBQwRTBkEUSR4KVglAGVwUcwpRBEAUFxxWGwlLRglJHQ4OQhhGH1QnVwJaClse
Dkim-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gford.dev; s=sig1; t=1786640589; x=1789232589; bh=9vnE8eyvIC9QF4SZfTgkJ1DBMWvrngXzXR+BHf4f2jk=; h=From:To:Subject:Date:Message-ID:MIME-Version:x-icloud-hme; b=RsYblrGDYMJpdu32R31t1Tu+JZ7fNvtEZBLuxyQ8LOpxCVNZFv0sNM0V8SNFPLZbOCdRVlWi4ir4OKH8OLaZxviNBg3QBgclwlb0KSZmDtTFaNlUz3gN0bwNfm3c9sLAn6YVHzLA3xcTh53L+Jt6JD2edgf4VOdKtP+OHJ05yZBTwb0C0c18Uu9Nhp7S4Z09LBtUlt3O7yeY+Q4YICX048K0/zi21Qw8UsssxtzfCpqPgdQVkhN/q2vHV5B3jLaGM69VTpLt8+mvvJuupfdGEAvntQuTCGLrsTE1rfnBSd/V1fhGRTCgaJNYEQnSnsmGCOdAKONVC90/658P7vKBdw==
mail-alias-created-date: 1786411807802
Received: from n17.. (unknown [17.156.208.39])
	by p00-icloudmta-asmtp-us-west-3a-100-percent-8 (Postfix) with ESMTPSA id B305318007E7;
	Thu, 13 Aug 2026 17:03:05 +0000 (UTC)
From: Gabriel Ford <gabriel@gford.dev>
To: Clemens Ladisch <clemens@ladisch.de>,
	Guenter Roeck <linux@roeck-us.net>,
	linux-hwmon@vger.kernel.org (open list:K10TEMP HARDWARE MONITORING DRIVER),
	linux-kernel@vger.kernel.org (open list)
Cc: Gabriel Ford <gabriel@gford.dev>
Subject: [PATCH v2] hwmon: (k10temp) Add per-CCD temperature monitoring for Zen5 Turin
Date: Thu, 13 Aug 2026 17:02:08 +0000
Message-ID: <20260813170232.3841-1-gabriel@gford.dev>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Authority-Info-Out: v=2.4 cv=IOsPywvG c=1 sm=1 tr=0 ts=6a7df8cc
 cx=c_apl:c_pps:t_out a=kRaGL2Q7qLiahLf3O6OaIA==:117
 a=kRaGL2Q7qLiahLf3O6OaIA==:17 a=Sv0fKeRqtYgA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=N3CF4LySdIsqoqV5PSAA:9
X-Proofpoint-GUID: FVdIN58egizS2bENGLiXMTSxOn4csfgy
X-Proofpoint-ORIG-GUID: FVdIN58egizS2bENGLiXMTSxOn4csfgy
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODEzMDEyMyBTYWx0ZWRfX1TXoDXUwlUZN
 IB9izh2XKQFSy6Lk3lwYn6EzTEzRviM5HBo6wIasA7M1LdKTty+dVt4znBbR/WbU8nKNC+QYNpa
 pq2PPTK+agmqBoeKHImmV3jNFipVXa7Hrrp8Sx+mayaMCSBUP0OQ6ENL2qLjxNhI/dujvIRy/Bg
 4XM8bJTqhOwl4idlIfTcd/7qp3dTihT7qIE9yuf4aL+PmXU7GZlfJS/id6wJtm0cGZY0Oi/EbOd
 U99aMWvZcgugTKKDSRpUZOeaigcEESGircRwuBg4IA7y808MuQvJIkh1Ztts/xY7aoZ/7cLmrEI
 YTTkZqvX/AHfsAB9kDRRITWtgJEHT79Q8kRlw/wZBFxHuDPmBDy1ofkkjMjIJ4=
X-JNJ: AAAAAAABU1accqMIkUHtk6B9t0yf0Hu5WJlqPfR1gwmM2eqNrW6VBRNigIbnryDmGa3cBFhtt7ePzP7on3VNYxC/yqkOyp4bq3jlJ799kLi5XhQj5lTiwT8UAT806e5nSo6s6HOaz82wHhwM8ziFMVAsaOuPWoIOs3xuwPHPQ3BeSHejySQbN++8a/EeuRrj/9Cx3ckUQKQMrQ0Oy7NAVvpVcRqClQst/qiIK2zhyg2rJ6ecXbAul43rnAqFfrVTQc6Kf/pT6RbC6nuYvp620sY7GhWOyGBgvhDWQoAYjH8XS2inR627+yG/5kfEqJ1KWfUirKdPoftW6r4zU0nLN2DTPX4e3Ei9bpvQNsc4vf1Zs9Yz/zlzthmM5Vcb7NPuuY+m49+Q3CgQrZQn6jwLGTGAaVAOR9uhMwLZYPRuq8hy5nVglMfrQi04/kcPf9y/fdtZlOQ7gyGZYU/WcjX0W0i0m3miASAYPSzCPlmvZ3bRAfO72xRobWIH005rMKF/FxXNZCiTVTwzr89ow/sBO/IRCcQ/bEZ5V2u3SgU4mC/ZFQfRjF7HNb5YceKBWwhX/gc7/7GUBbHLlaBKY5ouugo//VzOL33rAOOHOvbgVM0OtS08a86gO8aGRJKklunLT3lyL7z4R+lVTnhE8Dskc8pLDMgGFGpFJ18CcXyIGczurBj1poFgv2Wcx6CTHvtAtk/eAim6/VAVuO+qwwLwrshOUzm4OnyX7QYwnAV0GzScd6iH6sdIxAhWXjNHztH5NX1ji2oEfIXrJ1muEDAYLj790igllt7jjumkvn49jBKjklsMGlNnE88Z4rLWcq8LnHBsvHfgGfKpkFxAGuRhNRQ+mXjGgsfAPIl9lNuUvn301VOyxVAF5RXlRq5p8n7fGZXCbQPJyOPQnQUG9NBSVrA92IlNhabXwTsMNf6mKfe3Se+oih4VpdyWDHV9GfUuFy0KC+KgaEan9j7XMlc5+zwRmBk5lbL
 lf+9aQFnlmBHLeWZErN1PdSH3NpLjJlCcvHjd0LCiZx5GPGy2no7r+pTbSF0VO1LgAJIsNYssTBjNN+bY4dUxubuySbjo+NMGzzaJcDgRas0p5DR+Iy7ebgB4soZMOm236jfCCIecivHzXemtRkH15eq/hGqzoHL71nyDGwcl2c+mzNoCaI1EHbscDri0WVXfx6v8GtuhHThR3lAOUr0nX6SRLYo=

Add support for per-CCD temperature monitoring on Zen 5 Turin (EPYC 9005)
CPUs, as they fall into a separate model range with a different offset
and a higher maximum CCD count than their desktop counterparts. As such,
this patch also updates the driver to support CPUs with up to 16 CCDs.
Tested and working on an EPYC 9555P.

Signed-off-by: Gabriel Ford <gabriel@gford.dev>
---
 drivers/hwmon/k10temp.c | 16 ++++++++++++++--
 1 file changed, 14 insertions(+), 2 deletions(-)

diff --git a/drivers/hwmon/k10temp.c b/drivers/hwmon/k10temp.c
index de0760dc597d..43cade8c3631 100644
--- a/drivers/hwmon/k10temp.c
+++ b/drivers/hwmon/k10temp.c
@@ -207,6 +207,10 @@ static const char *k10temp_temp_label[] = {
 	"Tccd10",
 	"Tccd11",
 	"Tccd12",
+	"Tccd13",
+	"Tccd14",
+	"Tccd15",
+	"Tccd16",
 };
 
 static int k10temp_read_labels(struct device *dev,
@@ -243,7 +247,7 @@ static int k10temp_read_temp(struct device *dev, u32 attr, int channel,
 			if (*val < 0 && !data->disp_negative)
 				*val = 0;
 			break;
-		case 2 ... 13:		/* Tccd{1-12} */
+		case 2 ... 17:		/* Tccd{1-16} */
 			ret = read_ccd_temp_reg(data, channel - 2, &regval);
 
 			if (ret)
@@ -384,7 +388,11 @@ static const struct hwmon_channel_info * const k10temp_info[] = {
 			   HWMON_T_INPUT | HWMON_T_LABEL,
 			   HWMON_T_INPUT | HWMON_T_LABEL,
 			   HWMON_T_INPUT | HWMON_T_LABEL,
-			   HWMON_T_INPUT | HWMON_T_LABEL),
+			   HWMON_T_INPUT | HWMON_T_LABEL,
+			   HWMON_T_INPUT | HWMON_T_LABEL,
+			   HWMON_T_INPUT | HWMON_T_LABEL,
+			   HWMON_T_INPUT | HWMON_T_LABEL,
+			   HWMON_T_INPUT | HWMON_T_LABEL),
 	NULL
 };
 
@@ -515,6 +523,10 @@ static int k10temp_probe(struct pci_dev *pdev, const struct pci_device_id *id)
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

