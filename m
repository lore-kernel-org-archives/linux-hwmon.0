Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=178.33.107.29
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794555896;
	b=mDjxWHvw13kmdfwcPqzYl4ER/fiKUCoot5ruklqyRRta8Q/ANDBLXkqAaW8Hj1KBspNY
	 I3+CMYoIa+1oSRSsDAnhvqB3M9CV3NX/MkJ3GFCjG8LoL718y72YMdx4O+d7hcByLTBuZ
	 LDiE3mInoZXT8JnbdxzekjoDktu0YWSkYJREl4aoExjGOq3w22zf2MwHDw8vOkbMY9dS/
	 /zVyGovhcHEfCgpqygXSMDIzYEHlfnXyLq+fvvRn7Mi4mFWW9DDZNnQvGDntggz30JPP4
	 MAcsY8HPOz3xKEbDof/cjeK3nhYKIdinPpQTAXHZsycxZih9OeFt1HBhCxT5PX16/Mw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794555896;
	h=DMARC-Filter:Received:Received:Received:X-OVh-ClientIp:From:To:Cc:
	 Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Type:Content-Transfer-Encoding:x-ovh-tracer-id:X-VR-SPAMSTATE:
	 X-VR-SPAMSCORE:X-VR-SPAMCAUSE:DKIM-Signature;
	bh=9aITCtlwXLCbRIOSoGqqiyviWUF2fF7265UIaIYTMxA=;
	b=lJvfsddhHxLzSCDmP3CbfFs4FoV+Tzbd7tq58NOQJUoSzX14Ny92RkyzjrLPIYATdDWg
	 QG1hrAbPaRi4BxO+UOyV3RDDbgEEC6oqjPpF7OjIcB6n9jkLYwl8xt9eqXJx9mWJcVTGB
	 7Yqgidbav0aLHebSyCsj5bBhEiirXHVm8TzO//IIV+OYMJ9DNDMw2XztgR/8aX05YhqfQ
	 dFdDkCfglnza0KYYSXgWJVhIfilh1jE6U9HskkZPVgrccrD8vuLYlZRd3QgZOj6M3Dbrs
	 rrumLfkGWi+vcm4PoKu4MQ1DFHqkhLTrlmpQBYIBRpz2vAy2K8LwBh4Aua3EZZRRJ8g==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=3mdeb.com;
	spf=pass smtp.mailfrom=3mdeb.com;
	dkim=pass header.d=3mdeb.com header.i=@3mdeb.com header.a=rsa-sha256 header.s=ovhmo3617313-selector1 header.b=AKxR2Du6;
	arc=none smtp.remote-ip=178.33.107.29
Received: from 15.mo583.mail-out.ovh.net (15.mo583.mail-out.ovh.net [178.33.107.29])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D7784606A884
	for <linux-hwmon@vger.kernel.org>; Fri, 13 Nov 2026 07:44:55 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org D7784606A884
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=3mdeb.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=3mdeb.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=3mdeb.com header.i=@3mdeb.com header.a=rsa-sha256 header.s=ovhmo3617313-selector1 header.b=AKxR2Du6
Received: from director8.ghost.mail-out.ovh.net (unknown [10.110.58.154])
	by mo583.mail-out.ovh.net (Postfix) with ESMTP id 4jQq676gvYz63Vf
	for <linux-hwmon@vger.kernel.org>; Fri, 13 Nov 2026 07:44:47 +0000 (UTC)
Received: from ghost-submission-7ccd8bbbb6-cl275 (unknown [10.108.42.118])
	by director8.ghost.mail-out.ovh.net (Postfix) with ESMTPS id D1757C014E;
	Fri, 13 Nov 2026 07:44:46 +0000 (UTC)
Received: from 3mdeb.com ([37.59.142.109])
	by ghost-submission-7ccd8bbbb6-cl275 with ESMTPSA
	id Hrv+B+u/9mr5jjgAjijQbg:T3
	(envelope-from <filip.golas@3mdeb.com>); Fri, 13 Nov 2026 07:44:46 +0000
