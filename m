Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.48
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795456073;
	b=M9SHLJrNYpsb3iGfrKSVkdUFXcJw5TJCRpqoIcj5gfbQd7uQo62hgwoDmNhJkAh4LRE0
	 XkIZSaue87LLXJiZmIVf8ZMWnZKVFS+Lk4SUApplLNYPsAtoP122QX771OHNRhFKIas5U
	 JSyvFD/GckuQAT2tCfxJSoVSKyR0UcazYFyIZFwNJLvjaDvD09VmskqwchQfcK0Nmdw93
	 l8GhIu6j3Jer+3cSLtRPtcJNSXYKe+lbHy79n8BJ5sgOCEgJxGELqC9DPm1iPVQNhPbYm
	 wF6gB1p83iCuRAD4tOtLZT66Fy9feG2PllB8SbGgHPAujHRKj9EtDe4sbVBYIAfQgkg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795456073;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:Date:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key;
	bh=rJLnYImNyN7yJzhoXzijCWOflr8n6PidLAPrGB4X3Ag=;
	b=Pu1SEsH9dOKXXqXkLa0BPe4c/3ErNaCCknynYy2OJP1dMF9s3y0rISNgIb6qEkwF4s1D
	 xiJ89evvpjwEaswxKhY+Zj04Rmt7STOgzYJhWdaPAevjs5h8Dj5X9ZiSYdG2vCzqCMSpR
	 6+u4eqpk7toLjkhJg3aMo1uK9YANJHXs0VmFQ/sMtr3T81PDMLw0aqrScmXdV6cO4Wg/Q
	 ZeQXkybhBkfp2W+YojbLe9mtlxIjeevraXkXgfAdEqRPvJkzJ+xwO1mbkzVZxKZWZl+qt
	 BP1lIfCRbWjziAghOsAzjAgFeril1rkGgCH5QXO38CyLJTItdkeIQNjl8DPWWE0UdXQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linaro.org;
	spf=pass smtp.mailfrom=linaro.org;
	dkim=pass header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b="xv/HQpB5";
	arc=none smtp.remote-ip=209.85.128.48
Received: from mail-wm1-f48.google.com (mail-wm1-f48.google.com [209.85.128.48])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 577D4606A696
	for <linux-hwmon@vger.kernel.org>; Mon, 23 Nov 2026 17:47:52 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 577D4606A696
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=xv/HQpB5
Received: by mail-wm1-f48.google.com with SMTP id 5b1f17b1804b1-4a5177d78c7so34925095e9.2
        for <linux-hwmon@vger.kernel.org>; Mon, 23 Nov 2026 09:47:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1795456071; x=1796060871; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=rJLnYImNyN7yJzhoXzijCWOflr8n6PidLAPrGB4X3Ag=;
        b=xv/HQpB5UNd/zAdbjTDxpi5YPWiK7x2T887sxUPlcA7wbtefy9WGIBJWkE4i/Zi/gs
         ZBRuDDECghXFZC9eKvezM0xnZXAO0Q/WM28jWchaIJglY6mTqZzykbmPD4CBPPjB7zX+
         oFW/mIXLqT4gOhqy+PIvzvruCzfEH4m2Os9gfbViw6zEUs51zyfNulPlILFsvzBmDt58
         ArhD1Ud+aFKV32CXCml/m+4BETimOYo0YknDHVl0AzZqlzTbZZpGeEec5CFSnyNclCN6
         Asp2HzrKgZKKOUpFHBrv8bl3mCwENzSJ6e3POPBF9P6R1gTg9Vi1osqvCsBx2hW7NjlO
         tZ0w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795456071; x=1796060871;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=rJLnYImNyN7yJzhoXzijCWOflr8n6PidLAPrGB4X3Ag=;
        b=2O7POUosB06U721dL+U5B0ZzqppryZIlUmkUoQveBXHQlfeQmEIjC4zE8JO13nuRan
         DhzcPR0XWJnq8BYPVmtLIK62r0IWtOB7CxrbZ+j8nnRJEG7UH418J5q6B6FvU5/f/DSa
         NUF9e0Mbe6kvcSTHtuFUbTR6DH2WpBNcg54aqq0tXLdHFQwcEEFn2CkZpjYYMwSnTGGH
         2OeknTdGXa3YVZEwcvh/BkfZGKzBe+4a3qi+7hbJP5MhRPNsfpi8IzMBD4rder6oDgvj
         X8UoGDsZwC1+XdXW+H15WruUD8Olcs1/zw/4PprwZnFHD0JvT0NzbiUxUoHqzdeLaf9d
         PGuw==
X-Forwarded-Encrypted: i=1; AL+hErG0DylLlOhpihO3aWl5A+nlYb5SYaM6920jWJ4E0bvYbkY0D+hNYd9fL74lTojRP7yF6uT6yvpuwRNA+A==@vger.kernel.org
X-Gm-Message-State: APuU4Z+fIl9o7G6IGC1m2udZzVgO/rYZtX4XNtKpdM8dsUgQoIBQR5us
	RblRRZJfu/cSBXohjkS5CtTCZrYe+Mo0kTtU6sPq5nrDvr3kO1OpJzEVWAcV2EqQ2YsWVytmeq2
	J9ubUD3o=
