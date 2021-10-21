Return-Path: <linux-hwmon-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3BC8DC433F5
	for <linux-hwmon@archiver.kernel.org>; Thu, 21 Oct 2021 18:18:04 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 194DF61A05
	for <linux-hwmon@archiver.kernel.org>; Thu, 21 Oct 2021 18:18:04 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231509AbhJUSUT (ORCPT <rfc822;linux-hwmon@archiver.kernel.org>);
        Thu, 21 Oct 2021 14:20:19 -0400
Received: from mail.kernel.org ([198.145.29.99]:40574 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S232323AbhJUSUR (ORCPT <rfc822;linux-hwmon@vger.kernel.org>);
        Thu, 21 Oct 2021 14:20:17 -0400
Received: by mail.kernel.org (Postfix) with ESMTPSA id B44E061880;
        Thu, 21 Oct 2021 18:18:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1634840280;
        bh=K3JjdPmlQz/3EcEWfhNveos011K2np4Uczsfe3KdiKs=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=BoCQLlEplBizF509s9ygO40YCoMMSHXVpWquY9s6FtKSW2GfDWrepAhUDQcU5+U7/
         YULjdpg8nbjwfF+cy1XCC8nxRvoDasZEZpLKcTPrKnNcM6Wu6r/Ru0fMGk+t7QDYXf
         3oRWoxnPFs7AUAS7jCp/1qhFLMVa4IsvpWSNaRhjDqh43EyZ1DU8DPxnyEtYq/WgFZ
         0Cq0admlIXLIdvxbEUaPsOIz3EgO25VEZrkJQYPfBQWPmsD/4qnJtDAPN2phPvtvUi
         gN1ySM3YUAKh9dje5fnHV088F05TE3xWBAUSSHCwBbLajWmGibnFEqAT4qqGMI0txp
         XB1ewMIm8R2bg==
Received: by pali.im (Postfix)
        id 02CC885E; Thu, 21 Oct 2021 20:17:59 +0200 (CEST)
Date:   Thu, 21 Oct 2021 20:17:58 +0200
From:   Pali =?utf-8?B?Um9ow6Fy?= <pali@kernel.org>
To:     W_Armin@gmx.de
Cc:     linux@roeck-us.net, jdelvare@suse.com, linux-hwmon@vger.kernel.org
Subject: Re: [PATCH 3/5] hwmon: (dell-smm) Return -ENOIOCTLCMD instead of
 -EINVAL
Message-ID: <20211021181758.3udejerxhucsvaxl@pali>
References: <20211021175447.5380-1-W_Armin@gmx.de>
 <20211021175447.5380-4-W_Armin@gmx.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20211021175447.5380-4-W_Armin@gmx.de>
User-Agent: NeoMutt/20180716
Precedence: bulk
List-ID: <linux-hwmon.vger.kernel.org>
X-Mailing-List: linux-hwmon@vger.kernel.org

On Thursday 21 October 2021 19:54:45 W_Armin@gmx.de wrote:
> From: Armin Wolf <W_Armin@gmx.de>
> 
> Returning -ENOIOCTLCMD gives the callers a better
> hint of what went wrong and is the recommended
> behavior.
> 
> Signed-off-by: Armin Wolf <W_Armin@gmx.de>

Acked-by: Pali Rohár <pali@kernel.org>

> ---
>  drivers/hwmon/dell-smm-hwmon.c | 3 ++-
>  1 file changed, 2 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/hwmon/dell-smm-hwmon.c b/drivers/hwmon/dell-smm-hwmon.c
> index b0c591bb761a..5f0338b4a717 100644
> --- a/drivers/hwmon/dell-smm-hwmon.c
> +++ b/drivers/hwmon/dell-smm-hwmon.c
> @@ -18,6 +18,7 @@
>  #include <linux/delay.h>
>  #include <linux/dmi.h>
>  #include <linux/err.h>
> +#include <linux/errno.h>
>  #include <linux/hwmon.h>
>  #include <linux/init.h>
>  #include <linux/module.h>
> @@ -516,7 +517,7 @@ i8k_ioctl_unlocked(struct file *fp, struct dell_smm_data *data, unsigned int cmd
>  		break;
> 
>  	default:
> -		return -EINVAL;
> +		return -ENOIOCTLCMD;
>  	}
> 
>  	if (val < 0)
> --
> 2.20.1
> 
