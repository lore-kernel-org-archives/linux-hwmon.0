Received: from smtpbgau2.qq.com (smtpbgau2.qq.com [54.206.34.216])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7323C469831;
	Mon, 31 Aug 2026 15:11:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=54.206.34.216
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788189083; cv=none; b=kaEU+SkUvRbpC4Y5t16z4wHIjaOdRdd3tUOg+k9ZNpUz4Dqsni+bKzSZ11YvS5XIhbx1dcspA1OP28qPHrRRbBaY6WF4sexuR5+Pz8rk8UImj5d4qsyJ6bNZiETYT82vVYAFFU4rwNPJ4bfZcMHfcIN3oOH+RwpUvq5xamZ8xBs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788189083; c=relaxed/simple;
	bh=KR5zIC9MjS9KDL+E3J1GN63LF/NOwojJqczy6h31rWo=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=p1d4GJNZude4IaNZ97A0S1V4zB/jON1ed7oEeo/UCUbp5+JejPJKu1NmIoSKz1QwOiQPyVE3qfKDjxaGclDidIZ3bUn289gxkrTEAJ5orX9u82k/oQy5gWlLPoeLD7l87oqaDC8w5ArSE1xRCoPkf5fwybnEYbLckIlsYLn/9Qs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=radxa.com; spf=pass smtp.mailfrom=radxa.com; arc=none smtp.client-ip=54.206.34.216
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=radxa.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=radxa.com
X-QQ-mid: zesmtpip2t1788188985tad3ad028
X-QQ-Originating-IP: +93kN03FFqH1G4SnEf9Z7LhYXbcRYqmYq0ZGb7jdsFw=
Received: from [192.168.30.32] ( [localhost])
	by bizesmtp.qq.com (ESMTP) with 
	id ; Mon, 31 Aug 2026 23:09:43 +0800 (CST)
X-QQ-SSF: 0000000000000000000000000000000
X-QQ-GoodBg: 0
X-BIZMAIL-ID: 5458043899803403433
EX-QQ-RecipientCnt: 13
From: Xilin Wu <sophon@radxa.com>
Date: Mon, 31 Aug 2026 23:09:33 +0800
Subject: [PATCH 2/2] platform: arm64: radxa-svc: Add hwmon sensors
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260831-radxa-svc-v1-2-7c028de6a387@radxa.com>
References: <20260831-radxa-svc-v1-0-7c028de6a387@radxa.com>
In-Reply-To: <20260831-radxa-svc-v1-0-7c028de6a387@radxa.com>
To: Guenter Roeck <linux@roeck-us.net>, Jonathan Corbet <corbet@lwn.net>, 
 Shuah Khan <skhan@linuxfoundation.org>, 
 Randy Dunlap <rdunlap@infradead.org>, Hans de Goede <hansg@kernel.org>, 
 =?utf-8?q?Ilpo_J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>, 
 Bryan O'Donoghue <bryan.odonoghue@linaro.org>
Cc: linux-hwmon@vger.kernel.org, linux-doc@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org, 
 platform-driver-x86@vger.kernel.org, Xilin Wu <sophon@radxa.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=17010; i=sophon@radxa.com;
 h=from:subject:message-id; bh=KR5zIC9MjS9KDL+E3J1GN63LF/NOwojJqczy6h31rWo=;
 b=owGbwMvMwCVmdFg0fe08Iz/G02pJDFlTZxrFnNaMr0/Yn2f2N3r3zmnzr+udFd6p4b5pVpTRB
 Xet42x3OkpZGMS4GGTFFFkU4hnmslfmXnsqVqoHM4eVCWQIAxenAEyERY/hf7aSfZbWqWkJW+9Z
 RkS2hqxraKm24DMJ57pxpO21tED5G4b/QfMz8t13Tl/EOlVVgfe8Rl3FWTvRxjmnDuXdur3mvOo
 ePgA=
X-Developer-Key: i=sophon@radxa.com; a=openpgp;
 fpr=205F009D07796DD6E516752E32C31567AD9E324E
