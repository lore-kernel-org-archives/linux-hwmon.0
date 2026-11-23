Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=188.165.48.182
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795431529;
	b=nuia5F9+0gre04Z8dc9HU/EAyNsEE5R139iAfCTC+9/S8RufwyyTagR1V0tn0LyfWeTX
	 HKfUwLpRgbDPeUKw+jMtCIgPHpiKBNzJVKTAqI25QWvgm1q3obMLOKhnh9pbJac7R2C8I
	 OT9aI0FTLfSCG1j6CXLchmzpqrSICToWbz/Zhg8U7URzUYhpgMdz6OBnTLCkKgGrYrmdx
	 hhVu8Onj5E+OBMcC302YXBkKJ9tGRxAHD4oCdjvqxrAyvFo9THWMG3a1Mn+wXGkPeL+v5
	 EaW0krpF7N0uDI0rdSTmz6DOLkT97MJfdSuRQQjqc/ZsfVxWOINM7/P8NsQBr1e0RMA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795431529;
	h=DMARC-Filter:Received:Received:Received:X-OVh-ClientIp:From:To:Cc:
	 Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Type:Content-Transfer-Encoding:x-ovh-tracer-id:X-VR-SPAMSTATE:
	 X-VR-SPAMSCORE:X-VR-SPAMCAUSE:DKIM-Signature;
	bh=0gho2H7c9c060AZnIgfNrfz9s8r4MMmYNS2CJZLRFqA=;
	b=l9dvVVWmm0LXBktaUEhjTdOK0+fGufvGSmje9EYMQolBDqRKF/YcVrEcqBW3ZrGn36Ch
	 Qx6BRefMOLr8RPrJWVrrMUN9KFxHDs/P+eiOO1yEIU/5NLMv2+5GZT9bDJBO1bbQ/MD5n
	 Y5f0I9TBf6jB0pOHDqC37q8oLRNPa/kYQPFCs0Ep2tvr6sBIR85o+bsSG3f/mWHJl56A4
	 9IFhXlL1DxskliU5Gt7qw2+VqB21oSy5Nap8cLfd2EcCOVwaPxUOHvWEFbAN1zxHBqTyd
	 tBp4mQ9lbALa5bTjIHECyWNZ0Wabu950CHGDlEz/AmxBSe02gaQVQz1dWb5AgP7gCVA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=3mdeb.com;
	spf=pass smtp.mailfrom=3mdeb.com;
	dkim=pass header.d=3mdeb.com header.i=@3mdeb.com header.a=rsa-sha256 header.s=ovhmo3617313-selector1 header.b=iChZwMsd;
	arc=none smtp.remote-ip=188.165.48.182
Received: from 7.mo560.mail-out.ovh.net (7.mo560.mail-out.ovh.net [188.165.48.182])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E8F8B606A330
	for <linux-hwmon@vger.kernel.org>; Mon, 23 Nov 2026 10:58:48 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org E8F8B606A330
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=3mdeb.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=3mdeb.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=3mdeb.com header.i=@3mdeb.com header.a=rsa-sha256 header.s=ovhmo3617313-selector1 header.b=iChZwMsd
Received: from director3.ghost.mail-out.ovh.net (unknown [10.109.231.136])
	by mo560.mail-out.ovh.net (Postfix) with ESMTP id 4jY2xF1c8VzBPQJ
	for <linux-hwmon@vger.kernel.org>; Mon, 23 Nov 2026 10:58:41 +0000 (UTC)
Received: from ghost-submission-7ccd8bbbb6-n2gw4 (unknown [10.110.168.167])
	by director3.ghost.mail-out.ovh.net (Postfix) with ESMTPS id BA583C013A;
	Mon, 23 Nov 2026 10:58:40 +0000 (UTC)
Received: from 3mdeb.com ([37.59.142.97])
	by ghost-submission-7ccd8bbbb6-n2gw4 with ESMTPSA
	id ObWlFF4cBGvNugsAptLdCg:T4
	(envelope-from <filip.golas@3mdeb.com>); Mon, 23 Nov 2026 10:58:40 +0000
