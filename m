Return-Path: <linux-hwmon-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-25.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,
	NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1 autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 43E12C432BE
	for <linux-hwmon@archiver.kernel.org>; Thu, 26 Aug 2021 13:15:53 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 1A60F60FDC
	for <linux-hwmon@archiver.kernel.org>; Thu, 26 Aug 2021 13:15:53 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S241455AbhHZNQj (ORCPT <rfc822;linux-hwmon@archiver.kernel.org>);
        Thu, 26 Aug 2021 09:16:39 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:35027 "EHLO
        us-smtp-delivery-124.mimecast.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S230288AbhHZNQj (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>);
        Thu, 26 Aug 2021 09:16:39 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1629983751;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=H6GUEeUdAjetnQZMcJfD9mDtllgHBXfQ7UASdMGguDY=;
        b=IjGM1Aq+uOTamRjfSaIt+fB8jMGnfi0A5nJ7D9cAs6fl1CYsaM0tgJXAG2blHogsQDcCIE
        wWtn2AJu+p+8J5mJPPyaFcJrBhEdL98G2ZMnC7X4oFrnyk++jdcrh+3h2QkgBSaFZK3I6H
        NHtHDV869C21pvuMI5QDM/aR2rxsqh0=
Received: from mail-ed1-f71.google.com (mail-ed1-f71.google.com
 [209.85.208.71]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-184-t5o_cBh1N2uBaEgPsP_Iaw-1; Thu, 26 Aug 2021 09:15:50 -0400
X-MC-Unique: t5o_cBh1N2uBaEgPsP_Iaw-1
Received: by mail-ed1-f71.google.com with SMTP id s25-20020a50d499000000b003c1a8573042so1496468edi.11
        for <linux-hwmon@vger.kernel.org>; Thu, 26 Aug 2021 06:15:50 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=H6GUEeUdAjetnQZMcJfD9mDtllgHBXfQ7UASdMGguDY=;
        b=Nm0gjxUaMj9WNjAVKUY/6yeN+30aXqLOdlf3ZoayWD3iPibzC14RiHw4gZVu2fKhjl
         o/j2UQZ4OW7CHUjiG5KK+H9CtL/WWkXfx5cJRMri9sQPMcnv8sd1RPGqo/NMKYt3nOD1
         S76C6yOnLuhBfiCvEOiwBmZBmtVgKWKrU/dMAXJMENbx6I32wdzXHQCWe9o6qNZcOpNr
         p3E6/zm4acu4PLL3gx9p65ymRLk2+rj9IOQHZdKRb958UcQWKrdZDiyqDspUHfRacm4E
         XCyyudtHHftdqmWArF8lhlCFLuYTn7IzWylmNHQZgDRmp3KvQIcA9KIQQLXWYlfJYVk8
         40kA==
X-Gm-Message-State: AOAM531tliua2FXvMJZ/2AFdtWGOU6M4++Sc6wr4tNSFqywFhhvsgDhU
        3haMj3VtnNPH7eJHunZJ8OxS75fb1G8WIePmxjVwxkqNhI56mYjzWuBQOW+IQXan0CoBl8m01/5
        FSrljeeVrBvSd+YWJ4eGGJoOCHVUrSX85YSb076O9uP3FPdroOY6r+3PNpiH23/OdHUuzQH36ZV
        s=
X-Received: by 2002:a17:906:d0cd:: with SMTP id bq13mr4393368ejb.66.1629983748465;
        Thu, 26 Aug 2021 06:15:48 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJyZ2pbNvfXVCGu2lL9ijKULTxQSm1H7yCuoO2NTkleEkxU8aUTxzhAVGfQjIXuYUOm6pCbyWw==
X-Received: by 2002:a17:906:d0cd:: with SMTP id bq13mr4393351ejb.66.1629983748262;
        Thu, 26 Aug 2021 06:15:48 -0700 (PDT)
Received: from x1.localdomain (2001-1c00-0c1e-bf00-1054-9d19-e0f0-8214.cable.dynamic.v6.ziggo.nl. [2001:1c00:c1e:bf00:1054:9d19:e0f0:8214])
        by smtp.gmail.com with ESMTPSA id q6sm1809980edd.26.2021.08.26.06.15.47
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 26 Aug 2021 06:15:47 -0700 (PDT)
Subject: Re: [PATCH] asus-wmi: Fix "unsigned 'retval' is never less than zero"
 smatch warning
To:     Jiapeng Chong <jiapeng.chong@linux.alibaba.com>,
        corentin.chary@gmail.com
Cc:     mgross@linux.intel.com, jdelvare@suse.com, linux@roeck-us.net,
        acpi4asus-user@lists.sourceforge.net, linux-kernel@vger.kernel.org,
        linux-hwmon@vger.kernel.org
References: <1629887822-23918-1-git-send-email-jiapeng.chong@linux.alibaba.com>
From:   Hans de Goede <hdegoede@redhat.com>
Message-ID: <24b6136e-5f76-5d35-0e55-f30699da2417@redhat.com>
Date:   Thu, 26 Aug 2021 15:15:47 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <1629887822-23918-1-git-send-email-jiapeng.chong@linux.alibaba.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-hwmon.vger.kernel.org>
X-Mailing-List: linux-hwmon@vger.kernel.org

Hi,

On 8/25/21 12:37 PM, Jiapeng Chong wrote:
> Eliminate the follow smatch warnings:
> 
> drivers/platform/x86/asus-wmi.c:478 panel_od_write() warn: unsigned
> 'retval' is never less than zero.
> 
> drivers/platform/x86/asus-wmi.c:566 panel_od_write() warn: unsigned
> 'retval' is never less than zero.
> 
> drivers/platform/x86/asus-wmi.c:1451 panel_od_write() warn: unsigned
> 'retval' is never less than zero.
> 
> Reported-by: Abaci Robot <abaci@linux.alibaba.com>
> Fixes: 98829e84dc67 ("asus-wmi: Add dgpu disable method")
> Fixes: 382b91db8044 ("asus-wmi: Add egpu enable method")
> Fixes: ca91ea34778f ("asus-wmi: Add panel overdrive functionality")
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
>  drivers/platform/x86/asus-wmi.c | 6 +++---
>  1 file changed, 3 insertions(+), 3 deletions(-)
> 
> diff --git a/drivers/platform/x86/asus-wmi.c b/drivers/platform/x86/asus-wmi.c
> index cc58118..22af431 100644
> --- a/drivers/platform/x86/asus-wmi.c
> +++ b/drivers/platform/x86/asus-wmi.c
> @@ -475,7 +475,7 @@ static int dgpu_disable_write(struct asus_wmi *asus)
>  		return err;
>  	}
>  
> -	if (retval > 1 || retval < 0) {
> +	if (retval > 1) {
>  		pr_warn("Failed to set dgpu disable (retval): 0x%x\n", retval);
>  		return -EIO;
>  	}
> @@ -563,7 +563,7 @@ static int egpu_enable_write(struct asus_wmi *asus)
>  		return err;
>  	}
>  
> -	if (retval > 1 || retval < 0) {
> +	if (retval > 1) {
>  		pr_warn("Failed to set egpu disable (retval): 0x%x\n", retval);
>  		return -EIO;
>  	}
> @@ -1448,7 +1448,7 @@ static int panel_od_write(struct asus_wmi *asus)
>  		return err;
>  	}
>  
> -	if (retval > 1 || retval < 0) {
> +	if (retval > 1) {
>  		pr_warn("Failed to set panel overdrive (retval): 0x%x\n", retval);
>  		return -EIO;
>  	}
> 

