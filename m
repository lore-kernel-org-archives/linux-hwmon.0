Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.170
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793264300;
	b=FMPTtEaNQ4xbe6FN24OWgATvSSh/O3wNOpr+aYQHEigDXiJesZqnD9e+XGkV9w9FWmWv
	 bBr8lBRiW1v77FExxyrSYLgATXthkm76v0bf9thG6d7Rwh2a6H9XaXnfV7jeVOKr4AIvJ
	 92vQVo6yRimoHG7/8tjqBpfX0I4E7tMxQC1HGKDZMaS79WFV2EFC4k1Gy3TCIQkwwEzSE
	 GtTCOciOrVs5ySz2c23AiQOK2WzZKA36L63bhyBDs1EPVE0Qa6XP04x4QO6U32+TvMxtj
	 d1OZ8taxluZhDPONULe7ovHql3k32XqKWGua7bsDivQre8fgL7GNcV87CTnGn6gVe5Q==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793264300;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=aLiKz2BhC5RSo/yb+qOUrvZd9mNsTY8Su064dE1oXf0=;
	b=yLX9MLb0Vcq4ankRRGQw53v8CACD+KjBi87ibnJQQJk4f4BoEM+8r+rQQlvnZN+yVzKo
	 EZhca/Rg5J11b9rCZ1LJE03/PEOl6fmMYtoD7XgxjED17JUsuLKLGRbHvCgwCh0j2ON91
	 mz9Xma/jcpBB935+nGjY2gsSIP/6Bk/p28gbSesQnK0BE6GxQtCyBZoB7TrArRM/ZzGpE
	 /RbEcWLOcevixRQa+77HaRHrdM3W+ududXLQqfFExO2WjnKmCDz/HXYsLLaDLv63SNfZa
	 ZxpIu8mYjYet+SXhVnSmYkYvEhio6n+rtyL5nYzGd8r/H5Tmf0SmG/+kMFjj+V40oEQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=KQoOinV7;
	arc=none smtp.remote-ip=74.125.82.170
Received: from mail-dy1-f170.google.com (mail-dy1-f170.google.com [74.125.82.170])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B006A606A322
	for <linux-hwmon@vger.kernel.org>; Thu, 29 Oct 2026 08:58:19 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org B006A606A322
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=KQoOinV7
Received: by mail-dy1-f170.google.com with SMTP id 5a478bee46e88-369f33df08eso3514011eec.0
        for <linux-hwmon@vger.kernel.org>; Thu, 29 Oct 2026 01:58:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793264299; x=1793869099; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=aLiKz2BhC5RSo/yb+qOUrvZd9mNsTY8Su064dE1oXf0=;
        b=KQoOinV7IsGlJE90LxDtr2QI3uALtgcoSmDANpVDPtmt5mpbR8DXDfNVF7gEwRt5wL
         HQzdud2i6m2MnLNgQKOPpbdfXP9efFtOK9sYRcIxL/NX9dzCki+ltfIZKPO0yKmyMB/q
         qjPhgKDy3qnsQZbAxGd19//WshWQsDzZAKIeLadg086NjnOeZ4xzlXYPcfEPRva9tupQ
         SQ422nlARNA0ESodQw9rQ489f6thndM7qem9yBKyLm7ZY8EAVLs8zhKlKpNatt46ZQS5
         TYN6s6pdkNHk/xc5HRyRZLfhQoLoqftzOWF+tcJdgrfI+c8PJes6M/79OIJGYfWL+3GH
         VRNA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793264299; x=1793869099;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=aLiKz2BhC5RSo/yb+qOUrvZd9mNsTY8Su064dE1oXf0=;
        b=eQ6mo4NAjHO415Icxn0oWqJn4SvCrTsNmIu7myY1xQVyowyJ29bwU2BKcVakIFwek+
         uKXB1zp9qfGtOaoDgYwN5HTwztu4v6W/jfpLkIHA2QhxpUEy6cws/+Rsj1EFVvISl8I1
         LOzRZXjIDUrw8Ei6nslkKNbK0RjzSUfZnJRaJ/+4wu5nEbheUV52LzPxqiBNYHOD/FPG
         8YjcF/E3G0QFI18lCDOzi+I21WPlUMZzT31zZJIwjof/4rinXGPL3jV1+odyy1iUCuoH
         hFSpWLpkg8Yr+e/sgICu7OSWN2EK0IGTUxubbkNZRm9sfI1e1KIfjh78i7kc2BfOppYO
         P3EQ==
