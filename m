Return-Path: <linux-hwmon-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5FCD0C433EF
	for <linux-hwmon@archiver.kernel.org>; Tue,  3 May 2022 10:47:34 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234316AbiECKvC (ORCPT <rfc822;linux-hwmon@archiver.kernel.org>);
        Tue, 3 May 2022 06:51:02 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44892 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234235AbiECKum (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>); Tue, 3 May 2022 06:50:42 -0400
Received: from smtp2.axis.com (smtp2.axis.com [195.60.68.18])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 937E11CFE7
        for <linux-hwmon@vger.kernel.org>; Tue,  3 May 2022 03:46:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=axis.com; q=dns/txt; s=axis-central1; t=1651574803;
  x=1683110803;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=Ty+/c1GiIMN9adN9mb/HrXR9YcJj4kR5Q/lW3+pbUoQ=;
  b=OQIzWjp+o5N8U/lKJZqC6NKs5szupSgZyla0UNeLotQrtnNFHp+BZWmj
   ZRgIIRKBCLVFZT7tjjLSUYuwOG2DjGl1V1BGxfm30KYOK0Yzymkl+Iv14
   rSisFWxCw0BXdKAWaIG3iIH3frb3+FWtV00KdKhmvVZmyHSOA/eZCTns1
   R4SatowkaydiDqx8fQAZNVotFKNKfMukWuMf2A2syU8ScVYrJLMp9TtvQ
   4YRimPxLM5ix/Od1pzdY2+qXP2m4zhRA9kxnPZ30l7kRHIlqEuU6iSeYE
   mXuX4CdLpG6h8FMqcGroTIMxTTWfWg7BEA2ne3lZ6HeDuPcSZI2s4qQ5V
   Q==;
From:   =?UTF-8?q?M=C3=A5rten=20Lindahl?= <marten.lindahl@axis.com>
To:     Guenter Roeck <linux@roeck-us.net>,
        Jean Delvare <jdelvare@suse.com>
CC:     <linux-hwmon@vger.kernel.org>, <kernel@axis.com>,
        =?UTF-8?q?M=C3=A5rten=20Lindahl?= <marten.lindahl@axis.com>
Subject: [PATCH v6 3/4] hwmon: (pmbus/ltc2978) Add chip specific write_byte_data
Date:   Tue, 3 May 2022 12:46:30 +0200
Message-ID: <20220503104631.3515715-4-marten.lindahl@axis.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20220503104631.3515715-1-marten.lindahl@axis.com>
References: <20220503104631.3515715-1-marten.lindahl@axis.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-hwmon.vger.kernel.org>
X-Mailing-List: linux-hwmon@vger.kernel.org

Several of the manuals for devices supported by this driver describes
the need for a minimum wait time before the chip is ready to receive
next command.

This wait time is already implemented in the driver as a ltc_wait_ready
function with a driver defined wait time of 100 ms, and is considered
for specific devices before reading/writing data on the pmbus.

Since this driver uses the default pmbus_regulator_ops for the enable/
disable/is_enabled functions we should add a driver specific callback
for write_byte_data to prevent bypassing the wait time recommendations
for the following devices: ltc3880/ltc3882/ltc3883/ltc3884/ltc3886/
ltc3887/ltc3889/ltm4664/ltm4675/ltm4676/ltm4677/ltm4678/ltm4680/ltm4686/
ltm4700/ltc7880.

Signed-off-by: Mårten Lindahl <marten.lindahl@axis.com>
---
 drivers/hwmon/pmbus/ltc2978.c | 12 ++++++++++++
 1 file changed, 12 insertions(+)

diff --git a/drivers/hwmon/pmbus/ltc2978.c b/drivers/hwmon/pmbus/ltc2978.c
index 0127273883f0..531aa674a928 100644
--- a/drivers/hwmon/pmbus/ltc2978.c
+++ b/drivers/hwmon/pmbus/ltc2978.c
@@ -196,6 +196,17 @@ static int ltc_read_byte_data(struct i2c_client *client, int page, int reg)
 	return pmbus_read_byte_data(client, page, reg);
 }
 
+static int ltc_write_byte_data(struct i2c_client *client, int page, int reg, u8 value)
+{
+	int ret;
+
+	ret = ltc_wait_ready(client);
+	if (ret < 0)
+		return ret;
+
+	return pmbus_write_byte_data(client, page, reg, value);
+}
+
 static int ltc_write_byte(struct i2c_client *client, int page, u8 byte)
 {
 	int ret;
@@ -681,6 +692,7 @@ static int ltc2978_probe(struct i2c_client *client)
 	info = &data->info;
 	info->write_word_data = ltc2978_write_word_data;
 	info->write_byte = ltc_write_byte;
+	info->write_byte_data = ltc_write_byte_data;
 	info->read_word_data = ltc_read_word_data;
 	info->read_byte_data = ltc_read_byte_data;
 
-- 
2.30.2

