Return-Path: <linux-hwmon-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-17.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_1
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 45E49C433EF
	for <linux-hwmon@archiver.kernel.org>; Fri,  3 Sep 2021 14:49:13 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 27A0B60FC0
	for <linux-hwmon@archiver.kernel.org>; Fri,  3 Sep 2021 14:49:13 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232919AbhICOuM (ORCPT <rfc822;linux-hwmon@archiver.kernel.org>);
        Fri, 3 Sep 2021 10:50:12 -0400
Received: from mail.kernel.org ([198.145.29.99]:36718 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S233218AbhICOuL (ORCPT <rfc822;linux-hwmon@vger.kernel.org>);
        Fri, 3 Sep 2021 10:50:11 -0400
Received: by mail.kernel.org (Postfix) with ESMTPSA id 7C49960F91;
        Fri,  3 Sep 2021 14:49:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1630680551;
        bh=LDAjxvyv4DltDD2/UWo8LsWER0Y6WbnJRAKLEneJzKg=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=UO8nY4ItLblVi5bWf+Ba+UOLiE/N/AnCjpo6dOC9k6ButhUB/FgVa+jZsASRP24bH
         //0b7d1cEKUFVjkRsSsPuNP9dSbCd0MsmqFOwZ0KuXmqpRv+nCs+waDQtVP4CTOoFA
         SW40P3a+U4VjwPBsA1y1pTE1iOFSURdLAW7D5pcLyA3zmRZ/Mm1AdIKCbztkRA+Jo7
         nUtun03kEJ0Gc8+5QjkAeJymW1+Vu9lrMdveo9gnBApriCWISG9N0xzaQDl6yIC2A+
         1b1OniPkaZ+CbnP/Mz5k1HEJvgv2m6Vbv9T4JQMEfCdfNMpMxOUordXPysy88P5igd
         8C0yplmCDt6oA==
Received: by pali.im (Postfix)
        id E5BBA77C; Fri,  3 Sep 2021 16:49:08 +0200 (CEST)
Date:   Fri, 3 Sep 2021 16:49:08 +0200
From:   Pali =?utf-8?B?Um9ow6Fy?= <pali@kernel.org>
To:     linux@roeck-us.net, W_Armin@gmx.de
Cc:     jdelvare@suse.com, linux-hwmon@vger.kernel.org
Subject: Re: [PATCH] hwmon: (dell-smm) Show fan_max param in sysfs
Message-ID: <20210903144908.vrrae6oeivjxqpkj@pali>
References: <20210903142456.9926-1-W_Armin@gmx.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210903142456.9926-1-W_Armin@gmx.de>
User-Agent: NeoMutt/20180716
Precedence: bulk
List-ID: <linux-hwmon.vger.kernel.org>
X-Mailing-List: linux-hwmon@vger.kernel.org

On Friday 03 September 2021 16:24:56 W_Armin@gmx.de wrote:
> From: Armin Wolf <W_Armin@gmx.de>
> 
> For allowing tools like i8kutils to query the fan state
> without having to rely on the deprecated /proc/i8k interface,
> they need to scale the pwm values (0 - 255) back to the
> real hardware values (0 - 2/3).
> Show fan_max in sysfs to allow for such a scenario.

Guenter, I think that this is general problem and not specific to
dell-smm-hwmon.c driver and i8kutils.

All other hwmon tools should have similar problem. If e.g. GUI tool has
slider for controlling pwm then such tool needs to know number of steps.
Otherwise usage of such slider would be not very user friendly...

Currently in hwmon sysfs API there is not attribute which could export
this kind of information.

What about e.g. introducing 'pwm_steps' attribute which would provide
this information?

> Tested on a Dell Latitude C600.
> 
> Signed-off-by: Armin Wolf <W_Armin@gmx.de>
> ---
>  drivers/hwmon/dell-smm-hwmon.c | 7 +++++--
>  1 file changed, 5 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/hwmon/dell-smm-hwmon.c b/drivers/hwmon/dell-smm-hwmon.c
> index 774c1b0715d9..6d3fd4f0f99d 100644
> --- a/drivers/hwmon/dell-smm-hwmon.c
> +++ b/drivers/hwmon/dell-smm-hwmon.c
> @@ -107,7 +107,7 @@ module_param(fan_mult, uint, 0);
>  MODULE_PARM_DESC(fan_mult, "Factor to multiply fan speed with (default: autodetect)");
> 
>  static uint fan_max;
> -module_param(fan_max, uint, 0);
> +module_param(fan_max, uint, 0444);
>  MODULE_PARM_DESC(fan_max, "Maximum configurable fan speed (default: autodetect)");
> 
>  struct smm_regs {
> @@ -1245,7 +1245,10 @@ static int __init dell_smm_probe(struct platform_device *pdev)
>  			fan_max = conf->fan_max;
>  	}
> 
> -	data->i8k_fan_max = fan_max ? : I8K_FAN_HIGH;	/* Must not be 0 */
> +	if (!fan_max)	/* Must not be 0*/
> +		fan_max = I8K_FAN_HIGH;
> +
> +	data->i8k_fan_max = fan_max;
>  	data->i8k_pwm_mult = DIV_ROUND_UP(255, data->i8k_fan_max);
> 
>  	fan_control = dmi_first_match(i8k_whitelist_fan_control);
> --
> 2.20.1
> 
