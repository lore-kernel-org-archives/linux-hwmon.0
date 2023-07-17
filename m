Return-Path: <linux-hwmon-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 89837C0015E
	for <linux-hwmon@archiver.kernel.org>; Mon, 17 Jul 2023 17:25:53 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230293AbjGQRZw (ORCPT <rfc822;linux-hwmon@archiver.kernel.org>);
        Mon, 17 Jul 2023 13:25:52 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42334 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229797AbjGQRZv (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>);
        Mon, 17 Jul 2023 13:25:51 -0400
Received: from mail-pf1-x435.google.com (mail-pf1-x435.google.com [IPv6:2607:f8b0:4864:20::435])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 470D8132
        for <linux-hwmon@vger.kernel.org>; Mon, 17 Jul 2023 10:25:36 -0700 (PDT)
Received: by mail-pf1-x435.google.com with SMTP id d2e1a72fcca58-6689430d803so3174324b3a.0
        for <linux-hwmon@vger.kernel.org>; Mon, 17 Jul 2023 10:25:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1689614736; x=1692206736;
        h=content-transfer-encoding:in-reply-to:subject:from:references:to
         :content-language:user-agent:mime-version:date:message-id:sender
         :from:to:cc:subject:date:message-id:reply-to;
        bh=XHHOagObjJDyrjGTDMhWDqIYLzqHWUTyGPL0imPoXik=;
        b=J9M4AS7oVjnsnjjyXY28QWIXtDBIIjYqh+9XTVYmUfQLsIZBuYmqZOctRL0UzkVHOR
         q+lJlH2c82WXx65cFr7nKyiaUHm2px4x1Psow8ean2MlCqFF9AeD99+6pyriyelbX412
         olWtTpXy18MDmuy3oDPyTjnWsrdHlOv/nDG/HOwa7LBlNcX87k/Qupj27Jz3abO/j5xv
         H4kUEq9gn/TeUtuKPEUbwD1MCJ5pZxryaf8SeNF0TAxbmfAekavrqY8Ae2yXegvcc9DX
         4FuMC6v5JH1ZTETco7MVi6ywLyepQoyB2HqIXSagxTRYAHECblbgqZ0GiYP/0WD7PPIg
         zRLg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1689614736; x=1692206736;
        h=content-transfer-encoding:in-reply-to:subject:from:references:to
         :content-language:user-agent:mime-version:date:message-id:sender
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=XHHOagObjJDyrjGTDMhWDqIYLzqHWUTyGPL0imPoXik=;
        b=eGOAF6kwWCn5b2ejlnFj3N6zKHS/NBI3Vxkq09pvVrq6Z2js7Gc8ikt4QO+S/r5tlv
         z3Hi3veobIU6CqvvMhlI5e6ccIIiz/9NTcc9nhE7yB60NrGDXmH7LL3SaLblmmy7WcvO
         SXw5D7GBP3zrQUK3J6w/pbg3Aw5eRn+c4ThxSrf/GZ9T6qigUbtkfVomgAmAP+I0f1zQ
         GWTUPG5OZlUYYvHVBsIeVZQyi/lfYJ79tmhj6LEX+/SjxADC26ct6qW4a42fKMg9qiDO
         Ms5p6gQxcn2OQ3d0n5cZ6Z0Z5IDMiDm/BnsJETH5IjKvFbzPKbLIjKgk4xA/lxN86hn/
         R4Jw==
X-Gm-Message-State: ABy/qLaf1/BRn6RKCFx/YFbdnv7Xy4UkACNhOkysz4ny0r6VxQQe2cGh
        Soi010xhuLvDY6R3b8u8firMySQNXNg=
X-Google-Smtp-Source: APBJJlHumz1bHoMwRI5nDapNZ2yW9EowC0F3aDI4Dsk02ezNkn6uyssNiZmut9i3rS4sKiKksCVmXg==
X-Received: by 2002:a05:6a00:2d8f:b0:682:4c9f:aa1 with SMTP id fb15-20020a056a002d8f00b006824c9f0aa1mr16360413pfb.5.1689614735455;
        Mon, 17 Jul 2023 10:25:35 -0700 (PDT)
