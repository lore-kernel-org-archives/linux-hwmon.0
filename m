Received: from m16.mail.163.com (m16.mail.163.com [117.135.210.3])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E682D3D9DC8;
	Sun, 20 Sep 2026 06:23:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=117.135.210.3
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789885411; cv=none; b=Z+tLck/ZUEv+kmei2Ee/xTZWY8WZL0/C7srAmM6rzdG6Dq1636AUJabiU05HwWxFPma2R61VzqSmUx7/keb99ghN504vBkHXrjBIED8GnIP5UfrwyjpoWRakhA04kAl69gIxt3BmuZ6i1Iqo2z7FVSBmbRMxqDj5njQ4wfuJpKk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789885411; c=relaxed/simple;
	bh=sJO9lQZ4/Q6Mok3iszyshajIU+4BflgauPr7goHmX2g=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=JH7e7ak0Cvg635rxbvFVKv7iTdysSZ6jaM5EJS0UPom7ESiSu3KznY5queV2/6iyMPx/OomneyDs5/c863iXb1WeFOPRunkIXl5609WMHeh2H9HjRJrdG5ML/9cTzgA34hqa/WQ35TbtF/6ccLiym9Zd7623wFBOYgDSo02Jn90=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=163.com; spf=pass smtp.mailfrom=163.com; dkim=pass (1024-bit key) header.d=163.com header.i=@163.com header.b=Xt0J7QVS; arc=none smtp.client-ip=117.135.210.3
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=163.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=163.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=163.com header.i=@163.com header.b="Xt0J7QVS"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=163.com;
	s=s110527; h=From:To:Subject:Date:Message-ID:MIME-Version; bh=jD
	A0153HZVxYP06owGcB219WmufMyyvpQZruDFFuloU=; b=Xt0J7QVSJR6BVddOHd
	qKdi6J7avDMosbqr+GHNwn6g1lSsPADUilLSjfyoa8WQktSpxIib1VkDpq1EOk6i
	HVPEiO/E1KUWB9MlXTnch9UQoOTscBLHJPJWhCDAaHLUc/Y8Nh17cLdh9Ff1wMoG
	Z5klcgJi23SRWCO+CTBeoDoI0=
Received: from debian.lenovo.com (unknown [])
	by gzga-smtp-mtada-g0-1 (Coremail) with SMTP id _____wBX5l+oe69q2VvwBg--.62082S2;
	Sun, 20 Sep 2026 14:22:32 +0800 (CST)
From: Kean Ren <rh_king@163.com>
To: Guenter Roeck <linux@roeck-us.net>
Cc: Jonathan Corbet <corbet@lwn.net>,
	Shuah Khan <skhan@linuxfoundation.org>,
	Randy Dunlap <rdunlap@infradead.org>,
	linux-hwmon@vger.kernel.org,
	linux-doc@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Kean Ren <rh_king@163.com>
Subject: [PATCH 1/1] hwmon: (spd5118) support write protected devices
Date: Sun, 20 Sep 2026 14:22:24 +0800
Message-ID: <20260920062230.2437291-1-rh_king@163.com>
X-Mailer: git-send-email 2.47.3
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID:_____wBX5l+oe69q2VvwBg--.62082S2
X-Coremail-Antispam: 1Uf129KBjvJXoW3ur15ZFWxuw1fKFWrZry7Wrg_yoWkZFWfpF
	WUGFW3trsrtr43u3yDtF4vga45Kr1Iy3yay348K3sYvFn8Kryv9Fy5XFW0vas5Ar93Kay8
	Cw4DtayUCw4UJrUanT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDUYxBIdaVFxhVjvjDU0xZFpf9x0JUrHUfUUUUU=
X-CM-SenderInfo: 5ukbyxlqj6il2tof0z/xtbC+wmPPmqve6nQUgAA3W

Some systems do not allow writes to SPD devices. On the i801 SMBus
controller family this happens when the BIOS sets SPD Write Disable, in
which case the controller refuses writes to addresses 0x50-0x57; other
platforms may enforce the same in firmware. There is no way for the driver
to query this.

spd5118 assumes that it can write to the device, which does not hold on
such systems:

  - writes to the hwmon attributes always fail with -ENXIO
  - the temperature sensor disable in spd5118_suspend() fails silently
  - spd5118_resume() fails in regcache_sync(), and the system reports

  spd5118 0-0050: Failed to write b = 0: -6
  spd5118 0-0050: PM: failed to resume async: error -6