X-Forwarded-Encrypted: i=1; AKwUvBy8LFjB1xkDZ1gXqx9AKJJ8KS5jdWqk4qC8jaJTm8ZAIY4GRJ8Atq77mNeXX/COlRcVvH3BxQK2pXP24g==@vger.kernel.org
X-Gm-Message-State: AFq9FYKjHtBqOMSNN+xGX27R94zzaIcc1HoJTKwJfBPYlRhLwmtsr8uD
	NvtGtEy5uhJyz5EJk41kWiJQsznGeoDabzmjEItKVS3FA21vj4Ut5E8=
X-Gm-Gg: AYBFou3PkGKL/5VHK6rD2TBWPzcDBjXlFTa+K9jr+MQrarW0hn36rP4byq+BDDiSdBS
	7ylvN28nG3L6fBBndWutWcGW1MNnKY/Os2CR/RcR0j22Y7RPRChk1nHzVB7KdILpJr18LaU1iU4
	ZnfKTVaj/hfGyQ1IsZWwxbi2MBYhVMCSeblvfjLXt66rFDd6CjcgKTVqdfgeFGzTWf8x7RA1UbJ
	Fu8W1RWyYlOOKMBBB0R13DF+Mo+d41WkMfSVXzwEcrTVPKPP8ZAVo2xLm/XpQQLPA6tsZjP/6s+
	vI/Gg+e2LNaLv/GPwewbx6NNpZLrQ+zu06YrhmwmtVnsoUgdATkx5fKaWsqHfdzJzVDAvhQfSyS
	LsXjeLyMvK5heyVxhLtbVqcIYsbY3lfs1X/KUVR9bspT8S5ING1CwhtULlz2TU03i5ROCd2hh31
	+mMk8WNVxdJh5rDc3ytgmSLQQ5Ndze17go3TUZV+DgbS0uwFsywSUbFzvQ7z/f2kFGflFU5yNSt
	V2cL+BisCyvsLIkv5vywqF+bpSWscJ+EVwdWPOnLx9u5Xp/DiFV47gFEJPMy2udhg1M9ulmVCFC
	TBzIk2mUDWlgKpRsvd3dr4o3qdmBMz9zR6vZO4Q65EHlUGJJrsI29BF7x+WFzQ==
X-Received: by 2002:a05:693c:8944:10b0:369:2f25:33a7 with SMTP id 5a478bee46e88-36a200beec9mr6691678eec.15.1793264298696;
        Thu, 29 Oct 2026 01:58:18 -0700 (PDT)
