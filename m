Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=80.241.56.151
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794871582;
	b=EDG9NOeSRHbg4q+9WgtfpbNwLjp9xTrgk06mN2IBfhay1Z2Qq0jWQckNhl0fcr/bk0QJ
	 gxQ1sqvE+81PeBcD1e2FjeFQ3Af2vk77PTpcbE670eTuZqLpWgRzTlaNWzH26W4kUttGl
	 sdiU0w4D76OATFEp3Y71UWq3hfqVFGwHaKYEpUHzLPBzg8CY6AWQW4y7BMr1EkbWbiH96
	 lw2gLch/RpPqCiF9TAE9buOLAF6dcSkJa1VJOHVEUN7wj4IKpOcY2/dfHeA7sZKcvM9pJ
	 ZYdiApvzr6kuZcNEsDDOWXtxTFGnDAVGnEyO6ONxbNmJmFzhyLSJCVy1Zt1B8L8thsQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794871582;
	h=DMARC-Filter:Received:DKIM-Signature:From:To:Cc:Subject:Date:
	 Message-ID:X-Mailer:MIME-Version:Content-Transfer-Encoding:
	 X-Rspamd-Queue-Id;
	bh=2dx3GFxjCIPVJ9bHnj9H11xbn7VrbLtedlP0fOfqO1c=;
	b=ttnjXHFWLhYU4b4SYg+dCpiysd52VGjpzP3NSdQ0GsOizNbBR1hZ1Ds+MSW7gtS5CnBp
	 jnEBfCRNIQi4RGWIzthXucy+qTvKZ4yOFrZYiY1ggJaaJKjqMKbe1FJ2HoAzG9wTW+8rM
	 QE7mKkm02e4kiXJP5BLRI4pWh4cK5Fxx560WQaw1UvO5VuksLYO3srbznURqsurVq+vVF
	 p5ATAbEcFkXpimDklWYe+cJrpJV5pRNUobKKRP0t1LJ3i8wXAx4Ts7+HFkq/HK7UCDuOg
	 YJvylDBxDqOuLHrOyLppsLebOP/YqFK/C9dArLnCW4bnTt1EYMB0l+AoLi+j/5DYGNw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=bojanowski.me;
	spf=pass smtp.mailfrom=bojanowski.me;
	dkim=pass header.d=bojanowski.me header.i=@bojanowski.me header.a=rsa-sha256 header.s=MBO0001 header.b=Si63RNlt;
	arc=none smtp.remote-ip=80.241.56.151
Received: from mout-p-101.mailbox.org (mout-p-101.mailbox.org [80.241.56.151])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1511E606A31C;
	Mon, 16 Nov 2026 23:26:20 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 1511E606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bojanowski.me
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bojanowski.me
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=bojanowski.me header.i=@bojanowski.me header.a=rsa-sha256 header.s=MBO0001 header.b=Si63RNlt
Received: from smtp202.mailbox.org (smtp202.mailbox.org [IPv6:2001:67c:2050:b231:465::202])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519MLKEM768 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by mout-p-101.mailbox.org (Postfix) with ESMTPS id 4jT3s53K5dz8v3N;
	Tue, 17 Nov 2026 00:26:17 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bojanowski.me;
	s=MBO0001; t=1794871577;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding;
	bh=2dx3GFxjCIPVJ9bHnj9H11xbn7VrbLtedlP0fOfqO1c=;
	b=Si63RNltlgPRF79Z2qcUKUKIktl27Z/994TpS7z7nCTaFgxXaIrGAyd8QlE8ofjAYOSLUF
	hBcln9+tQyqi0C9SDrZSY1fXSFsh89UuEwzM+XJvtqu+VNA65154cJQke6OqQxjR7sL44H
	Vudzj/vJc2hRfMkC63s+GAlOgdPOlimUKszjlNBE+3ykgq1a8C9YlhR/K5OSKzHkjzyR4p
	tMW5ZinImZKhVQR01peyV5dPz+AmtIKSEykGqJEdGrQPWWuhE7WC3MS2S6r4IE3fwWZ8TK
	6gaXKBs1rERQnfpCfr9qh2wSRW2SfgIr/hPjo2FaFTYZhuBhANoiEBzejZknoA==
