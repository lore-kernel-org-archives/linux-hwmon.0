Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=80.241.56.172
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794189486;
	b=obqjBlqZge9cznhBTZ25WeAiLsdr5M7xayD85Y61Iulh9WFzHL1t6fTS6jjHxYBbvPkz
	 7E1K9ESj1Daj/jcwp52OY/geSw+bdy3+mJPZD5KW6ImOhwrXO/+/AwxzXsqtKRI3l3Ex5
	 wXOzLhq+8VBDb7ZepRTZWn0JJiXTsLb1w3k6FKR3FKEA9yeRNEu9HiLBOXjLRVZR59Kw3
	 M+u4wWLptzmU3z6d5fUGN8BIAGWMq6B7TJTel798JZuAFuXtnJe5qEJT4+7Up0SFbAr7b
	 voi9v5sLOoXP1pXXQw8S7GrotLz2dgjoQjat2ETYDBGYaSRM1GiyAx14qQsxZBJw98w==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794189486;
	h=DMARC-Filter:Received:DKIM-Signature:From:To:Cc:Subject:Date:
	 Message-ID:X-Mailer:MIME-Version:Content-Transfer-Encoding:
	 X-Rspamd-Queue-Id;
	bh=x1byesaRbSB4Aw/cW4R26hKTQejuzKCpw12RadzsQGo=;
	b=qpPalg95QSMC4tU1PN7ySMjEEg/78TIgbB6o+R0LaNwrR6uZ74eOgbZsNAwBoXyk91vf
	 jYYuxiWJUF6TcnA2gBzkMZTg2P30B92kYMPdRcHl6du5lPq22g3lrpwpR2gqV7oLBGLoJ
	 GUp1zvT1JJcLmxMdqvEMqSoOL/eQaYXCv7st970bGuJwVJaupOBkstx1Gfk1TjNsvkSvY
	 6zZrFFra6j1J4/YMF5t7zvJeefKqksIio/RSZXkg+6xpm0/2yM4t/J1aRsw0WI8lKH/Qr
	 akpqweb5p5+U/2+A7fTVp9KD5OVsVzk70C5GNrOEqcP2VLzjthmofbrD+loew/yHOIA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=bojanowski.me;
	spf=pass smtp.mailfrom=bojanowski.me;
	dkim=pass header.d=bojanowski.me header.i=@bojanowski.me header.a=rsa-sha256 header.s=MBO0001 header.b=cghQm5VF;
	arc=none smtp.remote-ip=80.241.56.172
