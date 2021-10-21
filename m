Return-Path: <linux-hwmon-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id ACEDFC433EF
	for <linux-hwmon@archiver.kernel.org>; Thu, 21 Oct 2021 18:14:31 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 8BBBC61A3B
	for <linux-hwmon@archiver.kernel.org>; Thu, 21 Oct 2021 18:14:31 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229550AbhJUSQr (ORCPT <rfc822;linux-hwmon@archiver.kernel.org>);
        Thu, 21 Oct 2021 14:16:47 -0400
Received: from mail.kernel.org ([198.145.29.99]:36126 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S229914AbhJUSQq (ORCPT <rfc822;linux-hwmon@vger.kernel.org>);
        Thu, 21 Oct 2021 14:16:46 -0400
Received: by mail.kernel.org (Postfix) with ESMTPSA id 7323661A8F;
        Thu, 21 Oct 2021 18:14:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1634840070;
        bh=L3TXeykLd7yerGsgXThc6irtoZS/3FMy0iINbL76Uqg=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=raD7DgqCs54rthelAukx5jOMVNJLle9PDSei5qwb/oPuXgY8e2/+h4R29jtnDJovy
         C1y8xbchlCv8Pc8LCFbDHUiit0YsFMnpcd5Gk2CrZh2GcW5Uf3/5xePVKiL76ABVPg
         svivCD0PuAG0h5IA2ZTBuqwtbNd0BX+mU+oENGuzkHHjpLqxF3hsQ51y7/8huhFb4Q
         LYL4C/VL93uNSnv/EdKjJE/ddTFVpAzGXP4yA67tU/TIx08aYD3g4+dNMi3L+n6bHX
         v7qxQJYeGiE+K7Bz+exJnGBzSktbgXsTCDW3iJ8vqYjP3e3CIH0BIPtGw0/BhD2caY
         1hHREzbuT9z5g==
Received: by pali.im (Postfix)
        id 19B0E85E; Thu, 21 Oct 2021 20:14:28 +0200 (CEST)
Date:   Thu, 21 Oct 2021 20:14:27 +0200
From:   Pali =?utf-8?B?Um9ow6Fy?= <pali@kernel.org>
To:     W_Armin@gmx.de
Cc:     linux@roeck-us.net, jdelvare@suse.com, linux-hwmon@vger.kernel.org
Subject: Re: [PATCH 5/5] hwmon: (dell-smm) Speed up setting of fan speed
Message-ID: <20211021181427.au5k37bicdqthlhb@pali>
References: <20211021175447.5380-1-W_Armin@gmx.de>
 <20211021175447.5380-6-W_Armin@gmx.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20211021175447.5380-6-W_Armin@gmx.de>
User-Agent: NeoMutt/20180716
Precedence: bulk
List-ID: <linux-hwmon.vger.kernel.org>
X-Mailing-List: linux-hwmon@vger.kernel.org

On Thursday 21 October 2021 19:54:47 W_Armin@gmx.de wrote:
> From: Armin Wolf <W_Armin@gmx.de>
> 
> When setting the fan speed, i8k_set_fan() calls i8k_get_fan_status(),
> causing an unnecessary smm call which can be very slow while also
> making error handling difficult.
> Fix that by removing the function call from i8k_set_fan() and
> call it separately when needed.

The important information which is missing in commit message is the fact
that there are only two users of i8k_set_fan() function. First is
dell_smm_write() and second is i8k_ioctl_unlocked().

First user only checks if error occurred during i8k_set_fan() call and
ignores new fan status. Second user needs to know new fan status as it
returns it to userspace.

So this change just speed up first user - dell_smm_write() function.

It would be nice to put this kind of information into commit message as
from code change itself it is not obvious.

Otherwise code change is fine,

Reviewed-by: Pali Rohár <pali@kernel.org>

> Tested on a Dell Inspiron 3505.
> 
> Signed-off-by: Armin Wolf <W_Armin@gmx.de>
> ---
>  drivers/hwmon/dell-smm-hwmon.c | 12 ++++++++----
>  1 file changed, 8 insertions(+), 4 deletions(-)
> 
> diff --git a/drivers/hwmon/dell-smm-hwmon.c b/drivers/hwmon/dell-smm-hwmon.c
> index 2579dd646b20..62f087f67925 100644
> --- a/drivers/hwmon/dell-smm-hwmon.c
> +++ b/drivers/hwmon/dell-smm-hwmon.c
> @@ -327,7 +327,7 @@ static int i8k_enable_fan_auto_mode(const struct dell_smm_data *data, bool enabl
>  }
> 
>  /*
> - * Set the fan speed (off, low, high). Returns the new fan status.
> + * Set the fan speed (off, low, high, ...).
>   */
>  static int i8k_set_fan(const struct dell_smm_data *data, int fan, int speed)
>  {
> @@ -339,7 +339,7 @@ static int i8k_set_fan(const struct dell_smm_data *data, int fan, int speed)
>  	speed = (speed < 0) ? 0 : ((speed > data->i8k_fan_max) ? data->i8k_fan_max : speed);
>  	regs.ebx = (fan & 0xff) | (speed << 8);
> 
> -	return i8k_smm(&regs) ? : i8k_get_fan_status(data, fan);
> +	return i8k_smm(&regs);
>  }
> 
>  static int __init i8k_get_temp_type(int sensor)
> @@ -453,7 +453,7 @@ static int
>  i8k_ioctl_unlocked(struct file *fp, struct dell_smm_data *data, unsigned int cmd, unsigned long arg)
>  {
>  	int val = 0;
> -	int speed;
> +	int speed, err;
>  	unsigned char buff[16];
>  	int __user *argp = (int __user *)arg;
> 
> @@ -513,7 +513,11 @@ i8k_ioctl_unlocked(struct file *fp, struct dell_smm_data *data, unsigned int cmd
>  		if (copy_from_user(&speed, argp + 1, sizeof(int)))
>  			return -EFAULT;
> 
> -		val = i8k_set_fan(data, val, speed);
> +		err = i8k_set_fan(data, val, speed);
> +		if (err < 0)
> +			return err;
> +
> +		val = i8k_get_fan_status(data, val);
>  		break;
> 
>  	default:
> --
> 2.20.1
> 
