Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.53
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793882578;
	b=qTe9Cf7JefSEutzen2OSxW8us40K9ahmrbVhltMXwx8CXhGBd/ZP9y2xXKYNEnjwifQ6
	 Pi6ZxImbOPvTOsMf7AljPWVH3an4y+tFvC9tGwtC5W4pu38NCSAHA6l9v3vAvEtGSInxB
	 29RqQAC4NXieIXAE/UhhHn276ks/MOgiUks24fPFIn0esQYAeipqYlCHE29itTxA6tb3b
	 Pru39rNZq8cx3A/Mig2HYHPoUCi0zf1oQYpsJLJja/4IyotmWo1wDHPwMGAjWk5xNviwQ
	 IVCvX1aDmQmmaDkmntcXTgu/TSBbWjwhnivtZwEZ55bsqIoevMRMXgfUkusLmuG+02A==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793882578;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:Date:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key;
	bh=ASjEmzHMS/wg9bt+8inalUSlMGb2bGBK9yrxbmuPTYE=;
	b=wibrz6sIrtiGGjfQ6wNeAHo4XaYcdYQMP44SwyuEZRei3V7ylbXlDaH0CsexcwgGYjNc
	 fY02pyGV+KPWianeDKIdtRxajvOQTIz4PFiFu1tOEvC9qy9PunPAkNaJY+nQ6ZenVKyLC
	 8YneOQAYppPaBDi9FZfbH1EEP+hn9M3I49ahZaEefRYI1rIBdsld7iack1ordxidSG4eh
	 sUtZ1tsbxz7vbLIdHzkz/Clh0LDMXkKLPjyXcdzB3Q7bVzALxp1e1GFsSxqC6ZaOdHU7r
	 ipp23x6KssvZTYG1ifhvRV0YHGwHGR8NNel9fZoaSwXqssfCl/tM86o/IWwnwXH0kwA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linaro.org;
	spf=pass smtp.mailfrom=linaro.org;
	dkim=pass header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=RR3Ap7e3;
	arc=none smtp.remote-ip=209.85.128.53
Received: from mail-wm1-f53.google.com (mail-wm1-f53.google.com [209.85.128.53])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B36A26082BF6
	for <linux-hwmon@vger.kernel.org>; Thu,  5 Nov 2026 12:42:56 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org B36A26082BF6
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=RR3Ap7e3
Received: by mail-wm1-f53.google.com with SMTP id 5b1f17b1804b1-4a5087a5348so14087565e9.0
        for <linux-hwmon@vger.kernel.org>; Thu, 05 Nov 2026 04:42:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1793882575; x=1794487375; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=ASjEmzHMS/wg9bt+8inalUSlMGb2bGBK9yrxbmuPTYE=;
        b=RR3Ap7e3OJNNbZakaTrbgZptLcPiJs7PLGXhAia9EUXyrO8BE8v+BYICnD3sy4FU/y
         s2oYCb3S4OLxq1hRv0XB7MKJDKy2o54zPCKBbCNtARV6VSuF3Px/UT2mElSIMhmXeYrJ
         R1JmizaLzZeI1DeONIObsHKhc4p9hBuD8667kfh14lYQe06/tudf65H7mVqm/a3Zf0iI
         RUpzEgxA+l4lbFDD4o3z8RmDjuQcYu1/+dqapIoASK2X6bXAFq1tJsCnC/YgrzjgogYI
         2XL11FZzf2568V9NNHGF50J57FYjE/8H5NY1QJZCNAOuTQa5EzfnoOA7vgZbQ+hmPuRm
         0oZA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793882575; x=1794487375;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=ASjEmzHMS/wg9bt+8inalUSlMGb2bGBK9yrxbmuPTYE=;
        b=bkI0s+pdOFDFn7d3wDMic6GxcsRi59+09nWZC8tPUfUVekOpu0qNHl57pV8cAx7tbc
         cFbQiofU4MlTLchjme+0o5+ZHMVRGGNPSLgPbuCDsjkRbPcZoQz5OP9E2qyW9e9g8JIh
         99V2LnZwrKAu3E5irgJaaRoyGYtsQZ1X+CJZaGD1jozzFvVEHEDnurTqbvAQaWR8ODse
         Y9luPforcU6Od6Qhj4a4AeciQj7yOIIdTFmbiS6ONjwER3+pRVv4mPLu3kEwFOtbGTwW
         cPs/II+WllzBqGAHoTmQ+57JFAtVAV4S8f4URIDXiVm2x/O2dJ+OkSmos213CUeSVn9u
         aX9A==
