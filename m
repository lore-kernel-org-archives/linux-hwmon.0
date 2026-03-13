Received: from todd.t-8ch.de (todd.t-8ch.de [159.69.126.157])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D461A373C01;
	Fri, 13 Mar 2026 17:41:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=159.69.126.157
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773423709; cv=none; b=G4HKEIiYO5bNLNw9u9K74v7cnwV70GwKxMinDuQ3wqegHengvddNfuXlY4rj30XId78wZ+EBPioM3+lv8PY6ci3rzJxIAnZraF+2exg4y/SUtmC8fy907j7KFfy5WmLNDq97OlNZgahFIudBTntIc6RTAfsSU758r8kEGAdJIBM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773423709; c=relaxed/simple;
	bh=J2RCEozD1RsQWMTeKjO7cChD5K4GMgbJnT2Je3Xjurw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=CiRYWv1mKVHD4lxRUz46iJ4i6AVvrfB+QugkPk4yv2bpnFVeFrS9wQxxzTiZiGEwB6TpxIwpRTHsSJdLCFz0Zv/oRGC6f5pCeupkSvT+hjCoxz6DDi2TJJoCp7Fwf4JKzeKChG985SCiIZD4xPf6YlSCzzG1dQyOYFqCobHyavk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=weissschuh.net; spf=pass smtp.mailfrom=weissschuh.net; dkim=pass (1024-bit key) header.d=weissschuh.net header.i=@weissschuh.net header.b=a+3grTX5; arc=none smtp.client-ip=159.69.126.157
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=weissschuh.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=weissschuh.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=weissschuh.net header.i=@weissschuh.net header.b="a+3grTX5"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=weissschuh.net;
	s=mail; t=1773423698;
	bh=J2RCEozD1RsQWMTeKjO7cChD5K4GMgbJnT2Je3Xjurw=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=a+3grTX5l8QQ2hygjOHO2LDcCiUM+pPQATAK4wa0Fk3NDyPTdR41z21PK8/wV7jj+
	 cNZwrSzG/sTSNIoy0zt+XWoj9RL4Ig4xUKtgA8JlYxL2UwOGu2vgiyf/z3aEkKkMOI
	 aTHRMbQk3dzd9vhPCMe6GVh/bKlbqlvjMHBfmlwo=
Date: Fri, 13 Mar 2026 18:41:38 +0100
From: Thomas =?utf-8?Q?Wei=C3=9Fschuh?= <linux@weissschuh.net>
To: Aureo Serrano de Souza <aureo.serrano@arctic.de>
Cc: Guenter Roeck <linux@roeck-us.net>, linux-hwmon@vger.kernel.org, 
	Jonathan Corbet <corbet@lwn.net>, Shuah Khan <skhan@linuxfoundation.org>, 
	linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2] hwmon: add driver for ARCTIC Fan Controller
Message-ID: <a3c4d461-c2b7-451d-b140-6d759da6f30c@t-8ch.de>
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

When sending new revisions, please don't send them as response to the
previous one. It results in much too large threads.

On 2026-03-13 19:19:55+0800, Aureo Serrano de Souza wrote:
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

Thanks for the clarifications!

> 2. Struct-embedded placement (suggested as an alternative) would create
>    a shared resource between concurrent arctic_fan_write() calls, causing
>    a race if two users write different PWM channels simultaneously.
> 
> kmalloc per write avoids both problems: the buffer is heap-allocated
> (passes DMA checks) and private to each write call (no sharing).
> 
> Signed-off-by: Aureo Serrano de Souza <aureo.serrano@arctic.de>
> ---
> Hi,
> 
> Thanks for the detailed review. Here is v2 addressing your feedback.
> If I missed anything, please let me know.

(...)

>  Documentation/hwmon/arctic_fan_controller.rst |  40 +++
>  Documentation/hwmon/index.rst                 |   1 +
>  MAINTAINERS                                   |   7 +
>  drivers/hwmon/Kconfig                         |  12 +
>  drivers/hwmon/Makefile                        |   1 +
>  drivers/hwmon/arctic_fan_controller.c         | 278 ++++++++++++++++++
>  6 files changed, 339 insertions(+)
>  create mode 100644 Documentation/hwmon/arctic_fan_controller.rst
>  create mode 100644 drivers/hwmon/arctic_fan_controller.c

(...)

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

Given the the driver will only ever probe for usb devices,
this could also 'depends on USB_HID'.

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

(...)

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

I would also drop the VID and PID from here. It has no additional value.

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
> +#include <linux/jiffies.h>
> +#include <linux/kernel.h>

Try to avoid kernel.h. It includes everything and the kitchensink.

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

As there is also ARCTIC_*ACK*_REPORT_ID, maybe call this one
ARCTIC_*OUTPUT*_REPORT_ID, etc.

> +#define ARCTIC_RPM_OFFSET	11	/* bytes 11-30: 10 x uint16 LE */
> +/* ACK report: device sends Report ID 0x02, 2 bytes (ID + status) after applying OUT report */
> +#define ARCTIC_ACK_REPORT_ID	0x02
> +#define ARCTIC_ACK_REPORT_LEN	2
> +/* Time to wait for ACK report after send */
> +#define ARCTIC_ACK_TIMEOUT_MS	1000

One second is a very long time. How long does the device take in
practice?

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

Avoid scopes like this. Here it is not needed at all and in those cases
where you need a new scope for guard() use scoped_guard().

> +		guard(mutex)(&priv->lock);
> +		for (i = 0; i < ARCTIC_NUM_FANS; i++)

Nowadays you could declare 'int i' inside the for(). Your choice.

> +			priv->fan_rpm[i] = get_unaligned_le16(&buf[rpm_off + i * 2]);
> +	}
> +}

(...)

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

The magic '11' should be '1 + ARCTIC_NUM_FANS'.
Or even easier, use kzalloc() above.

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

Without the implicit locking from the hwmon core, this would be racy
against concurrent invocations of arctic_fan_write().
Could you add a comment for that?

> +						      msecs_to_jiffies(ARCTIC_ACK_TIMEOUT_MS));
> +	if (t == 0)
> +		return -ETIMEDOUT;
> +	if (t < 0)
> +		return t; /* interrupted by signal */

First test for errors (t < 0), then non-error cases 't == 0'.

> +	return priv->ack_status; /* 0=OK, -EIO=device error */
> +}

(...)

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

Use devm_mutex_init().

> +	spin_lock_init(&priv->in_report_lock);
> +	init_completion(&priv->in_report_received);
> +	hid_set_drvdata(hdev, priv);

(...)
