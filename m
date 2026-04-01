Received: from mail-pg1-f173.google.com (mail-pg1-f173.google.com [209.85.215.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 88FD9477998
	for <linux-hwmon@vger.kernel.org>; Wed,  1 Apr 2026 17:34:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.173
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775064876; cv=none; b=Oz9/FXMppJes/ZII1BMAQQAIfnrBxlKD6Cv9DeuN9zUKu6IFTrAivjUwHBh6SXSGkR6yLYhT/3RUqzzwBKrkE1ZCe6T0XHAkKy3gIyh3/X+X6eDvSxLSAhJxg1a9psmFysJlRXkS6bdNnaqdypjcD6KJrWL3SvYo6+hvlXRLxFU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775064876; c=relaxed/simple;
	bh=zIQ8D9xR3bwdPP395bt6lljPPkqW601Ck7CMCsOxmf4=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=EIdqXCY9rnTsP915mOqxN2gZxQPwWgG9xT6aBqE3ddJlIWCxWmBl3TffZO2K+W8757tNEJx6z0lyD4o3ygaGia8RtngjRR1ZU7tkotthCnmP+OuSOzja2Rf69ttOb19HwGHza02mF4JLo2oOUsd7J9/YFBfRhA2ZGr4UzKGomFE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=GMSye9NQ; arc=none smtp.client-ip=209.85.215.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="GMSye9NQ"
Received: by mail-pg1-f173.google.com with SMTP id 41be03b00d2f7-c6dd5b01e14so2819282a12.0
        for <linux-hwmon@vger.kernel.org>; Wed, 01 Apr 2026 10:34:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1775064873; x=1775669673; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:sender:from:to:cc:subject:date:message-id:reply-to;
        bh=rylfU8SkxWdNmedHOhtEgjXmKs06GUyPqRlrQ3Fyq+E=;
        b=GMSye9NQv5WpxgYbVLK3AQNgqlb6NtrmsqaVvKje9dRwxxwB4w59OPt5cF4KDkIpfp
         ENF6wB/bjamEGwCUR+69LAIyI4Ng+3V0MYh2ctpA1SujZqqPBo9tf3wHVkfU1VPssUjC
         D49HtxGBYZHHSZf0hO2DSt4Mv0IjrV7dplHe6vu1TOYik1i2c7CMeaxjr1goDsIthoDr
         g3l6aWD1txseRkLsNfEb1f7NTwM4BU08Wr/k8wAep/ThCElERIdK6kKT0C9TPctzUnYG
         avZJfrnOdAgeref2qgSXnqxg9htNyW6mS/ZpWIg4IMe6bdtbiQ5af0M0S2wG8Pid1K5o
         t9Pw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775064873; x=1775669673;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:sender:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=rylfU8SkxWdNmedHOhtEgjXmKs06GUyPqRlrQ3Fyq+E=;
        b=gtZB/qa7seJKO76NpsT+KsxL8vLPKN8vokE1m5MIp7v1r2BdvWHFfNjIauMDQ0wixG
         9aFaTTGXqJsolBpPZpMnbUuLOEnNFhKW8nUY0X+IPhLoKHh1X516y83Wqwr7gEzgKgb2
         +IcGzl55fG1IzuFh2f7Z5x11KBZUbWvIXKxcekRnakKeYqzWb9BBXUSwKwaMj+KFGMQx
         SjWUjv3nCUHXUmmK9099YBMAXhCKg8m+/5sVGe3bnmFhXvgmiMc5xOgdMYI+3VtIfhM6
         3BuhPYfkYg53PBBjEv//q0WVkDtLpY5lkEHhLGLuzx9fFVrJ1zjeaaJZri5wVBWPl3og
         BJag==
X-Forwarded-Encrypted: i=1; AJvYcCViq4kmK216OKK3dfw7iNPJxCkY581rJGmGoe9vNAuKATf4DGiy4lJ5WalxVi55FNUdWsF1pCSSFpHWKQ==@vger.kernel.org
X-Gm-Message-State: AOJu0YzeiNio+AK9L9AiD2pNWFk2tCaZepgGrFKB8HfHI5+117nKz3nA
	r7TiP6ydxOVKRp5HAd1qK1CXxkKgErpqdHHK1270BHcZldJCx2Ob7Pw7
X-Gm-Gg: ATEYQzzhDkZI3QDwKhO4o4TN5kI6UAEQLxbDAs+lFPobRlc8NUNEbU6fqgDvoDtj0Sc
	xvV55wCHQ2CPi8PkGck9tW/8mXDQUH931jNR7B9K3nDv9wo/075Mu1WOD4wOPia5IP4N5hiOC4I
	PVr3zZ+qeHHaYUC0QEPu7ljnFDZU4h3LaDVK4d5V2+q3xKmHprL7/MJifVkhvL63elAqdKYkww+
	3RoIlKKIc17fuZxaYm/Iq/6j74Ln6NJJeTOVu+I8fF7wyn9jx+4CsQq/NYzVfMnuT3/5YExVevz
	aKgGg6+pCa0E6IAtgT+TaGGC9IzZ5KCsfyijk3O5gpoP0spHAyRxoWSwVPzKLj0cU61Htkl0IQJ
	Y1NyHZO+zUYpuvvmlKFGmLwcA3TBfAo1ZIMhpb1y7Nf9WYkpztcK2WD8KxHckB55phhKXV+w8xY
	x41CD7PAKUXYvkwX8IseIh2kjJKerhXxBeRlcdZiS/IowjZSwrEvSqiSJEnLUIg+3oHwerK3OE
X-Received: by 2002:a05:6a20:9145:b0:398:9301:b9d3 with SMTP id adf61e73a8af0-39ef71f5d64mr4818052637.7.1775064872616;
        Wed, 01 Apr 2026 10:34:32 -0700 (PDT)
Received: from ?IPV6:2600:1700:e321:62f0:da43:aeff:fecc:bfd5? ([2600:1700:e321:62f0:da43:aeff:fecc:bfd5])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-c76c657e5f3sm411519a12.23.2026.04.01.10.34.31
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 01 Apr 2026 10:34:32 -0700 (PDT)
Sender: Guenter Roeck <groeck7@gmail.com>
Message-ID: <03b32c90-7b62-47d0-9422-4f0f5dd0df29@roeck-us.net>
Date: Wed, 1 Apr 2026 10:34:30 -0700
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v6] hwmon: add driver for ARCTIC Fan Controller
To: Aureo Serrano de Souza <aureo.serrano@arctic.de>,
 linux-hwmon@vger.kernel.org
Cc: linux@weissschuh.net, corbet@lwn.net, skhan@linuxfoundation.org,
 linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20260401153949.77488-1-aureo.serrano@arctic.de>
Content-Language: en-US
From: Guenter Roeck <linux@roeck-us.net>
Autocrypt: addr=linux@roeck-us.net; keydata=
 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
 np3900V20aS7eD9K8GTU0TGC1pyz6IVJwIE=
In-Reply-To: <20260401153949.77488-1-aureo.serrano@arctic.de>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

On 4/1/26 08:39, Aureo Serrano de Souza wrote:
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
> a spinlock with irq-save. pwm_duty[] is also protected by this spinlock
> because reset_resume() clears it outside the hwmon core lock. The OUT
> report buffer is built and write_pending is armed under the same lock so
> that no reset_resume() can race with the pwm_duty[] snapshot. priv->buf
> is exclusively accessed by write(), which the hwmon core serializes.
> 
> Signed-off-by: Aureo Serrano de Souza <aureo.serrano@arctic.de>

This must be a resend because it does not appear to be corrupted.
Please mention that in the future.

Sashiko still has a couple of comments:

https://sashiko.dev/#/patchset/20260401153949.77488-1-aureo.serrano%40arctic.de

Ignore the cache line comment. The concern about the redundant hid_device_io_stop()
seems real, though. Please check.

Thanks,
Guenter

> ---
> Thanks to Guenter Roeck and Thomas Weißschuh for the reviews.
> 
> Changes since v5:
> - arctic_fan_probe(): switch from devm_hwmon_device_register_with_info()
>    to hwmon_device_register_with_info(); store the returned pointer in
>    priv->hwmon_dev for explicit teardown in remove()
> - arctic_fan_remove(): call hwmon_device_unregister(priv->hwmon_dev)
>    before hid_device_io_stop/hid_hw_close/hid_hw_stop; this closes the
>    use-after-free window where a concurrent sysfs write could call
>    hid_hw_output_report() on an already-stopped device; matches the
>    removal pattern used by nzxt-smart2 and aquacomputer_d5next
> - arctic_fan_write(): expand write_pending comment to document the
>    residual theoretical late-ACK race (unfixable without a correlation
>    ID in the device ACK report) and its practical impossibility (observed
>    max ACK latency ~563 ms, timeout 1 s; a delay > 1 s indicates a
>    non-functional device)
> - arctic_fan_reset_resume(), arctic_fan_read(), arctic_fan_write():
>    extend in_report_lock coverage to pwm_duty[]; reset_resume() clears
>    pwm_duty[] outside the hwmon core lock, so all paths that read or
>    write pwm_duty[] now hold in_report_lock to prevent a data race
>    during resume
> - arctic_fan_write(): build the OUT report buffer inside in_report_lock
>    so reset_resume() cannot clear pwm_duty[] between the pwm_duty[]
>    snapshot and the buffer write; this makes the lock coverage complete
> 
> Changes since v4:
> - arctic_fan_write(): switch to wait_for_completion_timeout() (non-
>    interruptible); eliminates the signal-interrupted write case of the
>    late-ACK race that write_pending could not fully prevent
> - arctic_fan_write(): guard pwm_duty[channel] commit with
>    ack_status == 0 check; a device error ACK (status 0x01) no longer
>    silently poisons the cached duty used in future OUT reports
> - arctic_fan_probe()/remove(): replace devm_add_action_or_reset() +
>    no-op remove() with explicit hid_device_io_stop/hid_hw_close/
>    hid_hw_stop in remove(); devm_add_action_or_reset() was called after
>    hdev->driver = NULL, causing a NULL deref in hid_hw_close() on unbind
> - add reset_resume callback: device resets PWM to hardware defaults on
>    power loss during suspend; driver now clears cached pwm_duty[] on
>    reset-resume so stale pre-suspend values are not re-sent as if valid
> - Documentation/hwmon/arctic_fan_controller.rst: document suspend/
>    resume behaviour and the updated pwm[1-10] read semantics
> 
> Changes since v3:
> - buf[]: upgrade from __aligned(8) to ____cacheline_aligned so the
>    DMA buffer occupies its own cache line, preventing false sharing with
>    adjacent fan_rpm[]/pwm_duty[] fields on non-coherent architectures
> - arctic_fan_write(): add write_pending flag (protected by
>    in_report_lock) so raw_event() delivers ACKs only while a write is
>    in flight
> - arctic_fan_write(): commit pwm_duty[channel] only after the device
>    ACKs the command; a failed or timed-out write no longer leaves a
>    stale value in the cached duty state
> - arctic_fan_probe(): start IO (hid_device_io_start) before registering
>    with hwmon; previously a sysfs write arriving between hwmon
>    registration and io_start could send an OUT report whose ACK would be
>    discarded by the HID core, causing a spurious timeout
> - Documentation/hwmon/arctic_fan_controller.rst: document that cached
>    PWM values start at 0 (hardware state unknown at probe) and that each
>    OUT report carries all 10 channel values
> 
> Changes since v2:
> - buf[]: add __aligned(8) for DMA safety
> - ARCTIC_ACK_TIMEOUT_MS: restore 1000 ms; note observed max ~563 ms
> - arctic_fan_parse_report(): replace hwmon_lock/hwmon_unlock with
>    spin_lock_irqsave; hwmon_lock() may sleep and is unsafe when
>    raw_event() runs in hardirq/softirq context
> - arctic_fan_raw_event(): use spin_lock_irqsave for ACK path
> - arctic_fan_write(): use spin_lock_irqsave for completion reinit
> - arctic_fan_write(): clamp val to [0, 255] before u8 cast
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
> index 0000000000..b5be88ae46
> --- /dev/null
> +++ b/Documentation/hwmon/arctic_fan_controller.rst
> @@ -0,0 +1,56 @@
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
> +The device does not support GET_REPORT, so the driver cannot read back the
> +current hardware PWM state at probe time. The cached PWM values (readable
> +via pwm[1-10]) start at 0 and reflect only values that have been
> +successfully written. Because each OUT report carries all 10 channel values,
> +writing a single channel also sends the cached values for all other channels.
> +Users should set all channels to the desired values before relying on the
> +cached state.
> +
> +On system suspend, the device may lose power and reset its PWM channels to
> +hardware defaults. The driver clears its cached duty values on resume so
> +that reads reflect the unknown hardware state rather than stale pre-suspend
> +values. Userspace is responsible for re-applying the desired duty cycles
> +after resume.
> +
> +Sysfs entries
> +-------------
> +
> +================ ==============================================================
> +fan[1-10]_input  Fan speed in RPM (read-only). Updated from IN reports at ~1 Hz.
> +pwm[1-10]        PWM duty cycle (0-255). Write: sends an OUT report setting the
> +                 duty cycle (scaled from 0-255 to 0-100% for the device);
> +                 the cached value is updated only after the device ACKs the
> +                 command with a success status. Read: returns the last
> +                 successfully written value; initialized to 0 at driver load
> +                 and after resume (hardware state unknown).
> +================ ==============================================================
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
> index 0000000000..2bfb003f01
> --- /dev/null
> +++ b/drivers/hwmon/arctic_fan_controller.c
> @@ -0,0 +1,370 @@
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
> +#include <linux/cache.h>
> +#include <linux/completion.h>
> +#include <linux/err.h>
> +#include <linux/hid.h>
> +#include <linux/hwmon.h>
> +#include <linux/jiffies.h>
> +#include <linux/minmax.h>
> +#include <linux/module.h>
> +#include <linux/spinlock.h>
> +#include <linux/string.h>
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
> +	struct device *hwmon_dev;	/* stored for explicit unregister in remove() */
> +	spinlock_t in_report_lock;	/* protects fan_rpm, ack_status, write_pending, pwm_duty */
> +	struct completion in_report_received; /* ACK (ID 0x02) received in raw_event */
> +	int ack_status;			/* 0 = OK, negative errno on device error */
> +	bool write_pending;		/* true while an OUT report ACK is in flight */
> +	u32 fan_rpm[ARCTIC_NUM_FANS];
> +	u8 pwm_duty[ARCTIC_NUM_FANS];	/* 0-255 matching sysfs range; converted to 0-100 on send */
> +	/*
> +	 * OUT report buffer. Cache-line aligned so it occupies its own cache
> +	 * line, preventing DMA cache-coherency issues with adjacent fields
> +	 * (fan_rpm[], pwm_duty[]) on non-coherent architectures.
> +	 * Embedded in the devm_kzalloc'd struct so it is heap-allocated and
> +	 * passes usb_hcd_map_urb_for_dma(). Serialized by the hwmon core.
> +	 */
> +	u8 buf[ARCTIC_REPORT_LEN] ____cacheline_aligned;
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
> +		/*
> +		 * Only deliver if a write is in flight. This prevents a
> +		 * late-arriving ACK from a timed-out write from erroneously
> +		 * satisfying a subsequent write's completion wait.
> +		 */
> +		if (priv->write_pending) {
> +			priv->ack_status = data[1] == 0x00 ? 0 : -EIO;
> +			complete(&priv->in_report_received);
> +		}
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
> +		spin_lock_irqsave(&priv->in_report_lock, flags);
> +		*val = priv->pwm_duty[channel];
> +		spin_unlock_irqrestore(&priv->in_report_lock, flags);
> +		return 0;
> +	}
> +	return -EINVAL;
> +}
> +
> +static int arctic_fan_write(struct device *dev, enum hwmon_sensor_types type,
> +			    u32 attr, int channel, long val)
> +{
> +	struct arctic_fan_data *priv = dev_get_drvdata(dev);
> +	u8 new_duty = (u8)clamp_val(val, 0, 255);
> +	unsigned long flags;
> +	unsigned long t;
> +	int i, ret;
> +
> +	/*
> +	 * Build the buffer and arm write_pending under in_report_lock so that
> +	 * reset_resume() cannot clear pwm_duty[] between the pwm_duty[] read
> +	 * and the buffer write, and raw_event() cannot deliver a stale ACK
> +	 * from a previous write into this write's completion.
> +	 *
> +	 * priv->buf is heap-allocated (embedded in the devm_kzalloc'd struct),
> +	 * satisfying usb_hcd_map_urb_for_dma(). Exclusively accessed by
> +	 * write() which the hwmon core serializes.
> +	 *
> +	 * pwm_duty[channel] is committed only after a positive device ACK so a
> +	 * failed or timed-out write does not corrupt the cached state.
> +	 *
> +	 * Residual theoretical race: if write A times out (write_pending
> +	 * cleared), write B sets write_pending = true, and a late ACK from
> +	 * write A—delayed beyond ARCTIC_ACK_TIMEOUT_MS—arrives during write
> +	 * B's pending window, it would falsely satisfy write B's completion.
> +	 * This cannot be prevented in driver code without protocol support
> +	 * (for example, a correlation ID echoed in the device ACK report).
> +	 * In testing, observed ACK latency stayed below the 1 s timeout
> +	 * (maximum ~563 ms over 500 iterations).
> +	 *
> +	 * The wait is non-interruptible so that a signal cannot cause write()
> +	 * to return early while the OUT report is already in flight; an
> +	 * interruptible early return would create the same late-ACK window
> +	 * without even the timeout guard.
> +	 * Serialized by the hwmon core: only one arctic_fan_write() at a time.
> +	 * Use irqsave to match the IRQ context in which raw_event may run.
> +	 */
> +	spin_lock_irqsave(&priv->in_report_lock, flags);
> +	priv->buf[0] = ARCTIC_OUTPUT_REPORT_ID;
> +	for (i = 0; i < ARCTIC_NUM_FANS; i++) {
> +		u8 d = i == channel ? new_duty : priv->pwm_duty[i];
> +
> +		priv->buf[1 + i] = DIV_ROUND_CLOSEST((unsigned int)d * 100, 255);
> +	}
> +	priv->ack_status = -ETIMEDOUT;
> +	priv->write_pending = true;
> +	reinit_completion(&priv->in_report_received);
> +	spin_unlock_irqrestore(&priv->in_report_lock, flags);
> +
> +	ret = hid_hw_output_report(priv->hdev, priv->buf, ARCTIC_REPORT_LEN);
> +	if (ret < 0) {
> +		spin_lock_irqsave(&priv->in_report_lock, flags);
> +		priv->write_pending = false;
> +		spin_unlock_irqrestore(&priv->in_report_lock, flags);
> +		return ret;
> +	}
> +
> +	t = wait_for_completion_timeout(&priv->in_report_received,
> +					msecs_to_jiffies(ARCTIC_ACK_TIMEOUT_MS));
> +	spin_lock_irqsave(&priv->in_report_lock, flags);
> +	priv->write_pending = false;
> +	/* Commit inside the lock so reset_resume() cannot race with this write */
> +	if (t && priv->ack_status == 0)
> +		priv->pwm_duty[channel] = new_duty;
> +	spin_unlock_irqrestore(&priv->in_report_lock, flags);
> +
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
> +static int arctic_fan_reset_resume(struct hid_device *hdev)
> +{
> +	struct arctic_fan_data *priv = hid_get_drvdata(hdev);
> +	unsigned long flags;
> +
> +	/*
> +	 * The device resets its PWM channels to hardware defaults on power
> +	 * loss during suspend. Clear the cached duty values so they reflect
> +	 * the unknown hardware state, consistent with probe-time behaviour
> +	 * (the device has no GET_REPORT support). Hold in_report_lock so
> +	 * this does not race with a concurrent pwm read or write callback.
> +	 */
> +	spin_lock_irqsave(&priv->in_report_lock, flags);
> +	memset(priv->pwm_duty, 0, sizeof(priv->pwm_duty));
> +	spin_unlock_irqrestore(&priv->in_report_lock, flags);
> +	return 0;
> +}
> +
> +static int arctic_fan_probe(struct hid_device *hdev,
> +			    const struct hid_device_id *id)
> +{
> +	struct arctic_fan_data *priv;
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
> +	if (ret)
> +		goto out_stop;
> +
> +	/*
> +	 * Start IO before registering with hwmon. If IO were started after
> +	 * hwmon registration, a sysfs write arriving in that narrow window
> +	 * would send an OUT report but the ACK could not be delivered (the HID
> +	 * core discards events until io_started), causing a spurious timeout.
> +	 */
> +	hid_device_io_start(hdev);
> +
> +	/*
> +	 * Use the non-devm variant and store the pointer so remove() can
> +	 * call hwmon_device_unregister() before tearing down the HID
> +	 * transport. devm_hwmon_device_register_with_info() would defer
> +	 * unregistration until after remove() returns, leaving a window
> +	 * where a concurrent sysfs write could call hid_hw_output_report()
> +	 * on an already-stopped device (use-after-free).
> +	 */
> +	priv->hwmon_dev = hwmon_device_register_with_info(&hdev->dev, "arctic_fan",
> +							  priv, &arctic_fan_chip_info,
> +							  NULL);
> +	if (IS_ERR(priv->hwmon_dev)) {
> +		ret = PTR_ERR(priv->hwmon_dev);
> +		goto out_close;
> +	}
> +
> +	return 0;
> +
> +out_close:
> +	hid_device_io_stop(hdev);
> +	hid_hw_close(hdev);
> +out_stop:
> +	hid_hw_stop(hdev);
> +	return ret;
> +}
> +
> +static void arctic_fan_remove(struct hid_device *hdev)
> +{
> +	struct arctic_fan_data *priv = hid_get_drvdata(hdev);
> +
> +	/*
> +	 * Unregister hwmon before stopping the HID transport. This removes
> +	 * the sysfs files and waits for any in-progress write() callback to
> +	 * return, so no hwmon op can call hid_hw_output_report() after
> +	 * hid_hw_stop() frees the underlying USB resources.
> +	 * Matches the pattern used by nzxt-smart2 and aquacomputer_d5next.
> +	 */
> +	hwmon_device_unregister(priv->hwmon_dev);
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
> +	.reset_resume = arctic_fan_reset_resume,
> +};
> +
> +module_hid_driver(arctic_fan_driver);
> +
> +MODULE_AUTHOR("Aureo Serrano de Souza <aureo.serrano@arctic.de>");
> +MODULE_DESCRIPTION("HID hwmon driver for ARCTIC Fan Controller");
> +MODULE_LICENSE("GPL");

