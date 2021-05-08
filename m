Return-Path: <linux-hwmon-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-12.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,MAILING_LIST_MULTI,NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,
	USER_AGENT_SANE_1 autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1012DC433ED
	for <linux-hwmon@archiver.kernel.org>; Sat,  8 May 2021 09:00:03 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id D3351611CC
	for <linux-hwmon@archiver.kernel.org>; Sat,  8 May 2021 09:00:02 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229797AbhEHJBD (ORCPT <rfc822;linux-hwmon@archiver.kernel.org>);
        Sat, 8 May 2021 05:01:03 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:39067 "EHLO
        us-smtp-delivery-124.mimecast.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S229583AbhEHJBC (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>);
        Sat, 8 May 2021 05:01:02 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1620464400;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=xLKPBo4V60nc9GVk9lJlZJRLgRin3SeiJhXPY7A8tFw=;
        b=iS3M3AvpQOQXtsRHeKkEazAsTujlO3PVHRHpmuusdNMh+k9eyIHvLVVTwotHOl7frTXO1z
        Scmtt/GNRNRKFvXcwVwCT6eQuiBo6pou8AYzQaeczczn+BaJg6+dFkw1mGTgTyfWf97P4d
        WM3cXV0HAxPvJ6Bbis/S+G3s2ysP40g=
Received: from mail-ed1-f71.google.com (mail-ed1-f71.google.com
 [209.85.208.71]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-465-fGaRnolZNfakMvf7rP5YuQ-1; Sat, 08 May 2021 04:59:58 -0400
X-MC-Unique: fGaRnolZNfakMvf7rP5YuQ-1
Received: by mail-ed1-f71.google.com with SMTP id bm3-20020a0564020b03b0290387c8b79486so5788999edb.20
        for <linux-hwmon@vger.kernel.org>; Sat, 08 May 2021 01:59:58 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=xLKPBo4V60nc9GVk9lJlZJRLgRin3SeiJhXPY7A8tFw=;
        b=faQzOtTSyfBIhvGh7on3cZCqZUnuZJBpncVCBZE6qdYJ6FGKlJoRiVrd9zAjuM8VPg
         tCV1SJxOSAZbA5TU3wYrlhcW+irVfIW0a64VQAs+fUlrBFKViPSjfaByoO+ptqUkYb1b
         LY+qigrkxNZi9OSOTwB5X0ZtXBbZ3rx9KEiJTUx90m8mthmcbc7+jzbP4F3ewv5041LG
         xiol6lGSmjJ8ozeZR4ikPA4ah5ymTEAXihsqUgY/rHaWXE9ucvn/AIy3piovevYYdoRh
         aSBTYOD7U5/n0is7OeEyl5h7qtlxNJoPjPeH4/+XL78hX04stvi3MPOjIvJzJ9l7IeVZ
         4tEQ==
X-Gm-Message-State: AOAM533804Ix5z+LkM+6ovE3zinO30sBDis5UoBwJgpBNSWpwZvY0rZx
        VwQLmR1V8sI1GKn8yaLMMYkjW6PtAJaQJjXHy8boKnEQEtYRsPX4nZ1e2/5JWAYoKGKVkpde35h
        +u98b440M2ixT3hqPkiOfMm0=
X-Received: by 2002:a17:906:3e89:: with SMTP id a9mr14413000ejj.405.1620464397771;
        Sat, 08 May 2021 01:59:57 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJx6cwnT37lxTeIqYsnAv0zWn0YRpGmRYWZ8cPjeoPNDQAs1ryx+4dqN5kLaHkicDEhSskiA+A==
X-Received: by 2002:a17:906:3e89:: with SMTP id a9mr14412993ejj.405.1620464397657;
        Sat, 08 May 2021 01:59:57 -0700 (PDT)
Received: from x1.localdomain (2001-1c00-0c1e-bf00-1054-9d19-e0f0-8214.cable.dynamic.v6.ziggo.nl. [2001:1c00:c1e:bf00:1054:9d19:e0f0:8214])
        by smtp.gmail.com with ESMTPSA id m9sm5652333edd.16.2021.05.08.01.59.57
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 08 May 2021 01:59:57 -0700 (PDT)
Subject: Re: [PATCH 0/4] hwmon: (sch56xx) Use devres for watchdog and
 platform_device_register_simple()
To:     W_Armin@gmx.de
Cc:     linux-hwmon@vger.kernel.org, linux@roeck-us.net, jdelvare@suse.com
References: <20210507212404.6781-1-W_Armin@gmx.de>
From:   Hans de Goede <hdegoede@redhat.com>
Message-ID: <a18b6f60-67f5-4a1f-df5a-a5bf42968bc2@redhat.com>
Date:   Sat, 8 May 2021 10:59:56 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
MIME-Version: 1.0
In-Reply-To: <20210507212404.6781-1-W_Armin@gmx.de>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-hwmon.vger.kernel.org>
X-Mailing-List: linux-hwmon@vger.kernel.org

Hi,

On 5/7/21 11:24 PM, W_Armin@gmx.de wrote:
> From: Armin Wolf <W_Armin@gmx.de>
> 
> Since it was requested to use devres for the watchdog device,
> use devm_watchdog_register() for watchdog registration and do
> some small cleanups.
> 
> Also use platform_device_register_simple() in sch56xx_device_add().
> 
> Tested on a Fujitsu Esprimo P720.
> 
> Armin Wolf (4):
>   hwmon: (sch56xx) Use devres functions for watchdog
>   hwmon: (sch56xx-common) Use strscpy
>   hwmon: (sch56xx-common) Use helper function
>   hwmon: (sch56xx-common) Simplify sch56xx_device_add

Thanks, the entire series looks good to me:

Reviewed-by: Hans de Goede <hdegoede@redhat.com>

For the series.

Regards,

Hans