Received: from mout-p-202.mailbox.org (mout-p-202.mailbox.org [80.241.56.172])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DA609606A31C;
	Mon,  9 Nov 2026 01:58:04 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org DA609606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bojanowski.me
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bojanowski.me
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=bojanowski.me header.i=@bojanowski.me header.a=rsa-sha256 header.s=MBO0001 header.b=cghQm5VF
Received: from smtp1.mailbox.org (smtp1.mailbox.org [IPv6:2001:67c:2050:b231:465::1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519MLKEM768 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by mout-p-202.mailbox.org (Postfix) with ESMTPS id 4jNCbs0b6jzMlJf;
	Mon, 09 Nov 2026 02:58:01 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bojanowski.me;
	s=MBO0001; t=1794189481;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding;
	bh=x1byesaRbSB4Aw/cW4R26hKTQejuzKCpw12RadzsQGo=;
	b=cghQm5VFV1dDW11vErFn09D69FHP43y4ZZ0ezsVhthGdpVi6e6QK9I8IIC8Suwm9WppKuU
	w9pH1zEJzxPc4MF86rC3Jhw4kTawD9FPhxgpc70Q0pGK5T/mMN+ynBlqwlY9xzC5hW4gVe
	XAIkSIyn4zoawoPthBwcfdRRqNmGjAx1Ph2I5odICVPIqb7l5yxPsocrIvEC8uVACFIND+
	aMFFU+XZPw404t2QD2uJrR3Cr8ABn3Hr3z35+5LIza+fdHH/z/rBdPae/o2tbWwRFAkngA
	mgWlPM05SweIrnm+h4DBUtkjMm2lwkVpvaWVAVZC2/0y8yW5pi41LtVzL3BHaw==
Authentication-Results: outgoing_mbo_mout;
	dkim=none;
	spf=pass (outgoing_mbo_mout: domain of tomasz@bojanowski.me designates 2001:67c:2050:b231:465::1 as permitted sender) smtp.mailfrom=tomasz@bojanowski.me
From: Tomasz Bojanowski <tomasz@bojanowski.me>
To: Guenter Roeck <linux@roeck-us.net>
Cc: linux-hwmon@vger.kernel.org,
	Hamza Mahfooz <someguy@effective-light.com>,
	Jonathan Corbet <corbet@lwn.net>,
	Shuah Khan <skhan@linuxfoundation.org>,
	Randy Dunlap <rdunlap@infradead.org>,
	linux-doc@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH] hwmon: (nct6683) Report the fan curves of MSI boards with NCT6687D-R
Date: Mon,  9 Nov 2026 02:57:59 +0100
Message-ID: <20261109015759.24284-1-tomasz@bojanowski.me>
X-Mailer: git-send-email 2.56.0
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
X-Rspamd-Queue-Id: 4jNCbs0b6jzMlJf

In automatic mode, the fans of MSI boards with an NCT6687D-R (customer
ID 0x20d) follow the fan curve configured in the BIOS setup. Report
these curves with the standard pwmN_auto_point[1-7]_temp,
pwmN_auto_point[1-7]_pwm and pwmN_auto_channels_temp attributes,
so that users can see what automatic mode does.

The register layout comes from reverse engineering of the vendor's
Windows software and was confirmed by reading the EC of an MSI MAG
B850M MORTAR WIFI (MS-7E61, BIOS 1.A68, EC firmware build 03/10/25):
for all six controlled fans, the curves match the settings in the BIOS
setup, also after changing them and after a power cycle. Other boards
with customer ID 0x20d have not been checked.

The curve of fan channel n is stored at 0xb00 + 0x18 * n: seven
temperatures in degrees Celsius, followed by seven outputs of two bytes
each. On the test board, the high byte of each output is zero and the
low byte holds the duty cycle (0-255). Register 0xa08 + n (channels
0-7) or 0x240 + n - 10 (channels 10-15) is 0x40 on the test board for
all channels with a fan header. The temperature source of the curve
appears to be a bitmap of monitoring channels at 0x910 + 4 * n. The
driver assumes that bit k of this 32-bit big-endian value selects
monitoring channel k; on the test board, all curves use bit 0, which is
temp1.

The attributes are created for the channels which support fan control,
if the mode register of their curve is 0x40 and the high byte of each
output is zero when the driver is probed. They are read-only and read
from the EC on each access. If a curve uses a temperature source which
the driver does not report, reading pwmN_auto_channels_temp returns
-ENODATA. The new code only reads EC registers.

Tested on the same board with kernel 7.2.15 and the driver built as an
out-of-tree module: all attributes show the values read from the EC
with a separate read-only tool, and pwm4, which does not support fan
control, gets no fan curve attributes.

Signed-off-by: Tomasz Bojanowski <tomasz@bojanowski.me>
---
I used an AI assistant (Claude Code) during development. I reviewed all
of the changes, tested them on the hardware described above, and take
responsibility for them.

This applies on top of hwmon-next, which has the fan control support for
these boards.

Support for writing the curves would follow in a separate series. Two
questions before I start on it:

1. pwmN_enable = 2 currently means that the EC follows the curve set in
   the BIOS setup. Once the curves can be written, should 2 keep this
   meaning and restore that curve, with a new value 3 for a curve set
   through the driver? Or should 2 simply mean "the current curve"?

2. Should the driver restore the original curves when it is unloaded,
   for the fans whose curves it changed?

 Documentation/hwmon/nct6683.rst |  15 +++
 drivers/hwmon/nct6683.c         | 168 +++++++++++++++++++++++++++++++-
 2 files changed, 181 insertions(+), 2 deletions(-)

diff --git a/Documentation/hwmon/nct6683.rst b/Documentation/hwmon/nct6683.rst
index ffc80fad3865..62da8fd011c8 100644
--- a/Documentation/hwmon/nct6683.rst
+++ b/Documentation/hwmon/nct6683.rst
@@ -65,6 +65,21 @@ pwmN_enable selects the fan control mode:
 pwmN can only be written in manual mode. Switching to manual mode keeps the
 current duty cycle.
 
+For each fan with a pwmN_enable attribute, the fan curve configured in the
+BIOS setup is reported with the following read-only attributes, if the
+curve sets a duty cycle:
+
+  * pwmN_auto_point[1-7]_temp: temperature of the curve point, in
+    millidegrees Celsius
+  * pwmN_auto_point[1-7]_pwm: duty cycle of the curve point (0-255)
+  * pwmN_auto_channels_temp: temperature channels used by the curve, as a
+    bitmap (1 is temp1, 2 is temp2, 4 is temp3 etc.)
+
+A fan with Smart Fan disabled in the BIOS setup has a flat curve, with its
+fixed duty cycle at all points. The curve is read from the EC on each
+access. Reading pwmN_auto_channels_temp returns -ENODATA if the curve uses
+a temperature source which the driver does not report.
+
 Tested Boards and Firmware Versions
 -----------------------------------
 
diff --git a/drivers/hwmon/nct6683.c b/drivers/hwmon/nct6683.c
index 65e374c64fb8..f94f47e31933 100644
--- a/drivers/hwmon/nct6683.c
+++ b/drivers/hwmon/nct6683.c
@@ -178,6 +178,16 @@ superio_exit(int ioreg)
 
 #define NCT6687DR_FAN_CTRL_MASK		(BIT(0) | BIT(1) | GENMASK(15, 10))
 
+/* Fan curves of NCT6687D-R, with a temperature and an output per point */
+#define NCT6687DR_CURVE_POINTS		7
+#define NCT6687DR_REG_CURVE_TEMP(x, p)	(0xb00 + (x) * 0x18 + (p))
+#define NCT6687DR_REG_CURVE_OUT_HI(x, p) (0xb07 + (x) * 0x18 + (p) * 2)
+#define NCT6687DR_REG_CURVE_OUT_LO(x, p) (0xb08 + (x) * 0x18 + (p) * 2)
+#define NCT6687DR_REG_CURVE_SRC(x)	(0x910 + (x) * 4)	/* 32 bit */
+#define NCT6687DR_REG_CURVE_MODE(x)	(0xa08 + (x))		/* channels 0-7 */
+#define NCT6687DR_REG_CURVE_MODE_SYS(x)	(0x240 + (x) - 10)	/* channels 10-15 */
+#define NCT6687DR_CURVE_MODE_PWM	0x40
+
 #define NCT6687DR_REG_FAN_ENGINE_STS	0xcf8
 #define NCT6687DR_FAN_ENGINE_PHASE	BIT(3)
 #define NCT6687DR_FAN_ENGINE_INVALID	BIT(4)
@@ -360,6 +370,7 @@ struct nct6683_data {
 	u8 pwm[NCT6683_NUM_REG_FAN];	/* indexed by fan channel */
 
 	u16 have_fan_ctrl;		/* channels supporting fan control */
+	u16 have_curve;			/* channels with a duty cycle curve */
 
 #ifdef CONFIG_PM
 	/* Remember extra register values over suspend/resume */
@@ -1143,17 +1154,117 @@ store_pwm_enable(struct device *dev, struct device_attribute *attr,
 SENSOR_TEMPLATE(pwm_enable, "pwm%d_enable", 0444, show_pwm_enable,
 		store_pwm_enable, 0);
 
+/* Fan curves, read from the EC on each access */
+static ssize_t
+show_pwm_auto_point_temp(struct device *dev, struct device_attribute *attr,
+			 char *buf)
+{
+	struct sensor_device_attribute_2 *sattr = to_sensor_dev_attr_2(attr);
+	struct nct6683_data *data = dev_get_drvdata(dev);
+	u16 reg = NCT6687DR_REG_CURVE_TEMP(sattr->nr, sattr->index);
+	int val;
+
+	mutex_lock(&data->update_lock);
+	val = nct6683_read(data, reg);
+	mutex_unlock(&data->update_lock);
+
+	return sysfs_emit(buf, "%d\n", val * 1000);
+}
+
+static ssize_t
+show_pwm_auto_point_pwm(struct device *dev, struct device_attribute *attr,
+			char *buf)
+{
+	struct sensor_device_attribute_2 *sattr = to_sensor_dev_attr_2(attr);
+	struct nct6683_data *data = dev_get_drvdata(dev);
+	u16 reg = NCT6687DR_REG_CURVE_OUT_LO(sattr->nr, sattr->index);
+	int val;
+
+	mutex_lock(&data->update_lock);
+	val = nct6683_read(data, reg);
+	mutex_unlock(&data->update_lock);
+
+	return sysfs_emit(buf, "%d\n", val);
+}
+
+static ssize_t
+show_pwm_auto_channels_temp(struct device *dev, struct device_attribute *attr,
+			    char *buf)
+{
+	struct sensor_device_attribute *sattr = to_sensor_dev_attr(attr);
+	struct nct6683_data *data = dev_get_drvdata(dev);
+	u16 reg = NCT6687DR_REG_CURVE_SRC(sattr->index);
+	u32 src, channels = 0;
+	int i;
+
+	mutex_lock(&data->update_lock);
+	src = (u32)nct6683_read16(data, reg) << 16 |
+	      nct6683_read16(data, reg + 2);
+	mutex_unlock(&data->update_lock);
+
+	/* Bit n of the source register selects monitoring channel n */
+	for (i = 0; i < data->temp_num; i++) {
+		if (src & BIT(data->temp_index[i])) {
+			channels |= BIT(i);
+			src &= ~BIT(data->temp_index[i]);
+		}
+	}
+
+	/* Temperature sources which are not reported cannot be mapped */
+	if (src)
+		return -ENODATA;
+
+	return sysfs_emit(buf, "%u\n", channels);
+}
+
+SENSOR_TEMPLATE(pwm_auto_channels_temp, "pwm%d_auto_channels_temp", 0444,
+		show_pwm_auto_channels_temp, NULL, 0);
+SENSOR_TEMPLATE_2(pwm_auto_point1_temp, "pwm%d_auto_point1_temp", 0444,
+		  show_pwm_auto_point_temp, NULL, 0, 0);
+SENSOR_TEMPLATE_2(pwm_auto_point1_pwm, "pwm%d_auto_point1_pwm", 0444,
+		  show_pwm_auto_point_pwm, NULL, 0, 0);
+SENSOR_TEMPLATE_2(pwm_auto_point2_temp, "pwm%d_auto_point2_temp", 0444,
+		  show_pwm_auto_point_temp, NULL, 0, 1);
+SENSOR_TEMPLATE_2(pwm_auto_point2_pwm, "pwm%d_auto_point2_pwm", 0444,
+		  show_pwm_auto_point_pwm, NULL, 0, 1);
+SENSOR_TEMPLATE_2(pwm_auto_point3_temp, "pwm%d_auto_point3_temp", 0444,
+		  show_pwm_auto_point_temp, NULL, 0, 2);
+SENSOR_TEMPLATE_2(pwm_auto_point3_pwm, "pwm%d_auto_point3_pwm", 0444,
+		  show_pwm_auto_point_pwm, NULL, 0, 2);
+SENSOR_TEMPLATE_2(pwm_auto_point4_temp, "pwm%d_auto_point4_temp", 0444,
+		  show_pwm_auto_point_temp, NULL, 0, 3);
+SENSOR_TEMPLATE_2(pwm_auto_point4_pwm, "pwm%d_auto_point4_pwm", 0444,
+		  show_pwm_auto_point_pwm, NULL, 0, 3);
+SENSOR_TEMPLATE_2(pwm_auto_point5_temp, "pwm%d_auto_point5_temp", 0444,
+		  show_pwm_auto_point_temp, NULL, 0, 4);
+SENSOR_TEMPLATE_2(pwm_auto_point5_pwm, "pwm%d_auto_point5_pwm", 0444,
+		  show_pwm_auto_point_pwm, NULL, 0, 4);
+SENSOR_TEMPLATE_2(pwm_auto_point6_temp, "pwm%d_auto_point6_temp", 0444,
+		  show_pwm_auto_point_temp, NULL, 0, 5);
+SENSOR_TEMPLATE_2(pwm_auto_point6_pwm, "pwm%d_auto_point6_pwm", 0444,
+		  show_pwm_auto_point_pwm, NULL, 0, 5);
+SENSOR_TEMPLATE_2(pwm_auto_point7_temp, "pwm%d_auto_point7_temp", 0444,
+		  show_pwm_auto_point_temp, NULL, 0, 6);
+SENSOR_TEMPLATE_2(pwm_auto_point7_pwm, "pwm%d_auto_point7_pwm", 0444,
+		  show_pwm_auto_point_pwm, NULL, 0, 6);
+
+/* pwm, pwm_enable, pwm_auto_channels_temp and the fan curve points */
+#define NCT6683_PWM_TEMPLATES	(3 + 2 * NCT6687DR_CURVE_POINTS)
+
 static umode_t nct6683_pwm_is_visible(struct kobject *kobj,
 				      struct attribute *attr, int index)
 {
 	struct device *dev = kobj_to_dev(kobj);
 	struct nct6683_data *data = dev_get_drvdata(dev);
-	int pwm = index / 2;	/* pwm index */
-	int nr = index % 2;	/* attribute index */
+	int pwm = index / NCT6683_PWM_TEMPLATES;	/* pwm index */
+	int nr = index % NCT6683_PWM_TEMPLATES;		/* attribute index */
 
 	if (!(data->have_pwm & (1 << pwm)))
 		return 0;
 
+	if (nr >= 2)	/* fan curve */
+		return (data->have_curve & BIT(pwm)) ? attr->mode : 0;
+
 	if (data->have_fan_ctrl & BIT(pwm))
 		return attr->mode | 0200;
 
@@ -1166,9 +1277,29 @@ static umode_t nct6683_pwm_is_visible(struct kobject *kobj,
 	return attr->mode;
 }
 
+/*
+ * nct6683_pwm_is_visible uses the index into the following array
+ * to determine if attributes should be created or not.
+ * Any change in order or content must be matched.
+ */
 static struct sensor_device_template *nct6683_attributes_pwm_template[] = {
 	&sensor_dev_template_pwm,
 	&sensor_dev_template_pwm_enable,
+	&sensor_dev_template_pwm_auto_channels_temp,	/* 2 */
+	&sensor_dev_template_pwm_auto_point1_temp,
+	&sensor_dev_template_pwm_auto_point1_pwm,
+	&sensor_dev_template_pwm_auto_point2_temp,
+	&sensor_dev_template_pwm_auto_point2_pwm,
+	&sensor_dev_template_pwm_auto_point3_temp,
+	&sensor_dev_template_pwm_auto_point3_pwm,
+	&sensor_dev_template_pwm_auto_point4_temp,
+	&sensor_dev_template_pwm_auto_point4_pwm,
+	&sensor_dev_template_pwm_auto_point5_temp,
+	&sensor_dev_template_pwm_auto_point5_pwm,
+	&sensor_dev_template_pwm_auto_point6_temp,
+	&sensor_dev_template_pwm_auto_point6_pwm,
+	&sensor_dev_template_pwm_auto_point7_temp,
+	&sensor_dev_template_pwm_auto_point7_pwm,
 	NULL
 };
 
@@ -1327,6 +1458,32 @@ static inline void nct6683_init_device(struct nct6683_data *data)
 		nct6683_write(data, NCT6683_HWM_CFG, tmp | 0x80);
 }
 
+static u16 nct6687dr_curve_mode_reg(int ch)
+{
+	return ch < 8 ? NCT6687DR_REG_CURVE_MODE(ch) :
+			NCT6687DR_REG_CURVE_MODE_SYS(ch);
+}
+
+/*
+ * A fan curve sets a duty cycle if its mode register is 0x40 and the high
+ * byte of each output is zero. The low byte then holds the duty cycle.
+ */
+static bool nct6687dr_curve_is_pwm(struct nct6683_data *data, int ch)
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
+	}
+
+	return true;
+}
+
 /*
  * There are a total of 24 fan inputs. Each can be configured as input
  * or as output. A maximum of 16 inputs and 8 outputs is configurable.
@@ -1359,6 +1516,13 @@ nct6683_setup_fans(struct nct6683_data *data)
 		data->have_fan_ctrl = NCT6687DR_FAN_CTRL_MASK &
 			(data->have_pwm | (data->have_fan & GENMASK(15, 8)));
 		data->have_pwm |= data->have_fan_ctrl;
+
+		/* Only report fan curves which set a duty cycle */
+		for (i = 0; i < NCT6683_NUM_REG_FAN; i++) {
+			if ((data->have_fan_ctrl & BIT(i)) &&
+			    nct6687dr_curve_is_pwm(data, i))
+				data->have_curve |= BIT(i);
+		}
 	}
 }
 

base-commit: ec921ef8d81acf0cc41b3f3b6db54698e9a2917f
-- 
2.56.0

