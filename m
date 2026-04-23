Received: from esa.microchip.iphmx.com (esa.microchip.iphmx.com [68.232.153.233])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5B6C73E5EEB;
	Thu, 23 Apr 2026 10:58:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=68.232.153.233
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776941908; cv=none; b=Mj3wh2EdQRYN3xlmKJV0oAs+X3E+vZIZPGu1f/2QAg7R6f2hbX0WpsbutFDFMhZeuSeXXosEQoHUT3ReA/AW8tEP1z950LQvWY/hDI1WyUigKiJZry13FaWIVqoOpuS+bZ2FThtPRDk+hiDb27ovffozqhlgoFEte7tpbZYEIQA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776941908; c=relaxed/simple;
	bh=36K7a3wkce0eoQlbcW0Ck5IWmKoAUbyEx1zCi7OzKVM=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-ID:To:CC; b=Vxy9acSQGkOdrG2fIAbSQ85Aw9oPfj6+vPL/j2wTA4hFIZJJVOTnn1UY0+tKdWtfaEWgnhJeOBGyzQtrHAE+qy7OpMOlFVB/7uYcN/pd9FNqRiJ4ylk/WKmC8o7lnxCmQlLmcshp4Ehk8UsTqQik+S4Ktb+NTr9C7My+yGbUjQo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=microchip.com; spf=pass smtp.mailfrom=microchip.com; dkim=pass (2048-bit key) header.d=microchip.com header.i=@microchip.com header.b=BEVyOGqx; arc=none smtp.client-ip=68.232.153.233
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=microchip.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=microchip.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=microchip.com header.i=@microchip.com header.b="BEVyOGqx"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
  t=1776941907; x=1808477907;
  h=from:date:subject:mime-version:content-transfer-encoding:
   message-id:to:cc;
  bh=36K7a3wkce0eoQlbcW0Ck5IWmKoAUbyEx1zCi7OzKVM=;
  b=BEVyOGqx06msmEsm644u7yyq7K8AWrUkKV6VJBL//Smg1DkMmMu2PoEV
   fFGvxImOiZ4LUQK5Kvseu/QKKPM25tPMiXiczl67YWQy0XRGlFWkauMRI
   VToVhnPfkapNCeQ5XmgUsiEFueku1VV+y51yw6xBRic7Tdya3Wv4cob8M
   TKlk3HpVacCBy3YMLJghxwwU+yNFcnJqFORfSoWnWTGKF/o2RnJdg5hwq
   WMuGhhRL+jSya9YDX3zPIbF6RphBtqa1GkhtNU7A7rhAM7CnZGGPR45qf
   lFmQxQISYAVqJp9j+GFRA/jrdB4LDS2NVopFpn/gdwYjS2DHBBTh13S7w
   g==;
X-CSE-ConnectionGUID: XbXI3Ur7QxWSjr/fW7uZ6g==
X-CSE-MsgGUID: kIhMMZVKSo+QvprDmTJg1Q==
X-IronPort-AV: E=Sophos;i="6.23,194,1770620400"; 
   d="scan'208";a="64571342"
X-Amp-Result: SKIPPED(no attachment in message)
Received: from unknown (HELO email.microchip.com) ([170.129.1.10])
  by esa1.microchip.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256; 23 Apr 2026 03:58:21 -0700
Received: from chn-vm-ex02.mchp-main.com (10.10.85.144) by
 chn-vm-ex03.mchp-main.com (10.10.85.151) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.58; Thu, 23 Apr 2026 03:58:20 -0700
Received: from [127.0.1.1] (10.10.85.11) by chn-vm-ex02.mchp-main.com
 (10.10.85.144) with Microsoft SMTP Server id 15.1.2507.58 via Frontend
 Transport; Thu, 23 Apr 2026 03:58:19 -0700
From: Victor Duicu <victor.duicu@microchip.com>
Date: Thu, 23 Apr 2026 13:56:40 +0300
Subject: [PATCH v2] hwmon: mcp9982: Add external diode fault read
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-ID: <20260423-add-external-diode-fault-read-v2-1-4004bb5f7d55@microchip.com>
X-B4-Tracking: v=1; b=H4sIAOf66WkC/43NQQ6CMBCF4auQrh3TFlKMK+9hWAztIJMAJVMkG
 MLdrZzA5fcW/9tVImFK6l7sSmjlxHHKsJdC+R6nFwGHbGW1dbqyFjAEoG0hmXCAwDEQdPgeFhD
 CAKh96YPBqnZG5cYs1PF29p9Nds9pifI571bzW/8trwYMtK29kS5R1849RvYSfc/z1cdRNcdxf
 AHqcMl0zgAAAA==
X-Change-ID: 20260422-add-external-diode-fault-read-a0c3cd1a4761
To: Guenter Roeck <linux@roeck-us.net>
CC: <linux-hwmon@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
	<victor.duicu@microchip.com>, <marius.cristea@microchip.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1776941900; l=4037;
 i=victor.duicu@microchip.com; s=20260213; h=from:subject:message-id;
 bh=36K7a3wkce0eoQlbcW0Ck5IWmKoAUbyEx1zCi7OzKVM=;
 b=UAKb+phSYqnOVHiQjjoLYU46kB/ZNVEs9+YxDWoXk0zlYyVIxLhFJ7jL6JTgC5LGkSYBoKWjR
 zW3KfI1yaY5DcwxnytprGq+yA3rW6swwQH1D3+Prde5l5tGuGRQC+HT
X-Developer-Key: i=victor.duicu@microchip.com; a=ed25519;
 pk=/o+aE26HN3Piv9T5t+efqb0aeJw9ErwMPeSC8lYXQsA=

