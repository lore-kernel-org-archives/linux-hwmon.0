Return-Path: <linux-hwmon-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 52F8CC4167B
	for <linux-hwmon@archiver.kernel.org>; Fri, 30 Dec 2022 17:32:28 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229967AbiL3Rc1 (ORCPT <rfc822;linux-hwmon@archiver.kernel.org>);
        Fri, 30 Dec 2022 12:32:27 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36634 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229832AbiL3Rc1 (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>);
        Fri, 30 Dec 2022 12:32:27 -0500
Received: from mail-wr1-x432.google.com (mail-wr1-x432.google.com [IPv6:2a00:1450:4864:20::432])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 04A2E14028
        for <linux-hwmon@vger.kernel.org>; Fri, 30 Dec 2022 09:32:26 -0800 (PST)
Received: by mail-wr1-x432.google.com with SMTP id z16so3933462wrw.1
        for <linux-hwmon@vger.kernel.org>; Fri, 30 Dec 2022 09:32:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:cc:content-language
         :references:to:subject:user-agent:mime-version:date:message-id:from
         :to:cc:subject:date:message-id:reply-to;
        bh=o+XYRYLfeWPx9Hka5dzk6MfvgjXD/aL1HpwaQCGzzeU=;
        b=B+7XmYqvnjc2DtZ7u22OQIlAHqcyUvQswqIHj9sDEvMV94VU4CJpM0kyIBpElEQ+0W
         VcaAAXQywSGNuCmBYZeKgLBRq35DgMLuephSgKxuTS0Md8lhry2eKIjqAvoYpP/B0oyT
         riZXknpKIVS/bfhqFtQS/a+vAkAz54lZalH4gwZ/8Iw40u25DH6VTeGHaJolTdOzBCWY
         uAbWC7EYHoVEOFSXztJNpSzv3+YhjxVJWK7dpD8e4KTSX+3eD68rTesA81TLwPzmi/1R
         4gHitH6+GwYc5iWVIArvoXUyTz9gdBoguVe83NbqPvgGZ0NrLBoOy8j7WUl+3QbyilnR
         PtCQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:cc:content-language
         :references:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=o+XYRYLfeWPx9Hka5dzk6MfvgjXD/aL1HpwaQCGzzeU=;
        b=ck8vfagEdmQEeqAIU6bcKILtizJ8BZjvE+axrDJHzeiLPyxcrB1t9FunXEGAms22MU
         c/dwGc877sq57+uIm3Yp6kBh2+hwDLy8n0dYpmCvI4pv0J79eCRWNeR9nSX7+l8rEauH
         81ekL2nUI5b4vSb2vCYuL82GAVrFq578gf1mtGV4Xd2Ox4JqsReR4A5eeNukGHviWCIh
         bCuB/b2RfjmuqeMbEPIi4yq/P7+ButfMp2s97eKIF6d22kan9XmL0raq5gOpFXTktlcl
         LMZHUKHssPcZ3x8yR6+r7nGJo52z73BOP29rFmu0mfKWlp88x0jgu9FvvuQaY755Yd8g
         8y3Q==
X-Gm-Message-State: AFqh2kramGdCDD5E2xgdd0Rr+JuvJIeh2Eb0bHVRJInDVpQhfvly0WcC
        6RoSqS97Hda5WpKy6bAU9y3eCjyjtV0=
X-Google-Smtp-Source: AMrXdXt3KX/MqvtVldoUC6J4X7eqBb29sjaVa+6TTOFVjrTYkm8u5yyS3zRUavYuRWzdF/pnocXrqQ==
X-Received: by 2002:adf:f60b:0:b0:242:45e7:db25 with SMTP id t11-20020adff60b000000b0024245e7db25mr20933632wrp.37.1672421544174;
        Fri, 30 Dec 2022 09:32:24 -0800 (PST)
Received: from shift.daheim (pd9e2923a.dip0.t-ipconnect.de. [217.226.146.58])
        by smtp.gmail.com with ESMTPSA id t18-20020a5d42d2000000b00288a3fd9248sm6949990wrr.91.2022.12.30.09.32.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 30 Dec 2022 09:32:23 -0800 (PST)
