Return-Path: <linux-hwmon-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 43BC7C433EF
	for <linux-hwmon@archiver.kernel.org>; Thu, 21 Oct 2021 19:10:08 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 2357B610A1
	for <linux-hwmon@archiver.kernel.org>; Thu, 21 Oct 2021 19:10:08 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231749AbhJUTMX (ORCPT <rfc822;linux-hwmon@archiver.kernel.org>);
        Thu, 21 Oct 2021 15:12:23 -0400
Received: from mail.kernel.org ([198.145.29.99]:38594 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S230103AbhJUTMX (ORCPT <rfc822;linux-hwmon@vger.kernel.org>);
        Thu, 21 Oct 2021 15:12:23 -0400
Received: by mail.kernel.org (Postfix) with ESMTPSA id DF59560FE8;
        Thu, 21 Oct 2021 19:10:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1634843407;
        bh=MNOZdN4cWwK5nWkEI+fAjRl4FjY71mGF9Gk//I8ebkM=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=AmPskmBDDDV/Z40lqLoZNHfOhMkUPMdiVn4fCAl6oZ+rc8h0O92Vt+syuPAur3u0Y
         S5azJgD8wdE+bOR9rezccnZbbMDeWutIltD3WpqbCGQHl/MObIaeyKaEs2Z/2k4/cE
         puych9VoLwKVGOnyQNboEg+EEi413zuWRsxP3mz/bH8bf5QE0tCr6zga6TO9uqPNUb
         5VHKVJQ2E9T96AjWvU+7yhrgP7yhKX0XBm8uw8ttGvWhkXk44TBFzRtvcep9x2JMT6
         3otueLHj2DUsxPoutdIw4k/7Es291zSBKAE9I/OnrT+tn78Eo7Csac0W7cW/mhCbXo
         R9xgsi2NwCX8w==
Received: by pali.im (Postfix)
        id 4845485E; Thu, 21 Oct 2021 21:10:03 +0200 (CEST)
Date:   Thu, 21 Oct 2021 21:10:03 +0200
From:   Pali =?utf-8?B?Um9ow6Fy?= <pali@kernel.org>
To:     W_Armin@gmx.de
Cc:     linux@roeck-us.net, jdelvare@suse.com, linux-hwmon@vger.kernel.org
Subject: Re: [PATCH v2 4/5] hwmon: (dell-smm) Add comment explaining usage of
 i8k_config_data[]
Message-ID: <20211021191003.zjnaqyzb3zyjlgby@pali>
References: <20211021190531.17379-1-W_Armin@gmx.de>
 <20211021190531.17379-5-W_Armin@gmx.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20211021190531.17379-5-W_Armin@gmx.de>
User-Agent: NeoMutt/20180716
Precedence: bulk
List-ID: <linux-hwmon.vger.kernel.org>
X-Mailing-List: linux-hwmon@vger.kernel.org

On Thursday 21 October 2021 21:05:30 W_Armin@gmx.de wrote:
> From: Armin Wolf <W_Armin@gmx.de>
> 
> i8k_config_data[] should only be used for applying device specific
> quirks in case autoconfig does not work properly on certain
> devices.
> 
> Signed-off-by: Armin Wolf <W_Armin@gmx.de>

Reviewed-by: Pali Rohár <pali@kernel.org>

> ---
>  drivers/hwmon/dell-smm-hwmon.c | 5 +++++
>  1 file changed, 5 insertions(+)
> 
> diff --git a/drivers/hwmon/dell-smm-hwmon.c b/drivers/hwmon/dell-smm-hwmon.c
> index 5f0338b4a717..0e1bc3a2dd12 100644
> --- a/drivers/hwmon/dell-smm-hwmon.c
> +++ b/drivers/hwmon/dell-smm-hwmon.c
> @@ -996,6 +996,11 @@ enum i8k_configs {
>  	DELL_XPS,
>  };
> 
> +/*
> + * Only use for machines which need some special configuration
> + * in order to work correctly (e.g. if autoconfig fails on this machines).
> + */
> +
>  static const struct i8k_config_data i8k_config_data[] __initconst = {
>  	[DELL_LATITUDE_D520] = {
>  		.fan_mult = 1,
> --
> 2.20.1
> 
