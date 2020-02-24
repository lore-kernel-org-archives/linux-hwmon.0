Return-Path: <SRS0=BLaD=4M=vger.kernel.org=linux-hwmon-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.8 required=3.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,
	UNPARSEABLE_RELAY,USER_AGENT_GIT autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5A951C35671
	for <linux-hwmon@archiver.kernel.org>; Mon, 24 Feb 2020 13:13:06 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 3845220828
	for <linux-hwmon@archiver.kernel.org>; Mon, 24 Feb 2020 13:13:06 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727378AbgBXNNG (ORCPT <rfc822;linux-hwmon@archiver.kernel.org>);
        Mon, 24 Feb 2020 08:13:06 -0500
Received: from mail-il-dmz.mellanox.com ([193.47.165.129]:49644 "EHLO
        mellanox.co.il" rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org
        with ESMTP id S1727299AbgBXNNF (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>);
        Mon, 24 Feb 2020 08:13:05 -0500
Received: from Internal Mail-Server by MTLPINE1 (envelope-from vadimp@mellanox.com)
        with ESMTPS (AES256-SHA encrypted); 24 Feb 2020 15:13:00 +0200
Received: from r-build-lowlevel.mtr.labs.mlnx. (r-build-lowlevel.mtr.labs.mlnx [10.209.0.190])
        by labmailer.mlnx (8.13.8/8.13.8) with ESMTP id 01ODCxTE012666;
        Mon, 24 Feb 2020 15:13:00 +0200
From:   Vadim Pasternak <vadimp@mellanox.com>
To:     linux@roeck-us.net
Cc:     linux-hwmon@vger.kernel.org, Vadim Pasternak <vadimp@mellanox.com>
Subject: [hwmon-next v1 1/2] hwmon: (pmbus/core) Add callback for register to data conversion
Date:   Mon, 24 Feb 2020 13:12:56 +0000
Message-Id: <20200224131257.28176-2-vadimp@mellanox.com>
X-Mailer: git-send-email 2.11.0
In-Reply-To: <20200224131257.28176-1-vadimp@mellanox.com>
References: <20200224131257.28176-1-vadimp@mellanox.com>
Sender: linux-hwmon-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-hwmon.vger.kernel.org>
X-Mailing-List: linux-hwmon@vger.kernel.org

Add callback reg2data() to allow device specific formatting for
particular registers.
Currently there is an assumption that 'limits' and 'history' registers
are inherited conversion format from the relevant sensor class.
But there are some devices, which for example, provides 'vout'
register reading in 'vid' format, while 'limits' or 'history'
registers for 'vout' are provided in linear format.

Signed-off-by: Vadim Pasternak <vadimp@mellanox.com>
---
 drivers/hwmon/pmbus/pmbus.h      | 1 +
 drivers/hwmon/pmbus/pmbus_core.c | 4 ++++
 2 files changed, 5 insertions(+)

diff --git a/drivers/hwmon/pmbus/pmbus.h b/drivers/hwmon/pmbus/pmbus.h
index 18e06fc6c53f..7acd75303c7f 100644
--- a/drivers/hwmon/pmbus/pmbus.h
+++ b/drivers/hwmon/pmbus/pmbus.h
@@ -427,6 +427,7 @@ struct pmbus_driver_info {
 	int (*write_word_data)(struct i2c_client *client, int page, int reg,
 			       u16 word);
 	int (*write_byte)(struct i2c_client *client, int page, u8 value);
+	int (*reg2data)(u16 reg, int data, long *val);
 	/*
 	 * The identify function determines supported PMBus functionality.
 	 * This function is only necessary if a chip driver supports multiple
diff --git a/drivers/hwmon/pmbus/pmbus_core.c b/drivers/hwmon/pmbus/pmbus_core.c
index 8d321bf7d15b..e1f88d362549 100644
--- a/drivers/hwmon/pmbus/pmbus_core.c
+++ b/drivers/hwmon/pmbus/pmbus_core.c
@@ -747,6 +747,10 @@ static long pmbus_reg2data(struct pmbus_data *data, struct pmbus_sensor *sensor)
 	if (!sensor->convert)
 		return sensor->data;
 
+	if (data->info->reg2data &&
+	    data->info->reg2data(sensor->reg, sensor->data, &val) != -ENODATA)
+		return val;
+
 	switch (data->info->format[sensor->class]) {
 	case direct:
 		val = pmbus_reg2data_direct(data, sensor);
-- 
2.11.0