Register 0xb in that message is the page selector register, which regmap
writes back from its cache at the end of regcache_sync(). The write of the
saved configuration register before that fails as well, but the cache code
does not report that error.

Detect write protection once at probe time by writing the page selector
register back with the value just read from it. This is a no-op on a device
which accepts writes, and it fails if writes are blocked.

If writes are not possible, run the device read-only: drop the register
cache so that regcache_sync() cannot attempt any write, skip the writes in
the suspend and resume callbacks, and make the writable attributes read
only. Alarm attributes are read only already; stop clearing a latched
status from them, since that requires a write, and report the condition as
the device presents it.

Reading the SPD NVRAM beyond the first page requires switching pages, which
is itself a write. Restrict the 'eeprom' attribute to the page which can be
read in that case, instead of returning errors for the accessible part.

The temperature sensor remains fully usable; only its configuration
becomes read-only. Document that, and leave the shared regmap
configuration alone by selecting a separate one without a register
cache.

Signed-off-by: Kean Ren <rh_king@163.com>
---
 Documentation/hwmon/spd5118.rst |  10 ++++
 drivers/hwmon/spd5118.c         | 110 +++++++++++++++++++++++++++++++++++-----
 2 files changed, 108 insertions(+), 12 deletions(-)

diff --git a/Documentation/hwmon/spd5118.rst b/Documentation/hwmon/spd5118.rst
index ef7338f46575..dc5a464372d7 100644
--- a/Documentation/hwmon/spd5118.rst
+++ b/Documentation/hwmon/spd5118.rst
@@ -54,6 +54,12 @@ temp1_crit_alarm	Temperature critical alarm
 Alarm attributes are sticky until read and will be cleared afterwards
 unless the alarm condition still applies.
 
+If the chip cannot be written to, for example because the SMBus controller has
+SPD Write Disable set or because the firmware protects the SPD, the driver runs
+the chip read-only. The writable attributes listed above are read-only then, and
+latched alarm conditions are reported as presented by the chip because clearing
+them requires a write.
+
 
 SPD (Serial Presence Detect) support
 ------------------------------------
@@ -61,3 +67,7 @@ SPD (Serial Presence Detect) support
 The driver also supports reading the SPD NVRAM on SPD5118 compatible chips.
 SPD data is available from the 'eeprom' binary attribute file attached to the
 chip's I2C device.
+
+On write protected chips only the first SPD page can be read, because selecting
+another page requires a write. The 'eeprom' attribute is limited to that page in
+this case.
diff --git a/drivers/hwmon/spd5118.c b/drivers/hwmon/spd5118.c
index 9724cf70b61d..0f70f28b92f7 100644
--- a/drivers/hwmon/spd5118.c
+++ b/drivers/hwmon/spd5118.c
@@ -76,6 +76,7 @@ static const unsigned short normal_i2c[] = {
 struct spd5118_data {
 	struct regmap *regmap;
 	struct mutex nvmem_lock;
+	bool write_protected;
 };
 
 /* hwmon */
@@ -129,8 +130,9 @@ static int spd5118_read_temp(struct regmap *regmap, u32 attr, long *val)
 	return 0;
 }
 
-static int spd5118_read_alarm(struct regmap *regmap, u32 attr, long *val)
+static int spd5118_read_alarm(struct spd5118_data *data, u32 attr, long *val)
 {
+	struct regmap *regmap = data->regmap;
 	unsigned int mask, regval;
 	int err;
 
@@ -155,7 +157,12 @@ static int spd5118_read_alarm(struct regmap *regmap, u32 attr, long *val)
 	if (err < 0)
 		return err;
 	*val = !!(regval & mask);
-	if (*val)
+	/*
+	 * Clearing a latched alarm condition requires a register write. If the
+	 * device is write protected, leave the status bit alone and report the
+	 * condition as the device presents it.
+	 */
+	if (*val && !data->write_protected)
 		return regmap_write(regmap, SPD5118_REG_TEMP_CLR, mask);
 	return 0;
 }
