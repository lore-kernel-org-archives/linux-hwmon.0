Received: from esa.microchip.iphmx.com (esa.microchip.iphmx.com [68.232.154.123])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EC25137756F;
	Thu, 13 Aug 2026 08:40:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=68.232.154.123
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786610424; cv=none; b=KeRyRl+Fhcml3jw1TmjApovS7CxCZdurlms1US3VBlWRD1znQApArIEzvM4GV3Ae2WkhMnv1MpbM58VqhqTxhGgVUNYO6nQRY/Ec/R+QV0BGYO5ZV/gfDn53RY8Xranj3ujnkhIetlPyHvNUUiBwGod4nnB1LZivS8dVBjArdlE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786610424; c=relaxed/simple;
	bh=rC0a//7GPxVClstR+wSiivt+Qv5VxJiJmYS/3W95+ok=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-ID:To:CC; b=RkIUGtqWQskclW96QuSM5N9v6qRSJgPvPpKv6FAatpp+NNrakmB+AdrO6aTRal0w5alQxh9sGr30BdLgGM5LuaCsOBByChDjPLm0PTFZOKTuf0YWjC0oOZRSiZatafCXZL2dZeuS+L+8SC2G/SjEfx7wTKjIHd9N50e3VVXGlxA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=microchip.com; spf=pass smtp.mailfrom=microchip.com; dkim=pass (2048-bit key) header.d=microchip.com header.i=@microchip.com header.b=PnHhw+Zl; arc=none smtp.client-ip=68.232.154.123
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=microchip.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=microchip.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=microchip.com header.i=@microchip.com header.b="PnHhw+Zl"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
  t=1786610423; x=1818146423;
  h=from:date:subject:mime-version:content-transfer-encoding:
   message-id:to:cc;
  bh=rC0a//7GPxVClstR+wSiivt+Qv5VxJiJmYS/3W95+ok=;
  b=PnHhw+ZlaluRtw28msEBbQxVPqdYVYQ28zh7Gwuh//6dOHVj2xtCks8Q
   KKNOjen4beQIK6n20DCxQOf/FQ3sAFwUs4nEK/i20M5C3wm1P2OYQoMZo
   9nSxGFIuJk3wdTy8SFTSvtkt9N7OvlhzNFYr6lr+F68QNO5HF1UJhrDTq
   BFhVfRBrwmLDHFWi8Q2tY97g00BRGYqSP1S4zv6hROblPh/S8ttvOLXTI
   6mKiz+3XkDIzpqd4TIKis3Klyu2Bp+WvDV+Le/S1TseyvFv0VRSlYBLLd
   eKPRWlxznTBTq/H2+1jGbYvtBpnWLh4RVcPqQuWsC/PsPGIyCORKdRYIa
   A==;
X-CSE-ConnectionGUID: KYrdCRndSlqFOOF+4awp0Q==
X-CSE-MsgGUID: 1WZ6NBUqSUujA41AeQEsUw==
X-IronPort-AV: E=Sophos;i="6.25,221,1779174000"; 
   d="scan'208";a="62382077"
X-Amp-Result: SKIPPED(no attachment in message)
Received: from unknown (HELO email.microchip.com) ([170.129.1.10])
  by esa2.microchip.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256; 13 Aug 2026 01:40:15 -0700
Received: from chn-vm-ex01.mchp-main.com (10.10.85.143) by
 chn-vm-ex03.mchp-main.com (10.10.85.151) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.58; Thu, 13 Aug 2026 01:40:11 -0700
Received: from marius-VM.mshome.net (10.10.85.11) by chn-vm-ex01.mchp-main.com
 (10.10.85.143) with Microsoft SMTP Server id 15.1.2507.58 via Frontend
 Transport; Thu, 13 Aug 2026 01:40:08 -0700
From: Marius Cristea <marius.cristea@microchip.com>
Date: Thu, 13 Aug 2026 11:40:07 +0300
Subject: [PATCH] hwmon: temperature: (EMC1403) fix hysteresis for low limit
 temperature
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-ID: <20260813-emc1403_remove_min_hyst-v1-1-43a0d05d9f49@microchip.com>
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/6tWKk4tykwtVrJSqFYqSi3LLM7MzwNyDHUUlJIzE
 vPSU3UzU4B8JSMDIzMDC0ND3dTcZEMTA+P4otTc/LLU+NzMvPiMyuISXePUZAtzE0vTJAMDAyW
 g7oKi1LTMCrDJ0bG1tQANk6reaQAAAA==
