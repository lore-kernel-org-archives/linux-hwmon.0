Return-Path: <SRS0=lHFq=6T=vger.kernel.org=linux-hwmon-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-17.4 required=3.0 tests=DKIMWL_WL_MED,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT,
	USER_IN_DEF_DKIM_WL autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8884AC3A5A9
	for <linux-hwmon@archiver.kernel.org>; Tue,  5 May 2020 01:00:30 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 5390F206C0
	for <linux-hwmon@archiver.kernel.org>; Tue,  5 May 2020 01:00:30 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="c7vLm1Lp"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726641AbgEEBAa (ORCPT <rfc822;linux-hwmon@archiver.kernel.org>);
        Mon, 4 May 2020 21:00:30 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37944 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726598AbgEEBA3 (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>); Mon, 4 May 2020 21:00:29 -0400
Received: from mail-yb1-xb4a.google.com (mail-yb1-xb4a.google.com [IPv6:2607:f8b0:4864:20::b4a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 9A5E9C061A0F
        for <linux-hwmon@vger.kernel.org>; Mon,  4 May 2020 18:00:27 -0700 (PDT)
Received: by mail-yb1-xb4a.google.com with SMTP id s8so766928ybj.9
        for <linux-hwmon@vger.kernel.org>; Mon, 04 May 2020 18:00:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20161025;
        h=date:in-reply-to:message-id:mime-version:references:subject:from:to
         :cc;
        bh=IAF+c+mxDq63pwNsdiUTdL7yDJcgysvKkg4aV4iBdLg=;
        b=c7vLm1LpcwhEAOPtB1OgeWs02j//C65teCEgA+XRMx7DciK4fUHIiO7bARnJFW7jax
         OwaAmYDqVIlwkeeoZJsb9pfuKKUlBUbVa9SJEp0IhRS1Nn5JA9JniDpxiFvcZkORNg+N
         58PxRPfMGedqQ2Omh9YY9XAOD93u0r8W0BiBHJ4kBeOeE1RhRUL4wjWsCsvtNvT7HCOk
         C1c0ROzjhpZ6+I8JW3eTSXdrUd+NLyKtvHRotIM3x9SUbBC83JaYDWy7I8dMd27mhTXk
         Hgf9PexCfv4vWqG6gdJx+M/YtGJh9BvUWNub3bA4WYeWhwXIZMC82p0EJrns/GxzCt+J
         ISag==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:in-reply-to:message-id:mime-version
         :references:subject:from:to:cc;
        bh=IAF+c+mxDq63pwNsdiUTdL7yDJcgysvKkg4aV4iBdLg=;
        b=rneaP0rnWmxSJdhA4JF13Q2cDS0P4v+IGsbJ06LbG23LwScfRFvfpuwsZWpze+vyye
         7RCqDczlirEpvy8JznYvE1LMnvBxuXLH0vZwzG6e6Yet+NgbMRWpYVT/1VWVztov2Tvt
         7/Q25iSJmDOkLOfBuFrXaptVI1FPqkPX5VPWH1Q0cnwCCgH1AukrAUuO4eqYIcgNVHvt
         tB+RVCiVxbeJTDUfjNfs2n1nddl5OmBONxBEpV5GeHG8nKzHwsHVrM7ILnrlcyl6t9Gp
         ZV7FkPHhJyCHZp/JIgKlhLMpKg6LvxqJPPr5jwupIKnkqZE7Kg+MSTIlPfeqCfIkM3dT
         /asg==
X-Gm-Message-State: AGi0PuY2epq2Qzs+abhf60CskuQqhtAsFskAth2+2L1cisvHoSlW6O5A
        HECwTPQ0VsXITb3hVCzN+XnrO2F1
X-Google-Smtp-Source: APiQypKWCzE/Uo8/Onox7nqPeOk2JH9Va0z+45ltgg5Y+Qsl/lIBiBj0Uxs7CI0AE+rnpe8AuENBGU/C
X-Received: by 2002:a25:2904:: with SMTP id p4mr952657ybp.475.1588640426753;
 Mon, 04 May 2020 18:00:26 -0700 (PDT)
Date:   Mon,  4 May 2020 17:59:45 -0700
In-Reply-To: <20200505005945.228561-1-xqiu@google.com>
Message-Id: <20200505005945.228561-2-xqiu@google.com>
Mime-Version: 1.0
References: <20200504235428.GA122247@roeck-us.net> <20200505005945.228561-1-xqiu@google.com>
X-Mailer: git-send-email 2.26.2.526.g744177e7f7-goog
Subject: [PATCH v2] hwmon: (ina2xx) Implement alert functions
From:   Alex Qiu <xqiu@google.com>
To:     Guenter Roeck <linux@roeck-us.net>
Cc:     linux-hwmon@vger.kernel.org, Alex Qiu <xqiu@google.com>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-hwmon-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-hwmon.vger.kernel.org>
X-Mailing-List: linux-hwmon@vger.kernel.org

Implement alert functions for INA226, INA230 and INA231. Expose 06h
Mask/Enable and 07h Alert Limit registers via alert setting and alarm
files.

Signed-off-by: Alex Qiu <xqiu@google.com>
---
 Documentation/hwmon/ina2xx.rst |  19 ++++
 drivers/hwmon/ina2xx.c         | 183 +++++++++++++++++++++++++++++++++
 2 files changed, 202 insertions(+)

diff --git a/Documentation/hwmon/ina2xx.rst b/Documentation/hwmon/ina2xx.rst
index 94b9a260c518..ed81f5416331 100644
--- a/Documentation/hwmon/ina2xx.rst
+++ b/Documentation/hwmon/ina2xx.rst
@@ -99,6 +99,25 @@ Sysfs entries for ina226, ina230 and ina231 only
 ------------------------------------------------
 
 ======================= ====================================================
+in0_lcrit		Critical low shunt voltage
+in0_crit		Critical high shunt voltage
+in0_lcrit_alarm		Shunt voltage critical low alarm
+in0_crit_alarm		Shunt voltage critical high alarm
+in1_lcrit		Critical low bus voltage
+in1_crit		Critical high bus voltage
+in1_lcrit_alarm		Bus voltage critical low alarm
+in1_crit_alarm		Bus voltage critical high alarm
+power1_crit		Critical high power
+power1_crit_alarm	Power critical high alarm
 update_interval		data conversion time; affects number of samples used
 			to average results for shunt and bus voltages.
 ======================= ====================================================
+
+.. note::
+
+   - Configure `shunt_resistor` before configure `power1_crit`, because power
+     value is calculated based on `shunt_resistor` set.
+   - Because of the underlying register implementation, only one `*crit` setting
+     and its `alarm` can be active. Writing to one `*crit` setting clears other
+     `*crit` settings and alarms. Writing 0 to any `*crit` setting clears all
+     `*crit` settings and alarms.
diff --git a/drivers/hwmon/ina2xx.c b/drivers/hwmon/ina2xx.c
index e9e78c0b7212..55d474ec7c35 100644
--- a/drivers/hwmon/ina2xx.c
+++ b/drivers/hwmon/ina2xx.c
@@ -74,6 +74,17 @@
 #define INA226_READ_AVG(reg)		(((reg) & INA226_AVG_RD_MASK) >> 9)
 #define INA226_SHIFT_AVG(val)		((val) << 9)
 
+/* bit number of alert functions in Mask/Enable Register */
+#define INA226_SHUNT_OVER_VOLTAGE_BIT	15
+#define INA226_SHUNT_UNDER_VOLTAGE_BIT	14
+#define INA226_BUS_OVER_VOLTAGE_BIT	13
+#define INA226_BUS_UNDER_VOLTAGE_BIT	12
+#define INA226_POWER_OVER_LIMIT_BIT	11
+
+/* bit mask for alert config bits of Mask/Enable Register */
+#define INA226_ALERT_CONFIG_MASK	0xFC00
+#define INA226_ALERT_FUNCTION_FLAG	BIT(4)
+
 /* common attrs, ina226 attrs and NULL */
 #define INA2XX_MAX_ATTRIBUTE_GROUPS	3
 
@@ -303,6 +314,145 @@ static ssize_t ina2xx_value_show(struct device *dev,
 			ina2xx_get_value(data, attr->index, regval));
 }
 
+static int ina226_reg_to_alert(struct ina2xx_data *data, u8 bit, u16 regval)
+{
+	int reg;
+
+	switch (bit) {
+	case INA226_SHUNT_OVER_VOLTAGE_BIT:
+	case INA226_SHUNT_UNDER_VOLTAGE_BIT:
+		reg = INA2XX_SHUNT_VOLTAGE;
+		break;
+	case INA226_BUS_OVER_VOLTAGE_BIT:
+	case INA226_BUS_UNDER_VOLTAGE_BIT:
+		reg = INA2XX_BUS_VOLTAGE;
+		break;
+	case INA226_POWER_OVER_LIMIT_BIT:
+		reg = INA2XX_POWER;
+		break;
+	default:
+		/* programmer goofed */
+		WARN_ON_ONCE(1);
+		return 0;
+	}
+
+	return ina2xx_get_value(data, reg, regval);
+}
+
+/*
+ * Turns alert limit values into register values.
+ * Opposite of the formula in ina2xx_get_value().
+ */
+static s16 ina226_alert_to_reg(struct ina2xx_data *data, u8 bit, int val)
+{
+	switch (bit) {
+	case INA226_SHUNT_OVER_VOLTAGE_BIT:
+	case INA226_SHUNT_UNDER_VOLTAGE_BIT:
+		val *= data->config->shunt_div;
+		return clamp_val(val, SHRT_MIN, SHRT_MAX);
+	case INA226_BUS_OVER_VOLTAGE_BIT:
+	case INA226_BUS_UNDER_VOLTAGE_BIT:
+		val = (val * 1000) << data->config->bus_voltage_shift;
+		val = DIV_ROUND_CLOSEST(val, data->config->bus_voltage_lsb);
+		return clamp_val(val, 0, SHRT_MAX);
+	case INA226_POWER_OVER_LIMIT_BIT:
+		val = DIV_ROUND_CLOSEST(val, data->power_lsb_uW);
+		return clamp_val(val, 0, USHRT_MAX);
+	default:
+		/* programmer goofed */
+		WARN_ON_ONCE(1);
+		return 0;
+	}
+}
+
+static ssize_t ina226_alert_show(struct device *dev,
+				 struct device_attribute *da, char *buf)
+{
+	struct sensor_device_attribute *attr = to_sensor_dev_attr(da);
+	struct ina2xx_data *data = dev_get_drvdata(dev);
+	int regval;
+	int val = 0;
+	int ret;
+
+	mutex_lock(&data->config_lock);
+	ret = regmap_read(data->regmap, INA226_MASK_ENABLE, &regval);
+	if (ret)
+		goto abort;
+
+	if (regval & BIT(attr->index)) {
+		ret = regmap_read(data->regmap, INA226_ALERT_LIMIT, &regval);
+		if (ret)
+			goto abort;
+		val = ina226_reg_to_alert(data, attr->index, regval);
+	}
+
+	ret = snprintf(buf, PAGE_SIZE, "%d\n", val);
+abort:
+	mutex_unlock(&data->config_lock);
+	return ret;
+}
+
+static ssize_t ina226_alert_store(struct device *dev,
+				  struct device_attribute *da,
+				  const char *buf, size_t count)
+{
+	struct sensor_device_attribute *attr = to_sensor_dev_attr(da);
+	struct ina2xx_data *data = dev_get_drvdata(dev);
+	unsigned long val;
+	int ret;
+
+	ret = kstrtoul(buf, 10, &val);
+	if (ret < 0)
+		return ret;
+
+	/*
+	 * Clear all alerts first to avoid accidentally triggering ALERT pin
+	 * due to register write sequence. Then, only enable the alert
+	 * if the value is non-zero.
+	 */
+	mutex_lock(&data->config_lock);
+	ret = regmap_update_bits(data->regmap, INA226_MASK_ENABLE,
+				 INA226_ALERT_CONFIG_MASK, 0);
+	if (ret < 0)
+		goto abort;
+
+	ret = regmap_write(data->regmap, INA226_ALERT_LIMIT,
+			   ina226_alert_to_reg(data, attr->index, val));
+	if (ret < 0)
+		goto abort;
+
+	if (val != 0) {
+		ret = regmap_update_bits(data->regmap, INA226_MASK_ENABLE,
+					 INA226_ALERT_CONFIG_MASK,
+					 BIT(attr->index));
+		if (ret < 0)
+			goto abort;
+	}
+
+	ret = count;
+abort:
+	mutex_unlock(&data->config_lock);
+	return ret;
+}
+
+static ssize_t ina226_alarm_show(struct device *dev,
+				 struct device_attribute *da, char *buf)
+{
+	struct sensor_device_attribute *attr = to_sensor_dev_attr(da);
+	struct ina2xx_data *data = dev_get_drvdata(dev);
+	int regval;
+	int alarm = 0;
+	int ret;
+
+	ret = regmap_read(data->regmap, INA226_MASK_ENABLE, &regval);
+	if (ret)
+		return ret;
+
+	alarm = (regval & BIT(attr->index)) &&
+		(regval & INA226_ALERT_FUNCTION_FLAG);
+	return snprintf(buf, PAGE_SIZE, "%d\n", alarm);
+}
+
 /*
  * In order to keep calibration register value fixed, the product
  * of current_lsb and shunt_resistor should also be fixed and equal
@@ -392,15 +542,38 @@ static ssize_t ina226_interval_show(struct device *dev,
 
 /* shunt voltage */
 static SENSOR_DEVICE_ATTR_RO(in0_input, ina2xx_value, INA2XX_SHUNT_VOLTAGE);
+/* shunt voltage over/under voltage alert setting and alarm */
+static SENSOR_DEVICE_ATTR_RW(in0_crit, ina226_alert,
+			     INA226_SHUNT_OVER_VOLTAGE_BIT);
+static SENSOR_DEVICE_ATTR_RW(in0_lcrit, ina226_alert,
+			     INA226_SHUNT_UNDER_VOLTAGE_BIT);
+static SENSOR_DEVICE_ATTR_RO(in0_crit_alarm, ina226_alarm,
+			     INA226_SHUNT_OVER_VOLTAGE_BIT);
+static SENSOR_DEVICE_ATTR_RO(in0_lcrit_alarm, ina226_alarm,
+			     INA226_SHUNT_UNDER_VOLTAGE_BIT);
 
 /* bus voltage */
 static SENSOR_DEVICE_ATTR_RO(in1_input, ina2xx_value, INA2XX_BUS_VOLTAGE);
+/* bus voltage over/under voltage alert setting and alarm */
+static SENSOR_DEVICE_ATTR_RW(in1_crit, ina226_alert,
+			     INA226_BUS_OVER_VOLTAGE_BIT);
+static SENSOR_DEVICE_ATTR_RW(in1_lcrit, ina226_alert,
+			     INA226_BUS_UNDER_VOLTAGE_BIT);
+static SENSOR_DEVICE_ATTR_RO(in1_crit_alarm, ina226_alarm,
+			     INA226_BUS_OVER_VOLTAGE_BIT);
+static SENSOR_DEVICE_ATTR_RO(in1_lcrit_alarm, ina226_alarm,
+			     INA226_BUS_UNDER_VOLTAGE_BIT);
 
 /* calculated current */
 static SENSOR_DEVICE_ATTR_RO(curr1_input, ina2xx_value, INA2XX_CURRENT);
 
 /* calculated power */
 static SENSOR_DEVICE_ATTR_RO(power1_input, ina2xx_value, INA2XX_POWER);
+/* over-limit power alert setting and alarm */
+static SENSOR_DEVICE_ATTR_RW(power1_crit, ina226_alert,
+			     INA226_POWER_OVER_LIMIT_BIT);
+static SENSOR_DEVICE_ATTR_RO(power1_crit_alarm, ina226_alarm,
+			     INA226_POWER_OVER_LIMIT_BIT);
 
 /* shunt resistance */
 static SENSOR_DEVICE_ATTR_RW(shunt_resistor, ina2xx_shunt, INA2XX_CALIBRATION);
@@ -423,6 +596,16 @@ static const struct attribute_group ina2xx_group = {
 };
 
 static struct attribute *ina226_attrs[] = {
+	&sensor_dev_attr_in0_crit.dev_attr.attr,
+	&sensor_dev_attr_in0_lcrit.dev_attr.attr,
+	&sensor_dev_attr_in0_crit_alarm.dev_attr.attr,
+	&sensor_dev_attr_in0_lcrit_alarm.dev_attr.attr,
+	&sensor_dev_attr_in1_crit.dev_attr.attr,
+	&sensor_dev_attr_in1_lcrit.dev_attr.attr,
+	&sensor_dev_attr_in1_crit_alarm.dev_attr.attr,
+	&sensor_dev_attr_in1_lcrit_alarm.dev_attr.attr,
+	&sensor_dev_attr_power1_crit.dev_attr.attr,
+	&sensor_dev_attr_power1_crit_alarm.dev_attr.attr,
 	&sensor_dev_attr_update_interval.dev_attr.attr,
 	NULL,
 };
-- 
2.26.2.526.g744177e7f7-goog

