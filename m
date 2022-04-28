Return-Path: <linux-hwmon-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1F1E1C4332F
	for <linux-hwmon@archiver.kernel.org>; Thu, 28 Apr 2022 14:40:59 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1348514AbiD1OoM (ORCPT <rfc822;linux-hwmon@archiver.kernel.org>);
        Thu, 28 Apr 2022 10:44:12 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35420 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1348544AbiD1OoE (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>);
        Thu, 28 Apr 2022 10:44:04 -0400
Received: from smtp1.axis.com (smtp1.axis.com [195.60.68.17])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 42F1D2229C
        for <linux-hwmon@vger.kernel.org>; Thu, 28 Apr 2022 07:40:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=axis.com; q=dns/txt; s=axis-central1; t=1651156848;
  x=1682692848;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=Ty+/c1GiIMN9adN9mb/HrXR9YcJj4kR5Q/lW3+pbUoQ=;
  b=U1aAe3uhxij6G/I0MpmMr8ui/GC+Io/2HVhuXWLliOCvVsj9yr5/vAHU
   aRKm9sxWyn37Scj//95IJNjc0zU7qdhne13FqJd8gAAEt6E0o3gCO3ynn
   IMyPYRlb4JjzpLwDtnqOx8JT/Hb/KYUunkN9OM/n6LPodKuFIhzUeowmN
   Knr5IVW0Qy3p2ZD0ritP9xEsznxDiVNio3GU7YqH6omDPVhtV0YvINp2f
   5Pt/w022dU4AMknGatJjJhOow+RTY6JTZy66GYgr60BBYE5I2P0CTEMHA
   TUMYLn6jiFZU8h9jStRFf9acwTtz10QckXP+cAOi57P/SnE5bLljRrtrS
   g==;
From:   =?UTF-8?q?M=C3=A5rten=20Lindahl?= <marten.lindahl@axis.com>
To:     Guenter Roeck <linux@roeck-us.net>,
        Jean Delvare <jdelvare@suse.com>
CC:     <linux-hwmon@vger.kernel.org>, <kernel@axis.com>,
        =?UTF-8?q?M=C3=A5rten=20Lindahl?= <marten.lindahl@axis.com>
Subject: [PATCH v4 3/4] hwmon: (pmbus/ltc2978) Add chip specific write_byte_data
Date:   Thu, 28 Apr 2022 16:40:38 +0200
Message-ID: <20220428144039.2464667-4-marten.lindahl@axis.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20220428144039.2464667-1-marten.lindahl@axis.com>
References: <20220428144039.2464667-1-marten.lindahl@axis.com>
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

