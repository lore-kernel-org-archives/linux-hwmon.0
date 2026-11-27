Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=46.105.41.146
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795769363;
	b=u+EN2zVXq7H18LQDD9+RAGOrBJa0tqSZazWG8wjsAxy2MKVODcMXL7M7pbsr+PscDDSR
	 kooUf/yAzngxBDeC6hhkpTyjaaZVpDF2qfBHGXiJNpo3QYtuLBvdIqaOdb/l+S8KG+DBw
	 bFsz0z1p84BlzVJ+1d0wpzoEdFbuxpAiDWvY6YnqQsucUpFBWCvyq7/Kx/t1WqYmfWYe8
	 Jat4piVSxGznYXXPKxG4o/jKEDsd6yHYeso6pwR3/avumeUVQNbLch3tUB0P4cVjOWgF/
	 rts/cdiG6QJDXldPu8OPuGHVVBYUCXfdNMtIAh5W6ObscPA6yEArb5emrYGi7hgqIpA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795769363;
	h=DMARC-Filter:Received:Received:Received:X-OVh-ClientIp:From:To:Cc:
	 Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Type:Content-Transfer-Encoding:x-ovh-tracer-id:X-VR-SPAMSTATE:
	 X-VR-SPAMSCORE:X-VR-SPAMCAUSE:DKIM-Signature;
	bh=2iTOgauixE1SrVQjE6H48KVFcuPrvMgZ33dnmWCt6iU=;
	b=SHGeDMZgRtNbwBduytH7+BdddbPbHZk6fQ8gzrmuGk5B8si5pZq4eDVYBc1GF2ISLNzW
	 Hcsw02aVOL5A4BULmJNz6skalUQC3AMtsrlRLw/lRkFCHsbfQhj5ytO8mf4p9NogQpgja
	 tUe14zsluhuLJrZ3nHYRCqxPtj+Vy98cUKUxKmVOp5P42pgDGQb9eKRyLSvY7wGY3wMjL
	 NQy99O3aCqQOZKcwf5gXqAktEurw7RmNXKdIp9EXHIApE5fyHYtV8nKPyRLXjaS4M3ULJ
	 l8GphXlHEH4sqtPagznAdUyOi4Ve4WR7OklfX/cC1m0ykzYkJ7ibHXEv7pHWcEEsnjA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=3mdeb.com;
	spf=pass smtp.mailfrom=3mdeb.com;
	dkim=pass header.d=3mdeb.com header.i=@3mdeb.com header.a=rsa-sha256 header.s=ovhmo3617313-selector1 header.b="EW2/4cEn";
	arc=none smtp.remote-ip=46.105.41.146
Received: from 1.mo575.mail-out.ovh.net (1.mo575.mail-out.ovh.net [46.105.41.146])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 60A0560A2601
	for <linux-hwmon@vger.kernel.org>; Fri, 27 Nov 2026 08:49:22 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 60A0560A2601
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=3mdeb.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=3mdeb.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=3mdeb.com header.i=@3mdeb.com header.a=rsa-sha256 header.s=ovhmo3617313-selector1 header.b=EW2/4cEn
Received: from director11.ghost.mail-out.ovh.net (unknown [10.110.58.102])
	by mo575.mail-out.ovh.net (Postfix) with ESMTP id 4jbRt25SXsz5xQc
	for <linux-hwmon@vger.kernel.org>; Fri, 27 Nov 2026 08:49:14 +0000 (UTC)
Received: from ghost-submission-7ccd8bbbb6-bntqx (unknown [10.110.113.124])
	by director11.ghost.mail-out.ovh.net (Postfix) with ESMTPS id 54A50C2A93;
	Fri, 27 Nov 2026 08:49:14 +0000 (UTC)
Received: from 3mdeb.com ([37.59.142.110])
	by ghost-submission-7ccd8bbbb6-bntqx with ESMTPSA
	id 3zMOCghECWtv1hQAXudyjw:T4
	(envelope-from <filip.golas@3mdeb.com>); Fri, 27 Nov 2026 08:49:14 +0000
