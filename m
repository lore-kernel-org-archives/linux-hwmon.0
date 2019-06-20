Return-Path: <SRS0=qGwe=UT=vger.kernel.org=linux-hwmon-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.0 required=3.0 tests=DKIM_INVALID,DKIM_SIGNED,
	FAKE_REPLY_C,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_MUTT autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 49114C43613
	for <linux-hwmon@archiver.kernel.org>; Thu, 20 Jun 2019 21:24:25 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 1895E2070B
	for <linux-hwmon@archiver.kernel.org>; Thu, 20 Jun 2019 21:24:25 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="eUV21gq+"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725905AbfFTVYY (ORCPT <rfc822;linux-hwmon@archiver.kernel.org>);
        Thu, 20 Jun 2019 17:24:24 -0400
Received: from mail-pl1-f193.google.com ([209.85.214.193]:44785 "EHLO
        mail-pl1-f193.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725815AbfFTVYY (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>);
        Thu, 20 Jun 2019 17:24:24 -0400
Received: by mail-pl1-f193.google.com with SMTP id t7so1882760plr.11
        for <linux-hwmon@vger.kernel.org>; Thu, 20 Jun 2019 14:24:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=sender:date:from:to:cc:subject:message-id:mime-version
         :content-disposition:user-agent;
        bh=Qr50ilBpku4OBMl5HMGUm7c9GPjHb8gMM3TnLjJ5oho=;
        b=eUV21gq+d/maXEaAg6OL1zdoHjKvuhR00QonLQKiIFBqnbdomxxz3B25gDghP4MNQp
         Td1uSwHQv+xF6LMKobv5FzX3FMuWlgAY5EByn5QJM40EM9Lwuqv6Mlj2z8ZAWTZsmBiP
         /lKSAjf91eAkynENSrkKrWWJbepBb+nT4fbB5KdCvmzrWxRmQtToz+ZGuhFmgt8AvBxM
         df1RUUgoxGBi3luvQLsJOLcSKic7Oz5APqaJEUKBLkQ2cLRK8iPTMrkAh9d5WfTuv3pX
         ylcUFCdcXfM7o0KehiHUbPZtXeIppB198mSXlXqjxjFk0wy4QlMNCcNhWZPvariZPOst
         BVYg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:sender:date:from:to:cc:subject:message-id
         :mime-version:content-disposition:user-agent;
        bh=Qr50ilBpku4OBMl5HMGUm7c9GPjHb8gMM3TnLjJ5oho=;
        b=SelY//RxGV35M3hMcEc/9sJcmFd2dMlZMOKOdI2Qg2COHO/QZb1sFD3PRMgSM/YEGT
         UqeZnUhVIyKu3ceaOqU4cqz8IDhrKraywbWrHPLExkx9gye/Klf4yZS5Zx9YW6oE4RTd
         JA3IJ6/x6AWNOH9JJOdXGw7BD9VHT5yGOlIeFAKTmJlpHGpGY6DRODGfFUXpcrRUpQ48
         I5HeGeBZEhEpbyqai9PxqyetuYat/y18GXBBpp8kUXbeZmq44Qb37e5q67kTKbMemeSV
         1CHRMthMX5eskmU7V8DcgLH3PF1+aFs4Wu6YOOrEns8hLxRW2PCpqeAMyWV+1jtEuoQt
         xmgg==
X-Gm-Message-State: APjAAAUV8hY7buNYlxSsblM5fOhxP1a7ucMOrV/m53CMxX1D/sc4Njqe
        vr2K5LTcWRYQsLvivUE4c452r0bC
X-Google-Smtp-Source: APXvYqy9nCj9ZMTgMIPVYTYXTdDmjiW3Iy55KJ9VqhDAuawxPOcN2NtbFvg6rvfBkpmXQRPS9OHazA==
X-Received: by 2002:a17:902:e30d:: with SMTP id cg13mr14054660plb.173.1561065863914;
        Thu, 20 Jun 2019 14:24:23 -0700 (PDT)
Received: from localhost ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
        by smtp.gmail.com with ESMTPSA id e6sm394734pfn.71.2019.06.20.14.24.22
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Thu, 20 Jun 2019 14:24:22 -0700 (PDT)
Date:   Thu, 20 Jun 2019 14:24:21 -0700
From:   Guenter Roeck <linux@roeck-us.net>
To:     Boyang Yu <byu@arista.com>
Cc:     Jean Delvare <jdelvare@suse.com>, linux-hwmon@vger.kernel.org,
        deank@arista.com, ryant@arista.com
Subject: Re: [PATCH] hwmon: (lm90) Fix max6658 sporadic wrong temperature
 reading
Message-ID: <20190620212421.GA3880@roeck-us.net>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
User-Agent: Mutt/1.5.24 (2015-08-30)
Sender: linux-hwmon-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-hwmon.vger.kernel.org>
X-Mailing-List: linux-hwmon@vger.kernel.org

Hi,

On Thu, Jun 20, 2019 at 07:25:25PM +0000, Boyang Yu wrote:
> max6658 may report unrealistically high temperature during
> the driver initialization, for which, its overtemp alarm pin
> also gets asserted. For certain devices implementing overtemp
> protection based on that pin, it may further trigger a reset to
> the device. By reproducing the problem, the wrong reading is
> found to be coincident with changing the conversion rate.
> 
> To mitigate this issue, set the stop bit before changing the
> conversion rate and unset it thereafter. After such change, the
> wrong reading is not reproduced. As the issue is only found on
> max6658, apply this change only to the max6657 kind.
> 
> Signed-off-by: Boyang Yu <byu@arista.com>
> ---
>  drivers/hwmon/lm90.c | 54 ++++++++++++++++++++++++++++++++++++++++----
>  1 file changed, 50 insertions(+), 4 deletions(-)
[ ... ]
> 
>  /*
>   * Set conversion rate.
>   * client->update_lock must be held when calling this function (unless we are
> @@ -587,7 +616,11 @@ static int lm90_set_convrate(struct i2c_client *client, struct lm90_data *data,
>  		if (interval >= update_interval * 3 / 4)
>  			break;
>  
> -	err = i2c_smbus_write_byte_data(client, LM90_REG_W_CONVRATE, i);
> +	if (data->kind == max6657)
> +		err = max6657_write_convrate(client, i);
> +	else
> +		err = i2c_smbus_write_byte_data(client, LM90_REG_W_CONVRATE, i);
> +
Please name the new function lm90_write_convrate, call it unconditionally,
and check if the chip is affected in the function. Also, please implement
the check with a feature flag - it is quite unlikely that only max6658
is affected, and we'll want an easy method to add support for other chips.

Thanks,
Guenter
