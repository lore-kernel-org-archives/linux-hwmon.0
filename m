Received: from mail-dl1-f48.google.com (mail-dl1-f48.google.com [74.125.82.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 90AE81A681C
	for <linux-hwmon@vger.kernel.org>; Fri, 13 Mar 2026 17:00:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.82.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773421202; cv=none; b=aeE40h69u9VBhJcdqVilJUqJopobAwu3uBVGLqMqz3Yf0I8vaXV+PkybLk6QH/xfSDOiL11YuSWfNj88YZ4SuTmIR3ushnj3BwbCba7ofVHEiNf8LbiWTJIO6hMenh0dhvbAE/jd46jhEF9zlAdsSiuQYYHny7JKI1q9H4VE9TI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773421202; c=relaxed/simple;
	bh=FPBFWskJ9n7GZD6qAYtx8kqdi4761Y1nUzdq+/x2c6Y=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=VErVIWAwMDXQzV2WhWtfmZQ5bhjKXUW/oLrb9rkOEhVArnDHwbCHfVfmV4wFCTGdZrETXGRp0HmMcq+7Uh+iVWvxogV9VMwr64hx4N3ipPHOwek883u8/G3B34D8bpmJGSmD6/yXIuoJreaj1yxhPLXRIoby45QbbAwA6eZ7dyw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=iQNBZxPl; arc=none smtp.client-ip=74.125.82.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="iQNBZxPl"
Received: by mail-dl1-f48.google.com with SMTP id a92af1059eb24-12732e6a123so3558837c88.1
        for <linux-hwmon@vger.kernel.org>; Fri, 13 Mar 2026 10:00:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1773421200; x=1774026000; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:sender:from:to:cc:subject:date:message-id
         :reply-to;
        bh=5RN6Ntirzf2Txa/fas5351/ubAiEYhe6jAIGRKYutm0=;
        b=iQNBZxPlE1Wt9bN0+H/Xgbp9EW6MCZ5VB5/GqUl2+BEB78MBOftzrAcGhwer+D93QT
         nUnDsTbryW1BWB221qzAl38bduVPYzaCJKqqqRzANtUW7M/G2Kx0j2gkzgCnOvD2EZPY
         mSQMiLs/finBEYWHHtyPC5Jq9dfEQtQQlD+SvCWNHoFmGxaz5VN3aMkYGOE7+N83oOFN
         Yb3FXT2vsj7oJBHrHdl5CxbzrU1nMZ7PWix6IhejCmSN2L3OomjIaGqqdPksV0/FCfho
         KBMUv7nYGqz93w9aIkZucBdrj0IaWBYFKgzn0vzzBkXp78FviHuAZm4VVAvwCkNH0tLc
         9VGw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1773421200; x=1774026000;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:sender:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=5RN6Ntirzf2Txa/fas5351/ubAiEYhe6jAIGRKYutm0=;
        b=Npg6ZIyvOxmZ1OKDrRwaio/45df6lNtx/ppBGXvN+L+vH5NKon2vW8/6ppclBCCUmM
         wcc96uRIf9isZ3+iWQNPc+Lc4w46HpT+YSh1P7rK2tl9vLdJ/lz+uxy+c5Gztwh7i9t0
         NrB7iu0ahUiBiZBptPnBA/Km5ajJzY4Q0VLuY/7K+zMbJsUgV4LNuIDw+jqMjwXo+bC5
         vs/N/pa5V3GFqGsHJHZQuBubQ0G1ufDVgyhh2WUaT0TjIGbuhMy6S0TZ53xYPEHwWEsY
         xfowhql4/T8yoFGhSdGvi4ZhUROMPy8TeHCA5t8zKfPbzfZ6kAEH3VQ+L2ydT1gqP6S1
         jbEg==
X-Forwarded-Encrypted: i=1; AJvYcCWkdIXWyzOoYnYBR3/eeDjo5Qsu9UFWWukcqvLeoDfqsCbbIDgKtaKAx/j2LgBptc1qLIDisobmiU/wKw==@vger.kernel.org
X-Gm-Message-State: AOJu0Yy6dwoDlCOt4jVFcz6VmjqJtIDjnupMYKMzUVhtr21kGo9BI01T
	zBoGuA+jrrU+7YeqHe0zZVXpUcv7SmpUQ3ZjRBpzfXZuv/iFF+cOIXaB
X-Gm-Gg: ATEYQzxvV0tW/7kpVNsDnK1BA3cbEv/v/S6+WaGpAGkdK3ARMtqoOuejVJXAqq8WgSF
	86tt/yo2ETOw43FCxSP7z2VSzDt57mrrXnmDpi2fiSvND6CmQZv/iIm3OiDV6kaBrixkUtw2QYK
	04jh30LLrdA9vlFJl6ofCoyKO3in4vpK0I8j04kwsF1vt+bg4HspmyhIxKArnBT77qJJpMMKKj/
	YhuHaTPyTE8w8QNN+mtsG2QuxFhJlMekhEfNyoYS3DBonJkd+F9/VVnbUP+Q4BvSM8UUztxOvLA
	nocEVus7ZPEll0dD1CHQdb0B0nns6DMnWMyXrzjX3yxStcFY0WylSn9UPcncn2T6AD/kB0Wiqrk
	jyjetoHQXljuIUheXvXP3AcOqiktisR2drZ4Yp+6okNENuih2J0Pc93xgmNobxSS7cF+ynxGUfi
	pvKsT5KE3I/I4btl+j5ICnTm3hdxcFAH9hMdPS
X-Received: by 2002:a05:7301:9bcb:b0:2bd:d3f3:b0be with SMTP id 5a478bee46e88-2bea554b83dmr2143707eec.20.1773421199595;
        Fri, 13 Mar 2026 09:59:59 -0700 (PDT)
Received: from server.roeck-us.net ([2600:1700:e321:62f0:da43:aeff:fecc:bfd5])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-2beb6f3306bsm637399eec.16.2026.03.13.09.59.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 13 Mar 2026 09:59:58 -0700 (PDT)
Sender: Guenter Roeck <groeck7@gmail.com>
Date: Fri, 13 Mar 2026 09:59:56 -0700
From: Guenter Roeck <linux@roeck-us.net>
To: Aureo Serrano de Souza <aureo.serrano@arctic.de>
Cc: Thomas =?iso-8859-1?Q?Wei=DFschuh?= <linux@weissschuh.net>,
	linux-hwmon@vger.kernel.org, Jonathan Corbet <corbet@lwn.net>,
	Shuah Khan <skhan@linuxfoundation.org>, linux-doc@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2] hwmon: add driver for ARCTIC Fan Controller
Message-ID: <60ba4d74-5145-4996-a26d-b883ea67dcc9@roeck-us.net>
References: <c6d6c506-1407-4676-b730-f9fff595bb75@roeck-us.net>
 <20260313111955.36811-1-aureo.serrano@arctic.de>
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260313111955.36811-1-aureo.serrano@arctic.de>

On Fri, Mar 13, 2026 at 07:19:55PM +0800, Aureo Serrano de Souza wrote:
> Add hwmon driver for the ARCTIC Fan Controller (USB HID VID 0x3904,
> PID 0xF001) with 10 fan channels. Exposes fan RPM and PWM via sysfs.
> Device pushes IN reports at ~1 Hz; PWM is set via interrupt OUT reports.
> 
> Fan speed control is manual-only: the device does not change PWM
> autonomously. After applying an OUT report, the device sends back a
> 2-byte ACK (Report ID 0x02); the driver waits up to 1 s for this ACK
> using a completion.
> 
> The report buffer is kmalloc'd per write for two reasons:
> 
> 1. Stack placement (suggested by reviewers with __aligned()) was tested
>    but hard-rejected by usb_hcd_map_urb_for_dma(), which calls
>    object_is_on_stack() and returns -EAGAIN regardless of alignment
>    attributes. Confirmed on AMD X670E with AMD-Vi (IOMMU) enabled.
> 
> 2. Struct-embedded placement (suggested as an alternative) would create
>    a shared resource between concurrent arctic_fan_write() calls, causing
>    a race if two users write different PWM channels simultaneously.
> 
> kmalloc per write avoids both problems: the buffer is heap-allocated
> (passes DMA checks) and private to each write call (no sharing).

The second problem does not exist since the hwmon core serializes sysfs
attribute accesses, and a single once-allocated buffer would be sufficient
for the same reason.

> 
> Signed-off-by: Aureo Serrano de Souza <aureo.serrano@arctic.de>
> ---
> Hi,
> 
> Thanks for the detailed review. Here is v2 addressing your feedback.
> If I missed anything, please let me know.
> 
> Changes since v1:
> - Remove module_param debug flag; use hid_dbg() / dyndbg instead
> - Move hid_device_id table next to hid_driver struct
> - Replace spinlock_irqsave with mutex for fan_rpm/pwm_duty; use a
>   lightweight spinlock only to protect the completion signal shared with
>   raw_event() which runs in BH/softirq context
> - Use guard() from cleanup.h to eliminate manual unlock on error paths
> - Use get_unaligned_le16() for RPM parsing instead of manual byte shift
> - Remove all impossible bounds/NULL checks that the hwmon core never triggers
> - Remove retry loop; use a single hid_hw_output_report() call
> - Add hid_is_usb() guard in probe
> - Remove hwmon_dev field from struct; use local variable only
> - Remove VID/PID from MODULE_DESCRIPTION
> - Fix: do not update pwm_duty from IN reports; device is manual-only so
>   the host cache is the authoritative PWM source. This eliminates the race
>   where an incoming report could overwrite a value just written.
> - Add completion/ACK mechanism: wait for device ACK after OUT report,
>   signalled from raw_event() via complete(); return device ACK status
> - Report buffer is kmalloc'd per write; see commit message for full
>   rationale. In summary: stack placement (suggested with __aligned()) is
>   hard-rejected by usb_hcd_map_urb_for_dma() via object_is_on_stack();
>   struct-embedded placement (suggested as alternative) creates a shared
>   resource race between concurrent writes. kmalloc per write avoids both.
> - Add Documentation/hwmon/arctic_fan_controller.rst to index.rst
> - Add MAINTAINERS entry
> 
>  Documentation/hwmon/arctic_fan_controller.rst |  40 +++
>  Documentation/hwmon/index.rst                 |   1 +
>  MAINTAINERS                                   |   7 +
>  drivers/hwmon/Kconfig                         |  12 +
>  drivers/hwmon/Makefile                        |   1 +
>  drivers/hwmon/arctic_fan_controller.c         | 278 ++++++++++++++++++
>  6 files changed, 339 insertions(+)
>  create mode 100644 Documentation/hwmon/arctic_fan_controller.rst
>  create mode 100644 drivers/hwmon/arctic_fan_controller.c
> 
> diff --git a/Documentation/hwmon/arctic_fan_controller.rst b/Documentation/hwmon/arctic_fan_controller.rst
> new file mode 100644
> index 000000000..58366551c
> --- /dev/null
> +++ b/Documentation/hwmon/arctic_fan_controller.rst
> @@ -0,0 +1,40 @@
> +.. SPDX-License-Identifier: GPL-2.0-or-later
> +
> +Kernel driver arctic_fan_controller
> +=====================================
> +
> +Supported devices:
> +
> +* ARCTIC Fan Controller (USB HID, VID 0x3904, PID 0xF001)
> +
> +Author: Aureo Serrano de Souza <aureo.serrano@arctic.de>
> +
> +Description
> +-----------
> +
> +This driver provides hwmon support for the ARCTIC Fan Controller, a USB
> +Custom HID device with 10 fan channels. The device sends IN reports about
> +once per second containing current RPM values (bytes 11-30, 10 x uint16 LE).
> +Fan speed control is manual-only: the device does not change PWM
> +autonomously; it only applies a new duty cycle when it receives an OUT
> +report from the host.
> +
> +After the device applies an OUT report, it sends back a 2-byte ACK IN
> +report (Report ID 0x02, byte 1 = 0x00 on success) confirming the command
> +was applied.
> +
> +Usage notes
> +-----------
> +
> +Since it is a USB device, hotplug is supported. The device is autodetected.
> +
> +Sysfs entries
> +-------------
> +
> +================ ==============================================================
> +fan[1-10]_input  Fan speed in RPM (read-only). Updated from IN reports at ~1 Hz.
> +pwm[1-10]        PWM duty cycle (0-255). Write: sends an OUT report setting the
> +                 duty cycle (scaled from 0-255 to 0-100% for the device). Read:
> +                 returns the last value written; the device is manual-only so
> +                 the host cache is authoritative.
> +================ ==============================================================
> diff --git a/Documentation/hwmon/index.rst b/Documentation/hwmon/index.rst
> index b2ca8513c..c34713040 100644
> --- a/Documentation/hwmon/index.rst
> +++ b/Documentation/hwmon/index.rst
> @@ -42,6 +42,7 @@ Hardware Monitoring Kernel Drivers
>     aht10
>     amc6821
>     aquacomputer_d5next
> +   arctic_fan_controller
>     asb100
>     asc7621
>     aspeed-g6-pwm-tach
> diff --git a/MAINTAINERS b/MAINTAINERS
> index 837db4f7b..8c32dddd6 100644
> --- a/MAINTAINERS
> +++ b/MAINTAINERS
> @@ -2053,6 +2053,13 @@ S:	Maintained
>  F:	drivers/net/arcnet/
>  F:	include/uapi/linux/if_arcnet.h
>  
> +ARCTIC FAN CONTROLLER DRIVER
> +M:	Aureo Serrano de Souza <aureo.serrano@arctic.de>
> +L:	linux-hwmon@vger.kernel.org
> +S:	Maintained
> +F:	Documentation/hwmon/arctic_fan_controller.rst
> +F:	drivers/hwmon/arctic_fan_controller.c
> +
>  ARM AND ARM64 SoC SUB-ARCHITECTURES (COMMON PARTS)
>  M:	Arnd Bergmann <arnd@arndb.de>
>  M:	Krzysztof Kozlowski <krzk@kernel.org>
> diff --git a/drivers/hwmon/Kconfig b/drivers/hwmon/Kconfig
> index 486152a8e..b6ab72752 100644
> --- a/drivers/hwmon/Kconfig
> +++ b/drivers/hwmon/Kconfig
> @@ -388,6 +388,18 @@ config SENSORS_APPLESMC
>  	  Say Y here if you have an applicable laptop and want to experience
>  	  the awesome power of applesmc.
>  
> +config SENSORS_ARCTIC_FAN_CONTROLLER
> +	tristate "ARCTIC Fan Controller"
> +	depends on HID
> +	help
> +	  If you say yes here you get support for the ARCTIC Fan Controller,
> +	  a USB HID device (VID 0x3904, PID 0xF001) with 10 fan channels.
> +	  The driver exposes fan speed (RPM) and PWM control via the hwmon
> +	  sysfs interface.
> +
> +	  This driver can also be built as a module. If so, the module
> +	  will be called arctic_fan_controller.
> +
>  config SENSORS_ARM_SCMI
>  	tristate "ARM SCMI Sensors"
>  	depends on ARM_SCMI_PROTOCOL
> diff --git a/drivers/hwmon/Makefile b/drivers/hwmon/Makefile
> index 5833c807c..ef831c337 100644
> --- a/drivers/hwmon/Makefile
> +++ b/drivers/hwmon/Makefile
> @@ -49,6 +49,7 @@ obj-$(CONFIG_SENSORS_ADT7475)	+= adt7475.o
>  obj-$(CONFIG_SENSORS_AHT10)	+= aht10.o
>  obj-$(CONFIG_SENSORS_APPLESMC)	+= applesmc.o
>  obj-$(CONFIG_SENSORS_AQUACOMPUTER_D5NEXT) += aquacomputer_d5next.o
> +obj-$(CONFIG_SENSORS_ARCTIC_FAN_CONTROLLER)	+= arctic_fan_controller.o
>  obj-$(CONFIG_SENSORS_ARM_SCMI)	+= scmi-hwmon.o
>  obj-$(CONFIG_SENSORS_ARM_SCPI)	+= scpi-hwmon.o
>  obj-$(CONFIG_SENSORS_AS370)	+= as370-hwmon.o
> diff --git a/drivers/hwmon/arctic_fan_controller.c b/drivers/hwmon/arctic_fan_controller.c
> new file mode 100644
> index 000000000..24db8a7ee
> --- /dev/null
> +++ b/drivers/hwmon/arctic_fan_controller.c
> @@ -0,0 +1,278 @@
> +// SPDX-License-Identifier: GPL-2.0-or-later
> +/*
> + * Linux hwmon driver for ARCTIC Fan Controller
> + *
> + * USB Custom HID device (VID 0x3904, PID 0xF001) with 10 fan channels.
> + * Exposes fan RPM (input) and PWM (0-255) via hwmon. Device pushes IN reports
> + * at ~1 Hz; no GET_REPORT. OUT reports set PWM duty (bytes 1-10, 0-100%).
> + * PWM is manual-only: the device does not change duty autonomously, only
> + * when it receives an OUT report from the host.
> + */
> +
> +#include <linux/cleanup.h>
> +#include <linux/completion.h>
> +#include <linux/err.h>
> +#include <linux/hid.h>
> +#include <linux/hwmon.h>
> +#include <linux/hwmon-sysfs.h>

Not needed.

> +#include <linux/jiffies.h>
> +#include <linux/kernel.h>
> +#include <linux/module.h>
> +#include <linux/mutex.h>
> +#include <linux/slab.h>
> +#include <linux/spinlock.h>
> +#include <linux/unaligned.h>
> +
> +#define ARCTIC_VID		0x3904
> +#define ARCTIC_PID		0xF001
> +#define ARCTIC_NUM_FANS		10
> +#define ARCTIC_REPORT_ID	0x01
> +#define ARCTIC_REPORT_LEN	32
> +#define ARCTIC_RPM_OFFSET	11	/* bytes 11-30: 10 x uint16 LE */
> +/* ACK report: device sends Report ID 0x02, 2 bytes (ID + status) after applying OUT report */
> +#define ARCTIC_ACK_REPORT_ID	0x02
> +#define ARCTIC_ACK_REPORT_LEN	2
> +/* Time to wait for ACK report after send */
> +#define ARCTIC_ACK_TIMEOUT_MS	1000
> +
> +struct arctic_fan_data {
> +	struct hid_device *hdev;
> +	struct mutex lock;		/* protects fan_rpm, pwm_duty */
> +	spinlock_t in_report_lock;	/* protects ack_status and in_report_received */
> +	struct completion in_report_received; /* ACK (ID 0x02) received in raw_event */
> +	int ack_status;			/* 0 = OK, negative errno on device error */
> +	u32 fan_rpm[ARCTIC_NUM_FANS];
> +	u8 pwm_duty[ARCTIC_NUM_FANS];	/* 0-255 matching sysfs range; converted to 0-100 on send */
> +};
> +
> +/*
> + * Parse RPM values from the periodic status report (10 x uint16 LE at rpm_off).
> + * pwm_duty is not updated from the report: the device is manual-only, so the
> + * host cache is the authoritative source for PWM.
> + */
> +static void arctic_fan_parse_report(struct arctic_fan_data *priv, u8 *buf,
> +				    int len, int rpm_off)
> +{
> +	int i;
> +
> +	if (len < rpm_off + 20)
> +		return;
> +	{
> +		guard(mutex)(&priv->lock);

The { } around the guard() are unnecessary, both here and elsewhere in the code.

If the guard() is added is because the call is from an event handler,
use hwmon_lock() and hwmon_unlock() to serialize accesses.

> +		for (i = 0; i < ARCTIC_NUM_FANS; i++)
> +			priv->fan_rpm[i] = get_unaligned_le16(&buf[rpm_off + i * 2]);
> +	}
> +}
> +
> +/*
> + * raw_event: IN reports.
> + *
> + * Status report: Report ID 0x01, 32 bytes:
> + *   byte 0 = report ID, bytes 1-10 = PWM 0-100%, bytes 11-30 = 10 x RPM uint16 LE.
> + *   Device pushes these at ~1 Hz; no GET_REPORT.
> + *
> + * ACK report: Report ID 0x02, 2 bytes:
> + *   byte 0 = 0x02, byte 1 = status (0x00 = OK, 0x01 = ERROR).
> + *   Sent once after accepting and applying an OUT report (ID 0x01).
> + */
> +static int arctic_fan_raw_event(struct hid_device *hdev,
> +				struct hid_report *report, u8 *data, int size)
> +{
> +	struct arctic_fan_data *priv = hid_get_drvdata(hdev);
> +
> +	hid_dbg(hdev, "arctic_fan: raw_event id=%u size=%d\n", report->id, size);
> +
> +	if (report->id == ARCTIC_ACK_REPORT_ID && size == ARCTIC_ACK_REPORT_LEN) {
> +		spin_lock(&priv->in_report_lock);
> +		priv->ack_status = data[1] == 0x00 ? 0 : -EIO;
> +		complete(&priv->in_report_received);
> +		spin_unlock(&priv->in_report_lock);
> +		return 0;
> +	}
> +
> +	if (report->id != ARCTIC_REPORT_ID || size != ARCTIC_REPORT_LEN) {
> +		hid_dbg(hdev, "arctic_fan: raw_event id=%u size=%d ignored\n",
> +			report->id, size);
> +		return 0;
> +	}
> +
> +	arctic_fan_parse_report(priv, data, size, ARCTIC_RPM_OFFSET);
> +	return 0;
> +}
> +
> +static umode_t arctic_fan_is_visible(const void *data,
> +				     enum hwmon_sensor_types type,
> +				     u32 attr, int channel)
> +{
> +	if (type == hwmon_fan && attr == hwmon_fan_input)
> +		return 0444;
> +	if (type == hwmon_pwm && attr == hwmon_pwm_input)
> +		return 0644;
> +	return 0;
> +}
> +
> +static int arctic_fan_read(struct device *dev, enum hwmon_sensor_types type,
> +			   u32 attr, int channel, long *val)
> +{
> +	struct arctic_fan_data *priv = dev_get_drvdata(dev);
> +
> +	{
> +		guard(mutex)(&priv->lock);
> +		if (type == hwmon_fan && attr == hwmon_fan_input) {
> +			*val = priv->fan_rpm[channel];
> +			return 0;
> +		}
> +		if (type == hwmon_pwm && attr == hwmon_pwm_input) {
> +			*val = priv->pwm_duty[channel];
> +			return 0;
> +		}
> +		return -EINVAL;
> +	}
> +}
> +
> +static int arctic_fan_write(struct device *dev, enum hwmon_sensor_types type,
> +			    u32 attr, int channel, long val)
> +{
> +	struct arctic_fan_data *priv = dev_get_drvdata(dev);
> +	u8 *buf;
> +	long t;
> +	int i, ret;
> +
> +	/*
> +	 * Must use a heap-allocated buffer: usb_hcd_map_urb_for_dma() rejects
> +	 * stack buffers with -EAGAIN, preventing USB transfers on DMA-capable
> +	 * host controllers.
> +	 */
> +	buf = kmalloc(ARCTIC_REPORT_LEN, GFP_KERNEL);
> +	if (!buf)
> +		return -ENOMEM;
> +
> +	{
> +		guard(mutex)(&priv->lock);
> +		priv->pwm_duty[channel] = (u8)val;
> +		buf[0] = ARCTIC_REPORT_ID;
> +		for (i = 0; i < ARCTIC_NUM_FANS; i++)
> +			buf[1 + i] = DIV_ROUND_CLOSEST((unsigned int)priv->pwm_duty[i] * 100, 255);
> +	}
> +	memset(buf + 11, 0, ARCTIC_REPORT_LEN - 11);
> +
> +	spin_lock_bh(&priv->in_report_lock);
> +	priv->ack_status = -ETIMEDOUT;
> +	reinit_completion(&priv->in_report_received);
> +	spin_unlock_bh(&priv->in_report_lock);
> +
> +	ret = hid_hw_output_report(priv->hdev, buf, ARCTIC_REPORT_LEN);
> +	kfree(buf);
> +	if (ret < 0)
> +		return ret;
> +
> +	t = wait_for_completion_interruptible_timeout(&priv->in_report_received,
> +						      msecs_to_jiffies(ARCTIC_ACK_TIMEOUT_MS));
> +	if (t == 0)
> +		return -ETIMEDOUT;
> +	if (t < 0)
> +		return t; /* interrupted by signal */
> +	return priv->ack_status; /* 0=OK, -EIO=device error */
> +}
> +
> +static const struct hwmon_ops arctic_fan_ops = {
> +	.is_visible = arctic_fan_is_visible,
> +	.read = arctic_fan_read,
> +	.write = arctic_fan_write,
> +};
> +
> +static const struct hwmon_channel_info *arctic_fan_info[] = {
> +	HWMON_CHANNEL_INFO(fan,
> +			   HWMON_F_INPUT, HWMON_F_INPUT, HWMON_F_INPUT,
> +			   HWMON_F_INPUT, HWMON_F_INPUT, HWMON_F_INPUT,
> +			   HWMON_F_INPUT, HWMON_F_INPUT, HWMON_F_INPUT,
> +			   HWMON_F_INPUT),
> +	HWMON_CHANNEL_INFO(pwm,
> +			   HWMON_PWM_INPUT, HWMON_PWM_INPUT, HWMON_PWM_INPUT,
> +			   HWMON_PWM_INPUT, HWMON_PWM_INPUT, HWMON_PWM_INPUT,
> +			   HWMON_PWM_INPUT, HWMON_PWM_INPUT, HWMON_PWM_INPUT,
> +			   HWMON_PWM_INPUT),
> +	NULL
> +};
> +
> +static const struct hwmon_chip_info arctic_fan_chip_info = {
> +	.ops = &arctic_fan_ops,
> +	.info = arctic_fan_info,
> +};
> +
> +static int arctic_fan_probe(struct hid_device *hdev,
> +			    const struct hid_device_id *id)
> +{
> +	struct arctic_fan_data *priv;
> +	struct device *hwmon_dev;
> +	int ret;
> +
> +	if (!hid_is_usb(hdev))
> +		return -ENODEV;
> +
> +	ret = hid_parse(hdev);
> +	if (ret)
> +		return ret;
> +
> +	priv = devm_kzalloc(&hdev->dev, sizeof(*priv), GFP_KERNEL);
> +	if (!priv)
> +		return -ENOMEM;
> +
> +	priv->hdev = hdev;
> +	mutex_init(&priv->lock);
> +	spin_lock_init(&priv->in_report_lock);
> +	init_completion(&priv->in_report_received);
> +	hid_set_drvdata(hdev, priv);
> +
> +	ret = hid_hw_start(hdev, HID_CONNECT_DRIVER);
> +	if (ret)
> +		return ret;
> +
> +	ret = hid_hw_open(hdev);
> +	if (ret)
> +		goto out_stop;
> +
> +	hid_device_io_start(hdev);
> +
> +	hwmon_dev = devm_hwmon_device_register_with_info(&hdev->dev, "arctic_fan",
> +							 priv, &arctic_fan_chip_info,
> +							 NULL);
> +	if (IS_ERR(hwmon_dev)) {
> +		ret = PTR_ERR(hwmon_dev);
> +		goto out_close;
> +	}
> +	return 0;
> +
> +out_close:
> +	hid_hw_close(hdev);
> +out_stop:
> +	hid_hw_stop(hdev);
> +	return ret;
> +}
> +
> +static void arctic_fan_remove(struct hid_device *hdev)
> +{
> +	hid_device_io_stop(hdev);
> +	hid_hw_close(hdev);
> +	hid_hw_stop(hdev);
> +}
> +
> +static const struct hid_device_id arctic_fan_id_table[] = {
> +	{ HID_USB_DEVICE(ARCTIC_VID, ARCTIC_PID) },
> +	{ }
> +};
> +MODULE_DEVICE_TABLE(hid, arctic_fan_id_table);
> +
> +static struct hid_driver arctic_fan_driver = {
> +	.name = "arctic_fan",
> +	.id_table = arctic_fan_id_table,
> +	.probe = arctic_fan_probe,
> +	.remove = arctic_fan_remove,
> +	.raw_event = arctic_fan_raw_event,
> +};
> +
> +module_hid_driver(arctic_fan_driver);
> +
> +MODULE_AUTHOR("Aureo Serrano de Souza <aureo.serrano@arctic.de>");
> +MODULE_DESCRIPTION("HID hwmon driver for ARCTIC Fan Controller");
> +MODULE_LICENSE("GPL");
