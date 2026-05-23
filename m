Received: from mailgate02.uberspace.is (mailgate02.uberspace.is [185.26.156.114])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2739123815B
	for <linux-hwmon@vger.kernel.org>; Sat, 23 May 2026 13:36:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.26.156.114
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779543414; cv=none; b=Rz39gIALAR7o/O9UJSBAUaYPo9sNMtPWcZK5BaGI3CaenIl4CwNN1gRZZItV52xPRLfQXePZdw1v8Eo9T/wxdJzKI4o8Lp20O/HlTR3haCWaS28SCChCsjF+8fG/LDeNeYV8JVVAr1b6ci+sYT7PrrBiYIE3f9Fawtd1fSo/0o8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779543414; c=relaxed/simple;
	bh=xYUD5+FLM71Ovok469AlA7MGVHh20m7s5WHbulxZiPE=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=LJaeX3E7v0WYXzJAVrFje04nGdZU9/oIzCcQETuAmXIbLyeILtJJGhm4KVjqL/b6HP5h/K1wAxMTMKlsRvm6owVOO78cc0cy5e39yADZY+kZcsmcwpFOFRm9koGsbSTAmr0B9YRvnp+4oTb675+TWyLkmcON58VTzgdYxMg02DA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=jhbruhn.de; spf=pass smtp.mailfrom=jhbruhn.de; dkim=pass (4096-bit key) header.d=jhbruhn.de header.i=@jhbruhn.de header.b=ayXIyZqN; arc=none smtp.client-ip=185.26.156.114
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=jhbruhn.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=jhbruhn.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (4096-bit key) header.d=jhbruhn.de header.i=@jhbruhn.de header.b="ayXIyZqN"
Received: from boethin.uberspace.de (boethin.uberspace.de [185.26.156.96])
	by mailgate02.uberspace.is (Postfix) with ESMTPS id C7ADB17F788
	for <linux-hwmon@vger.kernel.org>; Sat, 23 May 2026 15:36:50 +0200 (CEST)
Received: (qmail 11517 invoked by uid 990); 23 May 2026 13:36:50 -0000
Authentication-Results: boethin.uberspace.de;
	auth=pass (plain)
Received: from unknown (HELO unknown) (::1)
	by boethin.uberspace.de (Haraka/3.1.1) with ESMTPSA; Sat, 23 May 2026 15:36:50 +0200
From: Jan-Henrik Bruhn <kernel@jhbruhn.de>
To: sashiko-bot@kernel.org
Cc: kernel@jhbruhn.de,
	linux-hwmon@vger.kernel.org,
	sashiko-reviews@lists.linux.dev
Subject: [PATCH v4] hwmon: (lm63) expose PWM frequency and LUT hysteresis as writable
Date: Sat, 23 May 2026 15:36:17 +0200
Message-ID: <20260523133617.3439102-1-kernel@jhbruhn.de>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <20260523105837.67B9C1F000E9@smtp.kernel.org>
References: <20260523105837.67B9C1F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Rspamd-Bar: -
X-Rspamd-Report: MID_CONTAINS_FROM(1) BAYES_HAM(-3) MIME_GOOD(-0.1) R_MISSING_CHARSET(0.5)
X-Rspamd-Score: -1.6
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
	d=jhbruhn.de; s=uberspace;
	h=from:to:cc:subject:date;
	bh=xYUD5+FLM71Ovok469AlA7MGVHh20m7s5WHbulxZiPE=;
	b=ayXIyZqNkC8zsGcNfXjX2fSuz5pBb0UeHP6/8lzosmP6Rrz/GHTWzoPEHSy/790v/4O4IVEDs/
	1SRSlVHJCwSPUt6GGNxJKeUcg/JCADALMvGKlXRN8sKmbEY/5UkBTwagtAvpbynVZaFxL5nE+QTX
	2nCQUcU3NlwzXZPlLG8meWcOnI6+D5loDUtYnVnSd+Joxbp/LHEm49rkwST7MQVGAKC//5n9roJF
	pL5NwqJntKk5KD9m4rgbofsxDFxOjQg+i8rH4E5IXUnoz+WjL2y1NcWU07cmmUjl+JfueQNXxJn0
	z6zGymZN4V6EQtPcK+AJQbCtM+Iwe8lJBeIn43qQH5fpE9oFTrYowEdswqT38QxIPA0b6HlmUlFs
	gWHijC2D8N8J7SAI24mHLzJ8sMaQYNtTv/PFHvCsjee5Pfu37t/EKh77KcPTpda2NVD/cVx9vc+I
	RSfynreGd1uLMRNctyfR4Ieo/vuYX1506aSGmNUgoevLpgVdAlaNK71N/kQjKdOF2EboAy2ttnz/
	4KL99oXaRMDiI7ew1H7AE+317JLbfvV1OJePN39NqY2uymP2I2pb/dXMquvn/gjQfAvHXOA/DkcL
	CRJLfrs6knb4dn4foFLUKEBKTdOW3zoRvpY8ezp+Mu1AljAilYOy5HOMm54z+Yesih813TPQGMuQ
	A=

