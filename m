Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=80.241.56.152
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794263691;
	b=svgs6Teo/ciRiaTYuKvywX6Sao5hGTU+Uc4U2b5em9Tp98rNUnaf5L4Nl0kkngOZi6BM
	 WcBLYcHLlQUkPFFdOz0oA1/DYibU8hhyEZ5yCFa49wdCtCEOu8zgsezX3dRk4/u7OZqQS
	 nEmQc8ya+x87DP3/ZqwzDrUCA2DIIE4KZUZYgpgRt8He9FVLk8PekfK7R+RACKlSBtz+2
	 zUU7prbLPv3v7MyHgUobta8QT6Dj8+cTBz2TmOTK67JWs7s8PFJlJOXB+OvxBAWunP6y5
	 Wk3UHKMnU73kiex5o3BBsK+/14YFMFfgm8OqZ0TxHVHzxAyDoUVw2eV0UUyC16xq3EQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794263691;
	h=DMARC-Filter:Received:DKIM-Signature:From:To:Cc:Subject:Date:
	 Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding:X-Rspamd-Queue-Id;
	bh=rMScmg8ChgtOqa0AmoYWDPnHiW7OJ9SJMVamJgURMoY=;
	b=nzu8IerHl/70QfKeRSYUkm5FP/94i8HQne/RZ5iZ8izfZKmEBPbBd10tAceZ3COgaEiN
	 gXCcS4yGiOlZn239jRKVdd/xEyzSSsbf53mz0COsFaCZaqebnEJlsi4DIC4gTRyJOjMwa
	 QFl20KIVAQBEqULgZVvK6sjexrhpdOSwmvpU8aZYfCe/RD+29Q/qzcus2XIjsM42PqIzn
	 eXGxRXbulIbbvS15UtmbEqDQy6HM+27SxvxabhQPXGx/Y6U/IKLs0kkCHTbre05WQOC7I
	 V3ZcAyLWjIPm1njF3H1+TWSyHKcBpwXzwf/rTBezG5uoqDQBlOmTg08caWIaliUMLXA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=bojanowski.me;
	spf=pass smtp.mailfrom=bojanowski.me;
	dkim=pass header.d=bojanowski.me header.i=@bojanowski.me header.a=rsa-sha256 header.s=MBO0001 header.b=VYGAj3oI;
	arc=none smtp.remote-ip=80.241.56.152
Received: from mout-p-102.mailbox.org (mout-p-102.mailbox.org [80.241.56.152])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8A9FD606A321;
	Mon,  9 Nov 2026 22:34:49 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 8A9FD606A321
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bojanowski.me
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bojanowski.me
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=bojanowski.me header.i=@bojanowski.me header.a=rsa-sha256 header.s=MBO0001 header.b=VYGAj3oI
Received: from smtp2.mailbox.org (smtp2.mailbox.org [IPv6:2001:67c:2050:b231:465::2])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519MLKEM768 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by mout-p-102.mailbox.org (Postfix) with ESMTPS id 4jNl2s5VybzKmSx;
	Mon, 09 Nov 2026 23:34:45 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bojanowski.me;
	s=MBO0001; t=1794263685;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=rMScmg8ChgtOqa0AmoYWDPnHiW7OJ9SJMVamJgURMoY=;
	b=VYGAj3oIeXiL43q3510PW8JBLz1a1jKs+9GfZrGWXsW8MZCBgHC5BYgsurNWVMDX/XnLF2
	+7qzDS/8eJiUyu5Df3BfQkgJxHsJaxP0AoVey1dGisUW4617dghc4/XXEqGxI3RkLL7y73
	mZc6bLbsdCelabM40rHiuFeFAVnetPC2Hg29YournOK4y9mR8Q9pNVFivR8t04iM8A+PRr
	kSFd284sOYXVg9izM1Uww+RtjCuTQeAzNS6FHbcjmL4x9qsFdkadlFEr+TJB/zBVvwVSDK
	o6AeGlMSE1GLLbSbQH9MMicqebq0pwNNGHDITncY8u07Z3X2BgaIxYGTjmGKwQ==
