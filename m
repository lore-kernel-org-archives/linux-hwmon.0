Return-Path: <SRS0=ye16=DH=vger.kernel.org=linux-hwmon-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-11.3 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_1
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8DCB7C2D0A8
	for <linux-hwmon@archiver.kernel.org>; Wed, 30 Sep 2020 05:06:17 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 3D81B206F7
	for <linux-hwmon@archiver.kernel.org>; Wed, 30 Sep 2020 05:06:17 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="vEJPdpXs"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725804AbgI3FGR (ORCPT <rfc822;linux-hwmon@archiver.kernel.org>);
        Wed, 30 Sep 2020 01:06:17 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59196 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725372AbgI3FGQ (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>);
        Wed, 30 Sep 2020 01:06:16 -0400
Received: from mail-oi1-x242.google.com (mail-oi1-x242.google.com [IPv6:2607:f8b0:4864:20::242])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id AE5A2C061755;
        Tue, 29 Sep 2020 22:06:16 -0700 (PDT)
Received: by mail-oi1-x242.google.com with SMTP id u126so340956oif.13;
        Tue, 29 Sep 2020 22:06:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=sender:date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=VCm4wmLWcqRMtPqk49e2AUFkM/wauHmH72d4WhnkLAg=;
        b=vEJPdpXsduVOePn17e6rB+0D/LnRgFyffKVQXet69kLIdOSU1uLfc2VQSoRWbpkvna
         vuxndW30jgxAKMI6VwGYPrLcw/2W1SyuoqhoOb5wDnbidrLgrc/cPZNjIYkRL0KReYPP
         4wluewpdFc8EbLC+oJLt21ukN+4U6+0DG0PvqtS4IRsZCMxL9AFAjVOA/V2ZRJLL/ImT
         S5lAqQnZ3r+DmIrK7iz9BNj8YyDJKLJB35XVZqNIsafQJUDefEWN0FUm67aJYU2RTBRj
         4P5krHXj/Hv3DfPrb2I+oVYecdwHLqHWHloiDra5GY68qql4GKKZF79XeB8dH901veDi
         bweA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:sender:date:from:to:cc:subject:message-id
         :references:mime-version:content-disposition:in-reply-to:user-agent;
        bh=VCm4wmLWcqRMtPqk49e2AUFkM/wauHmH72d4WhnkLAg=;
        b=OshhxpWNKWKCnhRJGEGuKHxkcYZHNj8To7nHNixfZTx+AMT2mrsbLJmGewJXHkVEyN
         kUu5/WRAT86E8j2OTxvtbcicpdJpEBX3j5UqBeQINMl5V8BH/OTZ3fFle9xss9I7iHgm
         m2ejpuKadDE1HRunmwLIiL7UGZzxecHL5G/avUzC6MLRdIgEBWyOMb8aa5e9qxGkrMGp
         4QC/Z59UDVEjIRn6yufi9cpmfC4pdnjar85Rw9iVhz+A0ah1hlXQt1fPtIch2vCww87D
         tGA1vctunlHAgzr9gwD5pNvgFe7gMWiCIGmBFeG8blHiM8PetBxhVGii8cp+EKsKRQFC
         zkqg==
X-Gm-Message-State: AOAM5334LnK+yz+9OS9NfSv+m5xoJCxcuLS5ER5Tv9tGSRLzBnU1owGy
        i5kZqA5nKLf70C4Pi7IWzJmHz6psmoo=
X-Google-Smtp-Source: ABdhPJwvo+MM3bbzS0DjULgWi2ng7zeZ/4XZsKlY7GxXY7diZmNmlpQ3iai3nlkeqtPuzYaJRluo4w==
X-Received: by 2002:aca:ed95:: with SMTP id l143mr530717oih.22.1601442376149;
        Tue, 29 Sep 2020 22:06:16 -0700 (PDT)
Received: from localhost ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
        by smtp.gmail.com with ESMTPSA id e22sm147676oib.18.2020.09.29.22.06.15
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 29 Sep 2020 22:06:15 -0700 (PDT)
Sender: Guenter Roeck <groeck7@gmail.com>
Date:   Tue, 29 Sep 2020 22:06:14 -0700
From:   Guenter Roeck <linux@roeck-us.net>
To:     Wang Qing <wangqing@vivo.com>
Cc:     Eric Tremblay <etremblay@distech-controls.com>,
        Jean Delvare <jdelvare@suse.com>, linux-hwmon@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH] hwmon: fix spelling typo in comments
Message-ID: <20200930050614.GA193574@roeck-us.net>
References: <1601086116-32218-1-git-send-email-wangqing@vivo.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1601086116-32218-1-git-send-email-wangqing@vivo.com>
User-Agent: Mutt/1.9.4 (2018-02-28)
Precedence: bulk
List-ID: <linux-hwmon.vger.kernel.org>
X-Mailing-List: linux-hwmon@vger.kernel.org

On Sat, Sep 26, 2020 at 10:08:33AM +0800, Wang Qing wrote:
> Modify the comment typo: "compliment" -> "complement".
> 
> Signed-off-by: Wang Qing <wangqing@vivo.com>
> ---

Applied, but in the future please list the affected driver in the
subject line.

Guenter

>  drivers/hwmon/tmp513.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/hwmon/tmp513.c b/drivers/hwmon/tmp513.c
> index 23908dc..c37d321
> --- a/drivers/hwmon/tmp513.c
> +++ b/drivers/hwmon/tmp513.c
> @@ -192,7 +192,7 @@ static int tmp51x_get_value(struct tmp51x_data *data, u8 reg, u8 pos,
>  		/*
>  		 * The valus is read in voltage in the chip but reported as
>  		 * current to the user.
> -		 * 2's compliment number shifted by one to four depending
> +		 * 2's complement number shifted by one to four depending
>  		 * on the pga gain setting. 1lsb = 10uV
>  		 */
>  		*val = sign_extend32(regval, 17 - tmp51x_get_pga_shift(data));
