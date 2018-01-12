Return-Path: <linux-hwmon-owner@vger.kernel.org>
Received: from mail-wm0-f68.google.com ([74.125.82.68]:37879 "EHLO
        mail-wm0-f68.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S964998AbeALTGF (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>);
        Fri, 12 Jan 2018 14:06:05 -0500
Received: by mail-wm0-f68.google.com with SMTP id f140so13705278wmd.2
        for <linux-hwmon@vger.kernel.org>; Fri, 12 Jan 2018 11:06:04 -0800 (PST)
Date: Fri, 12 Jan 2018 20:06:00 +0100
From: Emiliano Ingrassia <ingrassia@epigenesys.com>
To: Jean Delvare <jdelvare@suse.com>,
        Guenter Roeck <linux@roeck-us.net>
Cc: linux-hwmon@vger.kernel.org
Subject: [PATCH v2] hwmon: sht3x: wait predefined limits loading complete
 before access
Message-ID: <20180112190600.GA21207@ingrassia.epigenesys.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Sender: linux-hwmon-owner@vger.kernel.org
List-Id: linux-hwmon@vger.kernel.org

An sht3x sensor include limits register which contains temperature
and humidity limit values. After a reset, pre-defined values are loaded
into that register. During the probe function, the driver reads the
limits register. However, if the reads are made too early, for example
because the I2C bus frequency is high (e.g. 400 kHz), the loading could be
not completed and the sensor returns a NACK which causes the probe to fail.
A delay of at least 500 us before the first read solves this issue.

Signed-off-by: Emiliano Ingrassia <ingrassia@epigenesys.com>
---
 drivers/hwmon/sht3x.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/drivers/hwmon/sht3x.c b/drivers/hwmon/sht3x.c
index 6ea99cd6ae79..f2098443df2f 100644
--- a/drivers/hwmon/sht3x.c
+++ b/drivers/hwmon/sht3x.c
@@ -732,6 +732,9 @@ static int sht3x_probe(struct i2c_client *client,
 	mutex_init(&data->i2c_lock);
 	mutex_init(&data->data_lock);
 
+	/* wait predefined limits loading complete before access */
+	usleep_range(500, 600);
+
 	ret = limits_update(data);
 	if (ret)
 		return ret;
-- 
2.15.1