Authentication-Results: outgoing_mbo_mout;
	dkim=none;
	spf=pass (outgoing_mbo_mout: domain of tomasz@bojanowski.me designates 2001:67c:2050:b231:465::202 as permitted sender) smtp.mailfrom=tomasz@bojanowski.me
From: Tomasz Bojanowski <tomasz@bojanowski.me>
To: Guenter Roeck <linux@roeck-us.net>
Cc: linux-hwmon@vger.kernel.org,
	Hamza Mahfooz <someguy@effective-light.com>,
	Jonathan Corbet <corbet@lwn.net>,
	Shuah Khan <skhan@linuxfoundation.org>,
	Randy Dunlap <rdunlap@infradead.org>,
	linux-doc@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH] hwmon: (nct6683) Make pwmN_auto_channels_temp of NCT6687D-R writable
Date: Tue, 17 Nov 2026 00:26:12 +0100
Message-ID: <20261116232612.501586-1-tomasz@bojanowski.me>
X-Mailer: git-send-email 2.56.1
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Post: <mailto:linux-hwmon@vger.kernel.org>
List-Help: <mailto:linux-hwmon+help@vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-hwmon+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Rspamd-Queue-Id: 4jT3s53K5dz8v3N

Allow selecting the temperature used by a fan curve on MSI boards with
an NCT6687D-R (customer ID 0x20d), in manual and in automatic mode.

On an MSI MAG B850M MORTAR WIFI, the BIOS setup offers four temperature
sources for the fans: CPU Core, System, MOS and Chipset A. Reading the EC
before and after selecting them shows that each sets a single bit in the
lowest byte of the fan's source register, the bit of the monitoring
channel of temp1, temp2, temp3 and temp4 respectively, and that nothing
else in the fan curve registers changes. The other bytes were never seen
in use, and how the EC would combine several bits is not known, so only
a single temperature reported by the driver on the first eight monitoring
channels can be selected; other values return -EINVAL. The range can be
extended if a board needs it.

The attribute is writable if, when the driver is loaded, the curve uses
one such temperature. Before each write the driver checks that this is
still the case and returns -EIO otherwise, so that it does not overwrite
a source which could not be selected again.

The source is written in a configuration phase and read back, as the
curve points are. If that fails while the EC responds, the previous
source is written again. Sources selected through sysfs are restored on
resume, after the curves and before manual mode.

Tested on an MSI MAG B850M MORTAR WIFI (MS-7E61) with pwm16 and a test
curve rising by 10 per degree Celsius around the measured temperatures.
After selecting temp2, temp3 and temp4 in turn in automatic mode, the
duty cycle followed the curve for the newly selected temperature. Invalid
values returned -EINVAL and left the source unchanged. A source selected
in manual mode took effect after switching back to automatic mode. After
suspend to RAM, the source and the curve were the same as before, and
manual mode was still restored. With the driver unloaded during suspend,
the BIOS restored its own curve but the EC kept the selected source, so
restoring the source on resume could not be tested on this board.

Signed-off-by: Tomasz Bojanowski <tomasz@bojanowski.me>
---
I used an AI assistant (Claude Code) during development, including for
the test scripts and for comparing the EC register dumps. I reviewed all
of the changes, ran the tests on the hardware described above, and take
responsibility for them.

 Documentation/hwmon/nct6683.rst |  18 +++-
 drivers/hwmon/nct6683.c         | 158 +++++++++++++++++++++++++++++++-
 2 files changed, 168 insertions(+), 8 deletions(-)

diff --git a/Documentation/hwmon/nct6683.rst b/Documentation/hwmon/nct6683.rst
index e72c037442e6..79b239dd6939 100644
--- a/Documentation/hwmon/nct6683.rst
+++ b/Documentation/hwmon/nct6683.rst
@@ -76,7 +76,7 @@ the following attributes, if the curve sets a duty cycle:
     millidegrees Celsius
   * pwmN_auto_point[1-7]_pwm: duty cycle of the curve point (0-255)
   * pwmN_auto_channels_temp: temperature channels used by the curve, as a