Authentication-Results:garm.ovh; auth=pass (GARM-97G0020f2781da-6eb1-4bd0-834a-c08ec5051f9b,
                    0A512C1CF0928FB71961449F2A077E304137B0E5) smtp.auth=filip.golas@3mdeb.com
X-OVh-ClientIp:213.192.77.249
From: =?UTF-8?q?Filip=20Go=C5=82a=C5=9B?= <filip.golas@3mdeb.com>
To: =?UTF-8?q?Micha=C5=82=20Kope=C4=87?= <michal.kopec@3mdeb.com>,
	Hans de Goede <hansg@kernel.org>,
	=?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>
Cc: platform-driver-x86@vger.kernel.org,
	linux-hwmon@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Guenter Roeck <linux@roeck-us.net>,
	=?UTF-8?q?Filip=20Go=C5=82a=C5=9B?= <filip.golas@3mdeb.com>
Subject: [PATCH v2 3/3] platform/x86: dasharo-acpi: Add EC fan curve support
Date: Mon, 23 Nov 2026 11:58:21 +0100
Message-ID: <20261123105821.305527-4-filip.golas@3mdeb.com>
X-Mailer: git-send-email 2.56.0
In-Reply-To: <20261123105821.305527-1-filip.golas@3mdeb.com>
References: <20261123105821.305527-1-filip.golas@3mdeb.com>
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Post: <mailto:linux-hwmon@vger.kernel.org>
List-Help: <mailto:linux-hwmon+help@vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-hwmon+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
x-ovh-tracer-id: 2044915706218934255
X-VR-SPAMSTATE: OK
X-VR-SPAMSCORE: -100
X-VR-SPAMCAUSE: dmFkZTErAGWDIhDAmmUw5Dcw5mhi5B/4PFjYzh+FFWuHb4zQf5HTh4PWkjVfNbXyuhtFva7PORpTwu40kxu+I5Lb0yQmC6vrYcK7aq2p4pzn8s7P9wOSITwql5MSfAfKz8G46Q0kR9K4JlN+9f693ty0G4JU5FGasqyl0V0RwNLsfFK03KYDaH9PKxIlO+Lpd6NBwIiJx10ej/JdcRw9PexAyk7Vi1UC061pBqW6s/ZfL1m+MnI94eZR7QDzB1e2vYbUBHy1KMIswZ4Qny7ixpPQIcMY8QSKl0MtCfAUwNUmiNnwSIsoNo7zjGqtWT7HXSpsI88QrhrqL9Xke/1gKfHREY4aYy84vuh/OBUgXkRBjflxAEtYRm3bGV9crEg0bnplg+m0O7QDSSQo4b69AjsJXYThfmtVAl7kjEHUNAmZR7iFKBQ0wsQaCXWdGTSbTkRKyU2c55HVSiCi5v+J2MjhQbqmHAeLWnZATIc5+h+dZcHOmLMlxsErhs9y4IoV48eV6aY9ujQp59rw3vPrL6c8PKd/NWVo7Moj9QctSRmvQHO166jDe8W6y11TZNdXjp+xYMwEsuAOdoFdn1RvfY8+mgarU1TBEjaTcZILrfWA+jSKC151Hr1vmXtgXPOMUp49zOpr4p2Csltnx4c5E51Hz9FjQJyr5JxgtIJgLZmtl2vLgg
DKIM-Signature: a=rsa-sha256; bh=0gho2H7c9c060AZnIgfNrfz9s8r4MMmYNS2CJZLRFqA=;
 c=relaxed/relaxed; d=3mdeb.com; h=From; s=ovhmo3617313-selector1;
 t=1795431521; v=1;
 b=iChZwMsdJbgIQmRvXbMLB0cBzdIuAO6u5NO7xiK2J3LhTdqWCnZITu989fgBCjrSgYjv85/T
 2XteIkpdSgRujsSe0O4p7KAo/7sK2qvWvsz3k7bSGB0hu8irOH6Oyn161a1yXXTV45WPdBmal1P
 FpUEiFNKkgZv7jxYU6Yrm2PiwRMk5M9toRFP/jc63hksIARmBzgmrW1rK+KKdaBvWMLyLADune8
 AA2J5esblPCsCIaVKk+DZ6pCP8dtjR5GfJTl14wfg1H35Ibjui+dPSgc23bJ/CAZXkRMK9L6A0r
 EceumhUyNYNVYfH15DhYm9d7pAa49xM+oBFWs9BtQtuZg==

