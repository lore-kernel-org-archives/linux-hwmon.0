Received: from mail-pj2-f12.google.com (mail-pj2-f12.google.com [74.125.227.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 23973369D4A
	for <linux-hwmon@vger.kernel.org>; Sun, 13 Sep 2026 21:47:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.227.140
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789336041; cv=none; b=l5iZY1UGV39/wdURh6VnP+5LY27Hlt4H4fLeIf3xL2sDNBUWb8hQybWaoFi6rRoovsQ4FvWdBLk5V0Cp+bAMcXHB4VDDORxChTNKl63bme978ltZd8VpJ0k7j/PwNA5LIhTH/KA4d0SpwE9LbqY9UCz/I4dypJwG6L40qRj8dl8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789336041; c=relaxed/simple;
	bh=UzW8n1UIqvlycxK3DIgwi9ka7lkaiEVYC5acDEsV6go=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=Jg0d1L3GdhRWxcWGtfFas4D7pYz+hVzTs3DBMmUMSIWFA5EeHICphG6cV4XFwWvHJZ3QR4SjuGroBnIn2w3ztR3NhFX513M5e/W2iRTtnaIG2FB7a0n8zFTDnvxHOw/tAiIvrK4x1zl5Nhx+CVeHC/lu6QB43g4zsk0PJ3ZMzWs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=hffu8BL9; arc=none smtp.client-ip=74.125.227.140
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="hffu8BL9"
Received: by mail-pj2-f12.google.com with SMTP id 98e67ed59e1d1-39da614ab21so282356a91.2
        for <linux-hwmon@vger.kernel.org>; Sun, 13 Sep 2026 14:47:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789336039; x=1789940839; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=NUbAlL8/ncSi/xHkVdLyT8Bq19fax5BvNGFOBoCZR6E=;
        b=hffu8BL993S1vSrRFdRWGSfOl0VJOuGu8rrSvRd3bU93cGnert4UroTjV+20Poc7S3
         catVXVP1hhkH86iWRHxCe4grz6WHcqRmSbjDIA+DpjqWdKoaramql/bpmnryC1TayQTg
         WXRf/gXKF0PjbIrmBxfXOWCL/ncaoreSnln/UIxrRRuii/cfQIpEMrLzItf83VA7SrsE
         bsma2aLL6V8niyTXyUgDpo/qGBiLhPDJiKcuItVRg1lR+jA/XnI5B0ux0bnspQUbJcBx
         +mXiScugXgsQGLY4VfnRek3EfaxMVS/qhjbVdBCM55tBxAFoSKMoxzBF/iC/0svukEln
         j6yA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789336039; x=1789940839;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=NUbAlL8/ncSi/xHkVdLyT8Bq19fax5BvNGFOBoCZR6E=;
        b=IiuBsBRBVSuAEHViSnRE4ovpxKtUQFl9ypHW51rB0gHlKtrdH3PmXKDXq4Ts5x1OES
         nM56KHizU91Acm+SG/YbO9y1uj4chbDJLy0nuswQ7+7FITU4Sd4HzLlSxY7DtblGJgvw
         3Nog5OUzKtDDJW1xkI55jK79mM1HxJlXVbD1qMqJiFFNNY0+uyV6A/FEgDv/R4tFaUEO
         tR7sh36hd35W5U3W3OX86MQQwhqqe8Qbr/P4AZGkRTEuUX5Sf1mI9pg4ugSgYnO+h42r
         zA5MR9rgxB+nxVAnseloEDqN4jbvKMm1ybYlQ/Q9WRz1SZh8om7xv8yvNzVho7BLYtBA
         5hxA==
X-Gm-Message-State: AFuF++l+fEOwPCiHUhDrfGWtHWwGhBDSLH37jikX5bHwyhNG2/4QdjCS
	aYbINoExtvQYx2inXmj9UcU/N4diRlNHThIEsavwTqqvZaJhOeoQfJXqTMYFYdse
X-Gm-Gg: AYBFou3TkHYzVnZWzo8nmOnmKhvn/UlC1IuvhHlLl75XZo4KUaTDSp018abxBHAzxg4
	qXf8+UXQJz+Ou/vou7ickQUaUlKibTrHHxQuuH4w98XVBmj/pvidS/QC4OyZb/nh7UzIakLCHi6
	c8UGuNOQJt9/73zeO9WTdvVWyTPB7LQl+dVUpzhYYHLuNLVdgr+l+5rcAWBSdAUV5SQhKINkkuR
	sBbMeCIYQPTNQ99xsF7KzdVLU4AdUxMZ5c8EQxjMIruuyRj7Jg4iJVALb3gb07MaWXJcURKAVFN
	Fz+6AbgrnL49vVlg8RQ7/yKqDB41vvbXaoKuKufEFA6stCn1yl9nFZS8a/4P9JB5Eee36iVJn1x
	CVlRCFynDFZLPkDkjvKCiln4r2uMpAnFMqLICF2LQWZ9ALHr6RBfVhLSNklVo8w6/2J2ubWVvsV
	xmq+5HWkYGo1vR+HMjWRIicKsoVGwxTjiIVgK1MPe1V/154DQLRePvAo2B/EYNpSn3uSMddcktM
	DBEYj7kvRe1PqPEw4ODaOJvGtMoOyI3fTTnOWgbqK5KhjPHpT5BWqS6Esq8J+YPS9nwj+q1zKj+
	y6t/UOBYyXjtCndTxXNYY4UxVOaqzHU=
X-Received: by 2002:a17:90b:4c08:b0:39b:3510:4af7 with SMTP id 98e67ed59e1d1-39d9bbbe877mr16153253a91.1.1789336039466;
        Sun, 13 Sep 2026 14:47:19 -0700 (PDT)
Received: from cachyos-aura ([45.112.148.109])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-33bc03778c7sm11549002eec.9.2026.09.13.14.47.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 13 Sep 2026 14:47:18 -0700 (PDT)
From: Navon John Lukose <navonjohnlukose@gmail.com>
To: linux@roeck-us.net,
	sergiomelas@gmail.com
Cc: linux-hwmon@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Navon John Lukose <navonjohnlukose@gmail.com>
Subject: [PATCH] hwmon: (yogafan) Fix fan paths for Yoga Pro 7 14IAH10
Date: Mon, 14 Sep 2026 03:17:13 +0530
Message-ID: <20260913214713.205208-1-navonjohnlukose@gmail.com>
X-Mailer: git-send-email 2.55.0
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The Yoga Pro 7 14IAH10 entry names \_SB.PC00.LPCB.EC0.FANS, which this
machine's DSDT does not have, so probe matches on DMI, fails to resolve the
path and returns -ENODEV. The EC exposes its two fan tachometers as FA1S
and FA2S, and loq_15iax9_8bit_dual_cfg already describes that layout. Point
the entry at it, and update the reference table row to match.

Fixes: 9c110a467686 ("hwmon: (yogafan) Add support for new Lenovo models")
Signed-off-by: Navon John Lukose <navonjohnlukose@gmail.com>
---
Tested on a Lenovo Yoga Pro 7 14IAH10 (83KF), BIOS QGCN35WW. The EC field
block declares FA1S at offset 0x104 and FA2S at 0x137, both 8 bits, and
FANS does not appear anywhere in the table.

Both fans report after the patch, 0 when stopped and 5600 RPM with the fans
driven to maximum through the vendor WMI method. The multiplier stays at
100, and the AML agrees, reading the fields as (FA1S * 0x64) and
(FA2S * 0x64).

The table also lists the XiaoXinPro 13ARE as machine type 83KF, which is
this machine's DMI product name. I left that row alone.

 Documentation/hwmon/yogafan.rst | 3 ++-
 drivers/hwmon/yogafan.c         | 8 +-------
 2 files changed, 3 insertions(+), 8 deletions(-)

diff --git a/Documentation/hwmon/yogafan.rst b/Documentation/hwmon/yogafan.rst
index 6395c94..84c5d2a 100644
--- a/Documentation/hwmon/yogafan.rst
+++ b/Documentation/hwmon/yogafan.rst
@@ -102,7 +102,8 @@ immediately to ensure the user knows the fan has stopped.
  83KF           | XiaoXinPro 13ARE | 0x06/0xFE | \_SB.PCI0.LPC0.EC0.FANS/FA2S   |  8-bit | 100
  82KU           | IdeaPad 3 15ALC6 | 0x06      | \_SB.PCI0.LPC0.EC0.FAN0        |  8-bit | 100
  83RU           | Legion Pro 7 16  | 0x03/0x06 | \_SB.PCI0.LPC0.EC0.FANS/FA2S   |  8-bit | 100
- 83KF           | Yoga Pro 7 14IAH | 0x06      | \_SB.PC00.LPCB.EC0.FANS        |  8-bit | 100
+ 83KF           | Yoga Pro 7 14IAH | 0x104     | \_SB.PC00.LPCB.EC0.FA1S (Fan1) |  8-bit | 100
+ 83KF           | Yoga Pro 7 14IAH | 0x137     | \_SB.PC00.LPCB.EC0.FA2S (Fan2) |  8-bit | 100
  83BS           | Yoga 7 16ARP8    | 0x03/0x06 | \_SB.PCI0.LPC0.EC0.FANS/FA2S   |  8-bit | 100
  *Legacy*       | Pre-2020 Models  | 0x06      | \_SB.PCI0.LPC.EC.FAN0          |  8-bit | 100
  ----------------------------------------------------------------------------------------------------
diff --git a/drivers/hwmon/yogafan.c b/drivers/hwmon/yogafan.c
index 278cb08..3fcad00 100644
--- a/drivers/hwmon/yogafan.c
+++ b/drivers/hwmon/yogafan.c
@@ -84,12 +84,6 @@ static const struct yogafan_config xiaoxin_8bit_dual_cfg = {
 	.paths = { "\\_SB.PCI0.LPC0.EC0.FANS", "\\_SB.PCI0.LPC0.EC0.FA2S" }
 };
 
-static const struct yogafan_config yoga_pro_7_14iah10_cfg = {
-	.multiplier = 100,
-	.fan_count = 1,
-	.paths = { "\\_SB.PC00.LPCB.EC0.FANS", NULL }
-};
-
 static void apply_rllag_filter(struct yoga_fan_data *data, int idx, long raw_rpm)
 {
 	ktime_t now = ktime_get_boottime();
@@ -227,7 +221,7 @@ static const struct dmi_system_id yogafan_quirks[] = {
 			DMI_MATCH(DMI_SYS_VENDOR, "LENOVO"),
 			DMI_MATCH(DMI_PRODUCT_FAMILY, "Yoga Pro 7 14IAH10"),
 		},
-		.driver_data = (void *)&yoga_pro_7_14iah10_cfg,
+		.driver_data = (void *)&loq_15iax9_8bit_dual_cfg,
 	},
 	{
 		.ident = "Lenovo Yoga 7 16ARP8",

base-commit: 22098763a10d9c13