Authentication-Results:garm.ovh; auth=pass (GARM-109S0035971ddc7-f925-4642-b338-66dc92d02e97,
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
Subject: [PATCH 2/3] platform/x86: dasharo-acpi: Add fan mode and PWM write support
Date: Fri, 13 Nov 2026 08:43:46 +0100
Message-ID: <20261113074347.2301465-3-filip.golas@3mdeb.com>
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
x-ovh-tracer-id: 13830272982746656751
X-VR-SPAMSTATE: OK
X-VR-SPAMSCORE: -100
X-VR-SPAMCAUSE: dmFkZTFlXx8+5JEVtbgskvn0mQwqwMiiUHVSJhKYYHJKacS3OogXmGYQzZSvElqTpv7MA26TfMZE1aPnucRMMWpnPSw7cwpUpV9rYonc9FqEtY61eI5P65EfaAQB/GOcsu7ZjW2myG0aC1gnunV1nnjJBGnnAsK0TkmGoLJIuPsr4F4fA2qwl88bGdgsMxS7EVKZg43uq6VXwrzV2kFOSXfG7oTtmCSoBgXxZoCX4RzDSQ9QvszATqN7V42JtdM/TvGtGIkflSyaaIIY+NgpBUKDrAdUM3dRwZpsTnxNDPnyiOSSBb0tAL7kcmZZYphQ1Sf8nd69ZMtjv5V27+oqMmiRpQ/8FS+VNu3YdILPqe7lNVQ3GFs5K3luR33mXUrofX3hy1kRIKeqcTL2xyHZGTkyGhSci22gfvvK/ETye/5R9DGuHkCXTnDBrF0ta80GxWtF8JOWeVLswT5W3Ulq6A4lTjtW5eKqw91e4+BDeCQk/SiEX3PVyDSnOTlUNcJeh438eGy1ZJ1UDMwx27fH48I9GZ+nTAEJoODqGoR6N6UzOvydlDGQnNdujz4gaG5bOF5BAoJat6b+9p3prj7GA7PpcH9btJ0nwsf3mN7fK7EZqts4xoOtxibkDoNDuZT+Byus7dTHfodcHqeCATvO0bRZeXkq4LiYYpCPHk9PhNIfji7rEA
DKIM-Signature: a=rsa-sha256; bh=9aITCtlwXLCbRIOSoGqqiyviWUF2fF7265UIaIYTMxA=;
 c=relaxed/relaxed; d=3mdeb.com; h=From; s=ovhmo3617313-selector1;
 t=1794555887; v=1;
 b=AKxR2Du67tNJumH4if65/j6KlqQTMBKUH52KzG25SP3rMj9ClMxh//ohb0TLptbC2kChF6HY
 g7wYh6McayrrVJavKl3ihR3iKpL4kkEIx2kKDvNLSd7vhN4syeLt5CM7Xpx9gX/W+T2ZdFAOqNp
 GaFJ9okG8K8rLgDqU8zDlfF9k6p1QklNObry9oyFmRvIf1aahdjcoHVgNodZk9pttBK6ibSANYE
 t/5N2g7ODYfcLHHPVCUJ7W7hZEU+JMN8QgQzBLv37gOqeLlwwUy8Yd0CqOGa48ENpUQNax5WO6A
 nPj2lXdPFHJghzmTxwe+8UUceKO+MwMuM+8I7LrsRUn6w==

Allow switching fans between automatic control by the EC and manual
control via pwmN_enable (1=manual, 2=automatic), and setting the duty
cycle via pwmN. The EC refuses duty cycle writes in automatic mode.

Fan mode control is only exposed for fans on which the firmware reports
support for it.

Signed-off-by: Filip Gołaś <filip.golas@3mdeb.com>
---
 drivers/platform/x86/dasharo-acpi.c | 117 +++++++++++++++++++++-------
 1 file changed, 90 insertions(+), 27 deletions(-)

diff --git a/drivers/platform/x86/dasharo-acpi.c b/drivers/platform/x86/dasharo-acpi.c
index 13d97eb43511..29afcf78564c 100644
--- a/drivers/platform/x86/dasharo-acpi.c
+++ b/drivers/platform/x86/dasharo-acpi.c
@@ -15,6 +15,8 @@ enum dasharo_feature {
 	DASHARO_FEATURE_TEMPERATURE = 0,
 	DASHARO_FEATURE_FAN_PWM,
 	DASHARO_FEATURE_FAN_TACH,
+	DASHARO_FEATURE_FAN_POINTS,
+	DASHARO_FEATURE_FAN_MODE,
 	DASHARO_FEATURE_MAX
 };
 
@@ -54,6 +56,16 @@ static const char * const dasharo_group_names[DASHARO_FEATURE_MAX][MAX_GROUPS_PE
 		[DASHARO_FAN_GPU] = "GPU",
 		[DASHARO_FAN_CHASSIS] = "Chassis",
 	},
+	[DASHARO_FEATURE_FAN_MODE] = {
+		[DASHARO_FAN_CPU] = "CPU",
+		[DASHARO_FAN_GPU] = "GPU",
+		[DASHARO_FAN_CHASSIS] = "Chassis",
+	},
+	[DASHARO_FEATURE_FAN_POINTS] = {
+		[DASHARO_FAN_CPU] = "CPU",
+		[DASHARO_FAN_GPU] = "GPU",
+		[DASHARO_FAN_CHASSIS] = "Chassis",
+	},
 };
 
 struct dasharo_capability {
@@ -143,6 +155,21 @@ static int dasharo_read_channel(struct dasharo_data *data, const char *method,
 	return ret;
 }
 
+static int dasharo_write_channel(struct dasharo_data *data, const char *method,
+				 enum dasharo_feature feat, int channel, long value)
+{
+	u64 arg = value;
+	u64 ret;
+	int err;
+
+	err = dasharo_call(data, method, feat, channel, &arg, 1, &ret);
+	if (err)
+		return err;
+
+	/* Non-zero status from the method means the EC refused the write */
+	return ret ? -EPERM : 0;
+}
+
 static int dasharo_hwmon_read(struct device *dev, enum hwmon_sensor_types type,
 			      u32 attr, int channel, long *val)
 {
@@ -162,6 +189,14 @@ static int dasharo_hwmon_read(struct device *dev, enum hwmon_sensor_types type,
 			*val = value;
 		break;
 	case hwmon_pwm:
+		if (attr == hwmon_pwm_enable) {
+			/* hwmon: 1 = manual, 2 = automatic */
+			ret = dasharo_read_channel(data, "GFMD", DASHARO_FEATURE_FAN_MODE,
+						   channel, &value);
+			if (!ret)
+				*val = value ? 1 : 2;
+			break;
+		}
 		ret = dasharo_read_channel(data, "GFDC", DASHARO_FEATURE_FAN_PWM, channel, &value);
 		if (!ret)
 			*val = value;
@@ -174,6 +209,31 @@ static int dasharo_hwmon_read(struct device *dev, enum hwmon_sensor_types type,
 	return ret;
 }
 
+static int dasharo_hwmon_write(struct device *dev, enum hwmon_sensor_types type,
+			       u32 attr, int channel, long val)
+{
+	struct dasharo_data *data = dev_get_drvdata(dev);
+
+	if (type != hwmon_pwm)
+		return -EINVAL;
+
+	switch (attr) {
+	case hwmon_pwm_enable:
+		if (val != 1 && val != 2)
+			return -EINVAL;
+		return dasharo_write_channel(data, "SFMD", DASHARO_FEATURE_FAN_MODE,
+					     channel, val == 1);
+	case hwmon_pwm_input:
+		if (val < 0 || val > 255)
+			return -EINVAL;
+		/* Refused by the EC unless in manual mode */
+		return dasharo_write_channel(data, "SFDC", DASHARO_FEATURE_FAN_PWM,
+					     channel, val);
+	default:
+		return -EOPNOTSUPP;
+	}
+}
+
 static int dasharo_hwmon_read_string(struct device *dev, enum hwmon_sensor_types type,
 				     u32 attr, int channel, const char **str)
 {
@@ -210,9 +270,11 @@ static umode_t dasharo_hwmon_is_visible(const void *drvdata, enum hwmon_sensor_t
 			return 0444;
 		break;
 	case hwmon_pwm:
-		if (channel < data->caps_found[DASHARO_FEATURE_FAN_PWM])
-			return 0444;
-		break;
+		if (channel >= data->caps_found[DASHARO_FEATURE_FAN_PWM])
+			break;
+		if (attr == hwmon_pwm_enable)
+			return channel < data->caps_found[DASHARO_FEATURE_FAN_MODE] ? 0644 : 0;
+		return data->caps_found[DASHARO_FEATURE_FAN_MODE] ? 0644 : 0444;
 	case hwmon_fan:
 		if (channel < data->caps_found[DASHARO_FEATURE_FAN_TACH])
 			return 0444;
@@ -228,6 +290,7 @@ static const struct hwmon_ops dasharo_hwmon_ops = {
 	.is_visible = dasharo_hwmon_is_visible,
 	.read_string = dasharo_hwmon_read_string,
 	.read = dasharo_hwmon_read,
+	.write = dasharo_hwmon_write,
 };
 
 // Max 24 capabilities per feature
@@ -283,30 +346,30 @@ static const struct hwmon_channel_info * const dasharo_hwmon_info[] = {
 		HWMON_T_INPUT | HWMON_T_LABEL,
 		HWMON_T_INPUT | HWMON_T_LABEL),
 	HWMON_CHANNEL_INFO(pwm,
-		HWMON_PWM_INPUT,
-		HWMON_PWM_INPUT,
-		HWMON_PWM_INPUT,
-		HWMON_PWM_INPUT,
-		HWMON_PWM_INPUT,
-		HWMON_PWM_INPUT,
-		HWMON_PWM_INPUT,
-		HWMON_PWM_INPUT,
-		HWMON_PWM_INPUT,
-		HWMON_PWM_INPUT,
-		HWMON_PWM_INPUT,
-		HWMON_PWM_INPUT,
-		HWMON_PWM_INPUT,
-		HWMON_PWM_INPUT,
-		HWMON_PWM_INPUT,
-		HWMON_PWM_INPUT,
-		HWMON_PWM_INPUT,
-		HWMON_PWM_INPUT,
-		HWMON_PWM_INPUT,
-		HWMON_PWM_INPUT,
-		HWMON_PWM_INPUT,
-		HWMON_PWM_INPUT,
-		HWMON_PWM_INPUT,
-		HWMON_PWM_INPUT),
+		HWMON_PWM_INPUT | HWMON_PWM_ENABLE,
+		HWMON_PWM_INPUT | HWMON_PWM_ENABLE,
+		HWMON_PWM_INPUT | HWMON_PWM_ENABLE,
+		HWMON_PWM_INPUT | HWMON_PWM_ENABLE,
+		HWMON_PWM_INPUT | HWMON_PWM_ENABLE,
+		HWMON_PWM_INPUT | HWMON_PWM_ENABLE,
+		HWMON_PWM_INPUT | HWMON_PWM_ENABLE,
+		HWMON_PWM_INPUT | HWMON_PWM_ENABLE,
+		HWMON_PWM_INPUT | HWMON_PWM_ENABLE,
+		HWMON_PWM_INPUT | HWMON_PWM_ENABLE,
+		HWMON_PWM_INPUT | HWMON_PWM_ENABLE,
+		HWMON_PWM_INPUT | HWMON_PWM_ENABLE,
+		HWMON_PWM_INPUT | HWMON_PWM_ENABLE,
+		HWMON_PWM_INPUT | HWMON_PWM_ENABLE,
+		HWMON_PWM_INPUT | HWMON_PWM_ENABLE,
+		HWMON_PWM_INPUT | HWMON_PWM_ENABLE,
+		HWMON_PWM_INPUT | HWMON_PWM_ENABLE,
+		HWMON_PWM_INPUT | HWMON_PWM_ENABLE,
+		HWMON_PWM_INPUT | HWMON_PWM_ENABLE,
+		HWMON_PWM_INPUT | HWMON_PWM_ENABLE,
+		HWMON_PWM_INPUT | HWMON_PWM_ENABLE,
+		HWMON_PWM_INPUT | HWMON_PWM_ENABLE,
+		HWMON_PWM_INPUT | HWMON_PWM_ENABLE,
+		HWMON_PWM_INPUT | HWMON_PWM_ENABLE),
 	NULL
 };
 
-- 
2.56.0

