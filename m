Received: from m16.mail.163.com (m16.mail.163.com [117.135.210.3])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2F3E33BC680;
	Thu,  2 Apr 2026 08:14:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=117.135.210.3
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775117699; cv=none; b=nX3yjg2vrDuLoryyZqZxsxlSkNWycZ8IY9ozwiri6oiFA2fbKrgDDRA4rsqmS49NBkIGpE7/ZLdH6c93YTntfSLJgjv+LXQPAceWaln1Bam4CzMef9rsx4//QWpTMMdXB2JguDUvG3p7EFTiNhvPKOn9zKIeb/knQKavKFq7xVU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775117699; c=relaxed/simple;
	bh=nCEllRTgwqT6TYyQ3z6bOo7HSLfLd9xP3chQac1O5Ms=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References; b=JHj2GfwJrA5qS9xRCZOLUnwAC2hwJfP5pIiNZcIhhxKS2GEd/H8cR7r6c1FCjHpeKZg3EIijKsjzHHDTfZmmu/kPaceTB3vV2TrXYLSSMxFJNjo2ZqG1Td5O6yOtvlDR3PMxnhilU0VWEFj4ekMfNkW/FQuxLMEeDWDWiWm1hLU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=163.com; spf=pass smtp.mailfrom=163.com; dkim=pass (1024-bit key) header.d=163.com header.i=@163.com header.b=O4djyvN/; arc=none smtp.client-ip=117.135.210.3
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=163.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=163.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=163.com header.i=@163.com header.b="O4djyvN/"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=163.com;
	s=s110527; h=From:To:Subject:Date:Message-Id; bh=pvGYLpM8IA+JsCH
	jNGR1R4xtXpqqfZiLFqmAEnFsfkY=; b=O4djyvN/uH7EjDT4MVsYwvLOC8WdRXF
	inb4pt1xlknbxEAIzGL+79T2cIPfhAmMTonDk3hCdeXp5DP1AoQI7wQ2tzN9088y
	B0YHLAAghh7Zt9mIZAjcwN5Yy9nKh7f/DbKoBxW/WFVDnRhEU4S1x+cS1gnoFwvU
	ArDhQLKZVyf4=
Received: from localhost.localdomain (unknown [])
	by gzsmtp5 (Coremail) with SMTP id QCgvCgCX5UBEJc5pC9uuUw--.170S7;
	Thu, 02 Apr 2026 16:14:06 +0800 (CST)
From: Wenliang Yan <wenliang202407@163.com>
To: linux@roeck-us.net,
	Jean Delvare <jdelvare@suse.com>
Cc: Wenliang Yan <wenliang202407@163.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Jonathan Corbet <corbet@lwn.net>,
	Shuah Khan <skhan@linuxfoundation.org>,
	linux-hwmon@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v7 5/8] hwmon: (ina3221) Introduce power attribute and alert characteristics
Date: Thu,  2 Apr 2026 04:13:47 -0400
Message-Id: <20260402081350.65559-6-wenliang202407@163.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20260402081350.65559-1-wenliang202407@163.com>
References: <20260402081350.65559-1-wenliang202407@163.com>
X-CM-TRANSID:QCgvCgCX5UBEJc5pC9uuUw--.170S7
X-Coremail-Antispam: 1Uf129KBjvJXoWxtryfCryfCF48WFW5WF47CFg_yoW7WrW5pa
	ykX3yfJr18Ar93Zw4xKF4UXFn8t3yxGay7Jr1I9393J3ZrAr1vqr48K3W0qas0kryfur1F
	k34xXrWrGr13GrDanT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDUYxBIdaVFxhVjvjDU0xZFpf9x0JjBuWQUUUUU=
X-CM-SenderInfo: xzhqzxhdqjjiisuqlqqrwthudrp/xtbC6BBrP2nOJVCviQAA3Y
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>

SQ52210 has built-in current and power sensors as well as multiple
alert functions. Add power attributes and different critical
characteristics in hwmon to report the corresponding data.

Signed-off-by: Wenliang Yan <wenliang202407@163.com>
---
 Documentation/hwmon/ina3221.rst | 24 ++++++++++++++
 drivers/hwmon/ina3221.c         | 57 ++++++++++++++++++++++++++++++---
 2 files changed, 77 insertions(+), 4 deletions(-)

diff --git a/Documentation/hwmon/ina3221.rst b/Documentation/hwmon/ina3221.rst
index 8c12c54d2c24..87637d7276ec 100644
--- a/Documentation/hwmon/ina3221.rst
+++ b/Documentation/hwmon/ina3221.rst
@@ -13,6 +13,13 @@ Supported chips:
 
 	       https://www.ti.com/
 
+  * Silergy SQ52210
+
+    Prefix: 'SQ52210'
+
+    Addresses: I2C 0x40 - 0x43
+
+
 Author: Andrew F. Davis <afd@ti.com>
 
 Description
@@ -23,6 +30,9 @@ side of up to three D.C. power supplies. The INA3221 monitors both shunt drop
 and supply voltage, with programmable conversion times and averaging, current
 and power are calculated host-side from these.
 
+The SQ52210 is a mostly compatible chip from Silergy. It incorporates internal
+current and power registers, and provides an extra configurable alert function.
+
 Sysfs entries
 -------------
 
@@ -72,3 +82,17 @@ update_interval         Data conversion time in millisecond, following:
                         Note that setting update_interval to 0ms sets both BC
                         and SC to 140 us (minimum conversion time).
 ======================= =======================================================
