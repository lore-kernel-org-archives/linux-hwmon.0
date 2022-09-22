Return-Path: <linux-hwmon-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1EAC9C6FA86
	for <linux-hwmon@archiver.kernel.org>; Thu, 22 Sep 2022 13:55:10 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230209AbiIVNzJ (ORCPT <rfc822;linux-hwmon@archiver.kernel.org>);
        Thu, 22 Sep 2022 09:55:09 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46482 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230365AbiIVNzH (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>);
        Thu, 22 Sep 2022 09:55:07 -0400
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 4786B22B3E
        for <linux-hwmon@vger.kernel.org>; Thu, 22 Sep 2022 06:55:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1663854904;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=qb4G5t3vdXdj730CAOgqRhNKb6kCvS9qEMgpXYuxWek=;
        b=fmQrCA/EdYYL2WPm5bIQ02ZjP1OXdtej5pQlrqr9NX33L9/2AHfvBiUmScL7kp+1JwoK/J
        6G6+NILMPTGdsFUgGOqLONT5zFa7dez/+KOoQnkLnowhnGHw/nrv5kU+e3w4QR/2zgBlXB
        pCXL0uAylF1FMr9Lfa6Bu9o3AfO7By0=
Received: from mail-ed1-f71.google.com (mail-ed1-f71.google.com
 [209.85.208.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-119-_mxWRlk1Nwu6vBNWmNSBJw-1; Thu, 22 Sep 2022 09:55:03 -0400
X-MC-Unique: _mxWRlk1Nwu6vBNWmNSBJw-1
Received: by mail-ed1-f71.google.com with SMTP id s17-20020a056402521100b004511c8d59e3so6783506edd.11
        for <linux-hwmon@vger.kernel.org>; Thu, 22 Sep 2022 06:55:03 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date;
        bh=qb4G5t3vdXdj730CAOgqRhNKb6kCvS9qEMgpXYuxWek=;
        b=CZd1IRUm9EJ7Fhd2eHbo9BJocEApWnlm8sjP7tSThALcNDtvbzKQdqZmrz9M3ltdHy
         VuBsji0TZnsjqT+a8nQn9AbrkvtZCkz8vprzDMgl67V4lpCm0X5ImE9w5DiMeLg5jHgq
         K/I3mt7jwISon1AzeD54cdzZKzeSQPjAC5WNQhWWVzGfD9mtjkZEGm1dElKJkbjApFZ9
         BkcMZjEJM6xyUHL7W4LAulKzXCVutEAuOOcQVPfFfdxh50QFmIFdcXT904qak5go/CBu
         3nx0856jfwOjIJnG6+3xbjzmXUfnoimbF9OYQBxkBKOwOIdlq6TTaaqPZTdfR9zUTRCa
         aiEQ==
X-Gm-Message-State: ACrzQf29qpDfWrdISlO/Fj/V6BZfJz82TZeA0wl0fhzBlI0La2OyGroL
        d4I9/s/gE/mxLn93fMCAoCQ5z3jeg/DnSPUlkWVeV9HnWRW1ujeFJBn4bUxQhV3EiUG/CEbvnRg
        d+jGrbTq82Tu9IF05kxNFvDo=
X-Received: by 2002:a05:6402:493:b0:445:b5f0:7a0f with SMTP id k19-20020a056402049300b00445b5f07a0fmr3431725edv.120.1663854902248;
        Thu, 22 Sep 2022 06:55:02 -0700 (PDT)
X-Google-Smtp-Source: AMsMyM4ubpvvxwC0cJcnF+tZp4v4LeK98yi+QJ3JB7JGxwjdWyiYmICvssBkr+KzTcBSKbBn/LyBIA==
X-Received: by 2002:a05:6402:493:b0:445:b5f0:7a0f with SMTP id k19-20020a056402049300b00445b5f07a0fmr3431709edv.120.1663854902061;
        Thu, 22 Sep 2022 06:55:02 -0700 (PDT)
Received: from ?IPV6:2001:1c00:c1e:bf00:d69d:5353:dba5:ee81? (2001-1c00-0c1e-bf00-d69d-5353-dba5-ee81.cable.dynamic.v6.ziggo.nl. [2001:1c00:c1e:bf00:d69d:5353:dba5:ee81])
        by smtp.gmail.com with ESMTPSA id b12-20020a170906d10c00b0073dddffbe70sm2575544ejz.224.2022.09.22.06.55.01
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 22 Sep 2022 06:55:01 -0700 (PDT)
Message-ID: <6e26560c-b494-194a-6176-7627b5b02f52@redhat.com>
Date:   Thu, 22 Sep 2022 15:55:01 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.2.1
Subject: Re: [PATCH -next] platform/x86: toshiba_acpi: change
 turn_on_panel_on_resume to static
Content-Language: en-US
To:     Yang Yingliang <yangyingliang@huawei.com>,
        linux-hwmon@vger.kernel.org
Cc:     coproscefalo@gmail.com
References: <20220920084434.3739493-1-yangyingliang@huawei.com>
From:   Hans de Goede <hdegoede@redhat.com>
In-Reply-To: <20220920084434.3739493-1-yangyingliang@huawei.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-hwmon.vger.kernel.org>
X-Mailing-List: linux-hwmon@vger.kernel.org

Hi,

On 9/20/22 10:44, Yang Yingliang wrote:
> turn_on_panel_on_resume is only used in toshiba_acpi.c now, change it
> to static.
> 
> Fixes: 3cb1f40dfdc3 ("drivers/platform: toshiba_acpi: Call HCI_PANEL_POWER_ON on resume on some models")
> Signed-off-by: Yang Yingliang <yangyingliang@huawei.com>

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
>  drivers/platform/x86/toshiba_acpi.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/platform/x86/toshiba_acpi.c b/drivers/platform/x86/toshiba_acpi.c
> index 43cc25351aea..01f92726fef7 100644
> --- a/drivers/platform/x86/toshiba_acpi.c
> +++ b/drivers/platform/x86/toshiba_acpi.c
> @@ -53,7 +53,7 @@ MODULE_AUTHOR("John Belmonte");
>  MODULE_DESCRIPTION("Toshiba Laptop ACPI Extras Driver");
>  MODULE_LICENSE("GPL");
>  
> -int turn_on_panel_on_resume = -1;
> +static int turn_on_panel_on_resume = -1;
>  module_param(turn_on_panel_on_resume, int, 0644);
>  MODULE_PARM_DESC(turn_on_panel_on_resume,
>  	"Call HCI_PANEL_POWER_ON on resume (-1 = auto, 0 = no, 1 = yes");

