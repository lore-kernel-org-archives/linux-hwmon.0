Received: from todd.t-8ch.de (todd.t-8ch.de [159.69.126.157])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B0B753264EB;
	Tue,  3 Mar 2026 18:10:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=159.69.126.157
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772561452; cv=none; b=pHfsnOczb61eeaoZILQ0kqJLCcSfMXhtNewXRGezxESXnROj0V17sRuDmKUiBbDNT/Wwg2p9TYzr2ZU7SpqZBnQgkf1hJIBZYahtmhmH51/5SpiLq4t02ct4eFcDXrUz/EsKzqk0kiJAKjdAqABaYYwYl+FrJJDeJI/Tcnf9OxU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772561452; c=relaxed/simple;
	bh=JkWYD6HYNZQbIR/0qJLoy2Vn/E2eKYVz+O2n5aM/xhI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=BpX1t0odzlQ15vUSbouyjsvftq+/6PVmNu6KuIt4axebe0cgu3EDq4UT9jrJCuoc038yBSA+qYIdH6nFNRHBHkuTgfm1fVxNE2f8MxlscTPpWPM1N6oOq5zmSxiaRDKKpTliaX8e5wGxU980C9Pt7PdDGA7RgvkNx+mqPSByt8c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=weissschuh.net; spf=pass smtp.mailfrom=weissschuh.net; dkim=pass (1024-bit key) header.d=weissschuh.net header.i=@weissschuh.net header.b=PNCqHMOS; arc=none smtp.client-ip=159.69.126.157
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=weissschuh.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=weissschuh.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=weissschuh.net header.i=@weissschuh.net header.b="PNCqHMOS"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=weissschuh.net;
	s=mail; t=1772561448;
	bh=JkWYD6HYNZQbIR/0qJLoy2Vn/E2eKYVz+O2n5aM/xhI=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=PNCqHMOSkAGHBB63gYP5WHc4PliTSyOAlZdCkpR9kXNzU6zf2FkcOQhng1jb/UnLH
	 2RJqF71QuwCuPqJBYSoCNIrD94zM5vmA16vQRski6BnOV3svXM1hAcNMZWvsJsSWz2
	 HYydNGAW12Ep42yM7qCO0HGcfKDI0fVu+JVVF5Cg=
Date: Tue, 3 Mar 2026 19:10:47 +0100
From: Thomas =?utf-8?Q?Wei=C3=9Fschuh?= <linux@weissschuh.net>
To: Aureo Serrano <aureo.serrano@arctic.de>
Cc: "linux-hwmon@vger.kernel.org" <linux-hwmon@vger.kernel.org>, 
	Guenter Roeck <linux@roeck-us.net>, Jonathan Corbet <corbet@lwn.net>, 
	Shuah Khan <skhan@linuxfoundation.org>, "linux-doc@vger.kernel.org" <linux-doc@vger.kernel.org>, 
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Subject: Re: =?utf-8?B?wqBbUEFUQ0g=?= =?utf-8?Q?=5D?= hwmon: add driver for
 ARCTIC Fan Controller
Message-ID: <51d91216-8949-44a9-93d9-646d3f3563b1@t-8ch.de>
References: <FR6P281MB590006F97DAC7A5C224D957BEF7FA@FR6P281MB5900.DEUP281.PROD.OUTLOOK.COM>
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <FR6P281MB590006F97DAC7A5C224D957BEF7FA@FR6P281MB5900.DEUP281.PROD.OUTLOOK.COM>

Hi!