X-Gm-Gg: AZFdTZc+q7Evb3wzQfkwHQdF2Qor2TuZ55b2xtupVjD07j+aMJUHcU9Syb+pSFgfoPd
	u0NYmss90EwzAT/RzxCR0QhdEDud6teZx90H1N59bZQEgqfcAYLa1Ga/x7rGeK+8I9Bbvv3uEQD
	t8yTVexjmfp97iYfqC2im9iRcBnZz3Q7qIALak/OtnaY5D+m8c+LpQUMrQYJ49NKaf7rUIcM4ou
	Dj421Et0rCwAHMcVtw6YPAC8VnYXGqWQioNakNivj32CBuiXr2BHLfi8wt/lQLfTC94vXyzH27J
	9t9sJ1ST9hMVbqe+U0PgHBTbXVFUf8qz9zmtHRYXAc3YcjPugZn8QHyW1e8fDWPz8MUdr6Y8dz9
	zmJMjUxC6EbzZFsui0N2Dhq6+PT04pX82xUKzD0CWlwzQg0OQYjSgYd7DY+CAwJ8KsDHQBmsrWF
	qhMsCgaeffpD0diR96ko4r6aWwB0CUd2kehjC6yMwVp9fp9CT79HY1TS/4Cl3bGgkCaw6I0Tgjt
	BtDIWuT+L5IfnyTJvQH8BfuXm2VyoBQdrUOWX4C1/3EP+ivZ0XRzLFWkQH0+K6xGElV+qxWBmJ8
	5mjzagcdyBhoLTDVd63VmzDZCd7GHBbs3Wn6XgUgX1KOQn5qgIA=
X-Received: by 2002:a05:600c:1d09:b0:4bb:6fd3:5ac0 with SMTP id 5b1f17b1804b1-4bb88816c7emr272337155e9.28.1795456070347;
        Mon, 23 Nov 2026 09:47:50 -0800 (PST)
Received: from arrakeen.starnux.net ([2a01:e0a:106d:1080:8261:5fff:fe11:bdda])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4ab6bc8ce06sm22961413f8f.47.2026.11.23.09.47.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 23 Nov 2026 09:47:50 -0800 (PST)
From: Neil Armstrong <neil.armstrong@linaro.org>
Date: Mon, 23 Nov 2026 18:47:46 +0100
Subject: [PATCH v7 3/3] iio: adc: add driver for the MAX34417 Four-Channel
 High Dynamic Range Power Accumulator
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Post: <mailto:linux-hwmon@vger.kernel.org>
List-Help: <mailto:linux-hwmon+help@vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-hwmon+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261123-topic-sm8x50-iio-max34417-adc-v7-3-d8f87edc5086@linaro.org>
References: <20261123-topic-sm8x50-iio-max34417-adc-v7-0-d8f87edc5086@linaro.org>
In-Reply-To: <20261123-topic-sm8x50-iio-max34417-adc-v7-0-d8f87edc5086@linaro.org>
To: Jonathan Cameron <jic23@kernel.org>, 
 David Lechner <dlechner@baylibre.com>, 
 =?utf-8?q?Nuno_S=C3=A1?= <nuno.sa@analog.com>, 
 Andy Shevchenko <andy@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Michael Hennerich <Michael.Hennerich@analog.com>
Cc: linux-iio@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-hwmon@vger.kernel.org, 
 Neil Armstrong <neil.armstrong@linaro.org>, linux@analog.com
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=28192;
 i=neil.armstrong@linaro.org; h=from:subject:message-id;
 bh=P//KFcLTS1FeKZVPywyuWVUIMUqPV12hbVb+c+bof70=;
 b=owEBbQKS/ZANAwAKAXfc29rIyEnRAcsmYgBrBHxCbwXlvz01Y7gFWszE7+4A5oNlFmd7Z+imwXu0
 V9PObOSJAjMEAAEKAB0WIQQ9U8YmyFYF/h30LIt33NvayMhJ0QUCawR8QgAKCRB33NvayMhJ0cIRD/
 9kQifIfOusrANk8pZV+cp2GpAoyvzmSgiagEvJhgEouX/ajnK5tKv5v5BUHAIKC1/Sdp6S0oriB/kp
 WTsjzRaIZdzN9GhM66bth20RiXrPOCaGz/aZ/8Ac+93MXnNRobHL46hAEkOPacgeLKOY5ctVMXRqd3
 Yrt70CuB4htEqBcyj0rwuZdYMBFy7PItxr8tZd6O+Ykf1zTufsd4WR8z+mvmdNQyecSVUUp5Zy7DIM
 LTIWuQPjMejOIIM8Ss5MyOXsLNlzNp7moJNKMlN9Nk75c/ET4qroP7HgfmghsAEz4KoqnPgsboFSth
 0gjYn1b4grVSSPP2KIxHDrJUsYMhXo1gTXd84gQEClm6qGz4WAAetJqAvItAxRYQtV0AN7Nbuy2/cS
 +wKprDEmk70ozY6o8x+6B4GNjNbqyNsBR1nBVWYt/wQcKwgMlNu3lHWOh0sPzycUApsJDJMv09XRvm
 LHp7AMnsHpQx29lNii94gM2swG8rbwpe59Zw1pOd/6Wgu96xbWXFK6JNfOR1SGCYPj3BefL8YYrfIe
 VygGoEjDRT5SEMJEI/jL4Ox+9YS4OREpWyoyrbl6TO7VnruNJcbTHff1FuXiYDmPrI6FR/rtyVw/9o
 T4tnMpKsX4GNellBtTtxcVK73YWKJNV/a/AW4jnkUW1rKdabYIyPfD7Vgojg==
X-Developer-Key: i=neil.armstrong@linaro.org; a=openpgp;
 fpr=89EC3D058446217450F22848169AB7B1A4CFF8AE

The MAX34417 is a specialized current and voltage monitor used to
determine power consumption of portable systems. The driver support
getting the channels voltage, average power, accumulated average
power and energy over an I2C/SMBUS serial interface.

The MAX34417 datasheet only specified on how to calculate the
accumulated average power, but with the Sample Per Second rate
we can easily get accumulated Energy in Joules.

By default the IIO driver only supports single-shot Voltage
and Power sensing, but the accumulation can be enabled by
enabling the Energy IIO channel which then enables the
Continuous Accumulation Mode.

