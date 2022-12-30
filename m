Return-Path: <linux-hwmon-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 11466C4167B
	for <linux-hwmon@archiver.kernel.org>; Fri, 30 Dec 2022 17:50:33 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235159AbiL3Ruc (ORCPT <rfc822;linux-hwmon@archiver.kernel.org>);
        Fri, 30 Dec 2022 12:50:32 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39956 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235248AbiL3Ru0 (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>);
        Fri, 30 Dec 2022 12:50:26 -0500
Received: from mail-oo1-xc34.google.com (mail-oo1-xc34.google.com [IPv6:2607:f8b0:4864:20::c34])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 5A2CB1B9C2
        for <linux-hwmon@vger.kernel.org>; Fri, 30 Dec 2022 09:50:25 -0800 (PST)
Received: by mail-oo1-xc34.google.com with SMTP id d2-20020a4ab202000000b004ae3035538bso3771398ooo.12
        for <linux-hwmon@vger.kernel.org>; Fri, 30 Dec 2022 09:50:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:sender
         :from:to:cc:subject:date:message-id:reply-to;
        bh=FhmZ22vsqZ2JZNeRUAw5wUYiuSDzAhKbzppVj16mDOI=;
        b=GaZl/Yb92HvvE+0CwdC2ZYrHg8q2cnTyu8uk3UQmyiGNY0rrLrUMLvCINT1Zbr0SFA
         /mKzmzYztlO/LrGwuTjXTcDHsk/FspZW+CbcWyiSdtRTJPV+94aBiAy/vdAd+iUazj+U
         hyzvJIeknTwHCiA1LW9tiVvnZoPlkLGYgsLHax/xIwLU4LoFIi1V034yKStW1er5gi1Z
         1fq3aqW25AaJ1+zxCBsnat7ZZkqTPSYBIRfWZr5aEMHSZNNFddoFFjalUeIojIUPjsse
         ZjpaG3IOEh4iMLfpuJWb6coi3ZhBz1rWvj4fn4gOgA19j3ptKd4sF3b+8NnVMlMpAQZD
         h9nQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:sender
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=FhmZ22vsqZ2JZNeRUAw5wUYiuSDzAhKbzppVj16mDOI=;
        b=5goUWrBrnzv8lOb3zdP+eCjo2bhAc7ilBW9HBIC9nzkGEUoGsXcIdUBe6lfKIkLvTw
         0g7U6SERHBTkZOEaW9HCyjmLR0HMB5Gyk93VtOCjK9agGDhwDWY9uq7ryS1N8/CDLpQV
         WXNOY+nRm3hi05J6i5nn96MAHBdJag1KVal7ftKLntY93KrqCSryWOFniVWOjl2nNQqp
         MRLqXD8VaCifvVjvgw0c1CsyoimBQ+vqk3JqaDqBXwjfGkNzX96zMvVZKOQ2dO1OfaAG
         c0yTPXX+QcKoBIiuocoKduA4V2d0+0Xocaz6ylpJUFbuy2J/EB1FXTK+2Xrs5Lq3E747
         sxYg==
X-Gm-Message-State: AFqh2kpR2QV2ghqw+7qJNl4f8cb2t3ViqdzOh19FRVGhJN3uaZ7yKmv1
        rqgRILbN8ccMAXWjmu8cyCY=
X-Google-Smtp-Source: AMrXdXumVm0XaXSt+FnaVCZpWolkvci/S5WWCLkhy+/hd/2Hhh1JVsp6VLXKDqSfYabcrZVpkQukIg==
X-Received: by 2002:a4a:3794:0:b0:4a5:d0bf:41c3 with SMTP id r142-20020a4a3794000000b004a5d0bf41c3mr17798133oor.6.1672422624571;
        Fri, 30 Dec 2022 09:50:24 -0800 (PST)
Received: from server.roeck-us.net ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
        by smtp.gmail.com with ESMTPSA id h7-20020a4aa287000000b004805b00b2cdsm8786681ool.28.2022.12.30.09.50.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 30 Dec 2022 09:50:23 -0800 (PST)
