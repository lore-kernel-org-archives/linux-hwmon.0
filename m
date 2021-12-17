Return-Path: <linux-hwmon-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9824BC433EF
	for <linux-hwmon@archiver.kernel.org>; Fri, 17 Dec 2021 16:01:30 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S238748AbhLQQBa (ORCPT <rfc822;linux-hwmon@archiver.kernel.org>);
        Fri, 17 Dec 2021 11:01:30 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37038 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235191AbhLQQB3 (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>);
        Fri, 17 Dec 2021 11:01:29 -0500
Received: from mail-oi1-x229.google.com (mail-oi1-x229.google.com [IPv6:2607:f8b0:4864:20::229])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 01EEFC061574
        for <linux-hwmon@vger.kernel.org>; Fri, 17 Dec 2021 08:01:29 -0800 (PST)
Received: by mail-oi1-x229.google.com with SMTP id q25so4328085oiw.0
        for <linux-hwmon@vger.kernel.org>; Fri, 17 Dec 2021 08:01:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=sender:date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=7px0in5b0qY6k5DsJmKrv6IRBgQ6Ohu0d7UuKI5Cbk4=;
        b=HpgNgzgicHjq993fZaYd6qBuovS0q0ZSNnBYbn6Whko4rIvRgYCykpHQ3MDl5QxV9b
         aPljg54RcsgL9Y7TggsKDAcj7vh/JdJyEcl0opadS+VW1IH44SakCyZkYJdlDkFJx28c
         j1TJ2Qaq3MzMstO9lrhzGq/lAmm7IFOMJxx20kbTiUL5dnG0UHvOQ9AxSm2XTyXA3Rk6
         6VNokkKRwPijbDyAswuiPOdpLl4ZixJ9nDkjG9tryHQFgbqLXKYAey+sEOjTx7JYH6iv
         ysNjEi/jN/Akhy0bmqZUCV2JTfpz7LWCqxgzUmnwBo65NlVlmm52fZ2Dx1cKRkaIW+qW
         MEWA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:sender:date:from:to:cc:subject:message-id
         :references:mime-version:content-disposition:in-reply-to;
        bh=7px0in5b0qY6k5DsJmKrv6IRBgQ6Ohu0d7UuKI5Cbk4=;
        b=mNOaubQxG2VSOJaxIEwKC9No/y6vHHxAWcsl78nOX35SSfK+ieJ8IQmRC0bN7ogxj4
         Sr62rCO+sikrij8BHJ076cfUwIp/CPp+h3VGgJGbIFuXXxlI0uctC9LiGfgCnst4Pd+b
         gPKUdg9KeYLDZ+Uew/XCQvTuT696ImGq8x86g0URmM3Ss+lw9jTiAlAv3FyUW6l+c/aS
         WOv/UKillP7JqR2w7dSpRBfEQfXvc7zNwQ2vo3sNuJf9RCAwHAlOCHpX3wd5szP7TGbM
         l/RHnH7hMT8BRhugYKvDUz0NEiNqOFGpkXXLkUXYB+mf+DTsswgWjNyChKeITM9Lvi48
         jIeQ==
X-Gm-Message-State: AOAM533vE56cj2iO80lQ7fWlLMlEvKJfumZR+A6W4weixenS0VXc7TAV
        wLFHiOflx30759+VJug+vJw=
X-Google-Smtp-Source: ABdhPJxRPOG/sG8J0W+J/IwCYJTw9aqBlZxToaWwvwt+xSVHkbPhMOGdKkuNXx0WPtldY/3iitalBQ==
X-Received: by 2002:aca:4b05:: with SMTP id y5mr1565145oia.21.1639756888082;
        Fri, 17 Dec 2021 08:01:28 -0800 (PST)
Received: from server.roeck-us.net ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
        by smtp.gmail.com with ESMTPSA id l39sm1754959otv.63.2021.12.17.08.01.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 17 Dec 2021 08:01:27 -0800 (PST)
Sender: Guenter Roeck <groeck7@gmail.com>
Date:   Fri, 17 Dec 2021 08:01:26 -0800
From:   Guenter Roeck <linux@roeck-us.net>
To:     Aleksandr Mezin <mezin.alexander@gmail.com>
Cc:     linux-hwmon@vger.kernel.org, Jean Delvare <jdelvare@suse.com>,
        Jonas Malaco <jonas@protocubo.io>
Subject: Re: [PATCH v2] hwmon: add driver for NZXT RGB&Fan Controller/Smart
 Device v2.
Message-ID: <20211217160126.GA3221191@roeck-us.net>
References: <20211031033058.151014-1-mezin.alexander@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20211031033058.151014-1-mezin.alexander@gmail.com>
Precedence: bulk
List-ID: <linux-hwmon.vger.kernel.org>
X-Mailing-List: linux-hwmon@vger.kernel.org

On Sun, Oct 31, 2021 at 09:30:58AM +0600, Aleksandr Mezin wrote:
> This driver implements monitoring and control of fans plugged into the
> device. Besides typical speed monitoring and PWM duty cycle control,
> voltage and current are reported for every fan.
> 
> The device also has 2 connectors for RGB LEDs, support for them isn't
> implemented (mainly because there is no standardized sysfs interface).
> 
> Also, the device has a noise sensor, but the sensor seems to be completely
> useless (and very imprecise), so support for it isn't implemented too.
> 
> The driver coexists with userspace tools that access the device through
> hidraw interface with no known issues.
> 
> The driver has been tested on x86_64, built in and as a module.
> 
> Some changes/improvements were suggested by Jonas Malaco.
> 
> Signed-off-by: Aleksandr Mezin <mezin.alexander@gmail.com>

