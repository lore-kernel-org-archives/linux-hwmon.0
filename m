Return-path: <rpal143@gmail.com>
MIME-Version: 1.0
Sender: rpal143@gmail.com
In-Reply-To: <58FD77DA.9000007@denx.de>
References: <1492956651-15321-1-git-send-email-rahulbedarkar89@gmail.com>
 <6e36d265-294b-d700-3896-9f1a6d656a08@roeck-us.net> <58FD77DA.9000007@denx.de>
From: Rahul Bedarkar <rahulbedarkar89@gmail.com>
Date: Mon, 24 Apr 2017 12:19:18 +0530
Message-ID: <CA+NV+VkKxDqr2JfpEmXoMmRDBRfdNQxaXCn8H_3RdEaRw5JJCw@mail.gmail.com>
Subject: Re: [PATCH] hwmon: tmp103: use SIMPLE_DEV_PM_OPS helper macro
To: hs@denx.de, Guenter Roeck <linux@roeck-us.net>
Cc: Jean Delvare <jdelvare@suse.com>, linux-hwmon@vger.kernel.org,
	open list <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset=UTF-8
List-ID: <linux-hwmon@vger.kernel.org>

Hello Guenter, Heiko,

On Mon, Apr 24, 2017 at 9:28 AM, Heiko Schocher <hs@denx.de> wrote:
> Hello Guenter, Rahul,
>
> Hmm.. I like this patch too, but have also no idea, what is preffered.
>
> Looking into drivers/hwmon
>
> pollux:linux hs [master] $ grep -lr __maybe_unused drivers/hwmon/
> drivers/hwmon/tmp108.c
> drivers/hwmon/nct6775.c
> drivers/hwmon/hwmon-vid.c
> drivers/hwmon/max31722.c
>
> Ok, there are hwmon drivers, which use this version already ...

Yes, some hwmon drivers already use this approach. Some drivers in
other sub systems also using it from start or moving towards this
approach.

>
> pollux:linux hs [master] $ grep -lr CONFIG_PM drivers/hwmon/
> drivers/hwmon/max6639.c
> drivers/hwmon/jc42.c
> drivers/hwmon/fam15h_power.c
> drivers/hwmon/tmp102.c
> drivers/hwmon/gpio-fan.c
> drivers/hwmon/pwm-fan.c
> drivers/hwmon/tmp103.c
> drivers/hwmon/pmbus/Makefile
> drivers/hwmon/lm75.c
> drivers/hwmon/nct6683.c
> drivers/hwmon/adt7x10.h
> drivers/hwmon/w83627hf.c
> drivers/hwmon/abituguru3.c
> drivers/hwmon/Makefile
> drivers/hwmon/acpi_power_meter.c
> drivers/hwmon/adt7x10.c
> drivers/hwmon/abituguru.c
> drivers/hwmon/w83627ehf.c
>
> May this conversion should be done in a patch, which touches more
> devices?

I'm happy send patches converting remaining drivers once this is
settled or accepted.

Thanks for your reviews.

Regards,
Rahul