-    bitmap (1 is temp1, 2 is temp2, 4 is temp3 etc.), read-only
+    bitmap (1 is temp1, 2 is temp2, 4 is temp3 etc.)
 
 The fan curve is initially the one configured in the BIOS setup. A fan with
 Smart Fan disabled in the BIOS setup has a flat curve, with its fixed duty
@@ -95,9 +95,21 @@ Celsius and duty cycles to 0-255, and both to the values of the adjacent
 points, so the points have to be written from point 7 to point 1 to raise
 a curve and from point 1 to point 7 to lower it.
 
+pwmN_auto_channels_temp is writable if, when the driver is loaded, the
+curve uses a single temperature which can be selected; otherwise it is
+read-only. A temperature can be selected if it is reported by the driver
+and measured on one of the first eight monitoring channels of the chip; on
+the MSI MAG B850M MORTAR WIFI, these are temp1 to temp4. Writing a value
+which does not have exactly one bit set, or a temperature which cannot be
+selected, returns -EINVAL. Writing returns -EIO if the curve no longer uses
+a single temperature which can be selected or if the EC does not take the
+new temperature. It can be written in manual and in automatic mode.
+In manual mode, the new temperature is used after switching to automatic
+mode.
+
 The BIOS may restore its own settings when resuming from suspend, so the
-driver restores the curves written through it. They are kept when the
-driver is unloaded.
+driver restores the curves written and the temperatures selected through
+it. They are kept when the driver is unloaded.
 
 Tested Boards and Firmware Versions
 -----------------------------------
diff --git a/drivers/hwmon/nct6683.c b/drivers/hwmon/nct6683.c
index 078ec9023851..f979ca3a958b 100644
--- a/drivers/hwmon/nct6683.c
+++ b/drivers/hwmon/nct6683.c
@@ -187,6 +187,8 @@ superio_exit(int ioreg)
 #define NCT6687DR_REG_CURVE_OUT_HI(x, p) (0xb07 + (x) * 0x18 + (p) * 2)
 #define NCT6687DR_REG_CURVE_OUT_LO(x, p) (0xb08 + (x) * 0x18 + (p) * 2)
 #define NCT6687DR_REG_CURVE_SRC(x)	(0x910 + (x) * 4)	/* 32 bit */
+/* Monitoring channels which can be selected as the source of a fan curve */
+#define NCT6687DR_CURVE_SRC_CHANNELS	8
 #define NCT6687DR_REG_CURVE_MODE(x)	(0xa08 + (x))		/* channels 0-7 */
 #define NCT6687DR_REG_CURVE_MODE_SYS(x)	(0x240 + (x) - 10)	/* channels 10-15 */
 #define NCT6687DR_CURVE_MODE_PWM	0x40