Authentication-Results: outgoing_mbo_mout;
	dkim=none;
	spf=pass (outgoing_mbo_mout: domain of tomasz@bojanowski.me designates 2001:67c:2050:b231:465::2 as permitted sender) smtp.mailfrom=tomasz@bojanowski.me
From: Tomasz Bojanowski <tomasz@bojanowski.me>
To: Guenter Roeck <linux@roeck-us.net>
Cc: linux-hwmon@vger.kernel.org,
	Hamza Mahfooz <someguy@effective-light.com>,
	Jonathan Corbet <corbet@lwn.net>,
	Shuah Khan <skhan@linuxfoundation.org>,
	Randy Dunlap <rdunlap@infradead.org>,
	linux-doc@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH 2/2] hwmon: (nct6683) Make the fan curves of NCT6687D-R writable
Date: Mon,  9 Nov 2026 23:34:42 +0100
Message-ID: <20261109223442.509238-3-tomasz@bojanowski.me>
X-Mailer: git-send-email 2.56.0
In-Reply-To: <20261109223442.509238-1-tomasz@bojanowski.me>
References: <20261109223442.509238-1-tomasz@bojanowski.me>
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
X-Rspamd-Queue-Id: 4jNl2s5VybzKmSx

Allow writing pwmN_auto_point[1-7]_temp and pwmN_auto_point[1-7]_pwm in
manual and in automatic mode. The points are writable if, when the driver
is loaded, the temperatures and the duty cycles of the curve do not
decrease and the temperatures are at most 127 degrees Celsius. The EC
firmware is not documented and does not take a curve whose duty cycles
decrease, so only curves like those set by the BIOS are written. The
limit of 127 degrees Celsius reads the same whether the EC treats the
temperature registers as signed or unsigned.

Temperatures and duty cycles are clamped to those of the adjacent points,
temperatures also to 0-127 degrees Celsius and duty cycles to 0-255. The
whole curve is written in one configuration phase and read back, to check
that the EC uses it as written. If that fails while the EC responds, the
previous curve is written again.

The BIOS may restore its own settings when resuming from suspend, so
restore the curves written through sysfs on resume, before manual mode.

Tested on an MSI MAG B850M MORTAR WIFI (MS-7E61) with pwm16: writing and
clamping of curve points, the written curve after suspend to RAM, and
manual mode after resume.

Signed-off-by: Tomasz Bojanowski <tomasz@bojanowski.me>
---
 Documentation/hwmon/nct6683.rst |  35 +++-
 drivers/hwmon/nct6683.c         | 322 ++++++++++++++++++++++++++------
 2 files changed, 287 insertions(+), 70 deletions(-)

diff --git a/Documentation/hwmon/nct6683.rst b/Documentation/hwmon/nct6683.rst
index 62da8fd011c8..589839193874 100644
--- a/Documentation/hwmon/nct6683.rst
+++ b/Documentation/hwmon/nct6683.rst
@@ -60,25 +60,40 @@ fan reported by fanN_input.
 pwmN_enable selects the fan control mode:
 
   * 1: manual mode, the duty cycle is set with pwmN
-  * 2: automatic mode, using the fan curve configured in the BIOS
+  * 2: automatic mode, using the current fan curve
 
 pwmN can only be written in manual mode. Switching to manual mode keeps the
 current duty cycle.
 
-For each fan with a pwmN_enable attribute, the fan curve configured in the
-BIOS setup is reported with the following read-only attributes, if the
-curve sets a duty cycle:
+For each fan with a pwmN_enable attribute, the fan curve is reported with
+the following attributes, if the curve sets a duty cycle:
 
   * pwmN_auto_point[1-7]_temp: temperature of the curve point, in
     millidegrees Celsius
   * pwmN_auto_point[1-7]_pwm: duty cycle of the curve point (0-255)
   * pwmN_auto_channels_temp: temperature channels used by the curve, as a