The counter is common to all channels, so when reading a single
channel we will copy all accumulators to registers, so in order
to permit reading individual channels we must accumulate the
other channels in the driver when Continuous Accumulation Mode
is enabled.

Signed-off-by: Neil Armstrong <neil.armstrong@linaro.org>
---
 drivers/iio/adc/Kconfig    |  11 +
 drivers/iio/adc/Makefile   |   1 +
 drivers/iio/adc/max34417.c | 845 +++++++++++++++++++++++++++++++++++++++++++++
 3 files changed, 857 insertions(+)

diff --git a/drivers/iio/adc/Kconfig b/drivers/iio/adc/Kconfig
index 1d6ed49041ab..037a8fea4d2f 100644
--- a/drivers/iio/adc/Kconfig
+++ b/drivers/iio/adc/Kconfig
@@ -1172,6 +1172,17 @@ config MAX34408
 	  To compile this driver as a module, choose M here: the module will be
 	  called max34408.
 
+config MAX34417
+	tristate "Maxim MAX34417 ADC driver"
+	depends on I2C
+	select REGMAP_I2C
+	help
+	  Say yes here to build ADC support for Maxim MAX34417 Four-Channel High
+	  Dynamic Range Power Accumulator.
+
+	  To compile this driver as a module, choose M here: the module will be
+	  called max34417.
+
 config MAX40080
 	tristate "Analog Devices MAX40080 Current Sense Amplifier"
 	depends on I2C
diff --git a/drivers/iio/adc/Makefile b/drivers/iio/adc/Makefile
index 769965295dcc..30c42c1980c8 100644
--- a/drivers/iio/adc/Makefile
+++ b/drivers/iio/adc/Makefile
@@ -98,6 +98,7 @@ obj-$(CONFIG_MAX1241) += max1241.o
 obj-$(CONFIG_MAX1363) += max1363.o
 obj-$(CONFIG_MAX14001) += max14001.o
 obj-$(CONFIG_MAX34408) += max34408.o
+obj-$(CONFIG_MAX34417) += max34417.o
 obj-$(CONFIG_MAX40080) += max40080.o
 obj-$(CONFIG_MAX77541_ADC) += max77541-adc.o
 obj-$(CONFIG_MAX9611) += max9611.o
