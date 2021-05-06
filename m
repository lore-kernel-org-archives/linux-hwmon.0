Return-Path: <linux-hwmon-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-17.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,NICE_REPLY_A,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_1 autolearn=unavailable
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0513EC43462
	for <linux-hwmon@archiver.kernel.org>; Thu,  6 May 2021 08:47:33 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id C1BCE610FB
	for <linux-hwmon@archiver.kernel.org>; Thu,  6 May 2021 08:47:32 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233820AbhEFIs3 (ORCPT <rfc822;linux-hwmon@archiver.kernel.org>);
        Thu, 6 May 2021 04:48:29 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:43807 "EHLO
        us-smtp-delivery-124.mimecast.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S231880AbhEFIsZ (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>);
        Thu, 6 May 2021 04:48:25 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1620290847;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=KRIn6MQisNyLZZ3un1MN0Pyrf/x2u4ROIjZCBtc/1Es=;
        b=SShSw7VwDvWBnQ1xUzGVrqEblEp5hLWoKthGsFtwjMiXsxTAx+Q/tsjmMRvpHDBwjFyaQN
        irv4OSBtyZWZv43sUPvRoPGkQ5bWyQlMe6LOzgFj8U/S2plT3KPQOjK7iaapPP5xie3fMY
        lUE9rYd9lnwV1T8whXAUTJ0GQBFRT30=