Applied.

Thanks,
Guenter

> ---
> Changes in v2:
> - Renamed the driver to nzxt-smart2.
> - Removed lockdep assert, mutex locking during initialization and reset_resume.
> - Removed unnecessary READ_ONCE, WRITE_ONCE
> - Consistent error handling, always goto/return in error case.
> - Tried to improve comments and documentation a bit.
> 
>  Documentation/hwmon/index.rst       |   1 +
>  Documentation/hwmon/nzxt-smart2.rst |  62 +++
>  MAINTAINERS                         |   7 +
>  drivers/hwmon/Kconfig               |  10 +
>  drivers/hwmon/Makefile              |   1 +
>  drivers/hwmon/nzxt-smart2.c         | 829 ++++++++++++++++++++++++++++
>  6 files changed, 910 insertions(+)
>  create mode 100644 Documentation/hwmon/nzxt-smart2.rst
>  create mode 100644 drivers/hwmon/nzxt-smart2.c
> 
> diff --git a/Documentation/hwmon/index.rst b/Documentation/hwmon/index.rst
> index f790f1260c33..1020eadf8ab3 100644
> --- a/Documentation/hwmon/index.rst
> +++ b/Documentation/hwmon/index.rst
> @@ -149,6 +149,7 @@ Hardware Monitoring Kernel Drivers
>     nsa320
>     ntc_thermistor
>     nzxt-kraken2
> +   nzxt-smart2
>     occ
>     pc87360
>     pc87427
> diff --git a/Documentation/hwmon/nzxt-smart2.rst b/Documentation/hwmon/nzxt-smart2.rst
> new file mode 100644
> index 000000000000..d9d1b2742665
> --- /dev/null
> +++ b/Documentation/hwmon/nzxt-smart2.rst
> @@ -0,0 +1,62 @@
> +.. SPDX-License-Identifier: GPL-2.0-or-later
> +
> +Kernel driver nzxt-smart2
> +=========================
> +
> +Supported devices:
> +
> +- NZXT RGB & Fan controller
> +- NZXT Smart Device v2
> +
> +Description
> +-----------
> +
> +This driver implements monitoring and control of fans plugged into the device.
> +Besides typical speed monitoring and PWM duty cycle control, voltage and current
> +is reported for every fan.
> +
> +The device also has two connectors for RGB LEDs; support for them isn't
> +implemented (mainly because there is no standardized sysfs interface).
> +
> +Also, the device has a noise sensor, but the sensor seems to be completely
> +useless (and very imprecise), so support for it isn't implemented too.
> +
> +Usage Notes
> +-----------
> +
> +The device should be autodetected, and the driver should load automatically.
> +
> +If fans are plugged in/unplugged while the system is powered on, the driver
> +must be reloaded to detect configuration changes; otherwise, new fans can't
> +be controlled (`pwm*` changes will be ignored). It is necessary because the
> +device has a dedicated "detect fans" command, and currently, it is executed only
> +during initialization. Speed, voltage, current monitoring will work even without
> +reload. As an alternative to reloading the module, a userspace tool (like
> +`liquidctl`_) can be used to run "detect fans" command through hidraw interface.
> +
> +The driver coexists with userspace tools that access the device through hidraw
> +interface with no known issues.
> +
> +.. _liquidctl: https://github.com/liquidctl/liquidctl
> +
> +Sysfs entries
> +-------------
> +
> +=======================	========================================================
> +fan[1-3]_input		Fan speed monitoring (in rpm).
> +curr[1-3]_input		Current supplied to the fan (in milliamperes).
> +in[0-2]_input		Voltage supplied to the fan (in millivolts).
> +pwm[1-3]		Controls fan speed: PWM duty cycle for PWM-controlled
> +			fans, voltage for other fans. Voltage can be changed in
> +			9-12 V range, but the value of the sysfs attribute is
> +			always in 0-255 range (1 = 9V, 255 = 12V). Setting the
> +			attribute to 0 turns off the fan completely.
> +pwm[1-3]_enable		1 if the fan can be controlled by writing to the
> +			corresponding pwm* attribute, 0 otherwise. The device
> +			can control only the fans it detected itself, so the
> +			attribute is read-only.
> +pwm[1-3]_mode		Read-only, 1 for PWM-controlled fans, 0 for other fans
> +			(or if no fan connected).
> +update_interval		The interval at which all inputs are updated (in
> +			milliseconds). The default is 1000ms. Minimum is 250ms.
> +=======================	========================================================
> diff --git a/MAINTAINERS b/MAINTAINERS
> index f26920f0fa65..8b2342317dc6 100644
> --- a/MAINTAINERS
> +++ b/MAINTAINERS
> @@ -13543,6 +13543,13 @@ S:	Maintained
>  F:	Documentation/hwmon/nzxt-kraken2.rst
>  F:	drivers/hwmon/nzxt-kraken2.c
>  
> +NZXT-SMART2 HARDWARE MONITORING DRIVER
> +M:	Aleksandr Mezin <mezin.alexander@gmail.com>
> +L:	linux-hwmon@vger.kernel.org
> +S:	Maintained
> +F:	Documentation/hwmon/nzxt-smart2.rst
> +F:	drivers/hwmon/nzxt-smart2.c
> +
>  OBJAGG
>  M:	Jiri Pirko <jiri@nvidia.com>
>  L:	netdev@vger.kernel.org
> diff --git a/drivers/hwmon/Kconfig b/drivers/hwmon/Kconfig
> index c4578e8f34bb..5301b7fcfa49 100644
> --- a/drivers/hwmon/Kconfig
> +++ b/drivers/hwmon/Kconfig
> @@ -1502,6 +1502,16 @@ config SENSORS_NZXT_KRAKEN2
>  	  This driver can also be built as a module. If so, the module
>  	  will be called nzxt-kraken2.
>  
> +config SENSORS_NZXT_SMART2
> +	tristate "NZXT RGB & Fan Controller/Smart Device v2"
> +	depends on USB_HID
> +	help
> +	  If you say yes here you get support for hardware monitoring for the
> +	  NZXT RGB & Fan Controller/Smart Device v2.
> +
> +	  This driver can also be built as a module. If so, the module
> +	  will be called nzxt-smart2.
> +
>  source "drivers/hwmon/occ/Kconfig"
>  
>  config SENSORS_PCF8591
> diff --git a/drivers/hwmon/Makefile b/drivers/hwmon/Makefile
> index 162940270661..335a3b45c862 100644
> --- a/drivers/hwmon/Makefile
> +++ b/drivers/hwmon/Makefile
> @@ -156,6 +156,7 @@ obj-$(CONFIG_SENSORS_NPCM7XX)	+= npcm750-pwm-fan.o
>  obj-$(CONFIG_SENSORS_NSA320)	+= nsa320-hwmon.o
>  obj-$(CONFIG_SENSORS_NTC_THERMISTOR)	+= ntc_thermistor.o
>  obj-$(CONFIG_SENSORS_NZXT_KRAKEN2) += nzxt-kraken2.o
> +obj-$(CONFIG_SENSORS_NZXT_SMART2) += nzxt-smart2.o
>  obj-$(CONFIG_SENSORS_PC87360)	+= pc87360.o
>  obj-$(CONFIG_SENSORS_PC87427)	+= pc87427.o
>  obj-$(CONFIG_SENSORS_PCF8591)	+= pcf8591.o
> diff --git a/drivers/hwmon/nzxt-smart2.c b/drivers/hwmon/nzxt-smart2.c
> new file mode 100644
> index 000000000000..534d39b8908e
> --- /dev/null
> +++ b/drivers/hwmon/nzxt-smart2.c
> @@ -0,0 +1,829 @@
> +// SPDX-License-Identifier: GPL-2.0-or-later
> +/*
> + * Reverse-engineered NZXT RGB & Fan Controller/Smart Device v2 driver.
> + *
> + * Copyright (c) 2021 Aleksandr Mezin
> + */
> +
> +#include <linux/hid.h>
> +#include <linux/hwmon.h>
> +#include <linux/math.h>
> +#include <linux/module.h>
> +#include <linux/mutex.h>
> +#include <linux/spinlock.h>
> +#include <linux/wait.h>
> +
> +#include <asm/byteorder.h>
> +#include <asm/unaligned.h>
> +
> +/*
> + * The device has only 3 fan channels/connectors. But all HID reports have
> + * space reserved for up to 8 channels.
> + */
> +#define FAN_CHANNELS 3
> +#define FAN_CHANNELS_MAX 8
> +
> +#define UPDATE_INTERVAL_DEFAULT_MS 1000
> +
> +/* These strings match labels on the device exactly */
> +static const char *const fan_label[] = {
> +	"FAN 1",
> +	"FAN 2",
> +	"FAN 3",
> +};
> +
> +static const char *const curr_label[] = {
> +	"FAN 1 Current",
> +	"FAN 2 Current",
> +	"FAN 3 Current",
> +};
> +
> +static const char *const in_label[] = {
> +	"FAN 1 Voltage",
> +	"FAN 2 Voltage",
> +	"FAN 3 Voltage",
> +};
> +
> +enum {
> +	INPUT_REPORT_ID_FAN_CONFIG = 0x61,
> +	INPUT_REPORT_ID_FAN_STATUS = 0x67,
> +};
> +
> +enum {
> +	FAN_STATUS_REPORT_SPEED = 0x02,
> +	FAN_STATUS_REPORT_VOLTAGE = 0x04,
> +};
> +
> +enum {
> +	FAN_TYPE_NONE = 0,
> +	FAN_TYPE_DC = 1,
> +	FAN_TYPE_PWM = 2,
> +};
> +
> +struct unknown_static_data {
> +	/*
> +	 * Some configuration data? Stays the same after fan speed changes,
> +	 * changes in fan configuration, reboots and driver reloads.
> +	 *
> +	 * The same data in multiple report types.
> +	 *
> +	 * Byte 12 seems to be the number of fan channels, but I am not sure.
> +	 */
> +	u8 unknown1[14];
> +} __packed;
> +
> +/*
> + * The device sends this input report in response to "detect fans" command:
> + * a 2-byte output report { 0x60, 0x03 }.
> + */
> +struct fan_config_report {
> +	/* report_id should be INPUT_REPORT_ID_FAN_CONFIG = 0x61 */
> +	u8 report_id;
> +	/* Always 0x03 */
> +	u8 magic;
> +	struct unknown_static_data unknown_data;
> +	/* Fan type as detected by the device. See FAN_TYPE_* enum. */
> +	u8 fan_type[FAN_CHANNELS_MAX];
> +} __packed;
> +
> +/*
> + * The device sends these reports at a fixed interval (update interval) -
> + * one report with type = FAN_STATUS_REPORT_SPEED, and one report with type =
> + * FAN_STATUS_REPORT_VOLTAGE per update interval.
> + */
> +struct fan_status_report {
> +	/* report_id should be INPUT_REPORT_ID_STATUS = 0x67 */
> +	u8 report_id;
> +	/* FAN_STATUS_REPORT_SPEED = 0x02 or FAN_STATUS_REPORT_VOLTAGE = 0x04 */
> +	u8 type;
> +	struct unknown_static_data unknown_data;
> +	/* Fan type as detected by the device. See FAN_TYPE_* enum. */
> +	u8 fan_type[FAN_CHANNELS_MAX];
> +
> +	union {
> +		/* When type == FAN_STATUS_REPORT_SPEED */
> +		struct {
> +			/*
> +			 * Fan speed, in RPM. Zero for channels without fans
> +			 * connected.
> +			 */
> +			__le16 fan_rpm[FAN_CHANNELS_MAX];
> +			/*
> +			 * Fan duty cycle, in percent. Non-zero even for
> +			 * channels without fans connected.
> +			 */
> +			u8 duty_percent[FAN_CHANNELS_MAX];
> +			/*
> +			 * Exactly the same values as duty_percent[], non-zero
> +			 * for disconnected fans too.
> +			 */
> +			u8 duty_percent_dup[FAN_CHANNELS_MAX];
> +			/* "Case Noise" in db */
> +			u8 noise_db;
> +		} __packed fan_speed;
> +		/* When type == FAN_STATUS_REPORT_VOLTAGE */
> +		struct {
> +			/*
> +			 * Voltage, in millivolts. Non-zero even when fan is
> +			 * not connected.
> +			 */
> +			__le16 fan_in[FAN_CHANNELS_MAX];
> +			/*
> +			 * Current, in milliamperes. Near-zero when
> +			 * disconnected.
> +			 */
> +			__le16 fan_current[FAN_CHANNELS_MAX];
> +		} __packed fan_voltage;
> +	} __packed;
> +} __packed;
> +
> +#define OUTPUT_REPORT_SIZE 64
> +
> +enum {
> +	OUTPUT_REPORT_ID_INIT_COMMAND = 0x60,
> +	OUTPUT_REPORT_ID_SET_FAN_SPEED = 0x62,
> +};
> +
> +enum {
> +	INIT_COMMAND_SET_UPDATE_INTERVAL = 0x02,
> +	INIT_COMMAND_DETECT_FANS = 0x03,
> +};
> +
> +/*
> + * This output report sets pwm duty cycle/target fan speed for one or more
> + * channels.
> + */
> +struct set_fan_speed_report {
> +	/* report_id should be OUTPUT_REPORT_ID_SET_FAN_SPEED = 0x62 */
> +	u8 report_id;
> +	/* Should be 0x01 */
> +	u8 magic;
> +	/* To change fan speed on i-th channel, set i-th bit here */
> +	u8 channel_bit_mask;
> +	/*
> +	 * Fan duty cycle/target speed in percent. For voltage-controlled fans,
> +	 * the minimal voltage (duty_percent = 1) is about 9V.
> +	 * Setting duty_percent to 0 (if the channel is selected in
> +	 * channel_bit_mask) turns off the fan completely (regardless of the
> +	 * control mode).
> +	 */
> +	u8 duty_percent[FAN_CHANNELS_MAX];
> +} __packed;
> +
> +struct drvdata {
> +	struct hid_device *hid;
> +	struct device *hwmon;
> +
> +	u8 fan_duty_percent[FAN_CHANNELS];
> +	u16 fan_rpm[FAN_CHANNELS];
> +	bool pwm_status_received;
> +
> +	u16 fan_in[FAN_CHANNELS];
> +	u16 fan_curr[FAN_CHANNELS];
> +	bool voltage_status_received;
> +
> +	u8 fan_type[FAN_CHANNELS];
> +	bool fan_config_received;
> +
> +	/*
> +	 * wq is used to wait for *_received flags to become true.
> +	 * All accesses to *_received flags and fan_* arrays are performed with
> +	 * wq.lock held.
> +	 */
> +	wait_queue_head_t wq;
> +	/*
> +	 * mutex is used to:
> +	 * 1) Prevent concurrent conflicting changes to update interval and pwm
> +	 * values (after sending an output hid report, the corresponding field
> +	 * in drvdata must be updated, and only then new output reports can be
> +	 * sent).
> +	 * 2) Synchronize access to output_buffer (well, the buffer is here,
> +	 * because synchronization is necessary anyway - so why not get rid of
> +	 * a kmalloc?).
> +	 */
> +	struct mutex mutex;
> +	long update_interval;
> +	u8 output_buffer[OUTPUT_REPORT_SIZE];
> +};
> +
> +static long scale_pwm_value(long val, long orig_max, long new_max)
> +{
> +	if (val <= 0)
> +		return 0;
> +
> +	/*
> +	 * Positive values should not become zero: 0 completely turns off the
> +	 * fan.
> +	 */
> +	return max(1L, DIV_ROUND_CLOSEST(min(val, orig_max) * new_max, orig_max));
> +}
> +
> +static void handle_fan_config_report(struct drvdata *drvdata, void *data, int size)
> +{
> +	struct fan_config_report *report = data;
> +	int i;
> +
> +	if (size < sizeof(struct fan_config_report))
> +		return;
> +
> +	if (report->magic != 0x03)
> +		return;
> +
> +	spin_lock(&drvdata->wq.lock);
> +
> +	for (i = 0; i < FAN_CHANNELS; i++)
> +		drvdata->fan_type[i] = report->fan_type[i];
> +
> +	drvdata->fan_config_received = true;
> +	wake_up_all_locked(&drvdata->wq);
> +	spin_unlock(&drvdata->wq.lock);
> +}
> +
> +static void handle_fan_status_report(struct drvdata *drvdata, void *data, int size)
> +{
> +	struct fan_status_report *report = data;
> +	int i;
> +
> +	if (size < sizeof(struct fan_status_report))
> +		return;
> +
> +	spin_lock(&drvdata->wq.lock);
> +
> +	/*
> +	 * The device sends INPUT_REPORT_ID_FAN_CONFIG = 0x61 report in response
> +	 * to "detect fans" command. Only accept other data after getting 0x61,
> +	 * to make sure that fan detection is complete. In particular, fan
> +	 * detection resets pwm values.
> +	 */
> +	if (!drvdata->fan_config_received) {
> +		spin_unlock(&drvdata->wq.lock);
> +		return;
> +	}
> +
> +	for (i = 0; i < FAN_CHANNELS; i++) {
> +		if (drvdata->fan_type[i] == report->fan_type[i])
> +			continue;
> +
> +		/*
> +		 * This should not happen (if my expectations about the device
> +		 * are correct).
> +		 *
> +		 * Even if the userspace sends fan detect command through
> +		 * hidraw, fan config report should arrive first.
> +		 */
> +		hid_warn_once(drvdata->hid,
> +			      "Fan %d type changed unexpectedly from %d to %d",
> +			      i, drvdata->fan_type[i], report->fan_type[i]);
> +		drvdata->fan_type[i] = report->fan_type[i];
> +	}
> +
> +	switch (report->type) {
> +	case FAN_STATUS_REPORT_SPEED:
> +		for (i = 0; i < FAN_CHANNELS; i++) {
> +			drvdata->fan_rpm[i] =
> +				get_unaligned_le16(&report->fan_speed.fan_rpm[i]);
> +			drvdata->fan_duty_percent[i] =
> +				report->fan_speed.duty_percent[i];
> +		}
> +
> +		drvdata->pwm_status_received = true;
> +		wake_up_all_locked(&drvdata->wq);
> +		break;
> +
> +	case FAN_STATUS_REPORT_VOLTAGE:
> +		for (i = 0; i < FAN_CHANNELS; i++) {
> +			drvdata->fan_in[i] =
> +				get_unaligned_le16(&report->fan_voltage.fan_in[i]);
> +			drvdata->fan_curr[i] =
> +				get_unaligned_le16(&report->fan_voltage.fan_current[i]);
> +		}
> +
> +		drvdata->voltage_status_received = true;
> +		wake_up_all_locked(&drvdata->wq);
> +		break;
> +	}
> +
> +	spin_unlock(&drvdata->wq.lock);
> +}
> +
> +static umode_t nzxt_smart2_hwmon_is_visible(const void *data,
> +					    enum hwmon_sensor_types type,
> +					    u32 attr, int channel)
> +{
> +	switch (type) {
> +	case hwmon_pwm:
> +		switch (attr) {
> +		case hwmon_pwm_input:
> +		case hwmon_pwm_enable:
> +			return 0644;
> +
> +		default:
> +			return 0444;
> +		}
> +
> +	case hwmon_chip:
> +		switch (attr) {
> +		case hwmon_chip_update_interval:
> +			return 0644;
> +
> +		default:
> +			return 0444;
> +		}
> +
> +	default:
> +		return 0444;
> +	}
> +}
> +
> +static int nzxt_smart2_hwmon_read(struct device *dev, enum hwmon_sensor_types type,
> +				  u32 attr, int channel, long *val)
> +{
> +	struct drvdata *drvdata = dev_get_drvdata(dev);
> +	int res = -EINVAL;
> +
> +	if (type == hwmon_chip) {
> +		switch (attr) {
> +		case hwmon_chip_update_interval:
> +			*val = drvdata->update_interval;
> +			return 0;
> +
> +		default:
> +			return -EINVAL;
> +		}
> +	}
> +
> +	spin_lock_irq(&drvdata->wq.lock);
> +
> +	switch (type) {
> +	case hwmon_pwm:
> +		/*
> +		 * fancontrol:
> +		 * 1) remembers pwm* values when it starts
> +		 * 2) needs pwm*_enable to be 1 on controlled fans
> +		 * So make sure we have correct data before allowing pwm* reads.
> +		 * Returning errors for pwm of fan speed read can even cause
> +		 * fancontrol to shut down. So the wait is unavoidable.
> +		 */
> +		switch (attr) {
> +		case hwmon_pwm_enable:
> +			res = wait_event_interruptible_locked_irq(drvdata->wq,
> +								  drvdata->fan_config_received);
> +			if (res)
> +				goto unlock;
> +
> +			*val = drvdata->fan_type[channel] != FAN_TYPE_NONE;
> +			break;
> +
> +		case hwmon_pwm_mode:
> +			res = wait_event_interruptible_locked_irq(drvdata->wq,
> +								  drvdata->fan_config_received);
> +			if (res)
> +				goto unlock;
> +
> +			*val = drvdata->fan_type[channel] == FAN_TYPE_PWM;
> +			break;
> +
> +		case hwmon_pwm_input:
> +			res = wait_event_interruptible_locked_irq(drvdata->wq,
> +								  drvdata->pwm_status_received);
> +			if (res)
> +				goto unlock;
> +
> +			*val = scale_pwm_value(drvdata->fan_duty_percent[channel],
> +					       100, 255);
> +			break;
> +		}
> +		break;
> +
> +	case hwmon_fan:
> +		/*
> +		 * It's not strictly necessary to wait for *_received in the
> +		 * remaining cases (fancontrol doesn't care about them). But I'm
> +		 * doing it to have consistent behavior.
> +		 */
> +		if (attr == hwmon_fan_input) {
> +			res = wait_event_interruptible_locked_irq(drvdata->wq,
> +								  drvdata->pwm_status_received);
> +			if (res)
> +				goto unlock;
> +
> +			*val = drvdata->fan_rpm[channel];
> +		}
> +		break;
> +
> +	case hwmon_in:
> +		if (attr == hwmon_in_input) {
> +			res = wait_event_interruptible_locked_irq(drvdata->wq,
> +								  drvdata->voltage_status_received);
> +			if (res)
> +				goto unlock;
> +
> +			*val = drvdata->fan_in[channel];
> +		}
> +		break;
> +
> +	case hwmon_curr:
> +		if (attr == hwmon_curr_input) {
> +			res = wait_event_interruptible_locked_irq(drvdata->wq,
> +								  drvdata->voltage_status_received);
> +			if (res)
> +				goto unlock;
> +
> +			*val = drvdata->fan_curr[channel];
> +		}
> +		break;
> +
> +	default:
> +		break;
> +	}
> +
> +unlock:
> +	spin_unlock_irq(&drvdata->wq.lock);
> +	return res;
> +}
> +
> +static int send_output_report(struct drvdata *drvdata, const void *data,
> +			      size_t data_size)
> +{
> +	int ret;
> +
> +	if (data_size > sizeof(drvdata->output_buffer))
> +		return -EINVAL;
> +
> +	memcpy(drvdata->output_buffer, data, data_size);
> +
> +	if (data_size < sizeof(drvdata->output_buffer))
> +		memset(drvdata->output_buffer + data_size, 0,
> +		       sizeof(drvdata->output_buffer) - data_size);
> +
> +	ret = hid_hw_output_report(drvdata->hid, drvdata->output_buffer,
> +				   sizeof(drvdata->output_buffer));
> +	return ret < 0 ? ret : 0;
> +}
> +
> +static int set_pwm(struct drvdata *drvdata, int channel, long val)
> +{
> +	int ret;
> +	u8 duty_percent = scale_pwm_value(val, 255, 100);
> +
> +	struct set_fan_speed_report report = {
> +		.report_id = OUTPUT_REPORT_ID_SET_FAN_SPEED,
> +		.magic = 1,
> +		.channel_bit_mask = 1 << channel
> +	};
> +
> +	ret = mutex_lock_interruptible(&drvdata->mutex);
> +	if (ret)
> +		return ret;
> +
> +	report.duty_percent[channel] = duty_percent;
> +	ret = send_output_report(drvdata, &report, sizeof(report));
> +	if (ret)
> +		goto unlock;
> +
> +	/*
> +	 * pwmconfig and fancontrol scripts expect pwm writes to take effect
> +	 * immediately (i. e. read from pwm* sysfs should return the value
> +	 * written into it). The device seems to always accept pwm values - even
> +	 * when there is no fan connected - so update pwm status without waiting
> +	 * for a report, to make pwmconfig and fancontrol happy. Worst case -
> +	 * if the device didn't accept new pwm value for some reason (never seen
> +	 * this in practice) - it will be reported incorrectly only until next
> +	 * update. This avoids "fan stuck" messages from pwmconfig, and
> +	 * fancontrol setting fan speed to 100% during shutdown.
> +	 */
> +	spin_lock_bh(&drvdata->wq.lock);
> +	drvdata->fan_duty_percent[channel] = duty_percent;
> +	spin_unlock_bh(&drvdata->wq.lock);
> +
> +unlock:
> +	mutex_unlock(&drvdata->mutex);
> +	return ret;
> +}
> +
> +/*
> + * Workaround for fancontrol/pwmconfig trying to write to pwm*_enable even if it
> + * already is 1 and read-only. Otherwise, fancontrol won't restore pwm on
> + * shutdown properly.
> + */
> +static int set_pwm_enable(struct drvdata *drvdata, int channel, long val)
> +{
> +	long expected_val;
> +	int res;
> +
> +	spin_lock_irq(&drvdata->wq.lock);
> +
> +	res = wait_event_interruptible_locked_irq(drvdata->wq,
> +						  drvdata->fan_config_received);
> +	if (res) {
> +		spin_unlock_irq(&drvdata->wq.lock);
> +		return res;
> +	}
> +
> +	expected_val = drvdata->fan_type[channel] != FAN_TYPE_NONE;
> +
> +	spin_unlock_irq(&drvdata->wq.lock);
> +
> +	return (val == expected_val) ? 0 : -EOPNOTSUPP;
> +}
> +
> +/*
> + * Control byte	| Actual update interval in seconds
> + * 0xff		| 65.5
> + * 0xf7		| 63.46
> + * 0x7f		| 32.74
> + * 0x3f		| 16.36
> + * 0x1f		| 8.17
> + * 0x0f		| 4.07
> + * 0x07		| 2.02
> + * 0x03		| 1.00
> + * 0x02		| 0.744
> + * 0x01		| 0.488
> + * 0x00		| 0.25
> + */
> +static u8 update_interval_to_control_byte(long interval)
> +{
> +	if (interval <= 250)
> +		return 0;
> +
> +	return clamp_val(1 + DIV_ROUND_CLOSEST(interval - 488, 256), 0, 255);
> +}
> +
> +static long control_byte_to_update_interval(u8 control_byte)
> +{
> +	if (control_byte == 0)
> +		return 250;
> +
> +	return 488 + (control_byte - 1) * 256;
> +}
> +
> +static int set_update_interval(struct drvdata *drvdata, long val)
> +{
> +	u8 control = update_interval_to_control_byte(val);
> +	u8 report[] = {
> +		OUTPUT_REPORT_ID_INIT_COMMAND,
> +		INIT_COMMAND_SET_UPDATE_INTERVAL,
> +		0x01,
> +		0xe8,
> +		control,
> +		0x01,
> +		0xe8,
> +		control,
> +	};
> +	int ret;
> +
> +	ret = send_output_report(drvdata, report, sizeof(report));
> +	if (ret)
> +		return ret;
> +
> +	drvdata->update_interval = control_byte_to_update_interval(control);
> +	return 0;
> +}
> +
> +static int init_device(struct drvdata *drvdata, long update_interval)
> +{
> +	int ret;
> +	u8 detect_fans_report[] = {
> +		OUTPUT_REPORT_ID_INIT_COMMAND,
> +		INIT_COMMAND_DETECT_FANS,
> +	};
> +
> +	ret = send_output_report(drvdata, detect_fans_report,
> +				 sizeof(detect_fans_report));
> +	if (ret)
> +		return ret;
> +
> +	return set_update_interval(drvdata, update_interval);
> +}
> +
> +static int nzxt_smart2_hwmon_write(struct device *dev,
> +				   enum hwmon_sensor_types type, u32 attr,
> +				   int channel, long val)
> +{
> +	struct drvdata *drvdata = dev_get_drvdata(dev);
> +	int ret;
> +
> +	switch (type) {
> +	case hwmon_pwm:
> +		switch (attr) {
> +		case hwmon_pwm_enable:
> +			return set_pwm_enable(drvdata, channel, val);
> +
> +		case hwmon_pwm_input:
> +			return set_pwm(drvdata, channel, val);
> +
> +		default:
> +			return -EINVAL;
> +		}
> +
> +	case hwmon_chip:
> +		switch (attr) {
> +		case hwmon_chip_update_interval:
> +			ret = mutex_lock_interruptible(&drvdata->mutex);
> +			if (ret)
> +				return ret;
> +
> +			ret = set_update_interval(drvdata, val);
> +
> +			mutex_unlock(&drvdata->mutex);
> +			return ret;
> +
> +		default:
> +			return -EINVAL;
> +		}
> +
> +	default:
> +		return -EINVAL;
> +	}
> +}
> +
> +static int nzxt_smart2_hwmon_read_string(struct device *dev,
> +					 enum hwmon_sensor_types type, u32 attr,
> +					 int channel, const char **str)
> +{
> +	switch (type) {
> +	case hwmon_fan:
> +		*str = fan_label[channel];
> +		return 0;
> +	case hwmon_curr:
> +		*str = curr_label[channel];
> +		return 0;
> +	case hwmon_in:
> +		*str = in_label[channel];
> +		return 0;
> +	default:
> +		return -EINVAL;
> +	}
> +}
> +
> +static const struct hwmon_ops nzxt_smart2_hwmon_ops = {
> +	.is_visible = nzxt_smart2_hwmon_is_visible,
> +	.read = nzxt_smart2_hwmon_read,
> +	.read_string = nzxt_smart2_hwmon_read_string,
> +	.write = nzxt_smart2_hwmon_write,
> +};
> +
> +static const struct hwmon_channel_info *nzxt_smart2_channel_info[] = {
> +	HWMON_CHANNEL_INFO(fan, HWMON_F_INPUT | HWMON_F_LABEL,
> +			   HWMON_F_INPUT | HWMON_F_LABEL,
> +			   HWMON_F_INPUT | HWMON_F_LABEL),
> +	HWMON_CHANNEL_INFO(pwm, HWMON_PWM_INPUT | HWMON_PWM_MODE | HWMON_PWM_ENABLE,
> +			   HWMON_PWM_INPUT | HWMON_PWM_MODE | HWMON_PWM_ENABLE,
> +			   HWMON_PWM_INPUT | HWMON_PWM_MODE | HWMON_PWM_ENABLE),
> +	HWMON_CHANNEL_INFO(in, HWMON_I_INPUT | HWMON_I_LABEL,
> +			   HWMON_I_INPUT | HWMON_I_LABEL,
> +			   HWMON_I_INPUT | HWMON_I_LABEL),
> +	HWMON_CHANNEL_INFO(curr, HWMON_C_INPUT | HWMON_C_LABEL,
> +			   HWMON_C_INPUT | HWMON_C_LABEL,
> +			   HWMON_C_INPUT | HWMON_C_LABEL),
> +	HWMON_CHANNEL_INFO(chip, HWMON_C_UPDATE_INTERVAL),
> +	NULL
> +};
> +
> +static const struct hwmon_chip_info nzxt_smart2_chip_info = {
> +	.ops = &nzxt_smart2_hwmon_ops,
> +	.info = nzxt_smart2_channel_info,
> +};
> +
> +static int nzxt_smart2_hid_raw_event(struct hid_device *hdev,
> +				     struct hid_report *report, u8 *data, int size)
> +{
> +	struct drvdata *drvdata = hid_get_drvdata(hdev);
> +	u8 report_id = *data;
> +
> +	switch (report_id) {
> +	case INPUT_REPORT_ID_FAN_CONFIG:
> +		handle_fan_config_report(drvdata, data, size);
> +		break;
> +
> +	case INPUT_REPORT_ID_FAN_STATUS:
> +		handle_fan_status_report(drvdata, data, size);
> +		break;
> +	}
> +
> +	return 0;
> +}
> +
> +static int nzxt_smart2_hid_reset_resume(struct hid_device *hdev)
> +{
> +	struct drvdata *drvdata = hid_get_drvdata(hdev);
> +
> +	/*
> +	 * Userspace is still frozen (so no concurrent sysfs attribute access
> +	 * is possible), but raw_event can already be called concurrently.
> +	 */
> +	spin_lock_bh(&drvdata->wq.lock);
> +	drvdata->fan_config_received = false;
> +	drvdata->pwm_status_received = false;
> +	drvdata->voltage_status_received = false;
> +	spin_unlock_bh(&drvdata->wq.lock);
> +
> +	return init_device(drvdata, drvdata->update_interval);
> +}
> +
> +static int nzxt_smart2_hid_probe(struct hid_device *hdev,
> +				 const struct hid_device_id *id)
> +{
> +	struct drvdata *drvdata;
> +	int ret;
> +
> +	drvdata = devm_kzalloc(&hdev->dev, sizeof(struct drvdata), GFP_KERNEL);
> +	if (!drvdata)
> +		return -ENOMEM;
> +
> +	drvdata->hid = hdev;
> +	hid_set_drvdata(hdev, drvdata);
> +
> +	init_waitqueue_head(&drvdata->wq);
> +
> +	mutex_init(&drvdata->mutex);
> +	devm_add_action(&hdev->dev, (void (*)(void *))mutex_destroy,
> +			&drvdata->mutex);
> +
> +	ret = hid_parse(hdev);
> +	if (ret)
> +		return ret;
> +
> +	ret = hid_hw_start(hdev, HID_CONNECT_HIDRAW);
> +	if (ret)
> +		return ret;
> +
> +	ret = hid_hw_open(hdev);
> +	if (ret)
> +		goto out_hw_stop;
> +
> +	hid_device_io_start(hdev);
> +
> +	init_device(drvdata, UPDATE_INTERVAL_DEFAULT_MS);
> +
> +	drvdata->hwmon =
> +		hwmon_device_register_with_info(&hdev->dev, "nzxtsmart2", drvdata,
> +						&nzxt_smart2_chip_info, NULL);
> +	if (IS_ERR(drvdata->hwmon)) {
> +		ret = PTR_ERR(drvdata->hwmon);
> +		goto out_hw_close;
> +	}
> +
> +	return 0;
> +
> +out_hw_close:
> +	hid_hw_close(hdev);
> +
> +out_hw_stop:
> +	hid_hw_stop(hdev);
> +	return ret;
> +}
> +
> +static void nzxt_smart2_hid_remove(struct hid_device *hdev)
> +{
> +	struct drvdata *drvdata = hid_get_drvdata(hdev);
> +
> +	hwmon_device_unregister(drvdata->hwmon);
> +
> +	hid_hw_close(hdev);
> +	hid_hw_stop(hdev);
> +}
> +
> +static const struct hid_device_id nzxt_smart2_hid_id_table[] = {
> +	{ HID_USB_DEVICE(0x1e71, 0x2006) }, /* NZXT Smart Device V2 */
> +	{ HID_USB_DEVICE(0x1e71, 0x200d) }, /* NZXT Smart Device V2 */
> +	{ HID_USB_DEVICE(0x1e71, 0x2009) }, /* NZXT RGB & Fan Controller */
> +	{ HID_USB_DEVICE(0x1e71, 0x200e) }, /* NZXT RGB & Fan Controller */
> +	{ HID_USB_DEVICE(0x1e71, 0x2010) }, /* NZXT RGB & Fan Controller */
> +	{},
> +};
> +
> +static struct hid_driver nzxt_smart2_hid_driver = {
> +	.name = "nzxt-smart2",
> +	.id_table = nzxt_smart2_hid_id_table,
> +	.probe = nzxt_smart2_hid_probe,
> +	.remove = nzxt_smart2_hid_remove,
> +	.raw_event = nzxt_smart2_hid_raw_event,
> +#ifdef CONFIG_PM
> +	.reset_resume = nzxt_smart2_hid_reset_resume,
> +#endif
> +};
> +
> +static int __init nzxt_smart2_init(void)
> +{
> +	return hid_register_driver(&nzxt_smart2_hid_driver);
> +}
> +
> +static void __exit nzxt_smart2_exit(void)
> +{
> +	hid_unregister_driver(&nzxt_smart2_hid_driver);
> +}
> +
> +MODULE_DEVICE_TABLE(hid, nzxt_smart2_hid_id_table);
> +MODULE_AUTHOR("Aleksandr Mezin <mezin.alexander@gmail.com>");
> +MODULE_DESCRIPTION("Driver for NZXT RGB & Fan Controller/Smart Device V2");
> +MODULE_LICENSE("GPL");
> +
> +/*
> + * With module_init()/module_hid_driver() and the driver built into the kernel:
> + *
> + * Driver 'nzxt_smart2' was unable to register with bus_type 'hid' because the
> + * bus was not initialized.
> + */
> +late_initcall(nzxt_smart2_init);
> +module_exit(nzxt_smart2_exit);
