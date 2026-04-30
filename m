Received: from azure-sdnproxy.icoremail.net (azure-sdnproxy.icoremail.net [13.75.44.102])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B37C1273F9;
	Thu, 30 Apr 2026 06:45:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=13.75.44.102
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777531532; cv=none; b=CqR8jLUfIhv9zvA8lGtpbaDNlGVun8oJ7VGqtabDCDS0lIgtatJbMqPlnI08RBdskVVLGl1VK5RaWoIyHLmT7Wvyvebb/BH+GW1y2HmrR8AaS9k8EQq4z/DIq9yu80agVw9mKxZGN873nD5CQD1C0oMR1A1Wj4ElXEY8sOtDjiU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777531532; c=relaxed/simple;
	bh=bbwd6X2g6RCBJ4/L3Nws8WaAGE0yj4c5/l2OSlKVMDk=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=J+5f9L6OgDJJQo2hC0MhTtsu6KuRopFeZaw8kblQMcDfHzUySbFUpHUMlWZdlMjkKdXdEKtGdGGVQauEiKDNwM7u1Dg+2IlZj7j0//RPoQg8qGt96kxAZfcUgG/PB/SBVMgkXnHzo/PmYGoIiUp9N03YA6bAjD1qmbRaPNP7N5g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=eswincomputing.com; spf=pass smtp.mailfrom=eswincomputing.com; arc=none smtp.client-ip=13.75.44.102
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=eswincomputing.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=eswincomputing.com
Received: from E0005156LT.eswin.cn (unknown [10.12.96.79])
	by app1 (Coremail) with SMTP id TAJkCgDXbHGC+vJpCvAVAA--.21438S2;
	Thu, 30 Apr 2026 14:45:23 +0800 (CST)
From: hehuan1@eswincomputing.com
To: linux@roeck-us.net,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	p.zabel@pengutronix.de,
	linux-hwmon@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Cc: ningyu@eswincomputing.com,
	linmin@eswincomputing.com,
	pinkesh.vaghela@einfochips.com,
	luyulin@eswincomputing.com,
	hehuan1@eswincomputing.com
Subject: [PATCH v4 2/2] hwmon: Add Eswin EIC7700 PVT sensor driver
Date: Thu, 30 Apr 2026 14:45:17 +0800
Message-ID: <20260430064519.1632-1-hehuan1@eswincomputing.com>
X-Mailer: git-send-email 2.47.1.windows.2
In-Reply-To: <20260430064107.1598-1-hehuan1@eswincomputing.com>
References: <20260430064107.1598-1-hehuan1@eswincomputing.com>
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-CM-TRANSID:TAJkCgDXbHGC+vJpCvAVAA--.21438S2
X-Coremail-Antispam: 1UD129KBjvAXoWfZrW7Aw1Dtw1DXw4kCr4fAFb_yoW8Zw17uo
	WfGFn3Xw18JrWfCrZxGF1IqFyxXwn2vw1rZF1FkFZF9F12yr1Ygay7KwnxW3W3Kr1Ygr4j
	vr1fG34rZFZ7t3Wfn29KB7ZKAUJUUUU5529EdanIXcx71UUUUU7v73VFW2AGmfu7bjvjm3
	AaLaJ3UjIYCTnIWjp_UUUYK7AC8VAFwI0_Gr0_Xr1l1xkIjI8I6I8E6xAIw20EY4v20xva
	j40_Wr0E3s1l1IIY67AEw4v_Jr0_Jr4l8cAvFVAK0II2c7xJM28CjxkF64kEwVA0rcxSw2
	x7M28EF7xvwVC0I7IYx2IY67AKxVW7JVWDJwA2z4x0Y4vE2Ix0cI8IcVCY1x0267AKxVW8
	Jr0_Cr1UM28EF7xvwVC2z280aVAFwI0_GcCE3s1l84ACjcxK6I8E87Iv6xkF7I0E14v26r
	xl6s0DM2AIxVAIcxkEcVAq07x20xvEncxIr21l5I8CrVACY4xI64kE6c02F40Ex7xfMcIj
	6xIIjxv20xvE14v26r126r1DMcIj6I8E87Iv67AKxVWUJVW8JwAm72CE4IkC6x0Yz7v_Jr
	0_Gr1lF7xvr2IYc2Ij64vIr41lF7I21c0EjII2zVCS5cI20VAGYxC7M4IIrI8v6xkF7I0E
	8cxan2IY04v7M4kE6xkIj40Ew7xC0wCY1x0262kKe7AKxVWUtVW8ZwCY02Avz4vE-syl42
	xK82IYc2Ij64vIr41l4I8I3I0E4IkC6x0Yz7v_Jr0_Gr1lx2IqxVAqx4xG67AKxVWUJVWU
	GwC20s026x8GjcxK67AKxVWUGVWUWwC2zVAF1VAY17CE14v26r1q6r43MIIYrxkI7VAKI4
	8JMIIF0xvE2Ix0cI8IcVAFwI0_JFI_Gr1lIxAIcVC0I7IYx2IY6xkF7I0E14v26r4j6F4U
	MIIF0xvE42xK8VAvwI8IcIk0rVWUJVWUCwCI42IY6I8E87Iv67AKxVWUJVW8JwCI42IY6I
	8E87Iv6xkF7I0E14v26r4j6r4UJbIYCTnIWIevJa73UjIFyTuYvjfUOHUqUUUUU