Received: from ?IPV6:2600:1700:e321:62f0:329c:23ff:fee3:9d7c? ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
        by smtp.gmail.com with ESMTPSA id s25-20020a62e719000000b0064d57ecaa1dsm84890pfh.28.2023.07.17.10.25.34
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 17 Jul 2023 10:25:34 -0700 (PDT)
Sender: Guenter Roeck <groeck7@gmail.com>
Message-ID: <f6581485-54a6-1b83-dbba-9289b4c84fbb@roeck-us.net>
Date:   Mon, 17 Jul 2023 10:25:33 -0700
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.13.0
Content-Language: en-US
To:     Ahmad Khalifa <ahmad@khalifa.ws>, Jean Delvare <jdelvare@suse.com>,
        linux-hwmon@vger.kernel.org
References: <20230717164927.1625616-1-ahmad@khalifa.ws>
From:   Guenter Roeck <linux@roeck-us.net>
Subject: Re: [PATCH] hwmon: (nct6775) Increase and reorder ALARM/BEEP bits
In-Reply-To: <20230717164927.1625616-1-ahmad@khalifa.ws>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-hwmon.vger.kernel.org>
X-Mailing-List: linux-hwmon@vger.kernel.org

On 7/17/23 09:49, Ahmad Khalifa wrote:
> * Increase available bits, IN: 16 to 24, FAN: 8 to 12,
>    TEMP: 6 to 12

intrusion: 2 to 4 ? Curious: Why ? It doesn't seem to be used,
and it could easily be extended later if really needed.