Received: from mail-ej1-f71.google.com (mail-ej1-f71.google.com
 [209.85.218.71]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-201-X5G4zCB1O6GEQdydbL3Nfg-1; Thu, 06 May 2021 04:47:24 -0400
X-MC-Unique: X5G4zCB1O6GEQdydbL3Nfg-1
Received: by mail-ej1-f71.google.com with SMTP id x21-20020a1709064bd5b029037c44cb861cso1429383ejv.4
        for <linux-hwmon@vger.kernel.org>; Thu, 06 May 2021 01:47:24 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=KRIn6MQisNyLZZ3un1MN0Pyrf/x2u4ROIjZCBtc/1Es=;
        b=HuGYdMf+PORle1lqL/Mpabpl93rER85t7jvyiLEWKMNPF85n+psNwvVvWR6KMVibWq
         WClCRsmwAA4shG91Y1cZGIssPuu7rJit55Ewsk8z7PtZl7gi9qnhsD4K0IHRim8W/rrB
         oV1AC0efc4x+AtmVpzGUMHZAb7hIQautKIKH2fM+9xPwikyQZVsyHDQX8KMUDVFa5/na
         ZQH7CD0Vzh/BPLPal+t7OlLyfrBiLJcwAUkvFvMFfnWGMJBSJCcGp8UQgIsTTVhLHvw7
         UfHqeop5+FAZoomDmAqTm/nUNbvy2ApqCh5UrdoBKVLlkYuXLEBwdGqj8rzMPJ4dEN0c
         uNMQ==
X-Gm-Message-State: AOAM533VzU15AEqT1E/fsskJDh1AoMaolnGVfZcUi5IAvAy6wB1exStj
        THNJGoz9rto2wMInPSElZ3adKsPPCZ6OVlpqGkf+4nwCUzbezE52Emk1i5utBzynlVVmeMgBuka
        t/bn/J2ovzWhZRtQl+NFU4GY=
X-Received: by 2002:a17:906:b1cc:: with SMTP id bv12mr3139437ejb.407.1620290843609;
        Thu, 06 May 2021 01:47:23 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJy5WRJKGPMKVmDFF5BwJVdGJUqxr4ZQ+H+x9+d7+GGOMWKY0RO66B9rNI18XTyDb9a6RlsqdQ==
X-Received: by 2002:a17:906:b1cc:: with SMTP id bv12mr3139419ejb.407.1620290843387;
        Thu, 06 May 2021 01:47:23 -0700 (PDT)
Received: from x1.localdomain (2001-1c00-0c1e-bf00-1054-9d19-e0f0-8214.cable.dynamic.v6.ziggo.nl. [2001:1c00:c1e:bf00:1054:9d19:e0f0:8214])
        by smtp.gmail.com with ESMTPSA id v16sm1092562edt.53.2021.05.06.01.47.22
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 06 May 2021 01:47:23 -0700 (PDT)
Subject: Re: [PATCH v7 1/7] MAINTAINERS: Add Advantech AHC1EC0 embedded
 controller entry
To:     Campion Kang <campion.kang@advantech.com.tw>,
        Lee Jones <lee.jones@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        Mark Gross <mgross@linux.intel.com>,
        Wim Van Sebroeck <wim@linux-watchdog.org>,
        Guenter Roeck <linux@roeck-us.net>,
        Jean Delvare <jdelvare@suse.com>,
        Jonathan Corbet <corbet@lwn.net>, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-watchdog@vger.kernel.org,
        linux-hwmon@vger.kernel.org, linux-doc@vger.kernel.org,
        platform-driver-x86@vger.kernel.org,
        AceLan Kao <chia-lin.kao@canonical.com>
References: <20210506081619.2443-1-campion.kang@advantech.com.tw>
From:   Hans de Goede <hdegoede@redhat.com>
Message-ID: <6b86bd36-b934-c204-9e56-079ab8cd4b54@redhat.com>
Date:   Thu, 6 May 2021 10:47:22 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
MIME-Version: 1.0
In-Reply-To: <20210506081619.2443-1-campion.kang@advantech.com.tw>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-hwmon.vger.kernel.org>
X-Mailing-List: linux-hwmon@vger.kernel.org

Hi,

I'm replying here since this series has no cover-letter, for
the next version for a series touching so many different
sub-systems it would be good to start with a cover-letter
providing some background info on the series.

I see this is binding to an ACPI device, yet it is also using
devicetree bindings and properties.

So I take it this means that your ACPI tables are using the
optional capability of embedded device-tree blobs inside the
ACPI tables ?

That is an unusual combination on a x86 device, note it is
not wrong but AFAIK you are the first to do this on x86.

Other then that question, for the next version please give
all commits a proper commit message and not just a short
1 line Subject and put the changelog after a scissors line
after your Signed-off-by like this:

Signed-off-by: Campion Kang <campion.kang@advantech.com.tw>
---
Changed in V7:
1. According to the reviewer's comment, add two files:
   Documentation/hwmon/ahc1ec0-hwmon.rst and
   drivers/platform/x86/ahc1ec0-core.c

And please also include older changelog entries.

Regards,

Hans
 




On 5/6/21 10:16 AM, Campion Kang wrote:
> Changed in V7:
> 	1. According to the reviewer's comment, add two files:
> 	   Documentation/hwmon/ahc1ec0-hwmon.rst and
> 	   drivers/platform/x86/ahc1ec0-core.c
> 
> Signed-off-by: Campion Kang <campion.kang@advantech.com.tw>
> ---
>  MAINTAINERS | 13 +++++++++++++
>  1 file changed, 13 insertions(+)
> 
> diff --git a/MAINTAINERS b/MAINTAINERS
> index 83c2b1867586..984795eb6b5d 100644
> --- a/MAINTAINERS
> +++ b/MAINTAINERS
> @@ -572,6 +572,19 @@ S:	Maintained
>  F:	Documentation/scsi/advansys.rst
>  F:	drivers/scsi/advansys.c
>  
> +ADVANTECH AHC1EC0 EMBEDDED CONTROLLER DRIVER
> +M:	Campion Kang <campion.kang@advantech.com.tw>
> +L:	linux-kernel@vger.kernel.org
> +S:	Maintained
> +F:	Documentation/devicetree/bindings/mfd/ahc1ec0.yaml
> +F:	Documentation/hwmon/ahc1ec0-hwmon.rst
> +F:	drivers/hwmon/ahc1ec0-hwmon.c
> +F:	drivers/mfd/ahc1ec0.c
> +F:	drivers/platform/x86/ahc1ec0-core.c
> +F:	drivers/watchdog/ahc1ec0-wdt.c
> +F:	include/dt-bindings/mfd/ahc1ec0-dt.h
> +F:	include/linux/platform_data/ahc1ec0.h
> +
>  ADVANTECH SWBTN DRIVER
>  M:	Andrea Ho <Andrea.Ho@advantech.com.tw>
>  L:	platform-driver-x86@vger.kernel.org
> 