Expose the four-point fan curve run by the EC as pwmN_auto_pointM_temp
and pwmN_auto_pointM_pwm, so that userspace can read and change it.
The EC validates the curve on every write and keeps running the
previous one if the new curve is invalid.

On shutdown, ask the firmware to store the current curve, so that it is
restored on the next boot.

Fan curve control is only exposed for fans on which the firmware reports
support for it.

Signed-off-by: Filip Gołaś <filip.golas@3mdeb.com>
---
Changes in v2:
- Make the curve point attributes static, so DASHARO_POINT_ATTRS()
  does not define 16 global symbols.
- Reject negative fan curve temperatures before converting them to
  degrees, which can round to positive.
- Use DIV_ROUND_CLOSEST_ULL() for showing curve PWM instead of
  DIV_ROUND_CLOSEST(), so it links on 32-bit x86.
- Setting a curve point stages it, applying it is a separate ACPI call.
  Add a mutex to prevent staging more changes before the first set is
  applied.
- Use dasharo_fan_channel to find correct channel for DASHARO_FEATURE_FAN_POINTS.
- SFCS now takes no arguments and saves all fans. The Dasharo dev
  build previously was accepting and ignoring the argument.
---
 drivers/platform/x86/dasharo-acpi.c | 186 +++++++++++++++++++++++++++-
 1 file changed, 185 insertions(+), 1 deletion(-)

diff --git a/drivers/platform/x86/dasharo-acpi.c b/drivers/platform/x86/dasharo-acpi.c
index 85f88b11fcf9..38dd3fc8dcee 100644
--- a/drivers/platform/x86/dasharo-acpi.c
+++ b/drivers/platform/x86/dasharo-acpi.c
@@ -6,7 +6,10 @@
 #include <linux/acpi.h>
 #include <linux/array_size.h>
 #include <linux/hwmon.h>
+#include <linux/hwmon-sysfs.h>
+#include <linux/kstrtox.h>
 #include <linux/module.h>
+#include <linux/mutex.h>
 #include <linux/platform_device.h>
 #include <linux/types.h>
 #include <linux/units.h>
