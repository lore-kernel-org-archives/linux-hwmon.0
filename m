Return-Path: <linux-hwmon-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 47702EB64DA
	for <linux-hwmon@archiver.kernel.org>; Wed, 28 Jun 2023 16:46:34 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231863AbjF1Qqc (ORCPT <rfc822;linux-hwmon@archiver.kernel.org>);
        Wed, 28 Jun 2023 12:46:32 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40612 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231638AbjF1Qqa (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>);
        Wed, 28 Jun 2023 12:46:30 -0400
Received: from mail-pl1-x633.google.com (mail-pl1-x633.google.com [IPv6:2607:f8b0:4864:20::633])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8039826B6
        for <linux-hwmon@vger.kernel.org>; Wed, 28 Jun 2023 09:46:29 -0700 (PDT)
Received: by mail-pl1-x633.google.com with SMTP id d9443c01a7336-1b7dd061e9aso845785ad.2
        for <linux-hwmon@vger.kernel.org>; Wed, 28 Jun 2023 09:46:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1687970789; x=1690562789;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :sender:from:to:cc:subject:date:message-id:reply-to;
        bh=qrYAOZWFq1jwNgarpH5XzNGvmZ1AMQN/ZU7SJfxaFiA=;
        b=OpdR4+OUhGAsKTP9Kv+ei6jedD3GcoIxn5nISSvQoimww7ZudP+49cp2R9trB+iY+I
         BDuuN0Tg0M/vovsXhy7uf/yeu5gDsIfUdcHDnSRtyuzg93ruWrHQGdibzv/K5pNtPD1c
         lnAsyUfscU2GUY2nfA8UZCb1h2mD6fLWgBc+gXiFQbTyJljdT7E2DyyxpvByGcPpqsMR
         YlYzpeoh7hrep0cHGy2M9zuxI1UDwbLFkvL8fQWJiEMfjZNKP5xoKjZ5C/n59cotvdXU
         oelkDW0/z4ABhGPj6nya5wk6MEzV462Q0JMAfJYhPLhe+4MnrgH5WPKftL0o5wFsgRQe
         2l2Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1687970789; x=1690562789;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :sender:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=qrYAOZWFq1jwNgarpH5XzNGvmZ1AMQN/ZU7SJfxaFiA=;
        b=GbF483CcOWYmSYceFso8nOBAzoJuRqhUGeEIbbsEA/WP8/JhyPQ1L5BITQhB5FMjM2
         Bc+0Op7mqlEs87Ko+1N38I1FAW5Oy/3JOycgUhdb76tmIbUbNxpe5DclQRexkfEa3BMm
         cW+ZUzUzDqw/qyAFixjPOH5isJRAG2hcofTjM1on2d5pB2Gbz/W3ge9LHr8dA2a9pGf+
         F6ok2BGJk5iYRAZY0uMMMNtigHXzdE+HRDjpSy1tpZExZhzy4QKJLHKjFcnMUojZAYEl
         idnqZ6gdCZ1Y2XfZcLm6uPQVMZoaLCMSdmxbGUTTp63U3BDkDVxCwH+usEa0E4t01BXB
         nREQ==
X-Gm-Message-State: AC+VfDwqCL1ereNFG7b94rMXtxQUlR6lwWGnFfM01jMYJIsSv1N+shYV
        kIT4i4Jvqc/ktjEdaykSp6JFya4Gbm0=
X-Google-Smtp-Source: ACHHUZ4f8H31XshIrKR39h93zrtKkD7/kN/88ZK9aXtmjW2ZqSOxDtEh0VxIWLW0/3Jr/rdCjSxapw==
X-Received: by 2002:a17:902:9a05:b0:1b1:8e8b:7f6c with SMTP id v5-20020a1709029a0500b001b18e8b7f6cmr10755147plp.16.1687970788804;
        Wed, 28 Jun 2023 09:46:28 -0700 (PDT)
Received: from ?IPV6:2600:1700:e321:62f0:329c:23ff:fee3:9d7c? ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
        by smtp.gmail.com with ESMTPSA id b1-20020a170902b60100b0019ee045a2b3sm7878121pls.308.2023.06.28.09.46.27
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 28 Jun 2023 09:46:28 -0700 (PDT)
Sender: Guenter Roeck <groeck7@gmail.com>
Message-ID: <ba6e1b94-f79e-954a-592e-dfefe2a71f1f@roeck-us.net>
Date:   Wed, 28 Jun 2023 09:46:26 -0700
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.11.0
Subject: Re: [PATCH] hwmon: (pmbus) Update documentation to not use
 .probe_new() any more
Content-Language: en-US
To:     =?UTF-8?Q?Uwe_Kleine-K=c3=b6nig?= <u.kleine-koenig@pengutronix.de>,
        Jean Delvare <jdelvare@suse.com>
Cc:     Jonathan Corbet <corbet@lwn.net>, linux-hwmon@vger.kernel.org,
        kernel@pengutronix.de
References: <20230627064948.593804-1-u.kleine-koenig@pengutronix.de>
From:   Guenter Roeck <linux@roeck-us.net>
In-Reply-To: <20230627064948.593804-1-u.kleine-koenig@pengutronix.de>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-hwmon.vger.kernel.org>
X-Mailing-List: linux-hwmon@vger.kernel.org

Hi Uwe,

On 6/26/23 23:49, Uwe Kleine-König wrote:
> Since commit 03c835f498b5 ("i2c: Switch .probe() to not take an id
> parameter") .probe() is the recommended callback to implement an i2c
> driver (again). Reflect this in the documentation and don't mention
> .probe_new() which will be dropped soon.
> 
> Signed-off-by: Uwe Kleine-König <u.kleine-koenig@pengutronix.de>
> ---
> Hello,
> 
> this patch was part of a patch dropping .probe_new() before (see
> https://lore.kernel.org/linux-i2c/20230626094548.559542-1-u.kleine-koenig@pengutronix.de).
> 
> However this change makes already sense without dropping .probe_new, so
> here it comes as a separate patch.
> 
> Best regards
> Uwe
> 

I got this after sending my pull request, and I don't currently plan to send
another one. What is the time line for the probe_new removal ? If it is
still planned for 6.5, you might want to keep it as part of the series.
In that case,

Acked-by: Guenter Roeck <linux@roeck-us.net>

Thanks,
Guenter

>   Documentation/hwmon/pmbus.rst | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/Documentation/hwmon/pmbus.rst b/Documentation/hwmon/pmbus.rst
> index 7ecfec6ca2db..eb1569bfa676 100644
> --- a/Documentation/hwmon/pmbus.rst
> +++ b/Documentation/hwmon/pmbus.rst
> @@ -163,7 +163,7 @@ Emerson DS1200 power modules might look as follows::
>   	.driver = {
>   		   .name = "ds1200",
>   		   },
> -	.probe_new = ds1200_probe,
> +	.probe = ds1200_probe,
>   	.id_table = ds1200_id,
>     };
>   
> 
> base-commit: 6995e2de6891c724bfeb2db33d7b87775f913ad1