X-CM-SenderInfo: 5khk3tzqr6v25zlqu0xpsx3x1qjou0bp/

From: Huan He <hehuan1@eswincomputing.com>

Add support for ESWIN EIC7700 Voltage and Temperature sensor. The driver
supports temperature and voltage monitoring with polynomial conversion,
and provides sysfs interface for sensor data access.

The PVT IP contains one temperature sensor and four voltage sensors for
process variation monitoring.

Signed-off-by: Yulin Lu <luyulin@eswincomputing.com>
Signed-off-by: Huan He <hehuan1@eswincomputing.com>
---
 drivers/hwmon/Kconfig       |  12 +
 drivers/hwmon/Makefile      |   1 +
 drivers/hwmon/eic7700-pvt.c | 591 ++++++++++++++++++++++++++++++++++++
 drivers/hwmon/eic7700-pvt.h |  99 ++++++
 4 files changed, 703 insertions(+)
 create mode 100644 drivers/hwmon/eic7700-pvt.c
 create mode 100644 drivers/hwmon/eic7700-pvt.h

diff --git a/drivers/hwmon/Kconfig b/drivers/hwmon/Kconfig
index 14e4cea48acc..1a69dfe7bdc1 100644
--- a/drivers/hwmon/Kconfig
+++ b/drivers/hwmon/Kconfig
@@ -2033,6 +2033,18 @@ config SENSORS_DME1737
 	  This driver can also be built as a module. If so, the module
 	  will be called dme1737.
 
+config SENSORS_EIC7700_PVT
+	tristate "Eswin EIC7700 Process, Voltage, Temperature sensor driver"
+	depends on ARCH_ESWIN || COMPILE_TEST
+	depends on HWMON
+	select POLYNOMIAL
+	help
+	  If you say yes here you get support for Eswin EIC7700 PVT sensor
+	  embedded into the SoC.
+
+	  This driver can also be built as a module. If so, the module will be
+	  called eic7700-pvt.
+
 config SENSORS_EMC1403
 	tristate "SMSC EMC1403/23 thermal sensor"
 	depends on I2C
diff --git a/drivers/hwmon/Makefile b/drivers/hwmon/Makefile
index 4788996aa137..3f8c347e3758 100644
--- a/drivers/hwmon/Makefile
+++ b/drivers/hwmon/Makefile
@@ -71,6 +71,7 @@ obj-$(CONFIG_SENSORS_DME1737)	+= dme1737.o
 obj-$(CONFIG_SENSORS_DRIVETEMP)	+= drivetemp.o
 obj-$(CONFIG_SENSORS_DS620)	+= ds620.o
 obj-$(CONFIG_SENSORS_DS1621)	+= ds1621.o
+obj-$(CONFIG_SENSORS_EIC7700_PVT) += eic7700-pvt.o
 obj-$(CONFIG_SENSORS_EMC1403)	+= emc1403.o
 obj-$(CONFIG_SENSORS_EMC2103)	+= emc2103.o
 obj-$(CONFIG_SENSORS_EMC2305)	+= emc2305.o
