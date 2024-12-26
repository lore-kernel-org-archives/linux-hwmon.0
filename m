Received: from smtp2.math.uni-bielefeld.de (smtp2.math.uni-bielefeld.de [129.70.45.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A98A735280;
	Thu, 26 Dec 2024 17:03:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=129.70.45.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1735232635; cv=none; b=o5wQOT9Sj9ZSpDJAUvvXxtxXOvKkp/QMK76/+Vuh/jYM4rIwCaH1/DVPBLW3swE4lOP7GLR916qEkiZ6/o05di6GJTc0DNZTpTSjmVKGI/BhFU8gXmdpBjAv3GxaPRfEzBthhM53GA6g5L8jXlYmCSgU82AYkeWBIR/ydq8ObI4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1735232635; c=relaxed/simple;
	bh=+xOi3Hqp+vmWLVW3T7fd7l1Gl+3/wM6TQ5dik1syBR0=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=Fp1EGimpDkWdixaPD14I9KsCEW9+mldM8CRTykdJnIbOOH/tEsnXgsh7zsXeNdEh1/pV2ik9BYAXHfhRcPrfvvAZsK5r6xxyWRBZ+hA28v/A/6hyX5MZrNAZ9iiRBZTer2xiAmaWvJT5QdlocHIPhvT3OrVuH48j4LIQxasl1Wo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=math.uni-bielefeld.de; spf=pass smtp.mailfrom=math.uni-bielefeld.de; dkim=pass (2048-bit key) header.d=math.uni-bielefeld.de header.i=@math.uni-bielefeld.de header.b=q26fP1Gf; arc=none smtp.client-ip=129.70.45.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=math.uni-bielefeld.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=math.uni-bielefeld.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=math.uni-bielefeld.de header.i=@math.uni-bielefeld.de header.b="q26fP1Gf"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
	d=math.uni-bielefeld.de; s=default; t=1735232630;
	bh=+xOi3Hqp+vmWLVW3T7fd7l1Gl+3/wM6TQ5dik1syBR0=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=q26fP1GfM6KYlNiIH5z+RDMqqBCngxCH2ypjPV9nkVD4fiFDQA4u+6Z4whpLrR8av
	 x2o+FJhiGYw/J79rPXi2FhcboI2bTZJWjUjBJ4zl6eELs5S870qX7n/QF1xFJyk/SV
	 SM8jS7jeVKFKk2urOl0UIGqVq0WcTxSagkSwjqaEpjHaK2837Q/uJJL4bKMQf8QuaL
	 q1tXMNcUxnrP/Y2bMhTUHkaSSKBqE58zy+J2MX/n1wduqDtcADg/z0z0XTBOAvTrTO
	 17V7QLlEFG7G5tTT1zA/bn1ufJn0/DEc4SWQHcJ9Pso8DCTFMYPpygiLW4c0+F3Dtw
	 uFvcnbZiGMEPg==
Received: from localhost (58-32-133-N4.customer.vsm.sh [170.133.32.58])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(Client did not present a certificate)
	by smtp2.math.uni-bielefeld.de (Postfix) with ESMTPSA id 8E4E6206CD;
	Thu, 26 Dec 2024 18:03:50 +0100 (CET)
From: tjakobi@math.uni-bielefeld.de
To: Derek John Clark <derekjohn.clark@gmail.com>,
	=?UTF-8?q?Joaqu=C3=ADn=20Ignacio=20Aramend=C3=ADa?= <samsagax@gmail.com>,
	Jean Delvare <jdelvare@suse.com>,
	Guenter Roeck <linux@roeck-us.net>
Cc: Tobias Jakobi <tjakobi@math.uni-bielefeld.de>,
	linux-hwmon@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH 4/4] hwmon: (oxp-sensors) Cache state of PWM enable mode
Date: Thu, 26 Dec 2024 18:00:19 +0100
Message-ID: <80c85a5d219eba0c10d6927c3f90bbc3ad6043a1.1735232354.git.tjakobi@math.uni-bielefeld.de>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <cover.1735232354.git.tjakobi@math.uni-bielefeld.de>
References: <cover.1735232354.git.tjakobi@math.uni-bielefeld.de>
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Tobias Jakobi <tjakobi@math.uni-bielefeld.de>

The driver is in full control of the enable mode, so we
don't need to read it from HW every single time.

Signed-off-by: Tobias Jakobi <tjakobi@math.uni-bielefeld.de>
---
 drivers/hwmon/oxp-sensors.c | 81 ++++++++++++++++++++++++++++++++-----
 1 file changed, 70 insertions(+), 11 deletions(-)

diff --git a/drivers/hwmon/oxp-sensors.c b/drivers/hwmon/oxp-sensors.c
index 8089349fa508..6790bc9e0da3 100644
--- a/drivers/hwmon/oxp-sensors.c
+++ b/drivers/hwmon/oxp-sensors.c
@@ -90,6 +90,8 @@ struct oxp_config {
 struct oxp_data {
 	struct device *hwmon_dev;
 	const struct oxp_config *config;
+
+	bool pwm_auto; /* Is the EC controlling the PWM automatically? */
 };
 
 static const struct oxp_config config_oxp = {
@@ -318,6 +320,22 @@ static int write_to_ec(u8 reg, u8 value)
 	return ret;
 }
 
+static int pwm_auto_from_hw(struct oxp_data *data)
+{
+	const struct oxp_config *config = data->config;
+
+	long tmp;
+	int ret;
+
+	ret = read_from_ec(config->sensor_pwm_enable_reg, 1, &tmp);
+	if (ret < 0)
+		return ret;
+
+	data->pwm_auto = tmp == PWM_MODE_AUTO;
+
+	return ret;
+}
+
 /* Rescale a (HW) sensor PWM value to userspace range. */
 static long rescale_sensor_pwm_to_user(const struct oxp_config *config, long val)
 {
@@ -410,18 +428,48 @@ static ssize_t tt_toggle_show(struct device *dev,
 static DEVICE_ATTR_RW(tt_toggle);
 
 /* PWM enable/disable functions */
-static int oxp_pwm_enable(const struct oxp_config *config)
+static int oxp_pwm_enable(struct oxp_data *data)
 {
-	if (test_bit(OXP_FEATURE_PWM, &config->features))
-		return write_to_ec(config->sensor_pwm_enable_reg, PWM_MODE_MANUAL);
+	const struct oxp_config *config;
+	int ret;
+
+	if (!data->pwm_auto)
+		return 0;
+
+	config = data->config;
+
+	if (test_bit(OXP_FEATURE_PWM, &config->features)) {
+		ret = write_to_ec(config->sensor_pwm_enable_reg, PWM_MODE_MANUAL);
+		if (ret < 0)
+			return ret;
+
+		data->pwm_auto = false;
+
+		return 0;
+	}
 
 	return -EINVAL;
 }
 
-static int oxp_pwm_disable(const struct oxp_config *config)
+static int oxp_pwm_disable(struct oxp_data *data)
 {
-	if (test_bit(OXP_FEATURE_PWM, &config->features))
-		return write_to_ec(config->sensor_pwm_enable_reg, PWM_MODE_AUTO);
+	const struct oxp_config *config;
+	int ret;
+
+	if (data->pwm_auto)
+		return 0;
+
+	config = data->config;
+
+	if (test_bit(OXP_FEATURE_PWM, &config->features)) {
+		ret = write_to_ec(config->sensor_pwm_enable_reg, PWM_MODE_AUTO);
+		if (ret < 0)
+			return ret;
+
+		data->pwm_auto = true;
+
+		return 0;
+	}
 
 	return -EINVAL;
 }
@@ -468,8 +516,11 @@ static int oxp_platform_read(struct device *dev, enum hwmon_sensor_types type,
 			}
 			break;
 		case hwmon_pwm_enable:
-			if (test_bit(OXP_FEATURE_PWM, &config->features))
-				return read_from_ec(config->sensor_pwm_enable_reg, 1, val);
+			if (test_bit(OXP_FEATURE_PWM, &config->features)) {
+				*val = data->pwm_auto ? PWM_MODE_AUTO : PWM_MODE_MANUAL;
+
+				return 0;
+			}
 			break;
 		default:
 			break;
@@ -493,12 +544,12 @@ static int oxp_platform_write(struct device *dev, enum hwmon_sensor_types type,
 		switch (attr) {
 		case hwmon_pwm_enable:
 			if (val == 1)
-				return oxp_pwm_enable(config);
+				return oxp_pwm_enable(data);
 			else if (val == 0)
-				return oxp_pwm_disable(config);
+				return oxp_pwm_disable(data);
 			return -EINVAL;
 		case hwmon_pwm_input:
-			if (val < 0 || val > 255)
+			if (val < 0 || val > 255 || data->pwm_auto)
 				return -EINVAL;
 			if (test_bit(OXP_FEATURE_PWM, &config->features)) {
 				const long hw_val = rescale_sensor_pwm_to_hw(config, val);
@@ -591,6 +642,14 @@ static int oxp_platform_probe(struct platform_device *pdev)
 
 	platform_set_drvdata(pdev, data);
 
+	if (test_bit(OXP_FEATURE_PWM, &config->features)) {
+		int ret;
+
+		ret = pwm_auto_from_hw(data);
+		if (ret < 0)
+			return ret;
+	}
+
 	return 0;
 }
 
-- 
2.45.2

