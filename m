Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=87.98.150.175
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794555897;
	b=whDuAMMzmfAoR0G7jADhX3it5iBtX2Hn8UFvBb8Tsjm6W6LF6KihXQj64DkdTDnCUVOU
	 njFLogLR+K1h5ztG68uWpT0Mr5kNDFs1LQ4n9TcMl5OT7Z9tCylpKRbRQtBm72nZ30PH3
	 YpA7ipKI3lZUW5oS1TOxJ1qZfRkEmIN+HnoeXDfFmR3TIlmGdIC7rA+xMup+Q40cZ5Aar
	 7er66RZcqNiHN8PvCDUFpfJIjCBSmR0DdD56q44bhKkp7XRpqEQXHsXY9KXsYkQ+CHEoK
	 /gsjE/PYgclzyXk/GcCw9ZtDbWESwWRyT2Iph8QFCkXUuF0W69SMURVrZwBvlFP5ARQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794555897;
	h=DMARC-Filter:Received:Received:Received:X-OVh-ClientIp:From:To:Cc:
	 Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Type:Content-Transfer-Encoding:x-ovh-tracer-id:X-VR-SPAMSTATE:
	 X-VR-SPAMSCORE:X-VR-SPAMCAUSE:DKIM-Signature;
	bh=I6NQHNIrOREz+LL53sawxYWAYz0PghEBcXdBCvTu60M=;
	b=peyHk0xIpPd6ZXe5PFjMV33rGwvnrFHh3V54pjaiUpXSrv1tZWfK91N5Es2jbwHgpDto
	 lt/JGpln11bZZdaTfk1nzslFBqlGjOaafHWS2XeU4qfOPeUlIZRqhyEzGK1SLf+sj5BkW
	 Awpytok7m9dhhhQAHpPpAXIHPcSkXzDscOWMW/knWZcbE0xai7uaEaBrsg17Lfb8/J8Kp
	 nQXrTJR46u3ORT7NwIEQcZVngN5RZKZFEhcimUHvqZI/b6UEQ2/RQOQzh4/ye2zlysQ9F
	 bg0kgV8v4cpLel3eDloSev/+RUxdMWjW0O95g8QwK/MiPkHT0XOWrDHncgnoGIV2SZA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=3mdeb.com;
	spf=pass smtp.mailfrom=3mdeb.com;
	dkim=pass header.d=3mdeb.com header.i=@3mdeb.com header.a=rsa-sha256 header.s=ovhmo3617313-selector1 header.b=RIzAUR3U;
	arc=none smtp.remote-ip=87.98.150.175
Received: from 13.mo581.mail-out.ovh.net (13.mo581.mail-out.ovh.net [87.98.150.175])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 59337606A88C
	for <linux-hwmon@vger.kernel.org>; Fri, 13 Nov 2026 07:44:56 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 59337606A88C
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=3mdeb.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=3mdeb.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=3mdeb.com header.i=@3mdeb.com header.a=rsa-sha256 header.s=ovhmo3617313-selector1 header.b=RIzAUR3U
Received: from director8.ghost.mail-out.ovh.net (unknown [10.110.54.164])
	by mo581.mail-out.ovh.net (Postfix) with ESMTP id 4jQq692cP9z62XV
	for <linux-hwmon@vger.kernel.org>; Fri, 13 Nov 2026 07:44:49 +0000 (UTC)
Received: from ghost-submission-7ccd8bbbb6-cl275 (unknown [10.108.42.118])
	by director8.ghost.mail-out.ovh.net (Postfix) with ESMTPS id 3F3DBC012D;
	Fri, 13 Nov 2026 07:44:48 +0000 (UTC)
Received: from 3mdeb.com ([37.59.142.109])
	by ghost-submission-7ccd8bbbb6-cl275 with ESMTPSA
	id Hrv+B+u/9mr5jjgAjijQbg:T4
	(envelope-from <filip.golas@3mdeb.com>); Fri, 13 Nov 2026 07:44:48 +0000