X-QQ-SENDSIZE: 520
Feedback-ID: zesmtpip:radxa.com:qybglogicsvrsz:qybglogicsvrsz3b-0
X-QQ-XMAILINFO: NlVgJxuVJf8S399MKbIkmeXMujjosvqWQB68gAWE7fOCITBRlBv96zTJ
	1Gzd10Z63PfsxWLE0o8nkn90N5gSi+nVvBoyevgvWA4Y69S7V2We2IP56GpWKQJ25b0Bikp
	DGiKymmZPygBvFK3WqyhnDEw5UMqrs99pbwrZllca+lnwTTbVw5+5kcJ+YXE6Kkzsi84gko
	7OewwvFZBbaqoRG4Zt4f1VB13jm/aIeJKMTzUlGyBZQFtBE/jxlcxOYEq2/YcPJKG8FyW2n
	VQNraP5xJJac311DN1qluHK9k0pAAX/leR/yav6FaCBaoJ5a/2FHB4jx2ExmkcG/rEKk9NC
	99O5KHw9loiXSlG1Ho/5WsAY34/CLYouolcpm2fPLUSrFeHpHD7qD3sNtuaTFjp3QBQoIR2
	fjzWkSkS8ytCUJe1jT6WPlE/WT5bN59pmE2qiOWuZ7jTRXkDhnJ4ODpV7o0JwFY9NqtJ+k6
	33KC5Y/5AVQ4IVrOClL09oabot4XaKZPPudu2CFauH1aGfBODvlUmkcGs8A/upPVvMaHJcE
	w0MXXrtDkWvfsj62v6DWLRAFfCwHPZfhNmAMogb1BRBfZYPtZN63eIm6aRQeqqKf0e923gd
	WGkKOuZUWnXtrALKtfz9Ld3L9JmNPKNXE3DuBoumoiw/MWi6758Ywrr/yMe8s7rS9hKk5E+
	5lLP9wG/JPLqfqV7TH4EFGVBTmj8Ia6HCY+i24G1u5aoQTDHcioIHKLV5BdGqGZaFZCRc3X
	w0WdChHVGs+93HtnXJTge1CRzIzdy3JQqUy8kvRrSXkXxhCdCQoDAnrTNcvWenpYuebTIiz
	AajZ5D6zxAVkhL1G3KGvpnZGyYES8QNSldghVWahj9w8wi7CGp9lZvNIixiyVv2eIXD0x8R
	UlOn9+XJO0URU9+/xCSTbLgvCGNkKtc7JDfrxMMT1EvqXllgnvRoICEPvJmGZzWyOleniEP
	c6AcE+E5Dld5ica2SXjV/Aqv5xymAbDXkrMnerLphjX1B0nwrfx6gF0UpsuDD0OGONtrKYU
	oyXhdbvXyF2MO1BiQzJ7XOBAOBx2iP4QyQR5xt4tTEpzfgFYwMAiXMHAPUzn8=
X-QQ-XMRINFO: MPJ6Tf5t3I/ylTmHUqvI8+Wpn+Gzalws3A==
X-QQ-RECHKSPAM: 0

Add support for the optional sensor discovery and sampling operations.
Expose firmware temperature, voltage, current, and combined sensors as
read-only hwmon devices.

Validate firmware descriptors and samples, cache complete readings, and
calculate power for combined voltage and current sensors.

Signed-off-by: Xilin Wu <sophon@radxa.com>
---
 Documentation/hwmon/radxa-svc-glink.rst  |  11 +-
 drivers/platform/arm64/Kconfig           |   4 +-
 drivers/platform/arm64/radxa_svc_glink.c | 470 +++++++++++++++++++++++++++++++
 3 files changed, 482 insertions(+), 3 deletions(-)

diff --git a/Documentation/hwmon/radxa-svc-glink.rst b/Documentation/hwmon/radxa-svc-glink.rst
index c464b130a4e4..99750a1f876e 100644
--- a/Documentation/hwmon/radxa-svc-glink.rst
+++ b/Documentation/hwmon/radxa-svc-glink.rst
@@ -8,7 +8,8 @@ Description
 
 The Radxa SVC GLINK driver communicates with the ``RADXA_SVC_ADSP_APPS``
 firmware service found on supported Radxa boards with Qualcomm SoCs. The
-firmware provides fan control.
+firmware provides fan control and dynamically discoverable temperature,
+voltage, current, and power sensors.
 
 Fan control
 -----------
@@ -30,3 +31,11 @@ The supported ``pwm1_enable`` values are:
 
 When manual mode is selected, the driver starts with the current fan speed. If
 the current speed cannot be determined, it starts at full speed.
