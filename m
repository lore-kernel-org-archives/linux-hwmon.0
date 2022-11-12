Return-Path: <linux-hwmon-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A58C0C4332F
	for <linux-hwmon@archiver.kernel.org>; Sat, 12 Nov 2022 23:36:11 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229584AbiKLXgK (ORCPT <rfc822;linux-hwmon@archiver.kernel.org>);
        Sat, 12 Nov 2022 18:36:10 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52238 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235055AbiKLXgJ (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>);
        Sat, 12 Nov 2022 18:36:09 -0500
Received: from mail-pg1-x52c.google.com (mail-pg1-x52c.google.com [IPv6:2607:f8b0:4864:20::52c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A096ABE0D
        for <linux-hwmon@vger.kernel.org>; Sat, 12 Nov 2022 15:36:07 -0800 (PST)
Received: by mail-pg1-x52c.google.com with SMTP id 130so7260291pgc.5
        for <linux-hwmon@vger.kernel.org>; Sat, 12 Nov 2022 15:36:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:sender
         :from:to:cc:subject:date:message-id:reply-to;
        bh=HcQ8ZnUoEhohGtUVhU9oXvWWvC0Y/EF2HiQQN9rvq2g=;
        b=HlgWnf9cnawJv2eDGjPKB/MTSST8L0aaPfnO8V3FCPKJBL8mWP/QKveMV+NkspTcX5
         8Cy1QSpfNbP6kHg8n0BXzwDZ1w+7/zUqyzC8+qxP9CsJa7PAaXNR1tt9Zv2xQ6l0gFmP
         Epj2NIAH/3qWdvMMI96oLnlqFrfZAOdpQLSfnYTCxj55lqK1EscQwQZ+jlOH357QgDev
         kETHFpiEIEzgBmD2dlNj29cYbdg98R1M4xcFwEVuGqFf/Rxye8UOW2+am1eUlOGus9lw
         HOBFqRG9hw11/DK8chzUTbm2whrNysJzP55PWe3BKbUUQUK0Bzbb0/aMPoM0OZKFuba0
         r7FA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:sender
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=HcQ8ZnUoEhohGtUVhU9oXvWWvC0Y/EF2HiQQN9rvq2g=;
        b=QUQ/Iqf56XUllpr9Grznzy67b1+Cinknhl0rTriNGkJm9rqiEe0/S3H4GLFtbkbRHf
         TBO3oyiCldhf+TIMQlcihXrPohbjNHwCVxXB0jV5CorUi7aSmaJsJhKEEvxAjy+shIf1
         4YTZ+EO1O4RI0OVcxzfyBSInQFwNFltYAqbHNrbOjlLCoEsdEWro1M/RGM1MgxsZFbRr
         qCgInxjaYMlgPmqtp1C/a1tG5pgJk5Nb89fDaY5oaHfgAU3vy+dwN7mZ1riq5LBOG4tP
         VAdFlKIIUUg6cuON9uzdGDlwzj7D5LQWsuQ7D/P9frHYqyZsXy6O4lMz0cdpp+9suTmk
         KKcA==
X-Gm-Message-State: ANoB5pmBDZMctP+y4hDMDqqE6UwbKGYGqkTmjUnmfaoLuBZ1LSlWv/2x
        /KxOOugdLhyhE9ZvqZ5wzzA=
X-Google-Smtp-Source: AA0mqf7/NQAY37qDKHSrxCX7np/PJDKbcfpyOG54b+5tSbr7GZqObJekRy2+e6iUeeKQVGPozly1uw==
X-Received: by 2002:a63:fb4d:0:b0:45c:19bb:d225 with SMTP id w13-20020a63fb4d000000b0045c19bbd225mr6603722pgj.242.1668296166919;
        Sat, 12 Nov 2022 15:36:06 -0800 (PST)
Received: from server.roeck-us.net ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
        by smtp.gmail.com with ESMTPSA id z27-20020aa7991b000000b0056c2e497ad6sm3880789pff.93.2022.11.12.15.36.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 12 Nov 2022 15:36:06 -0800 (PST)
Sender: Guenter Roeck <groeck7@gmail.com>
Date:   Sat, 12 Nov 2022 15:36:05 -0800
From:   Guenter Roeck <linux@roeck-us.net>
To:     Christian Lamparter <chunkeey@gmail.com>
Cc:     linux-hwmon@vger.kernel.org, Jean Delvare <jdelvare@suse.com>
Subject: Re: [PATCH v1] hwmon: (nct6775) Add chip ID for NCT6796D-S
Message-ID: <20221112233605.GA521020@roeck-us.net>
References: <9072e6884c86199765da31a23ef0935cedaaae6a.1668286473.git.chunkeey@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <9072e6884c86199765da31a23ef0935cedaaae6a.1668286473.git.chunkeey@gmail.com>
Precedence: bulk
List-ID: <linux-hwmon.vger.kernel.org>
X-Mailing-List: linux-hwmon@vger.kernel.org

On Sat, Nov 12, 2022 at 09:56:40PM +0100, Christian Lamparter wrote:
> found on the ASRock X670E PG Lightning (and possibly others).
> 
> the userspace sensors-detect utiliy found "a" chip right away:
> |Probing for Super-I/O at 0x2e/0x2f
> |[...]
> |Trying family `VIA/Winbond/Nuvoton/Fintek'...               Yes
> |Found unknown chip with ID 0xd802
> |    (logical device B has address 0x290, could be sensors)
> 
> Looking at the documentation: ASRock was nice enough to point
> the exact chip out in the mainboard's "English User Manual" [0].
> In section "1.5 Block Diagram" on page 10 it says "SIO NCT6796D-S".
> It is also mentioned that it uses eSPI to interface with the CPU.
> 
Who knows, maybe the "-S" is for "eSPI".

> Adding the chip's ID as a "clone" of the existing NCT6796D leads to:
> 
> |nct6796-isa-0290
> |Adapter: ISA adapter
> |Vcore:                720.00 mV (min =  +0.00 V, max =  +1.74 V)
> |in1:                    1.82 V  (min =  +0.00 V, max =  +0.00 V)  ALARM
> |AVCC:                   3.39 V  (min =  +0.00 V, max =  +0.00 V)  ALARM
> |+3.3V:                  3.28 V  (min =  +0.00 V, max =  +0.00 V)  ALARM
> |in4:                    1.66 V  (min =  +0.00 V, max =  +0.00 V)  ALARM
> |in5:                    1.05 V  (min =  +0.00 V, max =  +0.00 V)  ALARM
> |in6:                    1.46 V  (min =  +0.00 V, max =  +0.00 V)  ALARM
> |3VSB:                   3.39 V  (min =  +0.00 V, max =  +0.00 V)  ALARM
> |Vbat:                   3.23 V  (min =  +0.00 V, max =  +0.00 V)  ALARM
> |in9:                  904.00 mV (min =  +0.00 V, max =  +0.00 V)  ALARM
> |in10:                 608.00 mV (min =  +0.00 V, max =  +0.00 V)  ALARM
> |in11:                 608.00 mV (min =  +0.00 V, max =  +0.00 V)  ALARM
> |in12:                   1.04 V  (min =  +0.00 V, max =  +0.00 V)  ALARM
> |in13:                 896.00 mV (min =  +0.00 V, max =  +0.00 V)  ALARM
> |in14:                   1.26 V  (min =  +0.00 V, max =  +0.00 V)  ALARM
> |fan1:                  815 RPM  (min =    0 RPM)
> |fan2:                    0 RPM  (min =    0 RPM)
> |fan3:                  781 RPM  (min =    0 RPM)
> |fan7:                    0 RPM  (min =    0 RPM)
> |SYSTIN:                +26.5°C    sensor = thermistor
> |CPUTIN:                +27.0°C  (high = +80.0°C, hyst = +75.0°C)
> |AUXTIN0:                +2.0°C  (high = +67.0°C, hyst = +110.0°C)
> |AUXTIN1:               +15.0°C    sensor = thermistor
> |AUXTIN2:               +15.0°C    sensor = thermistor
> |AUXTIN3:               +13.0°C    sensor = thermistor
> |SMBUSMASTER 0:         +39.5°C  (high = +80.0°C, hyst = +75.0°C)
> |PCH_CHIP_CPU_MAX_TEMP:  +0.0°C
> |PCH_CHIP_TEMP:          +0.0°C
> |PCH_CPU_TEMP:           +0.0°C
> |TSI0_TEMP:             +39.9°C
> |intrusion0:           ALARM
> |intrusion1:           ALARM
> |beep_enable:          disabled
> 
> Of some note is:
>  - voltages for Vcore, 3V3, AVCC, 3VSB and Vbat have sensible values.
>    The other voltage inputs are likely "limited to a maximum value of
>    2.048V due to an internal setting of 8mV LSB (256 steps x 8mV = 2.048V)"
>    [1] (Section 8.6 Analog Inputs - page 58)
> 
>  - temperatures reported by SYSTIN (mainboard), TSI0+SMBUSMASTER (CPU-CCDs)
>    matches too. CPUTIN really seems to be the IO-DIE of the CPU.
> 
>  - fan1 rpms matches the AIO (2nd CPU fan).
>    fan3 is the 2nd chassis fan.
> 
>    The motherboard has pin-headers for 2 CPU-fans and 4 Chassis/AUX-fans.
>    This means that two are missing! The novuton documentation [1] says on
>    page 3 that there are 6 fan controls + monitoring inputs.
> 
>    what's odd is that pwm1-5 values provided through the sysfs interface.
>    and these are matching the fan curves that have been set in the bios.
> 
>  - intrusion is not connected, same with all PCH* sensors.
>    AUXTIN123 are not moving. AUXTIN0 is moving with
> 
> [0] https://download.asrock.com/Manual/X670E%20PG%20Lightning_English.pdf
> [1] https://www.nuvoton.com/export/resource-files/NCT6796D_Datasheet_V0_6.pdf
> Signed-off-by: Christian Lamparter <chunkeey@gmail.com>
> ---
> 
> Any insights into the missing two fan speed sensors would be very appreciated.

Two possibilities: There may be more options to enable those fan inputs (ie
different pins) not curently supported by the driver, or there is a fan
multiplexer on the board. Hard if not impossible to say without datasheet.
I think asrock has a configuration utility for Windows which includes
configuration files for the various boards, or at least they used to have
it. Maybe it is possible to install that utility and examine the configuration
file.

> I didn't find a datasheet that talks about the "NCT6796D->S<" specifically or
> the "odd" 0xd802 id value.
> 

I would not call that "odd" just because it is not documented.

> (I checked on my mainboard and the label on the chip really ends with an "-S")
> Nuvoton lists the chip as "NCT6796D-E" on their website. But there are pictures

That is likely a different chip (ie just another name for NCT6796D).

> on google that show a ASRock X570 Taichi motherboard with a NCT6796D-"R" chip.
> This looks to me that the letter is something like a revision or model year?

More likely it is yet another variant.

> ---
>  drivers/hwmon/nct6775-core.c     | 1 +
>  drivers/hwmon/nct6775-platform.c | 2 ++
>  2 files changed, 3 insertions(+)
> 
> diff --git a/drivers/hwmon/nct6775-core.c b/drivers/hwmon/nct6775-core.c
> index da9ec6983e13..8147544ad5d6 100644
> --- a/drivers/hwmon/nct6775-core.c
> +++ b/drivers/hwmon/nct6775-core.c
> @@ -29,6 +29,7 @@
>   * nct6793d    15      6       6       2+6    0xd120 0xc1    0x5ca3
>   * nct6795d    14      6       6       2+6    0xd350 0xc1    0x5ca3
>   * nct6796d    14      7       7       2+6    0xd420 0xc1    0x5ca3
> + *                                           (0xd802)

Almost good, but please mark as "nct6796d-s". The (0xd802) isn't
appropriate here. If anything, you would want something like 0xd800 as
main entry and (0xd802) below to match the other entries.

>   * nct6797d    14      7       7       2+6    0xd450 0xc1    0x5ca3
>   *                                           (0xd451)
>   * nct6798d    14      7       7       2+6    0xd428 0xc1    0x5ca3
> diff --git a/drivers/hwmon/nct6775-platform.c b/drivers/hwmon/nct6775-platform.c
> index b34783784213..f355d0c2a8cd 100644
> --- a/drivers/hwmon/nct6775-platform.c
> +++ b/drivers/hwmon/nct6775-platform.c
> @@ -84,6 +84,7 @@ MODULE_PARM_DESC(fan_debounce, "Enable debouncing for fan RPM signal");
>  #define SIO_NCT6793_ID		0xd120
>  #define SIO_NCT6795_ID		0xd350
>  #define SIO_NCT6796_ID		0xd420
> +#define SIO_NCT6796S_ID		0xd800
>  #define SIO_NCT6797_ID		0xd450
>  #define SIO_NCT6798_ID		0xd428
>  #define SIO_ID_MASK		0xFFF8
> @@ -987,6 +988,7 @@ static int __init nct6775_find(int sioaddr, struct nct6775_sio_data *sio_data)
>  		sio_data->kind = nct6795;
>  		break;
>  	case SIO_NCT6796_ID:
> +	case SIO_NCT6796S_ID:
>  		sio_data->kind = nct6796;
>  		break;
>  	case SIO_NCT6797_ID:
> -- 
> 2.38.1
> 
