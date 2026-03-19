Received: from mail-dl1-f53.google.com (mail-dl1-f53.google.com [74.125.82.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 730D13932D5
	for <linux-hwmon@vger.kernel.org>; Thu, 19 Mar 2026 19:29:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.82.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773948563; cv=none; b=Y240bhPpzUyf3qtRRGSw1sNp/rtttKpc6Ai5V/D0siA6KPYrqB+dmTb50C3zneFOG32VbMCySwPUG+TJtCS6Hmtt8yc9S29wizMHPstm7IdaVKIbDsMrG4ONB3VAVA+zEiKhQQHFeMPUNE4l7Uw9vYu3n/GltbXgh7a07lf2MIY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773948563; c=relaxed/simple;
	bh=lJEt97rA6YJ3x59EYCjjBBJRzcw2T84iEhdz7sJxGOs=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=P1/AeZb7n+PLZU6FpgFFABp5s87HxoPhoq0MwVGXQBISvHdCfIj+anzh9xyVhjxE/WEt/yYGozBOqwPdvgUHluQIXsMXX/irh+JN0bN2ibU/F4n3aTiQaadWZraVfEVfmIh2aOPayp9rKHQGmm2rZU/APxzvg6fYfBBQJbHukco=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Bmtlaoo7; arc=none smtp.client-ip=74.125.82.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Bmtlaoo7"
Received: by mail-dl1-f53.google.com with SMTP id a92af1059eb24-12a695044a4so2184973c88.0
        for <linux-hwmon@vger.kernel.org>; Thu, 19 Mar 2026 12:29:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1773948561; x=1774553361; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:sender:from:to:cc:subject:date:message-id:reply-to;
        bh=8Tn4p/PNavXSgVVfNdg0wirCLJpgdLt4any0Z9oblRk=;
        b=Bmtlaoo7K3Zl5Ql1xOaLJ+g9uOnrfcUE3kx9gwe/aUhg7hCHKlqlgupCxf7cidtutp
         jty9bd3s/qRKZ9p2IVRiG+BMvaFz6fW0hgLk+sLYmCW3o7HxooDA6TwjmK5Tpxk+OC5Z
         drm1Xt1RlPLI4RNeUQmwzRkkUXrTJRvbyOLHQpat07ng7Wj02Dlq5AfMA/B3zQlGSe+c
         0gFQ8QIF1imO+i/9++BbP1TxED6eGxIsdjQZy9h/njLgq6HSHXwWc5+y//kW59PB7p3L
         NtPfIdFyyQ8wQsYTcXoP4iA5dJQlvEzhVPP7nznwwOPiWznqVOa8AJhtvdtkb3eY4lw2
         Exxw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1773948561; x=1774553361;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:sender:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=8Tn4p/PNavXSgVVfNdg0wirCLJpgdLt4any0Z9oblRk=;
        b=MmpW0fFUNFeajY+/qygqvrtPzJaTAxEjyUIh2+jyoO2Rj6hRPP3R9C2h1MGMyPEFaO
         q+i3rMGJ90aTmi2OMbGwYNNOv5V042JeSc34NQH1S0KXpklOuXsUTkhpSOmJHnGbEA6s
         6hAdyWkLD/I1qVHIlRQc2gJgBZmiy5zn+qFuzwQIC9Frge8nMSLnezdiOIOulakh38om
         YuRHV8GKePhAF/83pwoJkYBSWv7ooh9j5C6lu8jei/U9ACGZX3H62kVyCjle6BN19gUs
         1wNl50Bq5EhngMrtYscC06rhlORaZz6SzMJDMDg7p3iXfY4AzC3vjFWsVLbpOpNJrtPV
         zU9g==
X-Forwarded-Encrypted: i=1; AJvYcCUUKtV03j5+QFsJbZQHJO3we/NQ/8Ld03n+dlo0Y2c5XAB3Ug3SKpElM+eNdrvHAz4bnyL0QcoiRs/SSg==@vger.kernel.org
X-Gm-Message-State: AOJu0YwewiiaCRfCrHmuQgCU5IdTdBGBrvYZIjvxoA+1OZAEU8Br1N1I
	Sk7JRPEqlAWWk1/5TxXoefa7Nqd3fxpk09uhK9UkrJkruKJR1WwGhKGsPCs9Ag==
X-Gm-Gg: ATEYQzyvEkCTZrytK2EznLY9LCJHyyJGemfhaLbacifdPe+UZUFsZVvQPQVwO2be/EW
	l2CJu5/Javx7daRbCbQbAC0gKAI8C8dhfwMpaiqqlyNbKjoso/q3+A7Y5AUvxG8p1iwprURxf6m
	9rg+jEYiF3XhjLYiT1CyySXvZNOhu+G5IYrONcGYTehe4rTz0o8yfORRQo2dcxPXhtGP/gKFzlI
	ghqiJ275ENzvp5tAXVRsvfk7H439OGZNxHBuwpnqz6uY+9MjXhiQHVm7Qjfy/2yNjhLRJiZ22KC
	lvvj35gTZCOMKecHjQ41DjWYgr20g9G4ZOg0l7GOtQfuUY44SFE7DEkUx9XSFPgvwwxeo5ZTB6p
	iHkmhRYP2Br1+tZf4lTQcadya+Fv+F3s5CYo5nz66k+Q6jf5ImvbZ8QVKDls6QZ03fj59o2yokr
	12btaAzcoMLp8TBAiQWQlcSFtWKYdANn1wxUNeymOXuXg9U04l5i/WIr+lzRyqBWztk02yRNaZ
X-Received: by 2002:a05:7022:4590:b0:122:153:d161 with SMTP id a92af1059eb24-12a7267f80bmr191352c88.17.1773948560327;
        Thu, 19 Mar 2026 12:29:20 -0700 (PDT)
Received: from ?IPV6:2600:1700:e321:62f0:da43:aeff:fecc:bfd5? ([2600:1700:e321:62f0:da43:aeff:fecc:bfd5])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-2c10b14c99bsm38135eec.1.2026.03.19.12.29.19
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 19 Mar 2026 12:29:19 -0700 (PDT)
Sender: Guenter Roeck <groeck7@gmail.com>
Message-ID: <fafaa8e9-1dd8-441b-9085-c0cc75739aea@roeck-us.net>
Date: Thu, 19 Mar 2026 12:29:18 -0700
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3] hwmon: add driver for ARCTIC Fan Controller
To: Aureo Serrano de Souza <aureo.serrano@arctic.de>,
 linux-hwmon@vger.kernel.org
Cc: linux@weissschuh.net, corbet@lwn.net, skhan@linuxfoundation.org,
 linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20260319103509.243653-1-aureo.serrano@arctic.de>
Content-Language: en-US
From: Guenter Roeck <linux@roeck-us.net>
Autocrypt: addr=linux@roeck-us.net; keydata=
 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
 np3900V20aS7eD9K8GTU0TGC1pyz6IVJwIE=
In-Reply-To: <20260319103509.243653-1-aureo.serrano@arctic.de>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

On 3/19/26 03:34, Aureo Serrano de Souza wrote:
> Add hwmon driver for the ARCTIC Fan Controller, a USB HID device
> (VID 0x3904, PID 0xF001) with 10 fan channels. Exposes fan speed in
> RPM (read-only) and PWM duty cycle (0-255, read/write) via sysfs.
> 
> The device pushes IN reports at ~1 Hz containing RPM readings. PWM is
> set via OUT reports; the device applies the new duty cycle and sends
> back a 2-byte ACK (Report ID 0x02). The driver waits up to 1 s for
> the ACK using a completion. Measured device latency: max ~563 ms over
> 500 iterations. PWM control is manual-only: the device never changes
> duty cycle autonomously.
> 
> raw_event() may run in hardirq context, so fan_rpm[] is protected by
> a spinlock with irq-save. pwm_duty[] and the report buffer are
> serialized by the hwmon core, which holds its lock for the duration of
> the read/write callbacks.
> 
> Signed-off-by: Aureo Serrano de Souza <aureo.serrano@arctic.de>

Feedback from Sashiko:

https://sashiko.dev/#/patchset/20260319103509.243653-1-aureo.serrano%40arctic.de

Regarding DMA alignment: Please use ____cacheline_aligned to ensure that
the buffer is DMA-aligned.

Thanks,
Guenter

> ---
> Thanks to the reviewers for their feedback.
> 
> Changes since v2:
> - buf[]: add __aligned(8) for DMA safety
> - ARCTIC_ACK_TIMEOUT_MS: add comment noting observed max ~563 ms
> - arctic_fan_parse_report(): replace hwmon_lock/hwmon_unlock with
>    spin_lock_irqsave; hwmon_lock() may sleep and is unsafe when
>    raw_event() runs in hardirq/softirq context
> - arctic_fan_raw_event(): use spin_lock_irqsave for ACK path
> - arctic_fan_write(): use spin_lock_irqsave for completion reinit
> - arctic_fan_write(): clamp val to [0, 255] before u8 cast
> - hardware teardown: register arctic_fan_hw_stop() via
>    devm_add_action_or_reset() before hwmon; devm LIFO order ensures
>    hwmon unregisters before hid_hw_close/stop; remove() is a no-op
> - remove priv->hwmon_dev (no longer needed)
> 
> Changes since v1:
> - Use hid_dbg() instead of module_param debug flag
> - Move hid_device_id table adjacent to hid_driver struct
> - Use get_unaligned_le16() for RPM parsing
> - Remove impossible bounds/NULL checks; remove retry loop
> - Add hid_is_usb() guard
> - Do not update pwm_duty from IN reports (device is manual-only)
> - Add completion/ACK mechanism for OUT report acknowledgement
> - Add Documentation/hwmon/arctic_fan_controller.rst and MAINTAINERS
> 
> diff --git a/Documentation/hwmon/arctic_fan_controller.rst b/Documentation/hwmon/arctic_fan_controller.rst
> new file mode 100644
> index 0000000000..e417f54b62
> --- /dev/null
> +++ b/Documentation/hwmon/arctic_fan_controller.rst
> @@ -0,0 +1,34 @@
> +.. SPDX-License-Identifier: GPL-2.0-or-later
> +
> +Kernel driver arctic_fan_controller
> +===================================
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
> +This driver provides hwmon support for the ARCTIC Fan Controller, a USB Custom HID
> +device with 10 fan channels. The device sends IN reports about once per second
> +containing current PWM (bytes 1–10) and RPM (bytes 11–30). PWM is set via OUT reports
> +(bytes 1–10, 0–100% per channel). Fan control is manual-only: the device does not
> +change PWM autonomously, only when it receives an OUT report from the host.
> +
> +Usage notes
> +-----------
> +
> +Since it is a USB device, hotplug is supported. The device is autodetected.
> +
> +Sysfs entries
> +-------------
> +
> +================ ===============================================================
> +fan[1-10]_input   Fan speed in RPM (read-only, from device IN reports).
> +pwm[1-10]         PWM duty cycle. Sysfs uses 0–255 (0%–100%); the device uses
> +                  0–100% internally. Read: current duty from IN report (scaled
> +                  to 0–255). Write: set duty via OUT report (value 0–255).
> +================ ===============================================================
> diff --git a/Documentation/hwmon/index.rst b/Documentation/hwmon/index.rst
> index b2ca8513cf..c34713040e 100644
> --- a/Documentation/hwmon/index.rst
> +++ b/Documentation/hwmon/index.rst
> @@ -42,6 +42,7 @@ Hardware Monitoring Kernel Drivers
>      aht10
>      amc6821
>      aquacomputer_d5next
> +   arctic_fan_controller
>      asb100
>      asc7621
>      aspeed-g6-pwm-tach
> diff --git a/MAINTAINERS b/MAINTAINERS
> index 96ea84948d..ec3112bd41 100644
> --- a/MAINTAINERS
> +++ b/MAINTAINERS
> @@ -2053,6 +2053,13 @@ S:	Maintained
>   F:	drivers/net/arcnet/
>   F:	include/uapi/linux/if_arcnet.h
> 
> +ARCTIC FAN CONTROLLER DRIVER
> +M:	Aureo Serrano de Souza <aureo.serrano@arctic.de>
> +L:	linux-hwmon@vger.kernel.org
> +S:	Maintained
> +F:	Documentation/hwmon/arctic_fan_controller.rst
> +F:	drivers/hwmon/arctic_fan_controller.c
> +
>   ARM AND ARM64 SoC SUB-ARCHITECTURES (COMMON PARTS)
>   M:	Arnd Bergmann <arnd@arndb.de>
>   M:	Krzysztof Kozlowski <krzk@kernel.org>
> diff --git a/drivers/hwmon/Kconfig b/drivers/hwmon/Kconfig
> index 328867242c..6c90a8dd40 100644
> --- a/drivers/hwmon/Kconfig
> +++ b/drivers/hwmon/Kconfig
> @@ -388,6 +388,18 @@ config SENSORS_APPLESMC
>   	  Say Y here if you have an applicable laptop and want to experience
>   	  the awesome power of applesmc.
> 
> +config SENSORS_ARCTIC_FAN_CONTROLLER
> +	tristate "ARCTIC Fan Controller"
> +	depends on USB_HID
> +	help
> +	  If you say yes here you get support for the ARCTIC Fan Controller,
> +	  a USB HID device (VID 0x3904, PID 0xF001) with 10 fan channels.
> +	  The driver exposes fan speed (RPM) and PWM control via the hwmon
> +	  sysfs interface.
> +
> +	  This driver can also be built as a module. If so, the module
> +	  will be called arctic_fan_controller.
> +
>   config SENSORS_ARM_SCMI
>   	tristate "ARM SCMI Sensors"
>   	depends on ARM_SCMI_PROTOCOL
> diff --git a/drivers/hwmon/Makefile b/drivers/hwmon/Makefile
> index 5833c807c6..ef831c3375 100644
> --- a/drivers/hwmon/Makefile
> +++ b/drivers/hwmon/Makefile
> @@ -49,6 +49,7 @@ obj-$(CONFIG_SENSORS_ADT7475)	+= adt7475.o
>   obj-$(CONFIG_SENSORS_AHT10)	+= aht10.o
>   obj-$(CONFIG_SENSORS_APPLESMC)	+= applesmc.o
>   obj-$(CONFIG_SENSORS_AQUACOMPUTER_D5NEXT) += aquacomputer_d5next.o
> +obj-$(CONFIG_SENSORS_ARCTIC_FAN_CONTROLLER)	+= arctic_fan_controller.o
>   obj-$(CONFIG_SENSORS_ARM_SCMI)	+= scmi-hwmon.o
>   obj-$(CONFIG_SENSORS_ARM_SCPI)	+= scpi-hwmon.o
>   obj-$(CONFIG_SENSORS_AS370)	+= as370-hwmon.o
> diff --git a/drivers/hwmon/arctic_fan_controller.c b/drivers/hwmon/arctic_fan_controller.c
> new file mode 100644
> index 0000000000..d71b323e0b
> --- /dev/null
> +++ b/drivers/hwmon/arctic_fan_controller.c
> @@ -0,0 +1,288 @@
> +// SPDX-License-Identifier: GPL-2.0-or-later
> +/*
> + * Linux hwmon driver for ARCTIC Fan Controller
> + *
> + * USB Custom HID device with 10 fan channels.
> + * Exposes fan RPM (input) and PWM (0-255) via hwmon. Device pushes IN reports
> + * at ~1 Hz; no GET_REPORT. OUT reports set PWM duty (bytes 1-10, 0-100%).
> + * PWM is manual-only: the device does not change duty autonomously, only
> + * when it receives an OUT report from the host.
> + */
> +
> +#include <linux/completion.h>
> +#include <linux/err.h>
> +#include <linux/hid.h>
> +#include <linux/hwmon.h>
> +#include <linux/jiffies.h>
> +#include <linux/minmax.h>
> +#include <linux/module.h>
> +#include <linux/spinlock.h>
> +#include <linux/unaligned.h>
> +
> +#define ARCTIC_VID			0x3904
> +#define ARCTIC_PID			0xF001
> +#define ARCTIC_NUM_FANS			10
> +#define ARCTIC_OUTPUT_REPORT_ID		0x01
> +#define ARCTIC_REPORT_LEN		32
> +#define ARCTIC_RPM_OFFSET		11	/* bytes 11-30: 10 x uint16 LE */
> +/* ACK report: device sends Report ID 0x02, 2 bytes (ID + status) after applying OUT report */
> +#define ARCTIC_ACK_REPORT_ID		0x02
> +#define ARCTIC_ACK_REPORT_LEN		2
> +/*
> + * Time to wait for ACK report after send.
> + * Measured over 500 iterations: max ~563 ms. Keep 1 s as margin.
> + */
> +#define ARCTIC_ACK_TIMEOUT_MS		1000
> +
> +struct arctic_fan_data {
> +	struct hid_device *hdev;
> +	spinlock_t in_report_lock;	/* protects fan_rpm[], ack_status, in_report_received */
> +	struct completion in_report_received; /* ACK (ID 0x02) received in raw_event */
> +	int ack_status;			/* 0 = OK, negative errno on device error */
> +	u32 fan_rpm[ARCTIC_NUM_FANS];
> +	u8 pwm_duty[ARCTIC_NUM_FANS];	/* 0-255 matching sysfs range; converted to 0-100 on send */
> +	/* OUT report buffer; DMA-safe alignment; hwmon core serializes write callbacks */
> +	u8 buf[ARCTIC_REPORT_LEN] __aligned(8);
> +};
> +
> +/*
> + * Parse RPM values from the periodic status report (10 x uint16 LE at rpm_off).
> + * pwm_duty is not updated from the report: the device is manual-only, so the
> + * host cache is the authoritative source for PWM.
> + * Called from raw_event which may run in IRQ context; must not sleep.
> + */
> +static void arctic_fan_parse_report(struct arctic_fan_data *priv, u8 *buf,
> +				    int len, int rpm_off)
> +{
> +	unsigned long flags;
> +	int i;
> +
> +	if (len < rpm_off + 20)
> +		return;
> +
> +	spin_lock_irqsave(&priv->in_report_lock, flags);
> +	for (i = 0; i < ARCTIC_NUM_FANS; i++)
> +		priv->fan_rpm[i] = get_unaligned_le16(&buf[rpm_off + i * 2]);
> +	spin_unlock_irqrestore(&priv->in_report_lock, flags);
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
> +	unsigned long flags;
> +
> +	hid_dbg(hdev, "arctic_fan: raw_event id=%u size=%d\n", report->id, size);
> +
> +	if (report->id == ARCTIC_ACK_REPORT_ID && size == ARCTIC_ACK_REPORT_LEN) {
> +		spin_lock_irqsave(&priv->in_report_lock, flags);
> +		priv->ack_status = data[1] == 0x00 ? 0 : -EIO;
> +		complete(&priv->in_report_received);
> +		spin_unlock_irqrestore(&priv->in_report_lock, flags);
> +		return 0;
> +	}
> +
> +	if (report->id != ARCTIC_OUTPUT_REPORT_ID || size != ARCTIC_REPORT_LEN) {
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
> +	unsigned long flags;
> +
> +	if (type == hwmon_fan && attr == hwmon_fan_input) {
> +		spin_lock_irqsave(&priv->in_report_lock, flags);
> +		*val = priv->fan_rpm[channel];
> +		spin_unlock_irqrestore(&priv->in_report_lock, flags);
> +		return 0;
> +	}
> +	if (type == hwmon_pwm && attr == hwmon_pwm_input) {
> +		/* pwm_duty is modified only in write(), which the hwmon core serializes */
> +		*val = priv->pwm_duty[channel];
> +		return 0;
> +	}
> +	return -EINVAL;
> +}
> +
> +static int arctic_fan_write(struct device *dev, enum hwmon_sensor_types type,
> +			    u32 attr, int channel, long val)
> +{
> +	struct arctic_fan_data *priv = dev_get_drvdata(dev);
> +	unsigned long flags;
> +	long t;
> +	int i, ret;
> +
> +	/*
> +	 * The hwmon core holds its lock for the duration of this callback,
> +	 * serializing concurrent writes. priv->buf is heap-allocated (embedded
> +	 * in the devm_kzalloc'd struct), satisfying usb_hcd_map_urb_for_dma().
> +	 */
> +	priv->pwm_duty[channel] = (u8)clamp_val(val, 0, 255);
> +	priv->buf[0] = ARCTIC_OUTPUT_REPORT_ID;
> +	for (i = 0; i < ARCTIC_NUM_FANS; i++)
> +		priv->buf[1 + i] = DIV_ROUND_CLOSEST(
> +			(unsigned int)priv->pwm_duty[i] * 100, 255);
> +
> +	/*
> +	 * Serialized by the hwmon core: only one arctic_fan_write() runs at a
> +	 * time, so reinit_completion() and wait_for_completion_*() below are
> +	 * not racy against another concurrent write.
> +	 * Use irqsave to match the IRQ context in which raw_event may run.
> +	 */
> +	spin_lock_irqsave(&priv->in_report_lock, flags);
> +	priv->ack_status = -ETIMEDOUT;
> +	reinit_completion(&priv->in_report_received);
> +	spin_unlock_irqrestore(&priv->in_report_lock, flags);
> +
> +	ret = hid_hw_output_report(priv->hdev, priv->buf, ARCTIC_REPORT_LEN);
> +	if (ret < 0)
> +		return ret;
> +
> +	t = wait_for_completion_interruptible_timeout(&priv->in_report_received,
> +						      msecs_to_jiffies(ARCTIC_ACK_TIMEOUT_MS));
> +	if (t < 0)
> +		return t; /* interrupted by signal */
> +	if (!t)
> +		return -ETIMEDOUT;
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
> +static void arctic_fan_hw_stop(void *data)
> +{
> +	struct hid_device *hdev = data;
> +
> +	hid_hw_close(hdev);
> +	hid_hw_stop(hdev);
> +}
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
> +	spin_lock_init(&priv->in_report_lock);
> +	init_completion(&priv->in_report_received);
> +	hid_set_drvdata(hdev, priv);
> +
> +	ret = hid_hw_start(hdev, HID_CONNECT_DRIVER);
> +	if (ret)
> +		return ret;
> +
> +	ret = hid_hw_open(hdev);
> +	if (ret) {
> +		hid_hw_stop(hdev);
> +		return ret;
> +	}
> +
> +	/*
> +	 * Register hardware teardown before hwmon so that devm cleanup runs in
> +	 * LIFO order: hwmon unregistered first, then hid_hw_close/stop. This
> +	 * ensures no userspace sysfs write can reach an already stopped device.
> +	 */
> +	ret = devm_add_action_or_reset(&hdev->dev, arctic_fan_hw_stop, hdev);
> +	if (ret)
> +		return ret;
> +
> +	hwmon_dev = devm_hwmon_device_register_with_info(&hdev->dev, "arctic_fan",
> +							 priv, &arctic_fan_chip_info,
> +							 NULL);
> +	if (IS_ERR(hwmon_dev))
> +		return PTR_ERR(hwmon_dev);
> +
> +	hid_device_io_start(hdev);
> +	return 0;
> +}
> +
> +static void arctic_fan_remove(struct hid_device *hdev)
> +{
> +	/* devm cleanup (LIFO) handles hid_hw_close/stop after hwmon unregistration */
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