@@ -78,6 +81,7 @@ struct dasharo_capability {
 
 struct dasharo_data {
 	struct platform_device *pdev;
+	struct mutex curve_lock;
 	int caps_found[DASHARO_FEATURE_MAX];
 	struct dasharo_capability capabilities[DASHARO_FEATURE_MAX][MAX_CAPS_PER_FEAT];
 };
@@ -407,6 +411,169 @@ static const struct hwmon_chip_info dasharo_hwmon_chip_info = {
 	.info = dasharo_hwmon_info,
 };
 
+static int dasharo_curve_point_call(struct dasharo_data *data, int pwm_channel, const char *method,
+				    const u64 *args, unsigned int n_args, u64 *ret)
+{
+	int channel = dasharo_fan_channel(data, DASHARO_FEATURE_FAN_POINTS, pwm_channel);
+
+	if (channel < 0)
+		return channel;
+
+	return dasharo_call(data, method, DASHARO_FEATURE_FAN_POINTS, channel, args, n_args, ret);
+}
+
+static int dasharo_curve_point_store(struct dasharo_data *data, int channel, const char *method,
+				     unsigned int point, u64 value)
+{
+	u64 args[2] = { point, value };
+	u64 ret;
+	int err;
+
+	guard(mutex)(&data->curve_lock);
+
+	// set of temp/duty
+	err = dasharo_curve_point_call(data, channel, method, args, 2, &ret);
+	if (err)
+		return err;
+	if (ret)
+		return -EPERM;
+
+	// commit
+	err = dasharo_curve_point_call(data, channel, "CFCV", NULL, 0, &ret);
+	if (err)
+		return err;
+
+	// The EC rejected the curve
+	return ret ? -EINVAL : 0;
+}
+
+static ssize_t curve_point_temp_show(struct device *dev, struct device_attribute *attr, char *buf)
+{
+	struct sensor_device_attribute_2 *sattr = to_sensor_dev_attr_2(attr);
+	struct dasharo_data *data = dev_get_drvdata(dev);
+	u64 point = sattr->index;
+	u64 val;
+	int err;
+
+	err = dasharo_curve_point_call(data, sattr->nr, "GFPT", &point, 1, &val);
+	if (err)
+		return err;
+
+	return sysfs_emit(buf, "%llu\n", val * MILLIDEGREE_PER_DEGREE);
+}
+
+static ssize_t curve_point_temp_store(struct device *dev, struct device_attribute *attr,
+				      const char *buf, size_t count)
+{
+	struct sensor_device_attribute_2 *sattr = to_sensor_dev_attr_2(attr);
+	struct dasharo_data *data = dev_get_drvdata(dev);
+	long val;
+	int err;
+
+	err = kstrtol(buf, 10, &val);
+	if (err)
+		return err;
+
+	if (val < 0)
+		return -EINVAL;
+
+	val /= MILLIDEGREE_PER_DEGREE;
+	if (val > U8_MAX)
+		return -EINVAL;
+
+	err = dasharo_curve_point_store(data, sattr->nr, "SFPT", sattr->index, val);
+	return err ?: count;
+}
+
+static ssize_t curve_point_pwm_show(struct device *dev, struct device_attribute *attr, char *buf)
+{
+	struct sensor_device_attribute_2 *sattr = to_sensor_dev_attr_2(attr);
+	struct dasharo_data *data = dev_get_drvdata(dev);
+	u64 point = sattr->index;
+	u64 val;
+	int err;
+
+	err = dasharo_curve_point_call(data, sattr->nr, "GFPD", &point, 1, &val);
+	if (err)
+		return err;
+
+	return sysfs_emit(buf, "%llu\n", DIV_ROUND_CLOSEST_ULL(val * 255, 100));
+}
+
+static ssize_t curve_point_pwm_store(struct device *dev, struct device_attribute *attr,
+				     const char *buf, size_t count)
+{
+	struct sensor_device_attribute_2 *sattr = to_sensor_dev_attr_2(attr);
+	struct dasharo_data *data = dev_get_drvdata(dev);
+	long val;
+	int err;
+
+	err = kstrtol(buf, 10, &val);
+	if (err)
+		return err;
+
+	if (val < 0 || val > 255)
+		return -EINVAL;
+
+	err = dasharo_curve_point_store(data, sattr->nr, "SFPD", sattr->index,
+				  DIV_ROUND_CLOSEST(val * 100, 255));
+	return err ?: count;
+}
+
+#define DASHARO_POINT_ATTRS(ch, pt) \
+	static SENSOR_DEVICE_ATTR_2_RW(pwm##ch##_auto_point##pt##_temp, curve_point_temp, \
+				       (ch) - 1, (pt) - 1); \
+	static SENSOR_DEVICE_ATTR_2_RW(pwm##ch##_auto_point##pt##_pwm, curve_point_pwm, \
+				       ch - 1, pt - 1)
+
+#define DASHARO_POINT_ATTR_PTRS(ch, pt) \
+	&sensor_dev_attr_pwm##ch##_auto_point##pt##_temp.dev_attr.attr, \
+	&sensor_dev_attr_pwm##ch##_auto_point##pt##_pwm.dev_attr.attr
+
+DASHARO_POINT_ATTRS(1, 1);
+DASHARO_POINT_ATTRS(1, 2);
+DASHARO_POINT_ATTRS(1, 3);
+DASHARO_POINT_ATTRS(1, 4);
+DASHARO_POINT_ATTRS(2, 1);
+DASHARO_POINT_ATTRS(2, 2);
+DASHARO_POINT_ATTRS(2, 3);
+DASHARO_POINT_ATTRS(2, 4);
+
+static struct attribute *dasharo_point_attrs[] = {
+	DASHARO_POINT_ATTR_PTRS(1, 1),
+	DASHARO_POINT_ATTR_PTRS(1, 2),
+	DASHARO_POINT_ATTR_PTRS(1, 3),
+	DASHARO_POINT_ATTR_PTRS(1, 4),
+	DASHARO_POINT_ATTR_PTRS(2, 1),
+	DASHARO_POINT_ATTR_PTRS(2, 2),
+	DASHARO_POINT_ATTR_PTRS(2, 3),
+	DASHARO_POINT_ATTR_PTRS(2, 4),
+	NULL
+};
+
+static umode_t dasharo_curve_point_is_visible(struct kobject *kobj, struct attribute *attr, int n)
+{
+	struct device *dev = kobj_to_dev(kobj);
+	struct dasharo_data *data = dev_get_drvdata(dev);
+	struct device_attribute *dattr = container_of(attr, struct device_attribute, attr);
+	int channel = to_sensor_dev_attr_2(dattr)->nr;
+
+	if (dasharo_fan_channel(data, DASHARO_FEATURE_FAN_POINTS, channel) < 0)
+		return 0;
+
+	return attr->mode;
+}
+
+static const struct attribute_group dasharo_point_group = {
+	.attrs = dasharo_point_attrs,
+	.is_visible = dasharo_curve_point_is_visible,
+};
+
+static const struct attribute_group *dasharo_groups[] = {
+	&dasharo_point_group,
+	NULL
+};
+
 static void dasharo_fill_feature_caps(struct dasharo_data *data, enum dasharo_feature feat)
 {
 	struct dasharo_capability *cap;
@@ -437,21 +604,37 @@ static int dasharo_probe(struct platform_device *pdev)
 {
 	struct dasharo_data *data;
 	struct device *hwmon;
+	int ret;
 
 	data = devm_kzalloc_obj(&pdev->dev, *data);
 	if (!data)
 		return -ENOMEM;
 	data->pdev = pdev;
+	platform_set_drvdata(pdev, data);
+
+	ret = devm_mutex_init(&pdev->dev, &data->curve_lock);
+	if (ret)
+		return ret;
 
 	for (unsigned int i = 0; i < DASHARO_FEATURE_MAX; ++i)
 		dasharo_fill_feature_caps(data, i);
 
 	hwmon = devm_hwmon_device_register_with_info(&pdev->dev, "dasharo_acpi", data,
-						     &dasharo_hwmon_chip_info, NULL);
+						     &dasharo_hwmon_chip_info, dasharo_groups);
 
 	return PTR_ERR_OR_ZERO(hwmon);
 }
 
+static void dasharo_shutdown(struct platform_device *pdev)
+{
+	struct dasharo_data *data = platform_get_drvdata(pdev);
+	u64 ret;
+
+	/* Let the firmware persist the fan curve the EC runs */
+	if (data->caps_found[DASHARO_FEATURE_FAN_POINTS])
+		acpi_evaluate_integer(ACPI_HANDLE(&pdev->dev), "SFCS", NULL, &ret);
+}
+
 static const struct acpi_device_id dasharo_device_ids[] = {
 	{"DSHR0001", 0},
 	{}
@@ -464,6 +647,7 @@ static struct platform_driver dasharo_driver = {
 		.acpi_match_table = dasharo_device_ids,
 	},
 	.probe = dasharo_probe,
+	.shutdown = dasharo_shutdown,
 };
 module_platform_driver(dasharo_driver);
 
-- 
2.56.0

