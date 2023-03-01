Return-Path: <linux-hwmon-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 60B3CC7EE2D
	for <linux-hwmon@archiver.kernel.org>; Wed,  1 Mar 2023 12:20:55 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229734AbjCAMUy (ORCPT <rfc822;linux-hwmon@archiver.kernel.org>);
        Wed, 1 Mar 2023 07:20:54 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53294 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229809AbjCAMUq (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>); Wed, 1 Mar 2023 07:20:46 -0500
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 42E82136DF
        for <linux-hwmon@vger.kernel.org>; Wed,  1 Mar 2023 04:19:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1677673199;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=BmnN/JeNC+uXvUWsMwj8af3J1VCxOStShW/lz3XRU5Y=;
        b=h0RG+9Ja0OonvGY2Ug28ppBG40V05kjj3NuXnM0XX4jKEvrLK0AI3+0+mNnJdv/9khvU+b
        nJIH/v4+WuZqkydi9PtXJaMgwn6yRYmvAbX/OX9SSKFBLheV6BloDpHjm8tOlf+YBwLUTb
        hn76M3wrWhx1MLiTGUYxvtJSO2zQKA4=
Received: from mail-ed1-f69.google.com (mail-ed1-f69.google.com
 [209.85.208.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-641-gncCEWWNOYOtpLZ_Cz4r1g-1; Wed, 01 Mar 2023 07:19:57 -0500
X-MC-Unique: gncCEWWNOYOtpLZ_Cz4r1g-1
Received: by mail-ed1-f69.google.com with SMTP id t9-20020a056402524900b004af59c073abso18854111edd.6
        for <linux-hwmon@vger.kernel.org>; Wed, 01 Mar 2023 04:19:57 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=BmnN/JeNC+uXvUWsMwj8af3J1VCxOStShW/lz3XRU5Y=;
        b=ykfni4NrmA6OJtGeuOQUWMnfTFKBgKC8bvn+upuf2KCWU677xyQPTt8AAAZXDxwAKS
         Nwzlyfy/ui39/d7eOP+KuesI8E4ao7MHq0nvv46kVnTYpQ2SFMOZ3zyXmt1d33vQh2kM
         EuMxS0XLLEimG/U5V6zCxlGsfTtRqYF5DvAaidpRw50oAybuNXMUsRZGWV+sPqKn5bi3
         T/bSXPL2yjV40dX+AzYNuc1aHNn1XFMRdc4lkIqbFYn0F7Ml1MDGVYO4q2rPmwWgn6Z8
         qW9ZVKbxXGw2dzlgBHbZxlZR0bIxWgxoeptLmAFq165Mcd7p3pOB+8/0AGrT6GYcfl+r
         XshQ==
X-Gm-Message-State: AO0yUKXXtBukR7oJwiwYP7m3oJNtJRps6R6F5klQoUBjVABvvtM8HN/U
        VfJm28izob9en+5ozZlfMc76qHyIBOC6K2qSzlmfqrTokD20VzHYoP4cWRYSZFYKSPXrMD+Iqw0
        2W1gcS7CK96b50IAWwqsEjwc=
X-Received: by 2002:a17:906:ca12:b0:87d:eff1:acc8 with SMTP id jt18-20020a170906ca1200b0087deff1acc8mr6291655ejb.48.1677673196893;
        Wed, 01 Mar 2023 04:19:56 -0800 (PST)
X-Google-Smtp-Source: AK7set/kUyEn9SIqaSY0Dz+h4EG4rmJU65d2AlOikKFI6qVgT5C8p4j24U16+iVEyWf9j1c2O5n3Yw==
X-Received: by 2002:a17:906:ca12:b0:87d:eff1:acc8 with SMTP id jt18-20020a170906ca1200b0087deff1acc8mr6291639ejb.48.1677673196647;
        Wed, 01 Mar 2023 04:19:56 -0800 (PST)
Received: from ?IPV6:2001:1c00:c32:7800:5bfa:a036:83f0:f9ec? (2001-1c00-0c32-7800-5bfa-a036-83f0-f9ec.cable.dynamic.v6.ziggo.nl. [2001:1c00:c32:7800:5bfa:a036:83f0:f9ec])
        by smtp.gmail.com with ESMTPSA id h11-20020a17090634cb00b008e36f9b2308sm5706107ejb.43.2023.03.01.04.19.55
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 01 Mar 2023 04:19:56 -0800 (PST)
Message-ID: <cc25ee91-5197-b694-a6d6-e7d773afb5db@redhat.com>
Date:   Wed, 1 Mar 2023 13:19:55 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.7.1
Subject: Re: [PATCH v2 2/2] platform/x86: dell-ddv: Fix temperature scaling
Content-Language: en-US, nl
To:     Armin Wolf <W_Armin@gmx.de>, markgross@kernel.org
Cc:     jdelvare@suse.com, linux@roeck-us.net,
        platform-driver-x86@vger.kernel.org, linux-hwmon@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20230218115318.20662-1-W_Armin@gmx.de>
 <20230218115318.20662-2-W_Armin@gmx.de>
From:   Hans de Goede <hdegoede@redhat.com>
In-Reply-To: <20230218115318.20662-2-W_Armin@gmx.de>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-hwmon.vger.kernel.org>
X-Mailing-List: linux-hwmon@vger.kernel.org

Hi,

On 2/18/23 12:53, Armin Wolf wrote:
> After using the built-in UEFI hardware diagnostics to compare
> the measured battery temperature, i noticed that the temperature
> is actually expressed in tenth degree kelvin, similar to the
> SBS-Data standard. For example, a value of 2992 is displayed as
> 26 degrees celsius.
> Fix the scaling so that the correct values are being displayed.
> 
> Tested on a Dell Inspiron 3505.
> 
> Fixes: a77272c16041 ("platform/x86: dell: Add new dell-wmi-ddv driver")
> Signed-off-by: Armin Wolf <W_Armin@gmx.de>

Thanks, I've applied this patch to my review-hans branch:
https://git.kernel.org/pub/scm/linux/kernel/git/pdx86/platform-drivers-x86.git/log/?h=review-hans

I'll rebase that branch once 6.3-rc1 is out and then push the rebased
patch to the fixes branch and include it in my next 6.3 fixes pull-req
to Linus.

Regards,

Hans



> ---
> Changes in v2:
> - Avoid unnecessary rounding
> ---
>  drivers/platform/x86/dell/dell-wmi-ddv.c | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/platform/x86/dell/dell-wmi-ddv.c b/drivers/platform/x86/dell/dell-wmi-ddv.c
> index eff4e9649faf..2750dee99c3e 100644
> --- a/drivers/platform/x86/dell/dell-wmi-ddv.c
> +++ b/drivers/platform/x86/dell/dell-wmi-ddv.c
> @@ -17,7 +17,6 @@
>  #include <linux/kernel.h>
>  #include <linux/hwmon.h>
>  #include <linux/kstrtox.h>
> -#include <linux/math.h>
>  #include <linux/math64.h>
>  #include <linux/module.h>
>  #include <linux/mutex.h>
> @@ -665,7 +664,8 @@ static ssize_t temp_show(struct device *dev, struct device_attribute *attr, char
>  	if (ret < 0)
>  		return ret;
> 
> -	return sysfs_emit(buf, "%d\n", DIV_ROUND_CLOSEST(value, 10));
> +	/* Use 2731 instead of 2731.5 to avoid unnecessary rounding */
> +	return sysfs_emit(buf, "%d\n", value - 2731);
>  }
> 
>  static ssize_t eppid_show(struct device *dev, struct device_attribute *attr, char *buf)
> --
> 2.30.2
> 