Authentication-Results:garm.ovh; auth=pass (GARM-109S0039e8f4dc2-aa38-4e0f-9dbe-5b7c469e15a9,
                    F6EB7A3E9421D9EE3A955D9585EDAC62A977302C) smtp.auth=filip.golas@3mdeb.com
X-OVh-ClientIp:37.47.248.243
From: =?UTF-8?q?Filip=20Go=C5=82a=C5=9B?= <filip.golas@3mdeb.com>
To: =?UTF-8?q?Micha=C5=82=20Kope=C4=87?= <michal.kopec@3mdeb.com>,
	Hans de Goede <hansg@kernel.org>,
	=?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>
Cc: platform-driver-x86@vger.kernel.org,
	linux-hwmon@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Guenter Roeck <linux@roeck-us.net>,
	=?UTF-8?q?Filip=20Go=C5=82a=C5=9B?= <filip.golas@3mdeb.com>
Subject: [PATCH 3/3] platform/x86: dasharo-acpi: Add EC fan curve support
Date: Fri, 13 Nov 2026 08:43:47 +0100
Message-ID: <20261113074347.2301465-4-filip.golas@3mdeb.com>
X-Mailer: git-send-email 2.56.0
In-Reply-To: <20261113074347.2301465-1-filip.golas@3mdeb.com>
References: <20261113074347.2301465-1-filip.golas@3mdeb.com>
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
x-ovh-tracer-id: 13830835932285235183
X-VR-SPAMSTATE: OK
X-VR-SPAMSCORE: -100
X-VR-SPAMCAUSE: dmFkZTFlXx8+5JEVtbgskvn0mQwqwMiiUHVSJhKYYHJKacS3OogXmGYQzZSvElqTpv7MA26TfMZE1aPnucRMMWpnPSw7cwpUpV9rYonc9FqEtY61eI5P65EfaAQB/GOcsu7ZjW2myG0aC1gnunV1nnjJBGnnAsK0TkmGoLJIuPsr4F4fA2qwl88bGdgsMxS7EVKZg43uq6VXwrzV2kFOSXfG7oTtmCSoBgXxZoCX4RzDSQ9QvszATqN7V42JtdM/TvGtGIkflSyaaIIY+NgpBUKDrAdUM3dRwZpsTnxNDPnyiOSSBb0tAL7kcmZZYphQ1Sf8nd69ZMtjv5V27+oqMmiRpQ/8l7Yz9GJNh8aZTI5ZvGqjdbKbFb2aD45SOQiOymIry2En2PhI8pFzCbFu0ussVEvyZ/bY2mtiPl/7ZpBzKtNRCt/vg0G1ZGvcreQfoWZ9FBdso/Wl0DyFtLiou+NUIyAhgn5EKQwdhlDPnpAd6o2dJQlxc5RS69Bh5jvOOkye30o/NadTY2wXCSn/UQEErem1DqAyao6jHRmWcaB+CJbM7VrkYKjCYa2K9fhxpYpa1lt/fD9AaVUXQCPJouP+HjPdiSAOgDBU0yRZhzAuhjX1XwpP/mllXeiRJk31ok0E3VAQuQKqV8wLQigDNt/yBBp4NhDwbngG4a/tSrV8GPV+Qg
DKIM-Signature: a=rsa-sha256; bh=I6NQHNIrOREz+LL53sawxYWAYz0PghEBcXdBCvTu60M=;
 c=relaxed/relaxed; d=3mdeb.com; h=From; s=ovhmo3617313-selector1;
 t=1794555889; v=1;
 b=RIzAUR3UoBbnp8q1sX9Ws4bkkmDfZFokSs9Pmbjo1DFJTdB4mG6mqYzyJBpSK8M1zM/QbQU8
 6piFdBT8t9QWEFkfJB0n6E0mezqyRHlOiaoQXkEOTyeFRkq/QXDheh0/rEsYzMQwZMdTGeDLHiS
 XgDnSixq22quVAyIApqj6cDntxxpnWIPVx4MNV+umsashnbsVcp7wQIyutZEQeoIgQXxl38NsSI
 qauXbLrbpk12Ehc9UL+D3pYTKXpWKeNjfc0Imikv0dspXDbmKIGEtqzd76oNZIgpMqsItWJ7//q
 mVVSNQY/IiFsMqLb0n5XNQakGZ2Mb4eZcwAWjxz5HIrvw==

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
 drivers/platform/x86/dasharo-acpi.c | 160 +++++++++++++++++++++++++++-
 1 file changed, 159 insertions(+), 1 deletion(-)