X-Forwarded-Encrypted: i=1; AKwUvBxjLyzkW4qbT0bxD30WezfVt63rotScD6Z3S6ebjvjQoz/mV90WsNoWOejdLx2Vb2ECmBIDBsEiJJSjAA==@vger.kernel.org
X-Gm-Message-State: APuU4Z8roBeNK+82EDldC1d9j/xXJKiGst1w6Wf9zN1kI50pUqCQjXG9
	UcCQpMOCKtEBiz8v2UDw+MDd4b2sJ0dRoCfO9dBqg6k01279DHZEeZNp7tpjuOGhxlqiVIm+zga
	tngB1
X-Gm-Gg: AYBFou1wOurG9RpvongOUFH1pizOrUB12ulpI/HV4QWPp7B1azDBkvRPIMQq7K1dRj7
	9BlkQ/DQ6HvEqx2lR9J0bMIIUG0lmhkPk3o+/aVoYdSWqBghAWWu3yQssjt6Kv+DNP+7WunQNA6
	h1qC/tmIx0H/tY46QV85NrVcSKgApWT0vdyq9RUW3x3WDQQ/ydWDsY7KUx+ZvgOeDFs8PZ7JYmW
	0uA3UhoSxfmAgTiisBNDFdlJW+ai6CPZpK3Oral4o+6fS+YSoMEuPmRlO7vWTlOAbPOKqsiqVK2
	KEpxgA7xhzREYxm/Q/lN5YsHPq2VYR9SwX9wLP2/kKoBVJjMYwHHjdijZvMUDchaKt1xz0e78FN
	68Di5Gm+tuaTRWq2nQ5d+kz0Fkx8zuQfqoDE/TcbM0WAr/rpXDnx8FypMDqqPtya5nOvSzrDJJ2
	5vzVpKX4vEvspD+rH07Q5Qo+mcQ3fQeptEKRIISC8/36ktJjjCyrf4V74mqK3bKJNT1A3RwjQWj
	tCHw1PyV2d2TV5kWCkP4QiyNgWG0V9BHgijZ5VGKtMLbFD4EiqvAeKvCaQzcNptsPeUv7XlyV8s
	SwAkYptAv3lvB9HIz79u9QPJz3O2U5eabxZdwEP12qlF
X-Received: by 2002:a05:600c:698d:b0:4a1:d97e:cd60 with SMTP id 5b1f17b1804b1-4ac185bd1e2mr418515995e9.16.1793882574901;
        Thu, 05 Nov 2026 04:42:54 -0800 (PST)
