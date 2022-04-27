Return-Path: <linux-hwmon-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6C3D0C4332F
	for <linux-hwmon@archiver.kernel.org>; Wed, 27 Apr 2022 13:02:34 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235211AbiD0NFn (ORCPT <rfc822;linux-hwmon@archiver.kernel.org>);
        Wed, 27 Apr 2022 09:05:43 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39148 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235214AbiD0NFl (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>);
        Wed, 27 Apr 2022 09:05:41 -0400
Received: from smtp1.axis.com (smtp1.axis.com [195.60.68.17])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id AF5E753E22
        for <linux-hwmon@vger.kernel.org>; Wed, 27 Apr 2022 06:02:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=axis.com; q=dns/txt; s=axis-central1; t=1651064550;
  x=1682600550;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=xdlkXFiric0uLTTlH7H0/6DhjGJdK9mA0DER7ToFNZo=;
  b=FzHAM4KdaQfRcYC6J2znHw4fTqC3DS0Gtt55G3ylT0mK/OfAwfxcQEI7
   c+sMz0njvVfHx67nep1s7SvskMkfm0LhEJ/KK+/gDyl68deXdlsnnoWvV
   y2w95HkZlqoK88Ne9wtXbxwVWtfpjLEDmWGnmLWbvyWUiv5pO2OpqJr2O
   4GhNb/fZa1jLm0nuUFjI9V9I7zW38tRqqJS0K9UkNWQT6HcvU3NSTkz0B
   EQ2xOaqbWO6dDeEnsMieYKSt70Jpg/49t7q5BMMOiOi8Z13RLs9lvORVw
   7APDCU7+RDHNtyuZtzaRVtRjfPuvOoVlCTKtZT9qokbA1CDQxhlbYShia
   A==;
From:   =?UTF-8?q?M=C3=A5rten=20Lindahl?= <marten.lindahl@axis.com>
To:     Guenter Roeck <linux@roeck-us.net>,
        Jean Delvare <jdelvare@suse.com>
CC:     <linux-hwmon@vger.kernel.org>, <kernel@axis.com>,
        =?UTF-8?q?M=C3=A5rten=20Lindahl?= <marten.lindahl@axis.com>
Subject: [PATCH v3 3/3] hwmon: (pmbus) Add get_voltage/set_voltage ops
Date:   Wed, 27 Apr 2022 15:02:13 +0200
Message-ID: <20220427130213.1557793-4-marten.lindahl@axis.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20220427130213.1557793-1-marten.lindahl@axis.com>
References: <20220427130213.1557793-1-marten.lindahl@axis.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-hwmon.vger.kernel.org>
X-Mailing-List: linux-hwmon@vger.kernel.org

The pmbus core does not have operations for getting or setting voltage.
Add functions get/set voltage for the dynamic regulator framework.

Signed-off-by: Mårten Lindahl <marten.lindahl@axis.com>
---
 drivers/hwmon/pmbus/pmbus_core.c | 43 ++++++++++++++++++++++++++++++++
 1 file changed, 43 insertions(+)

diff --git a/drivers/hwmon/pmbus/pmbus_core.c b/drivers/hwmon/pmbus/pmbus_core.c
index 1b0728c3c7d8..afc238faa8ce 100644
--- a/drivers/hwmon/pmbus/pmbus_core.c
+++ b/drivers/hwmon/pmbus/pmbus_core.c
@@ -2563,11 +2563,54 @@ static int pmbus_regulator_get_error_flags(struct regulator_dev *rdev, unsigned
 	return 0;
 }
 
+static int pmbus_regulator_get_voltage(struct regulator_dev *rdev)
+{
+	struct device *dev = rdev_get_dev(rdev);
+	struct i2c_client *client = to_i2c_client(dev->parent);
+	u8 page = rdev_get_id(rdev);
+	int ret;
+
+	ret = _pmbus_read_word_data(client, page, 0xff, PMBUS_READ_VOUT);
+	if (ret < 0)
+		return ret;
+
+	ret *= 1000;
+
+	return ((ret >> 13) * 1000);
+}
+
+static int pmbus_regulator_set_voltage(struct regulator_dev *rdev, int min_uV,
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
+	ret = _pmbus_read_word_data(client, page, 0xff, PMBUS_VOUT_MARGIN_LOW);
+	if (ret < 0)
+		return ret;
+
+	/* Select the voltage closest to min_uV */
+	if (ret > val)
+		val = ret;
+
+	ret = _pmbus_write_word_data(client, page, PMBUS_VOUT_COMMAND,
+				    (u16)val);
+
+	return ret;
+}
+
 const struct regulator_ops pmbus_regulator_ops = {
 	.enable = pmbus_regulator_enable,
 	.disable = pmbus_regulator_disable,
 	.is_enabled = pmbus_regulator_is_enabled,
 	.get_error_flags = pmbus_regulator_get_error_flags,
+	.get_voltage = pmbus_regulator_get_voltage,
+	.set_voltage = pmbus_regulator_set_voltage,
 };
 EXPORT_SYMBOL_NS_GPL(pmbus_regulator_ops, PMBUS);
 
-- 
2.30.2

