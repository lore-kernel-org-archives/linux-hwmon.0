Return-Path: <linux-hwmon-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-18.2 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_1
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5388AC4338F
	for <linux-hwmon@archiver.kernel.org>; Sat, 14 Aug 2021 14:59:40 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 383C860E9B
	for <linux-hwmon@archiver.kernel.org>; Sat, 14 Aug 2021 14:59:40 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S238660AbhHNPAG (ORCPT <rfc822;linux-hwmon@archiver.kernel.org>);
        Sat, 14 Aug 2021 11:00:06 -0400
Received: from mail.kernel.org ([198.145.29.99]:51860 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S238711AbhHNPAE (ORCPT <rfc822;linux-hwmon@vger.kernel.org>);
        Sat, 14 Aug 2021 11:00:04 -0400
Received: by mail.kernel.org (Postfix) with ESMTPSA id 396C160FC0;
        Sat, 14 Aug 2021 14:59:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1628953176;
        bh=oHTqM6HPoA84ak7+11ux3EqJo2V+czENConWb5amX8M=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=bTHFqTnZJ90hvwRhgbU1KV67zG+hmUIqmUDULKxHhIgdSaMiN549o600LbLxJtml+
         vPvhgvef50JzsTCMjsAXka/NGt+dRnLN9CZyCxDUCmrgIqQjETRny+R2b7pQ7UlwwI
         TvGVek6cFMK1COC4UhECL7/Q0h19Vw6R/Ze8ubsmmenjm5S3BDQXhzqigHleYIRNr/
         ijtmhGJ6iKvcfvahucH+uGL/X/MjaONSEG2ui8wm71jenBaiSiianMPtLCDEXLrFMn
         EWHn3JzqYtsZiC3gvbJ1gXcsVvwxaULQNwH9h7wi1KmM2lQoRKagFexnNCyCfbUX1t
         84EXOzgNtTzwA==
Received: by pali.im (Postfix)
        id 8238A9CA; Sat, 14 Aug 2021 16:59:34 +0200 (CEST)
Date:   Sat, 14 Aug 2021 16:59:34 +0200
From:   Pali =?utf-8?B?Um9ow6Fy?= <pali@kernel.org>
To:     W_Armin@gmx.de
Cc:     linux@roeck-us.net, jdelvare@suse.com, linux-hwmon@vger.kernel.org
Subject: Re: [PATCH 4/4] hwmon: (dell-smm) Mark i8k_get_fan_nominal_speed as
 __init
Message-ID: <20210814145934.wgbdh2yzayr6lyhz@pali>
References: <20210814143637.11922-1-W_Armin@gmx.de>
 <20210814143637.11922-5-W_Armin@gmx.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20210814143637.11922-5-W_Armin@gmx.de>
User-Agent: NeoMutt/20180716
Precedence: bulk
List-ID: <linux-hwmon.vger.kernel.org>
X-Mailing-List: linux-hwmon@vger.kernel.org

On Saturday 14 August 2021 16:36:37 W_Armin@gmx.de wrote:
> From: Armin Wolf <W_Armin@gmx.de>
> 
> Mark function i8k_get_fan_nominal_speed() as __init since
> it is only used in code also marked as __init.
> 
> Signed-off-by: Armin Wolf <W_Armin@gmx.de>

Looks good,

Reviewed-by: Pali Rohár <pali@kernel.org>

> ---
>  drivers/hwmon/dell-smm-hwmon.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/hwmon/dell-smm-hwmon.c b/drivers/hwmon/dell-smm-hwmon.c
> index 0e229e3dae33..8bbeeda13faf 100644
> --- a/drivers/hwmon/dell-smm-hwmon.c
> +++ b/drivers/hwmon/dell-smm-hwmon.c
> @@ -303,7 +303,7 @@ static int i8k_get_fan_type(struct dell_smm_data *data, int fan)
>  /*
>   * Read the fan nominal rpm for specific fan speed.
>   */
> -static int i8k_get_fan_nominal_speed(const struct dell_smm_data *data, int fan, int speed)
> +static int __init i8k_get_fan_nominal_speed(const struct dell_smm_data *data, int fan, int speed)
>  {
>  	struct smm_regs regs = { .eax = I8K_SMM_GET_NOM_SPEED, };
> 
> --
> 2.20.1
> 
