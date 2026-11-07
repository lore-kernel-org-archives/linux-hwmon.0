Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=35.89.44.39
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794011794;
	b=oEyGdVr2AVpoDwQSWq4ivm/zpkW5tZAHKiWskMcjmqUk+axLo5b4g4RuPMFiXdFaaXtR
	 q7oHqMO/ivLysHfnfizKn8RoZvJeciY/F2P3eU3LJFQu0TSjeIqYS9nmVXkvWYj2/hBMJ
	 aYTvg9edbNflK/TrNuLSag4R44vddAzEWx82Jff5Pc78ceQU5GqzljGyBm1pI8XrOTZqd
	 CHwVasA7eh1OoWJe2K1/cPICjB3NaXcDCk1/sILPHNNuFUxpbQ15PkKk8MGwPAXIK0QTE
	 Dh+5PaIN6TpeS6OTap7hIb3SOQ5ZWX1KoPeRLw+Dr3lq96Rv4FrAV1s2uv+JaqHjZpA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794011794;
	h=DMARC-Filter:Received:Received:X-Authority-Analysis:DKIM-Signature:
	 Received:Message-ID:Date:MIME-Version:User-Agent:Subject:To:Cc:
	 References:Content-Language:From:Autocrypt:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:X-AntiAbuse:X-AntiAbuse:X-AntiAbuse:
	 X-AntiAbuse:X-AntiAbuse:X-BWhitelist:X-Source-IP:X-Source-L:X-Exim-ID:
	 X-Source:X-Source-Args:X-Source-Dir:X-Source-Sender:X-Source-Auth:
	 X-Email-Count:X-Org:X-Source-Cap:X-Local-Domain:X-CMAE-Envelope;
	bh=3HB4ez4k6B2fpBlALTpWaGbLQJuqyvpW9XKWXnAA4fo=;
	b=1Bwt4Kzs7WZIatar3cAH4UtaPBFH8BV3765TZVLx67Z6yqjcQacXRNePJOR/v/GJqHzO
	 t3Bavsy+Jyl9c1262YZFdbKzjqlEu3n/0teeRkF5UoSP4AShYE+JOYuSwCmEkup3AfYk9
	 vkd78Uhao8KADM0h2lRRKvqLDrd9LsrYlFg0VmGfI+A8XLiUNoNwErPBCPHXb/eyNmqQ/
	 mcNRLKavSZa1jRW6NdyaQrMY7cWmdprn/9ySGb9bQBhvcTvfaNzJTuk4Rp+0xBZVWi1vZ
	 BUPaIEpHF2ryIgR61nRQbYyFHOI/MkKwaTh6NGA9fCQH7uSiI6IN5urLUiyRtf6kPLQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=roeck-us.net;
	spf=fail smtp.mailfrom=roeck-us.net;
	dkim=pass header.d=roeck-us.net header.i=@roeck-us.net header.a=rsa-sha256 header.s=default header.b=unJi3bFK;
	arc=none smtp.remote-ip=35.89.44.39
Received: from omta40.uswest2.a.cloudfilter.net (omta40.uswest2.a.cloudfilter.net [35.89.44.39])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 429B2606A32C
	for <linux-hwmon@vger.kernel.org>; Sat,  7 Nov 2026 00:36:34 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 429B2606A32C
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=roeck-us.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=roeck-us.net header.i=@roeck-us.net header.a=rsa-sha256 header.s=default header.b=unJi3bFK
Received: from eig-obgw-6001b.ext.cloudfilter.net ([10.0.30.143])
	by cmsmtp with ESMTPS
	id PNaux2OUjyb4YPUPzxXCR7; Sat, 07 Nov 2026 00:36:27 +0000
Received: from 162-215-252-36.unifiedlayer.com ([208.91.199.152])
	by cmsmtp with ESMTPS
	id PUPzxQtkidRrRPUPzxZeiU; Sat, 07 Nov 2026 00:36:27 +0000
