Return-Path: <SRS0=BLaD=4M=vger.kernel.org=linux-hwmon-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.8 required=3.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,
	UNPARSEABLE_RELAY,USER_AGENT_GIT autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 79D49C38BFA
	for <linux-hwmon@archiver.kernel.org>; Mon, 24 Feb 2020 22:52:07 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 519AC20838
	for <linux-hwmon@archiver.kernel.org>; Mon, 24 Feb 2020 22:52:07 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727459AbgBXWwH (ORCPT <rfc822;linux-hwmon@archiver.kernel.org>);
        Mon, 24 Feb 2020 17:52:07 -0500
Received: from mail-il-dmz.mellanox.com ([193.47.165.129]:49762 "EHLO
        mellanox.co.il" rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org
        with ESMTP id S1726651AbgBXWwG (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>);
        Mon, 24 Feb 2020 17:52:06 -0500
Received: from Internal Mail-Server by MTLPINE1 (envelope-from vadimp@mellanox.com)
        with ESMTPS (AES256-SHA encrypted); 25 Feb 2020 00:52:05 +0200
Received: from r-build-lowlevel.mtr.labs.mlnx. (r-build-lowlevel.mtr.labs.mlnx [10.209.0.190])
        by labmailer.mlnx (8.13.8/8.13.8) with ESMTP id 01OMq4sg003653;
        Tue, 25 Feb 2020 00:52:04 +0200
From:   Vadim Pasternak <vadimp@mellanox.com>
To:     linux@roeck-us.net
Cc:     linux-hwmon@vger.kernel.org, Vadim Pasternak <vadimp@mellanox.com>
Subject: [hwmon-next v3] hwmon: (pmbus/xdpe12284) Add callback for vout limits conversion
Date:   Tue, 25 Feb 2020 00:52:02 +0200
Message-Id: <20200224225202.19576-1-vadimp@mellanox.com>
X-Mailer: git-send-email 2.11.0
Sender: linux-hwmon-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-hwmon.vger.kernel.org>
X-Mailing-List: linux-hwmon@vger.kernel.org

Provide read_word_data() callback for overvoltage and undervoltage
output readouts conversion. These registers are presented in
'slinear11' format, while default conversion for 'vout' class for the
devices is 'vid'. It is resulted in wrong conversion in pmbus_reg2data()
for in{3-4}_lcrit and in{3-4}_crit attributes.
)
Fixes: aaafb7c8eb1c ("hwmon: (pmbus) Add support for Infineon Multi-phase xdpe122 family controllers")
Signed-off-by: Vadim Pasternak <vadimp@mellanox.com>
---
v1->v2:
 Comments pointed out by Guenter:
 - Drop reg2data() callback, provide conversion through
   read_word_data() callback instead.
v2->v3:
 Comments pointed out by Guenter:
 - Fix wrong conversion.
 - Add missed returns.
---
 drivers/hwmon/pmbus/xdpe12284.c | 55 +++++++++++++++++++++++++++++++++++++++++
 1 file changed, 55 insertions(+)

diff --git a/drivers/hwmon/pmbus/xdpe12284.c b/drivers/hwmon/pmbus/xdpe12284.c
index ecd9b65627ec..d5103fc9e269 100644
--- a/drivers/hwmon/pmbus/xdpe12284.c
+++ b/drivers/hwmon/pmbus/xdpe12284.c
@@ -18,6 +18,60 @@
 #define XDPE122_AMD_625MV		0x10 /* AMD mode 6.25mV */
 #define XDPE122_PAGE_NUM		2
 
+static int xdpe122_read_word_data(struct i2c_client *client, int page,
+				  int phase, int reg)
+{
+	const struct pmbus_driver_info *info = pmbus_get_driver_info(client);
+	long val;
+	s16 exponent;
+	s32 mantissa;
+	int ret;
+
+	switch (reg) {
+	case PMBUS_VOUT_OV_FAULT_LIMIT:
+	case PMBUS_VOUT_UV_FAULT_LIMIT:
+		ret = pmbus_read_word_data(client, page, phase, reg);
+		if (ret < 0)
+			return ret;
+
+		/* Convert register value to LINEAR11 data. */
+		exponent = ((s16)ret) >> 11;
+		mantissa = ((s16)((ret & GENMASK(10, 0)) << 5)) >> 5;
+		val = mantissa * 1000L;
+		if (exponent >= 0)
+			val <<= exponent;
+		else
+			val >>= -exponent;
+
+		/* Convert data to VID register. */
+		switch (info->vrm_version[page]) {
+		case vr13:
+			if (val >= 500)
+				return 1 + DIV_ROUND_CLOSEST(val - 500, 10);
+			return 0;
+		case vr12:
+			if (val >= 250)
+				return 1 + DIV_ROUND_CLOSEST(val - 250, 5);
+			return 0;
+		case imvp9:
+			if (val >= 200)
+				return 1 + DIV_ROUND_CLOSEST(val - 200, 10);
+			return 0;
+		case amd625mv:
+			if (val >= 200 && val <= 1550)
+				return DIV_ROUND_CLOSEST((1550 - val) * 100,
+							 625);
+			return 0;
+		default:
+			return -EINVAL;
+		}
+	default:
+		return -ENODATA;
+	}
+
+	return 0;
+}
+
 static int xdpe122_identify(struct i2c_client *client,
 			    struct pmbus_driver_info *info)
 {
@@ -70,6 +124,7 @@ static struct pmbus_driver_info xdpe122_info = {
 		PMBUS_HAVE_TEMP | PMBUS_HAVE_STATUS_TEMP |
 		PMBUS_HAVE_POUT | PMBUS_HAVE_PIN | PMBUS_HAVE_STATUS_INPUT,
 	.identify = xdpe122_identify,
+	.read_word_data = xdpe122_read_word_data,
 };
 
 static int xdpe122_probe(struct i2c_client *client,
-- 
2.11.0

