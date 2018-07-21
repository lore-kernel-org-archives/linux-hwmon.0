Return-Path: <linux-hwmon-owner@vger.kernel.org>
Return-path: <linux-hwmon-owner@vger.kernel.org>
Received: from mail-pg1-f196.google.com ([209.85.215.196]:42530 "EHLO
        mail-pg1-f196.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727274AbeGUFXa (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>);
        Sat, 21 Jul 2018 01:23:30 -0400
Received: by mail-pg1-f196.google.com with SMTP id y4-v6so8402676pgp.9
        for <linux-hwmon@vger.kernel.org>; Fri, 20 Jul 2018 21:32:15 -0700 (PDT)
Subject: Re: [PATCH] hwmon: rpi: add module alias to raspberrypi-hwmon
To: Peter Robinson <pbrobinson@gmail.com>,
        Jean Delvare <jdelvare@suse.com>, linux-hwmon@vger.kernel.org,
        linux-rpi-kernel@lists.infradead.org
Cc: Stefan Wahren <stefan.wahren@i2se.com>,
        Eric Anholt <eric@anholt.net>,
        Florian Fainelli <f.fainelli@gmail.com>
References: <20180720230212.26006-1-pbrobinson@gmail.com>
From: Guenter Roeck <linux@roeck-us.net>
Message-ID: <48b9e013-b1f2-4f11-d70d-9b13e69c639f@roeck-us.net>
Date: Fri, 20 Jul 2018 21:24:39 -0700
MIME-Version: 1.0
In-Reply-To: <20180720230212.26006-1-pbrobinson@gmail.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Sender: linux-hwmon-owner@vger.kernel.org
List-Id: linux-hwmon@vger.kernel.org

On 07/20/2018 04:02 PM, Peter Robinson wrote:
> The raspberrypi-hwmon driver doesn't automatically load, although it does work
> when loaded, by adding the alias it auto loads as expected when built as a
> module. Tested on RPi2/RPi3 on 32 bit kernel and RPi3B+ on aarch64 with
> Fedora 28 and a patched 4.18 RC kernel.
> 
> Fixes: q3c493c885cf ("hwmon: Add support for RPi voltage sensor")
> Signed-off-by: Peter Robinson <pbrobinson@gmail.com>
> CC: Stefan Wahren <stefan.wahren@i2se.com>
> CC: Eric Anholt <eric@anholt.net>

Acked-by: Guenter Roeck <linux@roeck-us.net>

Florian, I think the driver is in your tree - can you take this patch ?

Thanks,
Guenter

> ---
>   drivers/hwmon/raspberrypi-hwmon.c | 1 +
>   1 file changed, 1 insertion(+)
> 
> diff --git a/drivers/hwmon/raspberrypi-hwmon.c b/drivers/hwmon/raspberrypi-hwmon.c
> index fb4e4a6bb1f63..be5ba46908953 100644
> --- a/drivers/hwmon/raspberrypi-hwmon.c
> +++ b/drivers/hwmon/raspberrypi-hwmon.c
> @@ -164,3 +164,4 @@ module_platform_driver(rpi_hwmon_driver);
>   MODULE_AUTHOR("Stefan Wahren <stefan.wahren@i2se.com>");
>   MODULE_DESCRIPTION("Raspberry Pi voltage sensor driver");
>   MODULE_LICENSE("GPL v2");
> +MODULE_ALIAS("platform:raspberrypi-hwmon");
> 

