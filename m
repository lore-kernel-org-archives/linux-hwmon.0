Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7127F4ED182;
	Wed, 14 Oct 2026 11:32:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791977575; cv=none; b=qedRA26q2RtgjqihfnMfa8QScSW/6ZUoPr8xABz5VFvg5e6ACCEIPg657yvV+DrL43TPtac4P+aGFfyHE9tmEEhfm/Ri7vpF8Fo82rwgJmucCHS3LSDuCoruaIqCSuLs7a/eyDihxu3fU8/C4V1N5wjghK9eFQXqs0zjiXAnzk8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791977575; c=relaxed/simple;
	bh=JgL0ClifhWzeZw5xGNMf8jf5gMh/4PCz9dozdoKiH3o=;
	h=From:Date:To:cc:Subject:In-Reply-To:Message-ID:References:
	 MIME-Version:Content-Type; b=pqha6HEOEJ6ZddHvZaQ/7W9Tavt/SZSoKA3oITa6o4S8IavzTPPnsNB1KC9Edys4Sq2h37cDHZ5T5V/iWT1yhRkR2yYDSBXWfhJdV4/RGRAxHJieoU6v9j0kgOPI9Y0FSgB1sgrPsl5bK8tQCTwZ1i2kMSfpp9/lEoAo3i4evBI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=O/j2X7c8; arc=none smtp.client-ip=198.175.65.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="O/j2X7c8"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1791977571; x=1823513571;
  h=from:date:to:cc:subject:in-reply-to:message-id:
   references:mime-version;
  bh=JgL0ClifhWzeZw5xGNMf8jf5gMh/4PCz9dozdoKiH3o=;
  b=O/j2X7c8//oDdJV4+qcSgTogL5u8OZ8arm+5IOeCE4Be717JfYaZDLLj
   q7XuAcLYoKm1QCJfmlOZ8lU+ykFgq7Wf8pJXUOnxgntUfEtAcuoLciKpX
   50mJUwmZib8aBAUgyfCZSzjQR8civ1H3pCrRUXVchnCaEWY35a7OGJHYR
   ObC0DeUnIEIcyuoEaZGH7Ai2gYRPDRg0Uc4jsigQ4AeBVDCNJ6ANdshIt
   KyeU7ABbtfj4vp8bEkoi8w+l4t5+ce5irNCvYaUf/zZuKniZK0BF3rJiJ
   2JoQeinwvRP2wW5VMFYC+OQcQCY6OG5Sz3ICbeCnlMCmnus3JDYNo9GUq
   w==;
X-CSE-ConnectionGUID: ZEesX7Q5QkCe7G9eEgPdwg==
X-CSE-MsgGUID: R5rYs0SrQHGt6nIJdXimXg==
X-IronPort-AV: E=McAfee;i="6800,10657,11934"; a="607353"
X-IronPort-AV: E=Sophos;i="6.27,157,1787036400"; 
   d="scan'208";a="607353"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
  by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 Oct 2026 04:32:50 -0700
X-CSE-ConnectionGUID: NtaTOkjpQFi+arNDSpBAIQ==
X-CSE-MsgGUID: iucbEzg8QTqJUHtTHuf19A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,157,1787036400"; 
   d="scan'208";a="1499985"
Received: from ijarvine-mobl1.ger.corp.intel.com (HELO localhost) ([10.245.245.234])
  by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 Oct 2026 04:32:45 -0700
From: =?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>
Date: Wed, 14 Oct 2026 14:32:41 +0300 (EEST)
To: Oleg Keri <okerixx@gmail.com>
cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
    Conor Dooley <conor+dt@kernel.org>, Hans de Goede <hansg@kernel.org>, 
    Bryan O'Donoghue <bryan.odonoghue@linaro.org>, 
    Guenter Roeck <linux@roeck-us.net>, Bjorn Andersson <andersson@kernel.org>, 
    Konrad Dybcio <konradybcio@kernel.org>, Abel Vesa <abelvesa@kernel.org>, 
    linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, 
    LKML <linux-kernel@vger.kernel.org>, platform-driver-x86@vger.kernel.org, 
    linux-hwmon@vger.kernel.org
Subject: Re: [PATCH v5 2/3] platform/arm64: add Lenovo Yoga Slim 7x Gen 11
 EC driver
