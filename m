Received: from mout-p-102.mailbox.org (mout-p-102.mailbox.org [80.241.56.152])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7128F256C84
	for <linux-hwmon@vger.kernel.org>; Mon,  9 Mar 2026 22:31:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=80.241.56.152
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773095472; cv=none; b=AmjMbxJfYAC5CWYlatNZBqnxAqnREe+Xm+jFZ5UVjut5GwfT4FPQTsjkpBtCPtAMdfu//bld3AD1eAGlPRXRIZZIuigNnfcJhlwoZ+bL//gGzvztpowmNqnP1CfxVrYyC9Dm5X1CACrz+NBpXTSkDbAAXOyVt19gvf1G6+LTbHM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773095472; c=relaxed/simple;
	bh=hks4Il8pPCtNoIsrJKFQAI0wrnEmxkg91YtSsyPXs7U=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=SN2qz69EvZhIawc0NJaPi/4s6pUMTw6+nLsveq1PpCo9C2tACvqeO3zyTj1JrYsSJEAd6kEejvOyBeCyBNnD2sRgJ43tpqzdACZsQksWEYouNGU6Tgk/t8k9NG7c1Qm0/8jfvNN96VGsd0xrhRGj/WEiyV+GXZ00EJR0l6PXKq4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=thehoffs.at; spf=pass smtp.mailfrom=thehoffs.at; dkim=pass (2048-bit key) header.d=thehoffs.at header.i=@thehoffs.at header.b=TU9wqays; arc=none smtp.client-ip=80.241.56.152
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=thehoffs.at
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=thehoffs.at
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=thehoffs.at header.i=@thehoffs.at header.b="TU9wqays"
Received: from smtp102.mailbox.org (smtp102.mailbox.org [10.196.197.102])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by mout-p-102.mailbox.org (Postfix) with ESMTPS id 4fVBYm2Jt6z9smr;
	Mon,  9 Mar 2026 23:31:08 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=thehoffs.at; s=MBO0001;
	t=1773095468;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding;
	bh=w2fDL4wXJ+jUboUW3U0aizbxj/HDcNybU521xcjQLe8=;
	b=TU9wqayscBbpt+7gIRi84CKRK5TcVM4dPTAX+XE/nkXQJEi4JoYtdQB4wj0htUv/+Yq0yz
	f50tPSAIFOh4wKgZvSKWSE2h/UazRmxRk9+oYF6iWJIpXcfqwwAI3YGGOMpxtDo/uEPfpR
	FuL08vI9PN+16xa7QydtGo+HrelrAdN53alZVp1WLa6m/q+zJlsmuPcYUvUZkxBa/AidJc
	KGH3i3WjzphGHO4lxaVV6tAKIQWW2E9fngPUHGnLxtZrtWWrW69QM6J9tIBruBPZm+7wkk
	5vFND2C6Bn8gE5dYq9lugfUA4sdPIcHCJ8kXd5A8AKxzCmcmlM54Xj4XeGcxrQ==
From: Markus Hoffmann <markus@thehoffs.at>
To: linux-hwmon@vger.kernel.org
Cc: linux@roeck-us.net,
	Markus Hoffmann <markus@thehoffs.at>
Subject: [PATCH] hwmon: (it87) Add support for IT8689E
Date: Mon,  9 Mar 2026 22:31:03 +0000
Message-ID: <20260309223103.175443-1-markus@thehoffs.at>
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add support for the ITE IT8689E Super I/O chip. The IT8689E supports
newer autopwm, 12mV ADC, 16-bit fans, six fans, six PWM channels,
PWM frequency 2, six temperature inputs, and AVCC3.

Signed-off-by: Markus Hoffmann <markus@thehoffs.at>
---
 drivers/hwmon/it87.c | 15 ++++++++++++++-
 1 file changed, 14 insertions(+), 1 deletion(-)

diff --git a/drivers/hwmon/it87.c b/drivers/hwmon/it87.c
index e233aafa8..dd136bd94 100644
--- a/drivers/hwmon/it87.c
+++ b/drivers/hwmon/it87.c
@@ -16,6 +16,7 @@
  *            IT8622E  Super I/O chip w/LPC interface
  *            IT8623E  Super I/O chip w/LPC interface
  *            IT8628E  Super I/O chip w/LPC interface
+ *            IT8689E  Super I/O chip w/LPC interface
  *            IT8705F  Super I/O chip w/LPC interface
  *            IT8712F  Super I/O chip w/LPC interface
  *            IT8716F  Super I/O chip w/LPC interface
@@ -64,7 +65,7 @@
 
 enum chips { it87, it8712, it8716, it8718, it8720, it8721, it8728, it8732,
 	     it8771, it8772, it8781, it8782, it8783, it8786, it8790,
-	     it8792, it8603, it8620, it8622, it8628, it87952 };
+	     it8792, it8603, it8620, it8622, it8628, it8689, it87952 };
 
 static struct platform_device *it87_pdev[2];
 
@@ -162,6 +163,7 @@ static inline void superio_exit(int ioreg, bool noexit)
 #define IT8622E_DEVID 0x8622
 #define IT8623E_DEVID 0x8623
 #define IT8628E_DEVID 0x8628
+#define IT8689E_DEVID 0x8689
 #define IT87952E_DEVID 0x8695
 
 /* Logical device 4 (Environmental Monitor) registers */
@@ -502,6 +504,14 @@ static const struct it87_devices it87_devices[] = {
 		  | FEAT_SIX_TEMP | FEAT_VIN3_5V | FEAT_FANCTL_ONOFF,
 		.peci_mask = 0x07,
 	},
+	[it8689] = {
+		.name = "it8689",
+		.model = "IT8689E",
+		.features = FEAT_NEWER_AUTOPWM | FEAT_12MV_ADC | FEAT_16BIT_FANS
+		  | FEAT_SIX_FANS | FEAT_IN7_INTERNAL | FEAT_SIX_PWM
+		  | FEAT_PWM_FREQ2 | FEAT_SIX_TEMP | FEAT_AVCC3,
+		.smbus_bitmap = BIT(1) | BIT(2),
+	},
 	[it87952] = {
 		.name = "it87952",
 		.model = "IT87952E",
@@ -2785,6 +2795,9 @@ static int __init it87_find(int sioaddr, unsigned short *address,
 	case IT8628E_DEVID:
 		sio_data->type = it8628;
 		break;
+	case IT8689E_DEVID:
+		sio_data->type = it8689;
+		break;
 	case IT87952E_DEVID:
 		sio_data->type = it87952;
 		break;
-- 
2.53.0

