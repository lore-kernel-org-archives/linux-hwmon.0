Return-Path: <linux-hwmon-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1C1B1C61DA4
	for <linux-hwmon@archiver.kernel.org>; Mon, 30 Jan 2023 15:10:44 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236429AbjA3PKn (ORCPT <rfc822;linux-hwmon@archiver.kernel.org>);
        Mon, 30 Jan 2023 10:10:43 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48984 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S237811AbjA3PKm (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>);
        Mon, 30 Jan 2023 10:10:42 -0500
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 4FF08366A6
        for <linux-hwmon@vger.kernel.org>; Mon, 30 Jan 2023 07:09:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1675091396;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=LXaa3DxLrmj9P5CFA6+P4O7CQaN/r3DN91sytM0riZA=;
        b=MWTmyzuR61wKbN00YcD3Xf8Bb9NZqEOovmeHjKaX6q7qA/iFokFYAm9BtjrXYX/h6fOUHt
        UfRodQPI6EpvufyQ8z+urHqQL0H/77xfLj75WS6nOHmTSqSq53RJfeh05BhvmPeY9limny
        WPzZ7c4QbcE9MIaxMwhjz8myW4YbhTw=
Received: from mail-ej1-f72.google.com (mail-ej1-f72.google.com
 [209.85.218.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-389-IpQXxPsENQGpsTchKUpO2w-1; Mon, 30 Jan 2023 10:09:55 -0500
X-MC-Unique: IpQXxPsENQGpsTchKUpO2w-1
Received: by mail-ej1-f72.google.com with SMTP id gb18-20020a170907961200b008715e951f02so7664055ejc.11
        for <linux-hwmon@vger.kernel.org>; Mon, 30 Jan 2023 07:09:54 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=LXaa3DxLrmj9P5CFA6+P4O7CQaN/r3DN91sytM0riZA=;
        b=xXCZTLNppSuL2OnViVOS4JYviHQlvsRQpnrcN5cfsabwWR7xE39iqZ/65fIcyMCVnz
         pGI+0/8oyKTtXdbSBCImrcXcEKjQtMsdzHNgfc7icHpxodw6B5Oicr11gJKA2HYYMsnk
         Ox+Y1RYhZDZWaEDVKSa9SVKwv8579bYmTlSuWYpLQ1GTKr861uivP38iprOwc6fbcFyn
         WTVkTNXurYBmEOlGzE2UtlWWbk3FDtnNCLhR6c/Y0p10TDt3/P62D1gnhO20wu0i/kvP
         q+pb8LM5MpXiEyPCY+4RqTjTMJjLmSrTMalcXsLfDnV57QZ//yFBgJPXxK+YxMqTpe1w
         1o6Q==
X-Gm-Message-State: AO0yUKXdlUtQmk9fKtywgkaFjV3htlwaagUT/K68J+N/4KB8y8SbgtBw
        WRVmg0ji+pcTs30+02cArT+iiJChov+IEUokRBuURsY984Me+q7m4RsxaYfmAYeky0qNfy8D6zA
        ujTFgdN8ePJQXPZIxH1/vego=
X-Received: by 2002:a17:907:a42a:b0:881:277:b77a with SMTP id sg42-20020a170907a42a00b008810277b77amr13917620ejc.65.1675091393854;
        Mon, 30 Jan 2023 07:09:53 -0800 (PST)
X-Google-Smtp-Source: AK7set+m64JOYL+W8N2xStqLCn2LIri/OxzmCve7tq3poUgaFHI1YtYrom+bRDUx2q7haW+ByFQuQQ==
X-Received: by 2002:a17:907:a42a:b0:881:277:b77a with SMTP id sg42-20020a170907a42a00b008810277b77amr13917600ejc.65.1675091393673;
        Mon, 30 Jan 2023 07:09:53 -0800 (PST)
Received: from [10.40.98.142] ([78.108.130.194])
        by smtp.gmail.com with ESMTPSA id i16-20020a17090639d000b008711cab8875sm6874138eje.216.2023.01.30.07.09.52
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 30 Jan 2023 07:09:53 -0800 (PST)
Message-ID: <f163ef7e-41ee-cfa4-67c5-4325d1381110@redhat.com>
Date:   Mon, 30 Jan 2023 16:09:52 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.6.0
Subject: Re: [PATCH 4/5] platform/x86: dell-ddv: Add "force" module param
Content-Language: en-US
To:     Armin Wolf <W_Armin@gmx.de>, markgross@kernel.org
Cc:     jdelvare@suse.com, linux@roeck-us.net,
        platform-driver-x86@vger.kernel.org, linux-hwmon@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20230126194021.381092-1-W_Armin@gmx.de>
 <20230126194021.381092-5-W_Armin@gmx.de>
From:   Hans de Goede <hdegoede@redhat.com>
In-Reply-To: <20230126194021.381092-5-W_Armin@gmx.de>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-hwmon.vger.kernel.org>
X-Mailing-List: linux-hwmon@vger.kernel.org

Hi again,

On 1/26/23 20:40, Armin Wolf wrote:
> Until now, the dell-wmi-ddv driver needs to be manually
> patched and compiled to test compatibility with unknown
> DDV WMI interface versions.
> Add a module param to allow users to force loading even
> when a unknown interface version was detected. Since this
> might cause various unwanted side effects, the module param
> is marked as unsafe.
> Also update kernel-parameters.txt.
> 
> Signed-off-by: Armin Wolf <W_Armin@gmx.de>
> ---
>  Documentation/admin-guide/kernel-parameters.txt |  3 +++
>  drivers/platform/x86/dell/dell-wmi-ddv.c        | 13 +++++++++++--
>  2 files changed, 14 insertions(+), 2 deletions(-)
> 
> diff --git a/Documentation/admin-guide/kernel-parameters.txt b/Documentation/admin-guide/kernel-parameters.txt
> index 6cfa6e3996cf..9bbff5113427 100644
> --- a/Documentation/admin-guide/kernel-parameters.txt
> +++ b/Documentation/admin-guide/kernel-parameters.txt
> @@ -1024,6 +1024,9 @@
>  	dell_smm_hwmon.fan_max=
>  			[HW] Maximum configurable fan speed.
> 
> +	dell_wmi_ddv.force=
> +			[HW] Do not check for supported WMI interface versions.
> +
>  	dfltcc=		[HW,S390]
>  			Format: { on | off | def_only | inf_only | always }
>  			on:       s390 zlib hardware support for compression on

In my previous email I forgot to add that I have dropped this bit. I appreciate
the effort to document this parameter, but if we add documentation for all
existing parameters to Documentation/admin-guide/kernel-parameters.txt then
the file will become quite unyielding / unusable.

So in general we only add new parameters which we expect to be important for
a large group of users or necessary to debug serious problems like machines
not booting.

I realize that a bunch of parameters in there do not match this, like
e.g. dell_smm_hwmon.fan_max, these are just from older times when
there were just less parameters, so listing them all was still ok.

So I have merged this patch, but with the Documentation/admin-guide/kernel-parameters.txt
bit dropped.

Regards,

Hans






> diff --git a/drivers/platform/x86/dell/dell-wmi-ddv.c b/drivers/platform/x86/dell/dell-wmi-ddv.c
> index 58fadb74e86a..9695bf493ea6 100644
> --- a/drivers/platform/x86/dell/dell-wmi-ddv.c
> +++ b/drivers/platform/x86/dell/dell-wmi-ddv.c
> @@ -34,6 +34,10 @@
>  #define DELL_EPPID_LENGTH	20
>  #define DELL_EPPID_EXT_LENGTH	23
> 
> +static bool force;
> +module_param_unsafe(force, bool, 0);
> +MODULE_PARM_DESC(force, "Force loading without checking for supported WMI interface versions");
> +
>  enum dell_ddv_method {
>  	DELL_DDV_BATTERY_DESIGN_CAPACITY	= 0x01,
>  	DELL_DDV_BATTERY_FULL_CHARGE_CAPACITY	= 0x02,
> @@ -349,8 +353,13 @@ static int dell_wmi_ddv_probe(struct wmi_device *wdev, const void *context)
>  		return ret;
> 
>  	dev_dbg(&wdev->dev, "WMI interface version: %d\n", version);
> -	if (version < DELL_DDV_SUPPORTED_VERSION_MIN || version > DELL_DDV_SUPPORTED_VERSION_MAX)
> -		return -ENODEV;
> +	if (version < DELL_DDV_SUPPORTED_VERSION_MIN || version > DELL_DDV_SUPPORTED_VERSION_MAX) {
> +		if (!force)
> +			return -ENODEV;
> +
> +		dev_warn(&wdev->dev, "Loading despite unsupported WMI interface version (%u)\n",
> +			 version);
> +	}
> 
>  	data = devm_kzalloc(&wdev->dev, sizeof(*data), GFP_KERNEL);
>  	if (!data)
> --
> 2.30.2
> 

