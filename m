Return-Path: <linux-hwmon-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DA03BC6FA99
	for <linux-hwmon@archiver.kernel.org>; Sun, 12 Mar 2023 16:03:40 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229738AbjCLQDj (ORCPT <rfc822;linux-hwmon@archiver.kernel.org>);
        Sun, 12 Mar 2023 12:03:39 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53764 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229552AbjCLQDi (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>);
        Sun, 12 Mar 2023 12:03:38 -0400
Received: from www381.your-server.de (www381.your-server.de [78.46.137.84])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 1B74223A5A
        for <linux-hwmon@vger.kernel.org>; Sun, 12 Mar 2023 09:03:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=metafoo.de;
        s=default2002; h=Content-Transfer-Encoding:MIME-Version:Message-Id:Date:
        Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
        Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
        :Resent-Message-ID:In-Reply-To:References;
        bh=6nqeLRJOZuJTNr2l3hjsujbhzhC8YFtOPgz9TdRbxyg=; b=H9yrTTNRaC/w5VH/1GgFc50tQL
        nTldXfDCdzqlC7H6z6KhV9YTKXX1LeCLVGukzl5rUrk6v692cxiKW9o8wp0U5tjV79w92UiU/aKM1
        LZwKQdv6Am+NduHy3US4ChMjq0b+e3GbBYWHzmbaAga2DqWVmDulyL9pF0Us/lksuLL1Woreszqn9
        U9iDE4W3sG2mdR7+hwvgdXa+12pr2SQLxfNTdpBiwfVJ1U0SGfDAMM3uvlaOtmtg/GiOcRHrCirux
        x7xd8a+16EunrGuwqECGXmKlFWBv0lwfVkHQoFEyjKLK3vdKvSOOLM6JkWYQqsuO3cDHYCrOjpotb
        SRdgJbpg==;
Received: from sslproxy05.your-server.de ([78.46.172.2])
        by www381.your-server.de with esmtpsa  (TLS1.3) tls TLS_AES_256_GCM_SHA384
        (Exim 4.94.2)
        (envelope-from <lars@metafoo.de>)
        id 1pbOAY-0009lh-Hh; Sun, 12 Mar 2023 17:03:34 +0100
Received: from [2604:5500:c0e5:eb00:da5e:d3ff:feff:933b] (helo=lars-desktop.lan)
        by sslproxy05.your-server.de with esmtpsa (TLSv1.3:TLS_AES_256_GCM_SHA384:256)
        (Exim 4.92)
        (envelope-from <lars@metafoo.de>)
        id 1pbOAY-000AbK-2h; Sun, 12 Mar 2023 17:03:34 +0100
From:   Lars-Peter Clausen <lars@metafoo.de>
To:     Guenter Roeck <linux@roeck-us.net>,
        Jean Delvare <jdelvare@suse.com>
Cc:     linux-hwmon@vger.kernel.org, Lars-Peter Clausen <lars@metafoo.de>
Subject: [PATCH] hwmon: (ucd90320) Add minimum delay between bus accesses
Date:   Sun, 12 Mar 2023 09:03:12 -0700
Message-Id: <20230312160312.2227405-1-lars@metafoo.de>
X-Mailer: git-send-email 2.30.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Authenticated-Sender: lars@metafoo.de
X-Virus-Scanned: Clear (ClamAV 0.103.8/26839/Sun Mar 12 09:22:48 2023)
Precedence: bulk
List-ID: <linux-hwmon.vger.kernel.org>
X-Mailing-List: linux-hwmon@vger.kernel.org

When probing the ucd90320 access to some of the registers randomly fails.
Sometimes it NACKs a transfer, sometimes it returns just random data and
the PEC check fails.

Experimentation shows that this seems to be triggered by a register access
directly back to back with a previous register write. Experimentation also
shows that inserting a small delay after register writes makes the issue go
away.

Use a similar solution to what the max15301 driver does to solve the same
problem. Create a custom set of bus read and write functions that make sure
that the delay is added.

Signed-off-by: Lars-Peter Clausen <lars@metafoo.de>
---
 drivers/hwmon/pmbus/ucd9000.c | 75 +++++++++++++++++++++++++++++++++++
 1 file changed, 75 insertions(+)

