Received: from mail-pg1-f171.google.com (mail-pg1-f171.google.com [209.85.215.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7164B51C336
	for <linux-hwmon@vger.kernel.org>; Tue,  8 Sep 2026 09:49:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788860990; cv=none; b=tZGyB6Rg93lo2BqMn8B3b6z1uXbhxOWyvmUUYwqgkzwc6s69GI7wVuikHs5bPM0oisBN89W5jXp2ya3qWg8nqbWBJmY6YjHj/xx0eM1pvQuJcAJa17LjyFrYF4IT1hI+F/ux5E6EmmhLwZ4L9B3anJajQZtTVnKdbqZizFG4cYs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788860990; c=relaxed/simple;
	bh=XQdkUvgOydo+9e7O8MX2+dcnxlTods4ZcA5zB20fLYk=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=m2GkME28QjOg/EKF0TxDtWboSY8kKWCM614GaGB7NOmGw7E/MvvisENK7HVuH5QrR3TG+Di0qr3PoCbEg6XSu+qzwT1N+4x0H8XLPudZCXduBdrr8KAfunGBG83Yayfl3zO4TDOidVzruGq0QsktUH+/7TyifhmT3vXHp9IWm8U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=DutMdQAI; arc=none smtp.client-ip=209.85.215.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="DutMdQAI"
Received: by mail-pg1-f171.google.com with SMTP id 41be03b00d2f7-cbe6295f05bso3457686a12.1
        for <linux-hwmon@vger.kernel.org>; Tue, 08 Sep 2026 02:49:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788860987; x=1789465787; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=0PBUJEeFBiWjNqjSYPXJZjecT0G0qpYB0cRk1PSNGo4=;
        b=DutMdQAIG+ipXfZbqZtXHvTTA+lkCIFdp3txm76S9by7FFFn3vPs+v1KeJOgP2wrdw
         z+K4bqvlgJYX/7rTiHqsLxBHWh49KGMqQgjEd1D3oyMGTw403Ro/ZiFvOh3/Tu30MoOJ
         vNfEWC/lCAVgCwli8sC95J9DyLa/rOjrnrtVh6upSOaHpcQlEivRjaC3Yn3HmLY29D4N
         1EWzndrfGs7iD+72MWurvol1ybvwdw7w2sCUDDia+goNMQLIIjdmH+vGI67sZzsE8NdP
         xITxfPCvbhjMfx0Gm2YA8Ym7MOIcIDNhORKHMFDkKsi4rtGG00khrsxTIVivr9gJOSvr
         zl3w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788860987; x=1789465787;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=0PBUJEeFBiWjNqjSYPXJZjecT0G0qpYB0cRk1PSNGo4=;
        b=V4GDx0KHHRzILjELlKNiAks4tSIVqdeSbsl3/0MZ43q8z5y25svrGCSBghFZqTd+h4
         CRPkCF8pPiIWoMpeAsHXHNNE/ZAD86NwQC+VMShdIqYU1KY/6Z3R04l/gR3pRfqdvIiK
         6MKJGc1Tsa6zI8ffHVp/huZ3FVqKL9GJW3XwiEGKIOj60b1TQ7JChjf053CDBzF4PccQ
         EaNYHpfPE3I4/0y8wbWumc5NV7HOGaMjHxrmdRan3uk0HJ7/YMkC+tkvB8eK/KcuGKsx
         yXWJsDzX5Ge/ckP9cqmP27i5nTc4mhVKUm0D24HDuAY7kfgrGpD/eHyPRyNbHwTBsalf
         Fl9Q==
X-Gm-Message-State: AFuF++nDSWpl8AxAtoIw9Wb0J0EXjNmy7PmGVA+LhaeQjqhc7NwUSK7/
	N2F521X0WNS5L7PSndy0bbU5KczL3rGjTKnPmlh1jF8KIgjegyTPv1V3
X-Gm-Gg: AYBFou06gV+beQblzZ2LOZOHczds4qRv8MlOVPIIa6AuiM60mUWPJSZNcxoB0l0BzL9
	iwj6UzBuu8r2j2AX7GHmZHY32pzsXhXLGfLnxV7xBN80GL/VthdVah2pROWpK8bAidruhksgcyb
	/uQTt9QunkyyqcGt5z3YvD5PO0PtyUkYTuNLHSw+Of3KAbXZ0A/9k1QPuAEb37YuKeXiC1Z61ze
	a6/wJvKbb6mpMgmvQ7WE47nJoURSFeNBvZ3E1y/KFEBeDqarP17/K96XuzZWx7gF7e0yeAcg27y
	AeLHA9Rk2C5h5Rh71ptsoIJTW7OUjF4DZR7KDk3pu+0v/LZSVeQaLbq0BP2IV8eLsobBERc9zlp
	XXcrfvLUCjF5nvJXngJ7+w3CT7Fx7Eas6K/A6ZUopITP8xUbSLHX9yriWkBgR7p61bs1dintVt6
	J9ZA0UYhv0nIHEm8i7BuW+kJwlWTKmdKhMW60imJy3lOqB/LZjVrHkjZIXPIT45qGGV85M+MkFK
	DiDpSFpf9exdJD2YvmVcPqMMe8AThpyXlw7ghvND1O/IoTQdFWsmg==
X-Received: by 2002:a17:90b:2244:b0:380:86d8:8162 with SMTP id 98e67ed59e1d1-39b0865353bmr36029494a91.18.1788860987304;
        Tue, 08 Sep 2026 02:49:47 -0700 (PDT)
Received: from sergio-82n7.fritz.box (static-23-234-74-239.cust.tzulo.com. [23.234.74.239])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3356dc5c04dsm23583208eec.8.2026.09.08.02.49.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 08 Sep 2026 02:49:46 -0700 (PDT)
From: Sergio Melas <sergiomelas@gmail.com>
To: Guenter Roeck <linux@roeck-us.net>
Cc: linux-hwmon@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Sergio Melas <sergiomelas@gmail.com>
Subject: [PATCH v2] hwmon: (yogafan) Add support for new Lenovo models
Date: Tue,  8 Sep 2026 11:49:31 +0200
Message-ID: <20260908094931.2227049-1-sergiomelas@gmail.com>
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

