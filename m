Return-Path: <linux-hwmon-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B25BFC433EF
	for <linux-hwmon@archiver.kernel.org>; Mon,  2 May 2022 11:13:56 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1384684AbiEBLRX (ORCPT <rfc822;linux-hwmon@archiver.kernel.org>);
        Mon, 2 May 2022 07:17:23 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57416 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231792AbiEBLRW (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>); Mon, 2 May 2022 07:17:22 -0400
Received: from smtp1.axis.com (smtp1.axis.com [195.60.68.17])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8B5096372
        for <linux-hwmon@vger.kernel.org>; Mon,  2 May 2022 04:13:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=axis.com; q=dns/txt; s=axis-central1; t=1651490033;
  x=1683026033;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=Ty+/c1GiIMN9adN9mb/HrXR9YcJj4kR5Q/lW3+pbUoQ=;
  b=EiT6sHb0kXoPLQH9h884ubq3MyLdHT4iwhbnih/Vx4ZCzbyaZ/gLSYum
   4Ry6UqeUNb2df+1QXnBhl4RCY67lFzDeEBV/dSP2Y5WwryKNUzWB70fN7
   /vuGSa88MZHqHW4JVh529VeodL17fKMR+g5RzpwAgA4P5Qe/Tv8HvJG+3
   RBtHeFIFFKxEFLheRCC6zR0PykF2cCFvJQ3TtAq4TuSE1PUNjHpFs2oDl
   M6ijaMIJjcY3npWkFcbOPy/mzCxarv4jUD8DhpTD0nMZQwLd8bZmKnWzu
   kcFoN7l+zcuB85b5vDFRaaEflcZYWJ/Y/gUl6azdMQzu4kntoQAJy/QUF
   g==;
From:   =?UTF-8?q?M=C3=A5rten=20Lindahl?= <marten.lindahl@axis.com>
To:     Guenter Roeck <linux@roeck-us.net>,
        Jean Delvare <jdelvare@suse.com>
CC:     <linux-hwmon@vger.kernel.org>, <kernel@axis.com>,
        =?UTF-8?q?M=C3=A5rten=20Lindahl?= <marten.lindahl@axis.com>
Subject: [PATCH v5 3/4] hwmon: (pmbus/ltc2978) Add chip specific write_byte_data
Date:   Mon, 2 May 2022 13:13:44 +0200
Message-ID: <20220502111345.3100970-4-marten.lindahl@axis.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20220502111345.3100970-1-marten.lindahl@axis.com>
References: <20220502111345.3100970-1-marten.lindahl@axis.com>
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

