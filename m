Received: from mail-lj1-f181.google.com (mail-lj1-f181.google.com [209.85.208.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 176A713328B
	for <linux-hwmon@vger.kernel.org>; Tue, 16 Apr 2024 17:17:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.181
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1713287867; cv=none; b=j7mLCuWCPg8RKXXRpIL0u0/P+FPf1yDSUc2L1KQvlmg51B9zQcgnVCj6m6PP2/2GvUtJWYif5ACMpli3/Wl6XHp4cm0IBLwPRoud2zF2vHxWxgFYqpG28fRtf27pZEYXvo9Xx+gLqYYZVKlVEMksR9lequ3+X8H/Ig9DYtHzjkY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1713287867; c=relaxed/simple;
	bh=K+AcM58mzm3c+Yj4n6jUi7czYSLj2qZzGkTpu3p4bY4=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=k557l1A+1MjlN1PHaYcYy6suNTl2jeSrELjDO4vC7GAOmsmIX6w8lnI4zIBRYvLYHBfrYctm6+9Bjas3w7oV2C5X897EbDZc9WPDearT7AbZ2lzKPX9HBCPx+eIwDYmiChkCAHOMhICBKBp9f5eJTOOiPNf90SCEvLqC8NAMjYU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=9elements.com; spf=pass smtp.mailfrom=9elements.com; dkim=pass (2048-bit key) header.d=9elements.com header.i=@9elements.com header.b=beDKDeXb; arc=none smtp.client-ip=209.85.208.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=9elements.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=9elements.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=9elements.com header.i=@9elements.com header.b="beDKDeXb"
Received: by mail-lj1-f181.google.com with SMTP id 38308e7fff4ca-2d6ff0422a2so58150171fa.2
        for <linux-hwmon@vger.kernel.org>; Tue, 16 Apr 2024 10:17:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=9elements.com; s=google; t=1713287862; x=1713892662; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=q9szDnQQbde3VV2IBcUFfpImhQV+pZQtTN+ukiHfUzk=;
        b=beDKDeXbza7SovrS1cZv7uoN/TI1TQlvt6j2cXHrkeLlB31DCRR0pPzih2vbkytfNU
         4seXUuekYrNEDcmSd8Dz2R5Vvr4J/OjVOxT6b4E0UpE4y/H/Z5/o6w8RJ4Li7Ig9pdr0
         MdUDXcOyCibEudwUYSVl3rU0F2hDqGIGf7v9yBgDbj+haJrRVetEWHdooDuGkER7sGPn
         2SimrAkel0Sk7uVJgdZgngcfoA6SU6t1XHIcck7x1Q0WfSjaxhD/aGDgmxYotBqcQzy8
         BYby34OflAF9QNMyVdL5BgNljRf2tJgFjYuIvzKTq1nWLct+fF01VORMLZ63lBb8TjDk
         9Vlg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1713287862; x=1713892662;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=q9szDnQQbde3VV2IBcUFfpImhQV+pZQtTN+ukiHfUzk=;
        b=XG2PbXJbr4LbmbptNas1SQaba1A94VJty4pDF7Qr/RDF7r+zR9rxiqgpyZvfFfAyTG
         uGb8zTgQINe9CMEoHnzIAgP3gCZOdeLvloKkDQPqXyuHUPvmRA8gGpS/eUeiM9IbdebB
         8Io5pBw2HWt4uXThaHg11VqVxgylKlzTs6X4cbmudkyLlgwzeQ3AhBnuJDGsp1MFHZiW
         lqVyqYI0GnisfUJapmup4OQrSBUNdB8RiNMbGPppnqK4daQxK8NsQGSEsKr8bGrMeMA7
         BDtQiSvdDPPqkEmxAvFYIw4fGc2r1/fEOmDbVQeFfhOBuKA/likZSdDueFTcrWAxSS1z
         tS9w==
X-Forwarded-Encrypted: i=1; AJvYcCUcy1TeEz6hMIq9kfpG1L70fUS5mnBkL43+z7SWuC7WKJBkBs6b+eQgUxcqgA5bVs1JcEQuNc/jXEey/0XAqEUmDh0T8z5ZMshT3M8=
X-Gm-Message-State: AOJu0YzmKfGVz1zj9n5NtRPBlVPDb5Kt2P2STq0q2mEOzPvoBTpBndt1
	waMq52jF/X4PWO+Z4Ipm5ADEZks81hnAxRbCJrPWrfr/nqfktSjZ0j/yMBlRNyI=
X-Google-Smtp-Source: AGHT+IGLRpchh8fCb3JwVTeDpOl5q4sI3WjzpV1Yd+fEmrWhWELlTVObROUZTQfbF04fOfPbA7xxEg==
X-Received: by 2002:a2e:a308:0:b0:2d8:68ad:1e87 with SMTP id l8-20020a2ea308000000b002d868ad1e87mr7859413lje.18.1713287862022;
        Tue, 16 Apr 2024 10:17:42 -0700 (PDT)
Received: from stroh80.sec.9e.network (ip-078-094-000-051.um19.pools.vodafone-ip.de. [78.94.0.51])
        by smtp.gmail.com with ESMTPSA id w7-20020a05600c474700b004182fab5098sm13016326wmo.20.2024.04.16.10.17.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 16 Apr 2024 10:17:41 -0700 (PDT)
From: Naresh Solanki <naresh.solanki@9elements.com>
To: Guenter Roeck <linux@roeck-us.net>,
	krzysztof.kozlowski+dt@linaro.org,
	u.kleine-koenig@pengutronix.de,
	Jean Delvare <jdelvare@suse.com>
Cc: Naresh Solanki <naresh.solanki@9elements.com>,
	linux-hwmon@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH 4/4] hwmon (max6639): Remove hwmon init with group
Date: Tue, 16 Apr 2024 22:47:17 +0530
Message-ID: <20240416171720.2875916-4-naresh.solanki@9elements.com>
X-Mailer: git-send-email 2.42.0
In-Reply-To: <20240416171720.2875916-1-naresh.solanki@9elements.com>
References: <20240416171720.2875916-1-naresh.solanki@9elements.com>
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Signed-off-by: Naresh Solanki <naresh.solanki@9elements.com>
---
 drivers/hwmon/max6639.c | 232 ----------------------------------------
 1 file changed, 232 deletions(-)

diff --git a/drivers/hwmon/max6639.c b/drivers/hwmon/max6639.c
index d9b23202d7a2..c39f32316fe2 100644
--- a/drivers/hwmon/max6639.c
+++ b/drivers/hwmon/max6639.c
@@ -165,233 +165,6 @@ static struct max6639_data *max6639_update_device(struct device *dev)
 	return ret;
 }
 