+
+Sensors
+-------
+
+Each sensor discovered through the firmware service is registered as a
+separate hwmon device. Depending on the sensor type, it exposes the standard
+``temp1_input``, ``in0_input``, ``curr1_input``, and ``power1_input``
+attributes and their corresponding labels.
diff --git a/drivers/platform/arm64/Kconfig b/drivers/platform/arm64/Kconfig
index 60c1e541fe89..c4e70a3c5089 100644
--- a/drivers/platform/arm64/Kconfig
+++ b/drivers/platform/arm64/Kconfig
@@ -111,8 +111,8 @@ config RADXA_SVC_GLINK
 	help
 	  Enable support for the Radxa SVC firmware service found on supported
 	  Radxa boards using Qualcomm SoCs. The driver communicates with the
-	  RADXA_SVC_ADSP_APPS service over rpmsg and exposes fan control through
-	  the standard hwmon interface.
+	  RADXA_SVC_ADSP_APPS service over rpmsg and exposes fan control and
+	  sensor readings through the standard hwmon interface.
 
 	  Say M or Y here to include this support.
 
diff --git a/drivers/platform/arm64/radxa_svc_glink.c b/drivers/platform/arm64/radxa_svc_glink.c
index 1c91bfabcd12..b2a4f0c5317a 100644
--- a/drivers/platform/arm64/radxa_svc_glink.c
+++ b/drivers/platform/arm64/radxa_svc_glink.c
@@ -10,6 +10,7 @@
 #include <linux/hwmon.h>
 #include <linux/jiffies.h>
 #include <linux/kernel.h>
+#include <linux/limits.h>
 #include <linux/minmax.h>
 #include <linux/module.h>
 #include <linux/mutex.h>
@@ -31,6 +32,8 @@
 #define RADXA_SVC_OP_FAN_GET_STATE	0x50
 #define RADXA_SVC_OP_FAN_SET_CONTROL	0x51
 #define RADXA_SVC_OP_FAN_GET_CONTROL	0x52
+#define RADXA_SVC_OP_SENSOR_LIST		0x60
+#define RADXA_SVC_OP_SENSOR_READ		0x61
 
 #define RADXA_SVC_PROFILE_QUIET		0
 #define RADXA_SVC_PROFILE_PERFORMANCE	1
@@ -48,11 +51,29 @@
 #define RADXA_SVC_CAP_PROFILE		BIT(1)
 #define RADXA_SVC_CAP_FANCTL		BIT(5)
 #define RADXA_SVC_CAP_FANCTL_CTRL	BIT(6)
+#define RADXA_SVC_CAP_SENSORS		BIT(7)
 
 #define RADXA_SVC_REQUIRED_CAPS		(RADXA_SVC_CAP_PROFILE | \
 					 RADXA_SVC_CAP_FANCTL | \
 					 RADXA_SVC_CAP_FANCTL_CTRL)
 
