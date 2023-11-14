Received: from lindbergh.monkeyblade.net (lindbergh.monkeyblade.net [23.128.96.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B1ED67F7
	for <linux-hwmon@vger.kernel.org>; Tue, 14 Nov 2023 00:19:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b="csIa7d4c"
Received: from bombadil.infradead.org (bombadil.infradead.org [IPv6:2607:7c80:54:3::133])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C7F23D50;
	Mon, 13 Nov 2023 16:19:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=bombadil.20210309; h=Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Sender:Reply-To:Content-ID:Content-Description;
	bh=c4dbloWAyb5PiYa03KuHh0Xn4OO/WU/bs+5ocNLag9U=; b=csIa7d4cE+dWP7Y3BrceOT6cGz
	0fvAkpJ7VJ2LP7aXwn9lDGdMr09j7YEMKkOlQcVYBLy9yy5o0CGCfl68ccMFvLhIDxC32swTLPsu6
	BEbDX/EpOXIIXxeMHbAP8XsaJ4tHLgXicyOjHbY4aJqM+yK1OJxi2bqkdmqxssFwezM0MyWvFuPVJ
	/74+FKQglHrkQAPa673/R9KXFC3hhaTV/AmmfixkbNQ/PZpIhwB8+LJ3UvlPWeOxbKnCW5tzm7br8
	SygdYDugKN+spPiVcpZJfGQa0TEayLID+7MzBklJjdwuIlH7yCSEWdaQ1mzbtusN9uN3rTFdmV8SJ
	lHna01Zw==;
Received: from [50.53.46.231] (helo=[192.168.254.15])
	by bombadil.infradead.org with esmtpsa (Exim 4.96 #2 (Red Hat Linux))
	id 1r2h93-00EwlM-12;
	Tue, 14 Nov 2023 00:19:10 +0000
Message-ID: <605b729b-3507-4b19-a7a2-229eff2bd424@infradead.org>
Date: Mon, 13 Nov 2023 16:19:08 -0800
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v12] platform/x86: Add Silicom Platform Driver
Content-Language: en-US
To: Henry Shi <henryshi2018@gmail.com>, hbshi69@hotmail.com,
 tglx@linutronix.de, mingo@redhat.com, bp@alien8.de,
 dave.hansen@linux.intel.com, x86@kernel.org, hpa@zytor.com,
 hdegoede@redhat.com, markgross@kernel.org, jdelvare@suse.com,
 linux@roeck-us.net, linux-kernel@vger.kernel.org,
 platform-driver-x86@vger.kernel.org, linux-hwmon@vger.kernel.org
Cc: hb_shi2003@yahoo.com, henrys@silicom-usa.com, wenw@silicom-usa.com
References: <20231113210216.30237-1-henryshi2018@gmail.com>
From: Randy Dunlap <rdunlap@infradead.org>
In-Reply-To: <20231113210216.30237-1-henryshi2018@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit


Hi,
Please see comments inline.

On 11/13/23 13:02, Henry Shi wrote:
> platform/x86: Add Silicom Platform Driver
> 
> Add Silicom platform (silicom-platform) Linux driver for Swisscom
> Business Box (Swisscom BB) as well as Cordoba family products.
> 
> This platform driver provides support for various functions via
> the Linux LED framework, GPIO framework, Hardware Monitoring (HWMON)
> and device attributes.
> 
> Signed-off-by: Henry Shi <henryshi2018@gmail.com>
> ---
> 

[detailed changelog]

> change from patch v11 to v12
> ===========================================
> 
> Changes suggested by Ilpo Järvinen <ilpo.jarvinen@linux.intel.com>:
> Several editorial things:
> .Put the subdir headers separately.
> .Add more new line in define section.
> .Use () around all macro arguments to be on the safe side.
> .Add new line and remove comment in function silicom_mec_port_get().
> .Add new line and remove comment in function silicom_mec_port_set().
> .Remove unnecessary comment in function temp_get(), rpm_get().
> 
>  .../ABI/testing/sysfs-platform-silicom        |  262 +++++
>  drivers/platform/x86/Kconfig                  |   14 +
>  drivers/platform/x86/Makefile                 |    3 +
>  drivers/platform/x86/silicom-platform.c       | 1010 +++++++++++++++++
>  4 files changed, 1289 insertions(+)
>  create mode 100644 Documentation/ABI/testing/sysfs-platform-silicom
>  create mode 100644 drivers/platform/x86/silicom-platform.c
> 
> diff --git a/Documentation/ABI/testing/sysfs-platform-silicom b/Documentation/ABI/testing/sysfs-platform-silicom
> new file mode 100644
> index 000000000000..90d69f0f14c1
> --- /dev/null
> +++ b/Documentation/ABI/testing/sysfs-platform-silicom
> @@ -0,0 +1,262 @@
> +What:		/sys/devices/platform/silicom-platform/uc_version
> +Date:		October 2023
> +KernelVersion:	6.6
> +Contact:	Henry Shi <henrys@silicom-usa.com>
> +Description:
> +		This file allows to read microcontroller firmware
> +		version of current platform.
> +
> +What:		/sys/devices/platform/silicom-platform/power_cycle
> +Date:		October 2023
> +KernelVersion:	6.6
> +Contact:	Henry Shi <henrys@silicom-usa.com>
> +		This file allow user to power cycle the platform.
> +		default value is 0; when set to 1, it powers down

		Default

> +		the platform, wait 5 seconds, then power on the

		                                   powers

> +		device.
> +
> +What:		/sys/devices/platform/silicom-platform/efuse_status
> +Date:		October 2023
> +KernelVersion:	6.6
> +Contact:	Henry Shi <henrys@silicom-usa.com>
> +Description:
> +		This file is read only. It returns the current
> +		OTP status:
> +
> +		0 - not programmed.
> +		1 - programmed.
> +
> +What:		/sys/devices/platform/silicom-platform/hwmon/hwmon1/temp1_input
> +Date:		October 2023
> +KernelVersion:	6.6
> +Contact:	Henry Shi <henrys@silicom-usa.com>
> +Description:
> +		This file is read only. It returns the temperature
> +		of device.

on what scale? in what units?

> +
> +What:		/sys/devices/platform/silicom-platform/hwmon/hwmon1/temp1_label
> +Date:		October 2023
> +KernelVersion:	6.6
> +Contact:	Henry Shi <henrys@silicom-usa.com>
> +Description:
> +		This file is read only. It returns "Silicom_platform:
> +		Thermostat Sensor".
> +
> +What:		/sys/devices/platform/silicom-platform/hwmon/hwmon1/fan1_input
> +Date:		October 2023
> +KernelVersion:	6.6
> +Contact:	Henry Shi <henrys@silicom-usa.com>
> +Description:
> +		This file is read only. It returns current fan
> +		speed (RPM).
> +
> +What:		/sys/devices/platform/silicom-platform/hwmon/hwmon1/fan1_label
> +Date:		October 2023
> +KernelVersion:	6.6
> +Contact:	Henry Shi <henrys@silicom-usa.com>
> +Description:
> +		This file is read only. It returns "Silicom_platform:
> +		Fan Speed".
> +
> +What:		/sys/class/leds/multicolor:sys/brightness
> +Date:		October 2023
> +KernelVersion:	6.6
> +Contact:	Henry Shi <henrys@silicom-usa.com>
> +Description:
> +		This is a read/write file. It is used to read/set current
> +		status of system LED brightness:
> +
> +		0 - to turn off the LED
> +		1 - to turn on the LED
> +
> +What:		/sys/class/leds/multicolor:sys/multi_index
> +Date:		October 2023
> +KernelVersion:	6.6
> +Contact:	Henry Shi <henrys@silicom-usa.com>
> +Description:
> +		This is a read only  file. It returns:
> +
> +		white amber red
> +
> +What:		/sys/class/leds/multicolor:sys/multi_intensity
> +Date:		October 2023
> +KernelVersion:	6.6
> +Contact:	Henry Shi <henrys@silicom-usa.com>
> +Description:
> +		This is a read/write file. It is used to read/set current
> +		multi-color intensity of system LED: First value for
> +		color white; Second value for color amber and third value

		color white,

> +		for color red:
> +
> +		0 - The color is turned off.
> +		1 - the color is turned on.
> +
> +What:		/sys/class/leds/multicolor:wan/brightness
> +Date:		October 2023
> +KernelVersion:	6.6
> +Contact:	Henry Shi <henrys@silicom-usa.com>
> +Description:
> +		This is a read/write file. It is used to read/set current
> +		status of WAN LED brightness:
> +
> +		0 - to turn off the LED
> +		1 - to turn on the LED
> +
> +What:		/sys/class/leds/multicolor:wan/multi_index
> +Date:		October 2023
> +KernelVersion:	6.6
> +Contact:	Henry Shi <henrys@silicom-usa.com>
> +Description:
> +		This is a read only file. It returns:
> +
> +		white yellow red
> +
> +What:		/sys/class/leds/multicolor:wan/multi_intensity
> +Date:		October 2023
> +KernelVersion:	6.6
> +Contact:	Henry Shi <henrys@silicom-usa.com>
> +Description:
> +		This is a read/write file. It is used to read/set current
> +		multi-color intensity of WAN LED: First value for
> +		color white; Second value for color yellow and third value

		color white,

> +		for color red:
> +
> +		0 - The color is turned off.
> +		1 - the color is turned on.
> +
> +What:		/sys/class/leds/multicolor:stat%d/brightness
> +Date:		October 2023
> +KernelVersion:	6.6
> +Contact:	Henry Shi <henrys@silicom-usa.com>
> +Description:
> +		This is a read/write file. It is used to read/set current
> +		status of device status LED (number %d) brightness:
> +
> +		0 - to turn off the LED
> +		1 - to turn on the LED
> +
> +What:		/sys/class/leds/multicolor:stat%d/multi_index
> +Date:		October 2023
> +KernelVersion:	6.6
> +Contact:	Henry Shi <henrys@silicom-usa.com>
> +Description:
> +		This is a read only file. It returns:
> +
> +		red green blue yellow
> +
> +What:		/sys/class/leds/multicolor:stat%d/multi_intensity
> +Date:		October 2023
> +KernelVersion:	6.6
> +Contact:	Henry Shi <henrys@silicom-usa.com>
> +Description:
> +		This is a read/write file. It is used to read/set current
> +		multi-color intensity of device status LED (number %d):
> +		First value for color red; Second value for color green;
> +		Third value for color blue and fourth value for color
> +		yellow.
> +
> +		0 - The color is turned off.
> +		1 - the color is turned on.
> +
> +What:		/sys/class/leds/multicolor:fp_left/brightness
> +Date:		October 2023
> +KernelVersion:	6.6
> +Contact:	Henry Shi <henrys@silicom-usa.com>
> +Description:
> +		This is a read/write file. It is used to read/set current
> +		status of left LED brightness:
> +
> +		0 - to turn off the LED
> +		1 - to turn on the LED
> +
> +What:		/sys/class/leds/multicolor:fp_left/multi_index
> +Date:		October 2023
> +KernelVersion:	6.6
> +Contact:	Henry Shi <henrys@silicom-usa.com>
> +Description:
> +		This is a read only  file. It returns:

	Drop one space           ^^^^^^^^

> +
> +		red green blue amber
> +

[]


> diff --git a/drivers/platform/x86/silicom-platform.c b/drivers/platform/x86/silicom-platform.c
> new file mode 100644
> index 000000000000..659fce6584f0
> --- /dev/null
> +++ b/drivers/platform/x86/silicom-platform.c
> @@ -0,0 +1,1010 @@
> +// SPDX-License-Identifier: GPL-2.0+
> +//
> +// silicom-platform.c - Silicom MEC170x platform driver
> +//
> +// Copyright (C) 2023 Henry Shi <henrys@silicom-usa.com>
> +#include <linux/bitfield.h>
> +#include <linux/bits.h>
> +#include <linux/dmi.h>
> +#include <linux/hwmon.h>
> +#include <linux/init.h>
> +#include <linux/ioport.h>
> +#include <linux/io.h>
> +#include <linux/kernel.h>
> +#include <linux/kobject.h>
> +#include <linux/led-class-multicolor.h>
> +#include <linux/module.h>
> +#include <linux/mutex.h>
> +#include <linux/platform_device.h>
> +#include <linux/string.h>
> +#include <linux/sysfs.h>
> +#include <linux/units.h>
> +
> +#include <linux/gpio/driver.h>
> +
> +#define MEC_POWER_CYCLE_ADDR 0x24
> +#define MEC_EFUSE_LSB_ADDR   0x28
> +#define MEC_GPIO_IN_POS      0x08
> +#define MEC_IO_BASE          0x0800
> +#define MEC_IO_LEN           0x8
> +#define IO_REG_BANK          0x0
> +#define DEFAULT_CHAN_LO      0
> +#define DEFAULT_CHAN_HI      0
> +#define DEFAULT_CHAN_LO_T    0xc
> +#define MEC_ADDR             ((MEC_IO_BASE) + 0x02)

Extra parens around MEC_IO_BASE are not needed.

[]

> +
> +#define EC_ADDR_MSB           ((MEC_IO_BASE) + 0x3)

Ditto.

> +#define MEC_DATA_OFFSET(offset) ((MEC_IO_BASE) + 0x04 + offset)

Ditto.

[]

> +static void silicom_mec_led_mc_brightness_set(struct led_classdev *led_cdev,
> +					      enum led_brightness brightness)
> +{
> +	struct led_classdev_mc *mc_cdev = lcdev_to_mccdev(led_cdev);
> +	int i;
> +
> +	led_mc_calc_color_components(mc_cdev, brightness);
> +	for (i = 0; i < mc_cdev->num_colors; i++) {
> +		silicom_mec_port_set(mc_cdev->subled_info[i].channel,
> +		mc_cdev->subled_info[i].brightness);

Add more indentation on the line above.

> +	}
> +}

[]

-- 
~Randy
