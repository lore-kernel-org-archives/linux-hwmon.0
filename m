Received: from out-2z4y-a154.jellyfish.systems (out-2z4y-a154.jellyfish.systems [198.54.127.154])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 986E33939D7
	for <linux-hwmon@vger.kernel.org>; Sun,  4 Oct 2026 15:39:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.54.127.154
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791128388; cv=none; b=cqzZlk2xSb1Mx8sXvzGZXlHNJLWsJ19mWMdTwes1Rd+pc2K0SjN7JkxgwndjP1klUhVGZIPnv+ahC1Hy5s+dQHCE9VqpJDbjLSu19iyQwF4kiS8YEqqVCdQYH+NznzYxV/SP2JvyCA0U06A825oONPJCmZJmgUbGJ6D/9RLppxY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791128388; c=relaxed/simple;
	bh=yX8J63gdyrJfsaKlHcoPm5zEfP7nCm6iujAuhEHSOfE=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=DelJUXbLEdkKmkGTezDMJZTQkWKwDgCvSVfZitUj8sGiERB1LWGe8AUlr7Ehq3UYuVmWHcwW6645ACT48XqJQNEBwtvN0LnKco1ZO7F1siY/HjF/AnaOdrfzjBaUzDXitad/ioIO5d9ckYZIPAVrGVL4B/k42tlA8Vk/rvdVKVM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=effective-light.com; spf=pass smtp.mailfrom=effective-light.com; arc=none smtp.client-ip=198.54.127.154
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=effective-light.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=effective-light.com
Received: from mail.privateemail.com (unknown [174.89.145.246])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mail.privateemail.com (Postfix) with ESMTPSA id 4hyRPx4N5TzyNX;
	Sun, 04 Oct 2026 15:33:57 +0000 (UTC)
From: Hamza Mahfooz <someguy@effective-light.com>
To: linux-hwmon@vger.kernel.org
Cc: Guenter Roeck <linux@roeck-us.net>,
	Jonathan Corbet <corbet@lwn.net>,
	Randy Dunlap <rdunlap@infradead.org>,
	linux-doc@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Hamza Mahfooz <someguy@effective-light.com>
Subject: [PATCH 2/2] hwmon: (nct6683) Add fan control support for MSI boards with NCT6687D-R
Date: Sun,  4 Oct 2026 11:32:50 -0400
Message-ID: <20261004153250.516730-3-someguy@effective-light.com>
X-Mailer: git-send-email 2.56.0
In-Reply-To: <20261004153250.516730-1-someguy@effective-light.com>
References: <20261004153250.516730-1-someguy@effective-light.com>
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Envelope-From: someguy@effective-light.com

The fan control registers of the NCT6687D-R used on recent MSI boards
(customer ID 0x20d) differ from the ones used on Mitac boards, and
changes must be made in a configuration phase of its fan engine.

Add fan control support for these boards, based on a reverse engineered
register map:

- Manual mode is selected with bit (channel % 8) of register 0xa00
  (channels 0-7) or 0x80f (channels 8-15). In manual mode, the duty
  cycle is set with register (0xa28 + channel) (channels 0-7) or
  (0x260 + channel - 10) (channels 10-15). Otherwise, the fan curve
  configured by the BIOS is used.
- A configuration phase is requested by setting bit 7 of register
  0xa01, and is entered once register 0xcf8 reports that the fan
  registers are unlocked. It is completed by setting bit 6 of register
  0xa01, after which the EC checks the new configuration, locks the
  registers again and reports whether the configuration was accepted.

Fan control is supported for the CPU (channel 0), pump (channel 1) and
system fan (channels 10-15) headers. Add pwmN_enable attributes for
them, with 1 selecting manual and 2 automatic mode, and make pwmN
writable in manual mode. The behaviour of the driver does not change
unless pwmN or pwmN_enable is written.

Signed-off-by: Hamza Mahfooz <someguy@effective-light.com>
---
 Documentation/hwmon/nct6683.rst |  17 +++
 drivers/hwmon/nct6683.c         | 209 +++++++++++++++++++++++++++++++-
 2 files changed, 223 insertions(+), 3 deletions(-)

diff --git a/Documentation/hwmon/nct6683.rst b/Documentation/hwmon/nct6683.rst
index c47b0709c..ffc80fad3 100644
--- a/Documentation/hwmon/nct6683.rst
+++ b/Documentation/hwmon/nct6683.rst
@@ -49,6 +49,22 @@ The driver has only been tested with the Intel firmware, and by default
 only instantiates on Intel boards. To enable it on non-Intel boards,
 set the 'force' module parameter to 1.
 