@@ -175,7 +182,8 @@ static int spd5118_read_enable(struct regmap *regmap, long *val)
 static int spd5118_read(struct device *dev, enum hwmon_sensor_types type,
 			u32 attr, int channel, long *val)
 {
-	struct regmap *regmap = dev_get_drvdata(dev);
+	struct spd5118_data *data = dev_get_drvdata(dev);
+	struct regmap *regmap = data->regmap;
 
 	if (type != hwmon_temp)
 		return -EOPNOTSUPP;
@@ -191,7 +199,7 @@ static int spd5118_read(struct device *dev, enum hwmon_sensor_types type,
 	case hwmon_temp_min_alarm:
 	case hwmon_temp_crit_alarm:
 	case hwmon_temp_lcrit_alarm:
-		return spd5118_read_alarm(regmap, attr, val);
+		return spd5118_read_alarm(data, attr, val);
 	case hwmon_temp_enable:
 		return spd5118_read_enable(regmap, val);
 	default:
@@ -257,7 +265,8 @@ static int spd5118_temp_write(struct regmap *regmap, u32 attr, long val)
 static int spd5118_write(struct device *dev, enum hwmon_sensor_types type,
 			 u32 attr, int channel, long val)
 {
-	struct regmap *regmap = dev_get_drvdata(dev);
+	struct spd5118_data *data = dev_get_drvdata(dev);
+	struct regmap *regmap = data->regmap;
 
 	switch (type) {
 	case hwmon_temp:
@@ -270,6 +279,8 @@ static int spd5118_write(struct device *dev, enum hwmon_sensor_types type,
 static umode_t spd5118_is_visible(const void *_data, enum hwmon_sensor_types type,
 				  u32 attr, int channel)
 {
+	const struct spd5118_data *data = _data;
+
 	if (type != hwmon_temp)
 		return 0;
 
@@ -281,7 +292,7 @@ static umode_t spd5118_is_visible(const void *_data, enum hwmon_sensor_types typ
 	case hwmon_temp_lcrit:
 	case hwmon_temp_crit:
 	case hwmon_temp_enable:
-		return 0644;
+		return data->write_protected ? 0444 : 0644;
 	case hwmon_temp_min_alarm:
 	case hwmon_temp_max_alarm:
 	case hwmon_temp_crit_alarm:
@@ -401,6 +412,14 @@ static int spd5118_nvmem_init(struct device *dev, struct spd5118_data *data)
 	};
 	struct nvmem_device *nvmem;
 
+	/*
+	 * Selecting another SPD page writes the page selector register, which
+	 * fails if the device is write protected, so only the currently
+	 * selected page is readable then. Do not advertise the others.
+	 */
+	if (data->write_protected)
+		nvmem_config.size = SPD5118_PAGE_SIZE;
+
 	nvmem = devm_nvmem_register(dev, &nvmem_config);
 	return PTR_ERR_OR_ZERO(nvmem);
 }
@@ -465,6 +484,24 @@ static const struct regmap_config spd5118_regmap8_config = {
 	.num_ranges = ARRAY_SIZE(spd5118_i2c_regmap_range_cfg),
 };
 
+/*
+ * Variant for write protected devices. Since no write can succeed, there is
+ * nothing to cache and nothing to restore on resume; dropping the cache also
+ * keeps regcache_sync() from attempting writes, which would otherwise make the
+ * system fail to resume.
+ */
+static const struct regmap_config spd5118_regmap8_ro_config = {
+	.reg_bits = 8,
+	.val_bits = 8,
+	.max_register = 0x7ff,
+	.writeable_reg = spd5118_writeable_reg,
+	.volatile_reg = spd5118_volatile_reg,
+	.cache_type = REGCACHE_NONE,
+
+	.ranges = spd5118_i2c_regmap_range_cfg,
+	.num_ranges = ARRAY_SIZE(spd5118_i2c_regmap_range_cfg),
+};
+
 /*
  * SPD5118 2-byte register address format (JESD300-5, Tables 7 & 20):
  *   Byte 1 (on wire first):  MemReg | BlkAddr[0] | Address[5:0]
@@ -493,6 +530,15 @@ static int spd5118_suspend(struct device *dev)
 	u32 regval;
 	int err;
 
+	/*
+	 * Disabling the temperature sensor means writing to the device, and
+	 * syncing back the register cache on resume means writing as well.
+	 * Neither is possible if the device is write protected, so leave the
+	 * device alone in that case.
+	 */
+	if (data->write_protected)
+		return 0;
+
 	/*
 	 * Make sure the configuration register in the regmap cache is current
 	 * before bypassing it.
@@ -517,13 +563,18 @@ static int spd5118_resume(struct device *dev)
 	struct spd5118_data *data = dev_get_drvdata(dev);
 	struct regmap *regmap = data->regmap;
 
+	/* Nothing was changed on suspend, and writes are not possible */
+	if (data->write_protected)
+		return 0;
+
 	regcache_cache_only(regmap, false);
 	return regcache_sync(regmap);
 }
 
 static DEFINE_SIMPLE_DEV_PM_OPS(spd5118_pm_ops, spd5118_suspend, spd5118_resume);
 
-static int spd5118_common_probe(struct device *dev, struct regmap *regmap)
+static int spd5118_common_probe(struct device *dev, struct regmap *regmap,
+				bool write_protected)
 {
 	unsigned int capability, revision, vendor, bank;
 	struct spd5118_data *data;
@@ -554,6 +605,7 @@ static int spd5118_common_probe(struct device *dev, struct regmap *regmap)
 		return -ENODEV;
 
 	data->regmap = regmap;
+	data->write_protected = write_protected;
 	mutex_init(&data->nvmem_lock);
 	dev_set_drvdata(dev, data);
 
@@ -565,7 +617,7 @@ static int spd5118_common_probe(struct device *dev, struct regmap *regmap)
 	}
 
 	hwmon_dev = devm_hwmon_device_register_with_info(dev, "spd5118",
-							 regmap, &spd5118_chip_info,
+							 data, &spd5118_chip_info,
 							 NULL);
 	if (IS_ERR(hwmon_dev))
 		return PTR_ERR(hwmon_dev);
@@ -681,21 +733,51 @@ static int spd5118_i2c_init(struct i2c_client *client)
 	return 0;
 }
 
+/*
+ * Writes to SPD devices can be blocked, either by the SMBus controller (SPD
+ * Write Disable, as set by the BIOS on many systems) or by firmware. There is
+ * no generic way to query this, so probe for it by writing the page selector
+ * register back with the value just read from it. That is a no-op on a device
+ * which supports writes.
+ */
+static bool spd5118_write_protected(struct i2c_client *client, int mode)
+{
+	int err;
+
+	err = i2c_smbus_write_byte_data(client, SPD5118_REG_I2C_LEGACY_MODE, mode);
+	if (err >= 0)
+		return false;
+
+	dev_info(&client->dev,
+		 "SPD writes are blocked (%d), sensor will be read-only\n", err);
+	return true;
+}
+
 static int spd5118_i2c_probe(struct i2c_client *client)
 {
+	const struct regmap_config *config = &spd5118_regmap8_config;
 	struct device *dev = &client->dev;
 	struct regmap *regmap;
-	int err;
+	int err, mode;
+	bool write_protected;
 
 	err = spd5118_i2c_init(client);
 	if (err)
 		return err;
 
-	regmap = devm_regmap_init_i2c(client, &spd5118_regmap8_config);
+	mode = i2c_smbus_read_byte_data(client, SPD5118_REG_I2C_LEGACY_MODE);
+	if (mode < 0)
+		return mode;
+
+	write_protected = spd5118_write_protected(client, mode);
+	if (write_protected)
+		config = &spd5118_regmap8_ro_config;
+
+	regmap = devm_regmap_init_i2c(client, config);
 	if (IS_ERR(regmap))
 		return dev_err_probe(dev, PTR_ERR(regmap), "regmap init failed\n");
 
-	return spd5118_common_probe(dev, regmap);
+	return spd5118_common_probe(dev, regmap, write_protected);
 }
 
 static const struct i2c_device_id spd5118_i2c_id[] = {
@@ -743,7 +825,11 @@ static int spd5118_i3c_probe(struct i3c_device *i3cdev)
 	if (regval[0] != 0x51 || regval[1] != 0x18)
 		return -ENODEV;
 
-	return spd5118_common_probe(dev, regmap);
+	/*
+	 * SPD Write Disable is an SMBus controller feature and does not apply
+	 * to I3C transfers.
+	 */
+	return spd5118_common_probe(dev, regmap, false);
 }
 
 static struct i3c_driver spd5118_i3c_driver = {
-- 
2.53.0

