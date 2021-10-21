Return-Path: <linux-hwmon-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 00587C433F5
	for <linux-hwmon@archiver.kernel.org>; Thu, 21 Oct 2021 18:17:39 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id C69D461AA9
	for <linux-hwmon@archiver.kernel.org>; Thu, 21 Oct 2021 18:17:36 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230187AbhJUSTw (ORCPT <rfc822;linux-hwmon@archiver.kernel.org>);
        Thu, 21 Oct 2021 14:19:52 -0400
Received: from mail.kernel.org ([198.145.29.99]:40080 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S230020AbhJUSTw (ORCPT <rfc822;linux-hwmon@vger.kernel.org>);
        Thu, 21 Oct 2021 14:19:52 -0400
Received: by mail.kernel.org (Postfix) with ESMTPSA id B13AB61AA8;
        Thu, 21 Oct 2021 18:17:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1634840255;
        bh=/wQ+6nG5UvtDY0bwALfON1Tlemta0gEcmV/7O9JZ1kY=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=Dc8QRRGxIPchxuMHRaUTOsjL+fmvpY0Ah0qoklGgrAiPB+naOyRVXxsyw5iBlcYCi
         5Z1VsU43lNYfufF7d7mrctwbxMER9QgwoNa+WhYKlB0VX1/d16jvClfZUmtks8Z3gE
         qTK8c4mJoz1Cn0K3hqhGaxcP8AgZn3pJC7CwoqYhqjswavVJRQNCgc6neCe016CX25
         SSpTgluFF1nDqj/8TMNRCtJSNVvLOWdsn5/Ta+yFQJ0mNfi/ah5mwuR5wVo+X6+RY8
         epSHOycmDqLuK4ABre7w1zIqe4ksx242snh6usdf+2u9/Uf9nWSQbbfp1t4Qrpy6KK
         /hzcxvb5pV5rQ==
Received: by pali.im (Postfix)
        id 8AE1885E; Thu, 21 Oct 2021 20:17:33 +0200 (CEST)
Date:   Thu, 21 Oct 2021 20:17:33 +0200
From:   Pali =?utf-8?B?Um9ow6Fy?= <pali@kernel.org>
To:     W_Armin@gmx.de
Cc:     linux@roeck-us.net, jdelvare@suse.com, linux-hwmon@vger.kernel.org
Subject: Re: [PATCH 2/5] hwmon: (dell-smm) Use strscpy_pad()
Message-ID: <20211021181733.etsac5s3xyyg3hy7@pali>
References: <20211021175447.5380-1-W_Armin@gmx.de>
 <20211021175447.5380-3-W_Armin@gmx.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20211021175447.5380-3-W_Armin@gmx.de>
User-Agent: NeoMutt/20180716
Precedence: bulk
List-ID: <linux-hwmon.vger.kernel.org>
X-Mailing-List: linux-hwmon@vger.kernel.org

On Thursday 21 October 2021 19:54:44 W_Armin@gmx.de wrote:
> From: Armin Wolf <W_Armin@gmx.de>
> 
> Using strscpy_pad() allows for fewer memory accesses
> since memset() will not unconditionally zero-out
> the whole buffer.
> 
> Signed-off-by: Armin Wolf <W_Armin@gmx.de>

Acked-by: Pali Rohár <pali@kernel.org>

> ---
>  drivers/hwmon/dell-smm-hwmon.c | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/hwmon/dell-smm-hwmon.c b/drivers/hwmon/dell-smm-hwmon.c
> index 9773d6c0477a..b0c591bb761a 100644
> --- a/drivers/hwmon/dell-smm-hwmon.c
> +++ b/drivers/hwmon/dell-smm-hwmon.c
> @@ -25,6 +25,7 @@
>  #include <linux/platform_device.h>
>  #include <linux/proc_fs.h>
>  #include <linux/seq_file.h>
> +#include <linux/string.h>
>  #include <linux/smp.h>
>  #include <linux/types.h>
>  #include <linux/uaccess.h>
> @@ -472,8 +473,7 @@ i8k_ioctl_unlocked(struct file *fp, struct dell_smm_data *data, unsigned int cmd
>  		if (restricted && !capable(CAP_SYS_ADMIN))
>  			return -EPERM;
> 
> -		memset(buff, 0, sizeof(buff));
> -		strscpy(buff, data->bios_machineid, sizeof(buff));
> +		strscpy_pad(buff, data->bios_machineid, sizeof(buff));
>  		break;
> 
>  	case I8K_FN_STATUS:
> --
> 2.20.1
> 
