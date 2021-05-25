Return-Path: <linux-hwmon-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-22.6 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,
	NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1 autolearn=unavailable
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 96431C4707F
	for <linux-hwmon@archiver.kernel.org>; Tue, 25 May 2021 12:46:16 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 70AE66142C
	for <linux-hwmon@archiver.kernel.org>; Tue, 25 May 2021 12:46:16 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232353AbhEYMro (ORCPT <rfc822;linux-hwmon@archiver.kernel.org>);
        Tue, 25 May 2021 08:47:44 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:49204 "EHLO
        us-smtp-delivery-124.mimecast.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S232605AbhEYMrh (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>);
        Tue, 25 May 2021 08:47:37 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1621946767;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=BAsSn0QqqS827pEDp2tUmlZZNLwNBxRbKX1OInU2lIM=;
        b=Y1C3Js3MVc6gBf82pWGNt0iQsh10gpABJ3zE9SrEtBtFu317TRF+3syR4GiQb5IfmB+4Rn
        kRCLpqdNdXRaK3mBaKW3KsO75eSDfvlZ6MNxucSThE6DSExeR5Iw0lPBSLSKboCOzIIzil
        BA3jOcpomNmmE5wHR0iazmKw0E7IhzE=
Received: from mail-ej1-f71.google.com (mail-ej1-f71.google.com
 [209.85.218.71]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-382-hxu7YdX8MhGJWX_WbAtUYg-1; Tue, 25 May 2021 08:46:06 -0400
X-MC-Unique: hxu7YdX8MhGJWX_WbAtUYg-1
Received: by mail-ej1-f71.google.com with SMTP id dt6-20020a170906b786b02903dc2a6918d6so3794983ejb.1
        for <linux-hwmon@vger.kernel.org>; Tue, 25 May 2021 05:46:06 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=BAsSn0QqqS827pEDp2tUmlZZNLwNBxRbKX1OInU2lIM=;
        b=amIVj7BOjZeTH3iWwCgS8WKNZfnmXXLOwUjE9RfRagmq0UnOcchd5vVOIo9APTeNRD
         ZnuSLxAcGcE4U2VtvHNA7M+OFa1zT5M1SxCRFZEGGG9+aLU/GM1/MJHGKAJYXEPsdtDb
         QD/NYNk/oM3LyHVMgkXF9GFybvUBkp/6vSo+GWoh0o6HO/cs9bPVA6IqJWQDg7axFzep
         E6ofeLR2EsD37qkKMm2AElsrDztrXGNxhyM4kiA7MxzK8XO1HzDcpOr3o5luZHwm+u7M
         zAVYGi735rLcK475p1pdi1hmeDljjmMtrSOeBqRiC5sJm0P5f8x8VZ6ezX0GecXvYo1g
         +Hgg==
X-Gm-Message-State: AOAM532VwRBf8BEcuCQDbibJN16cMYGkgTQh8kC4SVnPLeaE9YBAQHpQ
        hC0Xarxgcvl6DDqVr633yviPO2udsX3LwcW0kd9q2NocVpcU9EsBMDDxc6JT7EPq9JKzyQ7fHnw
        2kkhWfZbJaciOAMadYycrawNjXZyrtPtNNty0E3lk2G/sjhmGEve/KbE9V8QThNdxox51A6qWPg
        0=
X-Received: by 2002:a17:906:914d:: with SMTP id y13mr28396483ejw.489.1621946764963;
        Tue, 25 May 2021 05:46:04 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJzC24QkEUJbBUYm9nsAY/iT6F2AsbeP/cQgBHwWHXbl0ufK8TwUkYxJZeJhUNBBg0OZ4UCYgw==
X-Received: by 2002:a17:906:914d:: with SMTP id y13mr28396455ejw.489.1621946764680;
        Tue, 25 May 2021 05:46:04 -0700 (PDT)
Received: from x1.localdomain (2001-1c00-0c1e-bf00-1054-9d19-e0f0-8214.cable.dynamic.v6.ziggo.nl. [2001:1c00:c1e:bf00:1054:9d19:e0f0:8214])
        by smtp.gmail.com with ESMTPSA id q18sm10517988edd.3.2021.05.25.05.46.04
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 25 May 2021 05:46:04 -0700 (PDT)
Subject: Re: [PATCH v2] platform/x86: thinkpad_acpi: Fix inconsistent
 indenting
To:     Jiapeng Chong <jiapeng.chong@linux.alibaba.com>, hmh@hmh.eng.br
Cc:     mgross@linux.intel.com, jdelvare@suse.com, linux@roeck-us.net,
        ibm-acpi-devel@lists.sourceforge.net,
        platform-driver-x86@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-hwmon@vger.kernel.org
References: <1621837438-70790-1-git-send-email-jiapeng.chong@linux.alibaba.com>
From:   Hans de Goede <hdegoede@redhat.com>
Message-ID: <86bee518-cf29-f1b1-c1fc-b939f418be84@redhat.com>
Date:   Tue, 25 May 2021 14:46:03 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.10.1
MIME-Version: 1.0
In-Reply-To: <1621837438-70790-1-git-send-email-jiapeng.chong@linux.alibaba.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-hwmon.vger.kernel.org>
X-Mailing-List: linux-hwmon@vger.kernel.org

Hi,

On 5/24/21 8:23 AM, Jiapeng Chong wrote:
> Eliminate the follow smatch warning:
> 
> drivers/platform/x86/thinkpad_acpi.c:7942 volume_write() warn:
> inconsistent indenting.
> 
> Reported-by: Abaci Robot <abaci@linux.alibaba.com>
> Signed-off-by: Jiapeng Chong <jiapeng.chong@linux.alibaba.com>

Thank you for your patch, I've applied this patch to my review-hans 
branch:
https://git.kernel.org/pub/scm/linux/kernel/git/pdx86/platform-drivers-x86.git/log/?h=review-hans

Note it will show up in my review-hans branch once I've pushed my
local branch there, which might take a while.

Once I've run some tests on this branch the patches there will be
added to the platform-drivers-x86/for-next branch and eventually
will be included in the pdx86 pull-request to Linus for the next
merge-window.

Regards,

Hans


> ---
> Changes in v2:
>   -For the follow advice: https://lore.kernel.org/patchwork/patch/1434215/
> 
>  drivers/platform/x86/thinkpad_acpi.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/platform/x86/thinkpad_acpi.c b/drivers/platform/x86/thinkpad_acpi.c
> index dd60c93..b7fec1b 100644
> --- a/drivers/platform/x86/thinkpad_acpi.c
> +++ b/drivers/platform/x86/thinkpad_acpi.c
> @@ -7938,7 +7938,7 @@ static int volume_write(char *buf)
>  				continue;
>  			} else if (sscanf(cmd, "level %u", &l) == 1 &&
>  				   l >= 0 && l <= TP_EC_VOLUME_MAX) {
> -					new_level = l;
> +				new_level = l;
>  				continue;
>  			}
>  		}
> 