+#define RADXA_SVC_SENSOR_MAX_SENSORS	64
+#define RADXA_SVC_SENSOR_NAME_LEN	32
+#define RADXA_SVC_SENSOR_PAGE_MAX	5
+#define RADXA_SVC_SENSOR_CACHE_TIME	msecs_to_jiffies(50)
+
+#define RADXA_SVC_SENSOR_TEMP		1
+#define RADXA_SVC_SENSOR_VOLTAGE		2
+#define RADXA_SVC_SENSOR_CURRENT		3
+#define RADXA_SVC_SENSOR_VOLTAGE_CURRENT	4
+
+#define RADXA_SVC_SENSOR_VALID_TEMP	BIT(0)
+#define RADXA_SVC_SENSOR_VALID_VOLTAGE	BIT(1)
+#define RADXA_SVC_SENSOR_VALID_CURRENT	BIT(2)
+#define RADXA_SVC_SENSOR_VALID_MASK	(RADXA_SVC_SENSOR_VALID_TEMP | \
+					 RADXA_SVC_SENSOR_VALID_VOLTAGE | \
+					 RADXA_SVC_SENSOR_VALID_CURRENT)
+
 struct radxa_svc_hdr {
 	__le32 magic;
 	__le16 version;
@@ -100,10 +121,57 @@ struct radxa_svc_fan_control_resp {
 	__le32 manual_pwm;
 } __packed;
 
+struct radxa_svc_sensor_list_req {
+	__le32 start_index;
+	__le32 max_entries;
+} __packed;
+
+struct radxa_svc_sensor_desc {
+	__le32 sensor_id;
+	__le32 sensor_type;
+	char name[RADXA_SVC_SENSOR_NAME_LEN];
+} __packed;
+
+struct radxa_svc_sensor_list_resp {
+	__le32 total_count;
+	__le32 returned_count;
+	struct radxa_svc_sensor_desc entries[];
+} __packed;
+
+struct radxa_svc_sensor_read_req {
+	__le32 sensor_id;
+} __packed;
+
+struct radxa_svc_sensor_read_resp {
+	__le32 sensor_id;
+	__le32 valid_mask;
+	__le32 temp_millic;
+	__le32 voltage_mv;
+	__le32 current_ma;
+} __packed;
+
+struct radxa_svc_glink;
+
+struct radxa_svc_sensor {
+	struct radxa_svc_glink *svc;
+	struct device *hwmon_dev;
+	struct mutex cache_lock; /* protects cached sample fields */
+	unsigned long last_updated;
+	u32 sensor_id;
+	u32 sensor_type;
+	char name[RADXA_SVC_SENSOR_NAME_LEN];
+	s32 temp_millic;
+	s32 voltage_mv;
+	s64 current_ma;
+	bool cache_valid;
+};
+
 struct radxa_svc_glink {
 	struct device *dev;
 	struct rpmsg_device *rpdev;
 	struct device *hwmon_dev;
+	struct radxa_svc_sensor *sensors;
+	u32 num_sensors;
 
 	struct mutex xfer_lock; /* serializes request/response transactions */
 	struct mutex fan_lock; /* serializes multi-request fan configuration */
@@ -428,6 +496,403 @@ static int radxa_svc_rpmsg_callback(struct rpmsg_device *rpdev, void *data,
 	return 0;
 }
 
+static u32 radxa_svc_sensor_expected_mask(u32 sensor_type)
+{
+	switch (sensor_type) {
+	case RADXA_SVC_SENSOR_TEMP:
+		return RADXA_SVC_SENSOR_VALID_TEMP;
+	case RADXA_SVC_SENSOR_VOLTAGE:
+		return RADXA_SVC_SENSOR_VALID_VOLTAGE;
+	case RADXA_SVC_SENSOR_CURRENT:
+		return RADXA_SVC_SENSOR_VALID_CURRENT;
+	case RADXA_SVC_SENSOR_VOLTAGE_CURRENT:
+		return RADXA_SVC_SENSOR_VALID_VOLTAGE |
+		       RADXA_SVC_SENSOR_VALID_CURRENT;
+	default:
+		return 0;
+	}
+}
+
+static int radxa_svc_sensor_update(struct radxa_svc_sensor *sensor)
+{
+	struct radxa_svc_sensor_read_req req;
+	struct radxa_svc_sensor_read_resp resp = {};
+	unsigned long cache_expires;
+	u32 expected_mask;
+	u32 valid_mask;
+	size_t len = sizeof(resp);
+	int ret;
+
+	mutex_lock(&sensor->cache_lock);
+
+	cache_expires = sensor->last_updated + RADXA_SVC_SENSOR_CACHE_TIME;
+	if (sensor->cache_valid && time_before(jiffies, cache_expires)) {
+		ret = 0;
+		goto out_unlock;
+	}
+
+	req.sensor_id = cpu_to_le32(sensor->sensor_id);
+	ret = radxa_svc_request(sensor->svc, RADXA_SVC_OP_SENSOR_READ,
+				&req, sizeof(req), &resp, &len);
+	if (ret)
+		goto out_unlock;
+
+	if (len != sizeof(resp) ||
+	    le32_to_cpu(resp.sensor_id) != sensor->sensor_id) {
+		ret = -EPROTO;
+		goto out_unlock;
+	}
+
+	valid_mask = le32_to_cpu(resp.valid_mask);
+	expected_mask = radxa_svc_sensor_expected_mask(sensor->sensor_type);
+	if ((valid_mask & RADXA_SVC_SENSOR_VALID_MASK) != expected_mask ||
+	    valid_mask & ~RADXA_SVC_SENSOR_VALID_MASK) {
+		ret = -EPROTO;
+		goto out_unlock;
+	}
+
+	sensor->temp_millic = (s32)le32_to_cpu(resp.temp_millic);
+	sensor->voltage_mv = (s32)le32_to_cpu(resp.voltage_mv);
+	sensor->current_ma = (s32)le32_to_cpu(resp.current_ma);
+	sensor->last_updated = jiffies;
+	sensor->cache_valid = true;
+	ret = 0;
+
+out_unlock:
+	mutex_unlock(&sensor->cache_lock);
+	return ret;
+}
+
+static int radxa_svc_sensor_hwmon_read(struct device *dev,
+				       enum hwmon_sensor_types type, u32 attr,
+				       int channel, long *val)
+{
+	struct radxa_svc_sensor *sensor = dev_get_drvdata(dev);
+	s64 power;
+	int ret;
+
+	if (channel)
+		return -EOPNOTSUPP;
+
+	ret = radxa_svc_sensor_update(sensor);
+	if (ret)
+		return ret;
+
+	switch (type) {
+	case hwmon_temp:
+		if (attr != hwmon_temp_input ||
+		    sensor->sensor_type != RADXA_SVC_SENSOR_TEMP)
+			return -EOPNOTSUPP;
+		*val = sensor->temp_millic;
+		return 0;
+	case hwmon_in:
+		if (attr != hwmon_in_input ||
+		    !(radxa_svc_sensor_expected_mask(sensor->sensor_type) &
+		      RADXA_SVC_SENSOR_VALID_VOLTAGE))
+			return -EOPNOTSUPP;
+		*val = sensor->voltage_mv;
+		return 0;
+	case hwmon_curr:
+		if (attr != hwmon_curr_input ||
+		    !(radxa_svc_sensor_expected_mask(sensor->sensor_type) &
+		      RADXA_SVC_SENSOR_VALID_CURRENT))
+			return -EOPNOTSUPP;
+		if (sensor->current_ma > LONG_MAX ||
+		    sensor->current_ma < LONG_MIN)
+			return -ERANGE;
+		*val = sensor->current_ma;
+		return 0;
+	case hwmon_power:
+		if (attr != hwmon_power_input ||
+		    sensor->sensor_type != RADXA_SVC_SENSOR_VOLTAGE_CURRENT)
+			return -EOPNOTSUPP;
+
+		power = (s64)sensor->voltage_mv * sensor->current_ma;
+		if (power > LONG_MAX || power < LONG_MIN)
+			return -ERANGE;
+		*val = power;
+		return 0;
+	default:
+		return -EOPNOTSUPP;
+	}
+}
+
+static int radxa_svc_sensor_hwmon_read_string(struct device *dev,
+					      enum hwmon_sensor_types type, u32 attr,
+					      int channel, const char **str)
+{
+	if (channel)
+		return -EOPNOTSUPP;
+
+	switch (type) {
+	case hwmon_temp:
+		if (attr == hwmon_temp_label)
+			*str = "Temperature";
+		else
+			return -EOPNOTSUPP;
+		break;
+	case hwmon_in:
+		if (attr == hwmon_in_label)
+			*str = "Voltage";
+		else
+			return -EOPNOTSUPP;
+		break;
+	case hwmon_curr:
+		if (attr == hwmon_curr_label)
+			*str = "Current";
+		else
+			return -EOPNOTSUPP;
+		break;
+	case hwmon_power:
+		if (attr == hwmon_power_label)
+			*str = "Power";
+		else
+			return -EOPNOTSUPP;
+		break;
+	default:
+		return -EOPNOTSUPP;
+	}
+
+	return 0;
+}
+
+static umode_t radxa_svc_sensor_hwmon_is_visible(const void *data,
+						 enum hwmon_sensor_types type,
+						 u32 attr, int channel)
+{
+	const struct radxa_svc_sensor *sensor = data;
+
+	if (channel)
+		return 0;
+
+	switch (type) {
+	case hwmon_temp:
+		if (sensor->sensor_type == RADXA_SVC_SENSOR_TEMP &&
+		    (attr == hwmon_temp_input || attr == hwmon_temp_label))
+			return 0444;
+		break;
+	case hwmon_in:
+		if ((radxa_svc_sensor_expected_mask(sensor->sensor_type) &
+		     RADXA_SVC_SENSOR_VALID_VOLTAGE) &&
+		    (attr == hwmon_in_input || attr == hwmon_in_label))
+			return 0444;
+		break;
+	case hwmon_curr:
+		if ((radxa_svc_sensor_expected_mask(sensor->sensor_type) &
+		     RADXA_SVC_SENSOR_VALID_CURRENT) &&
+		    (attr == hwmon_curr_input || attr == hwmon_curr_label))
+			return 0444;
+		break;
+	case hwmon_power:
+		if (sensor->sensor_type == RADXA_SVC_SENSOR_VOLTAGE_CURRENT &&
+		    (attr == hwmon_power_input || attr == hwmon_power_label))
+			return 0444;
+		break;
+	default:
+		break;
+	}
+
+	return 0;
+}
+
+static const struct hwmon_ops radxa_svc_sensor_hwmon_ops = {
+	.is_visible = radxa_svc_sensor_hwmon_is_visible,
+	.read = radxa_svc_sensor_hwmon_read,
+	.read_string = radxa_svc_sensor_hwmon_read_string,
+};
+
+static const struct hwmon_channel_info * const radxa_svc_temp_info[] = {
+	HWMON_CHANNEL_INFO(temp, HWMON_T_INPUT | HWMON_T_LABEL),
+	NULL
+};
+
+static const struct hwmon_channel_info * const radxa_svc_voltage_info[] = {
+	HWMON_CHANNEL_INFO(in, HWMON_I_INPUT | HWMON_I_LABEL),
+	NULL
+};
+
+static const struct hwmon_channel_info * const radxa_svc_current_info[] = {
+	HWMON_CHANNEL_INFO(curr, HWMON_C_INPUT | HWMON_C_LABEL),
+	NULL
+};
+
+static const struct hwmon_channel_info * const radxa_svc_voltage_current_info[] = {
+	HWMON_CHANNEL_INFO(in, HWMON_I_INPUT | HWMON_I_LABEL),
+	HWMON_CHANNEL_INFO(curr, HWMON_C_INPUT | HWMON_C_LABEL),
+	HWMON_CHANNEL_INFO(power, HWMON_P_INPUT | HWMON_P_LABEL),
+	NULL
+};
+
+static const struct hwmon_chip_info radxa_svc_temp_chip_info = {
+	.ops = &radxa_svc_sensor_hwmon_ops,
+	.info = radxa_svc_temp_info,
+};
+
+static const struct hwmon_chip_info radxa_svc_voltage_chip_info = {
+	.ops = &radxa_svc_sensor_hwmon_ops,
+	.info = radxa_svc_voltage_info,
+};
+
+static const struct hwmon_chip_info radxa_svc_current_chip_info = {
+	.ops = &radxa_svc_sensor_hwmon_ops,
+	.info = radxa_svc_current_info,
+};
+
+static const struct hwmon_chip_info radxa_svc_voltage_current_chip_info = {
+	.ops = &radxa_svc_sensor_hwmon_ops,
+	.info = radxa_svc_voltage_current_info,
+};
+
+static const struct hwmon_chip_info *radxa_svc_sensor_chip_info(u32 sensor_type)
+{
+	switch (sensor_type) {
+	case RADXA_SVC_SENSOR_TEMP:
+		return &radxa_svc_temp_chip_info;
+	case RADXA_SVC_SENSOR_VOLTAGE:
+		return &radxa_svc_voltage_chip_info;
+	case RADXA_SVC_SENSOR_CURRENT:
+		return &radxa_svc_current_chip_info;
+	case RADXA_SVC_SENSOR_VOLTAGE_CURRENT:
+		return &radxa_svc_voltage_current_chip_info;
+	default:
+		return NULL;
+	}
+}
+
+static int radxa_svc_sensor_validate_desc(struct radxa_svc_glink *svc,
+					  const struct radxa_svc_sensor_desc *desc,
+					  u32 index)
+{
+	const char *nul;
+	u32 sensor_id = le32_to_cpu(desc->sensor_id);
+	u32 sensor_type = le32_to_cpu(desc->sensor_type);
+	u32 i;
+
+	nul = memchr(desc->name, '\0', sizeof(desc->name));
+	if (!nul || nul == desc->name || !radxa_svc_sensor_chip_info(sensor_type))
+		return -EPROTO;
+
+	for (i = 0; i < index; i++) {
+		if (svc->sensors[i].sensor_id == sensor_id ||
+		    !strcmp(svc->sensors[i].name, desc->name))
+			return -EPROTO;
+	}
+
+	svc->sensors[index].svc = svc;
+	svc->sensors[index].sensor_id = sensor_id;
+	svc->sensors[index].sensor_type = sensor_type;
+	strscpy(svc->sensors[index].name, desc->name,
+		sizeof(svc->sensors[index].name));
+	mutex_init(&svc->sensors[index].cache_lock);
+
+	return 0;
+}
+
+static int radxa_svc_sensor_hwmon_init(struct radxa_svc_glink *svc)
+{
+	struct radxa_svc_sensor_list_resp *resp;
+	struct radxa_svc_sensor_list_req req;
+	const struct hwmon_chip_info *chip_info;
+	char *hwmon_name;
+	size_t max_len;
+	size_t len;
+	u32 returned;
+	u32 total = 0;
+	u32 start = 0;
+	u32 i;
+	int ret;
+
+	if (!(svc->caps & RADXA_SVC_CAP_SENSORS))
+		return 0;
+
+	max_len = struct_size(resp, entries, RADXA_SVC_SENSOR_PAGE_MAX);
+	resp = kzalloc(max_len, GFP_KERNEL);
+	if (!resp)
+		return -ENOMEM;
+
+	do {
+		req.start_index = cpu_to_le32(start);
+		req.max_entries = cpu_to_le32(RADXA_SVC_SENSOR_PAGE_MAX);
+		len = max_len;
+		ret = radxa_svc_request(svc, RADXA_SVC_OP_SENSOR_LIST,
+					&req, sizeof(req), resp, &len);
+		if (ret)
+			goto out_free;
+
+		if (len < sizeof(*resp)) {
+			ret = -EPROTO;
+			goto out_free;
+		}
+
+		returned = le32_to_cpu(resp->returned_count);
+		if (!start) {
+			total = le32_to_cpu(resp->total_count);
+			if (total > RADXA_SVC_SENSOR_MAX_SENSORS) {
+				ret = -EOVERFLOW;
+				goto out_free;
+			}
+
+			if (total) {
+				svc->sensors =
+					devm_kcalloc(svc->dev, total,
+						     sizeof(*svc->sensors), GFP_KERNEL);
+				if (!svc->sensors) {
+					ret = -ENOMEM;
+					goto out_free;
+				}
+			}
+		} else if (le32_to_cpu(resp->total_count) != total) {
+			ret = -EPROTO;
+			goto out_free;
+		}
+
+		if (returned > RADXA_SVC_SENSOR_PAGE_MAX || returned > total - start ||
+		    len != struct_size(resp, entries, returned) ||
+		    (start < total && !returned)) {
+			ret = -EPROTO;
+			goto out_free;
+		}
+
+		for (i = 0; i < returned; i++) {
+			ret = radxa_svc_sensor_validate_desc(svc, &resp->entries[i],
+							     start + i);
+			if (ret)
+				goto out_free;
+		}
+
+		start += returned;
+	} while (start < total);
+
+	svc->num_sensors = total;
+	for (i = 0; i < svc->num_sensors; i++) {
+		struct radxa_svc_sensor *sensor = &svc->sensors[i];
+
+		chip_info = radxa_svc_sensor_chip_info(sensor->sensor_type);
+		hwmon_name = devm_hwmon_sanitize_name(svc->dev, sensor->name);
+		if (IS_ERR(hwmon_name)) {
+			ret = PTR_ERR(hwmon_name);
+			goto out_free;
+		}
+
+		sensor->hwmon_dev =
+			devm_hwmon_device_register_with_info(svc->dev, hwmon_name,
+							     sensor, chip_info, NULL);
+		if (IS_ERR(sensor->hwmon_dev)) {
+			ret = PTR_ERR(sensor->hwmon_dev);
+			dev_err_probe(svc->dev, ret,
+				      "failed to register sensor %s hwmon\n",
+				      sensor->name);
+			goto out_free;
+		}
+	}
+
+	ret = 0;
+
+out_free:
+	kfree(resp);
+	return ret;
+}
+
 static int radxa_svc_fan_get_pwm_mode(struct radxa_svc_glink *svc,
 				      long *mode)
 {
@@ -694,6 +1159,11 @@ static int radxa_svc_rpmsg_probe(struct rpmsg_device *rpdev)
 		return dev_err_probe(&rpdev->dev, ret,
 				     "failed to register hwmon\n");
 
+	ret = radxa_svc_sensor_hwmon_init(svc);
+	if (ret)
+		return dev_err_probe(&rpdev->dev, ret,
+				     "failed to register sensor hwmon devices\n");
+
 	return 0;
 }
 

-- 
2.55.0