X-Authority-Analysis: v=2.4 cv=LOhmQIW9 c=1 sm=1 tr=0 ts=6aee728b
 a=QNED+QcLUkoL9qulTODnwA==:117 a=2cfIYNtKkjgZNaOwnGXpGw==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=M0FbrtG7MMAA:10 a=VwQbUJbxAAAA:8
 a=sxsOWaY6z2yf8vNyhW4A:9 a=QEXdDO2ut3YA:10 a=KPbNTLLc3YvdawN95zVk:22
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=roeck-us.net; s=default; h=Content-Transfer-Encoding:Content-Type:
	In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:Message-ID:Sender
	:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:
	List-Unsubscribe:List-Unsubscribe-Post:List-Subscribe:List-Post:List-Owner:
	List-Archive; bh=3HB4ez4k6B2fpBlALTpWaGbLQJuqyvpW9XKWXnAA4fo=; b=unJi3bFKBDZ3
	K8GnNw/ejD7ZzA91Iuy1QXX1jt/0H2HzJ1W0EmlkQrxvxAE3/gtCzC0Nx5u9YCjZFmhud/nOcSFBl
	3bQLqTB+aUWKkFpoC/kqrlix1dpOx4RnAtrMkpEuLgG4Gzm9MUvx69pYEGfPT3LyExN4ywIjVAO9+
	vJwB8Z8IEzxdR7RmFdA5/ghOKSnremKyS9fYPRGGR+7XPJEEb2jCeeWKMvwrPv1N3/ZDsogIYhqX2
	JSQ3aLQkhHT2iL7mfxm62Ee+9m94VwZCC5oMhHf8PApClRPvK0C4U9UGYGuhsw1vx/KOl5TZPuvd/
	nN/C8ft+voI8sk8+QbKosQ==;
Received: from 108-223-40-66.lightspeed.sntcca.sbcglobal.net ([108.223.40.66]:38972)
	by bh-25.webhostbox.net with esmtpsa  (TLS1.2) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.100.1)
	(envelope-from <linux@roeck-us.net>)
	id 1xPUPy-00000000MZP-37KK;
	Sat, 07 Nov 2026 06:06:26 +0530
Message-ID: <db51c24b-4b41-407b-a20a-b87ed7c0dbaa@roeck-us.net>
Date: Fri, 6 Nov 2026 16:36:25 -0800
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Post: <mailto:linux-hwmon@vger.kernel.org>
List-Help: <mailto:linux-hwmon+help@vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-hwmon+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] hwmon: Add driver for MSI Mystic Light controller voltage
 sensors
To: Tomasz Bojanowski <tomasz@bojanowski.me>
Cc: linux-hwmon@vger.kernel.org, Jonathan Corbet <corbet@lwn.net>,
 Shuah Khan <skhan@linuxfoundation.org>, Randy Dunlap
 <rdunlap@infradead.org>, linux-doc@vger.kernel.org,
 linux-kernel@vger.kernel.org
References: <20261106184357.27763-1-tomasz@bojanowski.me>
Content-Language: en-US
From: Guenter Roeck <linux@roeck-us.net>
Autocrypt: addr=linux@roeck-us.net; keydata=
 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
 np3900V20aS7eD9K8GTU0TGC1pyz6IVJwIE=
In-Reply-To: <20261106184357.27763-1-tomasz@bojanowski.me>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-AntiAbuse: This header was added to track abuse, please include it with any abuse report
X-AntiAbuse: Primary Hostname - bh-25.webhostbox.net
X-AntiAbuse: Original Domain - vger.kernel.org
X-AntiAbuse: Originator/Caller UID/GID - [47 12] / [47 12]
X-AntiAbuse: Sender Address Domain - roeck-us.net
X-BWhitelist: no
X-Source-IP: 108.223.40.66
X-Source-L: No
X-Exim-ID: 1xPUPy-00000000MZP-37KK
X-Source: 
X-Source-Args: 
X-Source-Dir: 
X-Source-Sender: 108-223-40-66.lightspeed.sntcca.sbcglobal.net [108.223.40.66]:38972
X-Source-Auth: guenter@roeck-us.net
X-Email-Count: 6
X-Org: HG=direseller_whb_net_legacy;ORG=directi;
X-Source-Cap: cm9lY2s7YWN0aXZzdG07YmgtMjUud2ViaG9zdGJveC5uZXQ=
X-Local-Domain: yes
X-CMAE-Envelope: MS4xfAMPNRMWlHzFCSi8sWkWc4MQSaGFvTOwilq8WBXMwF0CC7znaiqk8IehF/isuUWMoPAlqFgRN1DlLkreu9i4MuttH/u++YMn6ZKeJqQxEgo0PkKrBk57
 zUeCgxOmjQ+1UD9StVucoer6jdx/IxR0PE1uq7LInyDqnwPFtEnoO1PIVIZ+BFrtcZbx92+W5Zax6EME0BnI71vWLp8lxFYuL0DJcXL2PVkIxfTE8WI2pi3/