+
+Additional sysfs entries for sq52210
+-------------------------------------
+
+======================= =======================================================
+in[123]_crit            Critical high bus voltage(mV)
+in[123]_crit_alarm      Bus voltage critical high alarm
+in[123]_lcrit           Critical low bus voltage(mV)
+in[123]_lcrit_alarm     Bus voltage critical low alarm
+power[123]_input        Power(uW) for channels 1, 2, and 3 respectively
+power[123]_crit         Critical high power(uW)
+power[123]_crit_alarm   Power critical high alarm
+curr[123]_lcrit         Critical low current(mA)
+curr[123]_lcrit_alarm   Current critical low alarm
diff --git a/drivers/hwmon/ina3221.c b/drivers/hwmon/ina3221.c
index 74dd937cc568..a39f5f2c486b 100644
--- a/drivers/hwmon/ina3221.c
+++ b/drivers/hwmon/ina3221.c
@@ -645,6 +645,8 @@ static umode_t ina3221_is_visible(const void *drvdata,
 {
 	const struct ina3221_data *ina = drvdata;
 	const struct ina3221_input *input = NULL;
+	bool has_alerts_add = ina->config->has_alerts_add;
+	bool has_power_reg = ina->config->has_power_reg;
 
 	switch (type) {
 	case hwmon_chip:
@@ -672,6 +674,16 @@ static umode_t ina3221_is_visible(const void *drvdata,
 			return 0444;
 		case hwmon_in_enable:
 			return 0644;
+		case hwmon_in_crit:
+		case hwmon_in_lcrit:
+			if (has_alerts_add)
+				return 0644;
+			return 0;
+		case hwmon_in_crit_alarm:
+		case hwmon_in_lcrit_alarm:
+			if (has_alerts_add)
+				return 0444;
+			return 0;
 		default:
 			return 0;
 		}
@@ -684,6 +696,31 @@ static umode_t ina3221_is_visible(const void *drvdata,
 		case hwmon_curr_crit:
 		case hwmon_curr_max:
 			return 0644;
+		case hwmon_curr_lcrit_alarm:
+			if (has_alerts_add)
+				return 0444;
+			return 0;
+		case hwmon_curr_lcrit:
+			if (has_alerts_add)
+				return 0644;
+			return 0;
+		default:
+			return 0;
+		}
+	case hwmon_power:
+		switch (attr) {
+		case hwmon_power_input:
+			if (has_power_reg)
+				return 0444;
+			return 0;
+		case hwmon_power_crit_alarm:
+			if (has_power_reg)
+				return 0444;
+			return 0;
+		case hwmon_power_crit:
+			if (has_power_reg)
+				return 0644;
+			return 0;
 		default:
 			return 0;
 		}
@@ -694,7 +731,14 @@ static umode_t ina3221_is_visible(const void *drvdata,
 
 #define INA3221_HWMON_CURR_CONFIG (HWMON_C_INPUT | \
 				   HWMON_C_CRIT | HWMON_C_CRIT_ALARM | \
-				   HWMON_C_MAX | HWMON_C_MAX_ALARM)
+				   HWMON_C_MAX | HWMON_C_MAX_ALARM | \
+				   HWMON_C_LCRIT | HWMON_C_LCRIT_ALARM)
+#define SQ52210_HWMON_POWER_CONFIG (HWMON_P_INPUT | \
+				   HWMON_P_CRIT | HWMON_P_CRIT_ALARM)
+#define SQ52210_HWMON_BUS_CONFIG (HWMON_I_INPUT | \
+				   HWMON_I_ENABLE | HWMON_I_LABEL | \
+				   HWMON_I_LCRIT_ALARM | HWMON_I_LCRIT |\
+				   HWMON_I_CRIT_ALARM | HWMON_I_CRIT)
 
 static const struct hwmon_channel_info * const ina3221_info[] = {
 	HWMON_CHANNEL_INFO(chip,
@@ -704,9 +748,9 @@ static const struct hwmon_channel_info * const ina3221_info[] = {
 			   /* 0: dummy, skipped in is_visible */
 			   HWMON_I_INPUT,
 			   /* 1-3: input voltage Channels */
-			   HWMON_I_INPUT | HWMON_I_ENABLE | HWMON_I_LABEL,
-			   HWMON_I_INPUT | HWMON_I_ENABLE | HWMON_I_LABEL,
-			   HWMON_I_INPUT | HWMON_I_ENABLE | HWMON_I_LABEL,
+			   SQ52210_HWMON_BUS_CONFIG,
+			   SQ52210_HWMON_BUS_CONFIG,
+			   SQ52210_HWMON_BUS_CONFIG,
 			   /* 4-6: shunt voltage Channels */
 			   HWMON_I_INPUT,
 			   HWMON_I_INPUT,
@@ -720,6 +764,11 @@ static const struct hwmon_channel_info * const ina3221_info[] = {
 			   INA3221_HWMON_CURR_CONFIG,
 			   /* 4: summation of current channels */
 			   HWMON_C_INPUT | HWMON_C_CRIT | HWMON_C_CRIT_ALARM),
+	HWMON_CHANNEL_INFO(power,
+			   /* 1-3: power channels*/
+			   SQ52210_HWMON_POWER_CONFIG,
+			   SQ52210_HWMON_POWER_CONFIG,
+			   SQ52210_HWMON_POWER_CONFIG),
 	NULL
 };
 
-- 
2.17.1