@@ -384,6 +386,7 @@ struct nct6683_data {
 	u16 have_fan_ctrl;		/* channels supporting fan control */
 	u16 have_curve;			/* channels with a duty cycle curve */
 	u16 curve_writable;		/* channels with a writable curve */
+	u16 src_writable;		/* channels with a writable curve source */
 
 #ifdef CONFIG_PM
 	/* Remember extra register values over suspend/resume */
@@ -397,6 +400,10 @@ struct nct6683_data {
 	/* Fan curves set through sysfs, restored on resume */
 	u16 curve_set;
 	struct nct6687dr_curve curve[NCT6683_NUM_REG_FAN];
+
+	/* Temperature sources of fan curves set through sysfs, as above */
+	u16 src_set;
+	u32 src[NCT6683_NUM_REG_FAN];
 };
 
 struct nct6683_sio_data {
@@ -1435,19 +1442,26 @@ store_pwm_auto_point_pwm(struct device *dev, struct device_attribute *attr,
 	return err ? err : count;
 }
 
+/* Read the temperature source of a fan curve */
+static u32 nct6687dr_src_read(struct nct6683_data *data, int ch)
+{
+	u16 reg = NCT6687DR_REG_CURVE_SRC(ch);
+
+	return (u32)nct6683_read16(data, reg) << 16 |
+	       nct6683_read16(data, reg + 2);
+}
+
 static ssize_t
 show_pwm_auto_channels_temp(struct device *dev, struct device_attribute *attr,
 			    char *buf)
 {
 	struct sensor_device_attribute *sattr = to_sensor_dev_attr(attr);
 	struct nct6683_data *data = dev_get_drvdata(dev);
-	u16 reg = NCT6687DR_REG_CURVE_SRC(sattr->index);
 	u32 src, channels = 0;
 	int i;
 
 	mutex_lock(&data->update_lock);
-	src = (u32)nct6683_read16(data, reg) << 16 |
-	      nct6683_read16(data, reg + 2);
+	src = nct6687dr_src_read(data, sattr->index);
 	mutex_unlock(&data->update_lock);
 
 	/* Bit n of the source register selects monitoring channel n */
@@ -1465,8 +1479,109 @@ show_pwm_auto_channels_temp(struct device *dev, struct device_attribute *attr,
 	return sysfs_emit(buf, "%u\n", channels);
 }
 
-SENSOR_TEMPLATE(pwm_auto_channels_temp, "pwm%d_auto_channels_temp", 0444,
-		show_pwm_auto_channels_temp, NULL, 0);
+/*
+ * Return the index of the temperature attribute which a temperature source
+ * selects, or -1 if it does not select exactly one temperature attribute of
+ * the monitoring channels which can be selected.
+ */
+static int nct6687dr_src_temp(struct nct6683_data *data, u32 src)
+{
+	int i;
+
+	for (i = 0; i < data->temp_num; i++) {
+		if (data->temp_index[i] < NCT6687DR_CURVE_SRC_CHANNELS &&
+		    src == BIT(data->temp_index[i]))
+			return i;
+	}
+
+	return -1;
+}
+
+struct nct6687dr_src_ctx {
+	int ch;
+	u32 src;
+};
+
+static void nct6687dr_src_write(struct nct6683_data *data, void *ctx)
+{
+	const struct nct6687dr_src_ctx *sc = ctx;
+	u16 reg = NCT6687DR_REG_CURVE_SRC(sc->ch);
+
+	nct6683_write(data, reg, sc->src >> 24);
+	nct6683_write(data, reg + 1, sc->src >> 16);
+	nct6683_write(data, reg + 2, sc->src >> 8);
+	nct6683_write(data, reg + 3, sc->src);
+}
+
+/* Write a temperature source and check that the EC has taken it */
+static int nct6687dr_src_apply(struct nct6683_data *data, int ch, u32 src)
+{
+	struct nct6687dr_src_ctx sc = { .ch = ch, .src = src };
+	int err;
+
+	err = nct6687dr_fan_cfg_transaction(data, nct6687dr_src_write, &sc);
+	if (err)
+		return err;
+
+	return nct6687dr_src_read(data, ch) == src ? 0 : -EIO;
+}
+
+/*
+ * Select the temperature used by a fan curve. The previous temperature
+ * source is restored if that fails while the EC responds.
+ */
+static ssize_t
+store_pwm_auto_channels_temp(struct device *dev, struct device_attribute *attr,
+			     const char *buf, size_t count)
+{
+	struct sensor_device_attribute *sattr = to_sensor_dev_attr(attr);
+	struct nct6683_data *data = dev_get_drvdata(dev);
+	int ch = sattr->index;
+	unsigned long val;
+	u32 old, src;
+	int err;
+
+	err = kstrtoul(buf, 10, &val);
+	if (err)
+		return err;
+
+	/* Exactly one temperature which can be selected */
+	if (!is_power_of_2(val) || __ffs(val) >= data->temp_num)
+		return -EINVAL;
+	src = BIT(data->temp_index[__ffs(val)]);
+	if (nct6687dr_src_temp(data, src) < 0)
+		return -EINVAL;
+
+	mutex_lock(&data->update_lock);
+
+	/* Do not touch a source which could not be selected again */
+	old = nct6687dr_src_read(data, ch);
+	if (nct6687dr_src_temp(data, old) < 0) {
+		err = -EIO;
+		goto unlock;
+	}
+
+	err = nct6687dr_src_apply(data, ch, src);
+	if (err) {
+		/* The EC does not respond, so do not try the old source */
+		if (err == -ETIMEDOUT)
+			goto unlock;
+		if (nct6687dr_src_apply(data, ch, old))
+			dev_err(dev, "Temperature source of pwm%d in unknown state\n",
+				ch + 1);
+		goto unlock;
+	}
+
+	data->src_set |= BIT(ch);
+	data->src[ch] = src;
+unlock:
+	mutex_unlock(&data->update_lock);
+
+	return err ? err : count;
+}
+
+SENSOR_TEMPLATE(pwm_auto_channels_temp, "pwm%d_auto_channels_temp", 0644,
+		show_pwm_auto_channels_temp, store_pwm_auto_channels_temp, 0);
 SENSOR_TEMPLATE_2(pwm_auto_point1_temp, "pwm%d_auto_point1_temp", 0644,
 		  show_pwm_auto_point_temp, store_pwm_auto_point_temp, 0, 0);
 SENSOR_TEMPLATE_2(pwm_auto_point1_pwm, "pwm%d_auto_point1_pwm", 0644,
@@ -1513,6 +1628,8 @@ static umode_t nct6683_pwm_is_visible(struct kobject *kobj,
 	if (nr >= 2) {	/* fan curve */
 		if (!(data->have_curve & BIT(pwm)))
 			return 0;
+		if (nr == 2)	/* pwm_auto_channels_temp */
+			return (data->src_writable & BIT(pwm)) ? attr->mode : 0444;
 		return (data->curve_writable & BIT(pwm)) ? attr->mode : 0444;
 	}
 
@@ -1803,6 +1920,21 @@ static void nct6683_setup_sensors(struct nct6683_data *data)
 	}
 }
 
+/*
+ * The temperature source of a fan curve is writable if it selects one
+ * temperature which can be selected. This needs the temperature attributes.
+ */
+static void nct6687dr_setup_src(struct nct6683_data *data)
+{
+	unsigned long curves = data->have_curve;
+	int ch;
+
+	for_each_set_bit(ch, &curves, NCT6683_NUM_REG_FAN) {
+		if (nct6687dr_src_temp(data, nct6687dr_src_read(data, ch)) >= 0)
+			data->src_writable |= BIT(ch);
+	}
+}
+
 /*
  * Hand the fans the driver switched to manual mode back to the EC, so that
  * they do not stay at a fixed duty cycle once nobody is left to adjust it.
@@ -1886,6 +2018,7 @@ static int nct6683_probe(struct platform_device *pdev)
 	nct6683_init_device(data);
 	nct6683_setup_fans(data);
 	nct6683_setup_sensors(data);
+	nct6687dr_setup_src(data);
 
 	/* Register sysfs hooks */
 
@@ -1994,6 +2127,21 @@ static int nct6683_resume(struct device *dev)
 		}
 	}
 
+	/* Then the temperature sources of the curves */
+	set = data->src_set;
+	for_each_set_bit(ch, &set, NCT6683_NUM_REG_FAN) {
+		if (nct6687dr_src_read(data, ch) == data->src[ch])
+			continue;
+		err = nct6687dr_src_apply(data, ch, data->src[ch]);
+		if (err) {
+			dev_warn(dev, "Failed to restore temperature source of pwm%d: %d\n",
+				 ch + 1, err);
+			/* The EC does not respond, skip everything else */
+			if (err == -ETIMEDOUT)
+				goto out;
+		}
+	}
+
 	/* The BIOS may switch the fans back to automatic mode */
 	manual = data->pwm_manual;
 	for_each_set_bit(ch, &manual, NCT6683_NUM_REG_FAN) {

base-commit: 7feb288cbe29b58a8bc9c7be3040f4537427cfcb
-- 
2.56.1

