Return-Path: <linux-hwmon-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-16.7 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2EFEBC433EF
	for <linux-hwmon@archiver.kernel.org>; Thu, 16 Sep 2021 18:55:28 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 12C85611EE
	for <linux-hwmon@archiver.kernel.org>; Thu, 16 Sep 2021 18:55:28 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S244445AbhIPS4s (ORCPT <rfc822;linux-hwmon@archiver.kernel.org>);
        Thu, 16 Sep 2021 14:56:48 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:51536 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1345341AbhIPS4k (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>);
        Thu, 16 Sep 2021 14:56:40 -0400
Received: from mail-oi1-x22b.google.com (mail-oi1-x22b.google.com [IPv6:2607:f8b0:4864:20::22b])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id EFE17C0470C0
        for <linux-hwmon@vger.kernel.org>; Thu, 16 Sep 2021 11:07:03 -0700 (PDT)
Received: by mail-oi1-x22b.google.com with SMTP id j66so10162429oih.12
        for <linux-hwmon@vger.kernel.org>; Thu, 16 Sep 2021 11:07:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=sender:subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=3cKAtnlVsMr/l8zZy1xkirBAW9y2SHJ538X9dUtZun8=;
        b=WzJ/R7Umf5hHzIP4PEv0bBft1Gh2AtkF9yDrbjagqYVFVmtaXPTgS1XieA7xwsBjeY
         dNGg8hTZr0BluwzYPyGNPiUxFFmb7OMlWGrYgBNR6vOgczXlfxIhHgG0m8eRstEyBcux
         30dxj+Bik1F+UHIzFnstC5Vj3nBY8HV+YnfmzLU0GAns9P0zsyCJZddYhYeYvdvXtEWE
         sxm3SJXFFyFyMnzneGJoYz93UHC2pp0Giy3htmQOWERWJamk2OwKCtSxnGFHwYZWcTUw
         kExjr/8zC81l8K+GLpMUmh64XGxpJtox/Xa3T/bvZ3gq4o9sLB1ayvHac1BAh4kDHwxg
         x8pA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:sender:subject:to:cc:references:from:message-id
         :date:user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=3cKAtnlVsMr/l8zZy1xkirBAW9y2SHJ538X9dUtZun8=;
        b=yKGqNJsdn+TnHE4p0fUGpc5VlhS6xlGCQ8xYg5v2IlvKA797ACvPlzNCJMe8gShfQt
         FyBEepRhhP+9u+Ccr/oaYlJz9UuSmBFNDSNN8MmMkZuU6Rmx6GgXvvQiwVs99UqO8a8+
         jm5so1yUePvbgHyZjMPGbdKwK2+Nx/FzppcDqCxh/znePfgt8VaTRusVG0/8B+nVcPw3
         MsEKmNBcKTZ4bE+2SZ+RH7WzKYMohdu7l7h44ZvTPVryQMDE6G9JRFvKb3p7BoO62QTw
         Z5DAjyLaF6ojxyOqo0S7MHIV46HADCtPl1R/kKfDDr+hkdeLjUOPBPyuk+9xo/4Z+/cN
         CKjA==
X-Gm-Message-State: AOAM533rFEF3ztV9uvSF4Gs3RJduype/QOMy19ddOAtS9nKEY7Lo3kxb
        tAFfqPPjWQCzY6EEFl7317okuffUn+I=
X-Google-Smtp-Source: ABdhPJxLhUN+bXyx/dkU506q6CPXIMd0WMpTN6jk6SADyC6Fy0L2DPIxucnRLvjuLz2edp0s60T3aw==
X-Received: by 2002:a05:6808:3099:: with SMTP id bl25mr928481oib.44.1631815622999;
        Thu, 16 Sep 2021 11:07:02 -0700 (PDT)
