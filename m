Received: from mail-dy1-f178.google.com (mail-dy1-f178.google.com [74.125.82.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2F1F43502A8
	for <linux-hwmon@vger.kernel.org>; Tue,  3 Mar 2026 19:00:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.82.178
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772564431; cv=none; b=nSaipRTeYPSHyfb/m9h29bVk++kdBGpmMCQtLBv/tm/6evbdh/nFEYcKG1+Q8PFKrf0e8UhsqI0uYJpEh/d0XxfKM8dCXaVEs4vddz1F80Rx7WXobTUbfNZTfVOHKS53bDuifsYRZxHqjKKO+7EpkU4M+zvcwimICuQQjGdpKhs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772564431; c=relaxed/simple;
	bh=Mm0WXyQJDs/5yTh9RTubEw4/q70JyOL2vsN3vLR7mrI=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=SszxNIToDqdntosxEEh2iCqKDPxD0rH7oPM9F2LPyv3YcvdEJ6WnxPSn31c/kSd7PUtkZ1L58DZUlOFTJBpM07NUdG2d7IeVL4RuoBRpc8XsESD8WL6+LzmLxBnfZIaTRc8ICF5TJ/h67/wfjrzrduPc82fjEHvnuYY3e/RAl7k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=hXT/fo2r; arc=none smtp.client-ip=74.125.82.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="hXT/fo2r"
Received: by mail-dy1-f178.google.com with SMTP id 5a478bee46e88-2b6b0500e06so7358604eec.1
        for <linux-hwmon@vger.kernel.org>; Tue, 03 Mar 2026 11:00:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1772564428; x=1773169228; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:sender:from:to:cc:subject:date:message-id:reply-to;
        bh=VZjP0DiC2sZlysiLKQhw990uGf/0mWmi7UVGHpt+X80=;
        b=hXT/fo2rJuyDKdMUWbaTgRKUpwXdZ0dc/HpRN+Ij6wXVrgI7/w0MQInK7eUpfrF+kV
         SOUUdcDZA7F22QUFJ/xfPRNPTe7ErQUElHQdLj6Dl3KF1yC1UrMag1bst8NmGmVDii69
         /kowAHckEG07r1PqNTFmirbpm6jDjP5qu5lPjwrcyo9G4J/hj1PuylBDuZl0cn6mrcKG
         2kzqFBzeL0iNKhbl9AfoT66jghWLY0OY+2m61f3twHwayjoAe9h+40dw/mn6MAGUrTLZ
         aL0Vb3BtVF/Uiv8pzSLgjofGjMhOiLTG+qi3PpE0lWZg5XR1vmQOSNp491XwRwMQlD6G
         5SGg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772564428; x=1773169228;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:sender:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=VZjP0DiC2sZlysiLKQhw990uGf/0mWmi7UVGHpt+X80=;
        b=AYAf/e9F46bUP5swXx60tbHjBhPKFhrhoFCRHmSHNrUqxHV/jpIBtR6jOdj94/NDx0
         rBzVCCQlt1RJrd94+T3uoDWn0w/15iw7jFFB7/PxdRGLsg1TRDICbStllpaKnFMY3G2D
         tFRcsShIAOhJaAzuhuUs7svRsgLfWNdjLKYgZmISCuQV69P/Y6v3YdRa7+Cyc8xyviHD
         8EqqB0ubyWHHFocWsFiJWY7k00aXXW0TOOtk/n2MfNVSzqOXYBU07wIKeLX4+d2eaVA7
         G/mRxxeHZFh5jhT61IiJrcQtjC8niKXshz+YHkdjs+a2hNIesdvUn8YPPfl+2xP4kmCS
         PK3g==
X-Gm-Message-State: AOJu0Ywmh2PdWQlxBZJfI2F+HpE0955tkJXDYo4FrXlu8AwL+5hGKN0h
	oVW7aAz6GHdB8wVDpH9hycncj6xWaNw30/moxkuVDAJ7cCiJ719FMSfq
X-Gm-Gg: ATEYQzwEPGwXHPcNzL4w7KWPshtGRlD2HLoMFzuXEb9Alukl94QEUiIijbQjdyDoRBp
	1ORQUmAutjnXecw6kg6oNcZQ05PPsUMJEU/42gJoq22jS4nnL0Ai6lzc1q3KeAOi5Syp1AbGzaB
	Jwq52dLvgidASFAUIaxx72HE9UZEQzjASlohuke0LssZYmgV5X4BMuOp2HSFLnqP/dZeDQmCXJe
	bTiLGvo0vSnDJEMxhlkw8XQ3jiq5j82UhQUkJRv4ofkp+62+Y4O28auOVXjEkKYHAetjpD+DaB0
	RqRn5e2L8CYL2efJ3zz7vdVdEbl8O1qMjKaYxdmWI2Z/C9lMBFf3LGis3gQPNZu6yKhZGjRDAN6
	4es+08qW4FOMsec4UD7plGF0Vy7G+ijUyz18gKzvxEwxnYw6gygMxofBZcafzfPZKvatddxw0CX
	6OiODuoBcG0DMMlfl+m1yF4LSv2Xsyr+LyNS9yOi6vZhmy0y6wM4XzU8DEddrQxqalYlPZwnbT
X-Received: by 2002:a05:7301:6096:b0:2be:126c:e32d with SMTP id 5a478bee46e88-2be126ce47dmr2982438eec.39.1772564427913;
        Tue, 03 Mar 2026 11:00:27 -0800 (PST)
Received: from ?IPV6:2600:1700:e321:62f0:da43:aeff:fecc:bfd5? ([2600:1700:e321:62f0:da43:aeff:fecc:bfd5])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-2be1281ff70sm6295756eec.14.2026.03.03.11.00.26
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 03 Mar 2026 11:00:27 -0800 (PST)
Sender: Guenter Roeck <groeck7@gmail.com>
Message-ID: <8dd3367b-4a7c-414b-a4f4-41dc54578e2b@roeck-us.net>
Date: Tue, 3 Mar 2026 11:00:25 -0800
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] hwmon: add driver for ARCTIC Fan Controller
To: =?UTF-8?Q?Thomas_Wei=C3=9Fschuh?= <linux@weissschuh.net>,
 Aureo Serrano <aureo.serrano@arctic.de>
Cc: "linux-hwmon@vger.kernel.org" <linux-hwmon@vger.kernel.org>,
 Jonathan Corbet <corbet@lwn.net>, Shuah Khan <skhan@linuxfoundation.org>,
 "linux-doc@vger.kernel.org" <linux-doc@vger.kernel.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
References: <FR6P281MB590006F97DAC7A5C224D957BEF7FA@FR6P281MB5900.DEUP281.PROD.OUTLOOK.COM>
 <51d91216-8949-44a9-93d9-646d3f3563b1@t-8ch.de>
Content-Language: en-US
From: Guenter Roeck <linux@roeck-us.net>
Autocrypt: addr=linux@roeck-us.net; keydata=
 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
 np3900V20aS7eD9K8GTU0TGC1pyz6IVJwIE=
In-Reply-To: <51d91216-8949-44a9-93d9-646d3f3563b1@t-8ch.de>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

On 3/3/26 10:10, Thomas Weißschuh wrote:
> Hi!
> 
> On 2026-03-03 08:25:04+0000, Aureo Serrano wrote:
>>  From 1cc962124ca4343e682219372b08dec5d611d1af Mon Sep 17 00:00:00 2001
>> From: Aureo Serrano de Souza <aureo.serrano@arctic.de>
>> Date: Tue, 3 Mar 2026 15:06:35 +0800
>> Subject: [PATCH] hwmon: add driver for ARCTIC Fan Controller
>>
>> Add hwmon driver for the ARCTIC Fan Controller (USB HID VID 0x3904,
>> PID 0xF001) with 10 fan channels. Exposes fan RPM and PWM via sysfs.
>> Device pushes IN reports ~1 Hz; PWM set via OUT reports.
>>
>> Signed-off-by: Aureo Serrano de Souza <aureo.serrano@arctic.de>
>> ---

checkpatch reports:

total: 11 errors, 53 warnings, 6 checks, 360 lines checked

primarily because the patch uses spaces instead of tabs.

>>   Documentation/hwmon/arctic_fan_controller.rst |  33 ++

Needs to be added to Documentation/hwmon.index.rst.

>>   drivers/hwmon/Kconfig                         |  12 +
>>   drivers/hwmon/Makefile                        |   1 +
>>   drivers/hwmon/arctic_fan_controller.c         | 297 ++++++++++++++++++
>>   4 files changed, 343 insertions(+)
>>   create mode 100644 Documentation/hwmon/arctic_fan_controller.rst
>>   create mode 100644 drivers/hwmon/arctic_fan_controller.c
> 
> (...)
> 
>> diff --git a/drivers/hwmon/arctic_fan_controller.c b/drivers/hwmon/arctic_fan_controller.c
>> new file mode 100644
>> index 0000000..0738d41
>> --- /dev/null
>> +++ b/drivers/hwmon/arctic_fan_controller.c
>> @@ -0,0 +1,297 @@
>> +// SPDX-License-Identifier: GPL-2.0-or-later
>> +/*
>> + * Linux hwmon driver for ARCTIC Fan Controller
>> + *
>> + * USB Custom HID device (VID 0x3904, PID 0xF001) with 10 fan channels.
>> + * Exposes fan RPM (input) and PWM (0-255) via hwmon. Device pushes IN reports
>> + * at ~1 Hz; no GET_REPORT. OUT reports set PWM duty (bytes 1-10, 0-100%).
>> + */
>> +
>> +#include <linux/delay.h>
>> +#include <linux/err.h>
>> +#include <linux/hid.h>
>> +#include <linux/hwmon.h>
>> +#include <linux/hwmon-sysfs.h>
>> +#include <linux/kernel.h>
>> +#include <linux/module.h>
>> +#include <linux/spinlock.h>
>> +
>> +#define ARCTIC_VID           0x3904
>> +#define ARCTIC_PID           0xF001
>> +#define ARCTIC_NUM_FANS            10
>> +#define ARCTIC_REPORT_ID     0x01
>> +#define ARCTIC_REPORT_LEN    32
>> +#define ARCTIC_RPM_OFFSET    11    /* bytes 11-30: 10 x uint16 LE */
>> +
>> +static int arctic_fan_debug;
>> +module_param_named(debug, arctic_fan_debug, int, 0644);
>> +MODULE_PARM_DESC(debug, "Enable debug prints (0=off, 1=on)");
> 
> No need for this, hid_dbg() uses the dyndbg infrastructure under the
> hood for dynamic control of debugging messages.
> 
> https://www.kernel.org/doc/html/v6.19/admin-guide/dynamic-debug-howto.html
> 
> In general avoid adding any new module parameters.
> 
>> +
>> +struct arctic_fan_data {
>> +     struct hid_device *hdev;
>> +     struct device *hwmon_dev;
>> +     spinlock_t lock;        /* protects fan_rpm, pwm_duty, out_buf payload */
>> +     u8 *out_buf;
>> +     u32 fan_rpm[ARCTIC_NUM_FANS];
>> +     u8 pwm_duty[ARCTIC_NUM_FANS];
>> +};
>> +
>> +static const struct hid_device_id arctic_fan_id_table[] = {
>> +     { HID_USB_DEVICE(ARCTIC_VID, ARCTIC_PID) },
>> +     { }
>> +};
>> +MODULE_DEVICE_TABLE(hid, arctic_fan_id_table);
> 
> I would move this below, right before arctic_hid_driver.
> 
>> +/*
>> + * Parse report buffer: PWM at pwm_off (10 bytes 0-100), RPM at rpm_off
>> + * (10 x uint16 LE). Called from raw_event in atomic context; must use
>> + * spinlock only.
>> + */
>> +static void arctic_fan_parse_report(struct arctic_fan_data *priv, u8 *buf,
>> +                           int len, int pwm_off, int rpm_off)
>> +{
>> +     int i;
>> +     unsigned long flags;
>> +
>> +     if (len < rpm_off + 20 || pwm_off + 10 > len)
>> +           return;
>> +     spin_lock_irqsave(&priv->lock, flags);
>> +     for (i = 0; i < ARCTIC_NUM_FANS; i++) {
>> +           u8 d = buf[pwm_off + i];
>> +
>> +           priv->pwm_duty[i] = d <= 100 ? d : 0;
> 
> When would it ever be larger than 100?

Also, _if_ it ends up ever being larger, why report it as 0 instead of 100 ?

> 
>> +     }
>> +     for (i = 0; i < ARCTIC_NUM_FANS; i++) {
>> +           priv->fan_rpm[i] = (u32)(buf[rpm_off + i * 2] |
>> +                             (buf[rpm_off + i * 2 + 1] << 8));
> 
> get_unaligned_u32()
> 

That doesn't seem to exist. get_unaligned_le16(), maybe, but the data
is never unaligned. le16_to_cpup() might do.

>> +     }
>> +     spin_unlock_irqrestore(&priv->lock, flags);
>> +     if (arctic_fan_debug)
>> +           hid_dbg(priv->hdev, "arctic_fan: fan1=%u pwm1=%u\n",
>> +                 (unsigned int)priv->fan_rpm[0], (unsigned int)priv->pwm_duty[0]);
>> +}
>> +
>> +/*
>> + * raw_event: IN report id 0x01 len 32 (PWM 1-10, RPM 11-30) or id 0 len 31
>> + * (PWM 0-9, RPM 10-29). No GET_REPORT support; device pushes only.
>> + */
>> +static int arctic_fan_raw_event(struct hid_device *hdev,
>> +                       struct hid_report *report, u8 *data, int size)
>> +{
>> +     struct arctic_fan_data *priv;
>> +     int rpm_off;
>> +     bool match = false;
>> +
>> +     if (report->id == ARCTIC_REPORT_ID) {
>> +           if (size == ARCTIC_REPORT_LEN) {
>> +                 rpm_off = ARCTIC_RPM_OFFSET;
>> +                 match = true;
>> +           } else if (size == ARCTIC_REPORT_LEN - 1) {
>> +                 rpm_off = ARCTIC_RPM_OFFSET - 1;
>> +                 match = true;
>> +           }
>> +     } else if (report->id == 0 && size >= 31) {
>> +           rpm_off = 10;

ARCTIC_RPM_OFFSET == 11, so using "ARCTIC_RPM_OFFSET - 1" above and a constant
10 here is a bot confusing.

The entire logic should be explained in a comment.

>> +           match = true;
>> +     }
>> +     if (!match) {
>> +           if (arctic_fan_debug)
>> +                 hid_dbg(hdev, "arctic_fan: raw_event id=%u size=%d ignored\n",
>> +                       report->id, size);
>> +           return 0;
>> +     }
>> +     priv = hid_get_drvdata(hdev);
>> +     if (!priv)
>> +           return 0;
> 
> This can never happen.
> 
>> +     if (arctic_fan_debug)
>> +           hid_dbg(hdev, "arctic_fan: raw_event id=%u size=%d\n",
>> +                 report->id, size);
>> +     arctic_fan_parse_report(priv, data, size, rpm_off - 10, rpm_off);
>> +     return 0;
>> +}
>> +
>> +static umode_t arctic_fan_is_visible(const void *data,
>> +                            enum hwmon_sensor_types type,
>> +                            u32 attr, int channel)
>> +{
>> +     if (channel < 0 || channel >= ARCTIC_NUM_FANS)
>> +           return 0;

Another unnecessary check.

>> +     if (type == hwmon_fan && attr == hwmon_fan_input)
>> +           return 0444;
>> +     if (type == hwmon_pwm && attr == hwmon_pwm_input)
>> +           return 0644;
>> +     return 0;
>> +}
>> +
>> +static int arctic_fan_read(struct device *dev, enum hwmon_sensor_types type,
>> +                    u32 attr, int channel, long *val)
>> +{
>> +     struct arctic_fan_data *priv = dev_get_drvdata(dev);
>> +     unsigned long flags;
>> +
>> +     if (channel < 0 || channel >= ARCTIC_NUM_FANS)
>> +           return -EINVAL;

And another one.

>> +     spin_lock_irqsave(&priv->lock, flags);
>> +     if (type == hwmon_fan && attr == hwmon_fan_input) {
>> +           *val = priv->fan_rpm[channel];
>> +     } else if (type == hwmon_pwm && attr == hwmon_pwm_input) {
>> +           *val = (long)priv->pwm_duty[channel] * 255 / 100;
> 
> DIV_ROUND_CLOSEST()
> 
>> +     } else {
>> +           spin_unlock_irqrestore(&priv->lock, flags);
> 
> You can use the new guard() syntax from cleanup.h to avoid manual
> unlocks on error paths.
> 

Why would this code need interrupt disabled spinlocks in the first place ?

It reads individual entries from priv, but even if those are updated
in parallel I don't see why that would warrant disabling interrupts,
both here and in arctic_fan_parse_report().

The hwmon core already serializes read and write operations, so
the locks (much less interrupt disabling spinlocks) are not needed
for that either.

>> +           return -EINVAL;
>> +     }
>> +     spin_unlock_irqrestore(&priv->lock, flags);
>> +     return 0;
>> +}
>> +
>> +/* Send OUT report; buf[0]=0x01, buf[1..10]=PWM 0-100. May sleep. */
>> +static int arctic_fan_send_report(struct hid_device *hdev, u8 *buf)
>> +{
>> +     int i, ret;
>> +     const int max_retries = 8;
>> +
>> +     for (i = 0; i < max_retries; i++) {
>> +           ret = hid_hw_output_report(hdev, buf, ARCTIC_REPORT_LEN);
>> +           if (ret >= 0)
>> +                 return ret;
> 
> Return '0' here instead of normalizing it in the caller.
> 
>> +           if (ret != -EAGAIN)
>> +                 break;      /* e.g. -ENOSYS when transport lacks output_report */
> 
> USB HID does have ->output_report. You could enforce usage of the USB
> transport with hid_is_usb().
> 
>> +           msleep(25);
> 
> Use fsleep().
> 
>> +     }
>> +     for (i = 0; i < max_retries; i++) {
>> +           ret = hid_hw_raw_request(hdev, ARCTIC_REPORT_ID, buf,
>> +                              ARCTIC_REPORT_LEN, HID_OUTPUT_REPORT,
>> +                              HID_REQ_SET_REPORT);
>> +           if (ret != -EAGAIN)
>> +                 return ret;
>> +           msleep(25);
>> +     }
> 
> Are these retries really necessary?
> 
... and, if they are, this needs to be documented/explained in a comment.

>> +     return -EAGAIN;
>> +}
>> +
>> +static int arctic_fan_write(struct device *dev, enum hwmon_sensor_types type,
>> +                     u32 attr, int channel, long val)
>> +{
>> +     struct arctic_fan_data *priv = dev_get_drvdata(dev);
>> +     unsigned long flags;
>> +     int i, ret;
>> +     u8 duty;
>> +
>> +     if (channel < 0 || channel >= ARCTIC_NUM_FANS)
>> +           return -EINVAL;
> 
> This can never happen (the same in other functions).
> 
>> +     if (type != hwmon_pwm || attr != hwmon_pwm_input)
>> +           return -EINVAL;
> 
> This can also never happen.
> 
>> +     if (val < 0 || val > 255)
>> +           return -EINVAL;
>> +     duty = DIV_ROUND_CLOSEST(val * 100, 255);
>> +     if (duty > 100)
>> +           duty = 100;
> 
> This seems also impossible.
> 
>> +     if (!priv->out_buf)
>> +           return -ENOMEM;
> 
> This can never happen.
> 
>> +     spin_lock_irqsave(&priv->lock, flags);
>> +     priv->pwm_duty[channel] = duty;
>> +     priv->out_buf[0] = ARCTIC_REPORT_ID;
>> +     for (i = 0; i < ARCTIC_NUM_FANS; i++)
>> +           priv->out_buf[1 + i] = priv->pwm_duty[i] <= 100 ?
>> +                             priv->pwm_duty[i] : 0;
>> +     memset(priv->out_buf + 11, 0, ARCTIC_REPORT_LEN - 11);
>> +     spin_unlock_irqrestore(&priv->lock, flags);
>> +     ret = arctic_fan_send_report(priv->hdev, priv->out_buf);
>> +     return ret < 0 ? ret : 0;
>> +}
>> +
>> +static const struct hwmon_ops arctic_fan_ops = {
>> +     .is_visible = arctic_fan_is_visible,
>> +     .read = arctic_fan_read,
>> +     .write = arctic_fan_write,
>> +};
>> +
>> +static const struct hwmon_channel_info *arctic_fan_info[] = {
>> +     HWMON_CHANNEL_INFO(fan,
>> +                    HWMON_F_INPUT, HWMON_F_INPUT, HWMON_F_INPUT,
>> +                    HWMON_F_INPUT, HWMON_F_INPUT, HWMON_F_INPUT,
>> +                    HWMON_F_INPUT, HWMON_F_INPUT, HWMON_F_INPUT,
>> +                    HWMON_F_INPUT),
>> +     HWMON_CHANNEL_INFO(pwm,
>> +                    HWMON_PWM_INPUT, HWMON_PWM_INPUT, HWMON_PWM_INPUT,
>> +                    HWMON_PWM_INPUT, HWMON_PWM_INPUT, HWMON_PWM_INPUT,
>> +                    HWMON_PWM_INPUT, HWMON_PWM_INPUT, HWMON_PWM_INPUT,
>> +                    HWMON_PWM_INPUT),
>> +     NULL
>> +};
>> +
>> +static const struct hwmon_chip_info arctic_fan_chip_info = {
>> +     .ops = &arctic_fan_ops,
>> +     .info = arctic_fan_info,
>> +};
>> +
>> +static int arctic_fan_probe(struct hid_device *hdev,
>> +                     const struct hid_device_id *id)
>> +{
>> +     struct arctic_fan_data *priv;
>> +     struct device *hwmon_dev;
>> +     int ret;
>> +
>> +     ret = hid_parse(hdev);
>> +     if (ret)
>> +           return ret;
>> +
>> +     priv = devm_kzalloc(&hdev->dev, sizeof(*priv), GFP_KERNEL);
>> +     if (!priv)
>> +           return -ENOMEM;
>> +
>> +     priv->out_buf = devm_kmalloc(&hdev->dev, ARCTIC_REPORT_LEN, GFP_KERNEL);
>> +     if (!priv->out_buf)
>> +           return -ENOMEM;
> 
> The 32 byte buffer could be on the stack, saving this allocation and
> avoiding a shared resource.

It might need to be cache aligned, but even then it could be part of
struct arctic_fan_data.

> 
>> +
>> +     priv->hdev = hdev;
>> +     spin_lock_init(&priv->lock);
>> +     hid_set_drvdata(hdev, priv);
>> +
>> +     ret = hid_hw_start(hdev, HID_CONNECT_DRIVER);
>> +     if (ret)
>> +           return ret;
>> +
>> +     ret = hid_hw_open(hdev);
>> +     if (ret)
>> +           goto out_stop;
>> +
>> +     hid_device_io_start(hdev);
>> +
>> +     hwmon_dev = devm_hwmon_device_register_with_info(&hdev->dev, "arctic_fan",
>> +                                          priv, &arctic_fan_chip_info,
>> +                                          NULL);
> 
> You could assign directly to priv->hwmon_dev.

I don't immediately see where priv->hwmon_dev is used in the first place.

> 
>> +     if (IS_ERR(hwmon_dev)) {
>> +           ret = PTR_ERR(hwmon_dev);
>> +           goto out_close;
>> +     }
>> +     priv->hwmon_dev = hwmon_dev;
>> +     return 0;
>> +
>> +out_close:
>> +     hid_hw_close(hdev);
>> +out_stop:
>> +     hid_hw_stop(hdev);
>> +     return ret;
>> +}
>> +
>> +static void arctic_fan_remove(struct hid_device *hdev)
>> +{
>> +     hid_device_io_stop(hdev);
>> +     hid_hw_close(hdev);
>> +     hid_hw_stop(hdev);
>> +}
>> +
>> +static struct hid_driver arctic_fan_driver = {
>> +     .name = "arctic_fan",
>> +     .id_table = arctic_fan_id_table,
>> +     .probe = arctic_fan_probe,
>> +     .remove = arctic_fan_remove,
>> +     .raw_event = arctic_fan_raw_event,
>> +};
>> +
>> +module_hid_driver(arctic_fan_driver);
>> +
>> +MODULE_AUTHOR("Aureo Serrano de Souza <aureo.serrano@arctic.de>");
>> +MODULE_DESCRIPTION("HID hwmon driver for ARCTIC Fan Controller (VID 0x3904, PID 0xF001)");
> 
> No need to list the VID and PID here, they are already part of the
> module metadata through MODULE_DEVICE_TABLE().
> 
>> +MODULE_LICENSE("GPL");
>> -- 
>> 2.25.1
>>

