Return-Path: <linux-hwmon-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-15.3 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6D4A9C433ED
	for <linux-hwmon@archiver.kernel.org>; Fri, 14 May 2021 21:43:07 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 4D7F5613BE
	for <linux-hwmon@archiver.kernel.org>; Fri, 14 May 2021 21:43:07 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232844AbhENVoS (ORCPT <rfc822;linux-hwmon@archiver.kernel.org>);
        Fri, 14 May 2021 17:44:18 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36834 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233150AbhENVoR (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>);
        Fri, 14 May 2021 17:44:17 -0400
Received: from mail-qk1-x732.google.com (mail-qk1-x732.google.com [IPv6:2607:f8b0:4864:20::732])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 0658EC06174A
        for <linux-hwmon@vger.kernel.org>; Fri, 14 May 2021 14:43:06 -0700 (PDT)
Received: by mail-qk1-x732.google.com with SMTP id o27so388957qkj.9
        for <linux-hwmon@vger.kernel.org>; Fri, 14 May 2021 14:43:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=sender:to:cc:references:from:subject:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=rlkBtO8pkiEyv3DU/Qn4ryAg7m+qsnSg2mmskGE7fvg=;
        b=YgDazzcQsSgJYX4Z7jcD4n4vsBS/tkjV9dIYw1Z691dAyj3y5Q2T5oWgpetRP6Fmgh
         uMZv/ckWSdW1Y8c4bRQZvNCpa7wn/+SwMd4KSS0K9hfdL9Bqr3mp3vZNNEATpAHmQVMc
         4UPNXOBcpzKfeBNZI7/PsDvvFRYmR3aefRtQT9vzlyDkPT/x9WawgMxPGaoS73MdpCdA
         wqyVVAQBVtJTDYeojFldcWp5OmtkQJ3wl9WfcBMns8So6hmBe4KRwFCu0bFpQQWNGH/E
         1MCb9j1VX0kAaX3F+CcFePLyCpGLsjcEJwK89YC13eQNm+T51Kv5moUlp90lgt19D4dg
         POgA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:sender:to:cc:references:from:subject:message-id
         :date:user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=rlkBtO8pkiEyv3DU/Qn4ryAg7m+qsnSg2mmskGE7fvg=;
        b=jW/9/VGUamphfmfE+tg2D4852rioXPiM41p+59L7S62OYNrUm0WdNI9UABvfSTLptM
         8Ixjg/pC059cRrrLEzq8cr99ai24XYJsqjnlTH9nnXKMcpILZtL3Qh5L5UjEDYLdVeCz
         PPVNSPXpCuQzlkcgBAXzsB/Gr7ehjuO62fjrCIq0L1r2Ep+mUbN1odJJQOlOfsuhK9u1
         HrDQI10ND5371++5nuQGMJWfsh0/ARoqAzDQ7SG+XfZ+zx80OqrJBf0SS42m+PDVOY49
         kB29UkWCS2ulpMoq+rwZPhO3i16lRJcmH6HRTge5xkGlD5O562zQwCLo3UOnia8QXlxM
         +zOw==
X-Gm-Message-State: AOAM530BAZAhK/HSbMc3k+oa8K0cZBpia/YBgDe7ppM2VfFd3PiyvJaP
        F7XZvzCQLsk14g7FWebtKMJwMqx4HTw=
X-Google-Smtp-Source: ABdhPJwZ794gB6YDCLus2/eF+ANKRKtb2j59bXk6DypB8tdhTPRsak0D1yBCeH+U4Mt7qzII4XVKiQ==
X-Received: by 2002:a37:513:: with SMTP id 19mr46335430qkf.283.1621028585133;
        Fri, 14 May 2021 14:43:05 -0700 (PDT)
Received: from server.roeck-us.net ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
        by smtp.gmail.com with ESMTPSA id x7sm5318365qts.42.2021.05.14.14.43.04
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 14 May 2021 14:43:04 -0700 (PDT)
Sender: Guenter Roeck <groeck7@gmail.com>
To:     Grant Peltier <grantpeltier93@gmail.com>
Cc:     linux-hwmon@vger.kernel.org, grant.peltier.jg@renesas.com,
        adam.vaughn.xh@renesas.com
References: <20210514211954.GA24646@raspberrypi>
From:   Guenter Roeck <linux@roeck-us.net>
Subject: Re: [PATCH] hwmon: (pmbus/isl68137) remove READ_TEMPERATURE_3 for
 RAA228228
Message-ID: <fa8c3175-f1b8-8951-46ac-bb9ca08d6822@roeck-us.net>
Date:   Fri, 14 May 2021 14:43:03 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
MIME-Version: 1.0
In-Reply-To: <20210514211954.GA24646@raspberrypi>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-hwmon.vger.kernel.org>
X-Mailing-List: linux-hwmon@vger.kernel.org

On 5/14/21 2:19 PM, Grant Peltier wrote:
> The initial version of the RAA228228 datasheet claimed that the device
> supported READ_TEMPERATURE_3 but not READ_TEMPERATURE_1. It has since been
> discovered that the datasheet was incorrect. The RAA228228 does support
> READ_TEMPERATURE_1 but does not support READ_TEMPERATURE_3.
> 

Sorry that I have to ask, but do you have some kind of reference for that ?
Due to recent events I can unfortunately no longer trust such submissions
without some kind of confirmation (for example resend from your Renesas
e-mail address if that is possible, or ask someone from a Renesas e-mail
address to send a Reviewed-by: / Acked-by:).

> This change fixes an error introduced in commit:
> 51fb91ed5a6fa855a74731610cd5435d83d6e17f
> 

That should be

Fixes: 51fb91ed5a6fa ("hwmon: (pmbus/isl68137) remove READ_TEMPERATURE_1 telemetry for RAA228228")

Thanks,
Guenter

> Signed-off-by: Grant Peltier <grantpeltier93@gmail.com>
> ---
>   drivers/hwmon/pmbus/isl68137.c | 4 ++--
>   1 file changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/hwmon/pmbus/isl68137.c b/drivers/hwmon/pmbus/isl68137.c
> index 40597a9e799f..1a8caff1ac5f 100644
> --- a/drivers/hwmon/pmbus/isl68137.c
> +++ b/drivers/hwmon/pmbus/isl68137.c
> @@ -244,8 +244,8 @@ static int isl68137_probe(struct i2c_client *client)
>   		info->read_word_data = raa_dmpvr2_read_word_data;
>   		break;
>   	case raa_dmpvr2_2rail_nontc:
> -		info->func[0] &= ~PMBUS_HAVE_TEMP;
> -		info->func[1] &= ~PMBUS_HAVE_TEMP;
> +		info->func[0] &= ~PMBUS_HAVE_TEMP3;
> +		info->func[1] &= ~PMBUS_HAVE_TEMP3;
>   		fallthrough;
>   	case raa_dmpvr2_2rail:
>   		info->pages = 2;
> 

