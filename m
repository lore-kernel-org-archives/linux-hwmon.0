Return-Path: <linux-hwmon-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-12.3 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,MAILING_LIST_MULTI,NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,
	USER_AGENT_SANE_1 autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 114F5C433ED
	for <linux-hwmon@archiver.kernel.org>; Sun, 18 Apr 2021 12:48:40 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id D67A7610CE
	for <linux-hwmon@archiver.kernel.org>; Sun, 18 Apr 2021 12:48:39 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229848AbhDRMtH (ORCPT <rfc822;linux-hwmon@archiver.kernel.org>);
        Sun, 18 Apr 2021 08:49:07 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:38536 "EHLO
        us-smtp-delivery-124.mimecast.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S229826AbhDRMtG (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>);
        Sun, 18 Apr 2021 08:49:06 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1618750118;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=Y+S2/x07nW084blgtn2sJiJs/0vwiKP0AJ8mIk+ULkw=;
        b=M0nHv9QstXMAZC86p73FcihOGMTalDw/KNgeo1hjgZm/GFKk62WC47ML7k4uHLjjxi6Qq+
        gNl13hSVsXKkq3RsSNQRel07Ym8ghwb5/iI/UZenT7vzHVRy12SYFURdDlF8Ej/lUGiSJB
        dtIm6RQIof5J6OUaW1VBgUpM7KJGkWM=
Received: from mail-ed1-f72.google.com (mail-ed1-f72.google.com
 [209.85.208.72]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-15-dA7v9NrCNc6jDgEVkhwM4Q-1; Sun, 18 Apr 2021 08:48:36 -0400
X-MC-Unique: dA7v9NrCNc6jDgEVkhwM4Q-1
Received: by mail-ed1-f72.google.com with SMTP id i18-20020aa7c7120000b02903853032ef71so632536edq.22
        for <linux-hwmon@vger.kernel.org>; Sun, 18 Apr 2021 05:48:36 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=Y+S2/x07nW084blgtn2sJiJs/0vwiKP0AJ8mIk+ULkw=;
        b=CxfXdHhtrCQvVKSRxy6vo20VWnK7TJ3QE4NHBCY5rHq1Gxnw9wSsgVuAwWtNTjUBXU
         lUeyfGGGiXn9F/T2DJJ9Vok19YGC3qD6tcwvI3xQkbUMWbpLHohDLe6VwB5H2DKaOAQA
         F3IkwPYIyJkbYaxlZhKs2kj4C4nHNW1b2oJ/MzaxTdv7SeuYNtAdKXHjSS/O5Kit7Ayg
         ZCnTaq35+TDmV7nL9MXSI0Zr8rUfGFzagLyBtaZQDueaUtHvBRHbqfuE5tBHbLmgxnOe
         B9GGiFX+Skjt50OVajsvb+ucWhbnYnBl9QPzQfaInhy3oueGk6S+MJ3g1uyrF4u/gK8O
         OGMg==
X-Gm-Message-State: AOAM532PvUU/KTnocmW0EyqYCn9Malr3V1Sa8RdChzjCsej/wBRZrDOj
        TGN69GeubBlIorF0P9YI8lp5OWSoTa6Q4oL7dr1hRumVqdQTU9oI241EpJtCSEGFMkPuA0YihFJ
        53yTc/E9r2xbPZiuR/KwFFLT9kotkW8uP1bhpyD3Oti5ovNcjtQtQKF3Y9g9BVm6pXd8tM3fyT5
        w=
X-Received: by 2002:a17:906:b754:: with SMTP id fx20mr17339310ejb.69.1618750115227;
        Sun, 18 Apr 2021 05:48:35 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJzdVqcUxxQ5VUhxCKkzaTWHQTOJpU+iIPRcI1JbytNa1Ff3uxVCqCsZPK3N79izmf95Xxtuig==
X-Received: by 2002:a17:906:b754:: with SMTP id fx20mr17339302ejb.69.1618750115076;
        Sun, 18 Apr 2021 05:48:35 -0700 (PDT)
Received: from x1.localdomain (2001-1c00-0c1e-bf00-1054-9d19-e0f0-8214.cable.dynamic.v6.ziggo.nl. [2001:1c00:c1e:bf00:1054:9d19:e0f0:8214])
        by smtp.gmail.com with ESMTPSA id gz10sm3778858ejc.25.2021.04.18.05.48.34
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 18 Apr 2021 05:48:34 -0700 (PDT)
Subject: Re: [PATCH 0/2] hwmon: (sch5627) Use devres function
To:     W_Armin@gmx.de
Cc:     jdelvare@suse.com, linux@roeck-us.net, linux-hwmon@vger.kernel.org
References: <20210417210920.15496-1-W_Armin@gmx.de>
From:   Hans de Goede <hdegoede@redhat.com>
Message-ID: <c974f1f3-b315-612d-d24a-4030df29b2b5@redhat.com>
Date:   Sun, 18 Apr 2021 14:48:34 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
MIME-Version: 1.0
In-Reply-To: <20210417210920.15496-1-W_Armin@gmx.de>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-hwmon.vger.kernel.org>
X-Mailing-List: linux-hwmon@vger.kernel.org

Hi,

On 4/17/21 11:09 PM, W_Armin@gmx.de wrote:
> From: Armin Wolf <W_Armin@gmx.de>
> 
> Use devm_hwmon_device_register_with_info() to simplify
> the source code and remove an unnecessary error path
> in sch5627_probe as it performs nothing useful when
> using the devres function.
> 
> Tested on a Fujitsu Esprimo P720.
> 
> Armin Wolf (2):
>   hwmon: (sch5627) Use devres function
>   hwmon: (sch5627) Remove unnecessary error path

Thanks, both patches looks good to me:

Reviewed-by: Hans de Goede <hdegoede@redhat.com>

For the series.

Regards,

Hans