Sender: Guenter Roeck <groeck7@gmail.com>
Date:   Fri, 30 Dec 2022 09:50:21 -0800
From:   Guenter Roeck <linux@roeck-us.net>
To:     Christian Lamparter <chunkeey@gmail.com>
Cc:     linux-hwmon@vger.kernel.org, Ahmad Khalifa <ahmad@khalifa.ws>,
        Sebastian Arnhold <sebastian.arnhold@posteo.de>
Subject: Re: [PATCH RFT] hwmon: (nct6755) Add support for NCT6799D
Message-ID: <20221230175021.GA1136102@roeck-us.net>
References: <184c3523-fb00-b0df-cf29-cc1b171c4ab4@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <184c3523-fb00-b0df-cf29-cc1b171c4ab4@gmail.com>
Precedence: bulk
List-ID: <linux-hwmon.vger.kernel.org>
X-Mailing-List: linux-hwmon@vger.kernel.org

Hi Christian,

On Fri, Dec 30, 2022 at 06:32:23PM +0100, Christian Lamparter wrote:
> On 12/28/22 14:57, Guenter Roeck wrote:
> > NCT6799D is mostly compatible to NCT6798D, with minor variations.
> > 
> > Note that NCT6798D and NCT6799D have a new means to select temperature
> > sources, and to report temperatures from those sources. This is not
> > currently implemented, meaning that most likely not all temperatures
> > are reported.
> > 
> > Initial support. Compile tested only.
> 
> FYI: This ID is compatible with the NCT6796D-S on the ASRock X670E PG Lighting Mainboard.
> (Previous discussion: "[PATCH v1] hwmon: (nct6775) Add chip ID for NCT6796D-S"
> <https://www.spinics.net/lists/linux-hwmon/msg17785.html>)
> 
> With this patch applied, the nct6775 module loads and produces the following output when loaded.
> 
> | [28152.009197] nct6775: Found NCT6799D or compatible chip at 0x2e:0x290
> 
> and lm-sensors also enumerates the sensors and finally all six fans.
> So this is definitively an improvement over my patch.
> 

Thanks a lot for testing. I'd suspect that NCT6796D-S was mislabeled
in the user manual. That would not be the first time.

> |# sensors
> |
> |nct6799-isa-0290
> |Adapter: ISA adapter
> |in0:                   720.00 mV (min =  +0.00 V, max =  +1.74 V)
> |in1:                     1.82 V  (min =  +0.00 V, max =  +0.00 V)  ALARM
> |in2:                     3.39 V  (min =  +2.98 V, max =  +3.63 V)
> |in3:                     3.28 V  (min =  +2.98 V, max =  +3.63 V)
> |in4:                     1.65 V  (min =  +0.00 V, max =  +0.00 V)  ALARM
> |in5:                     1.05 V  (min =  +0.00 V, max =  +0.00 V)  ALARM
> |in6:                     1.41 V  (min =  +0.00 V, max =  +0.00 V)  ALARM
> |in7:                     3.39 V  (min =  +2.98 V, max =  +3.63 V)
> |in8:                     3.23 V  (min =  +2.70 V, max =  +3.63 V)
> |in9:                   904.00 mV (min =  +0.00 V, max =  +0.00 V)  ALARM
> |in10:                  600.00 mV (min =  +0.00 V, max =  +0.00 V)  ALARM
> |in11:                  608.00 mV (min =  +0.00 V, max =  +0.00 V)  ALARM
> |in12:                    1.04 V  (min =  +0.00 V, max =  +0.00 V)  ALARM
> |in13:                  896.00 mV (min =  +0.00 V, max =  +0.00 V)  ALARM
> |in14:                    1.26 V  (min =  +0.00 V, max =  +0.00 V)  ALARM
> |fan1:                   891 RPM  (min =    0 RPM)
> |fan2:                     0 RPM  (min =    0 RPM)
> |fan3:                  1345 RPM  (min =    0 RPM)
> |fan4:                   774 RPM  (min =    0 RPM)
> |fan5:                     0 RPM  (min =    0 RPM)
> |fan7:                     0 RPM  (min =    0 RPM)

Interesting. Do you have three fans connected, and the motherboard has
seven fans ?

> |SYSTIN:                 +29.5°C    sensor = thermistor
> |CPUTIN:                 +29.0°C  (high = +80.0°C, hyst = +75.0°C)  sensor = thermistor
> |AUXTIN0:                 +4.0°C  (high = +67.0°C, hyst = +110.0°C)  sensor = thermistor

Hmm, that hysteresis value seems wrong. I'll need to check if the
register addresses are correct.

> |AUXTIN1:                +15.0°C    sensor = thermistor
> |AUXTIN2:                +15.0°C    sensor = thermistor
> |AUXTIN3:                +13.0°C    sensor = thermistor

Looks like either those are not connected, or there is a temperature
offset which is not applied, or it is set to wrong values (the chip
does support temperature offset registers).

Thanks,
Guenter

> |SMBUSMASTER 0:          +40.0°C  (high = +80.0°C, hyst = +75.0°C)
> |PCH_CHIP_CPU_MAX_TEMP:   +0.0°C
> |PCH_CHIP_TEMP:           +0.0°C
> |PCH_CPU_TEMP:            +0.0°C
> |TSI0_TEMP:              +40.0°C
> |intrusion0:            ALARM
> |intrusion1:            ALARM
> |beep_enable:           disabled
> 
> Tested-by: Christian Lamparter <chunkeey@gmail.com>
> 
> Cheers,
> Christian
> 
> (one comment below)
> > diff --git a/drivers/hwmon/nct6775-platform.c b/drivers/hwmon/nct6775-platform.c
> > index bf43f73dc835..906394b26781 100644
> > --- a/drivers/hwmon/nct6775-platform.c
> > +++ b/drivers/hwmon/nct6775-platform.c
> > @@ -36,6 +36,7 @@ static const char * const nct6775_sio_names[] __initconst = {
> >   	"NCT6796D",
> >   	"NCT6797D",
> >   	"NCT6798D",
> > +	"NCT6799D",
> >   };
> >   static unsigned short force_id;
> > @@ -86,6 +87,7 @@ MODULE_PARM_DESC(fan_debounce, "Enable debouncing for fan RPM signal");
> >   #define SIO_NCT6796_ID		0xd420
> >   #define SIO_NCT6797_ID		0xd450
> >   #define SIO_NCT6798_ID		0xd428
> > +#define SIO_NCT6799_ID		0xd800
> >   #define SIO_ID_MASK		0xFFF8
> >   /*
> > @@ -408,7 +410,7 @@ static int nct6775_resume(struct device *dev)
> >   	if (data->kind == nct6791 || data->kind == nct6792 ||
> >   	    data->kind == nct6793 || data->kind == nct6795 ||
> >   	    data->kind == nct6796 || data->kind == nct6797 ||
> > -	    data->kind == nct6798)
> > +	    data->kind == nct6798 || data->kind == nct6799)
> >   		nct6791_enable_io_mapping(sio_data);
> >   	sio_data->sio_exit(sio_data);
> > @@ -555,7 +557,7 @@ nct6775_check_fan_inputs(struct nct6775_data *data, struct nct6775_sio_data *sio
> >   	} else {
> >   		/*
> >   		 * NCT6779D, NCT6791D, NCT6792D, NCT6793D, NCT6795D, NCT6796D,
> > -		 * NCT6797D, NCT6798D
> > +		 * NCT6797D, NCT6798D, NCT6799D
> >   		 */
> >   		int cr1a = sio_data->sio_inb(sio_data, 0x1a);
> >   		int cr1b = sio_data->sio_inb(sio_data, 0x1b);
> > @@ -565,12 +567,17 @@ nct6775_check_fan_inputs(struct nct6775_data *data, struct nct6775_sio_data *sio
> >   		int cr2b = sio_data->sio_inb(sio_data, 0x2b);
> >   		int cr2d = sio_data->sio_inb(sio_data, 0x2d);
> >   		int cr2f = sio_data->sio_inb(sio_data, 0x2f);
> > +		bool vsb_ctl_en = cr2f & BIT(0);
> >   		bool dsw_en = cr2f & BIT(3);
> >   		bool ddr4_en = cr2f & BIT(4);
> > +		bool as_seq1_en = cr2f & BIT(7);
> >   		int cre0;
> > +		int cre6;
> >   		int creb;
> >   		int cred;
> > +			cre6 = sio_data->sio_inb(sio_data, 0xe0);
>                         ^^ looks like one extra indent sneaked in?
> 
