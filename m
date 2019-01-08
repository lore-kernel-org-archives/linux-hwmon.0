Return-Path: <SRS0=toFl=PQ=vger.kernel.org=linux-hwmon-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-6.8 required=3.0 tests=DKIM_INVALID,DKIM_SIGNED,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_PASS autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3E420C43387
	for <linux-hwmon@archiver.kernel.org>; Tue,  8 Jan 2019 05:06:30 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id F126120700
	for <linux-hwmon@archiver.kernel.org>; Tue,  8 Jan 2019 05:06:29 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="AwLG0rKC"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727558AbfAHFG3 (ORCPT <rfc822;linux-hwmon@archiver.kernel.org>);
        Tue, 8 Jan 2019 00:06:29 -0500
Received: from mail-pf1-f194.google.com ([209.85.210.194]:44502 "EHLO
        mail-pf1-f194.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725838AbfAHFG3 (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>); Tue, 8 Jan 2019 00:06:29 -0500
Received: by mail-pf1-f194.google.com with SMTP id u6so1299379pfh.11
        for <linux-hwmon@vger.kernel.org>; Mon, 07 Jan 2019 21:06:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=sender:subject:to:references:cc:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=m7DSTxCiihFMVseaTgMbI4mYVzKCkXjurxbj0f2wUk0=;
        b=AwLG0rKCJDjZmPBhaGAfkdXoOU3q+IMQndCHUO2HEuQs+nG9eLcWzorZ1aCcZiYeZP
         Cpmi8xbs3PNuH0vfitRTl8XgeZon2LMmEttMr8opX79pWCO/pneNTi0LGYSzNVv7N09N
         4VkuCAlBoVwjBKoAYkr2p+3cY58aVoJ7lJeOzbsNwwBCMsUOlgXGfMv4hdaqmFGkWBj4
         wWf2bKMceSAcu1qIqHZfyZunD/Xx2WXl+rqkacdLz+Mgck0yi4arq7A0A3uuYxGnjpdv
         /BOYzBqboSiazRhwsbhXuFU6Ejq0oAs5k/uOPanWTNRs/QHBRI0YFAFDH5DJ5H+CTEBp
         gltQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:sender:subject:to:references:cc:from:message-id
         :date:user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=m7DSTxCiihFMVseaTgMbI4mYVzKCkXjurxbj0f2wUk0=;
        b=K/KUttKaCRpR1UYiOKel3abiu8XhTMISrj1UGwglDAKGtuatq9QqTom3o1JkkLqS3/
         hfCVA6gZbrrzZO8p0Z6ldQWozMKvT6T7KSpieh8sM604hBkMdXll0tsALsO2M4OtUF3T
         dTofhw9JZK+RnBAGoc4WQcfPP7Wh01xTymGWHW+3wgkquH0HVJHVSxh3spiFgEQPmNAs
         QXsvEiHFPSKTfm76i82lQmYWI2AS0jow7EN5J0A7KFoa1RzRCsdriSOQvLV72rWKViki
         ZmrjSmd/axxphct/G09Jw+gHSRGwQYWw4K8mypMrVXBPvgoPRrMwOleOV2bhD62mrgsk
         IKPw==
X-Gm-Message-State: AJcUukcesYnxivVxSnZnM7wiUBVqaA3ZAF90pDGmIm9W6oG/MtJUB9xg
        G+Z2yM/gJ19aEQDDukY3luEpfHHw
X-Google-Smtp-Source: ALg8bN4f5HLWUPE6U/fo/7xX9Cf0gIV3uUsTIHZ1eld+tBJgtgyPPs1Y54JDPsLGe1E9+z1RoXTJBg==
X-Received: by 2002:a63:585c:: with SMTP id i28mr303652pgm.178.1546923988544;
        Mon, 07 Jan 2019 21:06:28 -0800 (PST)
Received: from server.roeck-us.net ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
        by smtp.gmail.com with ESMTPSA id 15sm100870657pfr.55.2019.01.07.21.06.27
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Mon, 07 Jan 2019 21:06:27 -0800 (PST)
Subject: Re: [PATCH] hwmon: (tmp421) Correct the misspelling of the tmp442
 compatible attribute in OF device ID table
To:     Cheng-Min Ao <ginyo78914@gmail.com>, jdelvare@suse.com
References: <1546842572-75828-1-git-send-email-ginyo78914@gmail.com>
Cc:     "linux-hwmon@vger.kernel.org" <linux-hwmon@vger.kernel.org>
From:   Guenter Roeck <linux@roeck-us.net>
Message-ID: <4d0f61b5-98c4-0f63-2b1d-6a84b32c255f@roeck-us.net>
Date:   Mon, 7 Jan 2019 21:06:26 -0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.2.1
MIME-Version: 1.0
In-Reply-To: <1546842572-75828-1-git-send-email-ginyo78914@gmail.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Sender: linux-hwmon-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-hwmon.vger.kernel.org>
X-Mailing-List: linux-hwmon@vger.kernel.org

On 1/6/19 10:29 PM, Cheng-Min Ao wrote:
> From: Cheng-Min Ao <tony_ao@wiwynn.com>
> 
> Correct a typo in OF device ID table
> The last one should be 'ti,tmp442'
> 
> Signed-off-by: Cheng-Min Ao <tony_ao@wiwynn.com>
> Signed-off-by: Yu-Hsiang Chen <matt_chen@wiwynn.com>

Applied. In the future, please don't forget to copy linux-hwmon@vger.kernel.org.

Thanks,
Guenter

> ---
>   drivers/hwmon/tmp421.c | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/hwmon/tmp421.c b/drivers/hwmon/tmp421.c
> index 8844c95..7053be5 100644
> --- a/drivers/hwmon/tmp421.c
> +++ b/drivers/hwmon/tmp421.c
> @@ -88,7 +88,7 @@
>   		.data = (void *)2
>   	},
>   	{
> -		.compatible = "ti,tmp422",
> +		.compatible = "ti,tmp442",
>   		.data = (void *)3
>   	},
>   	{ },
> 