> * Reorder alarm/beep definitions to match in order to allow
>    additional inputs in the future
> * Remove comments about 'unused' bits as probe() is a better
>    reference
> 
> Tried different ways to define the bits (arrays by type - too long,
> double dimensional - too complicated, a padding macro - rough to
> read and checkpatch won't allow it), so kept the original
> method as seems the neatest for readability, but expanded it to a
> consistent 12 entries per row (8 too long, 16 too wide).
> That way it's the least number of lines and easy to read.
> All BITS now take up around 616 bytes instead of 352 bytes.
> 
Move the story behind the change (what you tried but didn't work)
after '---' and just list the actual changes in the commit description.

> Testing note:
> * Tested on nct6799 with IN/FAN/TEMP, and changing min/max/high/hyst,
>    that triggers the corresponding alarms correctly. Good confirmation
>    on the original mapping of the registers and masks.
>    As to be expected, only 4 fans and 2 temps (fixed) have limits
>    currently on nct6799 on my board.
> * Trouble with testing intrusion alarms and beeps, no way to confirm
>    those. As I understand now, intrusion/caseopen is probably not
>    connected on my board.
>    And I haven't seen a buzzer on a board in ages.
> 
> Signed-off-by: Ahmad Khalifa <ahmad@khalifa.ws>
> ---
>   drivers/hwmon/nct6775-core.c | 169 +++++++++++++++--------------------
>   drivers/hwmon/nct6775.h      |  23 ++++-
>   2 files changed, 93 insertions(+), 99 deletions(-)
> 
> diff --git a/drivers/hwmon/nct6775-core.c b/drivers/hwmon/nct6775-core.c
> index 029344b933ed..736e2407b122 100644
> --- a/drivers/hwmon/nct6775-core.c
> +++ b/drivers/hwmon/nct6775-core.c
> @@ -98,31 +98,23 @@ static const u16 NCT6775_REG_IN[] = {
>   
>   static const u16 NCT6775_REG_ALARM[NUM_REG_ALARM] = { 0x459, 0x45A, 0x45B };
>   
> -/* 0..15 voltages, 16..23 fans, 24..29 temperatures, 30..31 intrusion */
> -
> -static const s8 NCT6775_ALARM_BITS[] = {
> -	0, 1, 2, 3, 8, 21, 20, 16,	/* in0.. in7 */
> -	17, -1, -1, -1, -1, -1, -1,	/* in8..in14 */
> -	-1,				/* unused */
> -	6, 7, 11, -1, -1,		/* fan1..fan5 */
> -	-1, -1, -1,			/* unused */
> -	4, 5, 13, -1, -1, -1,		/* temp1..temp6 */
> -	12, -1 };			/* intrusion0, intrusion1 */
> +static const s8 NCT6775_ALARM_BITS[NUM_ALARM_BITS] = {
> +	 0,  1,  2,  3,  8, 21, 20, 16, 17, -1, -1, -1,	  /* in0-in11     */
> +	-1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1,	  /* in12-in23    */
> +	 6,  7, 11, -1, -1, -1, -1, -1, -1, -1, -1, -1,	  /* fan1-fan12   */
> +	 6,  7, 11, -1, -1, -1, -1, -1, -1, -1, -1, -1,	  /* temp1-temp12 */

4, 5, 13

> +	12, -1,						  /* intr0-intr1  */
> +};
>   
>   static const u16 NCT6775_REG_BEEP[NUM_REG_BEEP] = { 0x56, 0x57, 0x453, 0x4e };
>   
> -/*
> - * 0..14 voltages, 15 global beep enable, 16..23 fans, 24..29 temperatures,
> - * 30..31 intrusion
> - */
> -static const s8 NCT6775_BEEP_BITS[] = {
> -	0, 1, 2, 3, 8, 9, 10, 16,	/* in0.. in7 */
> -	17, -1, -1, -1, -1, -1, -1,	/* in8..in14 */
> -	21,				/* global beep enable */
> -	6, 7, 11, 28, -1,		/* fan1..fan5 */
> -	-1, -1, -1,			/* unused */
> -	4, 5, 13, -1, -1, -1,		/* temp1..temp6 */
> -	12, -1 };			/* intrusion0, intrusion1 */
> +static const s8 NCT6775_BEEP_BITS[NUM_BEEP_BITS] = {
> +	 0,  1,  2,  3,  8,  9, 10, 16, 17, -1, -1, -1,	  /* in0-in11     */
> +	-1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1,	  /* in12-in23    */
> +	 6,  7, 11, 28, -1, -1, -1, -1, -1, -1, -1, -1,	  /* fan1-fan12   */
> +	 4,  5, 13, -1, -1, -1, -1, -1, -1, -1, -1, -1,	  /* temp1-temp12 */
> +	12, -1, -1, -1, 21				  /* intr0-intr3, beep_en */
> +};
>   
>   /* DC or PWM output fan configuration */
>   static const u8 NCT6775_REG_PWM_MODE[] = { 0x04, 0x04, 0x12 };
> @@ -256,25 +248,23 @@ static const u16 NCT6775_REG_TSI_TEMP[] = { 0x669 };
>   #define NCT6776_REG_FAN_STEP_UP_TIME NCT6775_REG_FAN_STEP_DOWN_TIME
>   #define NCT6776_REG_FAN_STEP_DOWN_TIME NCT6775_REG_FAN_STEP_UP_TIME
>   
> -static const s8 NCT6776_ALARM_BITS[] = {
> -	0, 1, 2, 3, 8, 21, 20, 16,	/* in0.. in7 */
> -	17, -1, -1, -1, -1, -1, -1,	/* in8..in14 */
> -	-1,				/* unused */
> -	6, 7, 11, 10, 23,		/* fan1..fan5 */
> -	-1, -1, -1,			/* unused */
> -	4, 5, 13, -1, -1, -1,		/* temp1..temp6 */
> -	12, 9 };			/* intrusion0, intrusion1 */
> +static const s8 NCT6776_ALARM_BITS[NUM_ALARM_BITS] = {
> +	 0,  1,  2,  3,  8, 21, 20, 16, 17, -1, -1, -1,	  /* in0-in11     */
> +	-1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1,	  /* in12-in23    */
> +	 6,  7, 11, 10, 23, -1, -1, -1, -1, -1, -1, -1,	  /* fan1-fan12   */
> +	 4,  5, 13, -1, -1, -1, -1, -1, -1, -1, -1, -1,	  /* temp1-temp12 */
> +	12,  9,						  /* intr0-intr1  */
> +};
>   
>   static const u16 NCT6776_REG_BEEP[NUM_REG_BEEP] = { 0xb2, 0xb3, 0xb4, 0xb5 };
>   
> -static const s8 NCT6776_BEEP_BITS[] = {
> -	0, 1, 2, 3, 4, 5, 6, 7,		/* in0.. in7 */
> -	8, -1, -1, -1, -1, -1, -1,	/* in8..in14 */
> -	24,				/* global beep enable */
> -	25, 26, 27, 28, 29,		/* fan1..fan5 */
> -	-1, -1, -1,			/* unused */
> -	16, 17, 18, 19, 20, 21,		/* temp1..temp6 */
> -	30, 31 };			/* intrusion0, intrusion1 */
> +static const s8 NCT6776_BEEP_BITS[NUM_BEEP_BITS] = {
> +	 0,  1,  2,  3,  4,  5,  6,  7,  8, -1, -1, -1,	  /* in0-in11     */
> +	-1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1,	  /* in12-in23    */
> +	25, 26, 27, 28, 29, -1, -1, -1, -1, -1, -1, -1,	  /* fan1-fan12   */
> +	16, 17, 18, 19, 20, 21, -1, -1, -1, -1, -1, -1,	  /* temp1-temp12 */
> +	30, 31, -1, -1, 24				  /* intr0-intr3, beep_en */
> +};
>   
>   static const u16 NCT6776_REG_TOLERANCE_H[] = {
>   	0x10c, 0x20c, 0x30c, 0x80c, 0x90c, 0xa0c, 0xb0c };
> @@ -345,23 +335,21 @@ static const u16 NCT6779_REG_IN[] = {
>   static const u16 NCT6779_REG_ALARM[NUM_REG_ALARM] = {
>   	0x459, 0x45A, 0x45B, 0x568 };
>   
> -static const s8 NCT6779_ALARM_BITS[] = {
> -	0, 1, 2, 3, 8, 21, 20, 16,	/* in0.. in7 */
> -	17, 24, 25, 26, 27, 28, 29,	/* in8..in14 */
> -	-1,				/* unused */
> -	6, 7, 11, 10, 23,		/* fan1..fan5 */
> -	-1, -1, -1,			/* unused */
> -	4, 5, 13, -1, -1, -1,		/* temp1..temp6 */
> -	12, 9 };			/* intrusion0, intrusion1 */
> -
> -static const s8 NCT6779_BEEP_BITS[] = {
> -	0, 1, 2, 3, 4, 5, 6, 7,		/* in0.. in7 */
> -	8, 9, 10, 11, 12, 13, 14,	/* in8..in14 */
> -	24,				/* global beep enable */
> -	25, 26, 27, 28, 29,		/* fan1..fan5 */
> -	-1, -1, -1,			/* unused */
> -	16, 17, -1, -1, -1, -1,		/* temp1..temp6 */
> -	30, 31 };			/* intrusion0, intrusion1 */
> +static const s8 NCT6779_ALARM_BITS[NUM_ALARM_BITS] = {
> +	 0,  1,  2,  3,  8, 21, 20, 16, 17, 24, 25, 26,	  /* in0-in11     */
> +	27, 28, 29, -1, -1, -1, -1, -1, -1, -1, -1, -1,	  /* in12-in23    */
> +	 6,  7, 11, 10, 23, -1, -1, -1, -1, -1, -1, -1,	  /* fan1-fan12   */
> +	 4,  5, 13, -1, -1, -1, -1, -1, -1, -1, -1, -1,	  /* temp1-temp12 */
> +	12,  9,						  /* intr0-intr1  */
> +};
> +
> +static const s8 NCT6779_BEEP_BITS[NUM_BEEP_BITS] = {
> +	 0,  1,  2,  3,  4,  5,  6,  7,  8,  9, 10, 11,	  /* in0-in11     */
> +	12, 13, 14, -1, -1, -1, -1, -1, -1, -1, -1, -1,	  /* in12-in23    */
> +	25, 26, 27, 28, 29, -1, -1, -1, -1, -1, -1, -1,	  /* fan1-fan12   */
> +	16, 17, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1,	  /* temp1-temp12 */
> +	30, 31, -1, -1, 24				  /* intr0-intr3, beep_en */
> +};
>   
>   static const u16 NCT6779_REG_FAN[] = {
>   	0x4c0, 0x4c2, 0x4c4, 0x4c6, 0x4c8, 0x4ca, 0x4ce };
> @@ -449,14 +437,13 @@ static const u16 NCT6791_REG_WEIGHT_DUTY_BASE[NUM_FAN] = { 0, 0x23e };
>   static const u16 NCT6791_REG_ALARM[NUM_REG_ALARM] = {
>   	0x459, 0x45A, 0x45B, 0x568, 0x45D };
>   
> -static const s8 NCT6791_ALARM_BITS[] = {
> -	0, 1, 2, 3, 8, 21, 20, 16,	/* in0.. in7 */
> -	17, 24, 25, 26, 27, 28, 29,	/* in8..in14 */
> -	-1,				/* unused */
> -	6, 7, 11, 10, 23, 33,		/* fan1..fan6 */
> -	-1, -1,				/* unused */
> -	4, 5, 13, -1, -1, -1,		/* temp1..temp6 */
> -	12, 9 };			/* intrusion0, intrusion1 */
> +static const s8 NCT6791_ALARM_BITS[NUM_ALARM_BITS] = {
> +	 0,  1,  2,  3,  8, 21, 20, 16, 17, 24, 25, 26,	  /* in0-in11     */
> +	27, 28, 29, -1, -1, -1, -1, -1, -1, -1, -1, -1,	  /* in12-in23    */
> +	 6,  7, 11, 10, 23, 33, -1, -1, -1, -1, -1, -1,	  /* fan1-fan12   */
> +	 4,  5, 13, -1, -1, -1, -1, -1, -1, -1, -1, -1,	  /* temp1-temp12 */
> +	12,  9,						  /* intr0-intr1  */
> +};
>   
>   /* NCT6792/NCT6793 specific data */
>   
> @@ -764,27 +751,23 @@ static const u16 NCT6106_REG_AUTO_PWM[] = { 0x164, 0x174, 0x184 };
>   static const u16 NCT6106_REG_ALARM[NUM_REG_ALARM] = {
>   	0x77, 0x78, 0x79, 0x7a, 0x7b, 0x7c, 0x7d };
>   
> -static const s8 NCT6106_ALARM_BITS[] = {
> -	0, 1, 2, 3, 4, 5, 7, 8,		/* in0.. in7 */
> -	9, -1, -1, -1, -1, -1, -1,	/* in8..in14 */
> -	-1,				/* unused */
> -	32, 33, 34, -1, -1,		/* fan1..fan5 */
> -	-1, -1, -1,			/* unused */
> -	16, 17, 18, 19, 20, 21,		/* temp1..temp6 */
> -	48, -1				/* intrusion0, intrusion1 */
> +static const s8 NCT6106_ALARM_BITS[NUM_ALARM_BITS] = {
> +	 0,  1,  2,  3,  4,  5,  7,  8,  9, -1, -1, -1,	  /* in0-in11     */
> +	-1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1,	  /* in12-in23    */
> +	32, 33, 34, -1, -1, -1, -1, -1, -1, -1, -1, -1,	  /* fan1-fan12   */
> +	16, 17, 18, 19, 20, 21, -1, -1, -1, -1, -1, -1,	  /* temp1-temp12 */
> +	48, -1,						  /* intr0-intr1  */
>   };
>   
>   static const u16 NCT6106_REG_BEEP[NUM_REG_BEEP] = {
>   	0x3c0, 0x3c1, 0x3c2, 0x3c3, 0x3c4 };
>   
> -static const s8 NCT6106_BEEP_BITS[] = {
> -	0, 1, 2, 3, 4, 5, 7, 8,		/* in0.. in7 */
> -	9, 10, 11, 12, -1, -1, -1,	/* in8..in14 */
> -	32,				/* global beep enable */
> -	24, 25, 26, 27, 28,		/* fan1..fan5 */
> -	-1, -1, -1,			/* unused */
> -	16, 17, 18, 19, 20, 21,		/* temp1..temp6 */
> -	34, -1				/* intrusion0, intrusion1 */
> +static const s8 NCT6106_BEEP_BITS[NUM_BEEP_BITS] = {
> +	 0,  1,  2,  3,  4,  5,  7,  8,  9, 10, 11, 12,	  /* in0-in11     */
> +	-1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1,	  /* in12-in23    */
> +	24, 25, 26, 27, 28, -1, -1, -1, -1, -1, -1, -1,	  /* fan1-fan12   */
> +	16, 17, 18, 19, 20, 21, -1, -1, -1, -1, -1, -1,	  /* temp1-temp12 */
> +	34, -1, -1, -1, 32				  /* intr0-intr3, beep_en */
>   };
>   
>   static const u16 NCT6106_REG_TEMP_ALTERNATE[32] = {
> @@ -844,24 +827,20 @@ static const u16 NCT6116_REG_AUTO_TEMP[] = {
>   static const u16 NCT6116_REG_AUTO_PWM[] = {
>   	0x164, 0x174, 0x184, 0x1d4, 0x1e4 };
>   
> -static const s8 NCT6116_ALARM_BITS[] = {
> -	0, 1, 2, 3, 4, 5, 7, 8,		/* in0.. in7 */
> -	9, -1, -1, -1, -1, -1, -1,	/* in8..in9 */
> -	-1,				/* unused */
> -	32, 33, 34, 35, 36,		/* fan1..fan5 */
> -	-1, -1, -1,			/* unused */
> -	16, 17, 18, -1, -1, -1,		/* temp1..temp6 */
> -	48, -1				/* intrusion0, intrusion1 */
> +static const s8 NCT6116_ALARM_BITS[NUM_ALARM_BITS] = {
> +	 0,  1,  2,  3,  4,  5,  7,  8,  9, -1, -1, -1,	  /* in0-in11     */
> +	-1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1,	  /* in12-in23    */
> +	32, 33, 34, 35, 36, -1, -1, -1, -1, -1, -1, -1,	  /* fan1-fan12   */
> +	16, 17, 18, -1, -1, -1, -1, -1, -1, -1, -1, -1,	  /* temp1-temp12 */
> +	48, -1,						  /* intr0-intr1  */
>   };
>   
> -static const s8 NCT6116_BEEP_BITS[] = {
> -	0, 1, 2, 3, 4, 5, 7, 8,		/* in0.. in7 */
> -	9, 10, 11, 12, -1, -1, -1,	/* in8..in14 */
> -	32,				/* global beep enable */
> -	24, 25, 26, 27, 28,		/* fan1..fan5 */
> -	-1, -1, -1,			/* unused */
> -	16, 17, 18, -1, -1, -1,		/* temp1..temp6 */
> -	34, -1				/* intrusion0, intrusion1 */
> +static const s8 NCT6116_BEEP_BITS[NUM_BEEP_BITS] = {
> +	 0,  1,  2,  3,  4,  5,  7,  8,  9, 10, 11, 12,	  /* in0-in11     */
> +	-1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1,	  /* in12-in23    */
> +	24, 25, 26, 27, 28, -1, -1, -1, -1, -1, -1, -1,	  /* fan1-fan12   */
> +	16, 17, 18, -1, -1, -1, -1, -1, -1, -1, -1, -1,	  /* temp1-temp12 */
> +	34, -1, -1, -1, 32				  /* intr0-intr3, beep_en */
>   };
>   
>   static const u16 NCT6116_REG_TSI_TEMP[] = { 0x59, 0x5b };
> diff --git a/drivers/hwmon/nct6775.h b/drivers/hwmon/nct6775.h
> index 44f79c5726a9..6bc75701f290 100644
> --- a/drivers/hwmon/nct6775.h
> +++ b/drivers/hwmon/nct6775.h
> @@ -238,10 +238,25 @@ nct6775_add_attr_group(struct nct6775_data *data, const struct attribute_group *
>   
>   #define NCT6791_REG_HM_IO_SPACE_LOCK_ENABLE	0x28
>   
> -#define FAN_ALARM_BASE		16
> -#define TEMP_ALARM_BASE		24
> -#define INTRUSION_ALARM_BASE	30
> -#define BEEP_ENABLE_BASE	15
> +/*
> + * ALARM_BITS and BEEP_BITS store bit-index for the mask of the registers
> + * loaded into data->alarm and data->beep.
> + *
> + * Every input register (IN/TEMP/FAN) must have a corresponding
> + *   ALARM/BEEP bit at the same index BITS[BASE + index]
> + * Set value to -1 to disable the visibility of that '*_alarm' attribute and
> + * to pad the bits until the next BASE
> + *
> + * Beep has an additional GLOBAL_BEEP_ENABLE bit
> + */
> +#define VIN_ALARM_BASE		 0
> +#define FAN_ALARM_BASE		24
> +#define TEMP_ALARM_BASE		36
> +#define INTRUSION_ALARM_BASE	48
> +#define BEEP_ENABLE_BASE	52
> +
> +#define NUM_ALARM_BITS		(INTRUSION_ALARM_BASE+4)
> +#define NUM_BEEP_BITS		(BEEP_ENABLE_BASE+1)

Space before and after '+'

>   
>   /*
>    * Not currently used:
> 
> base-commit: 06c2afb862f9da8dc5efa4b6076a0e48c3fbaaa5
> prerequisite-patch-id: 36e3467bd9ea72cb3ad2bef638a8389a9537d111
> prerequisite-patch-id: 716ba83170c6c7a969faead5189f4b336097fcb5

