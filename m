Received: from m16.mail.163.com (m16.mail.163.com [117.135.210.2])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C5C822F745B;
	Thu, 18 Dec 2025 09:08:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=117.135.210.2
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766048884; cv=none; b=msEyYdaXMGBSga6Eo6GBEb8RfiO5ZI67bRDJdZYXqJyYGf4wbSUyjuUw/QZdMUpEwQfJyhtbAr7iuBmVy+acgIQ07fdMqj5RaIJSKzTyWuSS+lj/kZ9lYbRn2t2FZHBMkd2GRJMqFccozlT9GVRAurIah+izNcCFGcdFnXAecKw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766048884; c=relaxed/simple;
	bh=iZFAw0Zulc1kkPVmRb5SmjbByX5y3RuqBUYcV+I6NVo=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References; b=nj1UiIXKotxpQ+pYBhO6lS7qgPteH8l9eCLVkyT4DBOb+tXZlfZ87TB8w5PE+ng4nwexbe5csOlCZBd8G32v3G4Tbl78saAAicPKa6UsIeDO/fzC7146au89mAmgSzdz7MEsaViatf+p6c+/fgf38Uo1IyjyizXyfrW0KbDidkg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=163.com; spf=pass smtp.mailfrom=163.com; dkim=pass (1024-bit key) header.d=163.com header.i=@163.com header.b=MXI9ocXI; arc=none smtp.client-ip=117.135.210.2
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=163.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=163.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=163.com header.i=@163.com header.b="MXI9ocXI"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=163.com;
	s=s110527; h=From:To:Subject:Date:Message-Id; bh=qeUmYFfRsJGAPjd
	nIs83M/R9EfS1RjUUdlnMQCHpzZE=; b=MXI9ocXIO0w5ScCAaQZnS9LNAcV1DMy
	/j8utbECijQqBUIu/TBe6NAdCBQ2ZgrYV97jD7von76OBhCM379rK2pSjKWCsrAZ
	gag4KfCn2MyLq8x6EM9Ql7lmGdA7Vm88JVaMwnKRmlin6pV+3F3+vyHleMvXtTbv
	tijQi+XAb0hQ=
Received: from localhost.localdomain (unknown [])
	by gzga-smtp-mtada-g1-4 (Coremail) with SMTP id _____wBXPaw5xENpP8BcBA--.40S7;
	Thu, 18 Dec 2025 17:07:14 +0800 (CST)
From: Wenliang Yan <wenliang202407@163.com>
To: linux@roeck-us.net,
	Jean Delvare <jdelvare@suse.com>
Cc: Wenliang Yan <wenliang202407@163.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Jonathan Corbet <corbet@lwn.net>,
	linux-hwmon@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v4 5/8] hwmon: (ina3221) Introduce power attribute and alert characteristics
Date: Thu, 18 Dec 2025 04:06:56 -0500
Message-Id: <20251218090659.66991-6-wenliang202407@163.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20251218090659.66991-1-wenliang202407@163.com>
References: <20251218090659.66991-1-wenliang202407@163.com>
X-CM-TRANSID:_____wBXPaw5xENpP8BcBA--.40S7
X-Coremail-Antispam: 1Uf129KBjvJXoWxtryfCryfCF48WFW5WF47CFg_yoW7XFW5pa
	ykX3yfJr18Ar93Zw4xKF4UXFn8t3yxGay7Jr1I9395J3ZrArnYqr48K3W0qF90kryfZr1F
	k34IqrWrGr13JrUanT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDUYxBIdaVFxhVjvjDU0xZFpf9x0Jj9_-9UUUUU=
X-CM-SenderInfo: xzhqzxhdqjjiisuqlqqrwthudrp/xtbC5wRtQWlDxERnuwAA35
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
index 8c12c54d2c24..224c6cf735ed 100644
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
+in[123]_crit            Critical high bus voltage
+in[123]_crit_alarm      Bus voltage critical high alarm
+in[123]_lcrit           Critical low bus voltage
+in[123]_lcrit_alarm     Bus voltage critical low alarm
+curr[123]_lcrit         Critical low current
+curr[123]_lcrit_alarm   Current critical low alarm
+power[123]_input        Current for channels 1, 2, and 3 respectively
+power[123]_crit         Critical high power
+power[123]_crit_alarm   Power critical high alarm
diff --git a/drivers/hwmon/ina3221.c b/drivers/hwmon/ina3221.c
index c82ef2d23056..4b2888be0ae2 100644
--- a/drivers/hwmon/ina3221.c
+++ b/drivers/hwmon/ina3221.c
@@ -645,6 +645,8 @@ static umode_t ina3221_is_visible(const void *drvdata,
 {
 	const struct ina3221_data *ina = drvdata;
 	const struct ina3221_input *input = NULL;
+	bool has_alerts = ina->config->has_alerts;
+	bool has_power = ina->config->has_power;
 
 	switch (type) {
 	case hwmon_chip:
@@ -672,6 +674,16 @@ static umode_t ina3221_is_visible(const void *drvdata,
 			return 0444;
 		case hwmon_in_enable:
 			return 0644;
+		case hwmon_in_crit:
+		case hwmon_in_lcrit:
+			if (has_alerts)
+				return 0644;
+			return 0;
+		case hwmon_in_crit_alarm:
+		case hwmon_in_lcrit_alarm:
+			if (has_alerts)
+				return 0444;
+			return 0;
 		default:
 			return 0;
 		}
@@ -684,6 +696,31 @@ static umode_t ina3221_is_visible(const void *drvdata,
 		case hwmon_curr_crit:
 		case hwmon_curr_max:
 			return 0644;
+		case hwmon_curr_lcrit:
+			if (has_alerts)
+				return 0644;
+			return 0;
+		case hwmon_curr_lcrit_alarm:
+			if (has_alerts)
+				return 0444;
+			return 0;
+		default:
+			return 0;
+		}
+	case hwmon_power:
+		switch (attr) {
+		case hwmon_power_input:
+			if (has_power)
+				return 0444;
+			return 0;
+		case hwmon_power_crit_alarm:
+			if (has_alerts)
+				return 0444;
+			return 0;
+		case hwmon_power_crit:
+			if (has_alerts)
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