diff --git a/drivers/platform/x86/dasharo-acpi.c b/drivers/platform/x86/dasharo-acpi.c
index 29afcf78564c..7b21577158cb 100644
--- a/drivers/platform/x86/dasharo-acpi.c
+++ b/drivers/platform/x86/dasharo-acpi.c
@@ -6,6 +6,8 @@
 #include <linux/acpi.h>
 #include <linux/array_size.h>
 #include <linux/hwmon.h>
+#include <linux/hwmon-sysfs.h>
+#include <linux/kstrtox.h>
 #include <linux/module.h>
 #include <linux/platform_device.h>
 #include <linux/types.h>
@@ -378,6 +380,150 @@ static const struct hwmon_chip_info dasharo_hwmon_chip_info = {
 	.info = dasharo_hwmon_info,
 };
 
+static int dasharo_curve_point_store(struct dasharo_data *data, int channel, const char *method,
+				     unsigned int point, u64 value)
+{
+	u64 args[2] = { point, value };
+	u64 ret;
+	int err;
+
+	// set of temp/duty
+	err = dasharo_call(data, method, DASHARO_FEATURE_FAN_POINTS, channel, args, 2, &ret);
+	if (err)
+		return err;
+	if (ret)
+		return -EPERM;
+
+	// commit
+	err = dasharo_call(data, "CFCV", DASHARO_FEATURE_FAN_POINTS, channel, NULL, 0, &ret);
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
+	err = dasharo_call(data, "GFPT", DASHARO_FEATURE_FAN_POINTS, sattr->nr, &point, 1, &val);
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
+	val /= MILLIDEGREE_PER_DEGREE;
+	if (val < 0 || val > U8_MAX)
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
+	err = dasharo_call(data, "GFPD", DASHARO_FEATURE_FAN_POINTS, sattr->nr, &point, 1, &val);
+	if (err)
+		return err;
+
+	return sysfs_emit(buf, "%llu\n", DIV_ROUND_CLOSEST(val * 255, 100));
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
+	SENSOR_DEVICE_ATTR_2_RW(pwm##ch##_auto_point##pt##_temp, curve_point_temp, \
+				(ch) - 1, (pt) - 1); \
+	SENSOR_DEVICE_ATTR_2_RW(pwm##ch##_auto_point##pt##_pwm, curve_point_pwm, \
+				ch - 1, pt - 1)
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
+	return channel < data->caps_found[DASHARO_FEATURE_FAN_POINTS] ? attr->mode : 0;
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
@@ -413,16 +559,27 @@ static int dasharo_probe(struct platform_device *pdev)
 	if (!data)
 		return -ENOMEM;
 	data->pdev = pdev;
+	platform_set_drvdata(pdev, data);
 
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
+		dasharo_call(data, "SFCS", DASHARO_FEATURE_FAN_POINTS, 0, NULL, 0, &ret);
+}
+
 static const struct acpi_device_id dasharo_device_ids[] = {
 	{"DSHR0001", 0},
 	{}
@@ -435,6 +592,7 @@ static struct platform_driver dasharo_driver = {
 		.acpi_match_table = dasharo_device_ids,
 	},
 	.probe = dasharo_probe,
+	.shutdown = dasharo_shutdown,
 };
 module_platform_driver(dasharo_driver);
 
-- 
2.56.0