Received: from arrakeen-2.home ([2a01:e0a:106d:1080:8261:5fff:fe11:bdda])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4b57373f7f1sm73487895e9.15.2026.11.05.04.42.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 05 Nov 2026 04:42:54 -0800 (PST)
From: Neil Armstrong <neil.armstrong@linaro.org>
Date: Thu, 05 Nov 2026 13:42:48 +0100
Subject: [PATCH v6 3/3] iio: adc: add driver for the MAX34417 Four-Channel
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
Message-Id: <20261105-topic-sm8x50-iio-max34417-adc-v6-3-63b4e8279633@linaro.org>
References: <20261105-topic-sm8x50-iio-max34417-adc-v6-0-63b4e8279633@linaro.org>
In-Reply-To: <20261105-topic-sm8x50-iio-max34417-adc-v6-0-63b4e8279633@linaro.org>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=28040;
 i=neil.armstrong@linaro.org; h=from:subject:message-id;
 bh=sebI9i75SxMSxIYeelavBRy4TRbn4FOLHMP4RLhak88=;
 b=owEBbQKS/ZANAwAKAXfc29rIyEnRAcsmYgBq7HnLrNPEtwiMHPCaH0rOt5GvxoAfp5dbhEfxDZjs
 C8IQQkmJAjMEAAEKAB0WIQQ9U8YmyFYF/h30LIt33NvayMhJ0QUCaux5ywAKCRB33NvayMhJ0S3sD/
 0dzJwe9/NJnojgSC+21GLVlC+2TMtqT8ekn2myglaM0Tq3CSJKBZLW71J46njP7sUR/nhN0KolGjOd
 xvllbam6HH8YXz2RNFlGn/ypMa+wI7J1NzPrw7YCi71pFpGdUfaQup/hHA8RHMyll2iKnjocLSvEDi
 LtMBmDEvUYqlFhji03IkVNMWcecCaP5wC2FYnr1+65qote8irOVuUGz+YHGExA8JUMSDs0CR3vHPRg
 w2GLdRaSfW8jE9/xwbTJbQ89OjM58eM+agsvlvSf4lU/QbVU7zoxLzcUDjYLO9x7P9A1VNIPNYoIvS
 RaOpixhsI0s5tmRKH+MgG2xN8DU2vv526WwkP1WtgQJxddpyhZ3DH+7KtbDba/nGu6/Av0g+6XAV/9
 2zI8jKMnDa99Zq3yBwcB1nCub+yIBEuLLRl2bru/WCtgmzEvfkqRNirjWqIzc7p7cBv9jHovmCnMcs
 Cnmk7ZAHlzZSehrH+zX8Cs3ldRpqq5nl9ankzeagq6XfKWOq8a8vjjP96MvRGPn5MrITLAv+hFMgwL
 1LYO2b1mh6I4Q73V6wyE2xKN5CQdT1QamDzJWPoc+LsIoOE/OIcSPdGYpbijJXWLlsNSGLCY4h7kj5
 E1jlMWMouVQEBgqU1iQO1Y0z3444eEFqRjV6M515SWurQwzREFXHhHeXxy3g==
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
index a802d8ee4dd9..b7d66dffdb89 100644
--- a/drivers/iio/adc/Kconfig
+++ b/drivers/iio/adc/Kconfig
@@ -1144,6 +1144,17 @@ config MAX34408
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
index 9e82c21dbd37..26ddf3828fe4 100644
--- a/drivers/iio/adc/Makefile
+++ b/drivers/iio/adc/Makefile
@@ -97,6 +97,7 @@ obj-$(CONFIG_MAX1241) += max1241.o
 obj-$(CONFIG_MAX1363) += max1363.o
 obj-$(CONFIG_MAX14001) += max14001.o
 obj-$(CONFIG_MAX34408) += max34408.o
+obj-$(CONFIG_MAX34417) += max34417.o
 obj-$(CONFIG_MAX40080) += max40080.o
 obj-$(CONFIG_MAX77541_ADC) += max77541-adc.o
 obj-$(CONFIG_MAX9611) += max9611.o
