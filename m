Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D1C3A4A1E04;
	Wed, 14 Oct 2026 08:08:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791965343; cv=none; b=KXpSiliAkJsATDb2QGmO2O+srcvhMDASdLdkF7a2ydvCVpHd+G/nhD2oofCkR/gFXxhA500Hkjkk3m/M4T86QBrzOl9lTcYt5Sz+S7+hPz2yVIZj6h4n7zORDi05gWQ4iD3ZpHxKoSv34DwGhi/d8WnVPeRm0QfGZlR4YZYJD2w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791965343; c=relaxed/simple;
	bh=FMCnP/Bt6vWYrgRPyZ/1cUDHYAvHo+tWYI7paomheD8=;
	h=From:Date:To:cc:Subject:In-Reply-To:Message-ID:References:
	 MIME-Version:Content-Type; b=UJVOuXIQXeuoquwrc9rljlUqmrNbuMkPcTPPhAntQmKB3chpLhbIiY5F27lVNcOBc5FX5Eatfv8sE6sMaIxGFteauu71p/a8zv4tcyIIerXlRaECfWxx8WQ1E3/9qJD8AY0Z0lIIQswieM9u92lV0TyU0QrYyihwUNwD4e2fSqA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=PtDlEKC7; arc=none smtp.client-ip=192.198.163.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="PtDlEKC7"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1791965341; x=1823501341;
  h=from:date:to:cc:subject:in-reply-to:message-id:
   references:mime-version;
  bh=FMCnP/Bt6vWYrgRPyZ/1cUDHYAvHo+tWYI7paomheD8=;
  b=PtDlEKC7CJWTFt1bVrcLrGZcB0WqJKZ2PgNIHZlpdJZP1MumJpi7ncJU
   dxgvIpfYn9Gdr12jinrN7gBBBDADgGxrfJR82fQiWIytyce5UbtUkVXQI
   LFr1ORGg1YULCzTmOnoSF8gBtJSxnB0ByspxK6dTUHpOciuG2YoKNO1a+
   HfxycmDbhM3f4CJI2bILfTV0/bWt2++U4ULdhYGhduYCrpmkqCtuOg/wn
   S8iBQl6ho+LQH8s1Mei4xRbNk/FYm53X+zMjVz0OLnBs+lu/g7flRWG71
   PUpA2o4mx5jOx2j3a1oBJwLqIK9+Zz4iUfCr2RgahxdmTxvNX+wEpK9SE
   A==;
X-CSE-ConnectionGUID: 9hqU/sexTty17QykyF9DeA==
X-CSE-MsgGUID: 8bsp6C6aRamiqbcMJ3951w==
X-IronPort-AV: E=McAfee;i="6800,10657,11934"; a="715431"
X-IronPort-AV: E=Sophos;i="6.27,157,1787036400"; 
   d="scan'208";a="715431"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
  by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 Oct 2026 01:08:59 -0700
X-CSE-ConnectionGUID: b1YosQc3TdyCdwflI5hOUA==
X-CSE-MsgGUID: eJy5EuBFQ1C/HQLkJJILAw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,157,1787036400"; 
   d="scan'208";a="1444910"
Received: from ijarvine-mobl1.ger.corp.intel.com (HELO localhost) ([10.245.245.234])
  by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 Oct 2026 01:08:54 -0700
From: =?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>
Date: Wed, 14 Oct 2026 11:08:50 +0300 (EEST)
To: Birk Skyum <birk.skyum@pm.me>
cc: Anvesh Jain P <anvesh.p@oss.qualcomm.com>, 
    Sibi Sankar <sibi.sankar@oss.qualcomm.com>, 
    Hans de Goede <hansg@kernel.org>, 
    Bryan O'Donoghue <bryan.odonoghue@linaro.org>, 
    Guenter Roeck <linux@roeck-us.net>, Jonathan Corbet <corbet@lwn.net>, 
    Shuah Khan <skhan@linuxfoundation.org>, 
    Randy Dunlap <rdunlap@infradead.org>, Daniel J Blueman <daniel@quora.org>, 
    Maya Matuszczyk <maccraft123mc@gmail.com>, linux-arm-msm@vger.kernel.org, 
    platform-driver-x86@vger.kernel.org, linux-hwmon@vger.kernel.org, 
    linux-doc@vger.kernel.org, LKML <linux-kernel@vger.kernel.org>