On 2026-03-03 08:25:04+0000, Aureo Serrano wrote:
> From 1cc962124ca4343e682219372b08dec5d611d1af Mon Sep 17 00:00:00 2001
> From: Aureo Serrano de Souza <aureo.serrano@arctic.de>
> Date: Tue, 3 Mar 2026 15:06:35 +0800
> Subject: [PATCH] hwmon: add driver for ARCTIC Fan Controller
> 
> Add hwmon driver for the ARCTIC Fan Controller (USB HID VID 0x3904,
> PID 0xF001) with 10 fan channels. Exposes fan RPM and PWM via sysfs.
> Device pushes IN reports ~1 Hz; PWM set via OUT reports.
> 
> Signed-off-by: Aureo Serrano de Souza <aureo.serrano@arctic.de>
> ---
>  Documentation/hwmon/arctic_fan_controller.rst |  33 ++
>  drivers/hwmon/Kconfig                         |  12 +
>  drivers/hwmon/Makefile                        |   1 +
>  drivers/hwmon/arctic_fan_controller.c         | 297 ++++++++++++++++++
>  4 files changed, 343 insertions(+)
>  create mode 100644 Documentation/hwmon/arctic_fan_controller.rst
>  create mode 100644 drivers/hwmon/arctic_fan_controller.c

(...)

> diff --git a/drivers/hwmon/arctic_fan_controller.c b/drivers/hwmon/arctic_fan_controller.c
> new file mode 100644
> index 0000000..0738d41
> --- /dev/null
> +++ b/drivers/hwmon/arctic_fan_controller.c
> @@ -0,0 +1,297 @@
> +// SPDX-License-Identifier: GPL-2.0-or-later
> +/*
> + * Linux hwmon driver for ARCTIC Fan Controller
> + *
> + * USB Custom HID device (VID 0x3904, PID 0xF001) with 10 fan channels.
> + * Exposes fan RPM (input) and PWM (0-255) via hwmon. Device pushes IN reports
> + * at ~1 Hz; no GET_REPORT. OUT reports set PWM duty (bytes 1-10, 0-100%).
> + */
> +
> +#include <linux/delay.h>
> +#include <linux/err.h>
> +#include <linux/hid.h>
> +#include <linux/hwmon.h>
> +#include <linux/hwmon-sysfs.h>
> +#include <linux/kernel.h>
> +#include <linux/module.h>
> +#include <linux/spinlock.h>
> +
> +#define ARCTIC_VID           0x3904
> +#define ARCTIC_PID           0xF001
> +#define ARCTIC_NUM_FANS            10
> +#define ARCTIC_REPORT_ID     0x01
> +#define ARCTIC_REPORT_LEN    32
> +#define ARCTIC_RPM_OFFSET    11    /* bytes 11-30: 10 x uint16 LE */
> +
> +static int arctic_fan_debug;
> +module_param_named(debug, arctic_fan_debug, int, 0644);
> +MODULE_PARM_DESC(debug, "Enable debug prints (0=off, 1=on)");

No need for this, hid_dbg() uses the dyndbg infrastructure under the
hood for dynamic control of debugging messages.

https://www.kernel.org/doc/html/v6.19/admin-guide/dynamic-debug-howto.html

In general avoid adding any new module parameters.

> +
> +struct arctic_fan_data {
> +     struct hid_device *hdev;
> +     struct device *hwmon_dev;
> +     spinlock_t lock;        /* protects fan_rpm, pwm_duty, out_buf payload */
> +     u8 *out_buf;
> +     u32 fan_rpm[ARCTIC_NUM_FANS];
> +     u8 pwm_duty[ARCTIC_NUM_FANS];
> +};
> +
> +static const struct hid_device_id arctic_fan_id_table[] = {
> +     { HID_USB_DEVICE(ARCTIC_VID, ARCTIC_PID) },
> +     { }
> +};
> +MODULE_DEVICE_TABLE(hid, arctic_fan_id_table);

I would move this below, right before arctic_hid_driver.