The driver caches the PWM frequency register and the CONFIG_FAN slow-clock
select bit, but never lets userspace pick a different output frequency.
Add a pwm1_freq sysfs attribute that selects the closest SCS + PFR
combination for the requested value in Hz, gated by manual mode like
set_pwm1(). PFR is clamped to 31 so that 2*PFR fits in the chip's 6-bit
PWM register (matching the existing scaling assumption in show_pwm1).

The hardware LUT hysteresis register is shared by all LUT entries, so
the per-point pwm1_auto_pointN_temp_hyst attributes can't be made RW
without N-to-1 cross-attribute side effects. Following the max31760
precedent, expose a single chip-wide pwm1_auto_point_temp_hyst attribute
holding the hysteresis amount in millidegrees; the per-point attributes
stay RO and continue to show the resulting absolute trip-down
temperature for each entry.

This was tested on a Linksys LGS328MPC switch hardware where the fan
would not spin with the default PWM Frequency, which is why this change
is required.

Signed-off-by: Jan-Henrik Bruhn <kernel@jhbruhn.de>
---
v4:
 - pwm1_freq_show: snapshot data->config_fan and data->pwm1_freq
   together under update_lock to prevent observing a concurrent
   pwm1_freq_store.
 - pwm1_auto_point_temp_hyst_show: read data->lut_temp_hs under
   update_lock for the same reason.
v3:
 - pwm1_freq_store: re-check the manual-mode bit under update_lock
   after the in-lock read of LM63_REG_CONFIG_FAN, instead of relying
   on the cached value before locking.
 - pwm1_freq_store: read LM96163_REG_CONFIG_ENHANCED before writing
   LM63_REG_CONFIG_FAN and LM63_REG_PWM_FREQ so an SMBus failure
   aborts cleanly without leaving the cache out of sync.

v2:
 - check return value of i2c_smbus_read_byte_data() in pwm1_freq_store()
   and propagate the error instead of silently using truncated values.
---
 drivers/hwmon/lm63.c | 133 +++++++++++++++++++++++++++++++++++++++++++
 1 file changed, 133 insertions(+)

diff --git a/drivers/hwmon/lm63.c b/drivers/hwmon/lm63.c
index a0d77a7386a9..e2a429e579ac 100644
--- a/drivers/hwmon/lm63.c
+++ b/drivers/hwmon/lm63.c
@@ -92,6 +92,9 @@ static const unsigned short normal_i2c[] = { 0x18, 0x4c, 0x4e, I2C_CLIENT_END };
 #define LM96163_REG_REMOTE_TEMP_U_LSB	0x32
 #define LM96163_REG_CONFIG_ENHANCED	0x45
 
+#define LM63_PWM_BASE_FAST_HZ		180000
+#define LM63_PWM_BASE_SLOW_HZ		700
+
 #define LM63_MAX_CONVRATE		9
 
 #define LM63_MAX_CONVRATE_HZ		32
@@ -455,6 +458,91 @@ static ssize_t pwm1_enable_store(struct device *dev,
 	return count;
 }
 
