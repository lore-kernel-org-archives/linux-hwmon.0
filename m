Received: from mail-dy1-f174.google.com (mail-dy1-f174.google.com [74.125.82.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 376B52C187
	for <linux-hwmon@vger.kernel.org>; Sat, 10 Jan 2026 03:48:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.82.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768016889; cv=none; b=OVjKV/GTmaU/B62oViLx8py+f8uydGEQ7xkzwZOHGuuozqYZ4BNgQ4lCIN64xk2qynIt+NAoP0sacPWiPLFbiSQlE0JFKmtk952YLJ2hWcnmBT3+bJ+E+OIPJ6zQSjjQNT7HBssW/jwcq1zoLqM314uUCDy4ScwLjcurkdX96pQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768016889; c=relaxed/simple;
	bh=I5tgSNj1k7nIlLwpPArjJ49L2olCF5Tkg0yHQPQh7pQ=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=bn15owlRohNxy+XSyy87pTnXoVAFv11J7h1E7Qq+39eAW+g59/e4jx7H7Ty30iFQ00judOaTFeMLJJje19lg+mKxGwDJOkfbF/WHdxlz6TwczAHb61oiLjMLu9ZXfUQA+PzNKD4aJ4g9uk5kiVUApHdtq8MPXlSqbt0VlxScHXc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Wopp95pW; arc=none smtp.client-ip=74.125.82.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Wopp95pW"
Received: by mail-dy1-f174.google.com with SMTP id 5a478bee46e88-2b1981ca515so1773387eec.1
        for <linux-hwmon@vger.kernel.org>; Fri, 09 Jan 2026 19:48:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1768016887; x=1768621687; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=0pAVftY7tVlwMU1lS9WfC2TjYVDM89y7C/npUhh1x/U=;
        b=Wopp95pW0FUuWFqWj5BiPB5otCwgXHegAV8Wirj/attL0/67eln2rR2qfeC0ZEfiRS
         cHx+Hu8Qmb3/v3XuMrdJ+nX3JcSCrihLp+yhsBhThk7SPtT139siwouRfuK+OWlyL+cL
         JH2fwqclf7eE6U3seUwMMkwHGtVtzs012b2w8jN6TcFWlj84S82yLTU6e8LOVVGnPkmt
         Ms8Q4r2A3uk5f9EmsNolDIfMsw5N98siYMN+jsJ66ajgZbUaroq3oP90ZUGuqCdoqaPf
         RnoMFi3VrRNpwrWvI6np/iPzwnIkd8oAtZqp2NBAqSpR4hVnBRXAAYA1WDJiQPilSdM6
         oC6A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768016887; x=1768621687;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=0pAVftY7tVlwMU1lS9WfC2TjYVDM89y7C/npUhh1x/U=;
        b=RfoR0msWqFpajC5CEpWZHHK1lxQAILuP8ZsBsjpYAvgcSz1mwXFkdlKuV9RyLWPEsR
         INJnpRoz+J5IHKhnfC1Gn2NbZFBVAMUFOMRjorsc4DGz42szon2QB4K+vB/+ZcXS/FPk
         R4y0tfo2YljftZrvFpJFRro+spLkxhFZdBM8CEWW24jt3N1E+6tsnIc52KgZAVfd+mFV
         WepHwUqkxddgN35kj3sSlyMgWdncQ6YmwUMtq9gcxbW/Ac8kvDU1hh09mqruMQcDXiUA
         WfNp3BJ3Ts1RAfTIPfRoJRjrGCCakEQ+dzccV13LKOh4Aj5M8belsD51Uz56N2SEuJ+E
         sbkA==
X-Forwarded-Encrypted: i=1; AJvYcCVvk99FdbzObmVYUZZZ01A0M6SMkRJVEUxwvd46OZrh/dOZGZ5WrDojbX7T8QMARePruUHFIo5BvlAQNg==@vger.kernel.org
X-Gm-Message-State: AOJu0YyDrtc54htWeJZAirFrrpAEwjxBES/oNyQ3KrUOGt7JQ5+ChbDr
	V4Ar9Kmi7nLPcP1W+Me7AgVQFCLkXbvqQJGJv+NHdJd6hdxUI7plaz3U
X-Gm-Gg: AY/fxX6W57PLj3jZRjpbOE7BfQv3gGKtf2bUu7FBnlitheFQCEMo/J/7IwWFs8Cz4xu
	E9GuTpV7lrnXqZj4ahz1tk/prt88AVKSg0ns3eaX/JN1ub1NqHDOHhkhOptlpoOvyobkcjDD06D
	K1yDNt2x2eIbRzr2v+csWOcOZC5RRQUH2SgFf60jkyXbpNCqt3jMYN4QohH8EzA8fbxnlSwLkC/
	9yTSgtK4fXTop+yehEiIjOEb6GFsJzRAo5N7+vPubsh71zwFsoQe2w5FmToZyBtSsEdrG3coVd6
	i7ygOLPO+YoqSIlD7QcQj+UCypFvPX2wh3lmyhDDnddN8KeNYEf9ZE9YxKPUTnMJg/Y21TDO+Cv
	cnRM/cj9oGXU5GPS7e0ubxkC0ZFklE8GXOQrj3cCazqhZNaabK60+kq8DHWQ3WLCNXzvRWgJKwJ
	Zvec69eKFLaY5XCKFvekD2oQcYnW0=
X-Google-Smtp-Source: AGHT+IE/zXXxozb3RxJsgvxlBw4HkkWbt/Zj+nb70W07g5FYTSrTXrnwfyFum915RUWFiZInVeSxxw==
X-Received: by 2002:a05:7301:c02:b0:2a4:5005:7ee1 with SMTP id 5a478bee46e88-2b17d2d64bamr6343928eec.37.1768016887272;
        Fri, 09 Jan 2026 19:48:07 -0800 (PST)
Received: from dellphi.android606.com ([2601:644:4784:74b0:c2e:ecff:fed9:d646])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-2b175bee31dsm10239900eec.32.2026.01.09.19.48.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 09 Jan 2026 19:48:06 -0800 (PST)
From: Andrew Mark <android606@gmail.com>
To: pali@kernel.org
Cc: linux@roeck-us.net,
	linux-hwmon@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Andrew Mark <android606@gmail.com>
Subject: [PATCH] hwmon: (dell-smm) Extend fan support to 5 fans
Date: Sat, 10 Jan 2026 03:47:32 +0000
Message-ID: <20260110034732.236285-1-android606@gmail.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Dell Precision Tower workstations have 5 fan connectors, but the
driver was limited to 4 fans after commit dbcfcb239b3b ("hwmon:
(dell-smm) Increment the number of fans").

This patch increases DELL_SMM_NO_FANS to 5 and adds the necessary
hwmon channel info for the fifth fan and its PWM control.

Without this patch, the PCIe/GPU cooling fan (fan 5) is not
controllable, which can lead to overheating on systems with
high-power fanless GPUs that depend on chassis cooling.

Also adds a DMI quirk for Precision Tower 5810 to provide accurate
fan labels, as the BIOS reports generic types for these fans.

Tested on Dell Precision Tower 5810 (BIOS A34) with all 5 fans
responding correctly to PWM control.

Fan mapping for Precision Tower 5810:
- fan0: CPU heatsink
- fan1: Second CPU (dual-CPU systems only)
- fan2: Right DIMM bank
- fan3: Left DIMM bank
- fan4: PCIe/GPU cooling

Signed-off-by: Andrew Mark <android606@gmail.com>
---
 drivers/hwmon/dell-smm-hwmon.c | 19 ++++++++++++++++++-
 1 file changed, 18 insertions(+), 1 deletion(-)

diff --git a/drivers/hwmon/dell-smm-hwmon.c b/drivers/hwmon/dell-smm-hwmon.c
index 6040a8940..b112e6fbc 100644
--- a/drivers/hwmon/dell-smm-hwmon.c
+++ b/drivers/hwmon/dell-smm-hwmon.c
@@ -74,7 +74,7 @@
 #define DELL_SMM_LEGACY_EXECUTE	0x1
 
 #define DELL_SMM_NO_TEMP	10
-#define DELL_SMM_NO_FANS	4
+#define DELL_SMM_NO_FANS	5
 
 /* limit fan multiplier to avoid overflow */
 #define DELL_SMM_MAX_FAN_MULT (INT_MAX / U16_MAX)
@@ -175,6 +175,14 @@ static const char * const docking_labels[] = {
 	"Docking Other Fan",
 };
 
+static const char * const precision_tower_5810_labels[] = {
+	"CPU Fan",
+	"CPU Fan 2",
+	"Right DIMM Fan",
+	"Left DIMM Fan",
+	"PCIe Fan",
+};
+
 static inline const char __init *i8k_get_dmi_data(int field)
 {
 	const char *dmi_data = dmi_get_system_info(field);
@@ -991,6 +999,12 @@ static const char *dell_smm_fan_label(struct dell_smm_data *data, int channel)
 	if (type < 0)
 		return ERR_PTR(type);
 
+	if (dmi_match(DMI_PRODUCT_NAME, "Precision Tower 5810")) {
+		if (channel < ARRAY_SIZE(precision_tower_5810_labels))
+			return precision_tower_5810_labels[channel];
+		return "Unknown Fan";
+	}
+
 	if (type & 0x10) {
 		dock = true;
 		type &= 0x0F;
@@ -1129,12 +1143,15 @@ static const struct hwmon_channel_info * const dell_smm_info[] = {
 			   HWMON_F_INPUT | HWMON_F_LABEL | HWMON_F_MIN | HWMON_F_MAX |
 			   HWMON_F_TARGET,
 			   HWMON_F_INPUT | HWMON_F_LABEL | HWMON_F_MIN | HWMON_F_MAX |
+			   HWMON_F_TARGET,
+			   HWMON_F_INPUT | HWMON_F_LABEL | HWMON_F_MIN | HWMON_F_MAX |
 			   HWMON_F_TARGET
 			   ),
 	HWMON_CHANNEL_INFO(pwm,
 			   HWMON_PWM_INPUT | HWMON_PWM_ENABLE,
 			   HWMON_PWM_INPUT | HWMON_PWM_ENABLE,
 			   HWMON_PWM_INPUT | HWMON_PWM_ENABLE,
+			   HWMON_PWM_INPUT | HWMON_PWM_ENABLE,
 			   HWMON_PWM_INPUT | HWMON_PWM_ENABLE
 			   ),
 	NULL
-- 
2.43.0