diff --git a/drivers/hwmon/pmbus/ucd9000.c b/drivers/hwmon/pmbus/ucd9000.c
index 75fc770c9e40..3daaf2237832 100644
--- a/drivers/hwmon/pmbus/ucd9000.c
+++ b/drivers/hwmon/pmbus/ucd9000.c
@@ -7,6 +7,7 @@
  */
 
 #include <linux/debugfs.h>
+#include <linux/delay.h>
 #include <linux/kernel.h>
 #include <linux/module.h>
 #include <linux/of_device.h>
@@ -16,6 +17,7 @@
 #include <linux/i2c.h>
 #include <linux/pmbus.h>
 #include <linux/gpio/driver.h>
+#include <linux/timekeeping.h>
 #include "pmbus.h"
 
 enum chips { ucd9000, ucd90120, ucd90124, ucd90160, ucd90320, ucd9090,
@@ -65,6 +67,7 @@ struct ucd9000_data {
 	struct gpio_chip gpio;
 #endif
 	struct dentry *debugfs;
+	ktime_t write_time;
 };
 #define to_ucd9000_data(_info) container_of(_info, struct ucd9000_data, info)
 
@@ -73,6 +76,73 @@ struct ucd9000_debugfs_entry {
 	u8 index;
 };
 
+/*
+ * It has been observed that the UCD90320 randomly fails register access when
+ * doing another access right on the back of a register write. To mitigate this
+ * make sure that there is a minimum delay between a write access and the
+ * following access. The 250us is based on experimental data. At a delay of
+ * 200us the issue seems to go away. Add a bit of extra margin to allow for
+ * system to system differences.
+ */
+#define UCD90320_WAIT_DELAY_US 250
+
+static inline void ucd90320_wait(const struct ucd9000_data *data)
+{
+	s64 delta = ktime_us_delta(ktime_get(), data->write_time);
+
+	if (delta < UCD90320_WAIT_DELAY_US)
+		udelay(UCD90320_WAIT_DELAY_US - delta);
+}
+
+static int ucd90320_read_word_data(struct i2c_client *client, int page,
+				   int phase, int reg)
+{
+	const struct pmbus_driver_info *info = pmbus_get_driver_info(client);
+	struct ucd9000_data *data = to_ucd9000_data(info);
+
+	if (reg >= PMBUS_VIRT_BASE)
+		return -ENXIO;
+
+	ucd90320_wait(data);
+	return pmbus_read_word_data(client, page, phase, reg);
+}
+
+static int ucd90320_read_byte_data(struct i2c_client *client, int page, int reg)
+{
+	const struct pmbus_driver_info *info = pmbus_get_driver_info(client);
+	struct ucd9000_data *data = to_ucd9000_data(info);
+
+	ucd90320_wait(data);
+	return pmbus_read_byte_data(client, page, reg);
+}
+
+static int ucd90320_write_word_data(struct i2c_client *client, int page,
+				    int reg, u16 word)
+{
+	const struct pmbus_driver_info *info = pmbus_get_driver_info(client);
+	struct ucd9000_data *data = to_ucd9000_data(info);
+	int ret;
+
+	ucd90320_wait(data);
+	ret = pmbus_write_word_data(client, page, reg, word);
+	data->write_time = ktime_get();
+
+	return ret;
+}
+
+static int ucd90320_write_byte(struct i2c_client *client, int page, u8 value)
+{
+	const struct pmbus_driver_info *info = pmbus_get_driver_info(client);
+	struct ucd9000_data *data = to_ucd9000_data(info);
+	int ret;
+
+	ucd90320_wait(data);
+	ret = pmbus_write_byte(client, page, value);
+	data->write_time = ktime_get();
+
+	return ret;
+}
+
 static int ucd9000_get_fan_config(struct i2c_client *client, int fan)
 {
 	int fan_config = 0;
@@ -598,6 +668,11 @@ static int ucd9000_probe(struct i2c_client *client)
 		info->read_byte_data = ucd9000_read_byte_data;
 		info->func[0] |= PMBUS_HAVE_FAN12 | PMBUS_HAVE_STATUS_FAN12
 		  | PMBUS_HAVE_FAN34 | PMBUS_HAVE_STATUS_FAN34;
+	} else if (mid->driver_data == ucd90320) {
+		info->read_byte_data = ucd90320_read_byte_data;
+		info->read_word_data = ucd90320_read_word_data;
+		info->write_byte = ucd90320_write_byte;
+		info->write_word_data = ucd90320_write_word_data;
 	}
 
 	ucd9000_probe_gpio(client, mid, data);
-- 
2.30.2