Received: from at-Standard-PC-Q35-ICH9-2009 ([27.60.20.232])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-36a23641e78sm16497937eec.0.2026.10.29.01.58.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 29 Oct 2026 01:58:17 -0700 (PDT)
From: Atharva Tiwari <atharvatiwarilinuxdev@gmail.com>
To: 
Cc: Atharva Tiwari <atharvatiwarilinuxdev@gmail.com>,
	Bjorn Helgaas <bhelgaas@google.com>,
	Thomas Gleixner <tglx@kernel.org>,
	Ingo Molnar <mingo@redhat.com>,
	Borislav Petkov <bp@alien8.de>,
	Dave Hansen <dave.hansen@linux.intel.com>,
	x86@kernel.org,
	"H. Peter Anvin" <hpa@zytor.com>,
	"Rafael J. Wysocki" <rafael@kernel.org>,
	Len Brown <lenb@kernel.org>,
	Linus Walleij <linusw@kernel.org>,
	Bartosz Golaszewski <brgl@kernel.org>,
	Sven Peter <sven@kernel.org>,
	Janne Grunau <j@jannau.net>,
	Neal Gompa <neal@gompa.dev>,
	Guenter Roeck <linux@roeck-us.net>,
	Jonathan Cameron <jic23@kernel.org>,
	David Lechner <dlechner@baylibre.com>,
	=?UTF-8?q?Nuno=20S=C3=A1?= <nuno.sa@analog.com>,
	Andy Shevchenko <andy@kernel.org>,
	Lee Jones <lee@kernel.org>,
	Pavel Machek <pavel@kernel.org>,
	Griffin Kroah-Hartman <griffin@kroah.com>,
	Hans de Goede <hansg@kernel.org>,
	=?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>,
	Sebastian Reichel <sre@kernel.org>,
	Alexandre Belloni <alexandre.belloni@bootlin.com>,
	Wim Van Sebroeck <wim@linux-watchdog.org>,
	Jarkko Sakkinen <jarkko@kernel.org>,
	Mimi Zohar <zohar@linux.ibm.com>,
	Roberto Sassu <roberto.sassu@huawei.com>,
	Dmitry Kasatkin <dmitry.kasatkin@gmail.com>,
	Eric Snowberg <eric.snowberg@oracle.com>,
	Paul Moore <paul@paul-moore.com>,
	James Morris <jmorris@namei.org>,
	"Serge E. Hallyn" <serge@hallyn.com>,
	linux-kernel@vger.kernel.org,
	linux-pci@vger.kernel.org,
	linux-acpi@vger.kernel.org,
	linux-gpio@vger.kernel.org,
	asahi@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	linux-hwmon@vger.kernel.org,
	linux-iio@vger.kernel.org,
	linux-leds@vger.kernel.org,
	mfd@lists.linux.dev,
	platform-driver-x86@vger.kernel.org,
	linux-pm@vger.kernel.org,
	linux-rtc@vger.kernel.org,
	linux-watchdog@vger.kernel.org,
	linux-integrity@vger.kernel.org,
	keyrings@vger.kernel.org,
	linux-security-module@vger.kernel.org
Subject: [RFC PATCH 05/14] iio/accel: add driver for apple SMS
Date: Thu, 29 Oct 2026 04:52:02 -0400
Message-ID: <20261029085504.3547-6-atharvatiwarilinuxdev@gmail.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20261029085504.3547-1-atharvatiwarilinuxdev@gmail.com>
References: <20261029085504.3547-1-atharvatiwarilinuxdev@gmail.com>
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

Add a driver for the Sudden Motion Sensor accelerometer,
exposed through IIO. It reports the three axes and also
drop, orientation and shock events.

This replaces the motion sensor support in applesmc.

Signed-off-by: Atharva Tiwari <atharvatiwarilinuxdev@gmail.com>
---
 drivers/iio/accel/Kconfig        |  10 ++
 drivers/iio/accel/Makefile       |   1 +
 drivers/iio/accel/macsmc-accel.c | 248 +++++++++++++++++++++++++++++++
 drivers/mfd/macsmc-core.c        |  10 ++
 4 files changed, 269 insertions(+)
 create mode 100644 drivers/iio/accel/macsmc-accel.c

diff --git a/drivers/iio/accel/Kconfig b/drivers/iio/accel/Kconfig
index 141ac9842..50bc127a4 100644
--- a/drivers/iio/accel/Kconfig
+++ b/drivers/iio/accel/Kconfig
@@ -532,6 +532,16 @@ config KXCJK1013
 	  To compile this driver as a module, choose M here: the module will
 	  be called kxcjk-1013.
 