Received: from localhost ([127.0.0.1])
        by shift.daheim with esmtp (Exim 4.96)
        (envelope-from <chunkeey@gmail.com>)
        id 1pBJF1-0008Rl-0g;
        Fri, 30 Dec 2022 18:32:23 +0100
Message-ID: <184c3523-fb00-b0df-cf29-cc1b171c4ab4@gmail.com>
Date:   Fri, 30 Dec 2022 18:32:23 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.6.0
Subject: Re: [PATCH RFT] hwmon: (nct6755) Add support for NCT6799D
To:     linux-hwmon@vger.kernel.org
References: <20221228135744.281752-1-linux () roeck-us ! net>
Content-Language: de-DE, en-US
Cc:     Guenter Roeck <linux@roeck-us.net>,
        Ahmad Khalifa <ahmad@khalifa.ws>,
        Sebastian Arnhold <sebastian.arnhold@posteo.de>
From:   Christian Lamparter <chunkeey@gmail.com>
In-Reply-To: <20221228135744.281752-1-linux () roeck-us ! net>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-hwmon.vger.kernel.org>
X-Mailing-List: linux-hwmon@vger.kernel.org

On 12/28/22 14:57, Guenter Roeck wrote:
> NCT6799D is mostly compatible to NCT6798D, with minor variations.
>
> Note that NCT6798D and NCT6799D have a new means to select temperature
> sources, and to report temperatures from those sources. This is not
> currently implemented, meaning that most likely not all temperatures
> are reported.
>
> Initial support. Compile tested only.