-    bitmap (1 is temp1, 2 is temp2, 4 is temp3 etc.)
-
-A fan with Smart Fan disabled in the BIOS setup has a flat curve, with its
-fixed duty cycle at all points. The curve is read from the EC on each
-access. Reading pwmN_auto_channels_temp returns -ENODATA if the curve uses
-a temperature source which the driver does not report.
+    bitmap (1 is temp1, 2 is temp2, 4 is temp3 etc.), read-only
+
+The fan curve is initially the one configured in the BIOS setup. A fan with
+Smart Fan disabled in the BIOS setup has a flat curve, with its fixed duty
+cycle at all points. The curve is read from the EC on each access. Reading
+pwmN_auto_channels_temp returns -ENODATA if the curve uses a temperature
+source which the driver does not report.
+
+The curve points are writable if, when the driver is loaded, the
+temperatures and the duty cycles of the curve do not decrease and the
+temperatures are at most 127 degrees Celsius; otherwise they are
+read-only. They can be written in manual and in automatic mode. In manual
+mode, a new curve is used after switching to automatic mode. Writing a
+point returns -EIO if the curve no longer meets these conditions or if the
+EC does not take the new curve. Temperatures are clamped to 0-127 degrees
+Celsius and duty cycles to 0-255, and both to the values of the adjacent
+points, so the points have to be written from point 7 to point 1 to raise
+a curve and from point 1 to point 7 to lower it.
+
+The BIOS may restore its own settings when resuming from suspend, so the
+driver restores the curves written through it. They are kept when the
+driver is unloaded.
 
 Tested Boards and Firmware Versions
 -----------------------------------
diff --git a/drivers/hwmon/nct6683.c b/drivers/hwmon/nct6683.c
index ce22f1e06600..fe624a5fe3c1 100644
--- a/drivers/hwmon/nct6683.c
+++ b/drivers/hwmon/nct6683.c
@@ -31,10 +31,13 @@
 #include <linux/jiffies.h>
 #include <linux/hwmon.h>
 #include <linux/hwmon-sysfs.h>
+#include <linux/math.h>
+#include <linux/minmax.h>
 #include <linux/module.h>
 #include <linux/mutex.h>
 #include <linux/platform_device.h>
 #include <linux/slab.h>
+#include <linux/string.h>
 
 enum kinds { nct6683, nct6686, nct6687 };
 
@@ -187,6 +190,7 @@ superio_exit(int ioreg)
 #define NCT6687DR_REG_CURVE_MODE(x)	(0xa08 + (x))		/* channels 0-7 */
 #define NCT6687DR_REG_CURVE_MODE_SYS(x)	(0x240 + (x) - 10)	/* channels 10-15 */
 #define NCT6687DR_CURVE_MODE_PWM	0x40
+#define NCT6687DR_CURVE_TEMP_MAX	127	/* degrees Celsius */
 
 #define NCT6687DR_REG_FAN_ENGINE_STS	0xcf8
 #define NCT6687DR_FAN_ENGINE_PHASE	BIT(3)
