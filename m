Return-Path: <SRS0=0nUB=4K=vger.kernel.org=linux-hwmon-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.1 required=3.0 tests=DKIM_INVALID,DKIM_SIGNED,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1 autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C4D43C35666
	for <linux-hwmon@archiver.kernel.org>; Sat, 22 Feb 2020 15:48:32 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 9B55F208C3
	for <linux-hwmon@archiver.kernel.org>; Sat, 22 Feb 2020 15:48:32 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="M4Em60uB"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727445AbgBVPsc (ORCPT <rfc822;linux-hwmon@archiver.kernel.org>);
        Sat, 22 Feb 2020 10:48:32 -0500
Received: from mail-pl1-f194.google.com ([209.85.214.194]:34236 "EHLO
        mail-pl1-f194.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727230AbgBVPsc (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>);
        Sat, 22 Feb 2020 10:48:32 -0500
Received: by mail-pl1-f194.google.com with SMTP id j7so2170725plt.1;
        Sat, 22 Feb 2020 07:48:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=sender:subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=SWUUWT4ZB0TcXYYHFJ6Ou9hJ8yBoPD/x5MgrkUc6YHo=;
        b=M4Em60uBlU0Kn1ASOLYVagcX/WbF9WpkMQc8Y+3WYxAxKzRRi19YVfcYjt4yx7cGh5
         vc0PH3unxuBx1+RB1n09rLHzNHvicsdvgcXJ+lPjXM74RFxomdnrsz4Ska0Fyl3OH6DI
         Fswl3FBUCT+p/AgMlshwTj+K4jwap6FQkCKXUlZrnv7/vsDsCZziCit+k2zrwKIIbNHo
         K6VCDlxDG0i5g/OA/lkCZpxiHo1lr1jsZhUEMe8KKkmrXvKw/gWpBslceC75EBY1/SMl
         wuB7yYGW1Wo35Z8SDkpEGwFJ12uKjogy6QC+i+kCdgesAncLybGFGdN93j7WgdegFFir
         uwvA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:sender:subject:to:cc:references:from:message-id
         :date:user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=SWUUWT4ZB0TcXYYHFJ6Ou9hJ8yBoPD/x5MgrkUc6YHo=;
        b=SI1eVd8YuNy8kr7MPyMzpupQ7eWC1eAW1DjIh9KZJXZ8fX3sfHeVz5gC8oo7l1+pMo
         HFQHwLkX61SPxiNwQY1cEw6cLByOJWESN+AFeeMYlnrmrb937xf6YALM3ziW7WuNxp4C
         SlS8NPL2+aryM5Mg28+Msj/kkCCeVAQhjknJPiB9Mh3E42BQkpl8juBN7/i8bynKaY3j
         SxGvidEehv8Vi48D71xzb741ZCj7vkdqhL9Gsrn69fxHiPPMMQ1SXQ5IoBk5suMxHFYA
         uVE98eQ5WDgiREzSxxaHCiA88JXg16rZFvEGMm+XtOwoAaWKid5Usi/MJ36D/mM6C4I2
         aCHg==
X-Gm-Message-State: APjAAAXn4D46Sccy4u/htLYAagc93xH7hzT54FIu/aQ5rIa+Xv9cx3bi
        QYh7Ngyoqk/fUADHcRU/GxBl9499
X-Google-Smtp-Source: APXvYqxU4oL1zrqJFA7RYhmlpHImtB+PRJ6fby0XYlNwyDTXJLipc6p6cDELDHFnTReX8BkMsuItbg==
X-Received: by 2002:a17:902:bd43:: with SMTP id b3mr39373443plx.230.1582386511081;
        Sat, 22 Feb 2020 07:48:31 -0800 (PST)
Received: from server.roeck-us.net ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
        by smtp.gmail.com with ESMTPSA id x190sm6793019pfb.96.2020.02.22.07.48.30
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 22 Feb 2020 07:48:30 -0800 (PST)
Subject: Re: [PATCH 4/7] docs: adm1177: fix a broken reference
To:     Mauro Carvalho Chehab <mchehab+huawei@kernel.org>,
        Linux Doc Mailing List <linux-doc@vger.kernel.org>
Cc:     Jonathan Corbet <corbet@lwn.net>, Jean Delvare <jdelvare@suse.com>,
        linux-hwmon@vger.kernel.org
References: <cover.1582361737.git.mchehab+huawei@kernel.org>
 <8d37f465888656224855a21f5bb01edb1ca66cf3.1582361738.git.mchehab+huawei@kernel.org>
From:   Guenter Roeck <linux@roeck-us.net>
Message-ID: <b7f05f9f-a3d4-2b8d-f917-e430ffe453aa@roeck-us.net>
Date:   Sat, 22 Feb 2020 07:48:29 -0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.4.1
MIME-Version: 1.0
In-Reply-To: <8d37f465888656224855a21f5bb01edb1ca66cf3.1582361738.git.mchehab+huawei@kernel.org>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Sender: linux-hwmon-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-hwmon.vger.kernel.org>
X-Mailing-List: linux-hwmon@vger.kernel.org

On 2/22/20 1:00 AM, Mauro Carvalho Chehab wrote:
> This reference was missing the .rst extension. This would be OK
> if it were using the :doc: directive. So, switch to it.
> 
> As a side effect, this will create cross-reference links at
> html output.
> 
> Signed-off-by: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>

Applied.

Thanks,
Guenter

> ---
>   Documentation/hwmon/adm1177.rst | 3 +--
>   1 file changed, 1 insertion(+), 2 deletions(-)
> 
> diff --git a/Documentation/hwmon/adm1177.rst b/Documentation/hwmon/adm1177.rst
> index c81e0b4abd28..471be1e98d6f 100644
> --- a/Documentation/hwmon/adm1177.rst
> +++ b/Documentation/hwmon/adm1177.rst
> @@ -20,8 +20,7 @@ Usage Notes
>   -----------
>   
>   This driver does not auto-detect devices. You will have to instantiate the
> -devices explicitly. Please see Documentation/i2c/instantiating-devices for
> -details.
> +devices explicitly. Please see :doc:`/i2c/instantiating-devices` for details.
>   
>   
>   Sysfs entries
> 