X-Change-ID: 20260811-emc1403_remove_min_hyst-3ec87495b000
To: Guenter Roeck <linux@roeck-us.net>, Jonathan Corbet <corbet@lwn.net>,
	Shuah Khan <skhan@linuxfoundation.org>
CC: <linux-hwmon@vger.kernel.org>, <linux-doc@vger.kernel.org>,
	<linux-kernel@vger.kernel.org>, Marius Cristea <marius.cristea@microchip.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=openpgp-sha256; l=5067;
 i=marius.cristea@microchip.com; h=from:subject:message-id;
 bh=rC0a//7GPxVClstR+wSiivt+Qv5VxJiJmYS/3W95+ok=;
 b=owGbwMvMwCW2tbSTZa7u0x2Mp9WSGLJqm17Um2byLdZe/1Q4uk0ve+PRisiTuyeZ2u/wq/Lvf
 xBm6LCio5SFQYyLQVZMkWXFWz+1qrUfLiuJZerAzGFlAhnCwMUpABPx6mdkuFd5NTSM92v0CnYn
 6XPXWi03y94U3v/2xvc1TYsVHgSevcjIsO3ll0sRxbldvzOuHW9oXqXSHxc66+z9Z6ZsYWcXzDL
 /zg0A
X-Developer-Key: i=marius.cristea@microchip.com; a=openpgp;
 fpr=E32F8D4396E72E463E8CCD91446DE0ABD9140C3E

Remove the hysteresis for low temperature limit, in hardware
the hysteresis is applied only to the maxim limit and the
critical limit temperature.

Signed-off-by: Marius Cristea <marius.cristea@microchip.com>
---
 Documentation/hwmon/emc1403.rst |  8 ++++----
 drivers/hwmon/emc1403.c         | 27 +++++++++++----------------
 2 files changed, 15 insertions(+), 20 deletions(-)

diff --git a/Documentation/hwmon/emc1403.rst b/Documentation/hwmon/emc1403.rst
index 77060d515323..ce258f0fccc6 100644
--- a/Documentation/hwmon/emc1403.rst
+++ b/Documentation/hwmon/emc1403.rst
@@ -71,10 +71,10 @@ and EMC14x8 support eight sensors (one internal, seven external).
 
 The chips implement three limits for each sensor: low (tempX_min), high
 (tempX_max) and critical (tempX_crit.) The chips also implement an
-hysteresis mechanism which applies to all limits. The relative difference
-is stored in a single register on the chip, which means that the relative
-difference between the limit and its hysteresis is always the same for
-all three limits.
+hysteresis mechanism which applies to high and critical limits. The relative
+difference is stored in a single register on the chip, which means that the
+relative difference between the limit and its hysteresis is always the same
+for high and critical limits.
 
 This implementation detail implies the following:
 
diff --git a/drivers/hwmon/emc1403.c b/drivers/hwmon/emc1403.c
index cd753b38709f..2f6dadbce68a 100644
--- a/drivers/hwmon/emc1403.c
+++ b/drivers/hwmon/emc1403.c
@@ -305,10 +305,9 @@ static int emc1403_get_hyst(struct thermal_data *data, int channel,
 	ret = regmap_read(data->regmap, 0x21, &hyst);
 	if (ret < 0)
 		return ret;
-	if (map == temp_min)
-		*val = limit + hyst * 1000;
-	else
-		*val = limit - hyst * 1000;
+
+	*val = limit - hyst * 1000;
+
 	return 0;
 }
 
