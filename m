Return-Path: <linux-hwmon-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E0AA7CCA47C
	for <linux-hwmon@archiver.kernel.org>; Fri, 10 Jun 2022 11:47:54 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S242326AbiFJLry (ORCPT <rfc822;linux-hwmon@archiver.kernel.org>);
        Fri, 10 Jun 2022 07:47:54 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38930 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S245406AbiFJLrv (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>);
        Fri, 10 Jun 2022 07:47:51 -0400
Received: from smtp1.axis.com (smtp1.axis.com [195.60.68.17])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 4044295A25
        for <linux-hwmon@vger.kernel.org>; Fri, 10 Jun 2022 04:47:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=axis.com; q=dns/txt; s=axis-central1; t=1654861670;
  x=1686397670;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=u75ohJvoKBHcoCVHzKRgktSkTeLtSsqEm4hzZIA9lFs=;
  b=YBaUczqfpv/qcfLEMMaLV4BB1xDhKsdUMcf7wYpSBcPczuZrPFLQMp+b
   +4mbV9nIvtHoVXjVAwXDyRhFFRKbzEt6IUkTKcapqfC8r/vi9viuF+dJF
   osliWtUuGqtDIGZCk+j3lZ7GuULx68CvesUJbqHInECXESUUahuq91VaZ
   ecrn6l8OQ4kBZJN3UarBduIpTM7OfVnebeOAARbi7Vpt8L9v3OUHVjTub
   i6NfjMwXZWRegi7RBzHRGEwsWB1HDSzvX8ej3886bruuzTvLriEpe3kn7
   DTfeAooio3AURoNKnzgXYFs6GeAj6gF26UsEZyidMolB31J+eCz1svYA1
   Q==;
From:   =?UTF-8?q?M=C3=A5rten=20Lindahl?= <marten.lindahl@axis.com>
To:     Guenter Roeck <linux@roeck-us.net>,
        Jean Delvare <jdelvare@suse.com>
CC:     <linux-hwmon@vger.kernel.org>, <kernel@axis.com>,
        =?UTF-8?q?M=C3=A5rten=20Lindahl?= <marten.lindahl@axis.com>
Subject: [PATCH v2 2/3] hwmon: (pmbus) Add list_voltage to pmbus ops
Date:   Fri, 10 Jun 2022 13:47:31 +0200
Message-ID: <20220610114732.2370242-3-marten.lindahl@axis.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20220610114732.2370242-1-marten.lindahl@axis.com>
References: <20220610114732.2370242-1-marten.lindahl@axis.com>
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
 drivers/hwmon/pmbus/pmbus_core.c | 50 ++++++++++++++++++++++++++++++++
 1 file changed, 50 insertions(+)

diff --git a/drivers/hwmon/pmbus/pmbus_core.c b/drivers/hwmon/pmbus/pmbus_core.c
index 478dda49a45f..24ba4b2b03d4 100644
--- a/drivers/hwmon/pmbus/pmbus_core.c
+++ b/drivers/hwmon/pmbus/pmbus_core.c
@@ -2711,6 +2711,55 @@ static int pmbus_regulator_set_voltage(struct regulator_dev *rdev, int min_uv,
 	return _pmbus_write_word_data(client, s.page, PMBUS_VOUT_COMMAND, (u16)val);
 }
 
+static int pmbus_regulator_list_voltage(struct regulator_dev *rdev,
+					 unsigned int selector)
+{
+	struct device *dev = rdev_get_dev(rdev);
+	struct i2c_client *client = to_i2c_client(dev->parent);
+	struct pmbus_data *data = i2c_get_clientdata(client);
+	struct pmbus_sensor s = {
+		.page = rdev_get_id(rdev),
+		.class = PSC_VOLTAGE_OUT,
+		.convert = true,
+		.data = -1,
+	};
+	int val = DIV_ROUND_CLOSEST(rdev->desc->min_uV +
+				    (rdev->desc->uV_step * selector),
+				    1000); /* convert to mV */
+
+	if (!data->vout_low[s.page]) {
+		if (pmbus_check_word_register(client, s.page, PMBUS_MFR_VOUT_MIN))
+			s.data = _pmbus_read_word_data(client, s.page, 0xff,
+						       PMBUS_MFR_VOUT_MIN);
+		if (s.data < 0) {
+			s.data = _pmbus_read_word_data(client, s.page, 0xff,
+						       PMBUS_VOUT_MARGIN_LOW);
+			if (s.data < 0)
+				return s.data;
+		}
+		data->vout_low[s.page] = pmbus_reg2data(data, &s);
+	}
+
+	if (!data->vout_high[s.page]) {
+		s.data = -1;
+		if (pmbus_check_word_register(client, s.page, PMBUS_MFR_VOUT_MAX))
+			s.data = _pmbus_read_word_data(client, s.page, 0xff,
+						       PMBUS_MFR_VOUT_MAX);
+		if (s.data < 0) {
+			s.data = _pmbus_read_word_data(client, s.page, 0xff,
+						       PMBUS_VOUT_MARGIN_HIGH);
+			if (s.data < 0)
+				return s.data;
+		}
+		data->vout_high[s.page] = pmbus_reg2data(data, &s);
+	}
+
+	if (val >= data->vout_low[s.page] && val <= data->vout_high[s.page])
+		return val * 1000; /* unit is uV */
+
+	return 0;
+}
+
 const struct regulator_ops pmbus_regulator_ops = {
 	.enable = pmbus_regulator_enable,
 	.disable = pmbus_regulator_disable,
@@ -2718,6 +2767,7 @@ const struct regulator_ops pmbus_regulator_ops = {
 	.get_error_flags = pmbus_regulator_get_error_flags,
 	.get_voltage = pmbus_regulator_get_voltage,
 	.set_voltage = pmbus_regulator_set_voltage,
+	.list_voltage = pmbus_regulator_list_voltage,
 };
 EXPORT_SYMBOL_NS_GPL(pmbus_regulator_ops, PMBUS);
 
-- 
2.30.2

