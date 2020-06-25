Return-Path: <SRS0=Zrk+=AG=vger.kernel.org=linux-hwmon-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.3 required=3.0 tests=DKIM_INVALID,DKIM_SIGNED,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_1 autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A59CFC433DF
	for <linux-hwmon@archiver.kernel.org>; Thu, 25 Jun 2020 13:45:55 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 8003120781
	for <linux-hwmon@archiver.kernel.org>; Thu, 25 Jun 2020 13:45:55 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="LOJPGyAm"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2405146AbgFYNpz (ORCPT <rfc822;linux-hwmon@archiver.kernel.org>);
        Thu, 25 Jun 2020 09:45:55 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40178 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2405096AbgFYNpy (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>);
        Thu, 25 Jun 2020 09:45:54 -0400
Received: from mail-pl1-x644.google.com (mail-pl1-x644.google.com [IPv6:2607:f8b0:4864:20::644])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id BA514C08C5C1
        for <linux-hwmon@vger.kernel.org>; Thu, 25 Jun 2020 06:45:54 -0700 (PDT)
Received: by mail-pl1-x644.google.com with SMTP id k6so2802368pll.9
        for <linux-hwmon@vger.kernel.org>; Thu, 25 Jun 2020 06:45:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=sender:subject:to:references:from:autocrypt:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=ND8B4F/N6NkuIA1hLduvNaAX2WJGNyRxznY2pbDInqk=;
        b=LOJPGyAmFpqCU2wswJM+tvBsBImXhW75X3cZ8HnElcbuOmY9Eeh9eBBSotIDlQuv4U
         PIkB4RvE2MkKCoScbeIQxw83K5R71/Xf8NafOYuKUmGZCV55eW3EVRIWVkRckp6tVIEd
         Hqtx5PPfgExEBv30NKR4w3I5FsaMUmLNQAhoP7DZ6It6ULgbUkJ6eweXJPQuWte6Jeue
         QCYnihryncT1FqOEKljgznWYEafH+dWZFre0Mem11EMORDPlevATrQ4kfF+KcFGPWJda
         QECZag8cQ8hznMXB9FZU8Ojuth3XzMdK6fUB+W6DIcP/o2e71iTiIpeDO2kFHJc1Mapq
         Bofg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:sender:subject:to:references:from:autocrypt
         :message-id:date:user-agent:mime-version:in-reply-to
         :content-language:content-transfer-encoding;
        bh=ND8B4F/N6NkuIA1hLduvNaAX2WJGNyRxznY2pbDInqk=;
        b=OFjrTlSp/h7oR+3xpL6xR7BAD4SLrXTz43SovPLWpPdwOqBlvUeBip1B9rUUuu7Rzt
         QCrVa1c1N8ho+oXk7Jql5WtZmD5Je6IZTVYA2r+mafNBeWBBRCBq9fsq2/7qoe5SkCRr
         XhbnPZhAEr1F5umLAP29V9DpDyp+94AdlIVdVagSCrYLsWbhttZzQJ1uO693X3D2iKvm
         vhfqXOspMl3Dd1/ZhnBH3dko3z1OmONXd5df1/XOI3kz0VsxlAc60YnzVGKPmA/AWwlH
         GabAWACdlziIrA5t2QYLmTr+Szbl+77WA3DnwR5p/PrQEQhXC2tnElcLGx9p77gFjA7i
         Q5Qg==
X-Gm-Message-State: AOAM5331aLQiBqN7au6n/76dODX+/tO4dUUb0SI4WJtEdIbH5koB3E5Q
        84EgKyVqLVGug2KzGr6SVI9MIiLJ
X-Google-Smtp-Source: ABdhPJzYIeE1RMnbNvkx0eP92UJdKiDoYaRrJHpmrVNyyyaqFLr85bQHMDSRjLEng2IeN19HVNRO6g==
X-Received: by 2002:a17:90a:c003:: with SMTP id p3mr3524292pjt.178.1593092754121;
        Thu, 25 Jun 2020 06:45:54 -0700 (PDT)
Received: from server.roeck-us.net ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
        by smtp.gmail.com with ESMTPSA id cl17sm2738135pjb.50.2020.06.25.06.45.52
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 25 Jun 2020 06:45:53 -0700 (PDT)
Subject: Re: [PATCH] hwmon: (acpi_power_meter) Convert to use
 hwmon_device_register_with_info() API
To:     Misono Tomohiro <misono.tomohiro@jp.fujitsu.com>,
        linux-hwmon@vger.kernel.org
References: <20200625073109.13993-1-misono.tomohiro@jp.fujitsu.com>
From:   Guenter Roeck <linux@roeck-us.net>
Autocrypt: addr=linux@roeck-us.net; keydata=
 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
 mDW4+i+XlNFUPUYMrIKi9joBhu18ssf5i5Q=
Message-ID: <6213bd1a-693c-9c8d-cbf1-ad0666e3c679@roeck-us.net>
Date:   Thu, 25 Jun 2020 06:45:52 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.8.0
MIME-Version: 1.0
In-Reply-To: <20200625073109.13993-1-misono.tomohiro@jp.fujitsu.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Sender: linux-hwmon-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-hwmon.vger.kernel.org>
X-Mailing-List: linux-hwmon@vger.kernel.org

On 6/25/20 12:31 AM, Misono Tomohiro wrote:
> Since hwmon_device_register() has been deprecated and gives warning in
> dmesg, just convert it to hwmon_device_register_with_info() with name
> strings.
> 
> Only difference is that now name sysfs file is created under top hwmon
> directory. i.e.:
>  $ cat /sys/class/hwmon/hwmonX/name
>  $ power_meter
> 
> Other than that, nothing has changed.
> 
> Signed-off-by: Misono Tomohiro <misono.tomohiro@jp.fujitsu.com>
> ---
>  drivers/hwmon/acpi_power_meter.c | 3 ++-
>  1 file changed, 2 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/hwmon/acpi_power_meter.c b/drivers/hwmon/acpi_power_meter.c
> index a270b975e90b..d93a5423d7ae 100644
> --- a/drivers/hwmon/acpi_power_meter.c
> +++ b/drivers/hwmon/acpi_power_meter.c
> @@ -885,7 +885,8 @@ static int acpi_power_meter_add(struct acpi_device *device)
>  	if (res)
>  		goto exit_free_capability;
>  
> -	resource->hwmon_dev = hwmon_device_register(&device->dev);
> +	resource->hwmon_dev = hwmon_device_register_with_info(&device->dev,
> +					ACPI_POWER_METER_NAME, NULL, NULL, NULL);
>  	if (IS_ERR(resource->hwmon_dev)) {
>  		res = PTR_ERR(resource->hwmon_dev);
>  		goto exit_remove;
> 

NACK

This is not acceptable and an API abuse. I'll have to make the API more restrictive
to avoid such abuse.

Guenter