@@ -324,9 +323,6 @@ static int emc1403_temp_read(struct thermal_data *data, u32 attr, int channel, l
 	case hwmon_temp_input:
 		ret = emc1403_get_temp(data, channel, ema1403_temp_map[attr], val);
 		break;
-	case hwmon_temp_min_hyst:
-		ret = emc1403_get_hyst(data, channel, temp_min, val);
-		break;
 	case hwmon_temp_max_hyst:
 		ret = emc1403_get_hyst(data, channel, temp_max, val);
 		break;
@@ -548,7 +544,6 @@ static umode_t emc1403_temp_is_visible(const void *_data, u32 attr, int channel)
 	case hwmon_temp_max_alarm:
 	case hwmon_temp_crit_alarm:
 	case hwmon_temp_fault:
-	case hwmon_temp_min_hyst:
 	case hwmon_temp_max_hyst:
 		return 0444;
 	case hwmon_temp_min:
@@ -591,35 +586,35 @@ static const struct hwmon_channel_info * const emc1403_info[] = {
 	HWMON_CHANNEL_INFO(chip, HWMON_C_UPDATE_INTERVAL),
 	HWMON_CHANNEL_INFO(temp,
 			   HWMON_T_INPUT | HWMON_T_MIN | HWMON_T_MAX |
-			   HWMON_T_CRIT | HWMON_T_MIN_HYST | HWMON_T_MAX_HYST |
+			   HWMON_T_CRIT | HWMON_T_MAX_HYST |
 			   HWMON_T_CRIT_HYST | HWMON_T_MIN_ALARM |
 			   HWMON_T_MAX_ALARM | HWMON_T_CRIT_ALARM,
 			   HWMON_T_INPUT | HWMON_T_MIN | HWMON_T_MAX |
-			   HWMON_T_CRIT | HWMON_T_MIN_HYST | HWMON_T_MAX_HYST |
+			   HWMON_T_CRIT | HWMON_T_MAX_HYST |
 			   HWMON_T_CRIT_HYST | HWMON_T_MIN_ALARM |
 			   HWMON_T_MAX_ALARM | HWMON_T_CRIT_ALARM | HWMON_T_FAULT,
 			   HWMON_T_INPUT | HWMON_T_MIN | HWMON_T_MAX |
-			   HWMON_T_CRIT | HWMON_T_MIN_HYST | HWMON_T_MAX_HYST |
+			   HWMON_T_CRIT | HWMON_T_MAX_HYST |
 			   HWMON_T_CRIT_HYST | HWMON_T_MIN_ALARM |
 			   HWMON_T_MAX_ALARM | HWMON_T_CRIT_ALARM | HWMON_T_FAULT,
 			   HWMON_T_INPUT | HWMON_T_MIN | HWMON_T_MAX |
-			   HWMON_T_CRIT | HWMON_T_MIN_HYST | HWMON_T_MAX_HYST |
+			   HWMON_T_CRIT | HWMON_T_MAX_HYST |
 			   HWMON_T_CRIT_HYST | HWMON_T_MIN_ALARM |
 			   HWMON_T_MAX_ALARM | HWMON_T_CRIT_ALARM | HWMON_T_FAULT,
 			   HWMON_T_INPUT | HWMON_T_MIN | HWMON_T_MAX |
-			   HWMON_T_CRIT | HWMON_T_MIN_HYST | HWMON_T_MAX_HYST |
+			   HWMON_T_CRIT | HWMON_T_MAX_HYST |
 			   HWMON_T_CRIT_HYST | HWMON_T_MIN_ALARM |
 			   HWMON_T_MAX_ALARM | HWMON_T_CRIT_ALARM | HWMON_T_FAULT,
 			   HWMON_T_INPUT | HWMON_T_MIN | HWMON_T_MAX |
-			   HWMON_T_CRIT | HWMON_T_MIN_HYST | HWMON_T_MAX_HYST |
+			   HWMON_T_CRIT | HWMON_T_MAX_HYST |
 			   HWMON_T_CRIT_HYST | HWMON_T_MIN_ALARM |
 			   HWMON_T_MAX_ALARM | HWMON_T_CRIT_ALARM | HWMON_T_FAULT,
 			   HWMON_T_INPUT | HWMON_T_MIN | HWMON_T_MAX |
-			   HWMON_T_CRIT | HWMON_T_MIN_HYST | HWMON_T_MAX_HYST |
+			   HWMON_T_CRIT | HWMON_T_MAX_HYST |
 			   HWMON_T_CRIT_HYST | HWMON_T_MIN_ALARM |
 			   HWMON_T_MAX_ALARM | HWMON_T_CRIT_ALARM | HWMON_T_FAULT,
 			   HWMON_T_INPUT | HWMON_T_MIN | HWMON_T_MAX |
-			   HWMON_T_CRIT | HWMON_T_MIN_HYST | HWMON_T_MAX_HYST |
+			   HWMON_T_CRIT | HWMON_T_MAX_HYST |
 			   HWMON_T_CRIT_HYST | HWMON_T_MIN_ALARM |
 			   HWMON_T_MAX_ALARM | HWMON_T_CRIT_ALARM | HWMON_T_FAULT
 			   ),

---
base-commit: db2ddb87143519e20a95aa36c60b36107b736a58
change-id: 20260811-emc1403_remove_min_hyst-3ec87495b000

Best regards,
-- 
Marius Cristea <marius.cristea@microchip.com>