@@ -329,6 +333,12 @@ static const char *const nct6683_mon_label[] = {
 
 /* ------------------------------------------------------- */
 
+/* Fan curve of NCT6687D-R: temperatures in degrees Celsius, duty cycles */
+struct nct6687dr_curve {
+	u8 temp[NCT6687DR_CURVE_POINTS];
+	u8 pwm[NCT6687DR_CURVE_POINTS];
+};
+
 struct nct6683_data {
 	int addr;		/* IO base of EC space */
 	int sioreg;		/* SIO register */
@@ -371,6 +381,7 @@ struct nct6683_data {
 
 	u16 have_fan_ctrl;		/* channels supporting fan control */
 	u16 have_curve;			/* channels with a duty cycle curve */
+	u16 curve_writable;		/* channels with a writable curve */
 
 #ifdef CONFIG_PM
 	/* Remember extra register values over suspend/resume */
@@ -380,6 +391,10 @@ struct nct6683_data {
 	/* Manual fan control set through sysfs, restored on resume */
 	u16 pwm_manual;			/* channels set to manual mode */
 	u8 pwm_cmd[NCT6683_NUM_REG_FAN];	/* their duty cycle */
+
+	/* Fan curves set through sysfs, restored on resume */
+	u16 curve_set;
+	struct nct6687dr_curve curve[NCT6683_NUM_REG_FAN];
 };
 
 struct nct6683_sio_data {
@@ -954,6 +969,12 @@ static u16 nct6683_cmd_reg(int ch)
 	return ch < 8 ? NCT6683_REG_PWM_WRITE(ch) : NCT6687DR_REG_PWM_CMD_SYS(ch);
 }
 
+static u16 nct6687dr_curve_mode_reg(int ch)
+{
+	return ch < 8 ? NCT6687DR_REG_CURVE_MODE(ch) :
+			NCT6687DR_REG_CURVE_MODE_SYS(ch);
+}
+
 static bool nct6683_pwm_manual(struct nct6683_data *data, int ch)
 {
 	return nct6683_read(data, nct6683_mode_reg(ch)) & BIT(ch % 8);
@@ -1198,6 +1219,150 @@ store_pwm_enable(struct device *dev, struct device_attribute *attr,
 SENSOR_TEMPLATE(pwm_enable, "pwm%d_enable", 0444, show_pwm_enable,
 		store_pwm_enable, 0);
 
+/*
+ * Read a fan curve of NCT6687D-R. Only curves which set a duty cycle are
+ * supported: their mode register is 0x40 and the high byte of each output
+ * is zero, so that the low byte holds the duty cycle.
+ */
+static bool nct6687dr_curve_read(struct nct6683_data *data, int ch,
+				 struct nct6687dr_curve *curve)
+{
+	int p;
+
+	if (nct6683_read(data, nct6687dr_curve_mode_reg(ch)) !=
+	    NCT6687DR_CURVE_MODE_PWM)
+		return false;
+
+	for (p = 0; p < NCT6687DR_CURVE_POINTS; p++) {
+		if (nct6683_read(data, NCT6687DR_REG_CURVE_OUT_HI(ch, p)))
+			return false;
+		curve->temp[p] = nct6683_read(data,
+					      NCT6687DR_REG_CURVE_TEMP(ch, p));
+		curve->pwm[p] = nct6683_read(data,
+					     NCT6687DR_REG_CURVE_OUT_LO(ch, p));
+	}
+
+	return true;
+}
+
+/*
+ * Only curves with non-decreasing temperatures up to the limit and
+ * non-decreasing duty cycles are written. The EC does not take a curve
+ * whose duty cycles decrease.
+ */
+static bool nct6687dr_curve_valid(const struct nct6687dr_curve *curve)
+{
+	int p;
+
+	for (p = 0; p < NCT6687DR_CURVE_POINTS; p++) {
+		if (curve->temp[p] > NCT6687DR_CURVE_TEMP_MAX)
+			return false;
+		if (p && (curve->temp[p] < curve->temp[p - 1] ||
+			  curve->pwm[p] < curve->pwm[p - 1]))
+			return false;
+	}
+
+	return true;
+}
+
+/* Clamp a new value of point p to the values of the adjacent points */
+static u8 nct6687dr_curve_clamp(const u8 *val, int p, int v, int max)
+{
+	int lo = p ? val[p - 1] : 0;
+	int hi = p < NCT6687DR_CURVE_POINTS - 1 ? val[p + 1] : max;
+
+	return clamp(v, lo, hi);
+}
+
+struct nct6687dr_curve_ctx {
+	int ch;
+	const struct nct6687dr_curve *curve;
+};
+
+static void nct6687dr_curve_write(struct nct6683_data *data, void *ctx)
+{
+	const struct nct6687dr_curve_ctx *cc = ctx;
+	int ch = cc->ch;
+	int p;
+
+	for (p = 0; p < NCT6687DR_CURVE_POINTS; p++)
+		nct6683_write(data, NCT6687DR_REG_CURVE_TEMP(ch, p),
+			      cc->curve->temp[p]);
+	for (p = 0; p < NCT6687DR_CURVE_POINTS; p++) {
+		nct6683_write(data, NCT6687DR_REG_CURVE_OUT_HI(ch, p), 0);
+		nct6683_write(data, NCT6687DR_REG_CURVE_OUT_LO(ch, p),
+			      cc->curve->pwm[p]);
+	}
+	nct6683_write(data, nct6687dr_curve_mode_reg(ch),
+		      NCT6687DR_CURVE_MODE_PWM);
+}
+
+/* Write a fan curve and check that the EC has taken it */
+static int nct6687dr_curve_apply(struct nct6683_data *data, int ch,
+				 const struct nct6687dr_curve *curve)
+{
+	struct nct6687dr_curve_ctx cc = { .ch = ch, .curve = curve };
+	struct nct6687dr_curve check;
+	int err;
+
+	err = nct6687dr_fan_cfg_transaction(data, nct6687dr_curve_write, &cc);
+	if (err)
+		return err;
+
+	if (!nct6687dr_curve_read(data, ch, &check) ||
+	    memcmp(&check, curve, sizeof(check)))
+		return -EIO;
+
+	return 0;
+}
+
+/*
+ * Set the temperature (in degrees Celsius) or the duty cycle of one point
+ * of a fan curve, if not negative. The whole curve is written, and the
+ * previous one is restored if that fails while the EC responds.
+ */
+static int nct6687dr_curve_set_point(struct device *dev, int ch, int p,
+				     int temp, int pwm)
+{
+	struct nct6683_data *data = dev_get_drvdata(dev);
+	struct nct6687dr_curve old, curve;
+	int err;
+
+	mutex_lock(&data->update_lock);
+
+	/* Do not touch a curve which is no longer supported */
+	if (!nct6687dr_curve_read(data, ch, &old) ||
+	    !nct6687dr_curve_valid(&old)) {
+		err = -EIO;
+		goto unlock;
+	}
+
+	/* Keep the temperatures and the duty cycles non-decreasing */
+	curve = old;
+	if (temp >= 0)
+		curve.temp[p] = nct6687dr_curve_clamp(curve.temp, p, temp,
+						      NCT6687DR_CURVE_TEMP_MAX);
+	if (pwm >= 0)
+		curve.pwm[p] = nct6687dr_curve_clamp(curve.pwm, p, pwm, 255);
+
+	err = nct6687dr_curve_apply(data, ch, &curve);
+	if (err) {
+		/* The EC does not respond, so do not try the old curve */
+		if (err == -ETIMEDOUT)
+			goto unlock;
+		if (nct6687dr_curve_apply(data, ch, &old))
+			dev_err(dev, "Fan curve of pwm%d in unknown state\n",
+				ch + 1);
+		goto unlock;
+	}
+
+	data->curve_set |= BIT(ch);
+	data->curve[ch] = curve;
+unlock:
+	mutex_unlock(&data->update_lock);
+	return err;
+}
+
 /* Fan curves, read from the EC on each access */
 static ssize_t
 show_pwm_auto_point_temp(struct device *dev, struct device_attribute *attr,
@@ -1231,6 +1396,43 @@ show_pwm_auto_point_pwm(struct device *dev, struct device_attribute *attr,
 	return sysfs_emit(buf, "%d\n", val);
 }
 
+static ssize_t
+store_pwm_auto_point_temp(struct device *dev, struct device_attribute *attr,
+			  const char *buf, size_t count)
+{
+	struct sensor_device_attribute_2 *sattr = to_sensor_dev_attr_2(attr);
+	long val;
+	int err;
+
+	err = kstrtol(buf, 10, &val);
+	if (err)
+		return err;
+
+	val = clamp_val(val, 0, NCT6687DR_CURVE_TEMP_MAX * 1000);
+	err = nct6687dr_curve_set_point(dev, sattr->nr, sattr->index,
+					DIV_ROUND_CLOSEST(val, 1000), -1);
+
+	return err ? err : count;
+}
+
+static ssize_t
+store_pwm_auto_point_pwm(struct device *dev, struct device_attribute *attr,
+			 const char *buf, size_t count)
+{
+	struct sensor_device_attribute_2 *sattr = to_sensor_dev_attr_2(attr);
+	unsigned long val;
+	int err;
+
+	err = kstrtoul(buf, 10, &val);
+	if (err)
+		return err;
+
+	err = nct6687dr_curve_set_point(dev, sattr->nr, sattr->index, -1,
+					min_t(unsigned long, val, 255));
+
+	return err ? err : count;
+}
+
 static ssize_t
 show_pwm_auto_channels_temp(struct device *dev, struct device_attribute *attr,
 			    char *buf)
@@ -1263,34 +1465,34 @@ show_pwm_auto_channels_temp(struct device *dev, struct device_attribute *attr,
 
 SENSOR_TEMPLATE(pwm_auto_channels_temp, "pwm%d_auto_channels_temp", 0444,
 		show_pwm_auto_channels_temp, NULL, 0);
-SENSOR_TEMPLATE_2(pwm_auto_point1_temp, "pwm%d_auto_point1_temp", 0444,
-		  show_pwm_auto_point_temp, NULL, 0, 0);
-SENSOR_TEMPLATE_2(pwm_auto_point1_pwm, "pwm%d_auto_point1_pwm", 0444,
-		  show_pwm_auto_point_pwm, NULL, 0, 0);
-SENSOR_TEMPLATE_2(pwm_auto_point2_temp, "pwm%d_auto_point2_temp", 0444,
-		  show_pwm_auto_point_temp, NULL, 0, 1);
-SENSOR_TEMPLATE_2(pwm_auto_point2_pwm, "pwm%d_auto_point2_pwm", 0444,
-		  show_pwm_auto_point_pwm, NULL, 0, 1);
-SENSOR_TEMPLATE_2(pwm_auto_point3_temp, "pwm%d_auto_point3_temp", 0444,
-		  show_pwm_auto_point_temp, NULL, 0, 2);
-SENSOR_TEMPLATE_2(pwm_auto_point3_pwm, "pwm%d_auto_point3_pwm", 0444,
-		  show_pwm_auto_point_pwm, NULL, 0, 2);
-SENSOR_TEMPLATE_2(pwm_auto_point4_temp, "pwm%d_auto_point4_temp", 0444,
-		  show_pwm_auto_point_temp, NULL, 0, 3);
-SENSOR_TEMPLATE_2(pwm_auto_point4_pwm, "pwm%d_auto_point4_pwm", 0444,
-		  show_pwm_auto_point_pwm, NULL, 0, 3);
-SENSOR_TEMPLATE_2(pwm_auto_point5_temp, "pwm%d_auto_point5_temp", 0444,
-		  show_pwm_auto_point_temp, NULL, 0, 4);
-SENSOR_TEMPLATE_2(pwm_auto_point5_pwm, "pwm%d_auto_point5_pwm", 0444,
-		  show_pwm_auto_point_pwm, NULL, 0, 4);
-SENSOR_TEMPLATE_2(pwm_auto_point6_temp, "pwm%d_auto_point6_temp", 0444,
-		  show_pwm_auto_point_temp, NULL, 0, 5);
-SENSOR_TEMPLATE_2(pwm_auto_point6_pwm, "pwm%d_auto_point6_pwm", 0444,
-		  show_pwm_auto_point_pwm, NULL, 0, 5);
-SENSOR_TEMPLATE_2(pwm_auto_point7_temp, "pwm%d_auto_point7_temp", 0444,
-		  show_pwm_auto_point_temp, NULL, 0, 6);
-SENSOR_TEMPLATE_2(pwm_auto_point7_pwm, "pwm%d_auto_point7_pwm", 0444,
-		  show_pwm_auto_point_pwm, NULL, 0, 6);
+SENSOR_TEMPLATE_2(pwm_auto_point1_temp, "pwm%d_auto_point1_temp", 0644,
+		  show_pwm_auto_point_temp, store_pwm_auto_point_temp, 0, 0);
+SENSOR_TEMPLATE_2(pwm_auto_point1_pwm, "pwm%d_auto_point1_pwm", 0644,
+		  show_pwm_auto_point_pwm, store_pwm_auto_point_pwm, 0, 0);
+SENSOR_TEMPLATE_2(pwm_auto_point2_temp, "pwm%d_auto_point2_temp", 0644,
+		  show_pwm_auto_point_temp, store_pwm_auto_point_temp, 0, 1);
+SENSOR_TEMPLATE_2(pwm_auto_point2_pwm, "pwm%d_auto_point2_pwm", 0644,
+		  show_pwm_auto_point_pwm, store_pwm_auto_point_pwm, 0, 1);
+SENSOR_TEMPLATE_2(pwm_auto_point3_temp, "pwm%d_auto_point3_temp", 0644,
+		  show_pwm_auto_point_temp, store_pwm_auto_point_temp, 0, 2);
+SENSOR_TEMPLATE_2(pwm_auto_point3_pwm, "pwm%d_auto_point3_pwm", 0644,
+		  show_pwm_auto_point_pwm, store_pwm_auto_point_pwm, 0, 2);
+SENSOR_TEMPLATE_2(pwm_auto_point4_temp, "pwm%d_auto_point4_temp", 0644,
+		  show_pwm_auto_point_temp, store_pwm_auto_point_temp, 0, 3);
+SENSOR_TEMPLATE_2(pwm_auto_point4_pwm, "pwm%d_auto_point4_pwm", 0644,
+		  show_pwm_auto_point_pwm, store_pwm_auto_point_pwm, 0, 3);
+SENSOR_TEMPLATE_2(pwm_auto_point5_temp, "pwm%d_auto_point5_temp", 0644,
+		  show_pwm_auto_point_temp, store_pwm_auto_point_temp, 0, 4);
+SENSOR_TEMPLATE_2(pwm_auto_point5_pwm, "pwm%d_auto_point5_pwm", 0644,
+		  show_pwm_auto_point_pwm, store_pwm_auto_point_pwm, 0, 4);
+SENSOR_TEMPLATE_2(pwm_auto_point6_temp, "pwm%d_auto_point6_temp", 0644,
+		  show_pwm_auto_point_temp, store_pwm_auto_point_temp, 0, 5);
+SENSOR_TEMPLATE_2(pwm_auto_point6_pwm, "pwm%d_auto_point6_pwm", 0644,
+		  show_pwm_auto_point_pwm, store_pwm_auto_point_pwm, 0, 5);
+SENSOR_TEMPLATE_2(pwm_auto_point7_temp, "pwm%d_auto_point7_temp", 0644,
+		  show_pwm_auto_point_temp, store_pwm_auto_point_temp, 0, 6);
+SENSOR_TEMPLATE_2(pwm_auto_point7_pwm, "pwm%d_auto_point7_pwm", 0644,
+		  show_pwm_auto_point_pwm, store_pwm_auto_point_pwm, 0, 6);
 
 /* pwm, pwm_enable, pwm_auto_channels_temp and the fan curve points */
 #define NCT6683_PWM_TEMPLATES	(3 + 2 * NCT6687DR_CURVE_POINTS)
@@ -1306,8 +1508,11 @@ static umode_t nct6683_pwm_is_visible(struct kobject *kobj,
 	if (!(data->have_pwm & (1 << pwm)))
 		return 0;
 
-	if (nr >= 2)	/* fan curve */
-		return (data->have_curve & BIT(pwm)) ? attr->mode : 0;
+	if (nr >= 2) {	/* fan curve */
+		if (!(data->have_curve & BIT(pwm)))
+			return 0;
+		return (data->curve_writable & BIT(pwm)) ? attr->mode : 0444;
+	}
 
 	if (data->have_fan_ctrl & BIT(pwm))
 		return attr->mode | 0200;
@@ -1502,32 +1707,6 @@ static inline void nct6683_init_device(struct nct6683_data *data)
 		nct6683_write(data, NCT6683_HWM_CFG, tmp | 0x80);
 }
 
-static u16 nct6687dr_curve_mode_reg(int ch)
-{
-	return ch < 8 ? NCT6687DR_REG_CURVE_MODE(ch) :
-			NCT6687DR_REG_CURVE_MODE_SYS(ch);
-}
-
-/*
- * A fan curve sets a duty cycle if its mode register is 0x40 and the high
- * byte of each output is zero. The low byte then holds the duty cycle.
- */
-static bool nct6687dr_curve_is_pwm(struct nct6683_data *data, int ch)
-{
-	int p;
-
-	if (nct6683_read(data, nct6687dr_curve_mode_reg(ch)) !=
-	    NCT6687DR_CURVE_MODE_PWM)
-		return false;
-
-	for (p = 0; p < NCT6687DR_CURVE_POINTS; p++) {
-		if (nct6683_read(data, NCT6687DR_REG_CURVE_OUT_HI(ch, p)))
-			return false;
-	}
-
-	return true;
-}
-
 /*
  * There are a total of 24 fan inputs. Each can be configured as input
  * or as output. A maximum of 16 inputs and 8 outputs is configurable.
@@ -1563,9 +1742,14 @@ nct6683_setup_fans(struct nct6683_data *data)
 
 		/* Only report fan curves which set a duty cycle */
 		for (i = 0; i < NCT6683_NUM_REG_FAN; i++) {
-			if ((data->have_fan_ctrl & BIT(i)) &&
-			    nct6687dr_curve_is_pwm(data, i))
-				data->have_curve |= BIT(i);
+			struct nct6687dr_curve curve;
+
+			if (!(data->have_fan_ctrl & BIT(i)) ||
+			    !nct6687dr_curve_read(data, i, &curve))
+				continue;
+			data->have_curve |= BIT(i);
+			if (nct6687dr_curve_valid(&curve))
+				data->curve_writable |= BIT(i);
 		}
 	}
 }
@@ -1757,13 +1941,30 @@ static int nct6683_suspend(struct device *dev)
 static int nct6683_resume(struct device *dev)
 {
 	struct nct6683_data *data = dev_get_drvdata(dev);
-	unsigned long manual;
+	struct nct6687dr_curve curve;
+	unsigned long manual, set;
 	int ch, err;
 
 	mutex_lock(&data->update_lock);
 
 	nct6683_write(data, NCT6683_HWM_CFG, data->hwm_cfg);
 
+	/* The BIOS may restore its own fan curves, so restore ours first */
+	set = data->curve_set;
+	for_each_set_bit(ch, &set, NCT6683_NUM_REG_FAN) {
+		if (nct6687dr_curve_read(data, ch, &curve) &&
+		    !memcmp(&curve, &data->curve[ch], sizeof(curve)))
+			continue;
+		err = nct6687dr_curve_apply(data, ch, &data->curve[ch]);
+		if (err) {
+			dev_warn(dev, "Failed to restore fan curve of pwm%d: %d\n",
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
@@ -1779,6 +1980,7 @@ static int nct6683_resume(struct device *dev)
 		}
 	}
 
+out:
 	/* Force re-reading all values */
 	data->valid = false;
 	mutex_unlock(&data->update_lock);
-- 
2.56.0