diff --git a/drivers/hwmon/eic7700-pvt.c b/drivers/hwmon/eic7700-pvt.c
new file mode 100644
index 000000000000..d9d6a035defe
--- /dev/null
+++ b/drivers/hwmon/eic7700-pvt.c
@@ -0,0 +1,591 @@
+// SPDX-License-Identifier: GPL-2.0
+/*
+ * ESWIN EIC7700 Process, Voltage, Temperature sensor driver
+ *
+ * Copyright 2026, Beijing ESWIN Computing Technology Co., Ltd.
+ *
+ * Authors:
+ *   Yulin Lu <luyulin@eswincomputing.com>
+ *   Huan He <hehuan1@eswincomputing.com>
+ */
+
+#include <linux/bitfield.h>
+#include <linux/clk.h>
+#include <linux/delay.h>
+#include <linux/device.h>
+#include <linux/interrupt.h>
+#include <linux/io.h>
+#include <linux/module.h>
+#include <linux/of.h>
+#include <linux/platform_device.h>
+#include <linux/pm_runtime.h>
+#include <linux/polynomial.h>
+#include <linux/reset.h>
+#include "eic7700-pvt.h"
+
+static const struct pvt_sensor_info pvt_info[] = {
+	PVT_SENSOR_INFO(0, "Temperature", hwmon_temp, TEMP),
+	PVT_SENSOR_INFO(0, "Voltage", hwmon_in, VOLT),
+};
+
+/*
+ * The original translation formulae of the temperature (in degrees of Celsius)
+ * to PVT data and vice-versa are following:
+ * N = 6.0818e-8*(T^4) +1.2873e-5*(T^3) + 7.2244e-3*(T^2) + 3.6484*(T^1) +
+ *     1.6198e2,
+ * T = -1.8439e-11*(N^4) + 8.0705e-8*(N^3) + -1.8501e-4*(N^2) +
+ *     3.2843e-1*(N^1) - 4.8690e1,
+ * where T = [-40, 125]C and N = [27, 771].
+ * They must be accordingly altered to be suitable for the integer arithmetics.
+ * The technique is called 'factor redistribution', which just makes sure the
+ * multiplications and divisions are made so to have a result of the operations
+ * within the integer numbers limit. In addition we need to translate the
+ * formulae to accept millidegrees of Celsius. Here what they look like after
+ * the alterations:
+ * N = (60818e-20*(T^4) + 12873e-14*(T^3) + 72244e-9*(T^2) + 36484e-3*T +
+ *     16198e2) / 1e4,
+ * T = -18439e-12*(N^4) + 80705e-9*(N^3) - 185010e-6*(N^2) + 328430e-3*N -
+ *     48690,
+ * where T = [-40000, 125000] mC and N = [27, 771].
+ */
+static const struct polynomial poly_N_to_temp = {
+	.total_divider = 1,
+	.terms = {
+		{4, -18439, 1000, 1},
+		{3, 80705, 1000, 1},
+		{2, -185010, 1000, 1},
+		{1, 328430, 1000, 1},
+		{0, -48690, 1, 1}
+	}
+};
+
+/*
+ * Similar alterations are performed for the voltage conversion equations.
+ * The original formulae are:
+ * N = 1.3905e3*V - 5.7685e2,
+ * V = (N + 5.7685e2) / 1.3905e3,
+ * where V = [0.72, 0.88] V and N = [424, 646].
+ * After the optimization they looks as follows:
+ * N = (13905e-3*V - 5768.5) / 10,
+ * V = (N * 10^5 / 13905 + 57685 * 10^3 / 13905) / 10.
+ * where V = [720, 880] mV and N = [424, 646].
+ */
+static const struct polynomial poly_N_to_volt = {
+	.total_divider = 10,
+	.terms = {
+		{1, 100000, 13905, 1},
+		{0, 57685000, 1, 13905}
+	}
+};
+
+static inline u32 eic7700_pvt_update(void __iomem *reg, u32 mask, u32 data)
+{
+	u32 old;
+
+	old = readl_relaxed(reg);
+	writel((old & ~mask) | (data & mask), reg);
+
+	return old & mask;
+}
+
+static inline void eic7700_pvt_set_mode(struct pvt_hwmon *pvt, u32 mode)
+{
+	u32 old;
+
+	mode = FIELD_PREP(PVT_MODE_MASK, mode);
+
+	old = eic7700_pvt_update(pvt->regs + PVT_ENA, PVT_ENA_EN, 0);
+	eic7700_pvt_update(pvt->regs + PVT_MODE, PVT_MODE_MASK, mode);
+	eic7700_pvt_update(pvt->regs + PVT_ENA, PVT_ENA_EN, old);
+}
+
+static inline void eic7700_pvt_set_trim(struct pvt_hwmon *pvt, u32 val)
+{
+	u32 old;
+
+	old = eic7700_pvt_update(pvt->regs + PVT_ENA, PVT_ENA_EN, 0);
+	writel(val, pvt->regs + PVT_TRIM);
+	eic7700_pvt_update(pvt->regs + PVT_ENA, PVT_ENA_EN, old);
+}
+
+static irqreturn_t eic7700_pvt_hard_isr(int irq, void *data)
+{
+	struct pvt_hwmon *pvt = data;
+	u32 val;
+
+	eic7700_pvt_update(pvt->regs + PVT_INT, PVT_INT_CLR, PVT_INT_CLR);
+	/*
+	 * Read the data, update the cache and notify a waiter of this event.
+	 */
+	val = readl(pvt->regs + PVT_DATA);
+	WRITE_ONCE(pvt->data_cache, FIELD_GET(PVT_DATA_OUT, val));
+	complete(&pvt->conversion);
+
+	return IRQ_HANDLED;
+}
+
+static int eic7700_pvt_read_data(struct pvt_hwmon *pvt,
+				 enum pvt_sensor_type type, long *val)
+{
+	unsigned long timeout;
+	u32 data;
+	int ret;
+
+	/*
+	 * Wait for PVT conversion to complete and update the data cache. The
+	 * data read procedure is following: set the requested PVT sensor mode,
+	 * enable conversion, wait until conversion is finished, then disable
+	 * conversion and IRQ, and read the cached data.
+	 */
+	reinit_completion(&pvt->conversion);
+
+	eic7700_pvt_set_mode(pvt, pvt_info[type].mode);
+	eic7700_pvt_update(pvt->regs + PVT_ENA, PVT_ENA_EN, PVT_ENA_EN);
+
+	/*
+	 * Wait with timeout since in case if the sensor is suddenly powered
+	 * down the request won't be completed and the caller will hang up on
+	 * this procedure until the power is back up again. Multiply the
+	 * timeout by the factor of two to prevent a false timeout.
+	 */
+	timeout = 2 * usecs_to_jiffies(ktime_to_us(pvt->timeout));
+	ret = wait_for_completion_timeout(&pvt->conversion, timeout);
+
+	eic7700_pvt_update(pvt->regs + PVT_ENA, PVT_ENA_EN, 0);
+	eic7700_pvt_update(pvt->regs + PVT_INT, PVT_INT_CLR, PVT_INT_CLR);
+
+	data = READ_ONCE(pvt->data_cache);
+
+	if (!ret)
+		return -ETIMEDOUT;
+
+	if (type == PVT_TEMP)
+		*val = polynomial_calc(&poly_N_to_temp, data);
+	else
+		*val = polynomial_calc(&poly_N_to_volt, data);
+
+	return 0;
+}
+
+static const struct hwmon_channel_info *pvt_channel_info[] = {
+	HWMON_CHANNEL_INFO(chip, HWMON_C_REGISTER_TZ),
+	HWMON_CHANNEL_INFO(temp,
+			   HWMON_T_INPUT | HWMON_T_LABEL | HWMON_T_OFFSET),
+	HWMON_CHANNEL_INFO(in, HWMON_I_INPUT | HWMON_I_LABEL),
+	NULL
+};
+
+static umode_t eic7700_pvt_hwmon_is_visible(const void *data,
+					    enum hwmon_sensor_types type,
+					    u32 attr, int ch)
+{
+	switch (type) {
+	case hwmon_temp:
+		switch (attr) {
+		case hwmon_temp_input:
+		case hwmon_temp_label:
+			return 0444;
+		case hwmon_temp_offset:
+			return 0644;
+		}
+		break;
+	case hwmon_in:
+		switch (attr) {
+		case hwmon_in_input:
+		case hwmon_in_label:
+			return 0444;
+		}
+		break;
+	default:
+		break;
+	}
+
+	return 0;
+}
+
+static int eic7700_pvt_read_trim(struct pvt_hwmon *pvt, long *val)
+{
+	u32 data;
+
+	data = readl(pvt->regs + PVT_TRIM);
+	*val = data;
+
+	return 0;
+}
+
+static int eic7700_pvt_write_trim(struct pvt_hwmon *pvt, long val)
+{
+	/*
+	 * Update PVT trim register safely while the controller is temporarily
+	 * disabled.
+	 */
+	eic7700_pvt_set_trim(pvt, val);
+
+	return 0;
+}
+
+static int eic7700_pvt_hwmon_read(struct device *dev,
+				  enum hwmon_sensor_types type, u32 attr,
+				  int ch, long *val)
+{
+	struct pvt_hwmon *pvt = dev_get_drvdata(dev);
+	int ret;
+
+	ret = pm_runtime_get_sync(pvt->dev);
+	if (ret < 0) {
+		dev_err(pvt->dev, "Failed to resume PVT device: %d\n", ret);
+		pm_runtime_put_noidle(pvt->dev);
+		return ret;
+	}
+
+	switch (type) {
+	case hwmon_temp:
+		switch (attr) {
+		case hwmon_temp_input:
+			ret = eic7700_pvt_read_data(pvt, ch, val);
+			break;
+		case hwmon_temp_offset:
+			ret = eic7700_pvt_read_trim(pvt, val);
+			break;
+		default:
+			ret = -EOPNOTSUPP;
+		}
+		break;
+	case hwmon_in:
+		if (attr == hwmon_in_input)
+			ret = eic7700_pvt_read_data(pvt, PVT_VOLT + ch, val);
+		else
+			ret = -EOPNOTSUPP;
+		break;
+	default:
+		ret = -EOPNOTSUPP;
+	}
+
+	pm_runtime_mark_last_busy(pvt->dev);
+	pm_runtime_put_autosuspend(pvt->dev);
+	return ret;
+}
+
+static int eic7700_pvt_hwmon_read_string(struct device *dev,
+					 enum hwmon_sensor_types type, u32 attr,
+					 int ch, const char **str)
+{
+	switch (type) {
+	case hwmon_temp:
+		if (attr == hwmon_temp_label) {
+			*str = pvt_info[ch].label;
+			return 0;
+		}
+		break;
+	case hwmon_in:
+		if (attr == hwmon_in_label) {
+			*str = pvt_info[PVT_VOLT + ch].label;
+			return 0;
+		}
+		break;
+	default:
+		break;
+	}
+
+	return -EOPNOTSUPP;
+}
+
+static int eic7700_pvt_hwmon_write(struct device *dev,
+				   enum hwmon_sensor_types type, u32 attr,
+				   int ch, long val)
+{
+	struct pvt_hwmon *pvt = dev_get_drvdata(dev);
+	int ret;
+
+	ret = pm_runtime_get_sync(pvt->dev);
+	if (ret < 0) {
+		dev_err(pvt->dev, "Failed to resume PVT device: %d\n", ret);
+		pm_runtime_put_noidle(pvt->dev);
+		return ret;
+	}
+
+	if (type == hwmon_temp && attr == hwmon_temp_offset)
+		ret = eic7700_pvt_write_trim(pvt, val);
+	else
+		ret = -EOPNOTSUPP;
+
+	pm_runtime_mark_last_busy(pvt->dev);
+	pm_runtime_put_autosuspend(pvt->dev);
+	return ret;
+}
+
+static const struct hwmon_ops pvt_hwmon_ops = {
+	.is_visible = eic7700_pvt_hwmon_is_visible,
+	.read = eic7700_pvt_hwmon_read,
+	.read_string = eic7700_pvt_hwmon_read_string,
+	.write = eic7700_pvt_hwmon_write
+};
+
+static const struct hwmon_chip_info pvt_hwmon_info = {
+	.ops = &pvt_hwmon_ops,
+	.info = pvt_channel_info
+};
+
+static void pvt_clear_data(void *data)
+{
+	struct pvt_hwmon *pvt = data;
+
+	complete_all(&pvt->conversion);
+}
+
+static struct pvt_hwmon *eic7700_pvt_create_data(struct platform_device *pdev)
+{
+	struct device *dev = &pdev->dev;
+	struct pvt_hwmon *pvt;
+	int ret;
+
+	pvt = devm_kzalloc(dev, sizeof(*pvt), GFP_KERNEL);
+	if (!pvt)
+		return ERR_PTR(-ENOMEM);
+
+	pvt->dev = dev;
+	init_completion(&pvt->conversion);
+
+	ret = devm_add_action(dev, pvt_clear_data, pvt);
+	if (ret) {
+		dev_err(dev, "Can't add PVT data clear action\n");
+		return ERR_PTR(ret);
+	}
+
+	return pvt;
+}
+
+static int eic7700_pvt_init_iface(struct pvt_hwmon *pvt)
+{
+	/*
+	 * Make sure controller are disabled so not to accidentally have ISR
+	 * executed before the driver data is fully initialized. Clear the IRQ
+	 * status as well.
+	 */
+	eic7700_pvt_update(pvt->regs + PVT_INT, PVT_INT_CLR, PVT_INT_CLR);
+	eic7700_pvt_update(pvt->regs + PVT_ENA, PVT_ENA_EN, 0);
+	readl(pvt->regs + PVT_INT);
+	readl(pvt->regs + PVT_DATA);
+
+	/* Setup default sensor mode and temperature trim. */
+	eic7700_pvt_set_mode(pvt, pvt_info[PVT_TEMP].mode);
+
+	/*
+	 * Max conversion latency (~333 µs) derived from PVT spec:
+	 * maximum sampling rate = 3000 samples/sec.
+	 */
+	pvt->timeout = ns_to_ktime(PVT_TOUT_MIN);
+
+	eic7700_pvt_set_trim(pvt, PVT_TRIM_DEF);
+
+	return 0;
+}
+
+static int eic7700_pvt_request_irq(struct pvt_hwmon *pvt)
+{
+	struct platform_device *pdev = to_platform_device(pvt->dev);
+	int ret;
+
+	pvt->irq = platform_get_irq(pdev, 0);
+	if (pvt->irq < 0)
+		return pvt->irq;
+
+	ret = devm_request_threaded_irq(pvt->dev, pvt->irq,
+					eic7700_pvt_hard_isr, NULL,
+					IRQF_TRIGGER_HIGH, "pvt", pvt);
+	if (ret) {
+		dev_err(pvt->dev, "Couldn't request PVT IRQ\n");
+		return ret;
+	}
+
+	return 0;
+}
+
+static int eic7700_pvt_create_hwmon(struct pvt_hwmon *pvt)
+{
+	struct device *dev = pvt->dev;
+	struct device_node *np = dev->of_node;
+	const char *node_label;
+	int type;
+	const char *names[2] = {"soc_pvt", "ddr_pvt"};
+
+	if (of_property_read_string(np, "label", &node_label)) {
+		dev_err(dev, "Missing 'label' property in DTS node\n");
+		return -EINVAL;
+	}
+
+	if (strcmp(node_label, "pvt0") == 0) {
+		type = 0;
+	} else if (strcmp(node_label, "pvt1") == 0) {
+		type = 1;
+	} else {
+		dev_err(pvt->dev, "Unsupported label: %s\n", node_label);
+		return -EINVAL;
+	}
+
+	pvt->hwmon = devm_hwmon_device_register_with_info(pvt->dev, names[type],
+							  pvt, &pvt_hwmon_info,
+							  NULL);
+	if (IS_ERR(pvt->hwmon)) {
+		dev_err(pvt->dev, "Couldn't create hwmon device\n");
+		return PTR_ERR(pvt->hwmon);
+	}
+
+	return 0;
+}
+
+static void eic7700_pvt_disable_pm_runtime(void *data)
+{
+	struct pvt_hwmon *pvt = data;
+
+	pm_runtime_dont_use_autosuspend(pvt->dev);
+	pm_runtime_disable(pvt->dev);
+}
+
+static int eic7700_pvt_probe(struct platform_device *pdev)
+{
+	struct pvt_hwmon *pvt;
+	int ret;
+
+	pvt = eic7700_pvt_create_data(pdev);
+	if (IS_ERR(pvt))
+		return PTR_ERR(pvt);
+
+	platform_set_drvdata(pdev, pvt);
+
+	pvt->regs = devm_platform_ioremap_resource(pdev, 0);
+	if (IS_ERR(pvt->regs))
+		return PTR_ERR(pvt->regs);
+
+	pvt->clk = devm_clk_get(&pdev->dev, NULL);
+	if (IS_ERR(pvt->clk))
+		return dev_err_probe(&pdev->dev, PTR_ERR(pvt->clk),
+				     "Couldn't get clock\n");
+
+	pvt->rst = devm_reset_control_get_exclusive_deasserted(&pdev->dev,
+							       NULL);
+	if (IS_ERR(pvt->rst))
+		return dev_err_probe(pvt->dev, PTR_ERR(pvt->rst),
+				     "Couldn't get reset control\n");
+
+	ret = clk_prepare_enable(pvt->clk);
+	if (ret)
+		return dev_err_probe(pvt->dev, ret, "Failed to enable clock\n");
+
+	ret = eic7700_pvt_init_iface(pvt);
+	if (ret) {
+		clk_disable_unprepare(pvt->clk);
+		return ret;
+	}
+
+	clk_disable_unprepare(pvt->clk);
+
+	ret = eic7700_pvt_request_irq(pvt);
+	if (ret)
+		return ret;
+
+	pm_runtime_enable(&pdev->dev);
+	pm_runtime_set_autosuspend_delay(&pdev->dev, 3000);
+	pm_runtime_use_autosuspend(&pdev->dev);
+	pm_runtime_get_noresume(&pdev->dev);
+
+	ret = devm_add_action_or_reset(pvt->dev, eic7700_pvt_disable_pm_runtime,
+				       pvt);
+	if (ret) {
+		pm_runtime_put_noidle(&pdev->dev);
+		return dev_err_probe(&pdev->dev, ret,
+				     "Can't register PM cleanup\n");
+	}
+
+	ret = eic7700_pvt_create_hwmon(pvt);
+	if (ret)
+		goto err_put_pm_runtime;
+
+	pm_runtime_put_autosuspend(&pdev->dev);
+
+	return 0;
+
+err_put_pm_runtime:
+	pm_runtime_put_noidle(&pdev->dev);
+	return ret;
+}
+
+static int __maybe_unused eic7700_pvt_runtime_resume(struct device *dev)
+{
+	struct pvt_hwmon *pvt = dev_get_drvdata(dev);
+	int ret;
+
+	ret = clk_prepare_enable(pvt->clk);
+	if (ret) {
+		dev_err(dev, "Failed to enable clock: %d\n", ret);
+		return ret;
+	}
+
+	return 0;
+}
+
+static int __maybe_unused eic7700_pvt_runtime_suspend(struct device *dev)
+{
+	struct pvt_hwmon *pvt = dev_get_drvdata(dev);
+
+	clk_disable_unprepare(pvt->clk);
+
+	return 0;
+}
+
+static int __maybe_unused eic7700_pvt_suspend(struct device *dev)
+{
+	int ret = 0;
+
+	if (!pm_runtime_status_suspended(dev)) {
+		ret = eic7700_pvt_runtime_suspend(dev);
+		if (ret) {
+			dev_err(dev, "Failed to suspend: %d\n", ret);
+			return ret;
+		}
+	}
+
+	return 0;
+}
+
+static int __maybe_unused eic7700_pvt_resume(struct device *dev)
+{
+	int ret = 0;
+
+	if (!pm_runtime_status_suspended(dev)) {
+		ret = eic7700_pvt_runtime_resume(dev);
+		if (ret) {
+			dev_err(dev, "Failed to resume: %d\n", ret);
+			return ret;
+		}
+	}
+
+	return 0;
+}
+
+static const struct dev_pm_ops eic7700_pvt_pm_ops = {
+	SYSTEM_SLEEP_PM_OPS(eic7700_pvt_suspend, eic7700_pvt_resume)
+	RUNTIME_PM_OPS(eic7700_pvt_runtime_suspend, eic7700_pvt_runtime_resume,
+		       NULL)
+};
+
+static const struct of_device_id pvt_of_match[] = {
+	{ .compatible = "eswin,eic7700-pvt"},
+	{ }
+};
+MODULE_DEVICE_TABLE(of, pvt_of_match);
+
+static struct platform_driver pvt_driver = {
+	.probe = eic7700_pvt_probe,
+	.driver = {
+		.name = "eic7700-pvt",
+		.of_match_table = pvt_of_match,
+		.pm = pm_ptr(&eic7700_pvt_pm_ops),
+	},
+};
+module_platform_driver(pvt_driver);
+
+MODULE_AUTHOR("Yulin Lu <luyulin@eswincomputing.com>");
+MODULE_AUTHOR("Huan He <hehuan1@eswincomputing.com>");
+MODULE_DESCRIPTION("Eswin eic7700 PVT driver");
+MODULE_LICENSE("GPL");
diff --git a/drivers/hwmon/eic7700-pvt.h b/drivers/hwmon/eic7700-pvt.h
new file mode 100644
index 000000000000..4b46cdeb2d58
--- /dev/null
+++ b/drivers/hwmon/eic7700-pvt.h
@@ -0,0 +1,99 @@
+/* SPDX-License-Identifier: GPL-2.0 */
+/*
+ * ESWIN EIC7700 Process, Voltage, Temperature sensor driver
+ *
+ * Copyright 2026, Beijing ESWIN Computing Technology Co., Ltd.
+ */
+#ifndef __HWMON_EIC7700_PVT_H__
+#define __HWMON_EIC7700_PVT_H__
+
+#include <linux/completion.h>
+#include <linux/hwmon.h>
+#include <linux/kernel.h>
+#include <linux/time.h>
+
+/* ESWIN EIC7700 PVT registers and their bitfields */
+#define PVT_TRIM		0x04
+#define PVT_MODE		0x08
+#define PVT_MODE_MASK		GENMASK(2, 0)
+#define PVT_CTRL_MODE_TEMP	0x0
+#define PVT_CTRL_MODE_VOLT	0x4
+#define PVT_ENA			0x0c
+#define PVT_ENA_EN		BIT(0)
+#define PVT_INT			0x10
+#define PVT_INT_STAT		BIT(0)
+#define PVT_INT_CLR		BIT(1)
+#define PVT_DATA		0x14
+#define PVT_DATA_OUT		GENMASK(9, 0)
+
+/*
+ * PVT sensors-related limits and default values
+ * @PVT_TEMP_CHS: Number of temperature hwmon channels.
+ * @PVT_VOLT_CHS: Number of voltage hwmon channels.
+ * @PVT_TRIM_DEF: Default temperature sensor trim value (set a proper value
+ *		  when one is determined for ESWIN EIC7700 SoC).
+ * @PVT_TOUT_MIN: Minimal timeout between samples in nanoseconds.
+ */
+#define PVT_TEMP_CHS		1
+#define PVT_VOLT_CHS		1
+#define PVT_TRIM_DEF		0
+#define PVT_TOUT_MIN		(NSEC_PER_SEC / 3000)
+
+/*
+ * enum pvt_sensor_type - ESWIN EIC7700 PVT sensor types (correspond to each PVT
+ *			  sampling mode)
+ * @PVT_TEMP: PVT Temperature sensor.
+ * @PVT_VOLT: PVT Voltage sensor.
+ */
+enum pvt_sensor_type {
+	PVT_TEMP = 0,
+	PVT_VOLT
+};
+
+/*
+ * struct pvt_sensor_info - ESWIN EIC7700 PVT sensor informational structure
+ * @channel: Sensor channel ID.
+ * @label: hwmon sensor label.
+ * @mode: PVT mode corresponding to the channel.
+ * @type: Sensor type.
+ */
+struct pvt_sensor_info {
+	int channel;
+	const char *label;
+	u32 mode;
+	enum hwmon_sensor_types type;
+};
+
+#define PVT_SENSOR_INFO(_ch, _label, _type, _mode)	\
+	{						\
+		.channel = _ch,				\
+		.label = _label,			\
+		.mode = PVT_CTRL_MODE_ ##_mode,		\
+		.type = _type,				\
+	}
+
+/*
+ * struct pvt_hwmon - Eswin EIC7700 PVT private data
+ * @dev: device structure of the PVT platform device.
+ * @hwmon: hwmon device structure.
+ * @regs: pointer to the Eswin EIC7700 PVT registers region.
+ * @irq: PVT events IRQ number.
+ * @clk: PVT core clock (1.2MHz).
+ * @rst: pointer to the reset descriptor.
+ * @data_cache: data cache in raw format.
+ * @conversion: data conversion completion.
+ * @timeout: conversion timeout.
+ */
+struct pvt_hwmon {
+	struct device *dev;
+	struct device *hwmon;
+	void __iomem *regs;
+	int irq;
+	struct clk *clk;
+	struct reset_control *rst;
+	u32 data_cache;
+	struct completion conversion;
+	ktime_t timeout;
+};
+
+#endif /* __HWMON_EIC7700_PVT_H__ */
-- 
2.25.1