+Fan Control
+-----------
+
+Fan control is supported on MSI boards with an NCT6687D-R (customer ID
+0x20d). pwm1 and pwm2 control the CPU and pump fan headers, and pwm11 to
+pwm16 control the system fan headers that are present. pwmN controls the
+fan reported by fanN_input.
+
+pwmN_enable selects the fan control mode:
+
+  * 1: manual mode, the duty cycle is set with pwmN
+  * 2: automatic mode, using the fan curve configured in the BIOS
+
+pwmN can only be written in manual mode. Switching to manual mode keeps the
+current duty cycle.
+
 Tested Boards and Firmware Versions
 -----------------------------------
 
@@ -71,6 +87,7 @@ MSI B550M			NCT6687D EC firmware version 1.0 build 05/07/20
 MSI B650			NCT6687D EC firmware version 0.0 build 09/27/22
 MSI B650M			NCT6687D EC firmware version 0.0 build 09/27/22
 MSI B850M			NCT6687D EC firmware version 0.0 build 03/10/25
+MSI B850-P			NCT6687D EC firmware version 0.0 build 04/18/25
 MSI X670-P			NCT6687D EC firmware version 0.0 build 09/27/22
 MSI X870E			NCT6687D EC firmware version 0.0 build 11/13/24
 ===============================	===============================================
diff --git a/drivers/hwmon/nct6683.c b/drivers/hwmon/nct6683.c
index a43e23c65..769a1eec9 100644
--- a/drivers/hwmon/nct6683.c
+++ b/drivers/hwmon/nct6683.c
@@ -27,6 +27,7 @@
 #include <linux/err.h>
 #include <linux/init.h>
 #include <linux/io.h>
+#include <linux/iopoll.h>
 #include <linux/jiffies.h>
 #include <linux/hwmon.h>
 #include <linux/hwmon-sysfs.h>
@@ -166,11 +167,22 @@ superio_exit(int ioreg)
 
 #define NCT6683_REG_FAN_MIN(x)		(0x3b8 + (x) * 2)	/* 16 bit */
 
+#define NCT6683_REG_FAN_MODE		0xa00	/* channels 0-7 */
 #define NCT6683_REG_FAN_CFG_CTRL	0xa01
 #define NCT6683_FAN_CFG_REQ		0x80
 #define NCT6683_FAN_CFG_DONE		0x40
 
+#define NCT6687DR_REG_FAN_MODE_SYS	0x80f	/* channels 8-15 */
 #define NCT6687DR_REG_PWM_SYS(x)	(0xe00 + (x) - 10)	/* channels 10-15 */
+#define NCT6687DR_REG_PWM_CMD_SYS(x)	(0x260 + (x) - 10)	/* channels 10-15 */
+
+#define NCT6687DR_FAN_CTRL_MASK		(BIT(0) | BIT(1) | GENMASK(15, 10))
+
+#define NCT6687DR_REG_FAN_ENGINE_STS	0xcf8
+#define NCT6687DR_FAN_ENGINE_PHASE	BIT(3)
+#define NCT6687DR_FAN_ENGINE_INVALID	BIT(4)
+#define NCT6687DR_FAN_ENGINE_CHECK_DONE	BIT(5)
+#define NCT6687DR_FAN_ENGINE_LOCK	BIT(6)
 
 #define NCT6683_REG_CUSTOMER_ID		0x602
 #define NCT6683_CUSTOMER_ID_INTEL	0x805
