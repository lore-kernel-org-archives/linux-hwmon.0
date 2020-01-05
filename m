Return-Path: <SRS0=lfVP=22=vger.kernel.org=linux-hwmon-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.7 required=3.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,
	UNPARSEABLE_RELAY,USER_AGENT_GIT autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2DAD8C47409
	for <linux-hwmon@archiver.kernel.org>; Sun,  5 Jan 2020 10:58:44 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 0EC7A21775
	for <linux-hwmon@archiver.kernel.org>; Sun,  5 Jan 2020 10:58:44 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725930AbgAEK6m (ORCPT <rfc822;linux-hwmon@archiver.kernel.org>);
        Sun, 5 Jan 2020 05:58:42 -0500
Received: from mail-il-dmz.mellanox.com ([193.47.165.129]:45667 "EHLO
        mellanox.co.il" rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org
        with ESMTP id S1726029AbgAEK6m (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>); Sun, 5 Jan 2020 05:58:42 -0500
Received: from Internal Mail-Server by MTLPINE1 (envelope-from vadimp@mellanox.com)
        with ESMTPS (AES256-SHA encrypted); 5 Jan 2020 12:58:35 +0200
Received: from r-build-lowlevel.mtr.labs.mlnx. (r-build-lowlevel.mtr.labs.mlnx [10.209.0.190])
        by labmailer.mlnx (8.13.8/8.13.8) with ESMTP id 005AwYmN020934;
        Sun, 5 Jan 2020 12:58:35 +0200
From:   Vadim Pasternak <vadimp@mellanox.com>
To:     linux@roeck-us.net, robh+dt@kernel.org, vijaykhemka@fb.com
Cc:     linux-hwmon@vger.kernel.org, devicetree@vger.kernel.org,
        Vadim Pasternak <vadimp@mellanox.com>
Subject: [RFC PATCH hwmon-next v1 1/5] hwmon: (pmbus/core) Add support for vid mode detection per page bases
Date:   Sun,  5 Jan 2020 10:58:29 +0000
Message-Id: <20200105105833.30196-2-vadimp@mellanox.com>
X-Mailer: git-send-email 2.11.0
In-Reply-To: <20200105105833.30196-1-vadimp@mellanox.com>
References: <20200105105833.30196-1-vadimp@mellanox.com>
Sender: linux-hwmon-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-hwmon.vger.kernel.org>
X-Mailing-List: linux-hwmon@vger.kernel.org

Add support for VID protocol detection per page bases, instead of
detecting it based on "PMBU_VOUT" readout from page 0 for all the pages
supported by particular device.
The reason that some devices allows to configure different VID modes
per page within the same device.
Patch modifies the field "vrm_version" within the structure
"pmbus_driver_info" to be per page array.

Signed-off-by: Vadim Pasternak <vadimp@mellanox.com>
---
 drivers/hwmon/pmbus/max20751.c   |  2 +-
 drivers/hwmon/pmbus/pmbus.c      |  5 +++--
 drivers/hwmon/pmbus/pmbus.h      |  2 +-
 drivers/hwmon/pmbus/pmbus_core.c |  2 +-
 drivers/hwmon/pmbus/pxe1610.c    | 44 ++++++++++++++++++++++------------------
 drivers/hwmon/pmbus/tps53679.c   | 44 +++++++++++++++++++++-------------------
 6 files changed, 53 insertions(+), 46 deletions(-)

diff --git a/drivers/hwmon/pmbus/max20751.c b/drivers/hwmon/pmbus/max20751.c
index ee5f0cdbde06..da3c38cb9a5c 100644
--- a/drivers/hwmon/pmbus/max20751.c
+++ b/drivers/hwmon/pmbus/max20751.c
@@ -16,7 +16,7 @@ static struct pmbus_driver_info max20751_info = {
 	.pages = 1,
 	.format[PSC_VOLTAGE_IN] = linear,
 	.format[PSC_VOLTAGE_OUT] = vid,
-	.vrm_version = vr12,
+	.vrm_version[0] = vr12,
 	.format[PSC_TEMPERATURE] = linear,
 	.format[PSC_CURRENT_OUT] = linear,
 	.format[PSC_POWER] = linear,
diff --git a/drivers/hwmon/pmbus/pmbus.c b/drivers/hwmon/pmbus/pmbus.c
index c0bc43d01018..9109f305ebbb 100644
--- a/drivers/hwmon/pmbus/pmbus.c
+++ b/drivers/hwmon/pmbus/pmbus.c
@@ -115,7 +115,7 @@ static int pmbus_identify(struct i2c_client *client,
 	}
 
 	if (pmbus_check_byte_register(client, 0, PMBUS_VOUT_MODE)) {
-		int vout_mode;
+		int vout_mode, i;
 
 		vout_mode = pmbus_read_byte_data(client, 0, PMBUS_VOUT_MODE);
 		if (vout_mode >= 0 && vout_mode != 0xff) {
@@ -124,7 +124,8 @@ static int pmbus_identify(struct i2c_client *client,
 				break;
 			case 1:
 				info->format[PSC_VOLTAGE_OUT] = vid;
-				info->vrm_version = vr11;
+				for (i = 0; i < info->pages; i++)
+					info->vrm_version[i] = vr11;
 				break;
 			case 2:
 				info->format[PSC_VOLTAGE_OUT] = direct;
diff --git a/drivers/hwmon/pmbus/pmbus.h b/drivers/hwmon/pmbus/pmbus.h
index d198af3a92b6..2bdebd0ea9c1 100644
--- a/drivers/hwmon/pmbus/pmbus.h
+++ b/drivers/hwmon/pmbus/pmbus.h
@@ -382,7 +382,7 @@ enum vrm_version { vr11 = 0, vr12, vr13 };
 struct pmbus_driver_info {
 	int pages;		/* Total number of pages */
 	enum pmbus_data_format format[PSC_NUM_CLASSES];
-	enum vrm_version vrm_version;
+	enum vrm_version vrm_version[PMBUS_PAGES]; /* vrm version per page */
 	/*
 	 * Support one set of coefficients for each sensor type
 	 * Used for chips providing data in direct mode.
diff --git a/drivers/hwmon/pmbus/pmbus_core.c b/drivers/hwmon/pmbus/pmbus_core.c
index 8470097907bc..98226e84b351 100644
--- a/drivers/hwmon/pmbus/pmbus_core.c
+++ b/drivers/hwmon/pmbus/pmbus_core.c
@@ -696,7 +696,7 @@ static long pmbus_reg2data_vid(struct pmbus_data *data,
 	long val = sensor->data;
 	long rv = 0;
 
-	switch (data->info->vrm_version) {
+	switch (data->info->vrm_version[sensor->page]) {
 	case vr11:
 		if (val >= 0x02 && val <= 0xb2)
 			rv = DIV_ROUND_CLOSEST(160000 - (val - 2) * 625, 100);
diff --git a/drivers/hwmon/pmbus/pxe1610.c b/drivers/hwmon/pmbus/pxe1610.c
index ebe3f023f840..517584cff3de 100644
--- a/drivers/hwmon/pmbus/pxe1610.c
+++ b/drivers/hwmon/pmbus/pxe1610.c
@@ -19,26 +19,30 @@
 static int pxe1610_identify(struct i2c_client *client,
 			     struct pmbus_driver_info *info)
 {
-	if (pmbus_check_byte_register(client, 0, PMBUS_VOUT_MODE)) {
-		u8 vout_mode;
-		int ret;
-
-		/* Read the register with VOUT scaling value.*/
-		ret = pmbus_read_byte_data(client, 0, PMBUS_VOUT_MODE);
-		if (ret < 0)
-			return ret;
-
-		vout_mode = ret & GENMASK(4, 0);
-
-		switch (vout_mode) {
-		case 1:
-			info->vrm_version = vr12;
-			break;
-		case 2:
-			info->vrm_version = vr13;
-			break;
-		default:
-			return -ENODEV;
+	int i;
+
+	for (i = 0; i < PXE1610_NUM_PAGES; i++) {
+		if (pmbus_check_byte_register(client, i, PMBUS_VOUT_MODE)) {
+			u8 vout_mode;
+			int ret;
+
+			/* Read the register with VOUT scaling value.*/
+			ret = pmbus_read_byte_data(client, i, PMBUS_VOUT_MODE);
+			if (ret < 0)
+				return ret;
+
+			vout_mode = ret & GENMASK(4, 0);
+
+			switch (vout_mode) {
+			case 1:
+				info->vrm_version[i] = vr12;
+				break;
+			case 2:
+				info->vrm_version[i] = vr13;
+				break;
+			default:
+				return -ENODEV;
+			}
 		}
 	}
 
diff --git a/drivers/hwmon/pmbus/tps53679.c b/drivers/hwmon/pmbus/tps53679.c
index 86bb3aca09ed..163e8c6aaa8e 100644
--- a/drivers/hwmon/pmbus/tps53679.c
+++ b/drivers/hwmon/pmbus/tps53679.c
@@ -24,27 +24,29 @@ static int tps53679_identify(struct i2c_client *client,
 			     struct pmbus_driver_info *info)
 {
 	u8 vout_params;
-	int ret;
-
-	/* Read the register with VOUT scaling value.*/
-	ret = pmbus_read_byte_data(client, 0, PMBUS_VOUT_MODE);
-	if (ret < 0)
-		return ret;
-
-	vout_params = ret & GENMASK(4, 0);
-
-	switch (vout_params) {
-	case TPS53679_PROT_VR13_10MV:
-	case TPS53679_PROT_VR12_5_10MV:
-		info->vrm_version = vr13;
-		break;
-	case TPS53679_PROT_VR13_5MV:
-	case TPS53679_PROT_VR12_5MV:
-	case TPS53679_PROT_IMVP8_5MV:
-		info->vrm_version = vr12;
-		break;
-	default:
-		return -EINVAL;
+	int i, ret;
+
+	for (i = 0; i < TPS53679_PAGE_NUM; i++) {
+		/* Read the register with VOUT scaling value.*/
+		ret = pmbus_read_byte_data(client, i, PMBUS_VOUT_MODE);
+		if (ret < 0)
+			return ret;
+
+		vout_params = ret & GENMASK(4, 0);
+
+		switch (vout_params) {
+		case TPS53679_PROT_VR13_10MV:
+		case TPS53679_PROT_VR12_5_10MV:
+			info->vrm_version[i] = vr13;
+			break;
+		case TPS53679_PROT_VR13_5MV:
+		case TPS53679_PROT_VR12_5MV:
+		case TPS53679_PROT_IMVP8_5MV:
+			info->vrm_version[i] = vr12;
+			break;
+		default:
+			return -EINVAL;
+		}
 	}
 
 	return 0;
-- 
2.11.0