In-Reply-To: <20261003202143.4697-3-okerixx@gmail.com>
Message-ID: <32061ef6-99d4-8a1f-ad4b-e413d30f261f@linux.intel.com>
References: <20261003202143.4697-1-okerixx@gmail.com> <20261003202143.4697-3-okerixx@gmail.com>
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

On Sat, 3 Oct 2026, Oleg Keri wrote:

> The Lenovo Yoga Slim 7x Gen 11 (Qualcomm glymur / Snapdragon X2 Elite)
> carries a Compal EF06 embedded controller on I2C at address 0x70. The
> platform firmware describes it as an ACPI GenericSerialBus region, but the
> machine boots from device tree, so nothing otherwise talks to it.
> 
> Commands are exchanged with two raw I2C block transfers: a 7 byte write to
> register 0x02 carrying the command and up to six arguments, then a 6 byte
> read of register 0x01 for the result, with a short delay in between before
> the result register is valid. The EC offers no way to match a result to
> its command; the delay is the one the vendor ACPI code uses.
> 
> Expose what the EC offers that the rest of the kernel does not already
> provide:
> 
>   - five board thermistors as hwmon temperature channels. These are
>     charger, CPU voltage regulator, 5 V rail and ambient sensors, not die
>     sensors, and read considerably cooler than tsens
>   - CPU fan speed in RPM
>   - the keyboard backlight as an LED, off/low/high
>   - Fn-lock as a read/write sysfs attribute, matching the ideapad-laptop
>     interface. The EC reports Fn+Esc as an event but keeps no state of its
>     own, so the driver owns the bit and toggles it on the key
>   - the mic-mute and airplane-mode keys as KEY_MICMUTE and KEY_RFKILL.
>     These reach the host only as EC events; they are not on the keyboard's
>     HID interface and have no GPIO of their own
> 
> The EC signals pending events on a dedicated line, and keeps pulsing it
> until they are read - so the queue must be drained completely on every
> interrupt, including codes this driver ignores. Leaving one behind makes
> the controller pulse indefinitely.
> 
> Fan speed is reported but not controlled. The EC accepts a manual setpoint,
> however it enforces no thermal floor over it: with the fan pinned at
> roughly 2000 RPM under full load the SoC rose from 69 to 91 degrees in 30
> seconds without the EC ever overriding. Exposing pwm1_enable or fan1_target
> would therefore let userspace overheat the machine, so neither is
> implemented.
> 
> Note this is the Gen 11 machine specifically. Its EC differs from the
> Qualcomm reference EC that the reference designs place at address 0x76,
> which is not populated here, and so EC_QCOM_HAMOA does not drive it.
> 
> Signed-off-by: Oleg Keri <okerixx@gmail.com>

Hi,

A few style nits below.