@@ -347,6 +359,8 @@ struct nct6683_data {
 	u16 have_pwm;
 	u8 pwm[NCT6683_NUM_REG_FAN];	/* indexed by fan channel */
 
+	u16 have_fan_ctrl;		/* channels supporting fan control */
+
 #ifdef CONFIG_PM
 	/* Remember extra register values over suspend/resume */
 	u8 hwm_cfg;
@@ -925,6 +939,136 @@ static const struct sensor_template_group nct6683_temp_template_group = {
 	.base = 1,
 };
 
+static u16 nct6683_mode_reg(int ch)
+{
+	return ch < 8 ? NCT6683_REG_FAN_MODE : NCT6687DR_REG_FAN_MODE_SYS;
+}
+
+static u16 nct6683_cmd_reg(int ch)
+{
+	return ch < 8 ? NCT6683_REG_PWM_WRITE(ch) : NCT6687DR_REG_PWM_CMD_SYS(ch);
+}
+
+static bool nct6683_pwm_manual(struct nct6683_data *data, int ch)
+{
+	return nct6683_read(data, nct6683_mode_reg(ch)) & BIT(ch % 8);
+}
+
+static bool nct6683_fan_cfg_idle(struct nct6683_data *data)
+{
+	return !(nct6683_read(data, NCT6687DR_REG_FAN_ENGINE_STS) &
+		 NCT6687DR_FAN_ENGINE_PHASE) &&
+	       !(nct6683_read(data, NCT6683_REG_FAN_CFG_CTRL) &
+		 NCT6683_FAN_CFG_REQ);
+}
+
+static bool nct6687dr_fan_cfg_accessible(u16 sts)
+{
+	return (sts & (NCT6687DR_FAN_ENGINE_PHASE | NCT6687DR_FAN_ENGINE_LOCK)) ==
+		NCT6687DR_FAN_ENGINE_PHASE;
+}
+
+static int nct6687dr_fan_cfg_start(struct nct6683_data *data)
+{
+	bool idle;
+	u16 sts;
+	int err;
+
+	sts = nct6683_read(data, NCT6687DR_REG_FAN_ENGINE_STS);
+	if (nct6687dr_fan_cfg_accessible(sts))
+		return 0;
+
+	/* Wait for a pending request or configuration phase to complete */
+	err = read_poll_timeout(nct6683_fan_cfg_idle, idle, idle,
+				USEC_PER_MSEC, USEC_PER_SEC, false, data);
+	if (err)
+		return err;
+
+	nct6683_write(data, NCT6683_REG_FAN_CFG_CTRL,
+		      nct6683_read(data, NCT6683_REG_FAN_CFG_CTRL) |
+		      NCT6683_FAN_CFG_REQ);
+
+	return read_poll_timeout(nct6683_read, sts,
+				 nct6687dr_fan_cfg_accessible(sts),
+				 USEC_PER_MSEC, USEC_PER_SEC, true,
+				 data, NCT6687DR_REG_FAN_ENGINE_STS);
+}
+
+static int nct6687dr_fan_cfg_finish(struct nct6683_data *data)
+{
+	u16 sts;
+	int err;
+
+	sts = nct6683_read(data, NCT6687DR_REG_FAN_ENGINE_STS);
+	if (!nct6687dr_fan_cfg_accessible(sts))
+		return -EAGAIN;
+
+	nct6683_write(data, NCT6683_REG_FAN_CFG_CTRL,
+		      nct6683_read(data, NCT6683_REG_FAN_CFG_CTRL) |
+		      NCT6683_FAN_CFG_DONE);
+
+	/* The registers are locked again once the configuration is checked */
+	err = read_poll_timeout(nct6683_read, sts,
+				(sts & NCT6687DR_FAN_ENGINE_LOCK) &&
+				(sts & NCT6687DR_FAN_ENGINE_CHECK_DONE),
+				USEC_PER_MSEC, USEC_PER_SEC, true,
+				data, NCT6687DR_REG_FAN_ENGINE_STS);
+	if (err)
+		return err;
+
+	return (sts & NCT6687DR_FAN_ENGINE_INVALID) ? -EAGAIN : 0;
+}
+
+/*
+ * Select manual or automatic mode for a fan channel and, if cmd is not
+ * negative, set its duty cycle for manual mode.
+ */
+static int nct6683_fan_ctrl_update(struct nct6683_data *data, int ch,
+				   bool manual, int cmd)
+{
+	u16 mode_reg = nct6683_mode_reg(ch);
+	u16 cmd_reg = nct6683_cmd_reg(ch);
+	u8 mask = BIT(ch % 8);
+	int attempt, err;
+	u8 mode;
+
+	for (attempt = 0; attempt < 3; attempt++) {
+		err = nct6687dr_fan_cfg_start(data);
+		if (err)
+			return err;
+
+		mode = nct6683_read(data, mode_reg);
+		if (cmd >= 0)
+			nct6683_write(data, cmd_reg, cmd);
+		nct6683_write(data, mode_reg,
+			      manual ? mode | mask : mode & ~mask);
+
+		/* Retry if the configuration phase was lost or rejected */
+		err = nct6687dr_fan_cfg_finish(data);
+		if (err != -EAGAIN)
+			return err;
+	}
+
+	return -EIO;
+}
+
+static int nct6683_set_pwm(struct nct6683_data *data, int ch, u8 val)
+{
+	int err;
+
+	mutex_lock(&data->update_lock);
+	/* The duty cycle can only be set in manual mode */
+	if (nct6683_pwm_manual(data, ch))
+		err = nct6683_fan_ctrl_update(data, ch, true, val);
+	else
+		err = -EBUSY;
+	if (!err)
+		data->pwm[ch] = val;
+	mutex_unlock(&data->update_lock);
+
+	return err;
+}
+
 static ssize_t
 show_pwm(struct device *dev, struct device_attribute *attr, char *buf)
 {
@@ -943,10 +1087,16 @@ store_pwm(struct device *dev, struct device_attribute *attr, const char *buf,
 	struct nct6683_data *data = dev_get_drvdata(dev);
 	int index = sattr->index;
 	unsigned long val;
+	int err;
 
 	if (kstrtoul(buf, 10, &val) || val > 255)
 		return -EINVAL;
 
+	if (data->have_fan_ctrl & BIT(index)) {
+		err = nct6683_set_pwm(data, index, val);
+		return err ? err : count;
+	}
+
 	mutex_lock(&data->update_lock);
 	nct6683_write(data, NCT6683_REG_FAN_CFG_CTRL, NCT6683_FAN_CFG_REQ);
 	usleep_range(1000, 2000);
@@ -959,17 +1109,67 @@ store_pwm(struct device *dev, struct device_attribute *attr, const char *buf,
 
 SENSOR_TEMPLATE(pwm, "pwm%d", S_IRUGO, show_pwm, store_pwm, 0);
 
+static ssize_t
+show_pwm_enable(struct device *dev, struct device_attribute *attr, char *buf)
+{
+	struct sensor_device_attribute *sattr = to_sensor_dev_attr(attr);
+	struct nct6683_data *data = dev_get_drvdata(dev);
+	bool manual;
+
+	mutex_lock(&data->update_lock);
+	manual = nct6683_pwm_manual(data, sattr->index);
+	mutex_unlock(&data->update_lock);
+
+	return sysfs_emit(buf, "%d\n", manual ? 1 : 2);
+}
+
+static ssize_t
+store_pwm_enable(struct device *dev, struct device_attribute *attr,
+		 const char *buf, size_t count)
+{
+	struct sensor_device_attribute *sattr = to_sensor_dev_attr(attr);
+	struct nct6683_data *data = dev_get_drvdata(dev);
+	int index = sattr->index;
+	unsigned long val;
+	int cmd, err = 0;
+	bool manual;
+
+	if (kstrtoul(buf, 10, &val) || (val != 1 && val != 2))
+		return -EINVAL;
+
+	manual = val == 1;
+
+	mutex_lock(&data->update_lock);
+	if (nct6683_pwm_manual(data, index) != manual) {
+		/* Keep the current duty cycle when switching to manual mode */
+		cmd = manual ? nct6683_read(data, nct6683_pwm_reg(index)) : -1;
+		err = nct6683_fan_ctrl_update(data, index, manual, cmd);
+	}
+	mutex_unlock(&data->update_lock);
+
+	return err ? err : count;
+}
+
+SENSOR_TEMPLATE(pwm_enable, "pwm%d_enable", 0444, show_pwm_enable,
+		store_pwm_enable, 0);
+
 static umode_t nct6683_pwm_is_visible(struct kobject *kobj,
 				      struct attribute *attr, int index)
 {
 	struct device *dev = kobj_to_dev(kobj);
 	struct nct6683_data *data = dev_get_drvdata(dev);
-	int pwm = index;	/* pwm index */
+	int pwm = index / 2;	/* pwm index */
+	int nr = index % 2;	/* attribute index */
 
 	if (!(data->have_pwm & (1 << pwm)))
 		return 0;
 
-	/* Only update pwm values for Mitac boards */
+	if (data->have_fan_ctrl & BIT(pwm))
+		return attr->mode | 0200;
+
+	if (nr == 1)	/* pwm_enable */
+		return 0;
+
 	if (data->customer_id == NCT6683_CUSTOMER_ID_MITAC)
 		return attr->mode | S_IWUSR;
 
@@ -978,6 +1178,7 @@ static umode_t nct6683_pwm_is_visible(struct kobject *kobj,
 
 static struct sensor_device_template *nct6683_attributes_pwm_template[] = {
 	&sensor_dev_template_pwm,
+	&sensor_dev_template_pwm_enable,
 	NULL
 };
 
@@ -1165,7 +1366,9 @@ nct6683_setup_fans(struct nct6683_data *data)
 		 * The system fan channels (10-15) have no fan output
 		 * configuration register, so check their fan input instead.
 		 */
-		data->have_pwm |= data->have_fan & GENMASK(15, 10);
+		data->have_fan_ctrl = NCT6687DR_FAN_CTRL_MASK &
+			(data->have_pwm | (data->have_fan & GENMASK(15, 8)));
+		data->have_pwm |= data->have_fan_ctrl;
 	}
 }
 
-- 
2.56.0

