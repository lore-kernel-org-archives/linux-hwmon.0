Return-Path: <linux-hwmon-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6D2E8C433F5
	for <linux-hwmon@archiver.kernel.org>; Tue, 28 Dec 2021 00:28:27 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234131AbhL1A21 (ORCPT <rfc822;linux-hwmon@archiver.kernel.org>);
        Mon, 27 Dec 2021 19:28:27 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42428 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230342AbhL1A20 (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>);
        Mon, 27 Dec 2021 19:28:26 -0500
Received: from mail-oi1-x232.google.com (mail-oi1-x232.google.com [IPv6:2607:f8b0:4864:20::232])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 28FE9C06173E
        for <linux-hwmon@vger.kernel.org>; Mon, 27 Dec 2021 16:28:26 -0800 (PST)
Received: by mail-oi1-x232.google.com with SMTP id s73so27578600oie.5
        for <linux-hwmon@vger.kernel.org>; Mon, 27 Dec 2021 16:28:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=sender:subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=i6nV8dPHdERyO7YGmaz2ODejqE4xMKu2c3cieay/XoA=;
        b=g8omKFzLsyIHq/aUfubCArMc6j5yT1LGcuzcILdUsxgZOVmklYVGra7sk6ArtqPtOZ
         4lfZb5LlNGMocO27nxapoCUvBE09vr3oJiiNjCJA8X6Q3QgGL4WXDEj8a/HQfwQYTiFL
         v49pXMouIwieMZwSdwjz5Wrv8+9mhAnfx/JPlsinuirHLs0FdaxcLJBwrZCLCCW+b34l
         lnDzYjYKT17q0/lbyp29ecU9p/owAY/yS+U5h1VkuRznUg49TP9nnVptG0Rl4EYUsGJB
         BuroWoIKEKcPgF1U0AZElt8WtTLghGRTsDjLIxfPZ7nPtDdoDtALftuMKEAGJ5XBrLUD
         DqCA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:sender:subject:to:cc:references:from:message-id
         :date:user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=i6nV8dPHdERyO7YGmaz2ODejqE4xMKu2c3cieay/XoA=;
        b=eKfyT5w/8rjlwx8wHepEpsfStxPzHTtQnBFaQcFPZNvLZ5Jlc8JPBFgpdh1hwow8Wb
         OK8dhaj8pc33HuyOUviD1HSOWZ3glxy5qKXGdxGFLKMJkYlHunUdIDgBvDQ7WPWTnWto
         i2reMu6F5eFfnrRsrBwGapvoa7v3PEhKp3veGTdFwL41ZZK0zRDy9fVlOIBzhBA8semj
         wNz5h80q2KcyEjN45yFLIlaQbbbSjV92AFegvGni6brSmITqvn426pmi1D0T1/ybAnYi
         46Wadf9a2nxF3X/NoOtMDJhLn/XtjNN1BFZC2PrVvPynskLgBrboE0PSk2odsJynjWHr
         2VtQ==
X-Gm-Message-State: AOAM5323B2nryDmHb6jfRgAxu4+ZezKL9H7zD6sf/RPa0cC6usuj2b8Q
        lpSa/RVUjKwXBQsEf/G8IhAIjRdoMNA=
X-Google-Smtp-Source: ABdhPJzW3UY4IATsrHGwzNIEyhB7MwPloEXK9LCsAQgbpw+GeNlT5+5SdoNIuUeTrBQcn4INBaY1tg==
X-Received: by 2002:aca:1811:: with SMTP id h17mr14201440oih.178.1640651305207;
        Mon, 27 Dec 2021 16:28:25 -0800 (PST)
Received: from server.roeck-us.net ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
        by smtp.gmail.com with ESMTPSA id k8sm2861963oon.2.2021.12.27.16.28.23
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 27 Dec 2021 16:28:24 -0800 (PST)
Sender: Guenter Roeck <groeck7@gmail.com>
Subject: Re: [PATCH] hwmon: (nzxt-smart2) Fix "unused function" warning
To:     Aleksandr Mezin <mezin.alexander@gmail.com>,
        linux-hwmon@vger.kernel.org
Cc:     Jean Delvare <jdelvare@suse.com>
References: <20211228001330.816929-1-mezin.alexander@gmail.com>
From:   Guenter Roeck <linux@roeck-us.net>
Message-ID: <3802b1e8-0d86-29df-8f51-2b089fec82fe@roeck-us.net>
Date:   Mon, 27 Dec 2021 16:28:23 -0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.14.0
MIME-Version: 1.0
In-Reply-To: <20211228001330.816929-1-mezin.alexander@gmail.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-hwmon.vger.kernel.org>
X-Mailing-List: linux-hwmon@vger.kernel.org

On 12/27/21 4:13 PM, Aleksandr Mezin wrote:
> Fix warning when building with CONFIG_PM=n (and CONFIG_WERROR=y):
> 
> drivers/hwmon/nzxt-smart2.c:707:12: error: ‘nzxt_smart2_hid_reset_resume’
> defined but not used [-Werror=unused-function]
>    707 | static int nzxt_smart2_hid_reset_resume(struct hid_device *hdev)
>        |            ^~~~~~~~~~~~~~~~~~~~~~~~~~~~
> 
> Signed-off-by: Aleksandr Mezin <mezin.alexander@gmail.com>
> ---
>   drivers/hwmon/nzxt-smart2.c | 4 ++++
>   1 file changed, 4 insertions(+)
> 
> diff --git a/drivers/hwmon/nzxt-smart2.c b/drivers/hwmon/nzxt-smart2.c
> index 534d39b8908e..6033249bf06d 100644
> --- a/drivers/hwmon/nzxt-smart2.c
> +++ b/drivers/hwmon/nzxt-smart2.c
> @@ -704,6 +704,8 @@ static int nzxt_smart2_hid_raw_event(struct hid_device *hdev,
>   	return 0;
>   }
>   
> +#ifdef CONFIG_PM
> +
>   static int nzxt_smart2_hid_reset_resume(struct hid_device *hdev)

Please use __maybe_unused instead.

Guenter

>   {
>   	struct drvdata *drvdata = hid_get_drvdata(hdev);
> @@ -721,6 +723,8 @@ static int nzxt_smart2_hid_reset_resume(struct hid_device *hdev)
>   	return init_device(drvdata, drvdata->update_interval);
>   }
>   
> +#endif
> +
>   static int nzxt_smart2_hid_probe(struct hid_device *hdev,
>   				 const struct hid_device_id *id)
>   {
> 