> ---
>  .../sysfs-driver-lenovo-yoga-slim7x-gen11-ec  |  22 +
>  drivers/platform/arm64/Kconfig                |  23 +
>  drivers/platform/arm64/Makefile               |   1 +
>  .../arm64/lenovo-yoga-slim7x-gen11-ec.c       | 547 ++++++++++++++++++
>  4 files changed, 593 insertions(+)
>  create mode 100644 Documentation/ABI/testing/sysfs-driver-lenovo-yoga-slim7x-gen11-ec
>  create mode 100644 drivers/platform/arm64/lenovo-yoga-slim7x-gen11-ec.c
> 
> diff --git a/Documentation/ABI/testing/sysfs-driver-lenovo-yoga-slim7x-gen11-ec b/Documentation/ABI/testing/sysfs-driver-lenovo-yoga-slim7x-gen11-ec
> new file mode 100644
> index 000000000000..80d01fc32abb
> --- /dev/null
> +++ b/Documentation/ABI/testing/sysfs-driver-lenovo-yoga-slim7x-gen11-ec
> @@ -0,0 +1,22 @@
> +What:		/sys/bus/i2c/devices/*/fn_lock
> +Date:		October 2026
> +KernelVersion:	7.5
> +Contact:	Oleg Keri <okerixx@gmail.com>
> +Description:
> +		Control fn-lock mode.
> +
> +			* 1 -> Switched On
> +			* 0 -> Switched Off
> +
> +		When switched on, the function keys act as F1..F12 and the
> +		multimedia functions require the Fn modifier.
> +
> +		The embedded controller reports the Fn+Esc key as an event but
> +		keeps no state of its own, so this attribute is the state: the
> +		driver toggles it when the key is pressed, and writing it takes
> +		effect immediately. A toggle from the key is signalled with
> +		sysfs_notify(), so the attribute can be polled.
> +
> +		For example::
> +
> +		  # echo "0" > /sys/bus/i2c/devices/9-0070/fn_lock
> diff --git a/drivers/platform/arm64/Kconfig b/drivers/platform/arm64/Kconfig
> index e32e01b2a9bd..a04573749e94 100644
> --- a/drivers/platform/arm64/Kconfig
> +++ b/drivers/platform/arm64/Kconfig
> @@ -90,6 +90,29 @@ config EC_LENOVO_THINKPAD_T14S
>  
>  	  Say M or Y here to include this support.
>  
> +config EC_LENOVO_YOGA_SLIM7X_GEN11
> +	tristate "Lenovo Yoga Slim 7x Gen 11 Embedded Controller driver"
> +	depends on ARCH_QCOM || COMPILE_TEST
> +	depends on I2C
> +	depends on INPUT
> +	depends on HWMON
> +	select NEW_LEDS
> +	select LEDS_CLASS
> +	help
> +	  Say Y here to enable the EC driver for the (Snapdragon X2 Elite,
> +	  glymur-based) Lenovo Yoga Slim 7x Gen 11 laptop. The EC provides
> +	  thermistors and CPU fan speed as hwmon channels, and the keyboard
> +	  backlight as an LED.
> +
> +	  This is the Gen 11 (glymur) machine specifically. Its EC is a Compal
> +	  design at i2c address 0x70 and speaks a different protocol from the
> +	  Qualcomm reference EC that the reference designs place at 0x76, so
> +	  EC_QCOM_HAMOA does not drive it - and conversely this driver does not
> +	  cover the X1E-based Yoga Slim 7x Gen 9.
> +
> +	  To compile this driver as a module, choose M here: the module will
> +	  be called lenovo-yoga-slim7x-gen11-ec.
> +
>  config EC_QCOM_HAMOA
>  	tristate "Embedded Controller driver for Qualcomm Hamoa/Glymur reference devices"
>  	depends on ARCH_QCOM || COMPILE_TEST
> diff --git a/drivers/platform/arm64/Makefile b/drivers/platform/arm64/Makefile
> index 7681be4a46e9..605cca4d42a9 100644
> --- a/drivers/platform/arm64/Makefile
> +++ b/drivers/platform/arm64/Makefile
> @@ -9,4 +9,5 @@ obj-$(CONFIG_EC_ACER_ASPIRE1)	+= acer-aspire1-ec.o
>  obj-$(CONFIG_EC_HUAWEI_GAOKUN)	+= huawei-gaokun-ec.o
>  obj-$(CONFIG_EC_LENOVO_YOGA_C630) += lenovo-yoga-c630.o
>  obj-$(CONFIG_EC_LENOVO_THINKPAD_T14S) += lenovo-thinkpad-t14s.o
> +obj-$(CONFIG_EC_LENOVO_YOGA_SLIM7X_GEN11) += lenovo-yoga-slim7x-gen11-ec.o
>  obj-$(CONFIG_EC_QCOM_HAMOA) += qcom-hamoa-ec.o
> diff --git a/drivers/platform/arm64/lenovo-yoga-slim7x-gen11-ec.c b/drivers/platform/arm64/lenovo-yoga-slim7x-gen11-ec.c
> new file mode 100644
> index 000000000000..1ef11b9eeffa
> --- /dev/null
> +++ b/drivers/platform/arm64/lenovo-yoga-slim7x-gen11-ec.c
> @@ -0,0 +1,547 @@
> +// SPDX-License-Identifier: GPL-2.0-only
> +
> +#include <linux/bitfield.h>
> +#include <linux/bits.h>
> +#include <linux/cleanup.h>
> +#include <linux/container_of.h>
> +#include <linux/delay.h>
> +#include <linux/dev_printk.h>
> +#include <linux/device.h>
> +#include <linux/err.h>
> +#include <linux/errno.h>
> +#include <linux/gfp_types.h>
> +#include <linux/hwmon.h>
> +#include <linux/i2c.h>
> +#include <linux/input.h>
> +#include <linux/interrupt.h>
> +#include <linux/kstrtox.h>
> +#include <linux/leds.h>
> +#include <linux/lockdep.h>
> +#include <linux/module.h>
> +#include <linux/mutex.h>
> +#include <linux/pm.h>
> +#include <linux/sysfs.h>
> +#include <linux/types.h>
> +#include <linux/units.h>
> +
> +#define SLIM7X11_EC_BLOCK_READ	0x01
> +#define SLIM7X11_EC_BLOCK_WRITE	0x02
> +#define SLIM7X11_EC_RESP_LEN	6
> +#define SLIM7X11_EC_REQ_LEN	7
> +
> +#define SLIM7X11_EC_CMD_RAM_READ	0xb0
> +#define SLIM7X11_EC_CMD_RAM_WRITE	0xb1
> +#define SLIM7X11_EC_CMD_FAN		0x46
> +#define SLIM7X11_EC_FAN_GET_SPEED	0x81
> +
> +#define SLIM7X11_EC_CMD_EVENT	0x84
> +#define SLIM7X11_EC_EVT_MAX_DRAIN	64
> +#define SLIM7X11_EC_EVT_FN_LOCK	0x0f
> +#define SLIM7X11_EC_EVT_MIC_MUTE	0x18
> +#define SLIM7X11_EC_EVT_FLIGHT_MODE	0x19
> +
> +#define SLIM7X11_EC_SCUK		0x1c
> +#define SLIM7X11_EC_SCUK_MEDIA	BIT(7)
> +#define SLIM7X11_EC_SCUK_LED_OFF	BIT(5)
> +#define SLIM7X11_EC_SCUK_MEDIA_MASK	(SLIM7X11_EC_SCUK_MEDIA | SLIM7X11_EC_SCUK_LED_OFF)
> +
> +#define SLIM7X11_EC_KBLT		0x03
> +#define SLIM7X11_EC_KBLT_LEVEL	GENMASK(1, 0)
> +#define SLIM7X11_EC_KBLT_AUTO	3
> +#define SLIM7X11_EC_KBLT_MAX	2
> +
> +#define SLIM7X11_EC_TEMP_FIRST	0x12
> +#define SLIM7X11_EC_NUM_TEMP	6
> +#define SLIM7X11_EC_TEMP_MAX	120
> +
> +struct slim7x11_ec {
> +	struct i2c_client *client;
> +	/* serializes all EC access */
> +	struct mutex lock;
> +	unsigned long temp_present;
> +	struct led_classdev kbd_led;
> +	u8 kblt_level;
> +	bool kblt_restore;
> +	struct input_dev *keys;
> +};
> +
> +static int slim7x11_ec_command(struct slim7x11_ec *ec, u8 cmd, u8 arg0, u8 arg1,
> +			       u8 resp[SLIM7X11_EC_RESP_LEN])
> +{
> +	u8 req[SLIM7X11_EC_REQ_LEN] = { cmd, arg0, arg1 };
> +	int ret;
> +
> +	lockdep_assert_held(&ec->lock);
> +
> +	ret = i2c_smbus_write_i2c_block_data(ec->client, SLIM7X11_EC_BLOCK_WRITE,
> +					     sizeof(req), req);
> +	if (ret < 0)
> +		return ret;
> +
> +	usleep_range(2000, 3000);
> +
> +	ret = i2c_smbus_read_i2c_block_data(ec->client, SLIM7X11_EC_BLOCK_READ,
> +					    SLIM7X11_EC_RESP_LEN, resp);
> +	if (ret < 0)
> +		return ret;
> +	if (ret != SLIM7X11_EC_RESP_LEN)
> +		return -EIO;
> +
> +	return 0;
> +}
> +
> +static int slim7x11_ec_ram_read(struct slim7x11_ec *ec, u8 addr, u8 *val)
> +{
> +	u8 resp[SLIM7X11_EC_RESP_LEN];
> +	int ret;
> +
> +	ret = slim7x11_ec_command(ec, SLIM7X11_EC_CMD_RAM_READ, addr, 0, resp);
> +	if (ret)
> +		return ret;
> +
> +	*val = resp[0];
> +	return 0;
> +}
> +
> +static int slim7x11_ec_ram_write(struct slim7x11_ec *ec, u8 addr, u8 val)
> +{
> +	u8 resp[SLIM7X11_EC_RESP_LEN];
> +
> +	return slim7x11_ec_command(ec, SLIM7X11_EC_CMD_RAM_WRITE, addr, val, resp);
> +}
> +
> +static int slim7x11_ec_fan_read(struct slim7x11_ec *ec, long *rpm)
> +{
> +	u8 resp[SLIM7X11_EC_RESP_LEN];
> +	int ret;
> +
> +	ret = slim7x11_ec_command(ec, SLIM7X11_EC_CMD_FAN, SLIM7X11_EC_FAN_GET_SPEED, 0,
> +				  resp);
> +	if (ret)
> +		return ret;
> +
> +	*rpm = resp[0] * 100;
> +	return 0;
> +}
> +
> +static umode_t slim7x11_ec_is_visible(const void *drvdata,
> +				      enum hwmon_sensor_types type,
> +				      u32 attr, int channel)
> +{
> +	const struct slim7x11_ec *ec = drvdata;
> +
> +	switch (type) {
> +	case hwmon_temp:
> +		if (!(ec->temp_present & BIT(channel)))
> +			return 0;
> +		return 0444;
> +	case hwmon_fan:
> +		return 0444;
> +	default:
> +		return 0;
> +	}
> +}
> +
> +static int slim7x11_ec_read(struct device *dev, enum hwmon_sensor_types type,
> +			    u32 attr, int channel, long *val)
> +{
> +	struct slim7x11_ec *ec = dev_get_drvdata(dev);
> +	int ret;
> +	u8 raw;
> +
> +	guard(mutex)(&ec->lock);
> +
> +	switch (type) {
> +	case hwmon_temp:
> +		ret = slim7x11_ec_ram_read(ec, SLIM7X11_EC_TEMP_FIRST + channel, &raw);
> +		if (ret)
> +			return ret;
> +		if (!raw)
> +			return -ENODATA;
> +		if (raw > SLIM7X11_EC_TEMP_MAX)
> +			return -EIO;
> +		*val = raw * MILLIDEGREE_PER_DEGREE;
> +		return 0;
> +	case hwmon_fan:
> +		return slim7x11_ec_fan_read(ec, val);
> +	default:
> +		return -EOPNOTSUPP;
> +	}
> +}
> +
> +static const char * const slim7x11_ec_temp_labels[SLIM7X11_EC_NUM_TEMP] = {
> +	"Charger A",
> +	"CPU VR",
> +	"5V rail",
> +	"Ambient",
> +	"Charger B",
> +	"Thermistor 6",
> +};
> +
> +static int slim7x11_ec_read_string(struct device *dev, enum hwmon_sensor_types type,
> +				   u32 attr, int channel, const char **str)
> +{
> +	switch (type) {
> +	case hwmon_temp:
> +		*str = slim7x11_ec_temp_labels[channel];
> +		return 0;
> +	case hwmon_fan:
> +		*str = "CPU fan";
> +		return 0;
> +	default:
> +		return -EOPNOTSUPP;
> +	}
> +}
> +
> +static enum led_brightness slim7x11_ec_kbd_led_get(struct led_classdev *led)
> +{
> +	struct slim7x11_ec *ec = container_of(led, struct slim7x11_ec, kbd_led);
> +	u8 raw;
> +
> +	guard(mutex)(&ec->lock);
> +
> +	if (slim7x11_ec_ram_read(ec, SLIM7X11_EC_KBLT, &raw))
> +		return 0;
> +
> +	raw = FIELD_GET(SLIM7X11_EC_KBLT_LEVEL, raw);
> +
> +	if (raw == SLIM7X11_EC_KBLT_AUTO)
> +		return SLIM7X11_EC_KBLT_MAX;
> +
> +	return raw;
> +}
> +
> +static int slim7x11_ec_kbd_led_level(struct slim7x11_ec *ec, u8 level, u8 *old)
> +{
> +	u8 raw;
> +	int ret;
> +
> +	ret = slim7x11_ec_ram_read(ec, SLIM7X11_EC_KBLT, &raw);
> +	if (ret)
> +		return ret;
> +
> +	if (old)
> +		*old = FIELD_GET(SLIM7X11_EC_KBLT_LEVEL, raw);
> +
> +	FIELD_MODIFY(SLIM7X11_EC_KBLT_LEVEL, &raw, level);
> +
> +	return slim7x11_ec_ram_write(ec, SLIM7X11_EC_KBLT, raw);
> +}
> +
> +static int slim7x11_ec_kbd_led_set(struct led_classdev *led,
> +				   enum led_brightness brightness)
> +{
> +	struct slim7x11_ec *ec = container_of(led, struct slim7x11_ec, kbd_led);
> +
> +	guard(mutex)(&ec->lock);
> +
> +	return slim7x11_ec_kbd_led_level(ec, brightness, NULL);
> +}
> +
> +static const struct hwmon_ops slim7x11_ec_hwmon_ops = {
> +	.is_visible = slim7x11_ec_is_visible,
> +	.read = slim7x11_ec_read,
> +	.read_string = slim7x11_ec_read_string,
> +};
> +
> +static const struct hwmon_channel_info * const slim7x11_ec_hwmon_info[] = {
> +	HWMON_CHANNEL_INFO(temp,
> +			   HWMON_T_INPUT | HWMON_T_LABEL,
> +			   HWMON_T_INPUT | HWMON_T_LABEL,
> +			   HWMON_T_INPUT | HWMON_T_LABEL,
> +			   HWMON_T_INPUT | HWMON_T_LABEL,
> +			   HWMON_T_INPUT | HWMON_T_LABEL,
> +			   HWMON_T_INPUT | HWMON_T_LABEL),
> +	HWMON_CHANNEL_INFO(fan,
> +			   HWMON_F_INPUT | HWMON_F_LABEL),
> +	NULL
> +};
> +
> +static const struct hwmon_chip_info slim7x11_ec_chip_info = {
> +	.ops = &slim7x11_ec_hwmon_ops,
> +	.info = slim7x11_ec_hwmon_info,
> +};
> +
> +static int slim7x11_ec_fn_lock_toggle(struct slim7x11_ec *ec)
> +{
> +	u8 raw;
> +	int ret;
> +
> +	ret = slim7x11_ec_ram_read(ec, SLIM7X11_EC_SCUK, &raw);
> +	if (ret)
> +		return ret;
> +
> +	if (raw & SLIM7X11_EC_SCUK_MEDIA)
> +		raw &= ~SLIM7X11_EC_SCUK_MEDIA_MASK;
> +	else
> +		raw |= SLIM7X11_EC_SCUK_MEDIA_MASK;
> +
> +	return slim7x11_ec_ram_write(ec, SLIM7X11_EC_SCUK, raw);
> +}
> +
> +static void slim7x11_ec_report_key(struct slim7x11_ec *ec, unsigned int code)
> +{
> +	if (!ec->keys)
> +		return;
> +
> +	input_report_key(ec->keys, code, 1);
> +	input_sync(ec->keys);
> +	input_report_key(ec->keys, code, 0);
> +	input_sync(ec->keys);
> +}
> +
> +static irqreturn_t slim7x11_ec_irq(int irq, void *data)
> +{
> +	struct slim7x11_ec *ec = data;
> +	unsigned int i;
> +
> +	guard(mutex)(&ec->lock);
> +
> +	for (i = 0; i < SLIM7X11_EC_EVT_MAX_DRAIN; i++) {
> +		u8 resp[SLIM7X11_EC_RESP_LEN];
> +
> +		if (slim7x11_ec_command(ec, SLIM7X11_EC_CMD_EVENT, 0, 0, resp))
> +			break;
> +		if (!resp[0])
> +			break;
> +
> +		switch (resp[0]) {
> +		case SLIM7X11_EC_EVT_FN_LOCK:
> +			if (!slim7x11_ec_fn_lock_toggle(ec))
> +				sysfs_notify(&ec->client->dev.kobj, NULL, "fn_lock");
> +			break;
> +		case SLIM7X11_EC_EVT_MIC_MUTE:
> +			slim7x11_ec_report_key(ec, KEY_MICMUTE);
> +			break;
> +		case SLIM7X11_EC_EVT_FLIGHT_MODE:
> +			slim7x11_ec_report_key(ec, KEY_RFKILL);
> +			break;
> +		default:
> +			break;
> +		}
> +	}
> +
> +	return IRQ_HANDLED;
> +}
> +
> +static void slim7x11_ec_register_keys(struct slim7x11_ec *ec)
> +{
> +	struct device *dev = &ec->client->dev;
> +	struct input_dev *input;
> +	int ret;
> +
> +	input = devm_input_allocate_device(dev);
> +	if (!input) {
> +		dev_warn(dev, "no memory for the hotkey device\n");
> +		return;
> +	}
> +
> +	input->name = "Lenovo Yoga Slim 7x hotkeys";
> +	input->phys = "lenovo-yoga-slim7x-gen11-ec/input0";
> +	input->id.bustype = BUS_I2C;
> +	input_set_capability(input, EV_KEY, KEY_MICMUTE);
> +	input_set_capability(input, EV_KEY, KEY_RFKILL);
> +
> +	ret = input_register_device(input);
> +	if (ret) {
> +		dev_warn(dev, "cannot register the hotkey device: %d\n", ret);
> +		return;
> +	}
> +
> +	ec->keys = input;
> +}
> +
> +static ssize_t fn_lock_show(struct device *dev, struct device_attribute *attr,
> +			    char *buf)
> +{
> +	struct slim7x11_ec *ec = dev_get_drvdata(dev);
> +	u8 raw;
> +	int ret;
> +
> +	scoped_guard(mutex, &ec->lock)
> +		ret = slim7x11_ec_ram_read(ec, SLIM7X11_EC_SCUK, &raw);
> +
> +	if (ret)
> +		return ret;

Please put this inside scoped_guard(). There's little reason to do 
"optimization" like this at the cost of error handling clarity.

> +
> +	return sysfs_emit(buf, "%u\n", !(raw & SLIM7X11_EC_SCUK_MEDIA));
> +}
> +
> +static ssize_t fn_lock_store(struct device *dev, struct device_attribute *attr,
> +			     const char *buf, size_t count)
> +{
> +	struct slim7x11_ec *ec = dev_get_drvdata(dev);
> +	bool enable;
> +	u8 raw;
> +	int ret;
> +
> +	ret = kstrtobool(buf, &enable);
> +	if (ret)
> +		return ret;
> +
> +	guard(mutex)(&ec->lock);
> +
> +	ret = slim7x11_ec_ram_read(ec, SLIM7X11_EC_SCUK, &raw);
> +	if (ret)
> +		return ret;
> +
> +	if (enable)
> +		raw &= ~SLIM7X11_EC_SCUK_MEDIA_MASK;
> +	else
> +		raw |= SLIM7X11_EC_SCUK_MEDIA_MASK;
> +
> +	ret = slim7x11_ec_ram_write(ec, SLIM7X11_EC_SCUK, raw);
> +	if (ret)
> +		return ret;
> +
> +	return count;
> +}
> +static DEVICE_ATTR_RW(fn_lock);
> +
> +static struct attribute *slim7x11_ec_attrs[] = {
> +	&dev_attr_fn_lock.attr,
> +	NULL
> +};
> +ATTRIBUTE_GROUPS(slim7x11_ec);
> +
> +static int slim7x11_ec_probe(struct i2c_client *client)
> +{
> +	struct device *dev = &client->dev;
> +	struct device *hwmon;
> +	struct slim7x11_ec *ec;
> +	unsigned int i;
> +	int ret;
> +
> +	if (!i2c_check_functionality(client->adapter,
> +				     I2C_FUNC_SMBUS_I2C_BLOCK)) {

Use just one line?

> +		return dev_err_probe(dev, -ENODEV,
> +				     "adapter does not support SMBus block transfers\n");
> +	}
> +
> +	ec = devm_kzalloc(dev, sizeof(*ec), GFP_KERNEL);
> +	if (!ec)
> +		return -ENOMEM;
> +
> +	ec->client = client;
> +	i2c_set_clientdata(client, ec);
> +
> +	ret = devm_mutex_init(dev, &ec->lock);
> +	if (ret)
> +		return ret;
> +
> +	scoped_guard(mutex, &ec->lock) {
> +		for (i = 0; i < SLIM7X11_EC_NUM_TEMP; i++) {
> +			u8 raw;
> +
> +			ret = slim7x11_ec_ram_read(ec, SLIM7X11_EC_TEMP_FIRST + i,
> +						   &raw);

I don't know why this line in particular is split at this point, you have 
much longer code lines below.

It's generally okay to have code lines go up to 100 chars as long as one 
doesn't hide key logic to the very end of a line. Taking advantage of that 
is most useful to avoid breaking function calls with many args excessively 
and other boilerplatey stuff.

> +			if (ret) {
> +				return dev_err_probe(dev, ret,
> +						     "failed to read thermistor %u\n",
> +						     i);
> +			}
> +
> +			if (raw > 0 && raw <= SLIM7X11_EC_TEMP_MAX)
> +				ec->temp_present |= BIT(i);
> +		}
> +	}
> +
> +	if (!ec->temp_present) {
> +		return dev_err_probe(dev, -ENODEV,
> +				     "no thermistor reported a usable value\n");
> +	}
> +
> +	dev_dbg(dev, "thermistors present: %#lx\n", ec->temp_present);
> +
> +	hwmon = devm_hwmon_device_register_with_info(dev, "yoga_slim7x_ec", ec,
> +						     &slim7x11_ec_chip_info, NULL);
> +	if (IS_ERR(hwmon))
> +		return PTR_ERR(hwmon);
> +
> +	ec->kbd_led.name = "platform::kbd_backlight";
> +	ec->kbd_led.max_brightness = SLIM7X11_EC_KBLT_MAX;
> +	ec->kbd_led.brightness_get = slim7x11_ec_kbd_led_get;
> +	ec->kbd_led.brightness_set_blocking = slim7x11_ec_kbd_led_set;
> +
> +	ret = devm_led_classdev_register(dev, &ec->kbd_led);
> +	if (ret) {
> +		return dev_err_probe(dev, ret,
> +				     "failed to register keyboard backlight\n");

I don't get why you split this, you've a longer dev_err_probe() line 
below.

> +	}
> +
> +	if (client->irq) {
> +		slim7x11_ec_register_keys(ec);
> +
> +		ret = devm_request_threaded_irq(dev, client->irq, NULL,
> +						slim7x11_ec_irq, IRQF_ONESHOT,
> +						"lenovo-yoga-slim7x-gen11-ec", ec);
> +		if (ret)
> +			return dev_err_probe(dev, ret, "cannot request the EC interrupt\n");
> +
> +		scoped_guard(mutex, &ec->lock) {
> +			for (i = 0; i < SLIM7X11_EC_EVT_MAX_DRAIN; i++) {
> +				u8 resp[SLIM7X11_EC_RESP_LEN];
> +
> +				if (slim7x11_ec_command(ec, SLIM7X11_EC_CMD_EVENT, 0, 0, resp))
> +					break;
> +				if (!resp[0])
> +					break;
> +			}
> +		}
> +	}
> +
> +	return 0;
> +}
> +
> +static int slim7x11_ec_suspend(struct device *dev)
> +{
> +	struct slim7x11_ec *ec = dev_get_drvdata(dev);
> +
> +	guard(mutex)(&ec->lock);
> +	ec->kblt_restore = !slim7x11_ec_kbd_led_level(ec, 0, &ec->kblt_level);
> +
> +	return 0;
> +}
> +
> +static int slim7x11_ec_resume(struct device *dev)
> +{
> +	struct slim7x11_ec *ec = dev_get_drvdata(dev);
> +
> +	guard(mutex)(&ec->lock);
> +	if (ec->kblt_restore) {
> +		ec->kblt_restore = false;
> +		slim7x11_ec_kbd_led_level(ec, ec->kblt_level, NULL);
> +	}
> +
> +	return 0;
> +}
> +
> +static DEFINE_SIMPLE_DEV_PM_OPS(slim7x11_ec_pm_ops, slim7x11_ec_suspend, slim7x11_ec_resume);
> +
> +static const struct of_device_id slim7x11_ec_of_match[] = {
> +	{ .compatible = "lenovo,yoga-slim7x-gen11-ec" },
> +	{ }
> +};
> +MODULE_DEVICE_TABLE(of, slim7x11_ec_of_match);
> +
> +static const struct i2c_device_id slim7x11_ec_i2c_id[] = {
> +	{ "slim7x-gen11-ec" },
> +	{ }
> +};
> +MODULE_DEVICE_TABLE(i2c, slim7x11_ec_i2c_id);
> +
> +static struct i2c_driver slim7x11_ec_driver = {
> +	.driver = {
> +		.name = "lenovo-yoga-slim7x-gen11-ec",
> +		.of_match_table = slim7x11_ec_of_match,
> +		.dev_groups = slim7x11_ec_groups,
> +		.pm = pm_sleep_ptr(&slim7x11_ec_pm_ops),
> +	},
> +	.probe = slim7x11_ec_probe,
> +	.id_table = slim7x11_ec_i2c_id,
> +};
> +module_i2c_driver(slim7x11_ec_driver);
> +
> +MODULE_AUTHOR("Oleg Keri <okerixx@gmail.com>");
> +MODULE_DESCRIPTION("Lenovo Yoga Slim 7x Gen 11 embedded controller");
> +MODULE_LICENSE("GPL");
> 

-- 
 i.

