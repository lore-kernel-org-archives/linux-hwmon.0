Return-Path: <SRS0=50Tr=QH=vger.kernel.org=linux-hwmon-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.3 required=3.0 tests=DKIM_INVALID,DKIM_SIGNED,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_PASS,
	USER_AGENT_MUTT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C32BBC282D9
	for <linux-hwmon@archiver.kernel.org>; Thu, 31 Jan 2019 18:11:46 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 94752218AF
	for <linux-hwmon@archiver.kernel.org>; Thu, 31 Jan 2019 18:11:46 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Okbve4sz"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728094AbfAaSLp (ORCPT <rfc822;linux-hwmon@archiver.kernel.org>);
        Thu, 31 Jan 2019 13:11:45 -0500
Received: from mail-pl1-f194.google.com ([209.85.214.194]:39763 "EHLO
        mail-pl1-f194.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725730AbfAaSLp (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>);
        Thu, 31 Jan 2019 13:11:45 -0500
Received: by mail-pl1-f194.google.com with SMTP id 101so1828746pld.6
        for <linux-hwmon@vger.kernel.org>; Thu, 31 Jan 2019 10:11:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=sender:date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=BHZ5P5cSZ2uBfzxcAAcZqSWsmmlNB7F0m+pAzsIT8G4=;
        b=Okbve4szWhBDdEwcuvRnuGbPOp/S3PL19R6kNE9X0S6M+wpBqtQvUayA8Xunw2NaOB
         TjHDtcBlL92OCgEmGXaDyVNqVcm2WbfHao7AQJIzeXKXl4+SB3sZ1JAcM32+dUSo5lzU
         nQr6Zkv+23w762BBcGMx+q9ZSEu3UqdrfWrqIzEx1sm+LzUUoLdUomy9DPybkijGkJK3
         qLvYiNHdRlv1R2rDNdsP9snXjiaCgzD2EFQlne7TlQ8/VAA7xhQEstB9RBmM8/5Z5LUO
         2PjfpfeFrBeHl4INOPDjUcASlfsP8vw10HAX8wzIdCYMenHR45HYG/x22FtVb9RzCKdP
         240w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:sender:date:from:to:cc:subject:message-id
         :references:mime-version:content-disposition:in-reply-to:user-agent;
        bh=BHZ5P5cSZ2uBfzxcAAcZqSWsmmlNB7F0m+pAzsIT8G4=;
        b=Zc3vWpNytHIlC/gJ52WHtDE0m9DT3Da/dGFeZQg3BbOnfSCmzhriM0cOTuzHa8JPJe
         0gYsRqjCfK/JYwx/oGSZou5QRQQvh47NjJnyxnYrLbzaIPacz10L8le4JMpKrIgTjEPR
         kr/223Ceh0oF+OWrIEevOHae++dbXPBN1wxjku2pU2XTb/g1hJeu1PgkspTTcuhsEIsG
         V2PKDBTLs1lDDNd3+S8lpYwjAimeeJcSOAxmdrs4VAd/eBGIG4t9Op3aW1kosu5Jgnmq
         dAZWMZuRjYuSHSlUdmsa83o5BSVBhRJEo5vYIFc6GrF3nepMBZMtIYG49efLYa5uDMCy
         ggzw==
X-Gm-Message-State: AJcUukfQaIbKlRku7aqlwJ3LXSaaQduKtEF8cH/gB1gHY+yICKumqbN8
        uYR1JQWDhICuiXO6Mj5shjTj35L3
X-Google-Smtp-Source: ALg8bN4n8FF0PKAd5G8mCLGNN8udI7XObulaVYptszhbJcX/VX7ub/WNG+p4TgxgNmZbC9DfoxbWug==
X-Received: by 2002:a17:902:b20e:: with SMTP id t14mr35957699plr.128.1548958304729;
        Thu, 31 Jan 2019 10:11:44 -0800 (PST)
Received: from localhost ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
        by smtp.gmail.com with ESMTPSA id u126sm9931257pgb.2.2019.01.31.10.11.43
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Thu, 31 Jan 2019 10:11:44 -0800 (PST)
Date:   Thu, 31 Jan 2019 10:11:43 -0800
From:   Guenter Roeck <linux@roeck-us.net>
To:     Matt Wilbur <wilburm@gmail.com>
Cc:     linux-hwmon@vger.kernel.org
Subject: Re: [PATCH 1/1] Fix swapped coeffs for LM5066 and LM5066i iin
Message-ID: <20190131181143.GA17285@roeck-us.net>
References: <20190128170034.24348-1-wilburm@gmail.com>
 <20190128170034.24348-2-wilburm@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20190128170034.24348-2-wilburm@gmail.com>
User-Agent: Mutt/1.5.24 (2015-08-30)
Sender: linux-hwmon-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-hwmon.vger.kernel.org>
X-Mailing-List: linux-hwmon@vger.kernel.org

Hi,

On Mon, Jan 28, 2019 at 12:00:34PM -0500, Matt Wilbur wrote:
> ---

Unfortunately, your patch is not signed, and I can not apply it.
Also, the explanation should be part of this patch. Please
also note the expected subject line, which should start with
"hwmon: (pmbus/lm25066)".

On top of that, while the subject claims to also address LM5066i,
it does not really do that.

Guenter

>  drivers/hwmon/pmbus/lm25066.c | 12 ++++++------
>  1 file changed, 6 insertions(+), 6 deletions(-)
> 
> diff --git a/drivers/hwmon/pmbus/lm25066.c b/drivers/hwmon/pmbus/lm25066.c
> index 53db78753a0d..9d917b5f0a81 100644
> --- a/drivers/hwmon/pmbus/lm25066.c
> +++ b/drivers/hwmon/pmbus/lm25066.c
> @@ -156,11 +156,11 @@ static struct __coeff lm25066_coeff[6][PSC_NUM_CLASSES + 2] = {
>  			.R = -2,
>  		},
>  		[PSC_CURRENT_IN] = {
> -			.m = 10753,
> +			.m = 5405,
>  			.R = -2,
>  		},
>  		[PSC_CURRENT_IN_L] = {
> -			.m = 5405,
> +			.m = 10753,
>  			.R = -2,
>  		},
>  		[PSC_POWER] = {
> @@ -197,13 +197,13 @@ static struct __coeff lm25066_coeff[6][PSC_NUM_CLASSES + 2] = {
>  			.R = -2,
>  		},
>  		[PSC_POWER] = {
> -			.m = 1701,
> -			.b = -4000,
> +			.m = 861,
> +			.b = -965,
>  			.R = -3,
>  		},
>  		[PSC_POWER_L] = {
> -			.m = 861,
> -			.b = -965,
> +			.m = 1701,
> +			.b = -4000,
>  			.R = -3,
>  		},
>  		[PSC_TEMPERATURE] = {
> -- 
> 2.17.1
> 
