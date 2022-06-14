Return-Path: <linux-hwmon-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8D492C433EF
	for <linux-hwmon@archiver.kernel.org>; Tue, 14 Jun 2022 09:39:14 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229477AbiFNJjO (ORCPT <rfc822;linux-hwmon@archiver.kernel.org>);
        Tue, 14 Jun 2022 05:39:14 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53898 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232782AbiFNJjN (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>);
        Tue, 14 Jun 2022 05:39:13 -0400
Received: from smtp1.axis.com (smtp1.axis.com [195.60.68.17])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 56DB03C712
        for <linux-hwmon@vger.kernel.org>; Tue, 14 Jun 2022 02:39:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=axis.com; q=dns/txt; s=axis-central1; t=1655199553;
  x=1686735553;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=lFfOKNF9aiUwLcRwcEIW4/C9vBgTZM1XbFWA0iDByIs=;
  b=YW3dUqwhAlbZM4mmw+qW3BZdbZkjpqdS6RN3u3KOwPCOVTqzyufVg/gv
   IzGlsR0pA9JfOOzQxPGJru2FX1+DdfQ6BUQx9wDKe2kLMYwA5n85rsb/2
   jRmuifmUHq2aF4KFkwXex8mdeDbrQJLcnYJgCT2/KKS32EFvoa1cSWLFj
   gtYZAJh5Po2gtdE9Ok20iT0h6xbqLjtKDF9CyjcMkPOzilK9O1ydTLGOs
   hiHMQQK/YSyAcFxBCXdKqlGXJ6w/qVG/gRFaGOxA/GTbHvk1xiIqFWDRk
   wHHhHAZw06gSH1af10H+3igB1shKVgjhf8/9KAQAlj+LFfe/AhI3Q/NEz
   A==;
From:   =?UTF-8?q?M=C3=A5rten=20Lindahl?= <marten.lindahl@axis.com>
To:     Guenter Roeck <linux@roeck-us.net>,
        Jean Delvare <jdelvare@suse.com>
CC:     <linux-hwmon@vger.kernel.org>, <kernel@axis.com>,
        =?UTF-8?q?M=C3=A5rten=20Lindahl?= <marten.lindahl@axis.com>
Subject: [PATCH v3 2/3] hwmon: (pmbus) Add list_voltage to pmbus ops
Date:   Tue, 14 Jun 2022 11:38:55 +0200
Message-ID: <20220614093856.3470672-3-marten.lindahl@axis.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20220614093856.3470672-1-marten.lindahl@axis.com>
References: <20220614093856.3470672-1-marten.lindahl@axis.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-hwmon.vger.kernel.org>
X-Mailing-List: linux-hwmon@vger.kernel.org

When checking if a regulator supports a voltage range, the regulator
needs to have a list_voltage callback set to the regulator_ops or else
-EINVAL will be returned. This support does not exist for the pmbus
regulators, so this patch adds pmbus_regulator_list_voltage to the
pmbus_regulator_ops.

Signed-off-by: Mårten Lindahl <marten.lindahl@axis.com>
---
 drivers/hwmon/pmbus/pmbus_core.c | 30 ++++++++++++++++++++++++++++++
 1 file changed, 30 insertions(+)

diff --git a/drivers/hwmon/pmbus/pmbus_core.c b/drivers/hwmon/pmbus/pmbus_core.c
index 5e0d16512fa6..f303c2598fb5 100644
--- a/drivers/hwmon/pmbus/pmbus_core.c
+++ b/drivers/hwmon/pmbus/pmbus_core.c
@@ -2745,6 +2745,35 @@ static int pmbus_regulator_set_voltage(struct regulator_dev *rdev, int min_uv,
 	return _pmbus_write_word_data(client, s.page, PMBUS_VOUT_COMMAND, (u16)val);
 }
 
+static int pmbus_regulator_list_voltage(struct regulator_dev *rdev,
+					 unsigned int selector)
+{
+	struct device *dev = rdev_get_dev(rdev);
+	struct i2c_client *client = to_i2c_client(dev->parent);
+	int val, low, high;
+
+	if (selector >= rdev->desc->n_voltages ||
+	    selector < rdev->desc->linear_min_sel)
+		return -EINVAL;
+
+	selector -= rdev->desc->linear_min_sel;
+	val = DIV_ROUND_CLOSEST(rdev->desc->min_uV +
+				(rdev->desc->uV_step * selector), 1000); /* convert to mV */
+
+	low = pmbus_regulator_get_low_margin(client, rdev_get_id(rdev));
+	if (low < 0)
+		return low;
+
+	high = pmbus_regulator_get_high_margin(client, rdev_get_id(rdev));
+	if (high < 0)
+		return high;
+
+	if (val >= low && val <= high)
+		return val * 1000; /* unit is uV */
+
+	return 0;
+}
+
 const struct regulator_ops pmbus_regulator_ops = {
 	.enable = pmbus_regulator_enable,
 	.disable = pmbus_regulator_disable,
@@ -2752,6 +2781,7 @@ const struct regulator_ops pmbus_regulator_ops = {
 	.get_error_flags = pmbus_regulator_get_error_flags,
 	.get_voltage = pmbus_regulator_get_voltage,
 	.set_voltage = pmbus_regulator_set_voltage,
+	.list_voltage = pmbus_regulator_list_voltage,
 };
 EXPORT_SYMBOL_NS_GPL(pmbus_regulator_ops, PMBUS);
 
-- 
2.30.2