Subject: Re: [RFC PATCH v2 1/2] platform: arm64: qcom-hamoa-ec: monitor Slim
 7x legacy sensors
In-Reply-To: <20260908135801.81436-2-birk.skyum@pm.me>
Message-ID: <847772fa-4b09-75e7-704d-eccaf35879da@linux.intel.com>
References: <20260908135801.81436-1-birk.skyum@pm.me> <20260908135801.81436-2-birk.skyum@pm.me>
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

On Tue, 8 Sep 2026, Birk Skyum wrote:

> The Yoga Slim 7x EC returns an all-zero response to the reference-board
> thermal capability command. Probe fails even though its legacy RPM and
> thermistor queries work and firmware controls the fan automatically.
> 
> Select a read-only path for the Lenovo compatible. Expose its first RPM
> channel and thermistor through hwmon, validating the transfer length and
> RPM payload count and treating the thermistor's 0xff sentinel as ENODATA.
> Do not enable SCI, register manual cooling controls or send standby
> commands on this path. Keep the reference-board behavior and strict
> capability validation unchanged.
> 
> The transactions are documented by the Yoga's FC22 and FC29/TZ39 DSDT
> methods and Maya Matuszczyk's EC protocol notes. Anvesh Jain P's pending
> fan-profile series also documents the RPM query. This change does not
> include its calibration, LUT programming or temperature reporting.
> 
> Link: https://github.com/aarch64-laptops/build/blob/2e58842f5fa2f87771c2df017ae4d8c65225ef10/misc/lenovo-yoga-slim-7x/acpi/dsdt.dsl
> Link: https://lkml.iu.edu/hypermail/linux/kernel/2607.3/08806.html
> Signed-off-by: Birk Skyum <birk.skyum@pm.me>
> ---
> Changes in v2:
> - Move the platform-driver documentation to the laptop-driver guide and
>   update its index and MAINTAINERS entry, following Guenter's review.
> - No driver code changes.
> 
>  Documentation/admin-guide/laptops/index.rst   |   1 +
>  Documentation/admin-guide/laptops/qcom-ec.rst |  40 +++++
>  MAINTAINERS                                   |   1 +
>  drivers/platform/arm64/Kconfig                |   4 +-
>  drivers/platform/arm64/qcom-hamoa-ec.c        | 153 +++++++++++++++++-
>  5 files changed, 194 insertions(+), 5 deletions(-)
>  create mode 100644 Documentation/admin-guide/laptops/qcom-ec.rst
> 
> diff --git a/Documentation/admin-guide/laptops/index.rst b/Documentation/admin-guide/laptops/index.rst
> index c0b911d05..44c9c7c08 100644
> --- a/Documentation/admin-guide/laptops/index.rst
> +++ b/Documentation/admin-guide/laptops/index.rst
> @@ -11,6 +11,7 @@ Laptop Drivers
>     asus-laptop
>     disk-shock-protection
>     lg-laptop
> +   qcom-ec
>     samsung-galaxybook
>     sony-laptop
>     sonypi
> diff --git a/Documentation/admin-guide/laptops/qcom-ec.rst b/Documentation/admin-guide/laptops/qcom-ec.rst
> new file mode 100644
> index 000000000..11f9f2347
> --- /dev/null
> +++ b/Documentation/admin-guide/laptops/qcom-ec.rst
> @@ -0,0 +1,40 @@
> +.. SPDX-License-Identifier: GPL-2.0-only
> +
> +Kernel driver qcom-hamoa-ec
> +==========================
> +
> +Supported systems:
> +
> +  * Lenovo Yoga Slim 7x (14Q8X9)
> +
> +    Prefix: 'qcom_ec'
> +
> +    I2C address: 0x76, instantiated from the device tree. No scanning.
> +
> +Description
> +-----------
> +
> +The Yoga Slim 7x embedded controller provides a fan speed channel and a
> +thermistor through a legacy interface. It does not provide the thermal
> +capability response used by the Qualcomm reference-board interface.
> +
> +On this system the driver only reads sensors. Cooling remains under firmware
> +control, including when the driver is unloaded. The driver does not change
> +fan curves, fan profiles, PWM settings, SCI events or EC standby state.
> +The exposed RPM channel does not establish the number of physical fans.
> +
> +The hwmon interface is selected by the ``lenovo,yoga-slim7x-ec`` compatible.
> +It is not exposed on Qualcomm reference boards by this driver.
> +
> +Sysfs attributes
> +----------------
> +
> +All attributes below are read-only.
> +
> +=============== ======================================================
> +fan1_input      Fan speed in RPM. Zero is valid when the fan is stopped.
> +temp1_input     EC thermistor temperature in millidegrees Celsius.
> +=============== ======================================================
> +
> +An unavailable thermistor reading returns ``ENODATA``. A malformed fan