Authentication-Results:garm.ovh; auth=pass (GARM-110S0043fa16766-6412-4683-93c0-cbf2752877c3,
                    2D78F170DE5B25267C595F1CD7CE4558A7ADEF44) smtp.auth=filip.golas@3mdeb.com
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
Subject: [PATCH v4 3/3] platform/x86: dasharo-acpi: Add EC fan curve support
Date: Fri, 27 Nov 2026 09:49:10 +0100
Message-ID: <20261127084910.3355833-4-filip.golas@3mdeb.com>
X-Mailer: git-send-email 2.56.0
In-Reply-To: <20261127084910.3355833-1-filip.golas@3mdeb.com>
References: <20261127084910.3355833-1-filip.golas@3mdeb.com>
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
x-ovh-tracer-id: 4902731147050545135
X-VR-SPAMSTATE: OK
X-VR-SPAMSCORE: -100
X-VR-SPAMCAUSE: dmFkZTFsEQAQBFd+fSrKPc87W4qyxtDOX4Ia7v5mH48z8xifNPMuEGM+Xvja5iSRksk35MoI1WxBXYrHghfjLWE4V53sUu2yeeiVOfPQ19gxPIRBqwfc/1pZFW1Yx6Y7mjOcJDJOytOIcsZHHQrB/EzF/dEp6CjhpNy2hGpFQPy9WcNlfWG0Woim4PtT7jNEglYSBz4gFXnhNTVEVcXn3fLl7SiqYl+pPGX0wof28JNoltiFXW8TxY+ZCnkyOVx2EYwXBCPToH23W86P5o37MdnG0Y/lH3LEIRCXNnKTviw1mW0phWslBkoyTtwUCFfLF5gCfpuqaEzZ/nUhlvLuonsDWWr2maEsh/LjdYgwfOB/7QNHT2htva72WoALN01YsTDE7xUceGjvPK9aUqGyQvxsJHOqYQYw/MKLa6b1/Tt3brn77GJIF3qqqT5PnUxxeiSIF5le/EqSQfS3kiZJuVFRYMC8LycyskNftSridnz4TFLuYjj8nCRPBfvP0vkquUV/SkrLbNtzkiwUssZRQDvNrX6TfvXq1Ko+DOkjDKXo+V9KM93n/1gwGlhk/q0e5AiGBpE2XohddhQMd8Th5kq8Uhe+KuM/rRtduHozmBtlXjmC7LAJW42oyfdyhdiLlMOp1NcC8240PiDBlx+SLGbkyLknXcmiLflCyQq+PMo/89pnNw
DKIM-Signature: a=rsa-sha256; bh=2iTOgauixE1SrVQjE6H48KVFcuPrvMgZ33dnmWCt6iU=;
 c=relaxed/relaxed; d=3mdeb.com; h=From; s=ovhmo3617313-selector1;
 t=1795769354; v=1;
 b=EW2/4cEnJGRLB5wTY7ajYREy87jRJGdy3Gk8NmmPCOdO0V3RuLimyWv2lEaXXBEY7lGhrCkj
 yl7me5uAN9yLWDtQ04DR6FFAk3eTG6o2i5HAv977buR6OhFFB3ReZ7LgY9tpch6Zf6Zm5kZ6767
 32e/S298ciqidjo+sT2S279i7yOUeoqjCqRGzT/rr6R8VPfYe8kGg3PeTTqlgLjtdpS4gIDV/IY
 7ebSiDQVizSgU30LVZ9GWQyKWM6KQkFzVqxGqN3DmpyBnN9trYo0Fp/fsFK5fTMogc6w2b0II9g
 bDa/m+w46urr14HBY8LNj3Wh87sRqqWGgwp8ErAe4Lr7Q==

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

Changes in v3:
- Fix inconsistent use of parentheses in DASHARO_POINT_ATTRS macro
- Create curve point attributes for all 24 PWM channels
- Use DIV_ROUND_CLOSEST for temperature unit conversion
- Use hwmon_lock instead of a private mutex

Changes in v4:
- Remove variable that became unused in v3 in dasharo_probe
- Fix incomplete creation of point attributes for PWM channels 3-24
- Fix possible overflows in curve_point_temp_store after using DIV_ROUND_CLOSEST
---
 drivers/platform/x86/dasharo-acpi.c | 227 +++++++++++++++++++++++++++-
 1 file changed, 226 insertions(+), 1 deletion(-)

