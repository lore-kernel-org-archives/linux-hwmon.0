Received: from mail-oi1-f173.google.com (mail-oi1-f173.google.com [209.85.167.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 60E69153836
	for <linux-hwmon@vger.kernel.org>; Sun, 30 Jun 2024 16:45:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.173
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1719765937; cv=none; b=cE7Tqpu21law5dlJ6dul2orzWTYs9Fh8qAmSk+bwkuk89M2KWRrOFZiQmd1KLZa/K7vIEX1IBPlLaeOovE1DhLhRAPcgaB8rEf3KCJnJN5/YVjePF2aZbVpi9YE0Bn6RT0X7sUviPOV7Vtzim4hMRdwWcn40LihiOyqye1Aj0xY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1719765937; c=relaxed/simple;
	bh=pgA5fsxd9dFvJqdUEpU2+Is+vg+WfyeMNrrbkMMru6o=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=fu8xptdV5eIGI4Ff0ZBWhHVDOx5EjrJlQN9F6pAjF+DkVQz4Cm4Ede0h/AbQe7fNF5WGXE+Rdma21r3s8f4vhVQfjynTE/ACH1OuauPV42r1I1Jp2dvlNO0xXx/atAIlB/xwacQN49B7DwLseWmuQBd6M97KPbndgb8CfRfLlxI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Hynz+qtl; arc=none smtp.client-ip=209.85.167.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Hynz+qtl"
Received: by mail-oi1-f173.google.com with SMTP id 5614622812f47-3d566d5eda9so1157608b6e.0
        for <linux-hwmon@vger.kernel.org>; Sun, 30 Jun 2024 09:45:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1719765934; x=1720370734; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:sender:from:to:cc:subject:date:message-id:reply-to;
        bh=BuQE8ao8Haad0gAaU8jZZ/c///hyDr1LykvZeAVaP3A=;
        b=Hynz+qtlGarXJJVrXYnVJJrRDMrytGCcmQHtBZundlZGDmUGm8BvEYQzsOc6e97bcl
         uSw0oCnTgjRDh7ONcV9UBH++x4K7rE7HVdbPsV+LY9L2ZZavDr6VyMnupAj7+fGnPnWG
         CPxqxfkywRpNvQrnIpRnUaGvwxWmW/SHsiACGY+ElXt/+KxXIf8mDG1hRPElpY7zvbxt
         MV7NIBOUFIyq1LfrQ3sWkzDEj8GpGWnQNLeRSwk3hCNe/XHDcaSswlQwr15w5uwXWC7X
         RLPT1cGdlotgrZtDhr5M7YhhKklpzPIW59F/psrzC28KZXnyPRzhZ1UbpoSyVbzsQTvk
         Fe0g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1719765934; x=1720370734;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:sender:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=BuQE8ao8Haad0gAaU8jZZ/c///hyDr1LykvZeAVaP3A=;
        b=Car7iyuh8mwWgrL/V2wBwjVr2RVKDmvCXo0r+IDvVH5WN94i2fUGomVRZQu2oL/rFZ
         HeKV2mqLpmzY7n0SQFLwqeAA6bZgBNemgLjXYnLZGjqsJ0i3yeKlWVrIH8jo/WOg74tX
         3zlVtMPreuMAa5J1AmPqusV11fTTxrZdzQ1bul3BqpyA3wPm1bNsHcEbnLXh4h20Qb8Z
         XjuhqSzG0hJ0m7FS4iZpsNShBo002jctPgGRjlBm3zop3/RI9DVDty3NG6GpeXQrmmES
         1fHFOZtkbneCd6/sy5wCByAvk8rsbpWaF6xp/deyKikRuRzQ/2QpibLz8K6tkUVr9WkA
         XUHA==
X-Gm-Message-State: AOJu0Yye0XTKCRCFRGIFIGNSPiCxfDSdyIuaW1LO6upKWdbHCVK/Hry9
	wA1WbpaZmBW7JERjOgfRfQECZ9ZRjmiyjoG/MQASTdfmVJ9ZGTKSr2BPMg==
X-Google-Smtp-Source: AGHT+IFNVloG6H33wZDZ+bLoBWR6yxEzOQXiQJW8BmBHvmMZkCWNVedQ9PrcFTMn0IdN+q+UGs8bvw==
X-Received: by 2002:a05:6808:19a8:b0:3d6:2fb8:2905 with SMTP id 5614622812f47-3d6b4de2ec9mr4646502b6e.42.1719765933896;
        Sun, 30 Jun 2024 09:45:33 -0700 (PDT)
Received: from server.roeck-us.net ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-7080256bf09sm4852763b3a.66.2024.06.30.09.45.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 30 Jun 2024 09:45:32 -0700 (PDT)
Sender: Guenter Roeck <groeck7@gmail.com>
From: Guenter Roeck <linux@roeck-us.net>
To: Hardware Monitoring <linux-hwmon@vger.kernel.org>
Cc: Jean Delvare <jdelvare@suse.com>,
	Guenter Roeck <linux@roeck-us.net>
Subject: [PATCH] hwmon: (jc24) Use common device ID for TSE2004 compliant sensors
Date: Sun, 30 Jun 2024 09:45:31 -0700
Message-Id: <20240630164531.1865511-1-linux@roeck-us.net>
X-Mailer: git-send-email 2.39.2
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

TSE2004 standardizes the device ID of compliant temperature sensors
to be 0x22xx, where xx is the device revision. Use a single define
for all TSE2004 compliant temperature sensors, and relax the device
id mask to match the upper 8 bit of the device id register.

Signed-off-by: Guenter Roeck <linux@roeck-us.net>
---
 drivers/hwmon/jc42.c | 43 ++++++++++---------------------------------
 1 file changed, 10 insertions(+), 33 deletions(-)

diff --git a/drivers/hwmon/jc42.c b/drivers/hwmon/jc42.c
index 7092f8f025b8..1180af1b1638 100644
--- a/drivers/hwmon/jc42.c
+++ b/drivers/hwmon/jc42.c
@@ -79,20 +79,9 @@ static const unsigned short normal_i2c[] = {
 #define AT30TS00_DEVID		0x8201
 #define AT30TS00_DEVID_MASK	0xffff
 
-#define AT30TSE004_DEVID	0x2200
-#define AT30TSE004_DEVID_MASK	0xffff
-
-/* Giantec */
-#define GT30TS00_DEVID		0x2200
-#define GT30TS00_DEVID_MASK	0xff00
-
 #define GT34TS02_DEVID		0x3300
 #define GT34TS02_DEVID_MASK	0xff00
 
-/* IDT */
-#define TSE2004_DEVID		0x2200
-#define TSE2004_DEVID_MASK	0xff00
-
 #define TS3000_DEVID		0x2900  /* Also matches TSE2002 */
 #define TS3000_DEVID_MASK	0xff00
 
@@ -116,9 +105,6 @@ static const unsigned short normal_i2c[] = {
 #define MCP98243_DEVID		0x2100
 #define MCP98243_DEVID_MASK	0xfffc
 
-#define MCP98244_DEVID		0x2200
-#define MCP98244_DEVID_MASK	0xfffc
-
 #define MCP9843_DEVID		0x0000	/* Also matches mcp9805 */
 #define MCP9843_DEVID_MASK	0xfffe
 
@@ -136,12 +122,6 @@ static const unsigned short normal_i2c[] = {
 #define CAT34TS02C_DEVID	0x0a00
 #define CAT34TS02C_DEVID_MASK	0xfff0
 
-#define CAT34TS04_DEVID		0x2200
-#define CAT34TS04_DEVID_MASK	0xfff0
-
-#define N34TS04_DEVID		0x2230
-#define N34TS04_DEVID_MASK	0xfff0
-
 /* ST Microelectronics */
 #define STTS424_DEVID		0x0101
 #define STTS424_DEVID_MASK	0xffff
@@ -152,15 +132,12 @@ static const unsigned short normal_i2c[] = {
 #define STTS2002_DEVID		0x0300
 #define STTS2002_DEVID_MASK	0xffff
 
-#define STTS2004_DEVID		0x2201
-#define STTS2004_DEVID_MASK	0xffff
-
 #define STTS3000_DEVID		0x0200
 #define STTS3000_DEVID_MASK	0xffff
 
-/* Seiko Instruments */
-#define S34TS04A_DEVID		0x2221
-#define S34TS04A_DEVID_MASK	0xffff
+/* TSE2004 compliant sensors */
+#define TSE2004_DEVID		0x2200
+#define TSE2004_DEVID_MASK	0xff00
 
 static u16 jc42_hysteresis[] = { 0, 1500, 3000, 6000 };
 
@@ -173,8 +150,8 @@ struct jc42_chips {
 static struct jc42_chips jc42_chips[] = {
 	{ ADT_MANID, ADT7408_DEVID, ADT7408_DEVID_MASK },
 	{ ATMEL_MANID, AT30TS00_DEVID, AT30TS00_DEVID_MASK },
-	{ ATMEL_MANID2, AT30TSE004_DEVID, AT30TSE004_DEVID_MASK },
-	{ GT_MANID, GT30TS00_DEVID, GT30TS00_DEVID_MASK },
+	{ ATMEL_MANID2, TSE2004_DEVID, TSE2004_DEVID_MASK },
+	{ GT_MANID, TSE2004_DEVID, TSE2004_DEVID_MASK },
 	{ GT_MANID2, GT34TS02_DEVID, GT34TS02_DEVID_MASK },
 	{ IDT_MANID, TSE2004_DEVID, TSE2004_DEVID_MASK },
 	{ IDT_MANID, TS3000_DEVID, TS3000_DEVID_MASK },
@@ -184,19 +161,19 @@ static struct jc42_chips jc42_chips[] = {
 	{ MCP_MANID, MCP9808_DEVID, MCP9808_DEVID_MASK },
 	{ MCP_MANID, MCP98242_DEVID, MCP98242_DEVID_MASK },
 	{ MCP_MANID, MCP98243_DEVID, MCP98243_DEVID_MASK },
-	{ MCP_MANID, MCP98244_DEVID, MCP98244_DEVID_MASK },
+	{ MCP_MANID, TSE2004_DEVID, TSE2004_DEVID_MASK },
 	{ MCP_MANID, MCP9843_DEVID, MCP9843_DEVID_MASK },
 	{ NXP_MANID, SE97_DEVID, SE97_DEVID_MASK },
 	{ ONS_MANID, CAT6095_DEVID, CAT6095_DEVID_MASK },
 	{ ONS_MANID, CAT34TS02C_DEVID, CAT34TS02C_DEVID_MASK },
-	{ ONS_MANID, CAT34TS04_DEVID, CAT34TS04_DEVID_MASK },
-	{ ONS_MANID, N34TS04_DEVID, N34TS04_DEVID_MASK },
+	{ ONS_MANID, TSE2004_DEVID, TSE2004_DEVID_MASK },
+	{ ONS_MANID, TSE2004_DEVID, TSE2004_DEVID_MASK },
 	{ NXP_MANID, SE98_DEVID, SE98_DEVID_MASK },
-	{ SI_MANID,  S34TS04A_DEVID, S34TS04A_DEVID_MASK },
+	{ SI_MANID,  TSE2004_DEVID, TSE2004_DEVID_MASK },
 	{ STM_MANID, STTS424_DEVID, STTS424_DEVID_MASK },
 	{ STM_MANID, STTS424E_DEVID, STTS424E_DEVID_MASK },
 	{ STM_MANID, STTS2002_DEVID, STTS2002_DEVID_MASK },
-	{ STM_MANID, STTS2004_DEVID, STTS2004_DEVID_MASK },
+	{ STM_MANID, TSE2004_DEVID, TSE2004_DEVID_MASK },
 	{ STM_MANID, STTS3000_DEVID, STTS3000_DEVID_MASK },
 };
 
-- 
2.39.2