+config MACSMC_ACCEL
+	tristate "Apple SMC Motion Sensor Driver"
+	depends on MACSMC_ACPI
+	help
+	  Say yes here if you want support for Apple Motion Sensors, that uses
+	  the System Management Controller.
+
+	  To compile this driver as a module, choose M here: the module will
+	  be called macsmc-accel.
+
 config MC3230
 	tristate "mCube MC3230 Digital Accelerometer Driver"
 	depends on I2C
diff --git a/drivers/iio/accel/Makefile b/drivers/iio/accel/Makefile
index fa440a859..52fe661de 100644
--- a/drivers/iio/accel/Makefile
+++ b/drivers/iio/accel/Makefile
@@ -54,6 +54,7 @@ obj-$(CONFIG_KXSD9)	+= kxsd9.o
 obj-$(CONFIG_KXSD9_SPI)	+= kxsd9-spi.o
 obj-$(CONFIG_KXSD9_I2C)	+= kxsd9-i2c.o
 obj-$(CONFIG_MC3230)	+= mc3230.o
+obj-$(CONFIG_MACSMC_ACCEL)	+= macsmc-accel.o
 
 obj-$(CONFIG_MMA7455)		+= mma7455_core.o
 obj-$(CONFIG_MMA7455_I2C)	+= mma7455_i2c.o
