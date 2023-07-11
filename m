Return-Path: <linux-hwmon-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 88FA9EB64DD
	for <linux-hwmon@archiver.kernel.org>; Tue, 11 Jul 2023 10:08:07 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229954AbjGKKIG (ORCPT <rfc822;linux-hwmon@archiver.kernel.org>);
        Tue, 11 Jul 2023 06:08:06 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:47844 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229548AbjGKKIG (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>);
        Tue, 11 Jul 2023 06:08:06 -0400
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8604210A
        for <linux-hwmon@vger.kernel.org>; Tue, 11 Jul 2023 03:07:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1689070038;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=kZ1Zgpgj63HwlWEwsThyu6JQTmo8pm99b3bKVT/0+Bg=;
        b=TF+PxuUPt6YCzAkLp6iEsplm4Zo+Ajd512Jwcrls+8uCT7Hwmtqt7yRm7hStxl63wlIDT8
        UFI3LtZzuD/txldRabect52wajAB4S8xhCvIDSQ67u5CtzFYX4oUV3S0GWHxFDGZjrFt+s
        lj6gdyOhM9vlkRya73598PCGvBN6vsM=
Received: from mail-ej1-f70.google.com (mail-ej1-f70.google.com
 [209.85.218.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-84-IBPff0wVPcCHBTvQJAo3cQ-1; Tue, 11 Jul 2023 06:07:17 -0400
X-MC-Unique: IBPff0wVPcCHBTvQJAo3cQ-1
Received: by mail-ej1-f70.google.com with SMTP id a640c23a62f3a-94a34a0b75eso347366166b.1
        for <linux-hwmon@vger.kernel.org>; Tue, 11 Jul 2023 03:07:16 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1689070036; x=1691662036;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=kZ1Zgpgj63HwlWEwsThyu6JQTmo8pm99b3bKVT/0+Bg=;
        b=Z08B1JqM/7uEJ6xi9abwzoow0exAaVMPpPsm6Vulm6dqaFHZAZ4/A5p4gVm8AnPaTF
         wpT1w7gn04XecsJ63NwAPTkIHR3+fzHy1PjQtShecoyw8J82iC/GXCsOaEiLETmZefC/
         dxfRhiF7MaqWwmzXMwM2VMEqseH6GJfieHlgVr84akoBtpuithsMelfrLMFX7MkIuau7
         u9S2HUEPwIzojFjMA+J38iPWI8uT8rw4pkZFbWP4XfkS81N8QQK9K0W2cwte4WTSC2WE
         w5hVr4BGrU8RGWSQoHNl2Nw3W3NdKitxMr2Mz3IyqZAFeTLzB398ysm4I1H+8hu98Jiy
         3jKw==
X-Gm-Message-State: ABy/qLZXseGMQjK6Kv6XcejYfGW4sHzwCpiJJ8PazjqOgjOf71tmvRX5
        kCJOeoHHcP+1ahBOnBT4hIe2vrJeEmXPFkp1AIPp2PlL9APplY5HRfUIa0IR4bJ81M5BBnuJTDx
        TmAuM6mMqGyTLiTBAOqqptsM=
X-Received: by 2002:a17:906:7a0a:b0:993:d6bc:a48c with SMTP id d10-20020a1709067a0a00b00993d6bca48cmr14516420ejo.1.1689070036100;
        Tue, 11 Jul 2023 03:07:16 -0700 (PDT)
X-Google-Smtp-Source: APBJJlH+/om4tcSMyQz1hCZ852VhrJeYEsGhn+t+zR2tDcDzsnqJcXQM+57d0CWh2h2C5po5WopocQ==
X-Received: by 2002:a17:906:7a0a:b0:993:d6bc:a48c with SMTP id d10-20020a1709067a0a00b00993d6bca48cmr14516399ejo.1.1689070035842;
        Tue, 11 Jul 2023 03:07:15 -0700 (PDT)
Received: from ?IPV6:2001:1c00:c32:7800:5bfa:a036:83f0:f9ec? (2001-1c00-0c32-7800-5bfa-a036-83f0-f9ec.cable.dynamic.v6.ziggo.nl. [2001:1c00:c32:7800:5bfa:a036:83f0:f9ec])
        by smtp.gmail.com with ESMTPSA id lf16-20020a170907175000b00993928e4d1bsm960476ejc.24.2023.07.11.03.07.14
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 11 Jul 2023 03:07:15 -0700 (PDT)
Message-ID: <be62be68-d69a-9081-68d2-8202da3a49f1@redhat.com>
Date:   Tue, 11 Jul 2023 12:07:14 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.12.0
Subject: Re: [PATCH 1/2] platform/x86: dell-ddv: Improve error handling
Content-Language: en-US, nl
To:     Armin Wolf <W_Armin@gmx.de>, markgross@kernel.org
Cc:     jdelvare@suse.com, linux@roeck-us.net,
        platform-driver-x86@vger.kernel.org, linux-hwmon@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20230707010333.12954-1-W_Armin@gmx.de>
From:   Hans de Goede <hdegoede@redhat.com>
In-Reply-To: <20230707010333.12954-1-W_Armin@gmx.de>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-hwmon.vger.kernel.org>
X-Mailing-List: linux-hwmon@vger.kernel.org

Hi,

On 7/7/23 03:03, Armin Wolf wrote:
> If for some reason a external function returns -ENODEV,
> no error message is being displayed because the driver
> assumes that -ENODEV can only be returned internally if
> no sensors, etc where found.
> Fix this by explicitly returning 0 in such a case since
> missing hardware is no error. Also remove the now obsolete
> check for -ENODEV.
> 
> Signed-off-by: Armin Wolf <W_Armin@gmx.de>

Thank you for your series, I've applied this series to my fixes
branch:
https://git.kernel.org/pub/scm/linux/kernel/git/pdx86/platform-drivers-x86.git/log/?h=fixes

I will include this series in my next fixes pull-req to Linus
for the current kernel development cycle.

Regards,

Hans

> ---
>  drivers/platform/x86/dell/dell-wmi-ddv.c | 7 ++++---
>  1 file changed, 4 insertions(+), 3 deletions(-)
> 
> diff --git a/drivers/platform/x86/dell/dell-wmi-ddv.c b/drivers/platform/x86/dell/dell-wmi-ddv.c
> index 2750dee99c3e..db1e9240dd02 100644
> --- a/drivers/platform/x86/dell/dell-wmi-ddv.c
> +++ b/drivers/platform/x86/dell/dell-wmi-ddv.c
> @@ -616,7 +616,8 @@ static int dell_wmi_ddv_hwmon_add(struct dell_wmi_ddv_data *data)
>  	}
> 
>  	if (index < 2) {
> -		ret = -ENODEV;
> +		/* Finding no available sensors is not an error */
> +		ret = 0;
> 
>  		goto err_release;
>  	}
> @@ -841,13 +842,13 @@ static int dell_wmi_ddv_probe(struct wmi_device *wdev, const void *context)
> 
>  	if (IS_REACHABLE(CONFIG_ACPI_BATTERY)) {
>  		ret = dell_wmi_ddv_battery_add(data);
> -		if (ret < 0 && ret != -ENODEV)
> +		if (ret < 0)
>  			dev_warn(&wdev->dev, "Unable to register ACPI battery hook: %d\n", ret);
>  	}
> 
>  	if (IS_REACHABLE(CONFIG_HWMON)) {
>  		ret = dell_wmi_ddv_hwmon_add(data);
> -		if (ret < 0 && ret != -ENODEV)
> +		if (ret < 0)
>  			dev_warn(&wdev->dev, "Unable to register hwmon interface: %d\n", ret);
>  	}
> 
> --
> 2.30.2
> 