+static ssize_t pwm1_freq_show(struct device *dev,
+			      struct device_attribute *dummy, char *buf)
+{
+	struct lm63_data *data = lm63_update_device(dev);
+	unsigned int base, freq;
+
+	mutex_lock(&data->update_lock);
+	base = (data->config_fan & 0x08) ?
+	       LM63_PWM_BASE_SLOW_HZ : LM63_PWM_BASE_FAST_HZ;
+	freq = data->pwm1_freq;
+	mutex_unlock(&data->update_lock);
+
+	return sprintf(buf, "%u\n", base / freq);
+}
+
+/*
+ * Pick the closest CONFIG_FAN.SCS + PFR for the requested frequency.
+ * PWM_FREQ writes need the LUT unlocked, same as set_pwm1(). LUT PWM
+ * bytes are register-relative; rewrite them after a frequency change
+ * if duty cycles must be preserved.
+ */
+static ssize_t pwm1_freq_store(struct device *dev,
+			       struct device_attribute *dummy,
+			       const char *buf, size_t count)
+{
+	struct lm63_data *data = dev_get_drvdata(dev);
+	struct i2c_client *client = data->client;
+	unsigned long val, pfr_fast, pfr_slow, err_fast, err_slow, pfr;
+	bool slow_clock;
+	int ret;
+
+	ret = kstrtoul(buf, 10, &val);
+	if (ret)
+		return ret;
+	if (val == 0)
+		return -EINVAL;
+
+	pfr_fast = clamp_val(DIV_ROUND_CLOSEST((unsigned long)LM63_PWM_BASE_FAST_HZ, val),
+			     1UL, 31UL);
+	pfr_slow = clamp_val(DIV_ROUND_CLOSEST((unsigned long)LM63_PWM_BASE_SLOW_HZ, val),
+			     1UL, 31UL);
+	err_fast = abs_diff(LM63_PWM_BASE_FAST_HZ / pfr_fast, val);
+	err_slow = abs_diff(LM63_PWM_BASE_SLOW_HZ / pfr_slow, val);
+
+	if (err_slow < err_fast) {
+		slow_clock = true;
+		pfr = pfr_slow;
+	} else {
+		slow_clock = false;
+		pfr = pfr_fast;
+	}
+
+	mutex_lock(&data->update_lock);
+	ret = i2c_smbus_read_byte_data(client, LM63_REG_CONFIG_FAN);
+	if (ret < 0) {
+		mutex_unlock(&data->update_lock);
+		return ret;
+	}
+	data->config_fan = ret;
+
+	if (!(data->config_fan & 0x20)) { /* register is read-only */
+		mutex_unlock(&data->update_lock);
+		return -EPERM;
+	}
+
+	if (data->kind == lm96163) {
+		ret = i2c_smbus_read_byte_data(client, LM96163_REG_CONFIG_ENHANCED);
+		if (ret < 0) {
+			mutex_unlock(&data->update_lock);
+			return ret;
+		}
+		data->pwm_highres = !slow_clock && pfr == 8 && (ret & 0x10);
+	}
+
+	if (slow_clock)
+		data->config_fan |= 0x08;
+	else
+		data->config_fan &= ~0x08;
+	i2c_smbus_write_byte_data(client, LM63_REG_CONFIG_FAN, data->config_fan);
+	i2c_smbus_write_byte_data(client, LM63_REG_PWM_FREQ, pfr);
+	data->pwm1_freq = pfr;
+	mutex_unlock(&data->update_lock);
+	return count;
+}
+
 /*
  * There are 8bit registers for both local(temp1) and remote(temp2) sensor.
  * For remote sensor registers temp2_offset has to be considered,
@@ -629,6 +717,47 @@ static ssize_t show_lut_temp_hyst(struct device *dev,
 	return sprintf(buf, "%d\n", temp);
 }
 
+/*
+ * The LM63 has a single hysteresis register shared by all LUT entries.
+ * Expose it as a chip-wide hysteresis amount in millidegrees; the
+ * per-point pwm1_auto_pointN_temp_hyst attributes remain read-only and
+ * show the resulting absolute trip-down temperature for each entry.
+ */
+static ssize_t pwm1_auto_point_temp_hyst_show(struct device *dev,
+					      struct device_attribute *dummy,
+					      char *buf)
+{
+	struct lm63_data *data = lm63_update_device(dev);
+	u8 hyst;
+
+	mutex_lock(&data->update_lock);
+	hyst = data->lut_temp_hyst;
+	mutex_unlock(&data->update_lock);
+
+	return sprintf(buf, "%d\n", TEMP8_FROM_REG(hyst));
+}
+
+static ssize_t pwm1_auto_point_temp_hyst_store(struct device *dev,
+					       struct device_attribute *dummy,
+					       const char *buf, size_t count)
+{
+	struct lm63_data *data = dev_get_drvdata(dev);
+	struct i2c_client *client = data->client;
+	unsigned long val;
+	int err;
+
+	err = kstrtoul(buf, 10, &val);
+	if (err)
+		return err;
+
+	mutex_lock(&data->update_lock);
+	data->lut_temp_hyst = HYST_TO_REG(val);
+	i2c_smbus_write_byte_data(client, LM63_REG_LUT_TEMP_HYST,
+				  data->lut_temp_hyst);
+	mutex_unlock(&data->update_lock);
+	return count;
+}
+
 /*
  * And now the other way around, user-space provides an absolute
  * hysteresis value and we have to store a relative one
@@ -764,6 +893,8 @@ static SENSOR_DEVICE_ATTR(fan1_min, S_IWUSR | S_IRUGO, show_fan,
 
 static SENSOR_DEVICE_ATTR(pwm1, S_IWUSR | S_IRUGO, show_pwm1, set_pwm1, 0);
 static DEVICE_ATTR_RW(pwm1_enable);
+static DEVICE_ATTR_RW(pwm1_freq);
+static DEVICE_ATTR_RW(pwm1_auto_point_temp_hyst);
 static SENSOR_DEVICE_ATTR(pwm1_auto_point1_pwm, S_IWUSR | S_IRUGO,
 	show_pwm1, set_pwm1, 1);
 static SENSOR_DEVICE_ATTR(pwm1_auto_point1_temp, S_IWUSR | S_IRUGO,
@@ -869,6 +1000,8 @@ static DEVICE_ATTR_RW(update_interval);
 static struct attribute *lm63_attributes[] = {
 	&sensor_dev_attr_pwm1.dev_attr.attr,
 	&dev_attr_pwm1_enable.attr,
+	&dev_attr_pwm1_freq.attr,
+	&dev_attr_pwm1_auto_point_temp_hyst.attr,
 	&sensor_dev_attr_pwm1_auto_point1_pwm.dev_attr.attr,
 	&sensor_dev_attr_pwm1_auto_point1_temp.dev_attr.attr,
 	&sensor_dev_attr_pwm1_auto_point1_temp_hyst.dev_attr.attr,
-- 
2.48.1

