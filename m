Return-Path: <linux-hwmon-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-18.2 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_1
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 31711C4338F
	for <linux-hwmon@archiver.kernel.org>; Sat, 14 Aug 2021 15:19:37 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 071C160C41
	for <linux-hwmon@archiver.kernel.org>; Sat, 14 Aug 2021 15:19:36 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S238554AbhHNPUE (ORCPT <rfc822;linux-hwmon@archiver.kernel.org>);
        Sat, 14 Aug 2021 11:20:04 -0400
Received: from mail.kernel.org ([198.145.29.99]:53512 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S234665AbhHNPUE (ORCPT <rfc822;linux-hwmon@vger.kernel.org>);
        Sat, 14 Aug 2021 11:20:04 -0400
Received: by mail.kernel.org (Postfix) with ESMTPSA id 24CE560F39;
        Sat, 14 Aug 2021 15:13:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1628953992;
        bh=2TAI3Om/fyof5/0qqV+RkgxAKmJKWIIExyedH4V/M70=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=RKs/lE/gmCV7m5o5kCH2MrROdqr+gCH5tadH1o6tKqE6De5e7xfTEYCyPJTWei+6D
         SCWWH8W4CufuE5w2q67KWqueu+UFCqvEzGnGynvtDl2S5eXz8PAcXUS3V7T3NPAn2e
         ggGXWWnDRuv0sf318CidZnKJRq5IdzJOj/QUUBZbgdJTqGmHClRM9KCKj+Vkoy4dLB
         LJrQ1yY10JJZmkMmIt4eSiUJGZ9B7NpNRPwnCJ6nBA2LOGxwIMSOpe98gdaujH9KDp
         FNESXP7j0nYkDnCcUpyKvKFE2RcBzCyIjeqy0ffAo8XhPQX9lgEQxdEALj1cNhFl49
         lF/DK8oL5yB5Q==
Received: by pali.im (Postfix)
        id B15FC9CA; Sat, 14 Aug 2021 17:13:09 +0200 (CEST)
Date:   Sat, 14 Aug 2021 17:13:09 +0200
From:   Pali =?utf-8?B?Um9ow6Fy?= <pali@kernel.org>
To:     W_Armin@gmx.de
Cc:     linux@roeck-us.net, jdelvare@suse.com, linux-hwmon@vger.kernel.org
Subject: Re: [PATCH 3/4] hwmon: (dell-smm) Enable automatic fan speed control
 for all channels
Message-ID: <20210814151309.wyclfsylkvr2i6tm@pali>
References: <20210814143637.11922-1-W_Armin@gmx.de>
 <20210814143637.11922-4-W_Armin@gmx.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210814143637.11922-4-W_Armin@gmx.de>
User-Agent: NeoMutt/20180716
Precedence: bulk
List-ID: <linux-hwmon.vger.kernel.org>
X-Mailing-List: linux-hwmon@vger.kernel.org

On Saturday 14 August 2021 16:36:36 W_Armin@gmx.de wrote:
> From: Armin Wolf <W_Armin@gmx.de>
> 
> Add automatic fan speed control for the remaining two pwm channels
> since the pwmX_enable setting affects all pwm channels.
> 
> Signed-off-by: Armin Wolf <W_Armin@gmx.de>

This behavior was already rejected by Guenter:
https://lore.kernel.org/linux-hwmon/3a10f96a-06e1-39f4-74a6-908d25b1f496@roeck-us.net/

"Having three attributes do all the same is not very valuable.
I would suggest to stick with pwm1_enable and document that it applies
to all pwm channels."

> ---
>  Documentation/hwmon/dell-smm-hwmon.rst | 14 +++++++-------
>  drivers/hwmon/dell-smm-hwmon.c         |  4 ++--
>  2 files changed, 9 insertions(+), 9 deletions(-)
> 
> diff --git a/Documentation/hwmon/dell-smm-hwmon.rst b/Documentation/hwmon/dell-smm-hwmon.rst
> index 3bf77a5df995..57b30fc9d03a 100644
> --- a/Documentation/hwmon/dell-smm-hwmon.rst
> +++ b/Documentation/hwmon/dell-smm-hwmon.rst
> @@ -35,7 +35,7 @@ Name				Perm	Description
>  fan[1-3]_input                  RO      Fan speed in RPM.
>  fan[1-3]_label                  RO      Fan label.
>  pwm[1-3]                        RW      Control the fan PWM duty-cycle.
> -pwm1_enable                     WO      Enable or disable automatic BIOS fan
> +pwm[1-3]_enable                 WO      Enable or disable automatic BIOS fan
>                                          control (not supported on all laptops,
>                                          see below for details).
>  temp[1-10]_input                RO      Temperature reading in milli-degrees
> @@ -52,13 +52,13 @@ overwritten.
> 
>  There is experimental support for disabling automatic BIOS fan
>  control, at least on laptops where the corresponding SMM command is
> -known, by writing the value ``1`` in the attribute ``pwm1_enable``
> -(writing ``2`` enables automatic BIOS control again). Even if you have
> +known, by writing the value ``1`` in the attribute ``pwm[1-3]_enable``
> +(writing ``2`` enables automatic BIOS control again). If you have
>  more than one fan, all of them are set to either enabled or disabled
> -automatic fan control at the same time and, notwithstanding the name,
> -``pwm1_enable`` sets automatic control for all fans.
> +automatic fan control at the same time so ``pwm[1-3]_enable``
> +sets automatic fan control for **all** fans.
> 
> -If ``pwm1_enable`` is not available, then it means that SMM codes for
> +If ``pwm[1-3]_enable`` is not available, then it means that SMM codes for
>  enabling and disabling automatic BIOS fan control are not whitelisted
>  for your hardware. It is possible that codes that work for other
>  laptops actually work for yours as well, or that you have to discover
> @@ -67,7 +67,7 @@ new codes.
>  Check the list ``i8k_whitelist_fan_control`` in file
>  ``drivers/hwmon/dell-smm-hwmon.c`` in the kernel tree: as a first
>  attempt you can try to add your machine and use an already-known code
> -pair. If, after recompiling the kernel, you see that ``pwm1_enable``
> +pair. If, after recompiling the kernel, you see that ``pwm[1-3]_enable``
>  is present and works (i.e., you can manually control the fan speed),
>  then please submit your finding as a kernel patch, so that other users
>  can benefit from it. Please see
> diff --git a/drivers/hwmon/dell-smm-hwmon.c b/drivers/hwmon/dell-smm-hwmon.c
> index 3aa09c1e4b1d..0e229e3dae33 100644
> --- a/drivers/hwmon/dell-smm-hwmon.c
> +++ b/drivers/hwmon/dell-smm-hwmon.c
> @@ -898,8 +898,8 @@ static const struct hwmon_channel_info *dell_smm_info[] = {
>  			   ),
>  	HWMON_CHANNEL_INFO(pwm,
>  			   HWMON_PWM_INPUT | HWMON_PWM_ENABLE,
> -			   HWMON_PWM_INPUT,
> -			   HWMON_PWM_INPUT
> +			   HWMON_PWM_INPUT | HWMON_PWM_ENABLE,
> +			   HWMON_PWM_INPUT | HWMON_PWM_ENABLE
>  			   ),
>  	NULL
>  };
> --
> 2.20.1
> 