diff --git a/drivers/platform/x86/dasharo-acpi.c b/drivers/platform/x86/dasharo-acpi.c
index 85f88b11fcf9..ebbd9b7c8979 100644
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
@@ -407,6 +409,217 @@ static const struct hwmon_chip_info dasharo_hwmon_chip_info = {
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
+	guard(hwmon_lock)(dev);
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
+	if (val < 0 || val > U8_MAX * MILLIDEGREE_PER_DEGREE)
+		return -EINVAL;
+
+	val = DIV_ROUND_CLOSEST(val, MILLIDEGREE_PER_DEGREE);
+
+	guard(hwmon_lock)(dev);
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
+	guard(hwmon_lock)(dev);
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
+	guard(hwmon_lock)(dev);
+
+	err = dasharo_curve_point_store(data, sattr->nr, "SFPD", sattr->index,
+					DIV_ROUND_CLOSEST(val * 100, 255));
+	return err ?: count;
+}
+
+#define DASHARO_POINT_ATTR(ch, pt) \
+	static SENSOR_DEVICE_ATTR_2_RW(pwm##ch##_auto_point##pt##_temp, curve_point_temp, \
+				       (ch) - 1, (pt) - 1); \
+	static SENSOR_DEVICE_ATTR_2_RW(pwm##ch##_auto_point##pt##_pwm, curve_point_pwm, \
+				       (ch) - 1, (pt) - 1)
+
+#define DASHARO_POINT_ATTR_PTRS(ch, pt) \
+	&sensor_dev_attr_pwm##ch##_auto_point##pt##_temp.dev_attr.attr, \
+	&sensor_dev_attr_pwm##ch##_auto_point##pt##_pwm.dev_attr.attr
+
+#define DASHARO_POINT_ATTRS(ch) \
+	DASHARO_POINT_ATTR(ch, 1); \
+	DASHARO_POINT_ATTR(ch, 2); \
+	DASHARO_POINT_ATTR(ch, 3); \
+	DASHARO_POINT_ATTR(ch, 4)
+
+#define DASHARO_CHANNEL_PTRS(ch) \
+	DASHARO_POINT_ATTR_PTRS(ch, 1), \
+	DASHARO_POINT_ATTR_PTRS(ch, 2), \
+	DASHARO_POINT_ATTR_PTRS(ch, 3), \
+	DASHARO_POINT_ATTR_PTRS(ch, 4)
+
+DASHARO_POINT_ATTRS(1);
+DASHARO_POINT_ATTRS(2);
+DASHARO_POINT_ATTRS(3);
+DASHARO_POINT_ATTRS(4);
+DASHARO_POINT_ATTRS(5);
+DASHARO_POINT_ATTRS(6);
+DASHARO_POINT_ATTRS(7);
+DASHARO_POINT_ATTRS(8);
+DASHARO_POINT_ATTRS(9);
+DASHARO_POINT_ATTRS(10);
+DASHARO_POINT_ATTRS(11);
+DASHARO_POINT_ATTRS(12);
+DASHARO_POINT_ATTRS(13);
+DASHARO_POINT_ATTRS(14);
+DASHARO_POINT_ATTRS(15);
+DASHARO_POINT_ATTRS(16);
+DASHARO_POINT_ATTRS(17);
+DASHARO_POINT_ATTRS(18);
+DASHARO_POINT_ATTRS(19);
+DASHARO_POINT_ATTRS(20);
+DASHARO_POINT_ATTRS(21);
+DASHARO_POINT_ATTRS(22);
+DASHARO_POINT_ATTRS(23);
+DASHARO_POINT_ATTRS(24);
+
+static struct attribute *dasharo_point_attrs[] = {
+	DASHARO_CHANNEL_PTRS(1),
+	DASHARO_CHANNEL_PTRS(2),
+	DASHARO_CHANNEL_PTRS(3),
+	DASHARO_CHANNEL_PTRS(4),
+	DASHARO_CHANNEL_PTRS(5),
+	DASHARO_CHANNEL_PTRS(6),
+	DASHARO_CHANNEL_PTRS(7),
+	DASHARO_CHANNEL_PTRS(8),
+	DASHARO_CHANNEL_PTRS(9),
+	DASHARO_CHANNEL_PTRS(10),
+	DASHARO_CHANNEL_PTRS(11),
+	DASHARO_CHANNEL_PTRS(12),
+	DASHARO_CHANNEL_PTRS(13),
+	DASHARO_CHANNEL_PTRS(14),
+	DASHARO_CHANNEL_PTRS(15),
+	DASHARO_CHANNEL_PTRS(16),
+	DASHARO_CHANNEL_PTRS(17),
+	DASHARO_CHANNEL_PTRS(18),
+	DASHARO_CHANNEL_PTRS(19),
+	DASHARO_CHANNEL_PTRS(20),
+	DASHARO_CHANNEL_PTRS(21),
+	DASHARO_CHANNEL_PTRS(22),
+	DASHARO_CHANNEL_PTRS(23),
+	DASHARO_CHANNEL_PTRS(24),
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
@@ -442,16 +655,27 @@ static int dasharo_probe(struct platform_device *pdev)
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
+		acpi_evaluate_integer(ACPI_HANDLE(&pdev->dev), "SFCS", NULL, &ret);
+}
+
 static const struct acpi_device_id dasharo_device_ids[] = {
 	{"DSHR0001", 0},
 	{}
@@ -464,6 +688,7 @@ static struct platform_driver dasharo_driver = {
 		.acpi_match_table = dasharo_device_ids,
 	},
 	.probe = dasharo_probe,
+	.shutdown = dasharo_shutdown,
 };
 module_platform_driver(dasharo_driver);
 
-- 
2.56.0