Received: from server.roeck-us.net ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
        by smtp.gmail.com with ESMTPSA id a15sm879377otq.13.2021.09.16.11.07.01
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 16 Sep 2021 11:07:02 -0700 (PDT)
Sender: Guenter Roeck <groeck7@gmail.com>
Subject: Re: [PATCH hwmon v2 1/1] hwmon: (mlxreg-fan) Return non-zero value
 when fan current state is enforced from sysfs
To:     Vadim Pasternak <vadimp@nvidia.com>
Cc:     linux-hwmon@vger.kernel.org
References: <20210916174445.868196-1-vadimp@nvidia.com>
From:   Guenter Roeck <linux@roeck-us.net>
Message-ID: <8fd35cb4-2278-9d3e-a447-9ce9c3c609ff@roeck-us.net>
Date:   Thu, 16 Sep 2021 11:07:00 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.13.0
MIME-Version: 1.0
In-Reply-To: <20210916174445.868196-1-vadimp@nvidia.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-hwmon.vger.kernel.org>
X-Mailing-List: linux-hwmon@vger.kernel.org

On 9/16/21 10:44 AM, Vadim Pasternak wrote:
> Fan speed minimum can be enforced from sysfs. For example, setting
> current fan speed to 20 is used to enforce fan speed to be at 100%
> speed, 19 - to be not below 90% speed, etcetera. This feature provides
> ability to limit fan speed according to some system wise
> considerations, like absence of some replaceable units or high system
> ambient temperature.
> 
> Request for changing fan minimum speed is configuration request and can
> be set only through 'sysfs' write procedure. In this situation value of
> argument 'state' is above nominal fan speed maximum.
> 
> Return non-zero code in this case to avoid
> thermal_cooling_device_stats_update() call, because in this case
> statistics update violates thermal statistics table range.
> The issues is observed in case kernel is configured with option
> CONFIG_THERMAL_STATISTICS.
> 
> Here is the trace from KASAN:
> [  159.506659] BUG: KASAN: slab-out-of-bounds in thermal_cooling_device_stats_update+0x7d/0xb0
> [  159.516016] Read of size 4 at addr ffff888116163840 by task hw-management.s/7444
> [  159.545625] Call Trace:
> [  159.548366]  dump_stack+0x92/0xc1
> [  159.552084]  ? thermal_cooling_device_stats_update+0x7d/0xb0
> [  159.635869]  thermal_zone_device_update+0x345/0x780
> [  159.688711]  thermal_zone_device_set_mode+0x7d/0xc0
> [  159.694174]  mlxsw_thermal_modules_init+0x48f/0x590 [mlxsw_core]
> [  159.700972]  ? mlxsw_thermal_set_cur_state+0x5a0/0x5a0 [mlxsw_core]
> [  159.731827]  mlxsw_thermal_init+0x763/0x880 [mlxsw_core]
> [  160.070233] RIP: 0033:0x7fd995909970
> [  160.074239] Code: 73 01 c3 48 8b 0d 28 d5 2b 00 f7 d8 64 89 01 48 83 c8 ff c3 66 0f 1f 44 00 00 83 3d 99 2d 2c 00 00 75 10 b8 01 00 00 00 0f 05 <48> 3d 01 f0 ff ..
> [  160.095242] RSP: 002b:00007fff54f5d938 EFLAGS: 00000246 ORIG_RAX: 0000000000000001
> [  160.103722] RAX: ffffffffffffffda RBX: 0000000000000013 RCX: 00007fd995909970
> [  160.111710] RDX: 0000000000000013 RSI: 0000000001906008 RDI: 0000000000000001
> [  160.119699] RBP: 0000000001906008 R08: 00007fd995bc9760 R09: 00007fd996210700
> [  160.127687] R10: 0000000000000073 R11: 0000000000000246 R12: 0000000000000013
> [  160.135673] R13: 0000000000000001 R14: 00007fd995bc8600 R15: 0000000000000013
> [  160.143671]
> [  160.145338] Allocated by task 2924:
> [  160.149242]  kasan_save_stack+0x19/0x40
> [  160.153541]  __kasan_kmalloc+0x7f/0xa0
> [  160.157743]  __kmalloc+0x1a2/0x2b0
> [  160.161552]  thermal_cooling_device_setup_sysfs+0xf9/0x1a0
> [  160.167687]  __thermal_cooling_device_register+0x1b5/0x500
> [  160.173833]  devm_thermal_of_cooling_device_register+0x60/0xa0
> [  160.180356]  mlxreg_fan_probe+0x474/0x5e0 [mlxreg_fan]
> [  160.248140]
> [  160.249807] The buggy address belongs to the object at ffff888116163400
> [  160.249807]  which belongs to the cache kmalloc-1k of size 1024
> [  160.263814] The buggy address is located 64 bytes to the right of
> [  160.263814]  1024-byte region [ffff888116163400, ffff888116163800)
> [  160.277536] The buggy address belongs to the page:
> [  160.282898] page:0000000012275840 refcount:1 mapcount:0 mapping:0000000000000000 index:0xffff888116167000 pfn:0x116160
> [  160.294872] head:0000000012275840 order:3 compound_mapcount:0 compound_pincount:0
> [  160.303251] flags: 0x200000000010200(slab|head|node=0|zone=2)
> [  160.309694] raw: 0200000000010200 ffffea00046f7208 ffffea0004928208 ffff88810004dbc0
> [  160.318367] raw: ffff888116167000 00000000000a0006 00000001ffffffff 0000000000000000
> [  160.327033] page dumped because: kasan: bad access detected
> [  160.333270]
> [  160.334937] Memory state around the buggy address:
> [  160.356469] >ffff888116163800: fc ..
> 
> Fixes: 65afb4c8e7e4: (hwmon: (mlxreg-fan) Add support for Mellanox FAN driver)
> Signed-off-by: Vadim Pasternak <vadimp@nvidia.com>
> ---
> v0->v2:
>   Comments pointed out by Guenter:
>   - Fix comment.
>   - Drop boolean variable 'config'.
>   - Drop conversion in 'return' in mlxreg_fan_set_cur_state().
> ---
>   drivers/hwmon/mlxreg-fan.c | 10 ++++++++--
>   1 file changed, 8 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/hwmon/mlxreg-fan.c b/drivers/hwmon/mlxreg-fan.c
> index 116681fde33d..adcf6cdbf53c 100644
> --- a/drivers/hwmon/mlxreg-fan.c
> +++ b/drivers/hwmon/mlxreg-fan.c
> @@ -329,6 +329,12 @@ static int mlxreg_fan_set_cur_state(struct thermal_cooling_device *cdev,
>   	 * overwritten.
>   	 */
>   	if (state >= MLXREG_FAN_SPEED_MIN && state <= MLXREG_FAN_SPEED_MAX) {
> +		/*
> +		 * This is configuration change, which is only supported through sysfs.
> +		 * For configuration non-zero value is to be returned to avoid thermal
> +		 * statistics update.
> +		 */
> +		err = 1;

That doesn't work; it is overwritten a couple of lines below with the
result of regmap_read().

>   		state -= MLXREG_FAN_MAX_STATE;
>   		for (i = 0; i < state; i++)
>   			fan->cooling_levels[i] = state;
> @@ -343,7 +349,7 @@ static int mlxreg_fan_set_cur_state(struct thermal_cooling_device *cdev,
>   
>   		cur_state = MLXREG_FAN_PWM_DUTY2STATE(regval);
>   		if (state < cur_state)
> -			return 0;
> +			return err;

That always returns 0.

>   
>   		state = cur_state;
>   	}
> @@ -359,7 +365,7 @@ static int mlxreg_fan_set_cur_state(struct thermal_cooling_device *cdev,
>   		dev_err(fan->dev, "Failed to write PWM duty\n");
>   		return err;
>   	}
> -	return 0;
> +	return err;

This also always returns 0, because the code above is "if (err) ... return err;".

Guenter

>   }
>   
>   static const struct thermal_cooling_device_ops mlxreg_fan_cooling_ops = {
> 

