Return-Path: <linux-hwmon-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D7E3CC76196
	for <linux-hwmon@archiver.kernel.org>; Tue, 11 Apr 2023 08:32:35 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229621AbjDKIcf (ORCPT <rfc822;linux-hwmon@archiver.kernel.org>);
        Tue, 11 Apr 2023 04:32:35 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50374 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229586AbjDKIce (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>);
        Tue, 11 Apr 2023 04:32:34 -0400
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 5033830EC
        for <linux-hwmon@vger.kernel.org>; Tue, 11 Apr 2023 01:31:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1681201901;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=ItkPu5HmRlc4/iz29tmuZg74rTfbukbWjoDL5l0uPyo=;
        b=DXo/3GFl7iEUpwTdYlnqFNB5yAw1rh5czm4yU0cpMJ2UIVVyy7yagyasB8FtnqhkwuyLOF
        HaAHl0QjQG9Kyt19SvhghNvQqR2z3HdPajO279e9v4wnhEdj38+VTJk3YtP72FAJTI4Dod
        +AsUdAASo6uQqRItdJ3gaRKTqNz2kAY=
Received: from mail-ej1-f70.google.com (mail-ej1-f70.google.com
 [209.85.218.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-568-gnk62HHLOUeG6iq3xxAnvg-1; Tue, 11 Apr 2023 04:31:40 -0400
X-MC-Unique: gnk62HHLOUeG6iq3xxAnvg-1
Received: by mail-ej1-f70.google.com with SMTP id a640c23a62f3a-94a355cf318so109720866b.2
        for <linux-hwmon@vger.kernel.org>; Tue, 11 Apr 2023 01:31:40 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1681201899; x=1683793899;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=ItkPu5HmRlc4/iz29tmuZg74rTfbukbWjoDL5l0uPyo=;
        b=sSqLi8qJcMbMeu2WncqGsRkJ6Ynyq2lL6lbAEwelv+y3YspMjSupc8mK8JYjgtysnQ
         G1WyTl7cEg3Xyaf4Dj+rZK//vR8/yJxXTQAIRY82H0LLXoxi2SkpF5NP80Z5kwrmASma
         DRHz2UqQYaMPq4votcHY3T3jUcAjAn7HtCqegGVGjo1y0ieMwVR46Lg4qs0qbCQJ6bFu
         jZyJ7hSBbym7ebAfXiPtHNkIIycqG8kMmtxR+1ouJ4AzH+s9BUhyvvQbOUXTHa2HuUq9
         rLbWTgDLAFHVzErjN8CUwHO/ljFhtdjGjYSEU0p2+MCL0t8kX1tEemz6Pdknohhp85/5
         P3RA==
X-Gm-Message-State: AAQBX9eW+evFxbv3f7EjAoEXUz/cZGSoh4gYKudoIomgS2Bq3tCmnpqf
        j3MEMohwRFzkPrDAYeM9kNLKwJMFI5LRfi0L8IAbqQ+ihEZ2j1nAm0hLlGIzr/9HNAbeKiPIzff
        AgpoQIpY1IEHxdQMkP+XyxY8=
X-Received: by 2002:aa7:da0f:0:b0:502:20f0:3ee1 with SMTP id r15-20020aa7da0f000000b0050220f03ee1mr9345955eds.31.1681201899283;
        Tue, 11 Apr 2023 01:31:39 -0700 (PDT)
X-Google-Smtp-Source: AKy350YBcpOjnV1i0OhFJebiJlY+OH5eD74YU+5nOjlWnsizOEuKAkrdkzbfC6p7fOWf7QKbAHEk2Q==
X-Received: by 2002:aa7:da0f:0:b0:502:20f0:3ee1 with SMTP id r15-20020aa7da0f000000b0050220f03ee1mr9345940eds.31.1681201899042;
        Tue, 11 Apr 2023 01:31:39 -0700 (PDT)
Received: from ?IPV6:2001:1c00:c32:7800:5bfa:a036:83f0:f9ec? (2001-1c00-0c32-7800-5bfa-a036-83f0-f9ec.cable.dynamic.v6.ziggo.nl. [2001:1c00:c32:7800:5bfa:a036:83f0:f9ec])
        by smtp.gmail.com with ESMTPSA id x63-20020a50bac5000000b005024aff3bb5sm4422641ede.80.2023.04.11.01.31.38
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 11 Apr 2023 01:31:38 -0700 (PDT)
Message-ID: <4f609a98-6376-5993-45aa-bb5c6a213a49@redhat.com>
Date:   Tue, 11 Apr 2023 10:31:37 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.7.1
Subject: Re: [PATCH 1/4] platform/x86: gigabyte: constify pointers to
 hwmon_channel_info
Content-Language: en-US, nl
To:     Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
        =?UTF-8?Q?Thomas_Wei=c3=9fschuh?= <thomas@weissschuh.net>,
        Mark Gross <markgross@kernel.org>,
        Jeremy Soller <jeremy@system76.com>,
        System76 Product Development <productdev@system76.com>,
        Azael Avalos <coproscefalo@gmail.com>,
        platform-driver-x86@vger.kernel.org, linux-kernel@vger.kernel.org
Cc:     Jean Delvare <jdelvare@suse.com>,
        Guenter Roeck <linux@roeck-us.net>, linux-hwmon@vger.kernel.org
References: <20230407150339.80218-1-krzysztof.kozlowski@linaro.org>
From:   Hans de Goede <hdegoede@redhat.com>
In-Reply-To: <20230407150339.80218-1-krzysztof.kozlowski@linaro.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-hwmon.vger.kernel.org>
X-Mailing-List: linux-hwmon@vger.kernel.org

Hi,

On 4/7/23 17:03, Krzysztof Kozlowski wrote:
> Statically allocated array of pointed to hwmon_channel_info can be made
> const for safety.
> 
> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
> 
> ---
> 
> This depends on hwmon core patch:
> https://lore.kernel.org/all/20230406203103.3011503-2-krzysztof.kozlowski@linaro.org/
> 
> Therefore I propose this should also go via hwmon tree.

Ok, taking all 4 these patches upstream through the hwmon tree
is fine by me, here is my Ack for that:

Acked-by: Hans de Goede <hdegoede@redhat.com>

Regards,

Hans


p.s.

I'm going to drop these from my patch queue now. If for some
reason merging these through the hwmon tree does not work out,
please resend them after 6.4-rc1 is out (assuming that will
have the pre-requisite patch) and then I'll apply them directly.





> 
> Cc: Jean Delvare <jdelvare@suse.com>
> Cc: Guenter Roeck <linux@roeck-us.net>
> Cc: linux-hwmon@vger.kernel.org
> ---
>  drivers/platform/x86/gigabyte-wmi.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/platform/x86/gigabyte-wmi.c b/drivers/platform/x86/gigabyte-wmi.c
> index 5e5b17c50eb6..7cc969fb1beb 100644
> --- a/drivers/platform/x86/gigabyte-wmi.c
> +++ b/drivers/platform/x86/gigabyte-wmi.c
> @@ -99,7 +99,7 @@ static umode_t gigabyte_wmi_hwmon_is_visible(const void *data, enum hwmon_sensor
>  	return usable_sensors_mask & BIT(channel) ? 0444  : 0;
>  }
>  
> -static const struct hwmon_channel_info *gigabyte_wmi_hwmon_info[] = {
> +static const struct hwmon_channel_info * const gigabyte_wmi_hwmon_info[] = {
>  	HWMON_CHANNEL_INFO(temp,
>  			   HWMON_T_INPUT,
>  			   HWMON_T_INPUT,

