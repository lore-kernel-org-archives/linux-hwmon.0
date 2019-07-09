Return-Path: <SRS0=fIHL=VG=vger.kernel.org=linux-hwmon-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.8 required=3.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED,USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 543D9C606D8
	for <linux-hwmon@archiver.kernel.org>; Tue,  9 Jul 2019 09:51:03 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 2E378216E3
	for <linux-hwmon@archiver.kernel.org>; Tue,  9 Jul 2019 09:51:03 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725989AbfGIJvC (ORCPT <rfc822;linux-hwmon@archiver.kernel.org>);
        Tue, 9 Jul 2019 05:51:02 -0400
Received: from imap1.codethink.co.uk ([176.9.8.82]:53264 "EHLO
        imap1.codethink.co.uk" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726018AbfGIJvC (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>); Tue, 9 Jul 2019 05:51:02 -0400
Received: from [167.98.27.226] (helo=ct-lt-765.unassigned)
        by imap1.codethink.co.uk with esmtpsa (Exim 4.84_2 #1 (Debian))
        id 1hkmm0-000663-Mz; Tue, 09 Jul 2019 10:50:56 +0100
Received: from ikerpalomar by ct-lt-765.unassigned with local (Exim 4.89)
        (envelope-from <ikerpalomar@ct-lt-765.unassigned>)
        id 1hkmm0-00025I-BD; Tue, 09 Jul 2019 10:50:56 +0100
From:   Iker Perez <iker.perez@codethink.co.uk>
To:     Jean Delvare <jdelvare@suse.com>,
        Guenter Roeck <linux@roeck-us.net>, linux-hwmon@vger.kernel.org
Cc:     Iker Perez del Palomar Sustatxa <iker.perez@codethink.co.uk>
Subject: [PATCH v1 1/5] hwmon: (lm75) Add kind field to struct lm75_data
Date:   Tue,  9 Jul 2019 10:50:48 +0100
Message-Id: <20190709095052.7964-2-iker.perez@codethink.co.uk>
X-Mailer: git-send-email 2.11.0
In-Reply-To: <20190709095052.7964-1-iker.perez@codethink.co.uk>
References: <20190709095052.7964-1-iker.perez@codethink.co.uk>
Sender: linux-hwmon-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-hwmon.vger.kernel.org>
X-Mailing-List: linux-hwmon@vger.kernel.org

From: Iker Perez del Palomar Sustatxa <iker.perez@codethink.co.uk>

The purpose of this change is to store the kind of device the
kernel is working with.

Signed-off-by: Iker Perez del Palomar Sustatxa <iker.perez@codethink.co.uk>
---
 drivers/hwmon/lm75.c | 10 ++++++----
 1 file changed, 6 insertions(+), 4 deletions(-)

diff --git a/drivers/hwmon/lm75.c b/drivers/hwmon/lm75.c
index 3fb9c0a2d6d0..0209e0719784 100644
--- a/drivers/hwmon/lm75.c
+++ b/drivers/hwmon/lm75.c
@@ -68,6 +68,7 @@ struct lm75_data {
 	u8			resolution;	/* In bits, between 9 and 16 */
 	u8			resolution_limits;
 	unsigned int		sample_time;	/* In ms */
+	enum lm75_type		kind;
 };
 
 /*-----------------------------------------------------------------------*/
@@ -237,15 +238,16 @@ lm75_probe(struct i2c_client *client, const struct i2c_device_id *id)
 	struct device *dev = &client->dev;
 	struct device *hwmon_dev;
 	struct lm75_data *data;
+	struct lm75_data device_data;
 	int status, err;
 	u8 set_mask, clr_mask;
 	int new;
-	enum lm75_type kind;
 
+	data = &device_data;
 	if (client->dev.of_node)
-		kind = (enum lm75_type)of_device_get_match_data(&client->dev);
+		data->kind = (enum lm75_type)of_device_get_match_data(&client->dev);
 	else
-		kind = id->driver_data;
+		data->kind = id->driver_data;
 
 	if (!i2c_check_functionality(client->adapter,
 			I2C_FUNC_SMBUS_BYTE_DATA | I2C_FUNC_SMBUS_WORD_DATA))
@@ -267,7 +269,7 @@ lm75_probe(struct i2c_client *client, const struct i2c_device_id *id)
 	set_mask = 0;
 	clr_mask = LM75_SHUTDOWN;		/* continuous conversions */
 
-	switch (kind) {
+	switch (data->kind) {
 	case adt75:
 		clr_mask |= 1 << 5;		/* not one-shot mode */
 		data->resolution = 12;
-- 
2.11.0

