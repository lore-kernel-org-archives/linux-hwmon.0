Received: from mail-pl1-f173.google.com (mail-pl1-f173.google.com [209.85.214.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6272A296BCD
	for <linux-hwmon@vger.kernel.org>; Fri, 20 Mar 2026 13:47:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.173
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774014451; cv=none; b=XQ2urKB4fgnjAKLV9s8k7eW0EctjOqXBDLPOT1kCn93pMGuH8BTu/dGc6dvTn0w2JkU0i1jJMBEDprDUXIRs0SROa5O5Y0XgkLe+5mCiz1UndRlClG5o7vIJnDh45IMPzSc2db2++iyu1ON6yfh/LiD+pHsS+ugbzFFaCNZKpjw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774014451; c=relaxed/simple;
	bh=1jqzhw0TW5GDonx289rUl94T8xcZI5Hu0OLZ/EdHJzY=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=AbKpvfCPPbsMwBUKHQzKbQjaZLdhCusqYB6CVClB3Pw4S7rVYLG7Y3TpMvBGwHnngSv/FdYTuGi+N0zLhMQRpWgAPuV74VnkGpDVhhqXqKYo7+gRxFDleQBzA/na5b95GBbIB1qekGoyjy1gH/T73UxhWQVtjTl0kzQpYvwYZXU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=YuzChMbA; arc=none smtp.client-ip=209.85.214.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="YuzChMbA"
Received: by mail-pl1-f173.google.com with SMTP id d9443c01a7336-2a871daa98fso5113835ad.1
        for <linux-hwmon@vger.kernel.org>; Fri, 20 Mar 2026 06:47:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1774014449; x=1774619249; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:sender:from:to:cc:subject:date:message-id:reply-to;
        bh=edLwQfqe8+tWcgYw6ppVD184WsgAvvH7A46+wh4YSjQ=;
        b=YuzChMbApgPkCQs/kpD7r8/O0yuhp0ZgKafRzC+SMAi7c69lSR90IYCVXYKcRqdxPp
         6Z185C5ZoQzqbqPyBHjfk6saR9xb42dOH3SwlzNP/opwBMR5ZdFXb3ON1kYWJtIxk/gD
         bhvw4BK5io2+nl6eCj7XHfEmHDYkxjWuPkwgJazF22hzO8YYIPejVNAXM2DtmUNBClAD
         dBBEn/iIAM09a3xL5rBbH2dlP3VOmGarIz2HDWvUlJvuHjA8W3S1AXgt9+PrOpdvTI6e
         q171CbIQpuFuJiiePohnEAqch3RX/iRtnVeY3NKGkiGGn0lS45+fGvFtke53k9fJa7CQ
         TECQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774014449; x=1774619249;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:sender:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=edLwQfqe8+tWcgYw6ppVD184WsgAvvH7A46+wh4YSjQ=;
        b=TaTw2D8AImLmpzxdLknOrAOtxIUjVVv3cj2LnilHe4GBYtjxyLHPWw+A7/FYKbsLCf
         1si16sbSb+8eYSowNP1XsQIs6+Vcj25CHd+CYW43tnblJXYsu3JQ7RtqLX5awDbRy2H7
         uz+3G8pWur1nzLVIOuD58mREaEup8S5iCcwmmzMvHT5NVmhpN00Qm6SBQGJ6c1rHfXK2
         3C4fMN9V3kVwplCTgNL8LiH1w0YvC9OA1sXiQ0Ng0OvHHdc5KtGh2U4NhFcoCitX/SJr
         fBO7jk8hFjMyWwpk/RQ1d9I/PluKlDPzAChzE6D+PZbzNYV4Zn9Wknnrex6dau7ca3pw
         7v9Q==
X-Forwarded-Encrypted: i=1; AJvYcCUkxi/vblbfqII432Vz6PDGP0VW0bzgscSBY2dHaSaEEteORbIw+op9JIELaHEnpLDKKfhjXCNrDUzxuA==@vger.kernel.org
X-Gm-Message-State: AOJu0YyAn6y4AxMWhS4k8DAq8e+xnCa8dAkD/rCMNfzu3LDXnmpadEoN
	1g8IiQHxnMNpFkSqkK9M07umwsGHsWgkKkvV4pr1LdGaZi85M6DkMTPc
X-Gm-Gg: ATEYQzxMSsPIJtXoaXyrit4gkFDjtoK2o2PcxCkKuEGcNBTrpCe4l9SxQjeG7hRTBZH
	qjSX3ENV85HQHdjdFUNYrefZE81nY7YQPw5EPyXsXzmGWkN3snKoBBT5N5DN/sFQyTf8FzL+2rq
	RClAWU1XW88qJVUWzujZ5TbIhBrDn+S5AAwU8tPCXBVPGL0AAnPu1C4ZWl+bXgO9hYeH2zwGEbE
	kJdCxucuwOJs82MeerKJkXvFd6/hqrATMoOBQ3+6g0/I3zWM5lcfiXI+DajDEvWrqZmCohqt31d
	TmDMXcwL3SH6n8TSgQG91g2xMGHb77neSDUreDIVULJ7h0OLdk8teamJ/casZEsews067wtfpZW
	26jdkBNg4f7mjAkK2kWWJTsdnlanfhSLaFFmjt4fuVsMYrdyOUsMxXjHU40IEIg+bV2FDHAZa2W
	QJsHUYPS7/ZJ0vUWC9WLErXA9gMaRbA4sSPb7W4m/q4bH5TezA+fyADlZ0yO6eDq2zHiUS2rmF
X-Received: by 2002:a17:902:f78d:b0:2ae:59d0:bf20 with SMTP id d9443c01a7336-2b08278b9f4mr25489685ad.31.1774014448471;
        Fri, 20 Mar 2026 06:47:28 -0700 (PDT)
Received: from ?IPV6:2600:1700:e321:62f0:da43:aeff:fecc:bfd5? ([2600:1700:e321:62f0:da43:aeff:fecc:bfd5])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2b08352a17asm23124685ad.24.2026.03.20.06.47.27
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 20 Mar 2026 06:47:27 -0700 (PDT)
Sender: Guenter Roeck <groeck7@gmail.com>
Message-ID: <aaa359dc-86fe-43a2-9b55-6829838f8443@roeck-us.net>
Date: Fri, 20 Mar 2026 06:47:26 -0700
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4] hwmon: add driver for ARCTIC Fan Controller
To: Aureo Serrano de Souza <aureo.serrano@arctic.de>,
 linux-hwmon@vger.kernel.org
Cc: linux@weissschuh.net, corbet@lwn.net, skhan@linuxfoundation.org,
 linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20260320080840.333968-1-aureo.serrano@arctic.de>
Content-Language: en-US
From: Guenter Roeck <linux@roeck-us.net>
Autocrypt: addr=linux@roeck-us.net; keydata=
 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
 np3900V20aS7eD9K8GTU0TGC1pyz6IVJwIE=
In-Reply-To: <20260320080840.333968-1-aureo.serrano@arctic.de>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

On 3/20/26 01:08, Aureo Serrano de Souza wrote:
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
> ---

Getting there, but Sashiko still finds problems.

https://sashiko.dev/#/patchset/20260320080840.333968-1-aureo.serrano%40arctic.de

Those are valid concerns far as I can see.

Thanks,
Guenter

> Thanks to Guenter Roeck and Thomas Weißschuh for the reviews.
> 
> Changes since v3:
> - buf[]: upgrade from __aligned(8) to ____cacheline_aligned so the
>    DMA buffer occupies its own cache line, preventing false sharing with
>    adjacent fan_rpm[]/pwm_duty[] fields on non-coherent architectures
> - arctic_fan_write(): add write_pending flag (protected by
>    in_report_lock) so raw_event() delivers ACKs only while a write is
>    in flight; prevents a late ACK from a signal-interrupted write from
>    satisfying a subsequent write's completion wait
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
> index 0000000000..834f09c813
> --- /dev/null
> +++ b/Documentation/hwmon/arctic_fan_controller.rst
> @@ -0,0 +1,49 @@
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
> +Sysfs entries
> +-------------
> +
> +================ ==============================================================
> +fan[1-10]_input  Fan speed in RPM (read-only). Updated from IN reports at ~1 Hz.
> +pwm[1-10]        PWM duty cycle (0-255). Write: sends an OUT report setting the
> +                 duty cycle (scaled from 0-255 to 0-100% for the device);
> +                 the cached value is updated only after the device ACKs the
> +                 command. Read: returns the last successfully written value;
> +                 initialized to 0 at driver load (hardware state unknown).
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
> index 0000000000..7b991735ed
> --- /dev/null
> +++ b/drivers/hwmon/arctic_fan_controller.c
> @@ -0,0 +1,328 @@
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
> +	spinlock_t in_report_lock;	/* protects fan_rpm[], ack_status, write_pending */
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
> +		 * late-arriving ACK from a signal-interrupted write from
> +		 * erroneously satisfying a subsequent write's completion wait.
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
> +	u8 new_duty = (u8)clamp_val(val, 0, 255);
> +	unsigned long flags;
> +	long t;
> +	int i, ret;
> +
> +	/*
> +	 * The hwmon core holds its lock for the duration of this callback,
> +	 * serializing concurrent writes. priv->buf is heap-allocated (embedded
> +	 * in the devm_kzalloc'd struct), satisfying usb_hcd_map_urb_for_dma().
> +	 *
> +	 * Use new_duty for the target channel and the cached value for all
> +	 * others. pwm_duty[channel] is committed only after a confirmed ACK so
> +	 * a failed or timed-out write does not corrupt the cached duty state.
> +	 */
> +	priv->buf[0] = ARCTIC_OUTPUT_REPORT_ID;
> +	for (i = 0; i < ARCTIC_NUM_FANS; i++)
> +		priv->buf[1 + i] = DIV_ROUND_CLOSEST(
> +			(unsigned int)(i == channel ? new_duty : priv->pwm_duty[i]) * 100, 255);
> +
> +	/*
> +	 * Set write_pending before sending the report and clear it in every
> +	 * exit path. raw_event() calls complete() only when write_pending is
> +	 * true, so a stale ACK from a signal-interrupted write cannot
> +	 * satisfy the next write's completion wait.
> +	 * Serialized by the hwmon core: only one arctic_fan_write() at a time.
> +	 * Use irqsave to match the IRQ context in which raw_event may run.
> +	 */
> +	spin_lock_irqsave(&priv->in_report_lock, flags);
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
> +	t = wait_for_completion_interruptible_timeout(&priv->in_report_received,
> +						      msecs_to_jiffies(ARCTIC_ACK_TIMEOUT_MS));
> +	spin_lock_irqsave(&priv->in_report_lock, flags);
> +	priv->write_pending = false;
> +	spin_unlock_irqrestore(&priv->in_report_lock, flags);
> +
> +	if (t < 0)
> +		return t; /* interrupted by signal */
> +	if (!t)
> +		return -ETIMEDOUT;
> +
> +	/* Commit the new duty only after hardware has acknowledged it */
> +	priv->pwm_duty[channel] = new_duty;
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
> +	/*
> +	 * Start IO before registering with hwmon. If IO were started after
> +	 * hwmon registration, a sysfs write arriving in that narrow window
> +	 * would send an OUT report but the ACK could not be delivered (the HID
> +	 * core discards events until io_started), causing a spurious timeout.
> +	 */
> +	hid_device_io_start(hdev);
> +
> +	hwmon_dev = devm_hwmon_device_register_with_info(&hdev->dev, "arctic_fan",
> +							 priv, &arctic_fan_chip_info,
> +							 NULL);
> +	if (IS_ERR(hwmon_dev))
> +		return PTR_ERR(hwmon_dev);
> +
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
> 