Hi,

On 11/6/26 10:43, Tomasz Bojanowski wrote:
> MSI 800-series motherboards have a USB microcontroller (0db0:0076) that
> drives the RGB LED headers. Besides the LEDs, it measures a few voltage
> rails that are not monitored by the Super I/O chip, and reports them in
> HID feature report 0xf0.
> 
> Add a driver that reads this report and exposes the rails as standard
> hwmon voltage attributes with labels. The values are cached for one
> second. The driver never writes to the device, and it starts the HID
> device with HID_CONNECT_HIDRAW, so user space tools that control the
> LEDs through hidraw keep working.
> 
> The rails and their position in the report depend on the motherboard,
> which is identified by the MSI board code at the start of the USB serial
> number. For now only the MAG B850M MORTAR WIFI (MS-7E61) is supported.
> On other boards the driver still binds to the device, so that hidraw
> remains available (hid-generic does not take a device that is listed in
> another driver's id_table), but it does not register a hwmon device.
> 
> The report layout was determined by analysing the vendor's Windows
> software and confirmed on hardware.
> 
> Tested on an MSI MAG B850M MORTAR WIFI (MS-7E61, BIOS 1.A68), with the
> driver built out of tree against kernel 7.2.15. The readings (CPU 1P8
> 1.79 V, CHIP Core 1.04 V, VDD MISC 1.10 V) are stable and plausible for
> the respective rails, repeated reads within one second are served from
> the cache, and hidraw access works while the driver is bound. Binding and
> unbinding the driver repeatedly hands the device back to hid-generic
> without errors.
> 
> Signed-off-by: Tomasz Bojanowski <tomasz@bojanowski.me>

Please address the issues reported by Sashiko.

Additional comments below.

Thanks,
Guenter

> ---
>   Documentation/hwmon/index.rst            |   1 +
>   Documentation/hwmon/msi_mystic_light.rst |  58 +++++
>   MAINTAINERS                              |   7 +
>   drivers/hwmon/Kconfig                    |  11 +
>   drivers/hwmon/Makefile                   |   1 +
>   drivers/hwmon/msi_mystic_light.c         | 291 +++++++++++++++++++++++
>   6 files changed, 369 insertions(+)
>   create mode 100644 Documentation/hwmon/msi_mystic_light.rst
>   create mode 100644 drivers/hwmon/msi_mystic_light.c
> 
> diff --git a/Documentation/hwmon/index.rst b/Documentation/hwmon/index.rst
> index a8ea421128b5..7ce1a6f42ddc 100644
> --- a/Documentation/hwmon/index.rst
> +++ b/Documentation/hwmon/index.rst
> @@ -213,6 +213,7 @@ Hardware Monitoring Kernel Drivers
>      mpq82d00
>      mpq8646
>      mpq8785
> +   msi_mystic_light
>      nct6683
>      nct6775
>      nct7363
> diff --git a/Documentation/hwmon/msi_mystic_light.rst b/Documentation/hwmon/msi_mystic_light.rst
> new file mode 100644
> index 000000000000..d58186b83ce8
> --- /dev/null
> +++ b/Documentation/hwmon/msi_mystic_light.rst
> @@ -0,0 +1,58 @@
> +.. SPDX-License-Identifier: GPL-2.0-or-later
> +
> +Kernel driver msi_mystic_light
> +==============================
> +
> +Supported devices:
> +
> +* MSI Mystic Light USB controller (USB ID 0db0:0076), found on MSI
> +  800-series motherboards
> +
> +  Voltage sensors are supported on:
> +
> +  - MSI MAG B850M MORTAR WIFI (MS-7E61)
> +
> +Author: Tomasz Bojanowski <tomasz@bojanowski.me>
> +
> +Description
> +-----------
> +
> +On MSI 800-series motherboards the RGB LED headers ("Mystic Light") are
> +driven by a microcontroller attached over USB. The controller also measures
> +a few voltage rails that are not monitored by the Super I/O chip (see
> +nct6683). This driver reports these voltages.
> +
> +Which rails are present, and where they are found in the sensor report,
> +depends on the motherboard. The board is identified by the MSI board code
> +at the start of the USB serial number (for example ``7E61``). On boards
> +without a known layout the driver binds to the device, but does not
> +register a hwmon device.

Using the USB serial number to detect the device seems fragile. If the
USB vendor/product ID can not be used for some reason, it might make
more sense to implement a DMI match.
> +
> +The driver only reads HID feature report 0xf0. It never writes to the
> +controller. The hidraw interface remains available, so user space tools
> +that control the LEDs keep working.
> +
> +Usage Notes
> +-----------
> +
> +The sensor values are cached for one second. A rail that reads 0 is
> +reported as unavailable (-ENODATA).

Also mentioned below - this should be detected during probe,
and unavailable sensors should not be enabled to start with.

> +
> +Sysfs entries
> +-------------
> +
> +=============== =========================================================
> +in[0-2]_input   Voltage in millivolts
> +in[0-2]_label   Rail name
> +=============== =========================================================
> +
> +MSI MAG B850M MORTAR WIFI (MS-7E61)
> +~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
> +
> +======= ========= ==========================
> +Channel Label     Typical value
> +======= ========= ==========================
> +in0     CPU 1P8   1.79 V
> +in1     CHIP Core 1.04 V
> +in2     VDD MISC  1.10 V
> +======= ========= ==========================
> diff --git a/MAINTAINERS b/MAINTAINERS
> index 873a8beb15b6..8f02d3f3c3f1 100644
> --- a/MAINTAINERS
> +++ b/MAINTAINERS
> @@ -19093,6 +19093,13 @@ L:	platform-driver-x86@vger.kernel.org
>   S:	Maintained
>   F:	drivers/platform/x86/msi-laptop.c
>   
> +MSI MYSTIC LIGHT HARDWARE MONITORING DRIVER
> +M:	Tomasz Bojanowski <tomasz@bojanowski.me>
> +L:	linux-hwmon@vger.kernel.org
> +S:	Maintained
> +F:	Documentation/hwmon/msi_mystic_light.rst
> +F:	drivers/hwmon/msi_mystic_light.c
> +
>   MSI WMI SUPPORT
>   L:	platform-driver-x86@vger.kernel.org
>   S:	Orphan
> diff --git a/drivers/hwmon/Kconfig b/drivers/hwmon/Kconfig
> index 3ae676a56d95..313f095e82ca 100644
> --- a/drivers/hwmon/Kconfig
> +++ b/drivers/hwmon/Kconfig
> @@ -1570,6 +1570,17 @@ config SENSORS_MR75203
>   	  This driver can also be built as a module. If so, the module
>   	  will be called mr75203.
>   
> +config SENSORS_MSI_MYSTIC_LIGHT
> +	tristate "MSI Mystic Light USB controller voltage sensors"
> +	depends on USB_HID
> +	help
> +	  If you say yes here you get support for the voltage sensors of the
> +	  MSI Mystic Light USB controller (0db0:0076) found on MSI 800-series
> +	  motherboards.
> +
> +	  This driver can also be built as a module. If so, the module
> +	  will be called msi_mystic_light.
> +
>   config SENSORS_ADCXX
>   	tristate "National Semiconductor ADCxxxSxxx"
>   	depends on SPI_MASTER
> diff --git a/drivers/hwmon/Makefile b/drivers/hwmon/Makefile
> index be3eb0992a0d..ec4b0de8cf47 100644
> --- a/drivers/hwmon/Makefile
> +++ b/drivers/hwmon/Makefile
> @@ -187,6 +187,7 @@ obj-$(CONFIG_SENSORS_MLXREG_FAN) += mlxreg-fan.o
>   obj-$(CONFIG_SENSORS_MENF21BMC_HWMON) += menf21bmc_hwmon.o
>   obj-$(CONFIG_SENSORS_MINISFORUM_UM780XTX) += minisforum-um780xtx.o
>   obj-$(CONFIG_SENSORS_MR75203)	+= mr75203.o
> +obj-$(CONFIG_SENSORS_MSI_MYSTIC_LIGHT) += msi_mystic_light.o
>   obj-$(CONFIG_SENSORS_NCT6683)	+= nct6683.o
>   obj-$(CONFIG_SENSORS_NCT6694)	+= nct6694-hwmon.o
>   obj-$(CONFIG_SENSORS_NCT6775_CORE) += nct6775-core.o
> diff --git a/drivers/hwmon/msi_mystic_light.c b/drivers/hwmon/msi_mystic_light.c
> new file mode 100644
> index 000000000000..39dde9d9e82d
> --- /dev/null
> +++ b/drivers/hwmon/msi_mystic_light.c
> @@ -0,0 +1,291 @@
> +// SPDX-License-Identifier: GPL-2.0-or-later
> +/*
> + * hwmon driver for the voltage sensors of the MSI Mystic Light USB
> + * controller (0db0:0076) found on MSI 800-series motherboards
> + *
> + * The microcontroller that drives the RGB LED headers of these boards also
> + * measures a few voltage rails that are not monitored by the Super I/O chip.
> + * They are returned in HID feature report 0xf0. This driver only reads that
> + * report and never sends anything else to the device. The hidraw interface
> + * is kept, so user space LED control keeps working.
> + *
> + * The rails and their position in the report depend on the motherboard.
> + * The board is identified by the MSI board code in the first four
> + * characters of the USB serial number, for example "7E61" for the
> + * MAG B850M MORTAR WIFI (MS-7E61). On boards without a known layout the
> + * driver binds to the device, but does not register a hwmon device.
> + *

Mentioned below again: This is unacceptable. If the device is not recognized,
the driver should not instantiate as dummy.

> + * Copyright (C) 2026 Tomasz Bojanowski <tomasz@bojanowski.me>
> + */
> +
> +#include <linux/hid.h>
> +#include <linux/hwmon.h>
> +#include <linux/jiffies.h>
> +#include <linux/module.h>
> +#include <linux/slab.h>
> +#include <linux/string.h>
> +#include <linux/unaligned.h>
> +
> +#define USB_VENDOR_ID_MSI_MB		0x0db0
> +#define USB_PRODUCT_ID_MYSTIC_LIGHT	0x0076
> +
> +#define MSI_ML_SENSOR_REPORT_ID		0xf0
> +#define MSI_ML_SENSOR_REPORT_SIZE	64
> +
> +/* Every sensor report starts with this header (after the report ID) */
> +#define MSI_ML_SENSOR_CMD_OFFSET	1
> +#define MSI_ML_SENSOR_CMD		0xa0
> +#define MSI_ML_SENSOR_PAGE_OFFSET	9
> +#define MSI_ML_SENSOR_PAGE_HI		0x01
> +#define MSI_ML_SENSOR_PAGE_LO		0xfc
> +
> +#define MSI_ML_BOARD_CODE_LEN		4
> +#define MSI_ML_MAX_IN			3
> +#define MSI_ML_CACHE_TIME		HZ
> +
> +struct msi_ml_board {
> +	const char *code;		/* MSI board code, start of USB serial */
> +	int num_in;
> +	const char *const *in_label;
> +	const u8 *in_offset;		/* little endian u16 in mV */
> +};
> +
> +/* MAG B850M MORTAR WIFI (MS-7E61) */
> +static const char *const msi_ml_7e61_in_label[] = {
> +	"CPU 1P8", "CHIP Core", "VDD MISC",
> +};
> +
> +static const u8 msi_ml_7e61_in_offset[] = { 23, 17, 25 };
> +
> +static const struct msi_ml_board msi_ml_boards[] = {
> +	{
> +		.code = "7E61",
> +		.num_in = ARRAY_SIZE(msi_ml_7e61_in_label),
> +		.in_label = msi_ml_7e61_in_label,
> +		.in_offset = msi_ml_7e61_in_offset,
> +	},

This will require additional per-board data. On MAG B650M
MORTAR WIFI (MS-7D76), the USB IDs are 1462:7d76, and
hid_hw_raw_request() with the parameters below returns
a length of 0 bytes. On MAG B650 TOMAHAWK WIFI (MS-7D75),
the USB device ID is 1462:7d75, and on MAG B550M MORTAR
(MS-7C94) it is 1462:7c94.

That makes me wonder if the parameters can be associated
with USB IDs.

>
> +
> +struct msi_ml_data {
> +	struct hid_device *hdev;
> +	struct device *hwmon_dev;
> +	const struct msi_ml_board *board;
> +	u8 *buf;			/* report buffer, must be DMA safe */
> +	u16 in[MSI_ML_MAX_IN];		/* mV, 0 = no reading */
> +	unsigned long updated;		/* jiffies */
> +	bool valid;
> +};
> +
> +static const struct msi_ml_board *msi_ml_find_board(struct hid_device *hdev)
> +{
> +	int i;
> +
> +	if (strnlen(hdev->uniq, sizeof(hdev->uniq)) < MSI_ML_BOARD_CODE_LEN)
> +		return NULL;
> +
> +	for (i = 0; i < ARRAY_SIZE(msi_ml_boards); i++) {
> +		if (!strncasecmp(hdev->uniq, msi_ml_boards[i].code,
> +				 MSI_ML_BOARD_CODE_LEN))
> +			return &msi_ml_boards[i];
> +	}
> +
> +	return NULL;
> +}
> +
> +/*
> + * Read the sensor report, at most once per MSI_ML_CACHE_TIME. Only called
> + * from the hwmon read callback, which the hwmon core serializes, so no
> + * additional locking is needed for the buffer and the cached values.
> + */
> +static int msi_ml_update(struct msi_ml_data *priv)
> +{
> +	const struct msi_ml_board *board = priv->board;
> +	u8 *buf = priv->buf;
> +	int i, ret;
> +
> +	if (priv->valid && time_before(jiffies, priv->updated + MSI_ML_CACHE_TIME))

priv->updated is not initialized in probe, meaning "time_before()" may
randomly return false (in addition to the issue reported by Sashiko).

> +		return 0;
> +
> +	memset(buf, 0, MSI_ML_SENSOR_REPORT_SIZE);
> +	buf[0] = MSI_ML_SENSOR_REPORT_ID;
> +
> +	ret = hid_hw_raw_request(priv->hdev, MSI_ML_SENSOR_REPORT_ID, buf,
> +				 MSI_ML_SENSOR_REPORT_SIZE, HID_FEATURE_REPORT,
> +				 HID_REQ_GET_REPORT);
> +	if (ret < 0)
> +		return ret;
> +	if (ret != MSI_ML_SENSOR_REPORT_SIZE)
> +		return -EPROTO;
> +
> +	if (buf[0] != MSI_ML_SENSOR_REPORT_ID ||
> +	    buf[MSI_ML_SENSOR_CMD_OFFSET] != MSI_ML_SENSOR_CMD ||
> +	    buf[MSI_ML_SENSOR_PAGE_OFFSET] != MSI_ML_SENSOR_PAGE_HI ||
> +	    buf[MSI_ML_SENSOR_PAGE_OFFSET + 1] != MSI_ML_SENSOR_PAGE_LO)
> +		return -EPROTO;

This is too late; it should be determiend during probe if the command
works.

> +
> +	for (i = 0; i < board->num_in; i++)
> +		priv->in[i] = get_unaligned_le16(buf + board->in_offset[i]);
> +
> +	priv->updated = jiffies;
> +	priv->valid = true;
> +
> +	return 0;
> +}
> +
> +static umode_t msi_ml_is_visible(const void *data,
> +				 enum hwmon_sensor_types type, u32 attr,
> +				 int channel)
> +{
> +	const struct msi_ml_data *priv = data;
> +
> +	if (type == hwmon_in && channel < priv->board->num_in)
> +		return 0444;
> +
> +	return 0;
> +}
> +
> +static int msi_ml_read(struct device *dev, enum hwmon_sensor_types type,
> +		       u32 attr, int channel, long *val)
> +{
> +	struct msi_ml_data *priv = dev_get_drvdata(dev);
> +	int ret;
> +
> +	ret = msi_ml_update(priv);
> +	if (ret)
> +		return ret;
> +
> +	/* A rail that reads 0 has no valid measurement */
> +	if (!priv->in[channel])
> +		return -ENODATA;

This is unacceptable. The probe function should determine which sensors
are supported, and unsupported sensors should not be enabled (return 0 in
is_visible).

> +
> +	*val = priv->in[channel];
> +
> +	return 0;
> +}
> +
> +static int msi_ml_read_string(struct device *dev, enum hwmon_sensor_types type,
> +			      u32 attr, int channel, const char **str)
> +{
> +	struct msi_ml_data *priv = dev_get_drvdata(dev);
> +
> +	*str = priv->board->in_label[channel];
> +
> +	return 0;
> +}
> +
> +static const struct hwmon_ops msi_ml_hwmon_ops = {
> +	.is_visible = msi_ml_is_visible,
> +	.read = msi_ml_read,
> +	.read_string = msi_ml_read_string,
> +};
> +
> +static const struct hwmon_channel_info *const msi_ml_info[] = {
> +	HWMON_CHANNEL_INFO(in,
> +			   HWMON_I_INPUT | HWMON_I_LABEL,
> +			   HWMON_I_INPUT | HWMON_I_LABEL,
> +			   HWMON_I_INPUT | HWMON_I_LABEL),
> +	NULL
> +};
> +
> +static const struct hwmon_chip_info msi_ml_chip_info = {
> +	.ops = &msi_ml_hwmon_ops,
> +	.info = msi_ml_info,
> +};
> +
> +static int msi_ml_probe(struct hid_device *hdev, const struct hid_device_id *id)
> +{
> +	struct msi_ml_data *priv;
> +	int ret;
> +
> +	priv = devm_kzalloc(&hdev->dev, sizeof(*priv), GFP_KERNEL);
> +	if (!priv)
> +		return -ENOMEM;
> +
> +	priv->buf = devm_kzalloc(&hdev->dev, MSI_ML_SENSOR_REPORT_SIZE, GFP_KERNEL);
> +	if (!priv->buf)
> +		return -ENOMEM;
> +
> +	priv->hdev = hdev;
> +	priv->board = msi_ml_find_board(hdev);
> +	hid_set_drvdata(hdev, priv);
> +
> +	ret = hid_parse(hdev);
> +	if (ret)
> +		return ret;
> +
> +	/* Keep the hidraw interface for user space LED control */
> +	ret = hid_hw_start(hdev, HID_CONNECT_HIDRAW);
> +	if (ret)
> +		return ret;
> +
> +	if (!priv->board) {
> +		hid_info(hdev, "no sensor layout for board code \"%.4s\"\n",
> +			 hdev->uniq);
> +		return 0;

This is unacceptable. If there are no sensors, the driver should not
instantiate.

> +	}
> +
> +	ret = hid_hw_open(hdev);
> +	if (ret)
> +		goto fail_stop;
> +
> +	priv->hwmon_dev = hwmon_device_register_with_info(&hdev->dev,
> +							  "msi_mystic_light",
> +							  priv,
> +							  &msi_ml_chip_info,
> +							  NULL);
> +	if (IS_ERR(priv->hwmon_dev)) {
> +		ret = PTR_ERR(priv->hwmon_dev);
> +		goto fail_close;
> +	}
> +
> +	return 0;
> +
> +fail_close:
> +	hid_hw_close(hdev);
> +fail_stop:
> +	hid_hw_stop(hdev);
> +	return ret;
> +}
> +
> +static void msi_ml_remove(struct hid_device *hdev)
> +{
> +	struct msi_ml_data *priv = hid_get_drvdata(hdev);
> +
> +	if (priv->board) {
> +		hwmon_device_unregister(priv->hwmon_dev);
> +		hid_hw_close(hdev);
> +	}
> +
> +	hid_hw_stop(hdev);
> +}
> +
> +static const struct hid_device_id msi_ml_table[] = {
> +	{ HID_USB_DEVICE(USB_VENDOR_ID_MSI_MB, USB_PRODUCT_ID_MYSTIC_LIGHT) },
> +	{ }
> +};
> +MODULE_DEVICE_TABLE(hid, msi_ml_table);
> +
> +static struct hid_driver msi_ml_driver = {
> +	.name = "msi_mystic_light",
> +	.id_table = msi_ml_table,
> +	.probe = msi_ml_probe,
> +	.remove = msi_ml_remove,
> +};
> +
> +static int __init msi_ml_init(void)
> +{
> +	return hid_register_driver(&msi_ml_driver);
> +}
> +
> +static void __exit msi_ml_exit(void)
> +{
> +	hid_unregister_driver(&msi_ml_driver);
> +}
> +
> +/* When built into the kernel, register after the HID bus is initialized */
> +late_initcall(msi_ml_init);
> +module_exit(msi_ml_exit);
> +
> +MODULE_LICENSE("GPL");
> +MODULE_AUTHOR("Tomasz Bojanowski <tomasz@bojanowski.me>");
> +MODULE_DESCRIPTION("Hwmon driver for MSI Mystic Light USB controller voltage sensors");
> 
> base-commit: 9926f611495c8f046caf5f8f46dbd4d401337550

