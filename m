Return-Path: <linux-hwmon-owner@vger.kernel.org>
Return-path: <linux-hwmon-owner@vger.kernel.org>
Received: from mail-pf1-f194.google.com ([209.85.210.194]:36180 "EHLO
        mail-pf1-f194.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727539AbeHKWqY (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>);
        Sat, 11 Aug 2018 18:46:24 -0400
Date: Sat, 11 Aug 2018 12:15:34 -0700
From: Guenter Roeck <linux@roeck-us.net>
To: Linus Walleij <linus.walleij@linaro.org>
Cc: Tejun Heo <tj@kernel.org>,
        Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>,
        Jean Delvare <jdelvare@suse.com>, linux-ide@vger.kernel.org,
        linux-hwmon@vger.kernel.org,
        smartmontools-support@listi.jpberlin.de
Subject: Re: [PATCH] RFC: libata: Add hwmon support for SMART temperature
 sensors
Message-ID: <20180811191534.GA24710@roeck-us.net>
References: <20180809222425.17304-1-linus.walleij@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20180809222425.17304-1-linus.walleij@linaro.org>
Sender: linux-hwmon-owner@vger.kernel.org
List-Id: linux-hwmon@vger.kernel.org

On Fri, Aug 10, 2018 at 12:24:25AM +0200, Linus Walleij wrote:
> S.M.A.R.T. temperature sensors have been supported for
> years by userspace tools such as smarttools.
> 
> The temperature readout is however also a good fit for
> Linux' hwmon subsystem. By adding a hwmon interface to dig
> out SMART parameter 194, we can expose the drive temperature
> as a standard hwmon sensor.
> 
> The idea came about when experimenting with NAS enclosures
> that lack their own on-board sensors but instead piggy-back
> the sensor found in the harddrive, if any, to decide on a
> policy for driving the on-board fan.
> 
> The kernel thermal subsystem supports defining a thermal
> policy for the enclosure using the device tree, see e.g.:
> arch/arm/boot/dts/gemini-dlink-dns-313.dts
> but this requires a proper hwmon sensor integrated with
> the kernel.
> 
> This is a first attempt at providing a kernel-internal
> hwmon sensor for ATA drives. It is possible to do the
> same for SCSI, NVME etc, but their protocols and
> peculiarities seem to require a per-subsystem implementation.
> They would all end up in the same namespace using the
> SCSI name such as "sd_0:0:0:0".
> 
> With this driver, the hard disk temperatur can be read from
> sysfs:
> 
>  > cd /sys/class/hwmon/hwmon0/
>  > cat temp1_input
>  38
> 
> This likely means that they can also be handled by
> userspace tools such as lm_sensors in a uniform way
> without need for any special tools such as "hddtemp"
> (which seems dormant) though I haven't tested it.
> 
> This driver does not block any simultaneous use of
> other SMART userspace tools, it's a both/and approach,
> not either/or.
> 
> Signed-off-by: Linus Walleij <linus.walleij@linaro.org>
> ---

[ ... ]

> +	/* Names the hwmon device something like "sd_0:0:0:0" */
> +	sname = devm_kasprintf(dev, GFP_KERNEL, "sd_%s", dev_name(dev));
> +	if (!sname)
> +		return -ENOMEM;

This is actually not needed and results in an awkward output such as

sd_10:0:0:0-scsi-10-0

as device name reported by the sensors command (after adding scsi bus
support to it). We don't usually encode device indexes into the name
string since it results in duplicate output. "sd" as name passed to
devm_hwmon_device_register_with_info() is sufficient.

I implemented the following translation from host:bus:slot:lun to
the sensors command output:

a:b:c:d -> scsi-a-bbcd, where a in the output is decimal and bbcd are hex
nibbles. Let me know if this is ok or if you have a better idea.

I found that some ssd drives report a temperature of 0 degrees C.

$ sudo hddtemp /dev/sdb
/dev/sdb: M4-CT256M4SSD2: 0°C

# sensors
sd_10:0:0:0-scsi-10-0
Adapter: SCSI adapter
temp1:         +0.0°C  (low  =  +0.0°C, high =  +0.0°C)

At least some drives (eg WDC WD4001FAEX-00MJRA0) don't report low/high
temperatures. Maybe we should detect this situation and not instantiate
the device (or the min/max attributes) if no useful data is returned.
What do you think ?
Are min/max temperatures configurable ?

Guenter
