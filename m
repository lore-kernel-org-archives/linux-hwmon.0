Return-Path: <SRS0=JtC8=YN=vger.kernel.org=linux-hwmon-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.1 required=3.0 tests=DKIM_INVALID,DKIM_SIGNED,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_1 autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 22022CA9EAD
	for <linux-hwmon@archiver.kernel.org>; Sun, 20 Oct 2019 16:12:37 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id C2FAB21D80
	for <linux-hwmon@archiver.kernel.org>; Sun, 20 Oct 2019 16:12:36 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="CfmBZJZA"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726485AbfJTQMg (ORCPT <rfc822;linux-hwmon@archiver.kernel.org>);
        Sun, 20 Oct 2019 12:12:36 -0400
Received: from mail-pg1-f194.google.com ([209.85.215.194]:43725 "EHLO
        mail-pg1-f194.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726482AbfJTQMg (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>);
        Sun, 20 Oct 2019 12:12:36 -0400
Received: by mail-pg1-f194.google.com with SMTP id l24so1203572pgh.10;
        Sun, 20 Oct 2019 09:12:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=sender:date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:content-transfer-encoding:in-reply-to
         :user-agent;
        bh=N2vUzMWvxctopwaIty53Xn6Eu6Vntr0uF6mbiVGNHCs=;
        b=CfmBZJZAnLmLvpis9JBQpxauv5ejHQOJDlvAmIW2XPYZD2V5d8mj+dALtDj/cwpwQ5
         jonEaf5pvszX9zqxnRRZIizPXuXPliFQMFVkyAKWz9vFABJDa8ANd5K2SMfExh2Urpuq
         ifP7zaEBNdLGyihye9t7KhksNjwo5ORAtfYfqpWn+sXCJ8PlVj6bCs+H8AJXXn7/fpsO
         qp3y14LMuLoBqg315TiG9LlTXnTOrapIRy2DrkQbVBWFPHif0KEpSQ8hU0JWA8NVIrW+
         aqTkrtIWGWqla03EfCEGc8TW3R4L+qQMgnhKyxdMANBKJKhtknf0f06/BYDanCzC5Psd
         2L5Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:sender:date:from:to:cc:subject:message-id
         :references:mime-version:content-disposition
         :content-transfer-encoding:in-reply-to:user-agent;
        bh=N2vUzMWvxctopwaIty53Xn6Eu6Vntr0uF6mbiVGNHCs=;
        b=NL0Nb5XcYPY65s/aLg+JaVNkfeK4QBJBwWlKc6vbUBcLw6tEAHMP6u83yk/6c5+vjj
         tFFCn4RW0RZbcltM6psIW10JvfIhat5jw4z3vY3zbt4bt2tmZdJGEWB0RPhmBP+5h0Pp
         WRdLfsqWJaO334160dGDH1FfaPX/s3c6JYOYeQqY24ByhnmOnzFIEM0baqTqI3aNqiCw
         p14XmDwqg3yjWT1OXbVaQYmTSgBKls/7sqNSr+jy1ovWkq6hkJHU5g31nqLv/V9pxLJl
         IELLD8Qcznvuc6+WixFuaKrykcQqhqvtOrs4DGUpHm9vJfovDzUT2JIeps4LBdPc70ZJ
         K0eQ==
X-Gm-Message-State: APjAAAWTJW6tdHkF7TE9I+4Kzr52c7ey+d4+m3+wqW9SxNyUr7SVfT2Y
        7K8zV7AlIkkHzWbdoarjntU1lpBe
X-Google-Smtp-Source: APXvYqzqsmI5UBrTGsN2AX4iQgWVO4TqFySQTAAaBhzMH75l5DFJXMjbjmPgvOpeEW2IAOTzbSE2Xw==
X-Received: by 2002:a17:90a:ba8d:: with SMTP id t13mr23376041pjr.129.1571587953015;
        Sun, 20 Oct 2019 09:12:33 -0700 (PDT)
Received: from localhost ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
        by smtp.gmail.com with ESMTPSA id 6sm11599846pgl.40.2019.10.20.09.12.32
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Sun, 20 Oct 2019 09:12:32 -0700 (PDT)
Date:   Sun, 20 Oct 2019 09:12:31 -0700
From:   Guenter Roeck <linux@roeck-us.net>
To:     Nuno =?iso-8859-1?Q?S=E1?= <nuno.sa@analog.com>
Cc:     linux-hwmon@vger.kernel.org, devicetree@vger.kernel.org,
        Jean Delvare <jdelvare@suse.com>,
        Rob Herring <robh+dt@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>
Subject: Re: [PATCH v2 1/2] hwmon: Support ADI Fan Control IP
Message-ID: <20191020161231.GA27783@roeck-us.net>
References: <20191009102806.262241-1-nuno.sa@analog.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20191009102806.262241-1-nuno.sa@analog.com>
User-Agent: Mutt/1.9.4 (2018-02-28)
Sender: linux-hwmon-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-hwmon.vger.kernel.org>
X-Mailing-List: linux-hwmon@vger.kernel.org

On Wed, Oct 09, 2019 at 12:28:05PM +0200, Nuno Sá wrote:
> The purpose of this IP Core is to control the fan used for the cooling of a
> Xilinx Zynq Ultrascale+ MPSoC without the need of any external temperature
> sensors. To achieve this, the IP core uses the PL SYSMONE4 primitive to
> obtain the PL temperature and, based on those readings, it then outputs
> a PWM signal to control the fan rotation accordingly.
> 
> Signed-off-by: Nuno Sá <nuno.sa@analog.com>

Applied to hwmon-next.

Thanks,
Guenter

> ---
> Changes in v2:
>  * define AXI_PCORE macros in the driver source for now;
>  * include linux/bits.h;
>  * axi_fan_control_io{read/write} renamed with shorter names;
>  * Make sure tach is != 0 when getting the fan rpm;
>  * Read only once the clk rate;
>  * Remove unneeded struct clk;
>  * Fixed typo in millidegrees;
>  * Use devm_platform_ioremap_resource();
>  * Remove unneeded error logs;
>  * Check valid values for pulses per revolution;
>  * Clear the fault attribute after reading it;
>  * Notify userspace if HW changed the PWM;
>  * Add comments on how the core works in other to better understand the IRQ handling.
> 
>  MAINTAINERS                     |   7 +
>  drivers/hwmon/Kconfig           |   9 +
>  drivers/hwmon/Makefile          |   1 +
>  drivers/hwmon/axi-fan-control.c | 473 ++++++++++++++++++++++++++++++++
>  4 files changed, 490 insertions(+)
>  create mode 100644 drivers/hwmon/axi-fan-control.c
> 
> diff --git a/MAINTAINERS b/MAINTAINERS
> index 296de2b51c83..caa80ae1925e 100644
> --- a/MAINTAINERS
> +++ b/MAINTAINERS
> @@ -2873,6 +2873,13 @@ S:	Maintained
>  F:	Documentation/devicetree/bindings/sound/axentia,*
>  F:	sound/soc/atmel/tse850-pcm5142.c
>  
> +AXI-FAN-CONTROL HARDWARE MONITOR DRIVER
> +M:	Nuno Sá <nuno.sa@analog.com>
> +W:	http://ez.analog.com/community/linux-device-drivers
> +L:	linux-hwmon@vger.kernel.org
> +S:	Supported
> +F:	drivers/hwmon/axi-fan-control.c
> +
>  AXXIA I2C CONTROLLER
>  M:	Krzysztof Adamski <krzysztof.adamski@nokia.com>
>  L:	linux-i2c@vger.kernel.org
> diff --git a/drivers/hwmon/Kconfig b/drivers/hwmon/Kconfig
> index 7b6c4025b827..ca53bb33b965 100644
> --- a/drivers/hwmon/Kconfig
> +++ b/drivers/hwmon/Kconfig
> @@ -269,6 +269,15 @@ config SENSORS_ASC7621
>  	  This driver can also be built as a module. If so, the module
>  	  will be called asc7621.
>  
> +config SENSORS_AXI_FAN_CONTROL
> +	tristate "Analog Devices FAN Control HDL Core driver"
> +	help
> +	  If you say yes here you get support for the Analog Devices
> +	  AXI HDL FAN monitoring core.
> +
> +	  This driver can also be built as a module. If so, the module
> +	  will be called axi-fan-control
> +
>  config SENSORS_K8TEMP
>  	tristate "AMD Athlon64/FX or Opteron temperature sensor"
>  	depends on X86 && PCI
> diff --git a/drivers/hwmon/Makefile b/drivers/hwmon/Makefile
> index 40c036ea45e6..dcb4b64e1f4d 100644
> --- a/drivers/hwmon/Makefile
> +++ b/drivers/hwmon/Makefile
> @@ -51,6 +51,7 @@ obj-$(CONFIG_SENSORS_AS370)	+= as370-hwmon.o
>  obj-$(CONFIG_SENSORS_ASC7621)	+= asc7621.o
>  obj-$(CONFIG_SENSORS_ASPEED)	+= aspeed-pwm-tacho.o
>  obj-$(CONFIG_SENSORS_ATXP1)	+= atxp1.o
> +obj-$(CONFIG_SENSORS_AXI_FAN_CONTROL) += axi-fan-control.o
>  obj-$(CONFIG_SENSORS_CORETEMP)	+= coretemp.o
>  obj-$(CONFIG_SENSORS_DA9052_ADC)+= da9052-hwmon.o
>  obj-$(CONFIG_SENSORS_DA9055)+= da9055-hwmon.o
> diff --git a/drivers/hwmon/axi-fan-control.c b/drivers/hwmon/axi-fan-control.c
> new file mode 100644
> index 000000000000..6c1bd3269c8c
> --- /dev/null
> +++ b/drivers/hwmon/axi-fan-control.c
> @@ -0,0 +1,473 @@
> +// SPDX-License-Identifier: GPL-2.0
> +/*
> + * Fan Control HDL CORE driver
> + *
> + * Copyright 2019 Analog Devices Inc.
> + */
> +#include <linux/bits.h>
> +#include <linux/clk.h>
> +#include <linux/fpga/adi-axi-common.h>
> +#include <linux/hwmon.h>
> +#include <linux/interrupt.h>
> +#include <linux/io.h>
> +#include <linux/kernel.h>
> +#include <linux/module.h>
> +#include <linux/of.h>
> +#include <linux/platform_device.h>
> +
> +#define ADI_AXI_PCORE_VER_MAJOR(version)	(((version) >> 16) & 0xff)
> +#define ADI_AXI_PCORE_VER_MINOR(version)	(((version) >> 8) & 0xff)
> +#define ADI_AXI_PCORE_VER_PATCH(version)	((version) & 0xff)
> +
> +/* register map */
> +#define ADI_REG_RSTN		0x0080
> +#define ADI_REG_PWM_WIDTH	0x0084
> +#define ADI_REG_TACH_PERIOD	0x0088
> +#define ADI_REG_TACH_TOLERANCE	0x008c
> +#define ADI_REG_PWM_PERIOD	0x00c0
> +#define ADI_REG_TACH_MEASUR	0x00c4
> +#define ADI_REG_TEMPERATURE	0x00c8
> +
> +#define ADI_REG_IRQ_MASK	0x0040
> +#define ADI_REG_IRQ_PENDING	0x0044
> +#define ADI_REG_IRQ_SRC		0x0048
> +
> +/* IRQ sources */
> +#define ADI_IRQ_SRC_PWM_CHANGED		BIT(0)
> +#define ADI_IRQ_SRC_TACH_ERR		BIT(1)
> +#define ADI_IRQ_SRC_TEMP_INCREASE	BIT(2)
> +#define ADI_IRQ_SRC_NEW_MEASUR		BIT(3)
> +#define ADI_IRQ_SRC_MASK		GENMASK(3, 0)
> +#define ADI_IRQ_MASK_OUT_ALL		0xFFFFFFFFU
> +
> +#define SYSFS_PWM_MAX			255
> +
> +struct axi_fan_control_data {
> +	void __iomem *base;
> +	struct device *hdev;
> +	unsigned long clk_rate;
> +	int irq;
> +	/* pulses per revolution */
> +	u32 ppr;
> +	bool hw_pwm_req;
> +	bool update_tacho_params;
> +	u8 fan_fault;
> +};
> +
> +static inline void axi_iowrite(const u32 val, const u32 reg,
> +			       const struct axi_fan_control_data *ctl)
> +{
> +	iowrite32(val, ctl->base + reg);
> +}
> +
> +static inline u32 axi_ioread(const u32 reg,
> +			     const struct axi_fan_control_data *ctl)
> +{
> +	return ioread32(ctl->base + reg);
> +}
> +
> +static long axi_fan_control_get_pwm_duty(const struct axi_fan_control_data *ctl)
> +{
> +	u32 pwm_width = axi_ioread(ADI_REG_PWM_WIDTH, ctl);
> +	u32 pwm_period = axi_ioread(ADI_REG_PWM_PERIOD, ctl);
> +	/*
> +	 * PWM_PERIOD is a RO register set by the core. It should never be 0.
> +	 * For now we are trusting the HW...
> +	 */
> +	return DIV_ROUND_CLOSEST(pwm_width * SYSFS_PWM_MAX, pwm_period);
> +}
> +
> +static int axi_fan_control_set_pwm_duty(const long val,
> +					struct axi_fan_control_data *ctl)
> +{
> +	u32 pwm_period = axi_ioread(ADI_REG_PWM_PERIOD, ctl);
> +	u32 new_width;
> +	long __val = clamp_val(val, 0, SYSFS_PWM_MAX);
> +
> +	new_width = DIV_ROUND_CLOSEST(__val * pwm_period, SYSFS_PWM_MAX);
> +
> +	axi_iowrite(new_width, ADI_REG_PWM_WIDTH, ctl);
> +
> +	return 0;
> +}
> +
> +static long axi_fan_control_get_fan_rpm(const struct axi_fan_control_data *ctl)
> +{
> +	const u32 tach = axi_ioread(ADI_REG_TACH_MEASUR, ctl);
> +
> +	if (tach == 0)
> +		/* should we return error, EAGAIN maybe? */
> +		return 0;
> +	/*
> +	 * The tacho period should be:
> +	 *      TACH = 60/(ppr * rpm), where rpm is revolutions per second
> +	 *      and ppr is pulses per revolution.
> +	 * Given the tacho period, we can multiply it by the input clock
> +	 * so that we know how many clocks we need to have this period.
> +	 * From this, we can derive the RPM value.
> +	 */
> +	return DIV_ROUND_CLOSEST(60 * ctl->clk_rate, ctl->ppr * tach);
> +}
> +
> +static int axi_fan_control_read_temp(struct device *dev, u32 attr, long *val)
> +{
> +	struct axi_fan_control_data *ctl = dev_get_drvdata(dev);
> +	long raw_temp;
> +
> +	switch (attr) {
> +	case hwmon_temp_input:
> +		raw_temp = axi_ioread(ADI_REG_TEMPERATURE, ctl);
> +		/*
> +		 * The formula for the temperature is:
> +		 *      T = (ADC * 501.3743 / 2^bits) - 273.6777
> +		 * It's multiplied by 1000 to have millidegrees as
> +		 * specified by the hwmon sysfs interface.
> +		 */
> +		*val = ((raw_temp * 501374) >> 16) - 273677;
> +		return 0;
> +	default:
> +		return -ENOTSUPP;
> +	}
> +}
> +
> +static int axi_fan_control_read_fan(struct device *dev, u32 attr, long *val)
> +{
> +	struct axi_fan_control_data *ctl = dev_get_drvdata(dev);
> +
> +	switch (attr) {
> +	case hwmon_fan_fault:
> +		*val = ctl->fan_fault;
> +		/* clear it now */
> +		ctl->fan_fault = 0;
> +		return 0;
> +	case hwmon_fan_input:
> +		*val = axi_fan_control_get_fan_rpm(ctl);
> +		return 0;
> +	default:
> +		return -ENOTSUPP;
> +	}
> +}
> +
> +static int axi_fan_control_read_pwm(struct device *dev, u32 attr, long *val)
> +{
> +	struct axi_fan_control_data *ctl = dev_get_drvdata(dev);
> +
> +	switch (attr) {
> +	case hwmon_pwm_input:
> +		*val = axi_fan_control_get_pwm_duty(ctl);
> +		return 0;
> +	default:
> +		return -ENOTSUPP;
> +	}
> +}
> +
> +static int axi_fan_control_write_pwm(struct device *dev, u32 attr, long val)
> +{
> +	struct axi_fan_control_data *ctl = dev_get_drvdata(dev);
> +
> +	switch (attr) {
> +	case hwmon_pwm_input:
> +		return axi_fan_control_set_pwm_duty(val, ctl);
> +	default:
> +		return -ENOTSUPP;
> +	}
> +}
> +
> +static int axi_fan_control_read_labels(struct device *dev,
> +				       enum hwmon_sensor_types type,
> +				       u32 attr, int channel, const char **str)
> +{
> +	switch (type) {
> +	case hwmon_fan:
> +		*str = "FAN";
> +		return 0;
> +	case hwmon_temp:
> +		*str = "SYSMON4";
> +		return 0;
> +	default:
> +		return -ENOTSUPP;
> +	}
> +}
> +
> +static int axi_fan_control_read(struct device *dev,
> +				enum hwmon_sensor_types type,
> +				u32 attr, int channel, long *val)
> +{
> +	switch (type) {
> +	case hwmon_fan:
> +		return axi_fan_control_read_fan(dev, attr, val);
> +	case hwmon_pwm:
> +		return axi_fan_control_read_pwm(dev, attr, val);
> +	case hwmon_temp:
> +		return axi_fan_control_read_temp(dev, attr, val);
> +	default:
> +		return -ENOTSUPP;
> +	}
> +}
> +
> +static int axi_fan_control_write(struct device *dev,
> +				 enum hwmon_sensor_types type,
> +				 u32 attr, int channel, long val)
> +{
> +	switch (type) {
> +	case hwmon_pwm:
> +		return axi_fan_control_write_pwm(dev, attr, val);
> +	default:
> +		return -ENOTSUPP;
> +	}
> +}
> +
> +static umode_t axi_fan_control_fan_is_visible(const u32 attr)
> +{
> +	switch (attr) {
> +	case hwmon_fan_input:
> +	case hwmon_fan_fault:
> +	case hwmon_fan_label:
> +		return 0444;
> +	default:
> +		return 0;
> +	}
> +}
> +
> +static umode_t axi_fan_control_pwm_is_visible(const u32 attr)
> +{
> +	switch (attr) {
> +	case hwmon_pwm_input:
> +		return 0644;
> +	default:
> +		return 0;
> +	}
> +}
> +
> +static umode_t axi_fan_control_temp_is_visible(const u32 attr)
> +{
> +	switch (attr) {
> +	case hwmon_temp_input:
> +	case hwmon_temp_label:
> +		return 0444;
> +	default:
> +		return 0;
> +	}
> +}
> +
> +static umode_t axi_fan_control_is_visible(const void *data,
> +					  enum hwmon_sensor_types type,
> +					  u32 attr, int channel)
> +{
> +	switch (type) {
> +	case hwmon_fan:
> +		return axi_fan_control_fan_is_visible(attr);
> +	case hwmon_pwm:
> +		return axi_fan_control_pwm_is_visible(attr);
> +	case hwmon_temp:
> +		return axi_fan_control_temp_is_visible(attr);
> +	default:
> +		return 0;
> +	}
> +}
> +
> +/*
> + * This core has two main ways of changing the PWM duty cycle. It is done,
> + * either by a request from userspace (writing on pwm1_input) or by the
> + * core itself. When the change is done by the core, it will use predefined
> + * parameters to evaluate the tach signal and, on that case we cannot set them.
> + * On the other hand, when the request is done by the user, with some arbitrary
> + * value that the core does not now about, we have to provide the tach
> + * parameters so that, the core can evaluate the signal. On the IRQ handler we
> + * distinguish this by using the ADI_IRQ_SRC_TEMP_INCREASE interrupt. This tell
> + * us that the CORE requested a new duty cycle. After this, there is 5s delay
> + * on which the core waits for the fan rotation speed to stabilize. After this
> + * we get ADI_IRQ_SRC_PWM_CHANGED irq where we will decide if we need to set
> + * the tach parameters or not on the next tach measurement cycle (corresponding
> + * already to the ney duty cycle) based on the %ctl->hw_pwm_req flag.
> + */
> +static irqreturn_t axi_fan_control_irq_handler(int irq, void *data)
> +{
> +	struct axi_fan_control_data *ctl = (struct axi_fan_control_data *)data;
> +	u32 irq_pending = axi_ioread(ADI_REG_IRQ_PENDING, ctl);
> +	u32 clear_mask;
> +
> +	if (irq_pending & ADI_IRQ_SRC_NEW_MEASUR) {
> +		if (ctl->update_tacho_params) {
> +			u32 new_tach = axi_ioread(ADI_REG_TACH_MEASUR, ctl);
> +
> +			/* get 25% tolerance */
> +			u32 tach_tol = DIV_ROUND_CLOSEST(new_tach * 25, 100);
> +			/* set new tacho parameters */
> +			axi_iowrite(new_tach, ADI_REG_TACH_PERIOD, ctl);
> +			axi_iowrite(tach_tol, ADI_REG_TACH_TOLERANCE, ctl);
> +			ctl->update_tacho_params = false;
> +		}
> +	}
> +
> +	if (irq_pending & ADI_IRQ_SRC_PWM_CHANGED) {
> +		/*
> +		 * if the pwm changes on behalf of software,
> +		 * we need to provide new tacho parameters to the core.
> +		 * Wait for the next measurement for that...
> +		 */
> +		if (!ctl->hw_pwm_req) {
> +			ctl->update_tacho_params = true;
> +		} else {
> +			ctl->hw_pwm_req = false;
> +			sysfs_notify(&ctl->hdev->kobj, NULL, "pwm1");
> +		}
> +	}
> +
> +	if (irq_pending & ADI_IRQ_SRC_TEMP_INCREASE)
> +		/* hardware requested a new pwm */
> +		ctl->hw_pwm_req = true;
> +
> +	if (irq_pending & ADI_IRQ_SRC_TACH_ERR)
> +		ctl->fan_fault = 1;
> +
> +	/* clear all interrupts */
> +	clear_mask = irq_pending & ADI_IRQ_SRC_MASK;
> +	axi_iowrite(clear_mask, ADI_REG_IRQ_PENDING, ctl);
> +
> +	return IRQ_HANDLED;
> +}
> +
> +static int axi_fan_control_init(struct axi_fan_control_data *ctl,
> +				const struct device_node *np)
> +{
> +	int ret;
> +
> +	/* get fan pulses per revolution */
> +	ret = of_property_read_u32(np, "adi,pulses-per-revolution", &ctl->ppr);
> +	if (ret)
> +		return ret;
> +
> +	/* 1, 2 and 4 are the typical and accepted values */
> +	if (ctl->ppr != 1 && ctl->ppr != 2 && ctl->ppr != 4)
> +		return -EINVAL;
> +	/*
> +	 * Enable all IRQs
> +	 */
> +	axi_iowrite(ADI_IRQ_MASK_OUT_ALL &
> +		    ~(ADI_IRQ_SRC_NEW_MEASUR | ADI_IRQ_SRC_TACH_ERR |
> +		      ADI_IRQ_SRC_PWM_CHANGED | ADI_IRQ_SRC_TEMP_INCREASE),
> +		    ADI_REG_IRQ_MASK, ctl);
> +
> +	/* bring the device out of reset */
> +	axi_iowrite(0x01, ADI_REG_RSTN, ctl);
> +
> +	return ret;
> +}
> +
> +static const struct hwmon_channel_info *axi_fan_control_info[] = {
> +	HWMON_CHANNEL_INFO(pwm, HWMON_PWM_INPUT),
> +	HWMON_CHANNEL_INFO(fan, HWMON_F_INPUT | HWMON_F_FAULT | HWMON_F_LABEL),
> +	HWMON_CHANNEL_INFO(temp, HWMON_T_INPUT | HWMON_T_LABEL),
> +	NULL
> +};
> +
> +static const struct hwmon_ops axi_fan_control_hwmon_ops = {
> +	.is_visible = axi_fan_control_is_visible,
> +	.read = axi_fan_control_read,
> +	.write = axi_fan_control_write,
> +	.read_string = axi_fan_control_read_labels,
> +};
> +
> +static const struct hwmon_chip_info axi_chip_info = {
> +	.ops = &axi_fan_control_hwmon_ops,
> +	.info = axi_fan_control_info,
> +};
> +
> +static const u32 version_1_0_0 = ADI_AXI_PCORE_VER(1, 0, 'a');
> +
> +static const struct of_device_id axi_fan_control_of_match[] = {
> +	{ .compatible = "adi,axi-fan-control-1.00.a",
> +		.data = (void *)&version_1_0_0},
> +	{},
> +};
> +MODULE_DEVICE_TABLE(of, axi_fan_control_of_match);
> +
> +static int axi_fan_control_probe(struct platform_device *pdev)
> +{
> +	struct axi_fan_control_data *ctl;
> +	struct clk *clk;
> +	const struct of_device_id *id;
> +	const char *name = "axi_fan_control";
> +	struct resource *res;
> +	u32 version;
> +	int ret;
> +
> +	id = of_match_node(axi_fan_control_of_match, pdev->dev.of_node);
> +	if (!id)
> +		return -EINVAL;
> +
> +	ctl = devm_kzalloc(&pdev->dev, sizeof(*ctl), GFP_KERNEL);
> +	if (!ctl)
> +		return -ENOMEM;
> +
> +	ctl->base = devm_platform_ioremap_resource(pdev, 0);
> +	if (IS_ERR(ctl->base))
> +		return PTR_ERR(ctl->base);
> +
> +	clk = devm_clk_get(&pdev->dev, NULL);
> +	if (IS_ERR(clk)) {
> +		dev_err(&pdev->dev, "clk_get failed with %ld\n", PTR_ERR(clk));
> +		return PTR_ERR(clk);
> +	}
> +
> +	ctl->clk_rate = clk_get_rate(clk);
> +	if (!ctl->clk_rate)
> +		return -EINVAL;
> +
> +	dev_dbg(&pdev->dev, "Re-mapped from 0x%08llX to %p\n",
> +		(unsigned long long)res->start, ctl->base);
> +
> +	version = axi_ioread(ADI_AXI_REG_VERSION, ctl);
> +	if (ADI_AXI_PCORE_VER_MAJOR(version) !=
> +	    ADI_AXI_PCORE_VER_MAJOR((*(u32 *)id->data))) {
> +		dev_err(&pdev->dev, "Major version mismatch. Expected %d.%.2d.%c, Reported %d.%.2d.%c\n",
> +			ADI_AXI_PCORE_VER_MAJOR((*(u32 *)id->data)),
> +			ADI_AXI_PCORE_VER_MINOR((*(u32 *)id->data)),
> +			ADI_AXI_PCORE_VER_PATCH((*(u32 *)id->data)),
> +			ADI_AXI_PCORE_VER_MAJOR(version),
> +			ADI_AXI_PCORE_VER_MINOR(version),
> +			ADI_AXI_PCORE_VER_PATCH(version));
> +		return -ENODEV;
> +	}
> +
> +	ctl->irq = platform_get_irq(pdev, 0);
> +	if (ctl->irq < 0)
> +		return ctl->irq;
> +
> +	ret = devm_request_threaded_irq(&pdev->dev, ctl->irq, NULL,
> +					axi_fan_control_irq_handler,
> +					IRQF_ONESHOT | IRQF_TRIGGER_HIGH,
> +					pdev->driver_override, ctl);
> +	if (ret) {
> +		dev_err(&pdev->dev, "failed to request an irq, %d", ret);
> +		return ret;
> +	}
> +
> +	ret = axi_fan_control_init(ctl, pdev->dev.of_node);
> +	if (ret) {
> +		dev_err(&pdev->dev, "Failed to initialize device\n");
> +		return ret;
> +	}
> +
> +	ctl->hdev = devm_hwmon_device_register_with_info(&pdev->dev,
> +							 name,
> +							 ctl,
> +							 &axi_chip_info,
> +							 NULL);
> +
> +	return PTR_ERR_OR_ZERO(ctl->hdev);
> +}
> +
> +static struct platform_driver axi_fan_control_driver = {
> +	.driver = {
> +		.name = "axi_fan_control_driver",
> +		.of_match_table = axi_fan_control_of_match,
> +	},
> +	.probe = axi_fan_control_probe,
> +};
> +module_platform_driver(axi_fan_control_driver);
> +
> +MODULE_AUTHOR("Nuno Sa <nuno.sa@analog.com>");
> +MODULE_DESCRIPTION("Analog Devices Fan Control HDL CORE driver");
> +MODULE_LICENSE("GPL");
