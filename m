Received: from esa.microchip.iphmx.com (esa.microchip.iphmx.com [68.232.153.233])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3A6D8265620;
	Wed, 22 Apr 2026 08:45:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=68.232.153.233
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776847554; cv=none; b=SDVBHqsMgG7nXjN5SxG7OrHDeFt/MCoJCWE2rI1rCNSoIpPNhMCJ2JPxRrL+sG0GvcBAL32grUwcb/e8TpCqFd4ja0qZqFjIkgVGJclQZhLEgz0VQXplyt6j+Qg6/LOrWcXb7SA3q/sAoOp9egidOIe2L7WTidc0yr4EwWpSaOc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776847554; c=relaxed/simple;
	bh=hT2PxSrDthpX33+2ElcdjPP/NS6L8JoRqoDy7H/oTvs=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-ID:To:CC; b=cnsZO+/nkangtmkbkFDGXwvh8YirKSbMuwUGYvFRtPO9SFFdT48OkgZE6pYDxdO2hxW1c0MMYn7bH6QWuyZS6QBwTjI7tCdLb5BcJ70ai5JnqR87GhVgGgT1nEYx8yByeGoLymZ2Q/LGmHbm/VKH3Tzas+7BS3y2oCQobHm8B/g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=microchip.com; spf=pass smtp.mailfrom=microchip.com; dkim=pass (2048-bit key) header.d=microchip.com header.i=@microchip.com header.b=EBPMxnQH; arc=none smtp.client-ip=68.232.153.233
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=microchip.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=microchip.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=microchip.com header.i=@microchip.com header.b="EBPMxnQH"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
  t=1776847554; x=1808383554;
  h=from:date:subject:mime-version:content-transfer-encoding:
   message-id:to:cc;
  bh=hT2PxSrDthpX33+2ElcdjPP/NS6L8JoRqoDy7H/oTvs=;
  b=EBPMxnQHCHk+6aeRez/gnxsHWiLG8Vq2YeIgFjTMxR/TZCCfo4jyJyfi
   yWfrFza/9is2mRGoMMMdbg0EAloNVqWeVzoe4XOxDgOm/SIvi954KOypd
   OvAEC1gjJCo9lz5fTBIJym9S5zpI7/t6EjVg21VLKGm8y/xErN7oXEfaI
   dXmeVse+cHAi/zdhCnNgcxs7e/xG7z2YWHAUXSWoS6rBR8wcY1f61BZua
   oTclu9Fn+UcrePeSb+YgFXJLqy+LJ9EjFsaTOKpX2ne7LJ3Gi11IrYE2K
   aGifwe8jRNAOvvLkyI7cI80R6Ie8OYzjhO6LkfdCgy9tsgcpZ508hH/8k
   A==;
X-CSE-ConnectionGUID: K+WHbD7dS2qPVYWo0fZ6/A==
X-CSE-MsgGUID: dY604ZRlQYSMilPnmr06nA==
X-IronPort-AV: E=Sophos;i="6.23,192,1770620400"; 
   d="scan'208";a="287827731"
X-Amp-Result: SKIPPED(no attachment in message)
Received: from unknown (HELO email.microchip.com) ([170.129.1.10])
  by esa5.microchip.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 Apr 2026 01:44:52 -0700
Received: from chn-vm-ex02.mchp-main.com (10.10.87.72) by
 chn-vm-ex1.mchp-main.com (10.10.87.30) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.2.2562.35; Wed, 22 Apr 2026 01:44:50 -0700
Received: from [127.0.1.1] (10.10.85.11) by chn-vm-ex02.mchp-main.com
 (10.10.85.144) with Microsoft SMTP Server id 15.1.2507.58 via Frontend
 Transport; Wed, 22 Apr 2026 01:44:49 -0700
From: Victor Duicu <victor.duicu@microchip.com>
Date: Wed, 22 Apr 2026 11:43:31 +0300
Subject: [PATCH] hwmon: mcp9982: Add external diode fault read
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-ID: <20260422-add-external-diode-fault-read-v1-1-bb28e03a0766@microchip.com>
X-B4-Tracking: v=1; b=H4sIADKK6GkC/x3MQQqDMBAF0KvIrDuQpGKhVyldDJmvDkgsE1sE8
 e6GLt/mHVThhkrP7iDHz6qtpSHeOsqzlAls2kwppCH0KbGoMvYNXmRhtVXBo3yXjR2iLCHfs0b
 pH0Okdnwco+3///U+zwtcEz34bwAAAA==
X-Change-ID: 20260422-add-external-diode-fault-read-a0c3cd1a4761
To: Guenter Roeck <linux@roeck-us.net>
CC: <linux-hwmon@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
	<victor.duicu@microchip.com>, <marius.cristea@microchip.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1776847488; l=2619;
 i=victor.duicu@microchip.com; s=20260213; h=from:subject:message-id;
 bh=hT2PxSrDthpX33+2ElcdjPP/NS6L8JoRqoDy7H/oTvs=;
 b=OL84u1Hlx5BVRWuJAtOPlcNZ3vfxJeTWvGVWo/bZ3ae4QqGZzfgzfUcoJcJOf9RXuY9DvKRkc
 8ujCLRJ32XTCo5nT3IE/7sXyxRbMDsPSxd9wjUaUcx3hcivSaZvcpZ8
X-Developer-Key: i=victor.duicu@microchip.com; a=ed25519;
 pk=/o+aE26HN3Piv9T5t+efqb0aeJw9ErwMPeSC8lYXQsA=

This patch adds external diode fault read capability
to the MCP998X/33 and MCP998XD/33D driver.

Signed-off-by: Victor Duicu <victor.duicu@microchip.com>
---
 drivers/hwmon/mcp9982.c | 21 +++++++++++++++++----
 1 file changed, 17 insertions(+), 4 deletions(-)

diff --git a/drivers/hwmon/mcp9982.c b/drivers/hwmon/mcp9982.c
index 26c69e3388ab..2e75ade20118 100644
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
@@ -510,6 +510,18 @@ static int mcp9982_read(struct device *dev, enum hwmon_sensor_types type, u32 at
 
 			*val -= hyst * 1000;
 
+			return 0;
+		case hwmon_temp_fault:
+			/*
+			 * Because the ALERT/THERM pin is set in Therm(Comparator)
+			 * mode, the external diode fault status register
+			 * does not clear the bits after reading.
+			 */
+			*val = regmap_test_bits(priv->regmap, MCP9982_EXT_FAULT_STATUS_ADDR,
+						BIT(channel));
+			if (*val < 0)
+				return *val;
+
 			return 0;
 		default:
 			return -EINVAL;
@@ -681,6 +693,7 @@ static umode_t mcp9982_is_visible(const void *_data, enum hwmon_sensor_types typ
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

