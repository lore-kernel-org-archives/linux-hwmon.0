Return-Path: <linux-hwmon-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DC6C5C433EF
	for <linux-hwmon@archiver.kernel.org>; Wed,  6 Apr 2022 15:35:29 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236300AbiDFPhZ (ORCPT <rfc822;linux-hwmon@archiver.kernel.org>);
        Wed, 6 Apr 2022 11:37:25 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59762 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S236470AbiDFPgx (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>); Wed, 6 Apr 2022 11:36:53 -0400
Received: from smtp1.axis.com (smtp1.axis.com [195.60.68.17])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id EC2BFB82C5
        for <linux-hwmon@vger.kernel.org>; Wed,  6 Apr 2022 05:50:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=axis.com; q=dns/txt; s=axis-central1; t=1649249447;
  x=1680785447;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=XadJbMI4YcWpHRemPHx28ryOug9QzJsMKYUGybSDnxw=;
  b=au3rzKzbumsAa6uV+AMwMiLCWEqQqvV1HuQfZNy6dMyWygxW5fgOOMGD
   gl51f/EZYbmbXOCydigL/irM/Ef7Vvhf35zwi8+el2dO+HDNqt0PNffqO
   LKz9X3LvgrEFQ7a5OoOrDLszI90kgBzt5YotP/5RqOosKpiL+fRulVg/1
   S030wQbV5H3Li0jtAMpAutCildD7QAQgKEZzABSnXeIdO7Hfhm2Zz21Ds
   QE9oh++qSTzKCLhdkWe43qUONpU0a0spBM3Da58SIA4RpCRkCkoT2cMkS
   TG0ZE7xFP8B6gr6kUBOEoBeUNuNKJezJpYxlSFeQJ1Wqn1D0L/XEqWQ2I
   A==;
From:   =?UTF-8?q?M=C3=A5rten=20Lindahl?= <marten.lindahl@axis.com>
To:     Guenter Roeck <linux@roeck-us.net>,
        Jean Delvare <jdelvare@suse.com>
CC:     <linux-hwmon@vger.kernel.org>, <kernel@axis.com>,
        =?UTF-8?q?M=C3=A5rten=20Lindahl?= <marten.lindahl@axis.com>
Subject: [PATCH 2/2] hwmon: (pmbus/ltc2978) Add get_voltage/set_voltage ops
Date:   Wed, 6 Apr 2022 14:43:21 +0200
Message-ID: <20220406124321.1184133-3-marten.lindahl@axis.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20220406124321.1184133-1-marten.lindahl@axis.com>
References: <20220406124321.1184133-1-marten.lindahl@axis.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-hwmon.vger.kernel.org>
X-Mailing-List: linux-hwmon@vger.kernel.org

This driver does not have regulator specific operations for getting or
setting voltage. Add functions get/set voltage for the dynamic regulator
framework.

Signed-off-by: Mårten Lindahl <marten.lindahl@axis.com>
---
 drivers/hwmon/pmbus/ltc2978.c | 55 +++++++++++++++++++++++++++++++++++
 1 file changed, 55 insertions(+)

diff --git a/drivers/hwmon/pmbus/ltc2978.c b/drivers/hwmon/pmbus/ltc2978.c
index 822edec33ba7..fce08c33e66a 100644
--- a/drivers/hwmon/pmbus/ltc2978.c
+++ b/drivers/hwmon/pmbus/ltc2978.c
@@ -596,10 +596,65 @@ static int ltc2978_regulator_disable(struct regulator_dev *rdev)
 	return ltc2978_regulator_on_off(rdev, 0);
 }
 
+static int ltc2978_regulator_get_voltage(struct regulator_dev *rdev)
+{
+	struct device *dev = rdev_get_dev(rdev);
+	struct i2c_client *client = to_i2c_client(dev->parent);
+	u8 page = rdev_get_id(rdev);
+	int ret;
+
+	ret = ltc_wait_ready(client);
+	if (ret < 0)
+		return ret;
+
+	ret = pmbus_read_word_data(client, page, 0xff, PMBUS_READ_VOUT);
+	if (ret < 0)
+		return ret;
+
+	ret *= 1000;
+
+	return ((ret >> 13) * 1000);
+}
+
+static int ltc2978_regulator_set_voltage(struct regulator_dev *rdev, int min_uV,
+					 int max_uV, unsigned int *selector)
+{
+	struct device *dev = rdev_get_dev(rdev);
+	struct i2c_client *client = to_i2c_client(dev->parent);
+	u8 page = rdev_get_id(rdev);
+	long tmp = DIV_ROUND_CLOSEST(min_uV, 1000);
+	u32 val = DIV_ROUND_CLOSEST(tmp << 13, 1000);
+	int ret;
+	*selector = 0;
+
+	ret = ltc_wait_ready(client);
+	if (ret < 0)
+		return ret;
+
+	ret = pmbus_read_word_data(client, page, 0xff, PMBUS_VOUT_MARGIN_LOW);
+	if (ret < 0)
+		return ret;
+
+	/* Select the voltage closest to min_uV */
+	if (ret > val)
+		val = ret;
+
+	ret = ltc_wait_ready(client);
+	if (ret < 0)
+		return ret;
+
+	ret = pmbus_write_word_data(client, page, PMBUS_VOUT_COMMAND,
+				    (u16)val);
+
+	return ret;
+}
+
 static const struct regulator_ops ltc2978_regulator_ops = {
 	.enable = ltc2978_regulator_enable,
 	.disable = ltc2978_regulator_disable,
 	.is_enabled = ltc2978_regulator_is_enabled,
+	.get_voltage = ltc2978_regulator_get_voltage,
+	.set_voltage = ltc2978_regulator_set_voltage,
 };
 
 /* Macro for filling in array of struct regulator_desc */
-- 
2.30.2