diff --git a/drivers/iio/adc/max34417.c b/drivers/iio/adc/max34417.c
new file mode 100644
index 000000000000..f12d0e8ef1a6
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
+#define MAX34417_MIN_RSENSE		(1 * MILLI) /* 1000 microOhm */
+#define MAX34417_MAX_RSENSE		(100 * MILLI) /* 100000 microOhm */
+#define MAX34417_DEFAULT_RSENSE		(1 * MILLI) /* 1000 microOhm */
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
+ * @acc_count:		Saved counter for each channel when in CAM mode.
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
+	s64 acc_count[MAX34417_CHANNEL_COUNT];
+	bool overflow[MAX34417_CHANNEL_COUNT];
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
+static int max34417_read_acc_count(struct max34417_data *max34417, u32 *acc_count)
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
+ * Check the OVF status bit indicating if one of the channels
+ * has reached overflow, meaning one of the accumulators has
+ * saturated and the MAX34417 stopped measuring.
+ * The registers contains valid measurements, not wrapped,
+ * and were already added to the local context accumulators.
+ * The OVF bit is required to be cleared followed by an UPDATE
+ * command to resume the accumulation mode sequence.
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
+	rc = regmap_clear_bits(map, MAX34417_CONTROL_REG,
+			       MAX34417_CONTROL_OVF);
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
+ * Save all power accumulators and counter after each UPDATE command
+ * since it will reset the internal registers for ALL channels,
+ * so in order to not loose any captured data we retrieve all registers
+ * and accumulate them in the context variables.
+ * When user gets either power or energy, those variables content
+ * will be returned and zero-ed to return the power accumulated
+ * since last read for each separate channel.
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
+	for (int i = 0; i < MAX34417_CHANNEL_COUNT; i++) {
+		rc = max34417_read_acc_power(max34417, MAX34417_PWR_ACC_1_REG + i,
+					     &acc_power);
+		if (rc)
+			return rc;
+
+		/* Checked for overflow on local accumulators */
+		if (check_add_overflow(max34417->acc_power[i], acc_power,
+				       &max34417->acc_power[i]) ||
+		    check_add_overflow(max34417->acc_count[i], acc_count,
+				       &max34417->acc_count[i])) {
+			max34417->overflow[i] = true;
+		}
+	}
+
+	/* Check for overflow */
+	return max34417_check_ovf(max34417);
+}
+
+static int max34417_read_voltage(struct max34417_data *max34417,
+				 const struct iio_chan_spec *chan, int *val)
+{
+	s64 delta_us = ktime_us_delta(ktime_get(), max34417->last_update);
+	struct regmap *map = max34417->regmap;
+	u8 buf[MAX34417_VOLTAGE_READ_LENGTH];
+	int rc;
+
+	/* Sleep up to 1msec to make sure we have a measurement cycle done */
+	if (delta_us >= 0 && delta_us < (1 * USEC_PER_MSEC))
+		fsleep((1 * USEC_PER_MSEC) - delta_us);
+
+	/*
+	 * When not in CAM mode, we use the default mode where each
+	 * UPDATE command will move the current accumulated data to the
+	 * SMbus registers, reset those accumulators and run a new
+	 * measurement cycle.
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
+	 * This will also reset the accumulators, returning the
+	 * power accumulated since the last UPDATE.
+	 */
+	rc = regmap_write(map, MAX34417_UPDATE_REG, 1);
+	if (rc)
+		return rc;
+
+	/* Save the timestamp for the next read */
+	max34417->last_update = ktime_get();
+
+	if (max34417->cam_mode) {
+
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
+	s64 delta_us = ktime_us_delta(ktime_get(), max34417->last_update);
+	struct regmap *map = max34417->regmap;
+	s64 power;
+	int rc;
+
+	/* Sleep up to 1msec to make sure we have a measurement cycle done */
+	if (delta_us >= 0 && delta_us < (1 * USEC_PER_MSEC))
+		fsleep((1 * USEC_PER_MSEC) - delta_us);
+
+	/*
+	 * When not in CAM mode, we use the default mode where each
+	 * UPDATE command will move the current accumulated data to the
+	 * SMbus registers, reset those accumulators and run a new
+	 * measurement cycle.
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
+	 * This will also reset the accumulators, returning the
+	 * power accumulated since the last UPDATE.
+	 */
+	rc = regmap_write(map, MAX34417_UPDATE_REG, 1);
+	if (rc)
+		return rc;
+
+	/* Save the timestamp for the next read */
+	max34417->last_update = ktime_get();
+
+	/*
+	 * Only get the accumulator counter in CAM mode, in normal mode
+	 * we only accumulate once, so the counter is 1
+	 */
+	if (max34417->cam_mode) {
+		s64 acc_count;
+		s64 acc_power;
+
+		/* Retrieve all channels to avoid missing data for other channels */
+		rc = max34417_save_accumulators(max34417);
+		if (rc)
+			return rc;
+
+		if (max34417->overflow[chan->channel]) {
+			max34417->overflow[chan->channel] = false;
+			max34417->acc_power[chan->channel] = 0;
+			max34417->acc_count[chan->channel] = 0;
+			return -EOVERFLOW;
+		}
+
+		/* Get current channel power, counter and reset them */
+		acc_power = max34417->acc_power[chan->channel];
+		acc_count = max34417->acc_count[chan->channel];
+		max34417->acc_power[chan->channel] = 0;
+		max34417->acc_count[chan->channel] = 0;
+
+		if (acc_count == 0) {
+			dev_warn_ratelimited(&max34417->indio_dev->dev,
+					     "unexpected zero accumulator count\n");
+			power = 0;
+		} else {
+			power = div64_s64(acc_power, acc_count);
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
+	s64 delta_us = ktime_us_delta(ktime_get(), max34417->last_update);
+	s64 acc_power;
+	int rc;
+
+	/* Sleep up to 1msec to make sure we have a measurement cycle done */
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
+	if (max34417->overflow[chan->channel]) {
+		max34417->overflow[chan->channel] = false;
+		max34417->acc_power[chan->channel] = 0;
+		max34417->acc_count[chan->channel] = 0;
+		return -EOVERFLOW;
+	}
+
+	/* Get current channel power and reset them */
+	acc_power = max34417->acc_power[chan->channel];
+	max34417->acc_power[chan->channel] = 0;
+	max34417->acc_count[chan->channel] = 0;
+
+	iio_val_s64_decompose(acc_power, val, val2);
+
+	return IIO_VAL_INT_64;
+}
+
+/*
+ * The Continuous Accumulation Mode (CAM) will automatically
+ * run measurement cycles 1536 times per second and update
+ * the ACC_COUNT register, while in normal mode the measument
+ * cycle is only done after an UPDATE command.
+ * The Single Measurement Mode (SMM) is like CAM, but each
+ * measurement cycle is triggered with an UPDATE command
+ * but the accumulators registers are not cleared out on the
+ * UPDATE command.
+ */
+static int max34417_setup_cam_mode(struct max34417_data *max34417, int val)
+{
+	struct regmap *map = max34417->regmap;
+	int rc;
+
+	if (max34417->cam_mode && !val) {
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
+		 * If CAM mode must be set, the Control byte must be set to
+		 * desired values with CAM = 0, then followed by an UPDATE
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
+
+		/* Reset counters and accumulators */
+		for (int i = 0; i < MAX34417_CHANNEL_COUNT; i++) {
+			max34417->acc_power[i] = 0;
+			max34417->acc_count[i] = 0;
+			max34417->overflow[i] = false;
+		}
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
+			 * But the denominator won't fit in 32bit and is not power of 2.
+			 * But we can divide the numerator by SPS and shift both terms
+			 * by a large power of two number and still use IIO_VAL_FRACTIONAL_LOG2
+			 */
+			*val = div_u64(max34417->input_correction[chan->channel] << 19,
+				       MAX34417_FAST_SPS_CAM);
+			*val2 = MAX34417_PWR_AVG_FULL_SCALE_BITS + 19;
+
+			return IIO_VAL_FRACTIONAL_LOG2;
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
+	return (MAX34417_MAX_RSENSE * MAX34417_PWR_CORRECTION_SCALE) / rsense_uOhm;
+}
+
+static int max34417_probe_channel_node(struct device *dev,
+				       struct max34417_data *max34417,
+				       struct fwnode_handle *node)
+{
+	u32 rsense_uOhm, index;
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
+	if (fwnode_property_present(node, "label")) {
+		rc = fwnode_property_read_string(node, "label",
+						 &max34417->input_label[index]);
+		if (rc)
+			return dev_err_probe(dev, rc,
+					     "failure reading label property of %pfwP\n",
+					     node);
+	}
+
+	if (fwnode_property_present(node, "shunt-resistor-micro-ohms")) {
+		rc = fwnode_property_read_u32(node, "shunt-resistor-micro-ohms",
+					      &rsense_uOhm);
+		if (rc)
+			return dev_err_probe(dev, rc,
+					     "failure reading shunt property of %pfwP\n",
+					     node);
+
+		if (rsense_uOhm < MAX34417_MIN_RSENSE ||
+		    rsense_uOhm > MAX34417_MAX_RSENSE)
+			return dev_err_probe(dev, -EINVAL,
+					     "invalid shunt value %d of %pfwP\n",
+					     rsense_uOhm, node);
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
+			max34417_calc_input_correction(MAX34417_DEFAULT_RSENSE);
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
+	 * MAX34417_CONTROL_MODE field to 0 and handling a smaller
+	 * accumulator width.
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