diff --git a/drivers/iio/adc/max34417.c b/drivers/iio/adc/max34417.c
new file mode 100644
index 000000000000..241cc9c3c254
--- /dev/null
+++ b/drivers/iio/adc/max34417.c
@@ -0,0 +1,845 @@
+// SPDX-License-Identifier: GPL-2.0
+/*
+ * IIO driver for Analog Devices MAX34417 ADC, 4-Channels High Dynamic Range Power Accumulator
+ *
+ * Datasheet: https://www.analog.com/en/products/max34417.html
+ *
+ * TODO: Slow Mode, Park Feature, Bulk Update, Perr_Verr Correction
+ */
+
+#include <linux/array_size.h>
+#include <linux/bitfield.h>
+#include <linux/bits.h>
+#include <linux/cleanup.h>
+#include <linux/err.h>
+#include <linux/i2c.h>
+#include <linux/iio/iio.h>
+#include <linux/init.h>
+#include <linux/ktime.h>
+#include <linux/math64.h>
+#include <linux/module.h>
+#include <linux/mutex.h>
+#include <linux/property.h>
+#include <linux/regmap.h>
+#include <linux/regulator/consumer.h>
+#include <linux/sysfs.h>
+#include <linux/unaligned.h>
+#include <linux/units.h>
+
+#define MAX34417_UPDATE_REG		0x0
+#define MAX34417_CONTROL_REG		0x1
+#define MAX34417_ACC_COUNT_REG		0x2
+
+#define MAX34417_PWR_ACC_1_REG		0x3
+#define MAX34417_PWR_ACC_2_REG		0x4
+#define MAX34417_PWR_ACC_3_REG		0x5
+#define MAX34417_PWR_ACC_4_REG		0x6
+
+#define MAX34417_V_CH1_REG		0x7
+#define MAX34417_V_CH2_REG		0x8
+#define MAX34417_V_CH3_REG		0x9
+#define MAX34417_V_CH4_REG		0xa
+
+#define MAX34417_DID_REG		0xf
+
+#define MAX34417_BULK_POWER_READOUT_REG		0x10
+#define MAX34417_BULK_VOLTAGE_READOUT_REG	0x11
+
+#define MAX34417_BULK_UPDATE_ADDRESS	0x2c
+#define MAX34417_BULK_UPDATE_REG	0x0
+
+/* Bit masks for control register */
+#define MAX34417_CONTROL_OVF		BIT(0)
+#define MAX34417_CONTROL_SLOW		BIT(1)
+#define MAX34417_CONTROL_PARK0		BIT(2)
+#define MAX34417_CONTROL_PARK1		BIT(3)
+#define MAX34417_CONTROL_PARK_EN	BIT(4)
+#define MAX34417_CONTROL_SMM		BIT(5)
+#define MAX34417_CONTROL_CAM		BIT(6)
+#define MAX34417_CONTROL_MODE		BIT(7)
+
+#define MAX34417_ACC_COUNT_READ_LENGTH	4
+#define MAX34417_ACC_COUNT_READ_OFFSET	1
+
+#define MAX34417_POWER_READ_LENGTH	8
+#define MAX34417_POWER_READ_OFFSET	1
+
+#define MAX34417_VOLTAGE_READ_LENGTH	3
+#define MAX34417_VOLTAGE_READ_OFFSET	1
+
+#define MAX34417_MIN_RSENSE_UOHM		(1 * MILLI)
+#define MAX34417_MAX_RSENSE_UOHM		(100 * MILLI)
+#define MAX34417_DEFAULT_RSENSE_UOHM		(1 * MILLI)
+
+#define MAX34417_PWR_CORRECTION_SCALE		24
+#define MAX34417_PWR_AVG_FULL_SCALE_BITS	30
+
+#define MAX34417_VOLTAGE_CORRECTION_SCALE	24
+#define MAX34417_VOLTAGE_FULL_SCALE_BITS	14
+
+/* TODO implement IIO_CHAN_INFO_SAMP_FREQ for slow mode */
+#define MAX34417_SLOW_SPS_BIT			3 /* 8 SPS */
+#define MAX34417_FAST_SPS_BIT			10 /* 1024 SPS */
+#define MAX34417_FAST_SPS_CAM			1536 /* 1.5 * 1024 SPS */
+
+#define MAX34417_CHANNEL_COUNT			4
+
+/**
+ * struct max34417_data - MAX34417 specific data.
+ * @indio_dev:  IIO Device.
+ * @regmap:	Device register map.
+ * @lock:	Lock for protecting access to device hardware registers, mostly
+ *		for reading common accumulator count and control register.
+ * @input_correction:	Correction based on the Rsense value from channel nodes.
+ * @input_label:	Channel label from channel nodes.
+ * @acc_power:		Saved power accumulator for each channel when in CAM mode.
+ * @acc_count:		Global saved counter for all channels when in CAM mode.
+ * @overflow:		Indicates if a channel saved data has overflowed.
+ * @last_update:	Timestamp of the last UPDATE call in CAM mode.
+ * @cam_mode:		State of the Continuous Accumulate Mode feature.
+ */
+struct max34417_data {
+	struct iio_dev *indio_dev;
+	struct regmap *regmap;
+	struct mutex lock;
+	u32 input_correction[MAX34417_CHANNEL_COUNT];
+	const char *input_label[MAX34417_CHANNEL_COUNT];
+	s64 acc_power[MAX34417_CHANNEL_COUNT];
+	s64 acc_count;
+	bool overflow;
+	ktime_t last_update;
+	bool cam_mode;
+};
+
+static bool max34417_writeable_reg(struct device *dev, unsigned int reg)
+{
+	switch (reg) {
+	case MAX34417_UPDATE_REG:
+	case MAX34417_CONTROL_REG:
+		return true;
+	default:
+		return false;
+	}
+}
+
+static bool max34417_readable_reg(struct device *dev, unsigned int reg)
+{
+	switch (reg) {
+	case MAX34417_UPDATE_REG:
+		return false;
+	default:
+		return true;
+	}
+}
+
+static bool max34417_volatile_reg(struct device *dev, unsigned int reg)
+{
+	switch (reg) {
+	case MAX34417_DID_REG:
+		return false;
+	/* MAX34417_CONTROL_REG field OVF is volatile */
+	case MAX34417_CONTROL_REG:
+	default:
+		return true;
+	}
+}
+
+static bool max34417_readable_noinc_reg(struct device *dev, unsigned int reg)
+{
+	switch (reg) {
+	case MAX34417_UPDATE_REG:
+	case MAX34417_CONTROL_REG:
+	case MAX34417_DID_REG:
+		return false;
+	default:
+		return true;
+	}
+}
+
+static const struct regmap_config max34417_regmap_config = {
+	.reg_bits	= 8,
+	.val_bits	= 8,
+	.max_register	= MAX34417_BULK_VOLTAGE_READOUT_REG,
+	.writeable_reg	= max34417_writeable_reg,
+	.readable_reg	= max34417_readable_reg,
+	.volatile_reg	= max34417_volatile_reg,
+	/*
+	 * While the DATA registers are not FIFOs, each register
+	 * type has a different byte count and requires a
+	 * Block Read transaction to read the value
+	 */
+	.readable_noinc_reg = max34417_readable_noinc_reg,
+	/* No cache since the only non-volatile register is read-only */
+};
+
+#define MAX34417_CHANNEL(_index, _v_address, _power_address)	\
+	{							\
+		.type = IIO_VOLTAGE,				\
+		.info_mask_separate =				\
+			BIT(IIO_CHAN_INFO_RAW) |		\
+			BIT(IIO_CHAN_INFO_SCALE),		\
+		.channel = (_index),				\
+		.address = (_v_address),			\
+		.indexed = 1,					\
+	},							\
+	{							\
+		.type = IIO_POWER,				\
+		.info_mask_separate =				\
+			BIT(IIO_CHAN_INFO_RAW) |		\
+			BIT(IIO_CHAN_INFO_AVERAGE_RAW) |	\
+			BIT(IIO_CHAN_INFO_SCALE),		\
+		.channel = (_index),				\
+		.address = (_power_address),			\
+		.indexed = 1,					\
+	},							\
+	{							\
+		.type = IIO_ENERGY,				\
+		.info_mask_separate =				\
+			BIT(IIO_CHAN_INFO_RAW) |		\
+			BIT(IIO_CHAN_INFO_SCALE),		\
+		.info_mask_shared_by_type =			\
+			BIT(IIO_CHAN_INFO_ENABLE),		\
+		.channel = (_index),				\
+		.address = (_power_address),			\
+		.indexed = 1,					\
+	}
+
+static const struct iio_chan_spec max34417_channels[] = {
+	MAX34417_CHANNEL(0, MAX34417_V_CH1_REG, MAX34417_PWR_ACC_1_REG),
+	MAX34417_CHANNEL(1, MAX34417_V_CH2_REG, MAX34417_PWR_ACC_2_REG),
+	MAX34417_CHANNEL(2, MAX34417_V_CH3_REG, MAX34417_PWR_ACC_3_REG),
+	MAX34417_CHANNEL(3, MAX34417_V_CH4_REG, MAX34417_PWR_ACC_4_REG),
+};
+
+/* TODO Implement trigger to update accumulator once and get all channels at once */
+
+static int max34417_read_acc_count(struct max34417_data *max34417, s32 *acc_count)
+{
+	u8 buf[MAX34417_ACC_COUNT_READ_LENGTH];
+	struct regmap *map = max34417->regmap;
+	int rc;
+
+	rc = regmap_noinc_read(map, MAX34417_ACC_COUNT_REG, &buf, sizeof(buf));
+	if (rc)
+		return rc;
+
+	/* Ignore first byte which contains the Byte Count */
+	*acc_count = get_unaligned_be24(&buf[MAX34417_ACC_COUNT_READ_OFFSET]);
+
+	return 0;
+}
+
+static int max34417_read_acc_power(struct max34417_data *max34417, unsigned int address,
+				   s64 *acc_power)
+{
+	struct regmap *map = max34417->regmap;
+	u8 buf[MAX34417_POWER_READ_LENGTH];
+	int rc;
+
+	rc = regmap_noinc_read(map, address, &buf, sizeof(buf));
+	if (rc)
+		return rc;
+
+	/* Ignore first byte which contains the Byte Count */
+	*acc_power = get_unaligned_be56(&buf[MAX34417_POWER_READ_OFFSET]);
+
+	return 0;
+}
+
+/*
+ * Check the OVF status bit indicating if one of the channels has reached overflow,
+ * meaning one of the accumulators has saturated and the MAX34417 stopped measuring.
+ * The registers contains valid measurements, not wrapped, and were already added to
+ * the local context accumulators.
+ * The OVF bit is required to be cleared followed by an UPDATE command to resume the
+ * accumulation mode sequence.
+ * An hardware overflow would happen if UPDATE is not called for around 4.55h per
+ * the hardware datasheet.
+ * TODO: add a timer accumulating the data before the 4.55h timelimit to avoid
+ * any hardware overflow, consider as acceptable limitation for an initial support
+ */
+static int max34417_check_ovf(struct max34417_data *max34417)
+{
+	struct regmap *map = max34417->regmap;
+	u32 control;
+	int rc;
+
+	rc = regmap_read(map, MAX34417_CONTROL_REG, &control);
+	if (rc)
+		return rc;
+
+	if (!(control & MAX34417_CONTROL_OVF))
+		return 0;
+
+	rc = regmap_clear_bits(map, MAX34417_CONTROL_REG, MAX34417_CONTROL_OVF);
+	if (rc)
+		return rc;
+
+	rc = regmap_write(map, MAX34417_UPDATE_REG, 1);
+	if (rc)
+		return rc;
+
+	/* Save the timestamp for the next read */
+	max34417->last_update = ktime_get();
+
+	return 0;
+}
+
+/*
+ * Save all power accumulators and counter after each UPDATE command since it will
+ * reset the internal registers for ALL channels, so in order to not loose any
+ * captured data we retrieve all registers and accumulate them in the context
+ * variables.
+ * When user gets either power or energy, those variables content will continue
+ * accumulating until either we detect an overflow on one of the variable
+ * or the POWER channels is disabled. When disabled the variables values
+ * will be lost.
+ * With 64bit storage, we can store up to 48.53 days of data, according to the
+ * hardware datasheet, if we avoid hardware overflow.
+ * TODO: Implement 8 SPS to allow use storing up to 6211 days of data.
+ */
+static int max34417_save_accumulators(struct max34417_data *max34417)
+{
+	s64 acc_power;
+	s32 acc_count;
+	int rc;
+
+	rc = max34417_read_acc_count(max34417, &acc_count);
+	if (rc)
+		return rc;
+
+	if (check_add_overflow(max34417->acc_count, acc_count, &max34417->acc_count)) {
+		max34417->overflow = true;
+		goto check_ovf;
+	}
+
+	for (int i = 0; i < MAX34417_CHANNEL_COUNT; i++) {
+		rc = max34417_read_acc_power(max34417, MAX34417_PWR_ACC_1_REG + i,
+					     &acc_power);
+		if (rc)
+			return rc;
+
+		/* Check for overflow on local accumulators */
+		if (check_add_overflow(max34417->acc_power[i], acc_power,
+				       &max34417->acc_power[i])) {
+			max34417->overflow = true;
+			goto check_ovf;
+		}
+	}
+
+check_ovf:
+	rc = max34417_check_ovf(max34417);
+	if (rc)
+		return rc;
+
+	return max34417->overflow ? -EOVERFLOW : 0;
+}
+
+static int max34417_read_voltage(struct max34417_data *max34417,
+				 const struct iio_chan_spec *chan, int *val)
+{
+	struct regmap *map = max34417->regmap;
+	u8 buf[MAX34417_VOLTAGE_READ_LENGTH];
+	s64 delta_us;
+	int rc;
+
+	/* Sleep up to 1msec to make sure we have a measurement cycle done */
+	delta_us = ktime_us_delta(ktime_get(), max34417->last_update);
+	if (delta_us >= 0 && delta_us < (1 * USEC_PER_MSEC))
+		fsleep((1 * USEC_PER_MSEC) - delta_us);
+
+	/*
+	 * When not in CAM mode, we use the default mode where each UPDATE command
+	 * will move the current accumulated data to the SMbus registers, reset
+	 * those accumulators and run a new measurement cycle.
+	 */
+	if (!max34417->cam_mode) {
+		/* Reset the accumulators and perform a measurement cycle */
+		rc = regmap_write(map, MAX34417_UPDATE_REG, 1);
+		if (rc)
+			return rc;
+		/*
+		 * UPDATE commands should be no less than 1msec apart for reliable
+		 * measurements, since in Manual mode the SPS is 1kHz, we need to
+		 * wait for the measurement to finish before moving the data in the
+		 * SMbus registers.
+		 */
+		fsleep(1 * USEC_PER_MSEC);
+	}
+
+	/*
+	 * Move the new UPDATE data into the SMBus read registers.
+	 * This will also reset the accumulators, returning the power accumulated
+	 * since the last UPDATE.
+	 */
+	rc = regmap_write(map, MAX34417_UPDATE_REG, 1);
+	if (rc)
+		return rc;
+
+	/* Save the timestamp for the next read */
+	max34417->last_update = ktime_get();
+
+	if (max34417->cam_mode) {
+		/* Retrieve all channels to avoid missing data for other channels */
+		rc = max34417_save_accumulators(max34417);
+		if (rc)
+			return rc;
+	}
+
+	rc = regmap_noinc_read(map, chan->address, &buf, sizeof(buf));
+	if (rc)
+		return rc;
+
+	/* Ignore first byte which contains the Byte Count & data starts at Bit 2 */
+	*val = get_unaligned_be16(&buf[MAX34417_VOLTAGE_READ_OFFSET]) >> 2;
+
+	return IIO_VAL_INT;
+}
+
+static int max34417_read_power(struct max34417_data *max34417,
+			       const struct iio_chan_spec *chan,
+			       int *val, int *val2)
+{
+	struct regmap *map = max34417->regmap;
+	s64 delta_us;
+	s64 power;
+	int rc;
+
+	if (max34417->cam_mode && max34417->overflow)
+		return -EOVERFLOW;
+
+	/* Sleep up to 1msec to make sure we have a measurement cycle done */
+	delta_us = ktime_us_delta(ktime_get(), max34417->last_update);
+	if (delta_us >= 0 && delta_us < (1 * USEC_PER_MSEC))
+		fsleep((1 * USEC_PER_MSEC) - delta_us);
+
+	/*
+	 * When not in CAM mode, we use the default mode where each UPDATE command
+	 * will move the current accumulated data to the SMbus registers, reset
+	 * those accumulators and run a new measurement cycle.
+	 */
+	if (!max34417->cam_mode) {
+		/* Reset the accumulators and perform a measurement cycle */
+		rc = regmap_write(map, MAX34417_UPDATE_REG, 1);
+		if (rc)
+			return rc;
+		/*
+		 * UPDATE commands should be no less than 1msec apart for reliable
+		 * measurements, since in Manual mode the SPS is 1kHz, we need wait
+		 * for the measurement to finish before moving the data in the SMbus
+		 * registers.
+		 */
+		fsleep(1 * USEC_PER_MSEC);
+	}
+
+	/*
+	 * Move the new UPDATE data into the SMBus read registers.
+	 * This will also reset the accumulators, returning the power accumulated
+	 * since the last UPDATE.
+	 */
+	rc = regmap_write(map, MAX34417_UPDATE_REG, 1);
+	if (rc)
+		return rc;
+
+	/* Save the timestamp for the next read */
+	max34417->last_update = ktime_get();
+
+	/*
+	 * Only get the accumulator counter in CAM mode, in normal mode we only
+	 * accumulate once, so the counter is 1
+	 */
+	if (max34417->cam_mode) {
+		s64 acc_power;
+
+		/* Retrieve all channels to avoid missing data for other channels */
+		rc = max34417_save_accumulators(max34417);
+		if (rc)
+			return rc;
+
+		/* Get current channel power */
+		acc_power = max34417->acc_power[chan->channel];
+
+		if (max34417->acc_count == 0) {
+			dev_warn_ratelimited(&max34417->indio_dev->dev,
+					     "unexpected zero accumulator count\n");
+			power = 0;
+		} else {
+			power = div64_s64(acc_power, max34417->acc_count);
+		}
+	} else {
+		rc = max34417_read_acc_power(max34417, chan->address, &power);
+		if (rc)
+			return rc;
+	}
+
+	iio_val_s64_decompose(power, val, val2);
+
+	return IIO_VAL_INT_64;
+}
+
+static int max34417_read_energy(struct max34417_data *max34417,
+			       const struct iio_chan_spec *chan,
+			       int *val, int *val2)
+{
+	struct regmap *map = max34417->regmap;
+	s64 acc_power;
+	s64 delta_us;
+	int rc;
+
+	if (max34417->cam_mode && max34417->overflow)
+		return -EOVERFLOW;
+
+	/* Sleep up to 1msec to make sure we have a measurement cycle done */
+	delta_us = ktime_us_delta(ktime_get(), max34417->last_update);
+	if (delta_us >= 0 && delta_us < (1 * USEC_PER_MSEC))
+		fsleep((1 * USEC_PER_MSEC) - delta_us);
+
+	/* Move the data to the SMBus registers */
+	rc = regmap_write(map, MAX34417_UPDATE_REG, 1);
+	if (rc)
+		return rc;
+
+	/* Save the timestamp for the next read */
+	max34417->last_update = ktime_get();
+
+	/* Retrieve all channels to avoid missing data for other channels */
+	rc = max34417_save_accumulators(max34417);
+	if (rc)
+		return rc;
+
+	/* Get current channel power */
+	acc_power = max34417->acc_power[chan->channel];
+
+	iio_val_s64_decompose(acc_power, val, val2);
+
+	return IIO_VAL_INT_64;
+}
+
+/*
+ * The Continuous Accumulation Mode (CAM) will automatically run measurement cycles
+ * 1536 times per second and update the ACC_COUNT register, while in normal mode
+ * the measument cycle is only done after an UPDATE command.
+ * The Single Measurement Mode (SMM) is like CAM, but each measurement cycle is
+ * triggered with an UPDATE command but the accumulators registers are not cleared
+ * out on the UPDATE command.
+ */
+static int max34417_setup_cam_mode(struct max34417_data *max34417, int val)
+{
+	struct regmap *map = max34417->regmap;
+	int rc;
+
+	if (max34417->cam_mode && !val) {
+		/* Reset counters and accumulators */
+		for (int i = 0; i < MAX34417_CHANNEL_COUNT; i++)
+			max34417->acc_power[i] = 0;
+		max34417->acc_count = 0;
+		max34417->overflow = false;
+
+		rc = regmap_clear_bits(map, MAX34417_CONTROL_REG,
+				       MAX34417_CONTROL_CAM);
+		if (rc)
+			return rc;
+
+		rc = regmap_write(map, MAX34417_UPDATE_REG, 1);
+		if (rc)
+			return rc;
+	} else if (!max34417->cam_mode && val) {
+		/*
+		 * If CAM mode must be set, the Control byte must be set to desired
+		 * values with CAM = 0, then followed by an UPDATE.
+		 */
+		rc = regmap_clear_bits(map, MAX34417_CONTROL_REG,
+				       MAX34417_CONTROL_CAM);
+		if (rc)
+			return rc;
+
+		rc = regmap_write(map, MAX34417_UPDATE_REG, 1);
+		if (rc)
+			return rc;
+
+		rc = regmap_set_bits(map, MAX34417_CONTROL_REG, MAX34417_CONTROL_CAM);
+		if (rc)
+			return rc;
+
+		rc = regmap_write(map, MAX34417_UPDATE_REG, 1);
+		if (rc)
+			return rc;
+	}
+
+	/* Save the timestamp for the next read */
+	max34417->last_update = ktime_get();
+
+	max34417->cam_mode = val;
+
+	return 0;
+}
+
+static int max34417_read_raw(struct iio_dev *indio_dev,
+			     struct iio_chan_spec const *chan,
+			     int *val, int *val2, long mask)
+{
+	struct max34417_data *max34417 = iio_priv(indio_dev);
+	u64 num, den, scale;
+
+	guard(mutex)(&max34417->lock);
+
+	switch (mask) {
+	case IIO_CHAN_INFO_RAW:
+		switch (chan->type) {
+		case IIO_VOLTAGE:
+			return max34417_read_voltage(max34417, chan, val);
+		case IIO_POWER:
+			/* In default mode, we return a single measurement */
+			if (max34417->cam_mode)
+				return -EINVAL;
+
+			return max34417_read_power(max34417, chan, val, val2);
+		case IIO_ENERGY:
+			if (!max34417->cam_mode)
+				return -EINVAL;
+
+			return max34417_read_energy(max34417, chan, val, val2);
+		default:
+			return -EINVAL;
+		}
+	case IIO_CHAN_INFO_AVERAGE_RAW:
+		if (chan->type != IIO_POWER)
+			return -EINVAL;
+
+		/* In CAM mode, we return an average measurement */
+		if (!max34417->cam_mode)
+			return -EINVAL;
+
+		return max34417_read_power(max34417, chan, val, val2);
+	case IIO_CHAN_INFO_SCALE:
+		switch (chan->type) {
+		case IIO_VOLTAGE:
+			/* Scale to mV */
+			*val = MAX34417_VOLTAGE_CORRECTION_SCALE * MILLI;
+			*val2 = MAX34417_VOLTAGE_FULL_SCALE_BITS;
+
+			return IIO_VAL_FRACTIONAL_LOG2;
+		case IIO_POWER:
+			/*
+			 * Scale to mW
+			 * (1000 * (Power Accumulation / Counter) * Correction) / 2^30
+			 */
+			*val = max34417->input_correction[chan->channel] * MILLIWATT_PER_WATT;
+			*val2 = MAX34417_PWR_AVG_FULL_SCALE_BITS;
+
+			return IIO_VAL_FRACTIONAL_LOG2;
+		case IIO_ENERGY:
+			/*
+			 * Scale to Joules
+			 * P=((Power Accumulation / Counter) * Correction) / 2^30
+			 * t=(Counter / Samples per Second)
+			 * E=(P * t)
+			 * Can be simplified to:
+			 * (Power Accumulation * Correction) / (2^30 * SPS)
+			 * And scale expressed in Femto (10^-15 precision):
+			 * S=(Correction * 10^15) / (2^30 * SPS)
+			 * With the maximum input_correction of 2400, it fits in 64bits
+			 */
+			num = (u64)max34417->input_correction[chan->channel] * FEMTO;
+			den = (u64)MAX34417_FAST_SPS_CAM << MAX34417_PWR_AVG_FULL_SCALE_BITS;
+			scale = div64_u64(num, den);
+			iio_val_s64_decompose(scale, val, val2);
+
+			return IIO_VAL_DECIMAL64_FEMTO;
+		default:
+			return -EINVAL;
+		}
+	case IIO_CHAN_INFO_ENABLE:
+		*val = max34417->cam_mode;
+
+		return IIO_VAL_INT;
+	default:
+		return -EINVAL;
+	}
+}
+
+static int max34417_write_raw(struct iio_dev *indio_dev,
+			      struct iio_chan_spec const *chan,
+			      int val, int val2, long mask)
+{
+	struct max34417_data *max34417 = iio_priv(indio_dev);
+
+	guard(mutex)(&max34417->lock);
+
+	switch (mask) {
+	case IIO_CHAN_INFO_ENABLE:
+		/* Setup the CAM mode for the 4 channels */
+		return max34417_setup_cam_mode(max34417, val);
+	default:
+		return -EINVAL;
+	}
+}
+
+static int max34417_read_label(struct iio_dev *indio_dev,
+			       struct iio_chan_spec const *chan,
+			       char *label)
+{
+	struct max34417_data *max34417 = iio_priv(indio_dev);
+	const char *input_label = max34417->input_label[chan->channel];
+
+	if (input_label)
+		return sysfs_emit(label, "%s\n", input_label);
+
+	return sysfs_emit(label, "channel%d\n", chan->channel);
+}
+
+static const struct iio_info max34417_info = {
+	.read_raw	= max34417_read_raw,
+	.write_raw	= max34417_write_raw,
+	.read_label	= max34417_read_label,
+};
+
+static u32 max34417_calc_input_correction(u32 rsense_uOhm)
+{
+	/* Derived from Table 14. Correction Factors for Various Current-Sense Resistor Values */
+	return (MAX34417_MAX_RSENSE_UOHM * MAX34417_PWR_CORRECTION_SCALE) / rsense_uOhm;
+}
+
+static int max34417_probe_channel_node(struct device *dev,
+				       struct max34417_data *max34417,
+				       struct fwnode_handle *node)
+{
+	u32 rsense_uOhm, index;
+	const char *propname;
+	int rc;
+
+	rc = fwnode_property_read_u32(node, "reg", &index);
+	if (rc)
+		return dev_err_probe(dev, rc, "failure reading reg property of %pfwP\n",
+				     node);
+
+	if (index >= MAX34417_CHANNEL_COUNT)
+		return dev_err_probe(dev, -ECHRNG, "invalid reg %d of %pfwP\n",
+				     index, node);
+
+	propname = "label";
+	if (fwnode_property_present(node, propname)) {
+		rc = fwnode_property_read_string(node, propname,
+						 &max34417->input_label[index]);
+		if (rc)
+			return dev_err_probe(dev, rc,
+					     "failure reading %s property of %pfwP\n",
+					     propname, node);
+	}
+
+	propname = "shunt-resistor-micro-ohms";
+	if (fwnode_property_present(node, propname)) {
+		rc = fwnode_property_read_u32(node, propname, &rsense_uOhm);
+		if (rc)
+			return dev_err_probe(dev, rc,
+					     "failure reading %s property of %pfwP\n",
+					     propname, node);
+
+		if (rsense_uOhm < MAX34417_MIN_RSENSE_UOHM ||
+		    rsense_uOhm > MAX34417_MAX_RSENSE_UOHM)
+			return dev_err_probe(dev, -ERANGE,
+					     "invalid %s value %d of %pfwP\n",
+					     propname, rsense_uOhm, node);
+
+		max34417->input_correction[index] =
+			max34417_calc_input_correction(rsense_uOhm);
+	}
+
+	return 0;
+}
+
+static int max34417_probe(struct i2c_client *client)
+{
+	struct device *dev = &client->dev;
+	struct max34417_data *max34417;
+	struct iio_dev *indio_dev;
+	struct regmap *map;
+	int rc;
+
+	map = devm_regmap_init_i2c(client, &max34417_regmap_config);
+	if (IS_ERR(map))
+		return dev_err_probe(dev, PTR_ERR(map), "regmap_init failed\n");
+
+	indio_dev = devm_iio_device_alloc(dev, sizeof(*max34417));
+	if (!indio_dev)
+		return -ENOMEM;
+
+	rc = devm_regulator_get_enable(dev, "vdd");
+	if (rc)
+		return dev_err_probe(dev, rc, "failed to get vdd regulator\n");
+
+	rc = devm_regulator_get_enable(dev, "vio");
+	if (rc)
+		return dev_err_probe(dev, rc, "failed to get vio regulator\n");
+
+	max34417 = iio_priv(indio_dev);
+	max34417->regmap = map;
+	max34417->indio_dev = indio_dev;
+
+	rc = devm_mutex_init(dev, &max34417->lock);
+	if (rc)
+		return rc;
+
+	/* Set default input correction for all channels */
+	for (int i = 0; i < MAX34417_CHANNEL_COUNT; i++)
+		max34417->input_correction[i] =
+			max34417_calc_input_correction(MAX34417_DEFAULT_RSENSE_UOHM);
+
+	device_for_each_child_node_scoped(dev, node) {
+		rc = max34417_probe_channel_node(dev, max34417, node);
+		if (rc)
+			return rc;
+	}
+
+	indio_dev->channels = max34417_channels;
+	indio_dev->num_channels = ARRAY_SIZE(max34417_channels);
+	indio_dev->name = "max34417";
+	indio_dev->info = &max34417_info;
+	indio_dev->modes = INDIO_DIRECT_MODE;
+
+	/*
+	 * Reset mode and set accumulator width to Wide
+	 *
+	 * The MAX34407 variant could be supported by setting the
+	 * MAX34417_CONTROL_MODE field to 0 and handling a smaller accumulator width.
+	 */
+	rc = regmap_write(map, MAX34417_CONTROL_REG, MAX34417_CONTROL_MODE);
+	if (rc)
+		return dev_err_probe(dev, rc, "Error writing control register\n");
+
+	/* Reset the accumulators */
+	rc = regmap_write(map, MAX34417_UPDATE_REG, 1);
+	if (rc)
+		return rc;
+
+	/* Save the timestamp for the next read */
+	max34417->last_update = ktime_get();
+
+	return devm_iio_device_register(dev, indio_dev);
+}
+
+static const struct of_device_id max34417_of_match[] = {
+	{ .compatible = "adi,max34417" },
+	{ }
+};
+MODULE_DEVICE_TABLE(of, max34417_of_match);
+
+static const struct i2c_device_id max34417_id[] = {
+	{ .name = "max34417" },
+	{ }
+};
+MODULE_DEVICE_TABLE(i2c, max34417_id);
+
+static struct i2c_driver max34417_driver = {
+	.driver = {
+		.name   = "max34417",
+		.of_match_table = max34417_of_match,
+	},
+	.probe = max34417_probe,
+	.id_table = max34417_id,
+};
+module_i2c_driver(max34417_driver);
+
+MODULE_AUTHOR("Neil Armstrong <neil.armstrong@linaro.org>");
+MODULE_DESCRIPTION("Analog Devices MAX34417 ADC driver");
+MODULE_LICENSE("GPL");

-- 
2.34.1

