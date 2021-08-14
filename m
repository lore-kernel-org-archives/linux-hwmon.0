Return-Path: <linux-hwmon-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-18.2 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_1
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id F0ADCC4338F
	for <linux-hwmon@archiver.kernel.org>; Sat, 14 Aug 2021 14:59:11 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id CA3E760E9B
	for <linux-hwmon@archiver.kernel.org>; Sat, 14 Aug 2021 14:59:11 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S238686AbhHNO7h (ORCPT <rfc822;linux-hwmon@archiver.kernel.org>);
        Sat, 14 Aug 2021 10:59:37 -0400
Received: from mail.kernel.org ([198.145.29.99]:51754 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S235123AbhHNO7g (ORCPT <rfc822;linux-hwmon@vger.kernel.org>);
        Sat, 14 Aug 2021 10:59:36 -0400
Received: by mail.kernel.org (Postfix) with ESMTPSA id AF42360FC0;
        Sat, 14 Aug 2021 14:59:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1628953147;
        bh=euv4LjDwAz26EUuTwMN6BJAdBwTWZ3Gp+TwWoJnqP4g=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=ENrAOBBnaAG35+ubeuyn2XXuh8g395WE+hoGqS3/Qf847D+aG6NekLbWLzfrxxWkw
         41ILstcniS2x7cUhyRnQRIjNZX4U7V3YIq0E1xZCX2GtutUZk/gQR/jfG5x1oIgr76
         S9nrjJBH0z9+y2+xKbJ2f7ZoQn7jE2sXBOOBlRE0Wh4NbUCBYLODrAhmLook09YBeK
         0PuiN1OyJjrSheapmtgZbE1GDSgacnOCBxdqPoCJU/HigIjyIqovCrDDyacr7AfdFf
         dVemqeFy+otEwDO5xsGr0nj6miHpE2bEV7P6X+cf2rKsJq2QfgHfuYn6HRi2Ypt/Pn
         oIO2xrt79K5KA==
Received: by pali.im (Postfix)
        id 4C9329CA; Sat, 14 Aug 2021 16:59:05 +0200 (CEST)
Date:   Sat, 14 Aug 2021 16:59:05 +0200
From:   Pali =?utf-8?B?Um9ow6Fy?= <pali@kernel.org>
To:     W_Armin@gmx.de
Cc:     linux@roeck-us.net, jdelvare@suse.com, linux-hwmon@vger.kernel.org
Subject: Re: [PATCH 1/4] hwmon: (dell-smm) Mark tables as __initconst
Message-ID: <20210814145905.wxo7i5i5cu35nb7e@pali>
References: <20210814143637.11922-1-W_Armin@gmx.de>
 <20210814143637.11922-2-W_Armin@gmx.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20210814143637.11922-2-W_Armin@gmx.de>
User-Agent: NeoMutt/20180716
Precedence: bulk
List-ID: <linux-hwmon.vger.kernel.org>
X-Mailing-List: linux-hwmon@vger.kernel.org

On Saturday 14 August 2021 16:36:34 W_Armin@gmx.de wrote:
> From: Armin Wolf <W_Armin@gmx.de>
> 
> Both the config and the DMI tables never change and
> are only used during module init for setting up
> the device data struct.
> Mark all of them as const and __initconst for a
> smaller runtime memory footprint.
> 
> Signed-off-by: Armin Wolf <W_Armin@gmx.de>

Looks good,

Reviewed-by: Pali Rohár <pali@kernel.org>

> ---
>  drivers/hwmon/dell-smm-hwmon.c | 8 ++++----
>  1 file changed, 4 insertions(+), 4 deletions(-)
> 
> diff --git a/drivers/hwmon/dell-smm-hwmon.c b/drivers/hwmon/dell-smm-hwmon.c
> index 43da32ad2dce..68af95c1d90c 100644
> --- a/drivers/hwmon/dell-smm-hwmon.c
> +++ b/drivers/hwmon/dell-smm-hwmon.c
> @@ -957,7 +957,7 @@ enum i8k_configs {
>  	DELL_XPS,
>  };
> 
> -static const struct i8k_config_data i8k_config_data[] = {
> +static const struct i8k_config_data i8k_config_data[] __initconst = {
>  	[DELL_LATITUDE_D520] = {
>  		.fan_mult = 1,
>  		.fan_max = I8K_FAN_TURBO,
> @@ -1115,7 +1115,7 @@ static const struct dmi_system_id i8k_blacklist_fan_type_dmi_table[] __initconst
>   * support for affected blacklisted Dell machines stay disabled.
>   * See bug: https://bugzilla.kernel.org/show_bug.cgi?id=195751
>   */
> -static struct dmi_system_id i8k_blacklist_fan_support_dmi_table[] __initdata = {
> +static const struct dmi_system_id i8k_blacklist_fan_support_dmi_table[] __initconst = {
>  	{
>  		.ident = "Dell Inspiron 7720",
>  		.matches = {
> @@ -1156,14 +1156,14 @@ enum i8k_fan_controls {
>  	I8K_FAN_34A3_35A3,
>  };
> 
> -static const struct i8k_fan_control_data i8k_fan_control_data[] = {
> +static const struct i8k_fan_control_data i8k_fan_control_data[] __initconst = {
>  	[I8K_FAN_34A3_35A3] = {
>  		.manual_fan = 0x34a3,
>  		.auto_fan = 0x35a3,
>  	},
>  };
> 
> -static struct dmi_system_id i8k_whitelist_fan_control[] __initdata = {
> +static const struct dmi_system_id i8k_whitelist_fan_control[] __initconst = {
>  	{
>  		.ident = "Dell Latitude 5480",
>  		.matches = {
> --
> 2.20.1
> 
