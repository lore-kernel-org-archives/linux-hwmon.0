Return-Path: <SRS0=BLaD=4M=vger.kernel.org=linux-hwmon-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.8 required=3.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,
	UNPARSEABLE_RELAY,USER_AGENT_GIT autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 79CCFC11D2F
	for <linux-hwmon@archiver.kernel.org>; Mon, 24 Feb 2020 13:13:06 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 5936D20838
	for <linux-hwmon@archiver.kernel.org>; Mon, 24 Feb 2020 13:13:06 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727299AbgBXNNG (ORCPT <rfc822;linux-hwmon@archiver.kernel.org>);
        Mon, 24 Feb 2020 08:13:06 -0500
Received: from mail-il-dmz.mellanox.com ([193.47.165.129]:49645 "EHLO
        mellanox.co.il" rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org
        with ESMTP id S1727348AbgBXNNF (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>);
        Mon, 24 Feb 2020 08:13:05 -0500
Received: from Internal Mail-Server by MTLPINE1 (envelope-from vadimp@mellanox.com)
        with ESMTPS (AES256-SHA encrypted); 24 Feb 2020 15:13:01 +0200
Received: from r-build-lowlevel.mtr.labs.mlnx. (r-build-lowlevel.mtr.labs.mlnx [10.209.0.190])
        by labmailer.mlnx (8.13.8/8.13.8) with ESMTP id 01ODCxTF012666;
        Mon, 24 Feb 2020 15:13:01 +0200
From:   Vadim Pasternak <vadimp@mellanox.com>
To:     linux@roeck-us.net
Cc:     linux-hwmon@vger.kernel.org, Vadim Pasternak <vadimp@mellanox.com>
Subject: [hwmon-next v1 2/2] hwmon: (pmbus/xdpe12284) Add custom format for vout limits conversion
Date:   Mon, 24 Feb 2020 13:12:57 +0000
Message-Id: <20200224131257.28176-3-vadimp@mellanox.com>
X-Mailer: git-send-email 2.11.0
In-Reply-To: <20200224131257.28176-1-vadimp@mellanox.com>
References: <20200224131257.28176-1-vadimp@mellanox.com>
Sender: linux-hwmon-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-hwmon.vger.kernel.org>
X-Mailing-List: linux-hwmon@vger.kernel.org

Provide callback for overvoltage and undervoltage output readouts
conversion. These registers are presented in 'slinear11' format, while
default conversion for 'vout' class for the devices is 'vid'. It is
resulted in wrong conversion in pmbus_reg2data() for in{3-4}_lcrit and
in{3-4}_crit attributes.

Signed-off-by: Vadim Pasternak <vadimp@mellanox.com>
---
 drivers/hwmon/pmbus/xdpe12284.c | 23 +++++++++++++++++++++++
 1 file changed, 23 insertions(+)

diff --git a/drivers/hwmon/pmbus/xdpe12284.c b/drivers/hwmon/pmbus/xdpe12284.c
index ecd9b65627ec..751c8e18c881 100644
--- a/drivers/hwmon/pmbus/xdpe12284.c
+++ b/drivers/hwmon/pmbus/xdpe12284.c
@@ -18,6 +18,28 @@
 #define XDPE122_AMD_625MV		0x10 /* AMD mode 6.25mV */
 #define XDPE122_PAGE_NUM		2
 
+static int xdpe122_reg2data(u16 reg, int data, long *val)
+{
+	s16 exponent;
+	s32 mantissa;
+
+	switch (reg) {
+	case PMBUS_VOUT_OV_FAULT_LIMIT:
+	case PMBUS_VOUT_UV_FAULT_LIMIT:
+		/* Convert to LINEAR11. */
+		exponent = ((s16)data) >> 11;
+		mantissa = ((s16)((data & GENMASK(10, 0)) << 5)) >> 5;
+		*val = mantissa * 1000L;
+		if (exponent >= 0)
+			*val <<= exponent;
+		else
+			*val >>= -exponent;
+		return 0;
+	default:
+		return -ENODATA;
+	}
+}
+
 static int xdpe122_identify(struct i2c_client *client,
 			    struct pmbus_driver_info *info)
 {
@@ -70,6 +92,7 @@ static struct pmbus_driver_info xdpe122_info = {
 		PMBUS_HAVE_TEMP | PMBUS_HAVE_STATUS_TEMP |
 		PMBUS_HAVE_POUT | PMBUS_HAVE_PIN | PMBUS_HAVE_STATUS_INPUT,
 	.identify = xdpe122_identify,
+	.reg2data = xdpe122_reg2data,
 };
 
 static int xdpe122_probe(struct i2c_client *client,
-- 
2.11.0