Add external diode fault read capability to the
MCP998X/33 and MCP998XD/33D driver.

Signed-off-by: Victor Duicu <victor.duicu@microchip.com>
---
Differences related to previous patch:
v2:
- in Standby state initiate a conversion cycle before
  reading fault information.
- edit comments to reflect the addition of fault read and to
  clarify that the external diode fault status, high limit status
  and low limit status registers have similar behavior.
- link to v1: https://lore.kernel.org/r/20260422-add-external-diode-fault-read-v1-1-bb28e03a0766@microchip.com

v1:
- initial version.
---
 drivers/hwmon/mcp9982.c | 25 ++++++++++++++++++++-----
 1 file changed, 20 insertions(+), 5 deletions(-)

diff --git a/drivers/hwmon/mcp9982.c b/drivers/hwmon/mcp9982.c
index 26c69e3388ab..9e19e2697e25 100644
--- a/drivers/hwmon/mcp9982.c
+++ b/drivers/hwmon/mcp9982.c
@@ -92,19 +92,19 @@ static const struct hwmon_channel_info * const mcp9985_info[] = {
 			   HWMON_T_INPUT | HWMON_T_LABEL | HWMON_T_MIN |
 			   HWMON_T_MIN_ALARM | HWMON_T_MAX | HWMON_T_MAX_ALARM |
 			   HWMON_T_MAX_HYST | HWMON_T_CRIT | HWMON_T_CRIT_ALARM |
-			   HWMON_T_CRIT_HYST,
+			   HWMON_T_CRIT_HYST | HWMON_T_FAULT,
 			   HWMON_T_INPUT | HWMON_T_LABEL | HWMON_T_MIN |
 			   HWMON_T_MIN_ALARM | HWMON_T_MAX | HWMON_T_MAX_ALARM |
 			   HWMON_T_MAX_HYST | HWMON_T_CRIT | HWMON_T_CRIT_ALARM |
-			   HWMON_T_CRIT_HYST,
+			   HWMON_T_CRIT_HYST | HWMON_T_FAULT,
 			   HWMON_T_INPUT | HWMON_T_LABEL | HWMON_T_MIN |
 			   HWMON_T_MIN_ALARM | HWMON_T_MAX | HWMON_T_MAX_ALARM |
 			   HWMON_T_MAX_HYST | HWMON_T_CRIT | HWMON_T_CRIT_ALARM |
-			   HWMON_T_CRIT_HYST,
+			   HWMON_T_CRIT_HYST | HWMON_T_FAULT,
 			   HWMON_T_INPUT | HWMON_T_LABEL | HWMON_T_MIN |
 			   HWMON_T_MIN_ALARM | HWMON_T_MAX | HWMON_T_MAX_ALARM |
 			   HWMON_T_MAX_HYST | HWMON_T_CRIT | HWMON_T_CRIT_ALARM |
-			   HWMON_T_CRIT_HYST),
+			   HWMON_T_CRIT_HYST | HWMON_T_FAULT),
 	HWMON_CHANNEL_INFO(chip,
 			   HWMON_C_UPDATE_INTERVAL),
 	NULL
@@ -369,7 +369,8 @@ static int mcp9982_read(struct device *dev, enum hwmon_sensor_types type, u32 at
 
 	/*
 	 * In Standby State the conversion cycle must be initated manually in
-	 * order to read fresh temperature values and the status of the alarms.
+	 * order to read fresh temperature values, the status of the alarms and
+	 * fault information.
 	 */
 	if (!priv->run_state) {
 		switch (type) {
@@ -379,6 +380,7 @@ static int mcp9982_read(struct device *dev, enum hwmon_sensor_types type, u32 at
 			case hwmon_temp_max_alarm:
 			case hwmon_temp_min_alarm:
 			case hwmon_temp_crit_alarm:
+			case hwmon_temp_fault:
 				ret = regmap_write(priv->regmap, MCP9982_ONE_SHOT_ADDR, 1);
 				if (ret)
 					return ret;
@@ -402,6 +404,11 @@ static int mcp9982_read(struct device *dev, enum hwmon_sensor_types type, u32 at
 	}
 
 	switch (type) {
+	/*
+	 * Because the ALERT/THERM pin is set in Therm(Comparator) mode,
+	 * the external diode fault status, high limit status and low
+	 * limit status registers do not clear the bits after reading.
+	 */
 	case hwmon_temp:
 		switch (attr) {
 		case hwmon_temp_input:
@@ -510,6 +517,13 @@ static int mcp9982_read(struct device *dev, enum hwmon_sensor_types type, u32 at
 
 			*val -= hyst * 1000;
 
+			return 0;
+		case hwmon_temp_fault:
+			*val = regmap_test_bits(priv->regmap, MCP9982_EXT_FAULT_STATUS_ADDR,
+						BIT(channel));
+			if (*val < 0)
+				return *val;
+
 			return 0;
 		default:
 			return -EINVAL;
@@ -681,6 +695,7 @@ static umode_t mcp9982_is_visible(const void *_data, enum hwmon_sensor_types typ
 		case hwmon_temp_max_alarm:
 		case hwmon_temp_max_hyst:
 		case hwmon_temp_crit_alarm:
+		case hwmon_temp_fault:
 			return 0444;
 		case hwmon_temp_min:
 		case hwmon_temp_max:

---
base-commit: fb447217c59a13b2fff22d94de2498c185cd9032
change-id: 20260422-add-external-diode-fault-read-a0c3cd1a4761

Best regards,
-- 
Victor Duicu <victor.duicu@microchip.com>

