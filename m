Return-Path: <linux-hwmon-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-18.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C5D16C2B9F4
	for <linux-hwmon@archiver.kernel.org>; Wed, 23 Jun 2021 00:21:04 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 9BC81610A0
	for <linux-hwmon@archiver.kernel.org>; Wed, 23 Jun 2021 00:21:04 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229954AbhFWAXU (ORCPT <rfc822;linux-hwmon@archiver.kernel.org>);
        Tue, 22 Jun 2021 20:23:20 -0400
Received: from gate2.alliedtelesis.co.nz ([202.36.163.20]:43658 "EHLO
        gate2.alliedtelesis.co.nz" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229751AbhFWAXT (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>);
        Tue, 22 Jun 2021 20:23:19 -0400
Received: from svr-chch-seg1.atlnz.lc (mmarshal3.atlnz.lc [10.32.18.43])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (Client did not present a certificate)
        by gate2.alliedtelesis.co.nz (Postfix) with ESMTPS id C5C7F891B2;
        Wed, 23 Jun 2021 12:21:01 +1200 (NZST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=alliedtelesis.co.nz;
        s=mail181024; t=1624407661;
        bh=ZHHdwz2jBnluFriStBR+pO3akBrjHPWr5lPrsgsL6wQ=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References;
        b=myOFAZeXkstnXzogjWTm5u4qrmA7a0As7csOe7pXlYYV787WIt1go1JQsToGh2S3l
         9FyKDXzZu4SldvusneSWg+Rth/oJRGdB2em3VYTomrML52Cs4KvNveSTsABj6Xd+hd
         AoIdBH4wjJVrN49ZHF81r7vYHEl1G2vmioNv7D3UXbtLVRDH+vhrE1f5pyJXRyuU7B
         jsBRLFgNm6oN3mVXKbxYJJejmmIQG+DoYpBC+JBjHWxOqmLUkGkICZPlUoO0AxE5Bs
         kr48pQsL4vgz8+KP/f4w0nJv3rIpT80SEFYLx9PQAeYpOndf5jblfZ+R/iR0XqTjPQ
         N0qTz+E/txe0w==
Received: from pat.atlnz.lc (Not Verified[10.32.16.33]) by svr-chch-seg1.atlnz.lc with Trustwave SEG (v8,2,6,11305)
        id <B60d27e6d0002>; Wed, 23 Jun 2021 12:21:01 +1200
Received: from chrisp-dl.ws.atlnz.lc (chrisp-dl.ws.atlnz.lc [10.33.22.20])
        by pat.atlnz.lc (Postfix) with ESMTP id 97C4213EE59;
        Wed, 23 Jun 2021 12:21:01 +1200 (NZST)
Received: by chrisp-dl.ws.atlnz.lc (Postfix, from userid 1030)
        id 95A9928397C; Wed, 23 Jun 2021 12:21:01 +1200 (NZST)
From:   Chris Packham <chris.packham@alliedtelesis.co.nz>
To:     jdelvare@suse.com, linux@roeck-us.net
Cc:     linux-hwmon@vger.kernel.org, linux-kernel@vger.kernel.org,
        Chris Packham <chris.packham@alliedtelesis.co.nz>
Subject: [PATCH 2/2] hwmon: (adt7470) Use standard update_interval property
Date:   Wed, 23 Jun 2021 12:20:58 +1200
Message-Id: <20210623002058.3133-3-chris.packham@alliedtelesis.co.nz>
X-Mailer: git-send-email 2.32.0
In-Reply-To: <20210623002058.3133-1-chris.packham@alliedtelesis.co.nz>
References: <20210623002058.3133-1-chris.packham@alliedtelesis.co.nz>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-SEG-SpamProfiler-Analysis: v=2.3 cv=IOh89TnG c=1 sm=1 tr=0 a=KLBiSEs5mFS1a/PbTCJxuA==:117 a=r6YtysWOX24A:10 a=Dll3vNiuiB-kHhnXVbsA:9
X-SEG-SpamProfiler-Score: 0
x-atlnz-ls: pat
Precedence: bulk
List-ID: <linux-hwmon.vger.kernel.org>
X-Mailing-List: linux-hwmon@vger.kernel.org

Instead of the non-standard auto_update_interval make use of the
update_interval property that is supported by the hwmon core.

Signed-off-by: Chris Packham <chris.packham@alliedtelesis.co.nz>
---

I kind of anticipate a NAK on this because it affects the ABI. But I figu=
red
I'd run it past the ML to see if moving towards the hwmon core is work th=
e hit
in ABI compatibility.

 drivers/hwmon/adt7470.c | 64 +++++++++++++++++++++++++----------------
 1 file changed, 39 insertions(+), 25 deletions(-)

diff --git a/drivers/hwmon/adt7470.c b/drivers/hwmon/adt7470.c
index 24d210def09b..c0428ab532bb 100644
--- a/drivers/hwmon/adt7470.c
+++ b/drivers/hwmon/adt7470.c
@@ -461,35 +461,37 @@ static struct adt7470_data *adt7470_update_device(s=
truct device *dev)
 	return err < 0 ? ERR_PTR(err) : data;
 }
=20
-static ssize_t auto_update_interval_show(struct device *dev,
-					 struct device_attribute *devattr,
-					 char *buf)
-{
-	struct adt7470_data *data =3D adt7470_update_device(dev);
-
-	if (IS_ERR(data))
-		return PTR_ERR(data);
-
-	return sprintf(buf, "%d\n", data->auto_update_interval);
-}
-
-static ssize_t auto_update_interval_store(struct device *dev,
-					  struct device_attribute *devattr,
-					  const char *buf, size_t count)
+static int adt7470_chip_read(struct device *dev, u32 attr, long *val)
 {
 	struct adt7470_data *data =3D dev_get_drvdata(dev);
-	long temp;
=20
-	if (kstrtol(buf, 10, &temp))
-		return -EINVAL;
+	switch (attr) {
+	case hwmon_chip_update_interval:
+		*val =3D data->auto_update_interval;
+		break;
+	default:
+		return -EOPNOTSUPP;
+	}
=20
-	temp =3D clamp_val(temp, 0, 60000);
+	return 0;
+}
=20
-	mutex_lock(&data->lock);
-	data->auto_update_interval =3D temp;
-	mutex_unlock(&data->lock);
+static int adt7470_chip_write(struct device *dev, u32 attr, long val)
+{
+	struct adt7470_data *data =3D dev_get_drvdata(dev);
=20
-	return count;
+	switch (attr) {
+	case hwmon_chip_update_interval:
+		val =3D clamp_val(val, 0, 60000);
+		mutex_lock(&data->lock);
+		data->auto_update_interval =3D val;
+		mutex_unlock(&data->lock);
+		break;
+	default:
+		return -EOPNOTSUPP;
+	}
+
+	return 0;
 }
=20
 static ssize_t num_temp_sensors_show(struct device *dev,
@@ -1017,7 +1019,6 @@ static ssize_t pwm_auto_temp_store(struct device *d=
ev,
=20
 static DEVICE_ATTR_RW(alarm_mask);
 static DEVICE_ATTR_RW(num_temp_sensors);
-static DEVICE_ATTR_RW(auto_update_interval);
=20
 static SENSOR_DEVICE_ATTR_RW(force_pwm_max, force_pwm_max, 0);
=20
@@ -1049,7 +1050,6 @@ static SENSOR_DEVICE_ATTR_RW(pwm4_auto_channels_tem=
p, pwm_auto_temp, 3);
 static struct attribute *adt7470_attrs[] =3D {
 	&dev_attr_alarm_mask.attr,
 	&dev_attr_num_temp_sensors.attr,
-	&dev_attr_auto_update_interval.attr,
 	&sensor_dev_attr_force_pwm_max.dev_attr.attr,
 	&sensor_dev_attr_pwm1_auto_point1_pwm.dev_attr.attr,
 	&sensor_dev_attr_pwm2_auto_point1_pwm.dev_attr.attr,
@@ -1080,6 +1080,8 @@ static int adt7470_read(struct device *dev, enum hw=
mon_sensor_types type, u32 at
 			int channel, long *val)
 {
 	switch (type) {
+	case hwmon_chip:
+		return adt7470_chip_read(dev, attr, val);
 	case hwmon_temp:
 		return adt7470_temp_read(dev, attr, channel, val);
 	case hwmon_fan:
@@ -1095,6 +1097,8 @@ static int adt7470_write(struct device *dev, enum h=
wmon_sensor_types type, u32 a
 			int channel, long val)
 {
 	switch (type) {
+	case hwmon_chip:
+		return adt7470_chip_write(dev, attr, val);
 	case hwmon_temp:
 		return adt7470_temp_write(dev, attr, channel, val);
 	case hwmon_fan:
@@ -1112,6 +1116,15 @@ static umode_t adt7470_is_visible(const void *_dat=
a, enum hwmon_sensor_types typ
 	umode_t mode =3D 0;
=20
 	switch (type) {
+	case hwmon_chip:
+		switch (attr) {
+		case hwmon_chip_update_interval:
+			mode =3D 0644;
+			break;
+		default:
+			break;
+		}
+		break;
 	case hwmon_temp:
 		switch (attr) {
 		case hwmon_temp:
@@ -1170,6 +1183,7 @@ static const struct hwmon_ops adt7470_hwmon_ops =3D=
 {
 };
=20
 static const struct hwmon_channel_info *adt7470_info[] =3D {
+	HWMON_CHANNEL_INFO(chip, HWMON_C_UPDATE_INTERVAL),
 	HWMON_CHANNEL_INFO(temp,
 			HWMON_T_INPUT | HWMON_T_MIN | HWMON_T_MAX | HWMON_T_ALARM,
 			HWMON_T_INPUT | HWMON_T_MIN | HWMON_T_MAX | HWMON_T_ALARM,
--=20
2.32.0