Is this a temporary condition? If not, it should be hidden with 
.is_visible.

> +response or an incomplete bus transfer returns an error, not a zero speed.
> diff --git a/MAINTAINERS b/MAINTAINERS
> index 6215fcb07..c3c208602 100644
> --- a/MAINTAINERS
> +++ b/MAINTAINERS
> @@ -22440,6 +22440,7 @@ M:	Anvesh Jain P <anvesh.p@oss.qualcomm.com>
>  M:	Sibi Sankar <sibi.sankar@oss.qualcomm.com>
>  L:	linux-arm-msm@vger.kernel.org
>  S:	Maintained
> +F:	Documentation/admin-guide/laptops/qcom-ec.rst
>  F:	Documentation/devicetree/bindings/embedded-controller/qcom,hamoa-crd-ec.yaml
>  F:	drivers/platform/arm64/qcom-hamoa-ec.c
>  
> diff --git a/drivers/platform/arm64/Kconfig b/drivers/platform/arm64/Kconfig
> index e32e01b2a..4f338c715 100644
> --- a/drivers/platform/arm64/Kconfig
> +++ b/drivers/platform/arm64/Kconfig
> @@ -94,6 +94,7 @@ config EC_QCOM_HAMOA
>  	tristate "Embedded Controller driver for Qualcomm Hamoa/Glymur reference devices"
>  	depends on ARCH_QCOM || COMPILE_TEST
>  	depends on I2C
> +	depends on HWMON
>  	depends on THERMAL || THERMAL=n
>  	help
>  	  Say M or Y here to enable the Embedded Controller driver for Qualcomm
> @@ -101,6 +102,7 @@ config EC_QCOM_HAMOA
>  	  control, temperature sensors, access to EC state changes and supports
>  	  reporting suspend entry/exit to the EC.
>  
> -	  This driver currently supports Hamoa/Purwa/Glymur reference devices.
> +	  This driver supports Hamoa/Purwa/Glymur reference devices and read-only
> +	  fan speed and temperature monitoring on the Lenovo Yoga Slim 7x.
>  
>  endif # ARM64_PLATFORM_DEVICES
> diff --git a/drivers/platform/arm64/qcom-hamoa-ec.c b/drivers/platform/arm64/qcom-hamoa-ec.c
> index 4d2ad042a..3a4ca8a0d 100644
> --- a/drivers/platform/arm64/qcom-hamoa-ec.c
> +++ b/drivers/platform/arm64/qcom-hamoa-ec.c
> @@ -9,6 +9,7 @@
>  #include <linux/device.h>
>  #include <linux/dev_printk.h>
>  #include <linux/err.h>
> +#include <linux/hwmon.h>
>  #include <linux/i2c.h>
>  #include <linux/interrupt.h>
>  #include <linux/kernel.h>
> @@ -16,10 +17,13 @@
>  #include <linux/pm.h>
>  #include <linux/slab.h>
>  #include <linux/thermal.h>
> +#include <linux/unaligned.h>
>  
>  #define EC_SCI_EVT_READ_CMD	0x05
>  #define EC_FW_VERSION_CMD	0x0e
> +#define EC_FAN_RPM_QUERY_CMD	0x22
>  #define EC_MODERN_STANDBY_CMD	0x23
> +#define EC_THERMISTOR1_CMD	0x29
>  #define EC_FAN_DBG_CONTROL_CMD	0x30
>  #define EC_SCI_EVT_CONTROL_CMD	0x35
>  #define EC_THERMAL_CAP_CMD	0x42
> @@ -76,13 +80,126 @@ struct qcom_ec_cooling_dev {
>  	u8 state;
>  };
>  
> +struct qcom_ec_variant {
> +	bool monitor_only;
> +};
> +
>  struct qcom_ec {
> +	const struct qcom_ec_variant *variant;
>  	struct qcom_ec_cooling_dev *ec_cdev;
>  	struct qcom_ec_thermal_cap thermal_cap;
>  	struct qcom_ec_version version;
>  	struct i2c_client *client;
>  };
>  
> +/* FC22 in the Slim 7x DSDT: command, fan ID; count, little-endian RPM. */
> +static int qcom_ec_read_fan_rpm(struct qcom_ec *ec, long *val)
> +{
> +	struct i2c_client *client = ec->client;
> +	u8 request[] = { EC_FAN_RPM_QUERY_CMD, 1 };
> +	u8 response[3];
> +	struct i2c_msg messages[] = {
> +		{
> +			.addr = client->addr,
> +			.len = sizeof(request),
> +			.buf = request,
> +		}, {
> +			.addr = client->addr,
> +			.flags = I2C_M_RD,
> +			.len = sizeof(response),
> +			.buf = response,
> +		},
> +	};
> +	int ret;
> +
> +	ret = i2c_transfer(client->adapter, messages, ARRAY_SIZE(messages));
> +	if (ret < 0)
> +		return ret;
> +	if (ret != ARRAY_SIZE(messages))

Add include.

> +		return -EIO;
> +	if (response[0] != sizeof(response) - 1)
> +		return -EPROTO;
> +
> +	*val = get_unaligned_le16(&response[1]);

Please use proper endianness type. I think the way you currently do this 
would also trigger a warning in sparse's endianness checking.

> +
> +	return 0;
> +}
> +
> +static umode_t qcom_ec_hwmon_is_visible(const void *data, enum hwmon_sensor_types type,
> +					u32 attr, int channel)
> +{
> +	if (channel)
> +		return 0;
> +	if ((type == hwmon_fan && attr == hwmon_fan_input) ||
> +	    (type == hwmon_temp && attr == hwmon_temp_input))
> +		return 0444;
> +
> +	return 0;
> +}
> +
> +static int qcom_ec_hwmon_read(struct device *dev, enum hwmon_sensor_types type,
> +			      u32 attr, int channel, long *val)
> +{
> +	struct qcom_ec *ec = dev_get_drvdata(dev);
> +	int ret;
> +
> +	if (channel)
> +		return -EOPNOTSUPP;
> +
> +	if (type == hwmon_fan && attr == hwmon_fan_input)
> +		return qcom_ec_read_fan_rpm(ec, val);
> +
> +	if (type != hwmon_temp || attr != hwmon_temp_input)
> +		return -EOPNOTSUPP;
> +
> +	/* FC29/TZ39 report degrees Celsius, or 0xff if unavailable. */
> +	ret = i2c_smbus_read_byte_data(ec->client, EC_THERMISTOR1_CMD);
> +	if (ret < 0)
> +		return ret;
> +	if (ret == 0xff)
> +		return -ENODATA;
> +
> +	*val = ret * 1000;

You can probably replace that 1000 with a define from units.h. Don't 
forget to add also the include if you use something from there.

> +
> +	return 0;
> +}
> +
> +static const struct hwmon_ops qcom_ec_hwmon_ops = {
> +	.is_visible = qcom_ec_hwmon_is_visible,
> +	.read = qcom_ec_hwmon_read,
> +};
> +
> +static const struct hwmon_channel_info * const qcom_ec_hwmon_info[] = {
> +	HWMON_CHANNEL_INFO(fan, HWMON_F_INPUT),
> +	HWMON_CHANNEL_INFO(temp, HWMON_T_INPUT),
> +	NULL,
> +};
> +
> +static const struct hwmon_chip_info qcom_ec_hwmon_chip_info = {
> +	.ops = &qcom_ec_hwmon_ops,
> +	.info = qcom_ec_hwmon_info,
> +};
> +
> +static int qcom_ec_hwmon_probe(struct qcom_ec *ec)
> +{
> +	struct device *dev = &ec->client->dev;
> +	struct device *hwmon;
> +	long rpm;
> +	int ret;
> +
> +	if (!i2c_check_functionality(ec->client->adapter,
> +				     I2C_FUNC_I2C | I2C_FUNC_SMBUS_READ_BYTE_DATA))
> +		return -EOPNOTSUPP;
> +
> +	ret = qcom_ec_read_fan_rpm(ec, &rpm);
> +	if (ret)
> +		return dev_err_probe(dev, ret, "Failed to read fan RPM\n");
> +
> +	hwmon = devm_hwmon_device_register_with_info(dev, "qcom_ec", ec,
> +						     &qcom_ec_hwmon_chip_info, NULL);
> +	return PTR_ERR_OR_ZERO(hwmon);
> +}
> +
>  static int qcom_ec_read(struct qcom_ec *ec, u8 cmd, u8 resp_len, u8 *resp)
>  {
>  	int ret;
> @@ -331,6 +448,10 @@ static const struct thermal_cooling_device_ops qcom_ec_thermal_ops = {
>  static int qcom_ec_resume(struct device *dev)
>  {
>  	struct i2c_client *client = to_i2c_client(dev);
> +	struct qcom_ec *ec = i2c_get_clientdata(client);
> +
> +	if (ec->variant->monitor_only)
> +		return 0;
>  
>  	return i2c_smbus_write_byte_data(client, EC_MODERN_STANDBY_CMD,
>  					 EC_MODERN_STANDBY_EXIT);
> @@ -339,6 +460,10 @@ static int qcom_ec_resume(struct device *dev)
>  static int qcom_ec_suspend(struct device *dev)
>  {
>  	struct i2c_client *client = to_i2c_client(dev);
> +	struct qcom_ec *ec = i2c_get_clientdata(client);
> +
> +	if (ec->variant->monitor_only)
> +		return 0;
>  
>  	return i2c_smbus_write_byte_data(client, EC_MODERN_STANDBY_CMD,
>  					 EC_MODERN_STANDBY_ENTER);
> @@ -356,14 +481,24 @@ static int qcom_ec_probe(struct i2c_client *client)
>  		return -ENOMEM;
>  
>  	ec->client = client;
> +	ec->variant = i2c_get_match_data(client);
> +	if (!ec->variant)
> +		return -ENODEV;
> +	i2c_set_clientdata(client, ec);
> +
> +	/*
> +	 * The Slim 7x does not implement the reference-board capability command.
> +	 * Its firmware controls cooling autonomously. Only expose its legacy
> +	 * sensors; do not enable SCI, fan debug control or standby notifications.
> +	 */
> +	if (ec->variant->monitor_only)
> +		return qcom_ec_hwmon_probe(ec);
>  
>  	ret = devm_request_threaded_irq(dev, client->irq, NULL, qcom_ec_irq,
>  					IRQF_ONESHOT, "qcom_ec", ec);
>  	if (ret < 0)
>  		return ret;
>  
> -	i2c_set_clientdata(client, ec);
> -
>  	ret = qcom_ec_read_fw_version(dev);
>  	if (ret < 0)
>  		return dev_err_probe(dev, ret, "Failed to read EC firmware version\n");
> @@ -410,6 +545,9 @@ static void qcom_ec_remove(struct i2c_client *client)
>  	struct device *dev = &client->dev;
>  	int ret;
>  
> +	if (ec->variant->monitor_only)
> +		return;
> +
>  	ret = qcom_ec_sci_evt_control(dev, false);
>  	if (ret < 0)
>  		dev_err(dev, "Failed to disable SCI events: %d\n", ret);
> @@ -421,14 +559,21 @@ static void qcom_ec_remove(struct i2c_client *client)
>  	}
>  }
>  
> +static const struct qcom_ec_variant qcom_ec_reference = {};
> +
> +static const struct qcom_ec_variant qcom_ec_slim7x = {
> +	.monitor_only = true,
> +};
> +
>  static const struct of_device_id qcom_ec_of_match[] = {
> -	{ .compatible = "qcom,hamoa-crd-ec" },
> +	{ .compatible = "lenovo,yoga-slim7x-ec", .data = &qcom_ec_slim7x },
> +	{ .compatible = "qcom,hamoa-crd-ec", .data = &qcom_ec_reference },
>  	{}
>  };
>  MODULE_DEVICE_TABLE(of, qcom_ec_of_match);
>  
>  static const struct i2c_device_id qcom_ec_i2c_id_table[] = {
> -	{ "qcom-hamoa-ec", },
> +	{ "qcom-hamoa-ec", (kernel_ulong_t)&qcom_ec_reference },
>  	{}
>  };
>  MODULE_DEVICE_TABLE(i2c, qcom_ec_i2c_id_table);
> 

-- 
 i.

