Received: from mail-pf1-f174.google.com (mail-pf1-f174.google.com [209.85.210.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9EB393E16A8
	for <linux-hwmon@vger.kernel.org>; Sat, 16 May 2026 15:13:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778944425; cv=none; b=Fr5ZNpXTTM9GY9Jf3ySGsxQeTiDtOOlz4cxCWfHx8EZYsVb1esqo+SOOf+Yn7xFxdZ0NZlQLI5g8ASXpvyfUQnCPIJXVyiwn/LBVFJuBNiorp0uDInZybKR32C7Gl5I3rLPtNtv8KzyPn+uociuRIN3N8pjxUILso8eN31ETDaY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778944425; c=relaxed/simple;
	bh=x3q9X5rctzpPLLg+WEQqW83/payfJpridGsXjOe3umU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=QJ55CLYwfup9KF1VI4u9bSDkrQ9hUX1j5zbXCjzpueVpeKFgA1VyRLyC5x96+fTQvbsl6kibBBy0Sgx5VtesV79FKM0LYq25fuRpxdYGqLKRcx5br+e0llzjnQAGIK3EqkHwLQLH3xkCAp8+/JPYVX6/YoL+Pzw/00no5gYBzxY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=LJTLQ0SZ; arc=none smtp.client-ip=209.85.210.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="LJTLQ0SZ"
Received: by mail-pf1-f174.google.com with SMTP id d2e1a72fcca58-835b78c3797so361023b3a.2
        for <linux-hwmon@vger.kernel.org>; Sat, 16 May 2026 08:13:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1778944423; x=1779549223; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:sender:from:to:cc:subject:date:message-id
         :reply-to;
        bh=YVFycFVy8UBTwjNSOafscyPuCcY/dWfAyWqdQ/Z2H1Y=;
        b=LJTLQ0SZuWsFfqnxd7BruF9bCltEOMs9E80pjGh3FmDBC7+M7qVQFyx5/AxXVkTGJc
         6XEqJEmEWi80KOOQKx/0wSmhp/igu6hW2B7vVgfH9QLqfu7fZb3tXeX6yKNlb+7uxjiy
         rtbnFsvVGFzYunwr1tBw29NyHahCnuBAG40XBPDWJlWEPCxruZFUZa9aCv5jxJAkwbB0
         +29HkG+T5FW9boRmjHc9Bojb3yZjhn8GDzTFgp/X1vkewu3G3DuEYzClQhVXEMSdAl6V
         nrZFt4wvYh5LG1nmNgdT49GbVxviXCXw0Vb6Kc9EUi35fr8OZfueaWjXOkhGFhd5xVkl
         j8NQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778944423; x=1779549223;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:sender:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=YVFycFVy8UBTwjNSOafscyPuCcY/dWfAyWqdQ/Z2H1Y=;
        b=n/n+v2+SlGUFwtsFXq6RL/UviSy0D4YSTehhgdwJaPfDzKCj35HLJGaAWMHhmPhs9b
         z6vbshKSIN41rCXtCkXR40ZKPe/BCYaYTRYcl/SmPXTs7KO7h/4exZKKeIw7KcksJKYS
         j1zgke0eyLjAOqiaWhuJuedFXBKLiSXV0LrnTCc/b0qJRFYcRatL9DpYRW5a7sBzGax+
         4zlH6ZRhtxvLyWf7a9jvpA+2CnADJjDwyvRiHKmNgseKPObPBc5rdQGtnx5ovF35C4XP
         MTrVWo7yIVo/NxHV9LLC92gTM3BZRtkA60F1fdKSXLdWYRvvzXiuYH3GK7R3QH3nPOZ8
         e79g==
X-Forwarded-Encrypted: i=1; AFNElJ9YuZMHFT0AlC8HPiGkWd+7H4ogBpLeROcOzH89MAfJ2VfWGzlNq3DOv2Z2w4x7r+ulfRNifNBStBJGyA==@vger.kernel.org
X-Gm-Message-State: AOJu0YyLzkUVqNXFTBvR8rj+O/hp8matxnLo0MeAG0EujjOFLaXeobDt
	18mRThurUo8W5rQtNKwiNbYuzJBhNFx5XmLlq5KRylsVSknDm3Za1a0b
X-Gm-Gg: Acq92OG0AVkaVxAaANcnvoAZSo74Fq98ok2RrEVdZOkWpjYyr3efiaLjw3gVdNdpq1B
	7uIrcqKBvXG4vfjbGzpy+ftXbPB4SF5U6++b9+6dkhDXKKO3YI1ApwyNhOpQKFCxr/22YZO+qtL
	9LxKj/5+xOukK/QHNIXs3+LFwEa8BbfWJCJWwY4OQP8x1Gwnw1wzcrcNX7UqizXMQCY/VsS3Srf
	x8nUR+/vCZZeuvssHxetNv4Z4AL1v1R0cKuN2wWnit9iSMWao4WpwOFKBHSyIAE3bwfFtrPZZSL
	znYKb+64/AS4EOumvXY4u5nyAYMrfAghjACLk30Zkg7QJ2AaUhYqimE6OdgKWE5mlbEu1BTW3kG
	iYMGG6BzzP0qO7Hs/83Q+czF/pmk/D261HDvidQW4VftM0McDtrywbmrx+qU2AK6ljuRngv1Ofd
	KLfJEO4USp7Bebgjdi0EilOBwM3qP/1KV8SO+F
X-Received: by 2002:a05:6a00:1c81:b0:82c:eb46:acb9 with SMTP id d2e1a72fcca58-83f33d26a98mr8474307b3a.24.1778944422863;
        Sat, 16 May 2026 08:13:42 -0700 (PDT)
Received: from server.roeck-us.net ([2600:1700:e321:62f0:da43:aeff:fecc:bfd5])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-83f1977a570sm8762514b3a.20.2026.05.16.08.13.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 16 May 2026 08:13:42 -0700 (PDT)
Sender: Guenter Roeck <groeck7@gmail.com>
Date: Sat, 16 May 2026 08:13:41 -0700
From: Guenter Roeck <linux@roeck-us.net>
To: Abdurrahman Hussain <abdurrahman@nexthop.ai>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Jonathan Corbet <corbet@lwn.net>,
	Shuah Khan <skhan@linuxfoundation.org>, linux-hwmon@vger.kernel.org,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-doc@vger.kernel.org, kernel test robot <lkp@intel.com>
Subject: Re: [PATCH v4 2/2] hwmon: (pmbus/d1u74t) Add Murata D1U74T PSU driver
Message-ID: <5074e0b2-1276-4856-81f3-c2b79f567a6f@roeck-us.net>
References: <20260514-d1u74t-v4-0-1f1ee7b002ec@nexthop.ai>
 <20260514-d1u74t-v4-2-1f1ee7b002ec@nexthop.ai>
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260514-d1u74t-v4-2-1f1ee7b002ec@nexthop.ai>

On Thu, May 14, 2026 at 08:03:26PM -0700, Abdurrahman Hussain wrote:
> Add PMBUS driver for Murata D1U74T power supplies.
> 
> Reported-by: kernel test robot <lkp@intel.com>
> Closes: https://lore.kernel.org/oe-kbuild-all/202605122253.zInzmUeX-lkp@intel.com/
> Signed-off-by: Abdurrahman Hussain <abdurrahman@nexthop.ai>

Applied, after dropping the above Reported-by: and Closes: tags.
Those are inappropriate for new drivers.

I also added the missing include files.

Guenter

> ---
>  Documentation/hwmon/d1u74t.rst | 81 +++++++++++++++++++++++++++++++++++++++
>  Documentation/hwmon/index.rst  |  1 +
>  MAINTAINERS                    |  7 ++++
>  drivers/hwmon/pmbus/Kconfig    |  9 +++++
>  drivers/hwmon/pmbus/Makefile   |  1 +
>  drivers/hwmon/pmbus/d1u74t.c   | 86 ++++++++++++++++++++++++++++++++++++++++++
>  6 files changed, 185 insertions(+)
> 
> diff --git a/Documentation/hwmon/d1u74t.rst b/Documentation/hwmon/d1u74t.rst
> new file mode 100644
> index 000000000000..3a9eedbda483
> --- /dev/null
> +++ b/Documentation/hwmon/d1u74t.rst
> @@ -0,0 +1,81 @@
> +.. SPDX-License-Identifier: GPL-2.0-or-later
> +
> +Kernel driver d1u74t
> +====================
> +
> +Supported chips:
> +
> +  * Murata D1U74T
> +
> +    Prefix: 'd1u74t'
> +
> +    Addresses scanned: -
> +
> +    Datasheet: Publicly available at the Murata website
> +
> +Authors:
> +    Abdurrahman Hussain <abdurrahman@nexthop.ai>
> +
> +
> +Description
> +-----------
> +
> +This driver implements support for Murata D1U74T Power Supply with
> +PMBus support.
> +
> +The driver is a client driver to the core PMBus driver.
> +Please see Documentation/hwmon/pmbus.rst for details on PMBus client drivers.
> +
> +
> +Usage Notes
> +-----------
> +
> +This driver does not auto-detect devices. You will have to instantiate the
> +devices explicitly. Please see Documentation/i2c/instantiating-devices.rst for
> +details.
> +
> +
> +Sysfs entries
> +-------------
> +
> +======================= ======================================================
> +curr1_label		"iin"
> +curr1_input		Measured input current
> +curr1_alarm		Input current alarm
> +curr1_rated_max		Maximum rated input current
> +
> +curr2_label		"iout1"
> +curr2_input		Measured output current
> +curr2_max		Maximum output current
> +curr2_max_alarm		Output current high alarm
> +curr2_crit		Critical high output current
> +curr2_crit_alarm	Output current critical high alarm
> +curr2_rated_max		Maximum rated output current
> +
> +in1_label		"vin"
> +in1_input		Measured input voltage
> +in1_alarm		Input voltage alarm
> +in1_rated_min		Minimum rated input voltage
> +in1_rated_max		Maximum rated input voltage
> +
> +in2_label		"vout1"
> +in2_input		Measured output voltage
> +in2_alarm		Output voltage alarm
> +in2_rated_min		Minimum rated output voltage
> +in2_rated_max		Maximum rated output voltage
> +
> +power1_label		"pin"
> +power1_input		Measured input power
> +power1_alarm		Input power alarm
> +power1_rated_max	Maximum rated input power
> +
> +temp[1-3]_input		Measured temperature
> +temp[1-3]_max		Maximum temperature
> +temp[1-3]_max_alarm	Maximum temperature alarm
> +temp[1-3]_rated_max	Maximum rated temperature
> +
> +fan1_alarm		Fan 1 warning
> +fan1_fault		Fan 1 fault
> +fan1_input		Fan 1 speed in RPM
> +fan1_target		Fan 1 target
> +======================= ======================================================
> diff --git a/Documentation/hwmon/index.rst b/Documentation/hwmon/index.rst
> index 8b655e5d6b68..97b1ef65b1c1 100644
> --- a/Documentation/hwmon/index.rst
> +++ b/Documentation/hwmon/index.rst
> @@ -60,6 +60,7 @@ Hardware Monitoring Kernel Drivers
>     corsair-psu
>     cros_ec_hwmon
>     crps
> +   d1u74t
>     da9052
>     da9055
>     dell-smm-hwmon
> diff --git a/MAINTAINERS b/MAINTAINERS
> index b2040011a386..3106cf725dfc 100644
> --- a/MAINTAINERS
> +++ b/MAINTAINERS
> @@ -18249,6 +18249,13 @@ F:	drivers/mux/
>  F:	include/dt-bindings/mux/
>  F:	include/linux/mux/
>  
> +MURATA D1U74T PSU DRIVER
> +M:	Abdurrahman Hussain <abdurrahman@nexthop.ai>
> +L:	linux-hwmon@vger.kernel.org
> +S:	Maintained
> +F:	Documentation/hwmon/d1u74t.rst
> +F:	drivers/hwmon/pmbus/d1u74t.c
> +
>  MUSB MULTIPOINT HIGH SPEED DUAL-ROLE CONTROLLER
>  M:	Bin Liu <b-liu@ti.com>
>  L:	linux-usb@vger.kernel.org
> diff --git a/drivers/hwmon/pmbus/Kconfig b/drivers/hwmon/pmbus/Kconfig
> index 8f4bff375ecb..ee93b22d2887 100644
> --- a/drivers/hwmon/pmbus/Kconfig
> +++ b/drivers/hwmon/pmbus/Kconfig
> @@ -113,6 +113,15 @@ config SENSORS_CRPS
>  	  This driver can also be built as a module. If so, the module will
>  	  be called crps.
>  
> +config SENSORS_D1U74T
> +	tristate "Murata D1U74T Power Supply"
> +	help
> +	  If you say yes here you get hardware monitoring support for the Murata
> +	  D1U74T Power Supply.
> +
> +	  This driver can also be built as a module. If so, the module will
> +	  be called d1u74t.
> +
>  config SENSORS_DELTA_AHE50DC_FAN
>  	tristate "Delta AHE-50DC fan control module"
>  	help
> diff --git a/drivers/hwmon/pmbus/Makefile b/drivers/hwmon/pmbus/Makefile
> index 7129b62bc00f..8cf7d3075371 100644
> --- a/drivers/hwmon/pmbus/Makefile
> +++ b/drivers/hwmon/pmbus/Makefile
> @@ -76,3 +76,4 @@ obj-$(CONFIG_SENSORS_XDPE1A2G7B)	+= xdpe1a2g7b.o
>  obj-$(CONFIG_SENSORS_ZL6100)	+= zl6100.o
>  obj-$(CONFIG_SENSORS_PIM4328)	+= pim4328.o
>  obj-$(CONFIG_SENSORS_CRPS)	+= crps.o
> +obj-$(CONFIG_SENSORS_D1U74T)	+= d1u74t.o
> diff --git a/drivers/hwmon/pmbus/d1u74t.c b/drivers/hwmon/pmbus/d1u74t.c
> new file mode 100644
> index 000000000000..286ba492e336
> --- /dev/null
> +++ b/drivers/hwmon/pmbus/d1u74t.c
> @@ -0,0 +1,86 @@
> +// SPDX-License-Identifier: GPL-2.0-or-later
> +/*
> + * Copyright 2026 Nexthop Systems.
> + */
> +
> +#include <linux/i2c.h>
> +#include <linux/of.h>
> +#include <linux/pmbus.h>
> +
> +#include "pmbus.h"
> +
> +static const struct i2c_device_id d1u74t_id[] = {
> +	{ "d1u74t" },
> +	{},
> +};
> +MODULE_DEVICE_TABLE(i2c, d1u74t_id);
> +
> +static struct pmbus_driver_info d1u74t_info = {
> +	.pages = 1,
> +	/* PSU uses default linear data format. */
> +	.func[0] = PMBUS_HAVE_PIN | PMBUS_HAVE_IOUT | PMBUS_HAVE_STATUS_IOUT |
> +		   PMBUS_HAVE_IIN | PMBUS_HAVE_VIN | PMBUS_HAVE_STATUS_INPUT |
> +		   PMBUS_HAVE_VOUT | PMBUS_HAVE_STATUS_VOUT | PMBUS_HAVE_TEMP |
> +		   PMBUS_HAVE_TEMP2 | PMBUS_HAVE_TEMP3 |
> +		   PMBUS_HAVE_STATUS_TEMP | PMBUS_HAVE_FAN12 |
> +		   PMBUS_HAVE_STATUS_FAN12,
> +};
> +
> +static int d1u74t_probe(struct i2c_client *client)
> +{
> +	char buf[I2C_SMBUS_BLOCK_MAX + 2] = { 0 };
> +	struct device *dev = &client->dev;
> +	int rc;
> +
> +	rc = i2c_smbus_read_block_data(client, PMBUS_MFR_ID, buf);
> +	if (rc < 0)
> +		return dev_err_probe(dev, rc, "Failed to read PMBUS_MFR_ID\n");
> +
> +	if (rc != 9 || strncmp(buf, "Murata-PS", 9)) {
> +		buf[rc] = '\0';
> +		return dev_err_probe(dev, -ENODEV,
> +				     "Unsupported Manufacturer ID '%s'\n",
> +				     buf);
> +	}
> +
> +	rc = i2c_smbus_read_block_data(client, PMBUS_MFR_MODEL, buf);
> +	if (rc < 0)
> +		return dev_err_probe(dev, rc,
> +				     "Failed to read PMBUS_MFR_MODEL\n");
> +
> +	if (rc < 8 || strncmp(buf, "D1U74T-W", 8)) {
> +		buf[rc] = '\0';
> +		return dev_err_probe(dev, -ENODEV, "Model '%s' not supported\n",
> +				     buf);
> +	}
> +
> +	rc = pmbus_do_probe(client, &d1u74t_info);
> +	if (rc)
> +		return dev_err_probe(dev, rc, "Failed to probe\n");
> +
> +	return 0;
> +}
> +
> +static const struct of_device_id d1u74t_of_match[] = {
> +	{
> +		.compatible = "murata,d1u74t",
> +	},
> +	{},
> +};
> +MODULE_DEVICE_TABLE(of, d1u74t_of_match);
> +
> +static struct i2c_driver d1u74t_driver = {
> +	.driver = {
> +		.name = "d1u74t",
> +		.of_match_table = d1u74t_of_match,
> +	},
> +	.probe = d1u74t_probe,
> +	.id_table = d1u74t_id,
> +};
> +
> +module_i2c_driver(d1u74t_driver);
> +
> +MODULE_AUTHOR("Abdurrahman Hussain");
> +MODULE_DESCRIPTION("PMBus driver for Murata D1U74T-W power supplies");
> +MODULE_LICENSE("GPL");
> +MODULE_IMPORT_NS("PMBUS");
