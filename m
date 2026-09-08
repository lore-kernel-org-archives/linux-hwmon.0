Received: from mail-pj1-f42.google.com (mail-pj1-f42.google.com [209.85.216.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 790A02EEE83
	for <linux-hwmon@vger.kernel.org>; Tue,  8 Sep 2026 09:47:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788860860; cv=none; b=oOQp6ul6usb7XhKT15HrqK3wRq4jLlOP3GO4MQFyP1aS/MajEfbfiYFLJCg3W3pfYxHR8Wh6bEfhoo4aZg54vR8HafmKTPT3pkCdh1yk+ou8K2Z0h3I7PVzlg07TJbvzhSKlAisgTK1QwaINj9vyGaEL/dZgueqAsyifNOMb1ok=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788860860; c=relaxed/simple;
	bh=XQdkUvgOydo+9e7O8MX2+dcnxlTods4ZcA5zB20fLYk=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=lU1bnpWobEAayQCX5ON9O+Lfc/U0PFUOJVnuP3b8U/53pIDLpXbDbt1ToWbHe2pJINzk3AXwQqBAa1ul4/G3RJc2B0LKWAcTL618QxgYLZ0eRz2i1jyGzwPPfdOeEZ/5bnxC/18pLjl2ZclYuST/LUgHAdJAuOJhH9ak3u4qfo0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=CIsiadmg; arc=none smtp.client-ip=209.85.216.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="CIsiadmg"
Received: by mail-pj1-f42.google.com with SMTP id 98e67ed59e1d1-39675172593so3481289a91.2
        for <linux-hwmon@vger.kernel.org>; Tue, 08 Sep 2026 02:47:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788860858; x=1789465658; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=0PBUJEeFBiWjNqjSYPXJZjecT0G0qpYB0cRk1PSNGo4=;
        b=CIsiadmgFrgxUyvvBhWQKMCVEacHfyhgoBzj1SowlxWgxymCQ5eRgYF9IL90rgrg7O
         tiBvqs5k/j6//mT5mI1WkB91b5xqz6LQSkn09F8Yu5EVC+ikYGfmIIJEqnyHWkHpnJyD
         J6oZ85YajgOSlBAo/7XLga4qxcuGnidmd3nx/pFSixBYOqf+bDdP0/YOo9A1klNFbGv8
         CVBWyvK4+gprX53WpJ8nGO8pHnFOHJE9hqkoWSem8pz2wc39p+YSNMDA4zSuibfdbYlB
         x33uYn50WgDH5z08cRQoz6MBuoNjuU1wanwy4BuD9T+ZXHCMcJbyrjfG3AeRrcbWGvO7
         j7Xw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788860858; x=1789465658;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=0PBUJEeFBiWjNqjSYPXJZjecT0G0qpYB0cRk1PSNGo4=;
        b=Kp7R+d21Y/aWQNL4ptI2sLInHsts2r/9oPrTyaUBwFdy7WkG6pvWuS0DgIzfojDYJw
         Jwj3w7gIOH1p5r6yS5iLe5Iip0eiXoWUVpYGAznTOgJtVKM1LMr2dpeMxW+2zIu1nJTn
         oacROczP/FcBHPQ9dq32kMhu96VzLKb/hsJMxLGosrf5+CUupKxGbgqAKtBqDcXBhQiC
         +jtgKftZtaIgb2Lle/5Xl4Uf+EvEj3vPW/FZMgLPh3yIn00S7ImzzR6iOi2hFJsN3uLR
         bCdwnR9g9Yw8ueghx4Sqie49odnMAPHV4lDskI6C5NZmpGnncnm1jXywgNFBgHkqSObe
         kf3g==
X-Gm-Message-State: AFuF++l3p3lXKck91vlgfKwySCiutVyEnvy6vUKb2Co9rYxwxY0ZzQ6K
	Nq0Z69M6d+k7GSfWz2+faur+c9wFho3MaysGg8duNqAr7iACA1YE1/qH
X-Gm-Gg: AYBFou202y5ZlkrhkvU68sliuXZ6FghtPnWacxLQlDP6VZ810OtAeVwYmOLvB8XNp2X
	ySkKb9TMzxc5msUicBR9arsn0bbSY9PAvymHBWHptpgRsCbvFXX4C9z8AEF1jOdtJZGZEdPZP8d
	4KoIjOWny7vH6jgsQz1xOnmlwW3S4kyYIQBwOXXlgqJMMlHyUSHRyXucrCvj8QYolZvYB2ZnvYz
	hXLD7OnYBvdvSYBZccwHT/KMgYh0e/pGM5ZRhnHHC6cGW56W4vAsK3fX873lJFMAhkRhkaRC23E
	b+UvE+IWX6YlAqnOntD6HKIRSAuPaGEURbixDSdgTeDZdegB31v3dDl8LJ7Ao1cf69JzmudyyT4
	/1lCFb0nyxnocMLZp6FZHtichcKHY/h0LjkBxMpBynUpqTqMYeute95inwzolAMDvK4ZAvOFXe4
	Xppad+fKbf4/bRUHrB83Z4C3z5jY4EwBHtdHsSE1g1mBP9Vt1cybozMNA81WEESpq7c+JHheHI0
	0EiNcriyA5hWbvGJ+MrOv0hdz7JXtOwM/AUB18qcHrpJeh80fiH
X-Received: by 2002:a17:90b:2f87:b0:38e:9045:bac0 with SMTP id 98e67ed59e1d1-39b260fe42amr41175710a91.5.1788860857731;
        Tue, 08 Sep 2026 02:47:37 -0700 (PDT)
Received: from sergio-82n7.fritz.box (static-23-234-74-239.cust.tzulo.com. [23.234.74.239])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-143243767e1sm29407770c88.6.2026.09.08.02.47.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 08 Sep 2026 02:47:37 -0700 (PDT)
From: Sergio Melas <sergiomelas@gmail.com>
To: Guenter Roeck <linux@roeck-us.net>
Cc: linux-hwmon@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Sergio Melas <sergiomelas@gmail.com>
Subject: [PATCH v2] hwmon: (yogafan) Add support for new Lenovo models
Date: Tue,  8 Sep 2026 11:47:16 +0200
Message-ID: <20260908094717.2224803-1-sergiomelas@gmail.com>
X-Mailer: git-send-email 2.55.0
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add DMI quirk entries and map correct ACPI paths and configurations for
additional Lenovo laptop models: Yoga 14cACN 2021, IdeaPad 3 15ALC6 Ub
and Yoga 740-15IML, leveraging DMI product family matching.

Signed-off-by: Sergio Melas <sergiomelas@gmail.com>
---
v2: Split changes and addressed reviewer comments.
---
 drivers/hwmon/yogafan.c | 29 +++++++++++++++++++++++++++++
 1 file changed, 29 insertions(+)

diff --git a/drivers/hwmon/yogafan.c b/drivers/hwmon/yogafan.c
index 413ddc721..aa3284560 100644
--- a/drivers/hwmon/yogafan.c
+++ b/drivers/hwmon/yogafan.c
@@ -53,6 +53,11 @@ struct yoga_fan_data {
 };
 
 /* Specific configurations mapped via DMI */
+static const struct yogafan_config yoga_740_15iml_cfg = {
+	.multiplier = 100,
+	.fan_count = 1,
+	.paths = { "\\_SB.PCI0.LPCB.EC0.FANS", NULL }
+};
 
 static const struct yogafan_config yoga_8bit_fans_cfg = {
 	.multiplier = 100,
@@ -200,6 +205,30 @@ static const struct hwmon_chip_info yoga_fan_chip_info = {
 };
 
 static const struct dmi_system_id yogafan_quirks[] = {
+	{
+		.ident = "Lenovo Yoga 740-15IML",
+		.matches = {
+			DMI_MATCH(DMI_SYS_VENDOR, "LENOVO"),
+			DMI_MATCH(DMI_PRODUCT_FAMILY, "Yoga 740-15IML"),
+		},
+		.driver_data = (void *)&yoga_740_15iml_cfg,
+	},
+	{
+		.ident = "Lenovo IdeaPad 3 15ALC6 Ub",
+		.matches = {
+			DMI_MATCH(DMI_SYS_VENDOR, "LENOVO"),
+			DMI_MATCH(DMI_PRODUCT_FAMILY, "IdeaPad 3 15ALC6 Ub"),
+		},
+		.driver_data = (void *)&xiaoxin_8bit_dual_cfg,
+	},
+	{
+		.ident = "Yoga 14cACN 2021",
+		.matches = {
+			DMI_MATCH(DMI_SYS_VENDOR, "LENOVO"),
+			DMI_MATCH(DMI_PRODUCT_FAMILY, "Yoga 14cACN 2021"),
+		},
+		.driver_data = (void *)&yoga_8bit_fans_cfg,
+	},
 	{
 		.ident = "Lenovo LOQ 15IAX9",
 		.matches = {
-- 
2.55.0

