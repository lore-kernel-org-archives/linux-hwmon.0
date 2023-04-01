Return-Path: <linux-hwmon-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9FBADC76196
	for <linux-hwmon@archiver.kernel.org>; Sat,  1 Apr 2023 14:54:45 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229674AbjDAOyo (ORCPT <rfc822;linux-hwmon@archiver.kernel.org>);
        Sat, 1 Apr 2023 10:54:44 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:34948 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229603AbjDAOyo (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>); Sat, 1 Apr 2023 10:54:44 -0400
Received: from mail-oo1-xc2c.google.com (mail-oo1-xc2c.google.com [IPv6:2607:f8b0:4864:20::c2c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id F0F57EC75
        for <linux-hwmon@vger.kernel.org>; Sat,  1 Apr 2023 07:54:41 -0700 (PDT)
Received: by mail-oo1-xc2c.google.com with SMTP id f7-20020a4ab647000000b0054101f316c7so540707ooo.13
        for <linux-hwmon@vger.kernel.org>; Sat, 01 Apr 2023 07:54:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112; t=1680360881;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:sender:from:to:cc:subject:date:message-id
         :reply-to;
        bh=jhtghNE4KaX4Ja8zSFkioOVPqZ9BUgicINvShREV5wQ=;
        b=RPJPbX9/nmKDfs32Y4YvLrmhSQ+zi0GTHHntiS5U6P3Usbp6YGQrfkRzWNtX5e5Dy0
         hY6RFUZXBmlBGGCS6nkCMR4jEhAQwRgkLMqOijo+QxsfAV+g3WTbx2l/TC5xbxFq+C3u
         HGu+UcN8anCMiyYxLW4Ts8PF9fNUyYBgn0jA51otIOI6Ia81RTCFY5XSSm25QN3cnR2z
         vPogR0XZ9GpVbuL9vvmSVrsfWsizQS3V3050VrZhqmastQwQevcSo40EnTJgYJFt0rDK
         toAvkNDZJIHpmd/hII/UM3AMIMcxJHKqbeup8B+FKeHLxy3iNfdwqe2nialSaPclRvJh
         HWGw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1680360881;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:sender:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=jhtghNE4KaX4Ja8zSFkioOVPqZ9BUgicINvShREV5wQ=;
        b=AJ7BuV+N5WPQg0qoI6c6wXzBIbnxXP7rFtIXUZEI4xjw6+CAeenpKUmHGRbyqlBGVX
         +vd2tjxcOo3vup08WYIvUgQo5rerxdVZWBe0vuCjR9YHi9tIGK38L7nwXZ5J40f9oBAQ
         dOFJ6oMcrTTu0J6zas20pXfTEKNJQP/3HRx2y+GIVp6d8JUby7DBeSjJhtAMUwx2oIsM
         wuXoaK/jSD5HZfK1GALGcvWJVWS1a1eGiAfVJxhOJ+q8IMlgRzBdkBxQxLyF6JFrBKBJ
         TMy+v3iKz2fI4js3PSF2i/N0uisHGPVZvTWn9Mped7ePYObpovx8UIaFcMXcppig1q/X
         rL2Q==
X-Gm-Message-State: AAQBX9fCxhBp/4fTvfyaYNL1AUXz/sCl/vCPciL/wlZBJW5kdu5g54Yl
        9LuSx6z35CpKU2hlMPofJutwXJOVgH0=
X-Google-Smtp-Source: AKy350ZW0Z3cfaaVPhztMS7cI0cldPsSdH7CbYS/ZaRManoDBvftge6oLlkywmP3/HgZxNk0DbI90g==
X-Received: by 2002:a4a:2c08:0:b0:525:5f43:215b with SMTP id o8-20020a4a2c08000000b005255f43215bmr6750176ooo.3.1680360881138;
        Sat, 01 Apr 2023 07:54:41 -0700 (PDT)
Received: from server.roeck-us.net ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
        by smtp.gmail.com with ESMTPSA id p1-20020a05680811c100b003874631e249sm2059406oiv.36.2023.04.01.07.54.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 01 Apr 2023 07:54:40 -0700 (PDT)
Sender: Guenter Roeck <groeck7@gmail.com>
Date:   Sat, 1 Apr 2023 07:54:38 -0700
From:   Guenter Roeck <linux@roeck-us.net>
To:     Il Han <corone.il.han@gmail.com>
Cc:     Jean Delvare <jdelvare@suse.com>, linux-hwmon@vger.kernel.org
Subject: Re: [PATCH] hwmon: Driver for Sensylink CTF2304
Message-ID: <0b3a3380-35fe-4c92-ad4c-1d74ec8c2ed5@roeck-us.net>
References: <20230331133437.3329487-1-corone.il.han@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230331133437.3329487-1-corone.il.han@gmail.com>
Precedence: bulk
List-ID: <linux-hwmon.vger.kernel.org>
X-Mailing-List: linux-hwmon@vger.kernel.org

On Fri, Mar 31, 2023 at 10:34:37PM +0900, Il Han wrote:
> The driver supports the Sensylink CTF2304.
> 

Please version your patches, and provide change logs. I am not inclined
to compare this version with the previous version to find out what changed
besides the API conversion, and I am not inclined to dig through my e-mail
history to figure out how many versions of this patch have been submitted.

Please consult
Documentation/process/submitting-patches.rst
Documentation/process/submit-checklist.rst
Documentation/hwmon/submitting-patches.rst

and follow the guidance in those documents.

Thanks,
Guenter

> Signed-off-by: Il Han <corone.il.han@gmail.com>
> ---
>  Documentation/hwmon/ctf2304.rst |  41 +++
>  Documentation/hwmon/index.rst   |   1 +
>  drivers/hwmon/Kconfig           |  10 +
>  drivers/hwmon/Makefile          |   1 +
>  drivers/hwmon/ctf2304.c         | 522 ++++++++++++++++++++++++++++++++
>  5 files changed, 575 insertions(+)
>  create mode 100644 Documentation/hwmon/ctf2304.rst
>  create mode 100644 drivers/hwmon/ctf2304.c
> 
> diff --git a/Documentation/hwmon/ctf2304.rst b/Documentation/hwmon/ctf2304.rst
> new file mode 100644
> index 000000000000..e1584524d612
> --- /dev/null
> +++ b/Documentation/hwmon/ctf2304.rst
> @@ -0,0 +1,41 @@
> +.. SPDX-License-Identifier: GPL-2.0-or-later
> +
> +Kernel driver ctf2304
> +=====================
> +
> +Supported chips:
> +
> +  * Sensylink CTF2304
> +
> +    Prefix: 'ctf2304'
> +
> +    Addresses scanned: -
> +
> +    Datasheet:
> +
> +Author: Il Han <corone.il.han@gmail.com>
> +
> +
> +Description
> +-----------
> +
> +This driver implements support for the Sensylink CTF2304 chip.
> +
> +The CTF2304 controls the speeds of up to four fans using four independent
> +PWM outputs with local and remote temperature and remote voltage sensing.
> +
> +
> +Sysfs entries
> +-------------
> +
> +================== === =======================================================
> +fan[1-4]_input     RO  fan tachometer speed in RPM
> +fan[1-4]_target    RW  desired fan speed in RPM
> +fan[1-4]_div       RW  sets the RPM range of the fan
> +pwm[1-4]_enable    RW  regulator mode,
> +                       0=auto temperature mode, 1=manual mode, 2=rpm mode
> +pwm[1-4]           RW  read: current pwm duty cycle,
> +                       write: target pwm duty cycle (0-255)
> +in[0-7]_input      RO  measured output voltage
> +temp[1-9]_input    RO  measured temperature
> +================== === =======================================================
> diff --git a/Documentation/hwmon/index.rst b/Documentation/hwmon/index.rst
> index f1fe75f596a5..a74cd43a3916 100644
> --- a/Documentation/hwmon/index.rst
> +++ b/Documentation/hwmon/index.rst
> @@ -54,6 +54,7 @@ Hardware Monitoring Kernel Drivers
>     coretemp
>     corsair-cpro
>     corsair-psu
> +   ctf2304
>     da9052
>     da9055
>     dell-smm-hwmon
> diff --git a/drivers/hwmon/Kconfig b/drivers/hwmon/Kconfig
> index 5b3b76477b0e..da9fbb0f8af3 100644
> --- a/drivers/hwmon/Kconfig
> +++ b/drivers/hwmon/Kconfig
> @@ -474,6 +474,16 @@ config SENSORS_CORSAIR_PSU
>  	  This driver can also be built as a module. If so, the module
>  	  will be called corsair-psu.
>  
> +config SENSORS_CTF2304
> +	tristate "Sensylink CTF2304 sensor chip"
> +	depends on I2C
> +	help
> +	  If you say yes here you get support for PWM and Fan Controller
> +	  with temperature and voltage sensing.
> +
> +	  This driver can also be built as a module. If so, the module
> +	  will be called ctf2304.
> +
>  config SENSORS_DRIVETEMP
>  	tristate "Hard disk drives with temperature sensors"
>  	depends on SCSI && ATA
> diff --git a/drivers/hwmon/Makefile b/drivers/hwmon/Makefile
> index 88712b5031c8..3742b52f032d 100644
> --- a/drivers/hwmon/Makefile
> +++ b/drivers/hwmon/Makefile
> @@ -60,6 +60,7 @@ obj-$(CONFIG_SENSORS_BT1_PVT)	+= bt1-pvt.o
>  obj-$(CONFIG_SENSORS_CORETEMP)	+= coretemp.o
>  obj-$(CONFIG_SENSORS_CORSAIR_CPRO) += corsair-cpro.o
>  obj-$(CONFIG_SENSORS_CORSAIR_PSU) += corsair-psu.o
> +obj-$(CONFIG_SENSORS_CTF2304)	+= ctf2304.o
>  obj-$(CONFIG_SENSORS_DA9052_ADC)+= da9052-hwmon.o
>  obj-$(CONFIG_SENSORS_DA9055)+= da9055-hwmon.o
>  obj-$(CONFIG_SENSORS_DELL_SMM)	+= dell-smm-hwmon.o
> diff --git a/drivers/hwmon/ctf2304.c b/drivers/hwmon/ctf2304.c
> new file mode 100644
> index 000000000000..102c41957219
> --- /dev/null
> +++ b/drivers/hwmon/ctf2304.c
> @@ -0,0 +1,522 @@
> +// SPDX-License-Identifier: GPL-2.0-or-later
> +/*
> + * ctf2304.c - Part of lm_sensors, Linux kernel modules for hardware
> + *             monitoring.
> + *
> + * (C) 2023 by Il Han <corone.il.han@gmail.com>
> + */
> +
> +#include <linux/err.h>
> +#include <linux/hwmon.h>
> +#include <linux/i2c.h>
> +#include <linux/init.h>
> +#include <linux/jiffies.h>
> +#include <linux/module.h>
> +#include <linux/slab.h>
> +
> +/* CTF2304 registers */
> +#define CTF2304_REG_LOCAL_TEMP		0x00
> +#define CTF2304_REG_REMOTE_CHANNEL(ch)	(0x01 + (ch))
> +#define CTF2304_REG_TACH_COUNT(ch)	(0x09 + (ch))
> +#define CTF2304_REG_FAN_CONFIG1		0x10
> +#define CTF2304_REG_FAN_CONFIG2		0x11
> +#define CTF2304_REG_FAN_RPM_CTRL	0x18
> +#define CTF2304_REG_PWMOUT(ch)		(0x40 + (ch))
> +#define CTF2304_REG_TARGET_COUNT(ch)	(0x44 + (ch))
> +
> +/* Fan Configure1 register bits */
> +#define CTF2304_FAN_CFG1_TRANGE		0x0400
> +#define CTF2304_FAN_CFG1_MODE_MASK	(0x7)
> +#define CTF2304_FAN_CFG1_MODE_SHIFT	7
> +
> +/* Fan Configure2 register bits */
> +#define CTF2304_FAN_CFG2_MODE_MASK(ch)	(0x6 << (ch) * 4)
> +#define CTF2304_FAN_CFG2_MODE_SHIFT(ch)	(1 + (ch) * 4)
> +#define CTF2304_FAN_CFG2_DCY_MODE	0
> +#define CTF2304_FAN_CFG2_RPM_MODE	1
> +#define CTF2304_FAN_CFG2_TEMP_MODE	2
> +#define CTF2304_FAN_CFG2_MAX_MODE	3
> +
> +/* Fan RPM CTRL register bits */
> +#define CTF2304_FAN_DIV_MASK(ch)	(0x6 << (ch) * 4)
> +#define CTF2304_FAN_DIV_SHIFT(ch)	(1 + (ch) * 4)
> +
> +#define CTF2304_VCC			3300
> +
> +#define FAN_RPM_MIN			480
> +#define FAN_RPM_MAX			1966080
> +
> +#define FAN_COUNT_REG_MAX		0xFFF0
> +
> +#define TEMP_FROM_REG(reg, tr)		((tr) ? \
> +					 (((((reg) & 0x7FF0) * 1000) >> 8) \
> +					  + ((reg) >> 15) ? -64000 : 0) : \
> +					 (((reg) * 1000) >> 8))
> +#define VOLT_FROM_REG(reg, fs)		((((reg) >> 4) * (fs)) >> 12)
> +#define DIV_FROM_REG(reg)		(1 << (reg))
> +#define DIV_TO_REG(div)			((div == 8) ? 0x3 : \
> +					 (div == 4) ? 0x2 : \
> +					 (div == 1) ? 0x0 : 0x1)
> +#define RPM_FROM_REG(reg)		(((reg) >> 4) ? \
> +					 ((32768 * 60) / ((reg) >> 4)) : \
> +					 FAN_RPM_MAX)
> +#define RPM_TO_REG(rpm)			((rpm) ? \
> +					 ((32768 * 60) / (rpm)) : \
> +					 FAN_COUNT_REG_MAX)
> +
> +#define NR_CHANNEL			8
> +#define NR_FAN_CHANNEL			4
> +
> +/*
> + * Client data (each client gets its own)
> + */
> +struct ctf2304_data {
> +	struct i2c_client *client;
> +	struct mutex update_lock;
> +	char valid; /* zero until following fields are valid */
> +	unsigned long last_updated; /* in jiffies */
> +
> +	/* register values */
> +	u16 local_temp;
> +	u16 remote_channel[NR_CHANNEL];
> +	u16 tach[NR_FAN_CHANNEL];
> +	u16 fan_config1;
> +	u16 fan_config2;
> +	u16 fan_rpm_ctrl;
> +	u16 pwm[NR_FAN_CHANNEL];
> +	u16 target_count[NR_FAN_CHANNEL];
> +};
> +
> +static struct ctf2304_data *ctf2304_update_device(struct device *dev)
> +{
> +	struct ctf2304_data *data = dev_get_drvdata(dev);
> +	struct i2c_client *client = data->client;
> +	struct ctf2304_data *ret = data;
> +	int i;
> +	int rv;
> +
> +	mutex_lock(&data->update_lock);
> +
> +	if (time_after(jiffies, data->last_updated + HZ) || !data->valid) {
> +		rv = i2c_smbus_read_word_swapped(client,
> +				CTF2304_REG_LOCAL_TEMP);
> +		if (rv < 0)
> +			goto abort;
> +		data->local_temp = rv;
> +
> +		for (i = 0; i < NR_CHANNEL; i++) {
> +			rv = i2c_smbus_read_word_swapped(client,
> +					CTF2304_REG_REMOTE_CHANNEL(i));
> +			if (rv < 0)
> +				goto abort;
> +			data->remote_channel[i] = rv;
> +		}
> +
> +		rv = i2c_smbus_read_word_swapped(client,
> +				CTF2304_REG_FAN_CONFIG1);
> +		if (rv < 0)
> +			goto abort;
> +		data->fan_config1 = rv;
> +		rv = i2c_smbus_read_word_swapped(client,
> +				CTF2304_REG_FAN_CONFIG2);
> +		if (rv < 0)
> +			goto abort;
> +		data->fan_config2 = rv;
> +		rv = i2c_smbus_read_word_swapped(client,
> +				CTF2304_REG_FAN_RPM_CTRL);
> +		if (rv < 0)
> +			goto abort;
> +		data->fan_rpm_ctrl = rv;
> +
> +		for (i = 0; i < NR_FAN_CHANNEL; i++) {
> +			rv = i2c_smbus_read_word_swapped(client,
> +					CTF2304_REG_TACH_COUNT(i));
> +			if (rv < 0)
> +				goto abort;
> +			data->tach[i] = rv;
> +			rv = i2c_smbus_read_word_swapped(client,
> +					CTF2304_REG_PWMOUT(i));
> +			if (rv < 0)
> +				goto abort;
> +			data->pwm[i] = rv;
> +			rv = i2c_smbus_read_word_swapped(client,
> +					CTF2304_REG_TARGET_COUNT(i));
> +			if (rv < 0)
> +				goto abort;
> +			data->target_count[i] = rv;
> +		}
> +
> +		data->last_updated = jiffies;
> +		data->valid = true;
> +	}
> +	goto done;
> +
> +abort:
> +	data->valid = false;
> +	ret = ERR_PTR(rv);
> +
> +done:
> +	mutex_unlock(&data->update_lock);
> +
> +	return data;
> +}
> +
> +static int ctf2304_read_temp(struct device *dev, u32 attr, int channel,
> +			     long *val)
> +{
> +	struct ctf2304_data *data = ctf2304_update_device(dev);
> +	u16 reg;
> +
> +	switch (attr) {
> +	case hwmon_temp_input:
> +		if (channel == 0)
> +			reg = data->local_temp;
> +		else
> +			reg = data->remote_channel[channel-1];
> +		*val = TEMP_FROM_REG(reg, (data->fan_config1
> +					   & CTF2304_FAN_CFG1_TRANGE));
> +		return 0;
> +	default:
> +		return -EOPNOTSUPP;
> +	}
> +}
> +
> +static int get_full_scale(u16 config)
> +{
> +	int full_scale;
> +	u8 bits;
> +
> +	bits = (config >> CTF2304_FAN_CFG1_MODE_SHIFT)
> +	       & CTF2304_FAN_CFG1_MODE_MASK;
> +
> +	if (bits == 0x0)
> +		full_scale = 2560;
> +	else if (bits == 0x1)
> +		full_scale = CTF2304_VCC;
> +	else if (bits == 0x2)
> +		full_scale = 4096;
> +	else if (bits == 0x3)
> +		full_scale = 2048;
> +	else if (bits == 0x4)
> +		full_scale = 1024;
> +	else if (bits == 0x5)
> +		full_scale = 512;
> +	else
> +		full_scale = 256;
> +
> +	return full_scale;
> +}
> +
> +static int ctf2304_read_in(struct device *dev, u32 attr, int channel,
> +			   long *val)
> +{
> +	struct ctf2304_data *data = ctf2304_update_device(dev);
> +
> +	switch (attr) {
> +	case hwmon_temp_input:
> +		*val = VOLT_FROM_REG(data->remote_channel[channel],
> +				     get_full_scale(data->fan_config1));
> +		return 0;
> +	default:
> +		return -EOPNOTSUPP;
> +	}
> +}
> +
> +static int ctf2304_read_fan(struct device *dev, u32 attr, int channel,
> +			    long *val)
> +{
> +	struct ctf2304_data *data = ctf2304_update_device(dev);
> +	u8 bits;
> +
> +	if (IS_ERR(data))
> +		return PTR_ERR(data);
> +
> +	switch (attr) {
> +	case hwmon_fan_input:
> +		if (data->tach[channel] == FAN_COUNT_REG_MAX)
> +			*val = 0;
> +		else
> +			*val = RPM_FROM_REG(data->tach[channel]);
> +		return 0;
> +	case hwmon_fan_target:
> +		*val = RPM_FROM_REG(data->target_count[channel]);
> +		return 0;
> +	case hwmon_fan_div:
> +		bits = (data->fan_rpm_ctrl & CTF2304_FAN_DIV_MASK(channel))
> +		       >> CTF2304_FAN_DIV_SHIFT(channel);
> +		*val = DIV_FROM_REG(bits);
> +		return 0;
> +	default:
> +		return -EOPNOTSUPP;
> +	}
> +}
> +
> +static int ctf2304_write_fan(struct device *dev, u32 attr, int channel,
> +			     long val)
> +{
> +	struct ctf2304_data *data = dev_get_drvdata(dev);
> +	struct i2c_client *client = data->client;
> +	int target_count;
> +	int err = 0;
> +
> +	mutex_lock(&data->update_lock);
> +
> +	switch (attr) {
> +	case hwmon_fan_target:
> +		val = clamp_val(val, FAN_RPM_MIN, FAN_RPM_MAX);
> +		target_count = RPM_TO_REG(val);
> +		target_count = clamp_val(target_count, 0x1, 0xFFF);
> +		data->target_count[channel] = target_count << 4;
> +		err = i2c_smbus_write_word_swapped(client,
> +				CTF2304_REG_TARGET_COUNT(channel),
> +				data->target_count[channel]);
> +		break;
> +	case hwmon_fan_div:
> +		data->fan_rpm_ctrl = (data->fan_rpm_ctrl
> +				      & ~CTF2304_FAN_DIV_MASK(channel))
> +				     | (DIV_TO_REG(val)
> +					<< CTF2304_FAN_DIV_SHIFT(channel));
> +		err = i2c_smbus_write_word_swapped(client,
> +				CTF2304_REG_FAN_RPM_CTRL,
> +				data->fan_rpm_ctrl);
> +		break;
> +	default:
> +		err = -EOPNOTSUPP;
> +		break;
> +	}
> +
> +	mutex_unlock(&data->update_lock);
> +
> +	return err;
> +}
> +
> +static int ctf2304_read_pwm(struct device *dev, u32 attr, int channel,
> +			    long *val)
> +{
> +	struct ctf2304_data *data = ctf2304_update_device(dev);
> +	u8 bits;
> +
> +	if (IS_ERR(data))
> +		return PTR_ERR(data);
> +
> +	switch (attr) {
> +	case hwmon_pwm_input:
> +		*val = data->pwm[channel] >> 8;
> +		return 0;
> +	case hwmon_pwm_enable:
> +		bits = (data->fan_config2
> +			& CTF2304_FAN_CFG2_MODE_MASK(channel))
> +		       >> CTF2304_FAN_CFG2_MODE_SHIFT(channel);
> +		if (bits == CTF2304_FAN_CFG2_RPM_MODE)
> +			*val = 2;
> +		else if (bits == CTF2304_FAN_CFG2_DCY_MODE)
> +			*val = 1;
> +		else
> +			*val = 0;
> +		return 0;
> +	default:
> +		return -EOPNOTSUPP;
> +	}
> +}
> +
> +static int ctf2304_write_pwm(struct device *dev, u32 attr, int channel,
> +			     long val)
> +{
> +	struct ctf2304_data *data = dev_get_drvdata(dev);
> +	struct i2c_client *client = data->client;
> +	int err = 0;
> +
> +	mutex_lock(&data->update_lock);
> +
> +	switch (attr) {
> +	case hwmon_pwm_input:
> +		if (val < 0 || val > 255) {
> +			err = -EINVAL;
> +			break;
> +		}
> +		data->pwm[channel] = (data->pwm[channel] & 0xFF) | (val << 8);
> +		err = i2c_smbus_write_word_swapped(client,
> +						   CTF2304_REG_PWMOUT(channel),
> +						   data->pwm[channel]);
> +		break;
> +	case hwmon_pwm_enable:
> +		if (val == 0) {
> +			data->fan_config2 = (data->fan_config2
> +					     & ~CTF2304_FAN_CFG2_MODE_MASK(channel))
> +					    | (CTF2304_FAN_CFG2_TEMP_MODE
> +					       << CTF2304_FAN_CFG2_MODE_SHIFT(channel));
> +		} else if (val == 1) {
> +			data->fan_config2 = (data->fan_config2
> +					     & ~CTF2304_FAN_CFG2_MODE_MASK(channel))
> +					    | (CTF2304_FAN_CFG2_DCY_MODE
> +					       << CTF2304_FAN_CFG2_MODE_SHIFT(channel));
> +		} else if (val == 2) {
> +			data->fan_config2 = (data->fan_config2
> +					     & ~CTF2304_FAN_CFG2_MODE_MASK(channel))
> +					    | (CTF2304_FAN_CFG2_RPM_MODE
> +					       << CTF2304_FAN_CFG2_MODE_SHIFT(channel));
> +		} else {
> +			err = -EINVAL;
> +			break;
> +		}
> +		err = i2c_smbus_write_word_swapped(client,
> +						   CTF2304_REG_FAN_CONFIG2,
> +						   data->fan_config2);
> +		break;
> +	default:
> +		err = -EOPNOTSUPP;
> +		break;
> +	}
> +
> +	mutex_unlock(&data->update_lock);
> +
> +	return err;
> +}
> +
> +static int ctf2304_read(struct device *dev, enum hwmon_sensor_types type,
> +			u32 attr, int channel, long *val)
> +{
> +	switch (type) {
> +	case hwmon_temp:
> +		return ctf2304_read_temp(dev, attr, channel, val);
> +	case hwmon_in:
> +		return ctf2304_read_in(dev, attr, channel, val);
> +	case hwmon_fan:
> +		return ctf2304_read_fan(dev, attr, channel, val);
> +	case hwmon_pwm:
> +		return ctf2304_read_pwm(dev, attr, channel, val);
> +	default:
> +		return -EOPNOTSUPP;
> +	}
> +}
> +
> +static int ctf2304_write(struct device *dev, enum hwmon_sensor_types type,
> +			 u32 attr, int channel, long val)
> +{
> +	switch (type) {
> +	case hwmon_fan:
> +		return ctf2304_write_fan(dev, attr, channel, val);
> +	case hwmon_pwm:
> +		return ctf2304_write_pwm(dev, attr, channel, val);
> +	default:
> +		return -EOPNOTSUPP;
> +	}
> +}
> +
> +static umode_t ctf2304_is_visible(const void *data,
> +				  enum hwmon_sensor_types type,
> +				  u32 attr, int channel)
> +{
> +	switch (type) {
> +	case hwmon_temp:
> +	case hwmon_in:
> +		return 0444;
> +	case hwmon_fan:
> +		switch (attr) {
> +		case hwmon_fan_input:
> +			return 0444;
> +		case hwmon_fan_target:
> +		case hwmon_fan_div:
> +			return 0644;
> +		default:
> +			break;
> +		}
> +		break;
> +	case hwmon_pwm:
> +		return 0644;
> +	default:
> +		break;
> +	}
> +
> +	return 0;
> +}
> +
> +static const struct hwmon_channel_info *ctf2304_info[] = {
> +	HWMON_CHANNEL_INFO(temp,
> +			   HWMON_T_INPUT,
> +			   HWMON_T_INPUT,
> +			   HWMON_T_INPUT,
> +			   HWMON_T_INPUT,
> +			   HWMON_T_INPUT,
> +			   HWMON_T_INPUT,
> +			   HWMON_T_INPUT,
> +			   HWMON_T_INPUT,
> +			   HWMON_T_INPUT),
> +	HWMON_CHANNEL_INFO(in,
> +			   HWMON_I_INPUT,
> +			   HWMON_I_INPUT,
> +			   HWMON_I_INPUT,
> +			   HWMON_I_INPUT,
> +			   HWMON_I_INPUT,
> +			   HWMON_I_INPUT,
> +			   HWMON_I_INPUT,
> +			   HWMON_I_INPUT),
> +	HWMON_CHANNEL_INFO(fan,
> +			   HWMON_F_INPUT | HWMON_F_TARGET | HWMON_F_DIV,
> +			   HWMON_F_INPUT | HWMON_F_TARGET | HWMON_F_DIV,
> +			   HWMON_F_INPUT | HWMON_F_TARGET | HWMON_F_DIV,
> +			   HWMON_F_INPUT | HWMON_F_TARGET | HWMON_F_DIV),
> +	HWMON_CHANNEL_INFO(pwm,
> +			   HWMON_PWM_INPUT | HWMON_PWM_ENABLE,
> +			   HWMON_PWM_INPUT | HWMON_PWM_ENABLE,
> +			   HWMON_PWM_INPUT | HWMON_PWM_ENABLE,
> +			   HWMON_PWM_INPUT | HWMON_PWM_ENABLE),
> +	NULL
> +};
> +
> +static const struct hwmon_ops ctf2304_hwmon_ops = {
> +	.is_visible = ctf2304_is_visible,
> +	.read = ctf2304_read,
> +	.write = ctf2304_write,
> +};
> +
> +static const struct hwmon_chip_info ctf2304_chip_info = {
> +	.ops = &ctf2304_hwmon_ops,
> +	.info = ctf2304_info,
> +};
> +
> +static int ctf2304_probe(struct i2c_client *client)
> +{
> +	struct i2c_adapter *adapter = client->adapter;
> +	struct device *dev = &client->dev;
> +	struct ctf2304_data *data;
> +	struct device *hwmon_dev;
> +
> +	if (!i2c_check_functionality(adapter, I2C_FUNC_SMBUS_WORD_DATA))
> +		return -ENODEV;
> +
> +	data = devm_kzalloc(dev, sizeof(struct ctf2304_data), GFP_KERNEL);
> +	if (!data)
> +		return -ENOMEM;
> +
> +	data->client = client;
> +	mutex_init(&data->update_lock);
> +
> +	hwmon_dev = devm_hwmon_device_register_with_info(dev, client->name,
> +							 data,
> +							 &ctf2304_chip_info,
> +							 NULL);
> +
> +	return PTR_ERR_OR_ZERO(hwmon_dev);
> +}
> +
> +static const struct i2c_device_id ctf2304_id[] = {
> +	{ "ctf2304", 0 },
> +	{ }
> +};
> +MODULE_DEVICE_TABLE(i2c, ctf2304_id);
> +
> +static struct i2c_driver ctf2304_driver = {
> +	.class		= I2C_CLASS_HWMON,
> +	.driver = {
> +		.name	= "ctf2304",
> +	},
> +	.probe_new	= ctf2304_probe,
> +	.id_table	= ctf2304_id,
> +};
> +
> +module_i2c_driver(ctf2304_driver);
> +
> +MODULE_AUTHOR("Il Han <corone.il.han@gmail.com>");
> +MODULE_DESCRIPTION("CTF2304 sensor driver");
> +MODULE_LICENSE("GPL");
> -- 
> 2.26.3
> 