-static ssize_t temp_input_show(struct device *dev,
-			       struct device_attribute *dev_attr, char *buf)
-{
-	long temp;
-	struct max6639_data *data = max6639_update_device(dev);
-	struct sensor_device_attribute *attr = to_sensor_dev_attr(dev_attr);
-
-	if (IS_ERR(data))
-		return PTR_ERR(data);
-
-	temp = data->temp[attr->index] * 125;
-	return sprintf(buf, "%ld\n", temp);
-}
-
-static ssize_t temp_fault_show(struct device *dev,
-			       struct device_attribute *dev_attr, char *buf)
-{
-	struct max6639_data *data = max6639_update_device(dev);
-	struct sensor_device_attribute *attr = to_sensor_dev_attr(dev_attr);
-
-	if (IS_ERR(data))
-		return PTR_ERR(data);
-
-	return sprintf(buf, "%d\n", data->temp_fault[attr->index]);
-}
-
-static ssize_t temp_max_show(struct device *dev,
-			     struct device_attribute *dev_attr, char *buf)
-{
-	struct sensor_device_attribute *attr = to_sensor_dev_attr(dev_attr);
-	struct max6639_data *data = dev_get_drvdata(dev);
-
-	return sprintf(buf, "%d\n", (data->temp_therm[attr->index] * 1000));
-}
-
-static ssize_t temp_max_store(struct device *dev,
-			      struct device_attribute *dev_attr,
-			      const char *buf, size_t count)
-{
-	struct sensor_device_attribute *attr = to_sensor_dev_attr(dev_attr);
-	struct max6639_data *data = dev_get_drvdata(dev);
-	unsigned long val;
-	int res;
-
-	res = kstrtoul(buf, 10, &val);
-	if (res)
-		return res;
-
-	mutex_lock(&data->update_lock);
-	data->temp_therm[attr->index] = TEMP_LIMIT_TO_REG(val);
-	regmap_write(data->regmap, MAX6639_REG_THERM_LIMIT(attr->index),
-		     data->temp_therm[attr->index]);
-	mutex_unlock(&data->update_lock);
-	return count;
-}
-
-static ssize_t temp_crit_show(struct device *dev,
-			      struct device_attribute *dev_attr, char *buf)
-{
-	struct sensor_device_attribute *attr = to_sensor_dev_attr(dev_attr);
-	struct max6639_data *data = dev_get_drvdata(dev);
-
-	return sprintf(buf, "%d\n", (data->temp_alert[attr->index] * 1000));
-}
-
-static ssize_t temp_crit_store(struct device *dev,
-			       struct device_attribute *dev_attr,
-			       const char *buf, size_t count)
-{
-	struct sensor_device_attribute *attr = to_sensor_dev_attr(dev_attr);
-	struct max6639_data *data = dev_get_drvdata(dev);
-	unsigned long val;
-	int res;
-
-	res = kstrtoul(buf, 10, &val);
-	if (res)
-		return res;
-
-	mutex_lock(&data->update_lock);
-	data->temp_alert[attr->index] = TEMP_LIMIT_TO_REG(val);
-	regmap_write(data->regmap, MAX6639_REG_ALERT_LIMIT(attr->index),
-		     data->temp_alert[attr->index]);
-	mutex_unlock(&data->update_lock);
-	return count;
-}
-
-static ssize_t temp_emergency_show(struct device *dev,
-				   struct device_attribute *dev_attr,
-				   char *buf)
-{
-	struct sensor_device_attribute *attr = to_sensor_dev_attr(dev_attr);
-	struct max6639_data *data = dev_get_drvdata(dev);
-
-	return sprintf(buf, "%d\n", (data->temp_ot[attr->index] * 1000));
-}
-
-static ssize_t temp_emergency_store(struct device *dev,
-				    struct device_attribute *dev_attr,
-				    const char *buf, size_t count)
-{
-	struct sensor_device_attribute *attr = to_sensor_dev_attr(dev_attr);
-	struct max6639_data *data = dev_get_drvdata(dev);
-	unsigned long val;
-	int res;
-
-	res = kstrtoul(buf, 10, &val);
-	if (res)
-		return res;
-
-	mutex_lock(&data->update_lock);
-	data->temp_ot[attr->index] = TEMP_LIMIT_TO_REG(val);
-	regmap_write(data->regmap, MAX6639_REG_OT_LIMIT(attr->index), data->temp_ot[attr->index]);
-	mutex_unlock(&data->update_lock);
-	return count;
-}
-
-static ssize_t pwm_show(struct device *dev, struct device_attribute *dev_attr,
-			char *buf)
-{
-	struct sensor_device_attribute *attr = to_sensor_dev_attr(dev_attr);
-	struct max6639_data *data = dev_get_drvdata(dev);
-	struct pwm_state state;
-
-	pwm_get_state(data->pwmd[attr->index], &state);
-
-	return sprintf(buf, "%d\n", pwm_get_relative_duty_cycle(&state, 255));
-}
-
-static ssize_t pwm_store(struct device *dev,
-			 struct device_attribute *dev_attr, const char *buf,
-			 size_t count)
-{
-	struct sensor_device_attribute *attr = to_sensor_dev_attr(dev_attr);
-	struct max6639_data *data = dev_get_drvdata(dev);
-	struct pwm_state state;
-	unsigned long val;
-	int res;
-
-	res = kstrtoul(buf, 10, &val);
-	if (res)
-		return res;
-
-	val = clamp_val(val, 0, 255);
-
-	pwm_get_state(data->pwmd[attr->index], &state);
-	pwm_set_relative_duty_cycle(&state, val, 255);
-	pwm_apply_state(data->pwmd[attr->index], &state);
-
-	return count;
-}
-
-static ssize_t fan_input_show(struct device *dev,
-			      struct device_attribute *dev_attr, char *buf)
-{
-	struct max6639_data *data = max6639_update_device(dev);
-	struct sensor_device_attribute *attr = to_sensor_dev_attr(dev_attr);
-
-	if (IS_ERR(data))
-		return PTR_ERR(data);
-
-	return sprintf(buf, "%d\n", FAN_FROM_REG(data->fan[attr->index],
-		       data->rpm_range[attr->index]));
-}
-
-static ssize_t alarm_show(struct device *dev,
-			  struct device_attribute *dev_attr, char *buf)
-{
-	struct max6639_data *data = max6639_update_device(dev);
-	struct sensor_device_attribute *attr = to_sensor_dev_attr(dev_attr);
-
-	if (IS_ERR(data))
-		return PTR_ERR(data);
-
-	return sprintf(buf, "%d\n", !!(data->status & (1 << attr->index)));
-}
-
-static SENSOR_DEVICE_ATTR_RO(temp1_input, temp_input, 0);
-static SENSOR_DEVICE_ATTR_RO(temp2_input, temp_input, 1);
-static SENSOR_DEVICE_ATTR_RO(temp1_fault, temp_fault, 0);
-static SENSOR_DEVICE_ATTR_RO(temp2_fault, temp_fault, 1);
-static SENSOR_DEVICE_ATTR_RW(temp1_max, temp_max, 0);
-static SENSOR_DEVICE_ATTR_RW(temp2_max, temp_max, 1);
-static SENSOR_DEVICE_ATTR_RW(temp1_crit, temp_crit, 0);
-static SENSOR_DEVICE_ATTR_RW(temp2_crit, temp_crit, 1);
-static SENSOR_DEVICE_ATTR_RW(temp1_emergency, temp_emergency, 0);
-static SENSOR_DEVICE_ATTR_RW(temp2_emergency, temp_emergency, 1);
-static SENSOR_DEVICE_ATTR_RW(pwm1, pwm, 0);
-static SENSOR_DEVICE_ATTR_RW(pwm2, pwm, 1);
-static SENSOR_DEVICE_ATTR_RO(fan1_input, fan_input, 0);
-static SENSOR_DEVICE_ATTR_RO(fan2_input, fan_input, 1);
-static SENSOR_DEVICE_ATTR_RO(fan1_fault, alarm, 1);
-static SENSOR_DEVICE_ATTR_RO(fan2_fault, alarm, 0);
-static SENSOR_DEVICE_ATTR_RO(temp1_max_alarm, alarm, 3);
-static SENSOR_DEVICE_ATTR_RO(temp2_max_alarm, alarm, 2);
-static SENSOR_DEVICE_ATTR_RO(temp1_crit_alarm, alarm, 7);
-static SENSOR_DEVICE_ATTR_RO(temp2_crit_alarm, alarm, 6);
-static SENSOR_DEVICE_ATTR_RO(temp1_emergency_alarm, alarm, 5);
-static SENSOR_DEVICE_ATTR_RO(temp2_emergency_alarm, alarm, 4);
-
-
-static struct attribute *max6639_attrs[] = {
-	&sensor_dev_attr_temp1_input.dev_attr.attr,
-	&sensor_dev_attr_temp2_input.dev_attr.attr,
-	&sensor_dev_attr_temp1_fault.dev_attr.attr,
-	&sensor_dev_attr_temp2_fault.dev_attr.attr,
-	&sensor_dev_attr_temp1_max.dev_attr.attr,
-	&sensor_dev_attr_temp2_max.dev_attr.attr,
-	&sensor_dev_attr_temp1_crit.dev_attr.attr,
-	&sensor_dev_attr_temp2_crit.dev_attr.attr,
-	&sensor_dev_attr_temp1_emergency.dev_attr.attr,
-	&sensor_dev_attr_temp2_emergency.dev_attr.attr,
-	&sensor_dev_attr_pwm1.dev_attr.attr,
-	&sensor_dev_attr_pwm2.dev_attr.attr,
-	&sensor_dev_attr_fan1_input.dev_attr.attr,
-	&sensor_dev_attr_fan2_input.dev_attr.attr,
-	&sensor_dev_attr_fan1_fault.dev_attr.attr,
-	&sensor_dev_attr_fan2_fault.dev_attr.attr,
-	&sensor_dev_attr_temp1_max_alarm.dev_attr.attr,
-	&sensor_dev_attr_temp2_max_alarm.dev_attr.attr,
-	&sensor_dev_attr_temp1_crit_alarm.dev_attr.attr,
-	&sensor_dev_attr_temp2_crit_alarm.dev_attr.attr,
-	&sensor_dev_attr_temp1_emergency_alarm.dev_attr.attr,
-	&sensor_dev_attr_temp2_emergency_alarm.dev_attr.attr,
-	NULL
-};
-ATTRIBUTE_GROUPS(max6639);
-
 static int max6639_temp_set_max(struct max6639_data *data, int channel, unsigned long val)
 {
 	int res;
@@ -1091,11 +864,6 @@ static int max6639_probe(struct i2c_client *client)
 	if (err < 0)
 		return err;
 
-	if (0)
-		data->hwmon_dev = devm_hwmon_device_register_with_groups(dev, client->name,
-									 data,
-									 max6639_groups);
-
 	data->hwmon_dev = devm_hwmon_device_register_with_info(dev, client->name, data,
 							       &max6639_chip_info, NULL);
 	if (IS_ERR(data->hwmon_dev))
-- 
2.42.0