FYI: This ID is compatible with the NCT6796D-S on the ASRock X670E PG Lighting Mainboard.
(Previous discussion: "[PATCH v1] hwmon: (nct6775) Add chip ID for NCT6796D-S"
<https://www.spinics.net/lists/linux-hwmon/msg17785.html>)

With this patch applied, the nct6775 module loads and produces the following output when loaded.

| [28152.009197] nct6775: Found NCT6799D or compatible chip at 0x2e:0x290

and lm-sensors also enumerates the sensors and finally all six fans.
So this is definitively an improvement over my patch.

|# sensors
|
|nct6799-isa-0290
|Adapter: ISA adapter
|in0:                   720.00 mV (min =  +0.00 V, max =  +1.74 V)
|in1:                     1.82 V  (min =  +0.00 V, max =  +0.00 V)  ALARM
|in2:                     3.39 V  (min =  +2.98 V, max =  +3.63 V)
|in3:                     3.28 V  (min =  +2.98 V, max =  +3.63 V)
|in4:                     1.65 V  (min =  +0.00 V, max =  +0.00 V)  ALARM
|in5:                     1.05 V  (min =  +0.00 V, max =  +0.00 V)  ALARM
|in6:                     1.41 V  (min =  +0.00 V, max =  +0.00 V)  ALARM
|in7:                     3.39 V  (min =  +2.98 V, max =  +3.63 V)
|in8:                     3.23 V  (min =  +2.70 V, max =  +3.63 V)
|in9:                   904.00 mV (min =  +0.00 V, max =  +0.00 V)  ALARM
|in10:                  600.00 mV (min =  +0.00 V, max =  +0.00 V)  ALARM
|in11:                  608.00 mV (min =  +0.00 V, max =  +0.00 V)  ALARM
|in12:                    1.04 V  (min =  +0.00 V, max =  +0.00 V)  ALARM
|in13:                  896.00 mV (min =  +0.00 V, max =  +0.00 V)  ALARM
|in14:                    1.26 V  (min =  +0.00 V, max =  +0.00 V)  ALARM
|fan1:                   891 RPM  (min =    0 RPM)
|fan2:                     0 RPM  (min =    0 RPM)
|fan3:                  1345 RPM  (min =    0 RPM)
|fan4:                   774 RPM  (min =    0 RPM)
|fan5:                     0 RPM  (min =    0 RPM)
|fan7:                     0 RPM  (min =    0 RPM)
|SYSTIN:                 +29.5°C    sensor = thermistor
|CPUTIN:                 +29.0°C  (high = +80.0°C, hyst = +75.0°C)  sensor = thermistor
|AUXTIN0:                 +4.0°C  (high = +67.0°C, hyst = +110.0°C)  sensor = thermistor
|AUXTIN1:                +15.0°C    sensor = thermistor
|AUXTIN2:                +15.0°C    sensor = thermistor
|AUXTIN3:                +13.0°C    sensor = thermistor
|SMBUSMASTER 0:          +40.0°C  (high = +80.0°C, hyst = +75.0°C)
|PCH_CHIP_CPU_MAX_TEMP:   +0.0°C
|PCH_CHIP_TEMP:           +0.0°C
|PCH_CPU_TEMP:            +0.0°C
|TSI0_TEMP:              +40.0°C
|intrusion0:            ALARM
|intrusion1:            ALARM
|beep_enable:           disabled

Tested-by: Christian Lamparter <chunkeey@gmail.com>

Cheers,
Christian

(one comment below)
> diff --git a/drivers/hwmon/nct6775-platform.c b/drivers/hwmon/nct6775-platform.c
> index bf43f73dc835..906394b26781 100644
> --- a/drivers/hwmon/nct6775-platform.c
> +++ b/drivers/hwmon/nct6775-platform.c
> @@ -36,6 +36,7 @@ static const char * const nct6775_sio_names[] __initconst = {
>   	"NCT6796D",
>   	"NCT6797D",
>   	"NCT6798D",
> +	"NCT6799D",
>   };
>   
>   static unsigned short force_id;
> @@ -86,6 +87,7 @@ MODULE_PARM_DESC(fan_debounce, "Enable debouncing for fan RPM signal");
>   #define SIO_NCT6796_ID		0xd420
>   #define SIO_NCT6797_ID		0xd450
>   #define SIO_NCT6798_ID		0xd428
> +#define SIO_NCT6799_ID		0xd800
>   #define SIO_ID_MASK		0xFFF8
>   
>   /*
> @@ -408,7 +410,7 @@ static int nct6775_resume(struct device *dev)
>   	if (data->kind == nct6791 || data->kind == nct6792 ||
>   	    data->kind == nct6793 || data->kind == nct6795 ||
>   	    data->kind == nct6796 || data->kind == nct6797 ||
> -	    data->kind == nct6798)
> +	    data->kind == nct6798 || data->kind == nct6799)
>   		nct6791_enable_io_mapping(sio_data);
>   
>   	sio_data->sio_exit(sio_data);
> @@ -555,7 +557,7 @@ nct6775_check_fan_inputs(struct nct6775_data *data, struct nct6775_sio_data *sio
>   	} else {
>   		/*
>   		 * NCT6779D, NCT6791D, NCT6792D, NCT6793D, NCT6795D, NCT6796D,
> -		 * NCT6797D, NCT6798D
> +		 * NCT6797D, NCT6798D, NCT6799D
>   		 */
>   		int cr1a = sio_data->sio_inb(sio_data, 0x1a);
>   		int cr1b = sio_data->sio_inb(sio_data, 0x1b);
> @@ -565,12 +567,17 @@ nct6775_check_fan_inputs(struct nct6775_data *data, struct nct6775_sio_data *sio
>   		int cr2b = sio_data->sio_inb(sio_data, 0x2b);
>   		int cr2d = sio_data->sio_inb(sio_data, 0x2d);
>   		int cr2f = sio_data->sio_inb(sio_data, 0x2f);
> +		bool vsb_ctl_en = cr2f & BIT(0);
>   		bool dsw_en = cr2f & BIT(3);
>   		bool ddr4_en = cr2f & BIT(4);
> +		bool as_seq1_en = cr2f & BIT(7);
>   		int cre0;
> +		int cre6;
>   		int creb;
>   		int cred;
>   
> +			cre6 = sio_data->sio_inb(sio_data, 0xe0);
                         ^^ looks like one extra indent sneaked in?

