Return-Path: <linux-hwmon-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B6B46C0015E
	for <linux-hwmon@archiver.kernel.org>; Sat, 15 Jul 2023 16:48:22 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229490AbjGOQsW (ORCPT <rfc822;linux-hwmon@archiver.kernel.org>);
        Sat, 15 Jul 2023 12:48:22 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:51988 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229483AbjGOQsV (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>);
        Sat, 15 Jul 2023 12:48:21 -0400
Received: from mail-pl1-x62c.google.com (mail-pl1-x62c.google.com [IPv6:2607:f8b0:4864:20::62c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 5877C2120
        for <linux-hwmon@vger.kernel.org>; Sat, 15 Jul 2023 09:48:20 -0700 (PDT)
Received: by mail-pl1-x62c.google.com with SMTP id d9443c01a7336-1b8ad9eede0so24155335ad.1
        for <linux-hwmon@vger.kernel.org>; Sat, 15 Jul 2023 09:48:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1689439700; x=1692031700;
        h=content-transfer-encoding:in-reply-to:subject:from:references:to
         :content-language:user-agent:mime-version:date:message-id:sender
         :from:to:cc:subject:date:message-id:reply-to;
        bh=b6CuOHGvHlmWA4nDoGAhOy9T1r8Rgwb4S1KMZYQUPfI=;
        b=QIL7SScAv8HhCDV0be9D1YVU6CywrjOq3dfLfXRPEt6CpCgLkonfaaYC/ao+cdMmTF
         YAvHkSKiUDRmCLSGiuif+IRqEDFyq4Uyz7bTFOfAdujYjUrCHnU60JPyWCn8ytvv4t7T
         vDOirXOq+SBpHQ9CQ0EUhuae5L2UrApXq3X/FaliIkLy4rckjbQTg0tDHSsMN3k3MhDm
         IyNQk3JSAEXAlQ84ePdVTKJAULBgV3KrxqjC7OAfb+rF84gOU4cnlcJSgd4S/7zwhhn0
         5auNc8QDH/ajne4ui6WaDWzoCDaL3rNpkhwb/+4Ouq0S62viojjRmu1/ZptJfp5vVNrk
         pYCg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1689439700; x=1692031700;
        h=content-transfer-encoding:in-reply-to:subject:from:references:to
         :content-language:user-agent:mime-version:date:message-id:sender
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=b6CuOHGvHlmWA4nDoGAhOy9T1r8Rgwb4S1KMZYQUPfI=;
        b=R0ODu3GFJKSpg3dsmJeZaQn2aCWqygW9GuctjI7/cCUwSkl/B9for0lthugvB6X9sK
         Ba1QXjX787JxmVMrGRxIHjBFo30Gb3ZqhT2BLOHJ9V8sdkDg3c2hWZmJ76gdEo4J7twF
         csPKNk2+qpvUkcD3/tlVWwsQKLTOlM5+g9AhmdCj8fc2jhxWeqGmSdRQ30b5TtT2o2Zm
         u309+SdbCQZIAUh5XVw+VkAbPg4IVojMX+jDUw2uaQV4VQQCK8rYOy18ckGiQhMoSEhx
         vIU7/PRD682hQbFun5kI5MTXgwol0uMpHxFIvawpJ0h/NT8qaS/F7poxg6kmSaGMU4hC
         fsYA==
X-Gm-Message-State: ABy/qLZjval6nuO5qfEzvktJWtmkyuSJQbtEeM/9gu/7U/wZfLKE0Av2
        WiBmdWeV53Y1P2JxQ9wSF73crM/Vzi0=
X-Google-Smtp-Source: APBJJlHCxoHRhTYWya9D8Z5shnpoe5+ABEgJ7ceeZfR1yi9J+lINmIocgbdYCcTPszvvLiUjEnqW4A==
X-Received: by 2002:a17:903:2288:b0:1b8:9b66:8532 with SMTP id b8-20020a170903228800b001b89b668532mr8763376plh.52.1689439699727;
        Sat, 15 Jul 2023 09:48:19 -0700 (PDT)
Received: from ?IPV6:2600:1700:e321:62f0:329c:23ff:fee3:9d7c? ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
        by smtp.gmail.com with ESMTPSA id cm10-20020a17090afa0a00b0025dc5749b4csm2770598pjb.21.2023.07.15.09.48.19
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 15 Jul 2023 09:48:19 -0700 (PDT)
Sender: Guenter Roeck <groeck7@gmail.com>
Message-ID: <9c4d7f9d-d417-077d-a709-d372214bf35c@roeck-us.net>
Date:   Sat, 15 Jul 2023 09:48:18 -0700
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.13.0
Content-Language: en-US
To:     Ahmad Khalifa <ahmad@khalifa.ws>, linux-hwmon@vger.kernel.org
References: <20230715153113.1307220-1-ahmad@khalifa.ws>
From:   Guenter Roeck <linux@roeck-us.net>
Subject: Re: [PATCH] hwmon: (nct6775) Add support for 18 IN readings for
 nct6799
In-Reply-To: <20230715153113.1307220-1-ahmad@khalifa.ws>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-hwmon.vger.kernel.org>
X-Mailing-List: linux-hwmon@vger.kernel.org

On 7/15/23 08:31, Ahmad Khalifa wrote:
> nct6799 supports 18 voltage readings where this driver stops at 16.
> 

You are adding three sets of registers, though, not just two. I think
you meant to say that the driver stops at 15.

> - Add additional VIN/IN_MIN/IN_MAX register values
> - Update ALARM bits for the 16 supported values only as support
>    for IN > 16 requires rebasing all other ALARM bits for other
> 

Turns out NCT6798 has officially 16 and inofficially 17 voltage inputs.


> Signed-off-by: Ahmad Khalifa <ahmad@khalifa.ws>
> ---
>   drivers/hwmon/nct6775-core.c | 33 +++++++++++++++++++++++++++++----
>   drivers/hwmon/nct6775.h      |  4 ++--
>   2 files changed, 31 insertions(+), 6 deletions(-)
> 
> diff --git a/drivers/hwmon/nct6775-core.c b/drivers/hwmon/nct6775-core.c
> index 7163a2473fa0..1006765d8483 100644
> --- a/drivers/hwmon/nct6775-core.c
> +++ b/drivers/hwmon/nct6775-core.c
> @@ -82,14 +82,16 @@ static const char * const nct6775_device_names[] = {
>   
>   /* Common and NCT6775 specific data */
>   
> -/* Voltage min/max registers for nr=7..14 are in bank 5 */
> +/* Voltage min/max registers for nr=7..14 are in bank 5
> + * 15-17 for NCT6799 only
> + */

Please use standard multi-line comments. This is not the networking subsystem.

>   
>   static const u16 NCT6775_REG_IN_MAX[] = {
>   	0x2b, 0x2d, 0x2f, 0x31, 0x33, 0x35, 0x37, 0x554, 0x556, 0x558, 0x55a,
> -	0x55c, 0x55e, 0x560, 0x562 };
> +	0x55c, 0x55e, 0x560, 0x562, 0x564, 0x570, 0x572 };
>   static const u16 NCT6775_REG_IN_MIN[] = {
>   	0x2c, 0x2e, 0x30, 0x32, 0x34, 0x36, 0x38, 0x555, 0x557, 0x559, 0x55b,
> -	0x55d, 0x55f, 0x561, 0x563 };
> +	0x55d, 0x55f, 0x561, 0x563, 0x565, 0x571, 0x573 };
>   static const u16 NCT6775_REG_IN[] = {
>   	0x20, 0x21, 0x22, 0x23, 0x24, 0x25, 0x26, 0x550, 0x551, 0x552
>   };
> @@ -340,9 +342,15 @@ static const u16 NCT6776_REG_TSI_TEMP[] = {
>   
>   /* NCT6779 specific data */
>   
> +/* 15-17 for NCT6799 only, register labels are:
> + *      CPUVC,  VIN1,  AVSB,  3VCC,  VIN0,  VIN8,  VIN4, 3VSB
> + *       VBAT,   VTT,  VIN5,  VIN6,  VIN2,  VIN3,  VIN7, VIN9
> + *       VHIF, VIN10
> + */
>   static const u16 NCT6779_REG_IN[] = {
>   	0x480, 0x481, 0x482, 0x483, 0x484, 0x485, 0x486, 0x487,
> -	0x488, 0x489, 0x48a, 0x48b, 0x48c, 0x48d, 0x48e };
> +	0x488, 0x489, 0x48a, 0x48b, 0x48c, 0x48d, 0x48e, 0x48f,
> +	0x470, 0x471};
>   
>   static const u16 NCT6779_REG_ALARM[NUM_REG_ALARM] = {
>   	0x459, 0x45A, 0x45B, 0x568 };
> @@ -697,6 +705,21 @@ static const char *const nct6799_temp_label[] = {
>   #define NCT6799_TEMP_MASK	0xbfff2ffe
>   #define NCT6799_VIRT_TEMP_MASK	0x80000c00
>   
> +/* NCT6799 layout of alarm bits is indexed by the REG_VIN
> + * order, which is
> + *      CPUVC,  VIN1,  AVSB,  3VCC,  VIN0,  VIN8,  VIN4, 3VSB
> + *       VBAT,   VTT,  VIN5,  VIN6,  VIN2,  VIN3,  VIN7, VIN9
> + * no space for 16-17: VHIF, VIN10 (bits 31, -1)

Why not use bit 31 ?

> + */
> +static const s8 NCT6799_ALARM_BITS[] = {
> +	0, 1, 2, 3, 8, -1, 20, 16,	/* in0.. in7 */
> +	17, 24, 25, 26, 27, 28, 29,	/* in8..in14 */
> +	30,				/* in15 */
> +	6, 7, 11, 10, 23, 33,		/* fan1..fan6 */
> +	-1, -1,				/* unused */
> +	4, 5, 13, -1, -1, -1,		/* temp1..temp6 */
> +	12, 9 };			/* intrusion0, intrusion1 */
> +
>   /* NCT6102D/NCT6106D specific data */
>   
>   #define NCT6106_REG_VBAT	0x318
> @@ -3972,6 +3995,8 @@ int nct6775_probe(struct device *dev, struct nct6775_data *data,
>   		case nct6797:
>   		case nct6798:
>   		case nct6799:
> +			data->in_num = 18;
> +			data->ALARM_BITS = NCT6799_ALARM_BITS;
>   			data->REG_TSI_TEMP = NCT6796_REG_TSI_TEMP;
>   			num_reg_tsi_temp = ARRAY_SIZE(NCT6796_REG_TSI_TEMP);
>   			break;
> diff --git a/drivers/hwmon/nct6775.h b/drivers/hwmon/nct6775.h
> index 44f79c5726a9..0607db9d1415 100644
> --- a/drivers/hwmon/nct6775.h
> +++ b/drivers/hwmon/nct6775.h
> @@ -97,7 +97,7 @@ struct nct6775_data {
>   	/* Register values */
>   	u8 bank;		/* current register bank */
>   	u8 in_num;		/* number of in inputs we have */
> -	u8 in[15][3];		/* [0]=in, [1]=in_max, [2]=in_min */
> +	u8 in[18][3];		/* [0]=in, [1]=in_max, [2]=in_min */
>   	unsigned int rpm[NUM_FAN];
>   	u16 fan_min[NUM_FAN];
>   	u8 fan_pulses[NUM_FAN];
> @@ -165,7 +165,7 @@ struct nct6775_data {
>   	u16 have_temp;
>   	u16 have_temp_fixed;
>   	u16 have_tsi_temp;
> -	u16 have_in;
> +	u32 have_in;		/* upgrade to 32 as 6799 needs 18 */

Unnecessary comment

>   
>   	/* Remember extra register values over suspend/resume */
>   	u8 vbat;
> 
> base-commit: 06c2afb862f9da8dc5efa4b6076a0e48c3fbaaa5
> prerequisite-patch-id: 36e3467bd9ea72cb3ad2bef638a8389a9537d111
> prerequisite-patch-id: 85db508f68cabb50472c0cc5ef3953fc46bee3b1

