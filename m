Received: from mail-pl1-f176.google.com (mail-pl1-f176.google.com [209.85.214.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AD4394322E9
	for <linux-hwmon@vger.kernel.org>; Thu, 13 Aug 2026 21:14:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.176
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786655679; cv=none; b=DSZZgt1ZIGAFyGU9u0uzldNrvag4WjqNmZkYpuQDAZEGoi2I4n5Gq1SXt4bAxSQBSian1lrZyRP2ZhSqgERyBzaA2dvevtVHY0Ex3oPDh+/Bv7yI3kkcuNLR2ZzM5yy3LO6z934/wR1NWywgHxW1fX57RgwH24YdeeAlRTAvmMY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786655679; c=relaxed/simple;
	bh=nG0r8SfmkjqqfsSkXsaglTK0jqmD3LLNfncdSwGO0cc=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=Rhbr8t1t2E8xDSwi0UhhWJh/baWggq12eivZZ+UfhvJWrc72ovMmBW0937BfpLdFlEV/AzKqrFTI+RfcjlY37GoMPGOu8K3mdCPouYYVCvy/OX466kMDIZE92AgmIxdbDSBi514Z+u2ogy5rn7KFdD48TLYWT9JsgaAJjCUxyjA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=GdOeD/Q7; arc=none smtp.client-ip=209.85.214.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="GdOeD/Q7"
Received: by mail-pl1-f176.google.com with SMTP id d9443c01a7336-2caea3f742bso6963515ad.0
        for <linux-hwmon@vger.kernel.org>; Thu, 13 Aug 2026 14:14:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1786655677; x=1787260477; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:sender:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Z7FAPGtYVLZ3QFJMRUoEV7czvEAQdnLLLL063XrMk1w=;
        b=GdOeD/Q7dtxhMlvp7TeKgvTBNzwgjjxI+AQnQzMFPV8X6wTXV0m0N26malarA/i8fz
         N4ao6oQ/A8RKUeOJE6G1t8kHNlpKidBggvorIxtMI4Lruup1mNjZ0B4X/HKa3I4MfjrX
         StJJ5fjNLGW3htZcEM7YyNKvRiK1G4iqTM8/yXBk3AtWBZ7T4gKdpsFrAoXshLBccNY6
         KVUoWWia7rpgg1LI80W6UGt9nAnxhZd2/LknkYUIQPxketUSROcuaJPMBBp4MY4rnnn7
         DgVWfw+Ac8OJ8Y0Ia22PX/XkY5bBwwRWsX5DTSg3uBOXw917PYo/FM1qBa/WJMABg/Lo
         W4DA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786655677; x=1787260477;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:sender:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Z7FAPGtYVLZ3QFJMRUoEV7czvEAQdnLLLL063XrMk1w=;
        b=J3+71pGLXSMWlYuMphBIASLdm6CtxHQ6weww40vbaVCOCf6hi/RYs8IREDl1qSIE5c
         Z2WcCJOoMAK/W2e2QFvNdWg96UX0xL3uaapWlswygvvZbEPavMIzDIaJZZqSFBy+sYoc
         M7YWiHT6L0F7eZkpAGTNpeEAf1Va3/k3jxXZpGq3I/bVp9HeCXzV6cTePMOKC2AuGw+1
         eZDRwEQW+RfDZmYAwTlqTz65+EuV+J4x+6Qo/5aDIqxzUDfXr+XB2DHDY01Fj7zsukKK
         Fp+9N62mDMSBmv3GGuEHzzz7I2wNzypZGGv94WSG3TBczCnmRo7BDwGXEdNMrxNKVM05
         Y30w==
X-Gm-Message-State: AOJu0YzlGlQwcCWij7eQgu0GJY02FYY/2pB9E5T8U7WtWp5jfOW6yPB5
	I5O6zpQMLPBt0DunW3WMd4EIT2Hp3FmHJLRHQGVxqv5W3alFtDNlr/0rC7Ff0g==
X-Gm-Gg: AR+sD13dVmg5+UXiQd4JBz26ctNaLAE0oV6l7+yudkFrqDrOi84ywChvF254K2yOjoi
	UkAd2mf6IImoUe4v3JL1+DjU/1TG4+f/CBY1tjQho44GIYgtfX/gpkEexCvzTNiWvrLlWNLx01l
	YA2FprLTYE5PabfHRIUyRBYHpfsY4rClhaFNW8hz1aHXeU2ctmvGh/E2avldC3MKDMI/g2sSvO6
	P0xQVkCTr2Wz/02lo5SpPoCJSP7i9cpAb7jwYLt5KZEBTia17Lo08+iLvHFfXeVtJtvQBxZZkvS
	vWmwT8DaUmVbv9Ky4lpxGssMHX1NI3S3mVemT33I85KjWOssvgLTudWfKszXR7/mk86gyDaWwJ0
	NA8nksrXIiv3acJHNW+Zl9taf55YCvh9XQFk6MH4rnAc2gf97IpWDlcFww9sxU3yDOPm1ZeRR+K
	XypRdapXWwPvMdLNo4IMhYPjqPMo9Y/uvT7waO8ZF9iq9erUjUSfXfoIyxCeULpeOqCAYhrin5y
	g==
X-Received: by 2002:a05:6a20:93a0:b0:3b4:8f18:33a with SMTP id adf61e73a8af0-3cc71ac3815mr885192637.1.1786655676868;
        Thu, 13 Aug 2026 14:14:36 -0700 (PDT)
Received: from server.roeck-us.net ([2600:1700:e321:62f0:da43:aeff:fecc:bfd5])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-31ec0228793sm12075074eec.26.2026.08.13.14.14.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 13 Aug 2026 14:14:36 -0700 (PDT)
Sender: Guenter Roeck <groeck7@gmail.com>
From: Guenter Roeck <linux@roeck-us.net>
To: Hardware Monitoring <linux-hwmon@vger.kernel.org>
Cc: Guenter Roeck <linux@roeck-us.net>,
	Manaf Meethalavalappu Pallikunhi <manaf.pallikunhi@oss.qualcomm.com>
Subject: [PATCH v2] hwmon: Add support for currX_emergency and inX_[l]emergency attributes
Date: Thu, 13 Aug 2026 14:14:33 -0700
Message-ID: <20260813211433.879638-1-linux@roeck-us.net>
X-Mailer: git-send-email 2.45.2
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Some hardware monitoring chips support three alarm levels for current and
voltage high limits, and three alarm levels for voltage low limits.
Add support for currX_emergency, inX_emergency, and inX_lemergency
attributes together with the appropriate alarm attributes to support such
chips.

Cc: Manaf Meethalavalappu Pallikunhi <manaf.pallikunhi@oss.qualcomm.com>
Signed-off-by: Guenter Roeck <linux@roeck-us.net>
---
v2: Also support inX_lemergency for voltage low emergency limits.

 Documentation/ABI/testing/sysfs-class-hwmon | 36 +++++++++++++++++++++
 Documentation/hwmon/sysfs-interface.rst     | 12 +++++++
 drivers/hwmon/hwmon.c                       |  6 ++++
 include/linux/hwmon.h                       | 12 +++++++
 4 files changed, 66 insertions(+)

diff --git a/Documentation/ABI/testing/sysfs-class-hwmon b/Documentation/ABI/testing/sysfs-class-hwmon
index b185bdfc7186..34df6d7bd5f8 100644
--- a/Documentation/ABI/testing/sysfs-class-hwmon
+++ b/Documentation/ABI/testing/sysfs-class-hwmon
@@ -61,6 +61,18 @@ Description:
 		take drastic action such as power down or reset. At the very
 		least, it should report a fault.
 
+What:		/sys/class/hwmon/hwmonX/inY_lemergency
+Description:
+		Voltage emergency min value.
+
+		Unit: millivolt
+
+		RW
+
+		If voltage drops to or below this limit, the system is
+		expected to take drastic action such as immediate power
+		down or reset. At the very least, it should report a fault.
+
 What:		/sys/class/hwmon/hwmonX/inY_max
 Description:
 		Voltage max value.
@@ -81,6 +93,18 @@ Description:
 		take drastic action such as power down or reset. At the very
 		least, it should report a fault.
 
+What:		/sys/class/hwmon/hwmonX/inY_emergency
+Description:
+		Voltage emergency max value.
+
+		Unit: millivolt
+
+		RW
+
+		If voltage reaches or exceeds this limit, the system is expected
+		to take drastic action such as immediate power down or reset.
+		At the very least, it should report a fault.
+
 What:		/sys/class/hwmon/hwmonX/inY_input
 Description:
 		Voltage input value.
@@ -647,6 +671,18 @@ Description:
 
 		RW
 
+What:		/sys/class/hwmon/hwmonX/currY_emergency
+Description:
+		Current emergency high value.
+
+		Unit: milliampere
+
+		RW
+
+		If a current reaches or exceeds this limit, the system is
+		expected to take drastic action such as immediate power down
+		or reset. At the very least, it should report a fault.
+
 What:		/sys/class/hwmon/hwmonX/currY_input
 Description:
 		Current input value
diff --git a/Documentation/hwmon/sysfs-interface.rst b/Documentation/hwmon/sysfs-interface.rst
index 94e1bbce172a..f7ab5d5c4d3a 100644
--- a/Documentation/hwmon/sysfs-interface.rst
+++ b/Documentation/hwmon/sysfs-interface.rst
@@ -121,12 +121,18 @@ Voltages
 `in[0-*]_lcrit`
 		Voltage critical min value.
 
+`in[0-*]_lemergency`
+		Voltage emergency min value.
+
 `in[0-*]_max`
 		Voltage max value.
 
 `in[0-*]_crit`
 		Voltage critical max value.
 
+`in[0-*]_emergency`
+		Voltage emergency max value.
+
 `in[0-*]_input`
 		Voltage input value.
 
@@ -332,6 +338,9 @@ Currents
 `curr[1-*]_crit`
 		Current critical high value.
 
+`curr[1-*]_emergency`
+		Current emergency high value.
+
 `curr[1-*]_input`
 		Current input value.
 
@@ -527,12 +536,15 @@ implementation.
 +-------------------------------+-----------------------+
 | **`in[0-*]_min_alarm`,	| Limit alarm		|
 | `in[0-*]_max_alarm`,		|			|
+| `in[0-*]_lemergency_alarm`,	|			|
 | `in[0-*]_lcrit_alarm`,	|   - 0: no alarm	|
 | `in[0-*]_crit_alarm`,		|   - 1: alarm		|
+| `in[0-*]_emergency_alarm`,	|			|
 | `curr[1-*]_min_alarm`,	|			|
 | `curr[1-*]_max_alarm`,	| RO			|
 | `curr[1-*]_lcrit_alarm`,	|			|
 | `curr[1-*]_crit_alarm`,	|			|
+| `curr[1-*]_emergency_alarm`,	|			|
 | `power[1-*]_cap_alarm`,	|			|
 | `power[1-*]_max_alarm`,	|			|
 | `power[1-*]_crit_alarm`,	|			|
diff --git a/drivers/hwmon/hwmon.c b/drivers/hwmon/hwmon.c
index 55a9a3ddd4aa..776ebb26c9c1 100644
--- a/drivers/hwmon/hwmon.c
+++ b/drivers/hwmon/hwmon.c
@@ -621,6 +621,8 @@ static const char * const hwmon_in_attr_templates[] = {
 	[hwmon_in_max] = "in%d_max",
 	[hwmon_in_lcrit] = "in%d_lcrit",
 	[hwmon_in_crit] = "in%d_crit",
+	[hwmon_in_lemergency] = "in%d_lemergency",
+	[hwmon_in_emergency] = "in%d_emergency",
 	[hwmon_in_average] = "in%d_average",
 	[hwmon_in_lowest] = "in%d_lowest",
 	[hwmon_in_highest] = "in%d_highest",
@@ -631,6 +633,8 @@ static const char * const hwmon_in_attr_templates[] = {
 	[hwmon_in_max_alarm] = "in%d_max_alarm",
 	[hwmon_in_lcrit_alarm] = "in%d_lcrit_alarm",
 	[hwmon_in_crit_alarm] = "in%d_crit_alarm",
+	[hwmon_in_lemergency_alarm] = "in%d_lemergency_alarm",
+	[hwmon_in_emergency_alarm] = "in%d_emergency_alarm",
 	[hwmon_in_rated_min] = "in%d_rated_min",
 	[hwmon_in_rated_max] = "in%d_rated_max",
 	[hwmon_in_beep] = "in%d_beep",
@@ -644,6 +648,7 @@ static const char * const hwmon_curr_attr_templates[] = {
 	[hwmon_curr_max] = "curr%d_max",
 	[hwmon_curr_lcrit] = "curr%d_lcrit",
 	[hwmon_curr_crit] = "curr%d_crit",
+	[hwmon_curr_emergency] = "curr%d_emergency",
 	[hwmon_curr_average] = "curr%d_average",
 	[hwmon_curr_lowest] = "curr%d_lowest",
 	[hwmon_curr_highest] = "curr%d_highest",
@@ -654,6 +659,7 @@ static const char * const hwmon_curr_attr_templates[] = {
 	[hwmon_curr_max_alarm] = "curr%d_max_alarm",
 	[hwmon_curr_lcrit_alarm] = "curr%d_lcrit_alarm",
 	[hwmon_curr_crit_alarm] = "curr%d_crit_alarm",
+	[hwmon_curr_emergency_alarm] = "curr%d_emergency_alarm",
 	[hwmon_curr_rated_min] = "curr%d_rated_min",
 	[hwmon_curr_rated_max] = "curr%d_rated_max",
 	[hwmon_curr_beep] = "curr%d_beep",
diff --git a/include/linux/hwmon.h b/include/linux/hwmon.h
index 77a6f2bffcba..3a9d4446c6e0 100644
--- a/include/linux/hwmon.h
+++ b/include/linux/hwmon.h
@@ -134,6 +134,8 @@ enum hwmon_in_attributes {
 	hwmon_in_max,
 	hwmon_in_lcrit,
 	hwmon_in_crit,
+	hwmon_in_lemergency,
+	hwmon_in_emergency,
 	hwmon_in_average,
 	hwmon_in_lowest,
 	hwmon_in_highest,
@@ -144,6 +146,8 @@ enum hwmon_in_attributes {
 	hwmon_in_max_alarm,
 	hwmon_in_lcrit_alarm,
 	hwmon_in_crit_alarm,
+	hwmon_in_lemergency_alarm,
+	hwmon_in_emergency_alarm,
 	hwmon_in_rated_min,
 	hwmon_in_rated_max,
 	hwmon_in_beep,
@@ -156,6 +160,8 @@ enum hwmon_in_attributes {
 #define HWMON_I_MAX		BIT(hwmon_in_max)
 #define HWMON_I_LCRIT		BIT(hwmon_in_lcrit)
 #define HWMON_I_CRIT		BIT(hwmon_in_crit)
+#define HWMON_I_LEMERGENCY	BIT(hwmon_in_lemergency)
+#define HWMON_I_EMERGENCY	BIT(hwmon_in_emergency)
 #define HWMON_I_AVERAGE		BIT(hwmon_in_average)
 #define HWMON_I_LOWEST		BIT(hwmon_in_lowest)
 #define HWMON_I_HIGHEST		BIT(hwmon_in_highest)
@@ -166,6 +172,8 @@ enum hwmon_in_attributes {
 #define HWMON_I_MAX_ALARM	BIT(hwmon_in_max_alarm)
 #define HWMON_I_LCRIT_ALARM	BIT(hwmon_in_lcrit_alarm)
 #define HWMON_I_CRIT_ALARM	BIT(hwmon_in_crit_alarm)
+#define HWMON_I_LEMERGENCY_ALARM BIT(hwmon_in_lemergency_alarm)
+#define HWMON_I_EMERGENCY_ALARM	BIT(hwmon_in_emergency_alarm)
 #define HWMON_I_RATED_MIN	BIT(hwmon_in_rated_min)
 #define HWMON_I_RATED_MAX	BIT(hwmon_in_rated_max)
 #define HWMON_I_BEEP		BIT(hwmon_in_beep)
@@ -178,6 +186,7 @@ enum hwmon_curr_attributes {
 	hwmon_curr_max,
 	hwmon_curr_lcrit,
 	hwmon_curr_crit,
+	hwmon_curr_emergency,
 	hwmon_curr_average,
 	hwmon_curr_lowest,
 	hwmon_curr_highest,
@@ -188,6 +197,7 @@ enum hwmon_curr_attributes {
 	hwmon_curr_max_alarm,
 	hwmon_curr_lcrit_alarm,
 	hwmon_curr_crit_alarm,
+	hwmon_curr_emergency_alarm,
 	hwmon_curr_rated_min,
 	hwmon_curr_rated_max,
 	hwmon_curr_beep,
@@ -199,6 +209,7 @@ enum hwmon_curr_attributes {
 #define HWMON_C_MAX		BIT(hwmon_curr_max)
 #define HWMON_C_LCRIT		BIT(hwmon_curr_lcrit)
 #define HWMON_C_CRIT		BIT(hwmon_curr_crit)
+#define HWMON_C_EMERGENCY	BIT(hwmon_curr_emergency)
 #define HWMON_C_AVERAGE		BIT(hwmon_curr_average)
 #define HWMON_C_LOWEST		BIT(hwmon_curr_lowest)
 #define HWMON_C_HIGHEST		BIT(hwmon_curr_highest)
@@ -209,6 +220,7 @@ enum hwmon_curr_attributes {
 #define HWMON_C_MAX_ALARM	BIT(hwmon_curr_max_alarm)
 #define HWMON_C_LCRIT_ALARM	BIT(hwmon_curr_lcrit_alarm)
 #define HWMON_C_CRIT_ALARM	BIT(hwmon_curr_crit_alarm)
+#define HWMON_C_EMERGENCY_ALARM	BIT(hwmon_curr_emergency_alarm)
 #define HWMON_C_RATED_MIN	BIT(hwmon_curr_rated_min)
 #define HWMON_C_RATED_MAX	BIT(hwmon_curr_rated_max)
 #define HWMON_C_BEEP		BIT(hwmon_curr_beep)
-- 
2.45.2