diff --git a/drivers/iio/accel/macsmc-accel.c b/drivers/iio/accel/macsmc-accel.c
new file mode 100644
index 000000000..0abf81e7b
--- /dev/null
+++ b/drivers/iio/accel/macsmc-accel.c
@@ -0,0 +1,248 @@
+// SPDX-License-Identifier: GPL-2.0-only OR MIT
+/*
+ * Apple SMC sudden motion sensor (SMS) driver
+ *
+ * Copyright (C) 2026 Atharva Tiwari <atharvatiwarilinuxdev@gmail.com>
+ *
+ * Based on drivers/hwmon/applesmc.c:
+ * Copyright (C) 2007 Nicolas Boichat <nicolas@boichat.ch>
+ * Copyright (C) 2010 Henrik Rydberg <rydberg@euromail.se>
+ */
+
+#include <linux/delay.h>
+#include <linux/byteorder/generic.h>
+#include <linux/iio/events.h>
+#include <linux/iio/iio.h>
+#include <linux/mfd/macsmc.h>
+#include <linux/platform_device.h>
+#include <linux/pm.h>
+
+struct macsmc_accel {
+	struct apple_smc *smc;
+	struct iio_dev *indio_dev;
+	struct notifier_block nb;
+};
+
+enum {
+	SMS_DROP = 0,
+	SMS_ORIENTATION,
+	SMS_SHOCK,
+};
+
+static int macsmc_accel_read(struct macsmc_accel *drv, smc_key key, s16 *p)
+{
+	int ret;
+
+	ret = apple_smc_read_s16(drv->smc, key, p);
+	if (ret < 0)
+		return ret;
+
+	*p = (s16)be16_to_cpu(*p);
+	return 0;
+}
+
+static int macsmc_accel_dev_init(struct macsmc_accel *drv)
+{
+	int ret, total;
+	u16 buf;
+
+	for (total = 0; total < 100; total++) {
+		ret = apple_smc_read_u16(drv->smc, SMC_KEY(MOCN), &buf);
+		if (!ret && buf)
+			return 0;
+
+		buf = 0xE0;
+		apple_smc_write_u16(drv->smc, SMC_KEY(MOCN), buf);
+		msleep(50);
+	}
+
+	return -ENODEV;
+}
+
+static int macsmc_accel_read_raw(struct iio_dev *indio_dev, struct iio_chan_spec const *chan,
+		int *val, int *val2, long mask)
+{
+	struct macsmc_accel *drv = iio_priv(indio_dev);
+	int ret;
+	s16 buf;
+
+	if (mask != IIO_CHAN_INFO_RAW)
+		return -EINVAL;
+
+	switch (chan->channel2) {
+	case IIO_MOD_X:
+		ret = macsmc_accel_read(drv, SMC_KEY(MO_X), &buf);
+		if (ret < 0)
+			return ret;
+
+		*val = buf;
+		return IIO_VAL_INT;
+	case IIO_MOD_Y:
+		ret = macsmc_accel_read(drv, SMC_KEY(MO_Y), &buf);
+		if (ret < 0)
+			return ret;
+
+		*val = buf;
+		return IIO_VAL_INT;
+	case IIO_MOD_Z:
+		ret = macsmc_accel_read(drv, SMC_KEY(MO_Z), &buf);
+		if (ret < 0)
+			return ret;
+
+		*val = buf;
+		return IIO_VAL_INT;
+	}
+
+	return -EINVAL;
+}
+
+static int macsmc_accel_event(struct notifier_block *nb, unsigned long event, void *data)
+{
+	struct macsmc_accel *drv = container_of(nb, struct macsmc_accel, nb);
+	u64 code;
+
+	/* check if event is for us */
+	if (event != 0x60 && event != 0x69 && event != 0x6F)
+		return NOTIFY_DONE;
+
+	switch (event) {
+	case 0x60:
+		code = IIO_UNMOD_EVENT_CODE(IIO_ACCEL, SMS_DROP,
+					    IIO_EV_TYPE_CHANGE,
+					    IIO_EV_DIR_NONE);
+		break;
+	case 0x69:
+		code = IIO_UNMOD_EVENT_CODE(IIO_ACCEL, SMS_ORIENTATION,
+					    IIO_EV_TYPE_CHANGE,
+					    IIO_EV_DIR_NONE);
+		break;
+	case 0x6F:
+		code = IIO_UNMOD_EVENT_CODE(IIO_ACCEL, SMS_SHOCK,
+					    IIO_EV_TYPE_CHANGE,
+					    IIO_EV_DIR_NONE);
+		break;
+	}
+
+	iio_push_event(drv->indio_dev, code, iio_get_time_ns(drv->indio_dev));
+	return NOTIFY_OK;
+}
+
+static void macsmc_accel_unregister_notifier(void *data)
+{
+	struct macsmc_accel *drv = data;
+
+	blocking_notifier_chain_unregister(drv->smc->event_handlers,
+					&drv->nb);
+}
+
+static const struct iio_event_spec macsmc_accel_event_spec = {
+	.type = IIO_EV_TYPE_CHANGE,
+	.dir = IIO_EV_DIR_NONE,
+	.mask_separate = BIT(IIO_EV_INFO_ENABLE),
+};
+
+static const struct iio_chan_spec macsmc_accel_channels[] = {
+	{
+		.type = IIO_ACCEL,
+		.modified = 1,
+		.channel2 = IIO_MOD_X,
+		.info_mask_separate = BIT(IIO_CHAN_INFO_RAW),
+	},
+	{
+		.type = IIO_ACCEL,
+		.modified = 1,
+		.channel2 = IIO_MOD_Y,
+		.info_mask_separate = BIT(IIO_CHAN_INFO_RAW),
+	},
+	{
+		.type = IIO_ACCEL,
+		.modified = 1,
+		.channel2 = IIO_MOD_Z,
+		.info_mask_separate = BIT(IIO_CHAN_INFO_RAW),
+	},
+	{
+		.type = IIO_ACCEL,
+		.channel = SMS_DROP,
+		.event_spec = &macsmc_accel_event_spec,
+		.num_event_specs = 1,
+	},
+	{
+		.type = IIO_ACCEL,
+		.channel = SMS_ORIENTATION,
+		.event_spec = &macsmc_accel_event_spec,
+		.num_event_specs = 1,
+	},
+	{
+		.type = IIO_ACCEL,
+		.channel = SMS_SHOCK,
+		.event_spec = &macsmc_accel_event_spec,
+		.num_event_specs = 1,
+	},
+};
+
+static const struct iio_info macsmc_accel_info = {
+	.read_raw = macsmc_accel_read_raw
+};
+
+static int macsmc_accel_restore(struct device *dev)
+{
+	struct macsmc_accel *drv = dev_get_drvdata(dev);
+
+	return macsmc_accel_dev_init(drv);
+}
+
+static const struct dev_pm_ops macsmc_accel_pm_ops = {
+	.restore = macsmc_accel_restore,
+};
+
+static int macsmc_accel_probe(struct platform_device *pdev)
+{
+	struct macsmc_accel *drv;
+	struct iio_dev *indio_dev;
+	int ret;
+
+	indio_dev = devm_iio_device_alloc(&pdev->dev, sizeof(*drv));
+	if (!indio_dev)
+		return -ENOMEM;
+
+	drv = iio_priv(indio_dev);
+	drv->smc = dev_get_drvdata(pdev->dev.parent);
+
+	ret = macsmc_accel_dev_init(drv);
+	if (ret)
+		return ret;
+
+	drv->indio_dev = indio_dev;
+	drv->nb.notifier_call = macsmc_accel_event;
+	ret = blocking_notifier_chain_register(drv->smc->event_handlers, &drv->nb);
+	if (ret)
+		return ret;
+
+	ret = devm_add_action_or_reset(&pdev->dev, macsmc_accel_unregister_notifier, drv);
+	if (ret)
+		return ret;
+
+	platform_set_drvdata(pdev, drv);
+
+	indio_dev->name = "macsmc-accel";
+	indio_dev->modes = INDIO_DIRECT_MODE;
+	indio_dev->info = &macsmc_accel_info;
+	indio_dev->channels = macsmc_accel_channels;
+	indio_dev->num_channels = ARRAY_SIZE(macsmc_accel_channels);
+
+	return devm_iio_device_register(&pdev->dev, indio_dev);
+}
+
+static struct platform_driver macsmc_accel_driver = {
+	.probe = macsmc_accel_probe,
+	.driver = {
+		.name = "macsmc-accel",
+		.pm = &macsmc_accel_pm_ops,
+	},
+};
+module_platform_driver(macsmc_accel_driver);
+
+MODULE_AUTHOR("Atharva Tiwari <atharvatiwarilinuxdev@gmail.com>");
+MODULE_DESCRIPTION("Apple SMC Motion Sensor Driver");
+MODULE_LICENSE("Dual MIT/GPL");
+MODULE_ALIAS("platform:macsmc-accel");
diff --git a/drivers/mfd/macsmc-core.c b/drivers/mfd/macsmc-core.c
index 6014df4fe..6567d2f1f 100644
--- a/drivers/mfd/macsmc-core.c
+++ b/drivers/mfd/macsmc-core.c
@@ -24,6 +24,10 @@ static const struct mfd_cell apple_smc_rtkit_devs[] = {
  * There isn't device tree on acpi backend, so we need to use
  * apple_smc_key_exists to register mfd devs
  */
+static const struct mfd_cell apple_smc_acpi_accel[] = {
+	MFD_CELL_NAME("macsmc-accel"),
+};
+
 static const struct mfd_cell apple_smc_acpi_common[] = {
 	MFD_CELL_NAME("macsmc-hwmon"),
 	MFD_CELL_NAME("macsmc-power"),
@@ -169,6 +173,12 @@ int apple_smc_probe(struct device *dev, const struct apple_smc_backend_ops *ops,
 				return ret;
 		}
 
+		if (apple_smc_key_exists(smc, SMC_KEY(MOCN))) {
+			ret = devm_mfd_add_devices(dev, -1, apple_smc_acpi_accel,
+				ARRAY_SIZE(apple_smc_acpi_accel), NULL, 0, NULL);
+			if (ret < 0)
+				return ret;
+		}
 	} else
 		ret = devm_mfd_add_devices(dev, -1, apple_smc_rtkit_devs,
 			ARRAY_SIZE(apple_smc_rtkit_devs), NULL, 0, NULL);
-- 
2.55.0