> +/*
> + * Parse report buffer: PWM at pwm_off (10 bytes 0-100), RPM at rpm_off
> + * (10 x uint16 LE). Called from raw_event in atomic context; must use
> + * spinlock only.
> + */
> +static void arctic_fan_parse_report(struct arctic_fan_data *priv, u8 *buf,
> +                           int len, int pwm_off, int rpm_off)
> +{
> +     int i;
> +     unsigned long flags;
> +
> +     if (len < rpm_off + 20 || pwm_off + 10 > len)
> +           return;
> +     spin_lock_irqsave(&priv->lock, flags);
> +     for (i = 0; i < ARCTIC_NUM_FANS; i++) {
> +           u8 d = buf[pwm_off + i];
> +
> +           priv->pwm_duty[i] = d <= 100 ? d : 0;

When would it ever be larger than 100?

> +     }
> +     for (i = 0; i < ARCTIC_NUM_FANS; i++) {
> +           priv->fan_rpm[i] = (u32)(buf[rpm_off + i * 2] |
> +                             (buf[rpm_off + i * 2 + 1] << 8));

get_unaligned_u32()

> +     }
> +     spin_unlock_irqrestore(&priv->lock, flags);
> +     if (arctic_fan_debug)
> +           hid_dbg(priv->hdev, "arctic_fan: fan1=%u pwm1=%u\n",
> +                 (unsigned int)priv->fan_rpm[0], (unsigned int)priv->pwm_duty[0]);
> +}
> +
> +/*
> + * raw_event: IN report id 0x01 len 32 (PWM 1-10, RPM 11-30) or id 0 len 31
> + * (PWM 0-9, RPM 10-29). No GET_REPORT support; device pushes only.
> + */
> +static int arctic_fan_raw_event(struct hid_device *hdev,
> +                       struct hid_report *report, u8 *data, int size)
> +{
> +     struct arctic_fan_data *priv;
> +     int rpm_off;
> +     bool match = false;
> +
> +     if (report->id == ARCTIC_REPORT_ID) {
> +           if (size == ARCTIC_REPORT_LEN) {
> +                 rpm_off = ARCTIC_RPM_OFFSET;
> +                 match = true;
> +           } else if (size == ARCTIC_REPORT_LEN - 1) {
> +                 rpm_off = ARCTIC_RPM_OFFSET - 1;
> +                 match = true;
> +           }
> +     } else if (report->id == 0 && size >= 31) {
> +           rpm_off = 10;
> +           match = true;
> +     }
> +     if (!match) {
> +           if (arctic_fan_debug)
> +                 hid_dbg(hdev, "arctic_fan: raw_event id=%u size=%d ignored\n",
> +                       report->id, size);
> +           return 0;
> +     }
> +     priv = hid_get_drvdata(hdev);
> +     if (!priv)
> +           return 0;

This can never happen.

> +     if (arctic_fan_debug)
> +           hid_dbg(hdev, "arctic_fan: raw_event id=%u size=%d\n",
> +                 report->id, size);
> +     arctic_fan_parse_report(priv, data, size, rpm_off - 10, rpm_off);
> +     return 0;
> +}
> +
> +static umode_t arctic_fan_is_visible(const void *data,
> +                            enum hwmon_sensor_types type,
> +                            u32 attr, int channel)
> +{
> +     if (channel < 0 || channel >= ARCTIC_NUM_FANS)
> +           return 0;
> +     if (type == hwmon_fan && attr == hwmon_fan_input)
> +           return 0444;
> +     if (type == hwmon_pwm && attr == hwmon_pwm_input)
> +           return 0644;
> +     return 0;
> +}
> +
> +static int arctic_fan_read(struct device *dev, enum hwmon_sensor_types type,
> +                    u32 attr, int channel, long *val)
> +{
> +     struct arctic_fan_data *priv = dev_get_drvdata(dev);
> +     unsigned long flags;
> +
> +     if (channel < 0 || channel >= ARCTIC_NUM_FANS)
> +           return -EINVAL;
> +     spin_lock_irqsave(&priv->lock, flags);
> +     if (type == hwmon_fan && attr == hwmon_fan_input) {
> +           *val = priv->fan_rpm[channel];
> +     } else if (type == hwmon_pwm && attr == hwmon_pwm_input) {
> +           *val = (long)priv->pwm_duty[channel] * 255 / 100;

DIV_ROUND_CLOSEST()

> +     } else {
> +           spin_unlock_irqrestore(&priv->lock, flags);

You can use the new guard() syntax from cleanup.h to avoid manual
unlocks on error paths.

> +           return -EINVAL;
> +     }
> +     spin_unlock_irqrestore(&priv->lock, flags);
> +     return 0;
> +}
> +
> +/* Send OUT report; buf[0]=0x01, buf[1..10]=PWM 0-100. May sleep. */
> +static int arctic_fan_send_report(struct hid_device *hdev, u8 *buf)
> +{
> +     int i, ret;
> +     const int max_retries = 8;
> +
> +     for (i = 0; i < max_retries; i++) {
> +           ret = hid_hw_output_report(hdev, buf, ARCTIC_REPORT_LEN);
> +           if (ret >= 0)
> +                 return ret;

Return '0' here instead of normalizing it in the caller.

> +           if (ret != -EAGAIN)
> +                 break;      /* e.g. -ENOSYS when transport lacks output_report */

USB HID does have ->output_report. You could enforce usage of the USB
transport with hid_is_usb().

> +           msleep(25);

Use fsleep().

> +     }
> +     for (i = 0; i < max_retries; i++) {
> +           ret = hid_hw_raw_request(hdev, ARCTIC_REPORT_ID, buf,
> +                              ARCTIC_REPORT_LEN, HID_OUTPUT_REPORT,
> +                              HID_REQ_SET_REPORT);
> +           if (ret != -EAGAIN)
> +                 return ret;
> +           msleep(25);
> +     }

Are these retries really necessary?

> +     return -EAGAIN;
> +}
> +
> +static int arctic_fan_write(struct device *dev, enum hwmon_sensor_types type,
> +                     u32 attr, int channel, long val)
> +{
> +     struct arctic_fan_data *priv = dev_get_drvdata(dev);
> +     unsigned long flags;
> +     int i, ret;
> +     u8 duty;
> +
> +     if (channel < 0 || channel >= ARCTIC_NUM_FANS)
> +           return -EINVAL;

This can never happen (the same in other functions).

> +     if (type != hwmon_pwm || attr != hwmon_pwm_input)
> +           return -EINVAL;

This can also never happen.

> +     if (val < 0 || val > 255)
> +           return -EINVAL;
> +     duty = DIV_ROUND_CLOSEST(val * 100, 255);
> +     if (duty > 100)
> +           duty = 100;

This seems also impossible.

> +     if (!priv->out_buf)
> +           return -ENOMEM;

This can never happen.

> +     spin_lock_irqsave(&priv->lock, flags);
> +     priv->pwm_duty[channel] = duty;
> +     priv->out_buf[0] = ARCTIC_REPORT_ID;
> +     for (i = 0; i < ARCTIC_NUM_FANS; i++)
> +           priv->out_buf[1 + i] = priv->pwm_duty[i] <= 100 ?
> +                             priv->pwm_duty[i] : 0;
> +     memset(priv->out_buf + 11, 0, ARCTIC_REPORT_LEN - 11);
> +     spin_unlock_irqrestore(&priv->lock, flags);
> +     ret = arctic_fan_send_report(priv->hdev, priv->out_buf);
> +     return ret < 0 ? ret : 0;
> +}
> +
> +static const struct hwmon_ops arctic_fan_ops = {
> +     .is_visible = arctic_fan_is_visible,
> +     .read = arctic_fan_read,
> +     .write = arctic_fan_write,
> +};
> +
> +static const struct hwmon_channel_info *arctic_fan_info[] = {
> +     HWMON_CHANNEL_INFO(fan,
> +                    HWMON_F_INPUT, HWMON_F_INPUT, HWMON_F_INPUT,
> +                    HWMON_F_INPUT, HWMON_F_INPUT, HWMON_F_INPUT,
> +                    HWMON_F_INPUT, HWMON_F_INPUT, HWMON_F_INPUT,
> +                    HWMON_F_INPUT),
> +     HWMON_CHANNEL_INFO(pwm,
> +                    HWMON_PWM_INPUT, HWMON_PWM_INPUT, HWMON_PWM_INPUT,
> +                    HWMON_PWM_INPUT, HWMON_PWM_INPUT, HWMON_PWM_INPUT,
> +                    HWMON_PWM_INPUT, HWMON_PWM_INPUT, HWMON_PWM_INPUT,
> +                    HWMON_PWM_INPUT),
> +     NULL
> +};
> +
> +static const struct hwmon_chip_info arctic_fan_chip_info = {
> +     .ops = &arctic_fan_ops,
> +     .info = arctic_fan_info,
> +};
> +
> +static int arctic_fan_probe(struct hid_device *hdev,
> +                     const struct hid_device_id *id)
> +{
> +     struct arctic_fan_data *priv;
> +     struct device *hwmon_dev;
> +     int ret;
> +
> +     ret = hid_parse(hdev);
> +     if (ret)
> +           return ret;
> +
> +     priv = devm_kzalloc(&hdev->dev, sizeof(*priv), GFP_KERNEL);
> +     if (!priv)
> +           return -ENOMEM;
> +
> +     priv->out_buf = devm_kmalloc(&hdev->dev, ARCTIC_REPORT_LEN, GFP_KERNEL);
> +     if (!priv->out_buf)
> +           return -ENOMEM;

The 32 byte buffer could be on the stack, saving this allocation and
avoiding a shared resource.

> +
> +     priv->hdev = hdev;
> +     spin_lock_init(&priv->lock);
> +     hid_set_drvdata(hdev, priv);
> +
> +     ret = hid_hw_start(hdev, HID_CONNECT_DRIVER);
> +     if (ret)
> +           return ret;
> +
> +     ret = hid_hw_open(hdev);
> +     if (ret)
> +           goto out_stop;
> +
> +     hid_device_io_start(hdev);
> +
> +     hwmon_dev = devm_hwmon_device_register_with_info(&hdev->dev, "arctic_fan",
> +                                          priv, &arctic_fan_chip_info,
> +                                          NULL);

You could assign directly to priv->hwmon_dev.

> +     if (IS_ERR(hwmon_dev)) {
> +           ret = PTR_ERR(hwmon_dev);
> +           goto out_close;
> +     }
> +     priv->hwmon_dev = hwmon_dev;
> +     return 0;
> +
> +out_close:
> +     hid_hw_close(hdev);
> +out_stop:
> +     hid_hw_stop(hdev);
> +     return ret;
> +}
> +
> +static void arctic_fan_remove(struct hid_device *hdev)
> +{
> +     hid_device_io_stop(hdev);
> +     hid_hw_close(hdev);
> +     hid_hw_stop(hdev);
> +}
> +
> +static struct hid_driver arctic_fan_driver = {
> +     .name = "arctic_fan",
> +     .id_table = arctic_fan_id_table,
> +     .probe = arctic_fan_probe,
> +     .remove = arctic_fan_remove,
> +     .raw_event = arctic_fan_raw_event,
> +};
> +
> +module_hid_driver(arctic_fan_driver);
> +
> +MODULE_AUTHOR("Aureo Serrano de Souza <aureo.serrano@arctic.de>");
> +MODULE_DESCRIPTION("HID hwmon driver for ARCTIC Fan Controller (VID 0x3904, PID 0xF001)");

No need to list the VID and PID here, they are already part of the
module metadata through MODULE_DEVICE_TABLE().

> +MODULE_LICENSE("GPL");
> -- 
> 2.25.1
> 
