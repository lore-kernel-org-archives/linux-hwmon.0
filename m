Return-Path: <linux-hwmon-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-17.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,NICE_REPLY_A,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_1 autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 844DEC433ED
	for <linux-hwmon@archiver.kernel.org>; Sat,  8 May 2021 13:38:09 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 59FFB611BD
	for <linux-hwmon@archiver.kernel.org>; Sat,  8 May 2021 13:38:09 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229542AbhEHNjK (ORCPT <rfc822;linux-hwmon@archiver.kernel.org>);
        Sat, 8 May 2021 09:39:10 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:22799 "EHLO
        us-smtp-delivery-124.mimecast.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S229497AbhEHNjJ (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>);
        Sat, 8 May 2021 09:39:09 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1620481088;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=anTa/z1se5Y7cIX+3e8/WeRSLtdDiP02VxrdqALQtsI=;
        b=CsLUYxP+FMjW3WrkDbrta1cJ2m3AsT6tSwfz4Yyd26saDDWIXEObzu5+Z+IYlLW8nqDnMr
        pk7W0TfUkDUvNp5jBzpdQNpbDkBBWMm+YaX4oiO1KmmTo897yuMsHGjKBrisXRkfZooYkX
        3Jv+bmSgdyxOEafdSXSzL1ldIrtI2Qo=
Received: from mail-ed1-f70.google.com (mail-ed1-f70.google.com
 [209.85.208.70]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-552-Xw5rZfP9PoaWYFiNY_4-Mw-1; Sat, 08 May 2021 09:38:06 -0400
X-MC-Unique: Xw5rZfP9PoaWYFiNY_4-Mw-1
Received: by mail-ed1-f70.google.com with SMTP id d8-20020a0564020008b0290387d38e3ce0so6083985edu.1
        for <linux-hwmon@vger.kernel.org>; Sat, 08 May 2021 06:38:05 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=anTa/z1se5Y7cIX+3e8/WeRSLtdDiP02VxrdqALQtsI=;
        b=LEh5rAE5Y9cy0CHtZg09zpJLNqNePrr3r7+hXtU1QROd+DBYzmUYXKKQiK/ABaiE5L
         1TdzoAaeokdNJjlrnuguPq99wsGotAjjbrtD3WtnaWDcKmOlOmFgp5dul/snh+if0Ebq
         ktvt4B/n8HvAkQbGo3CgdYB5beeU0OK/BIxgc1XxsxtKwEw1pJichpvnA6hIfF2L8Mu5
         MhFHXdHPQU27nTOW35NW3BvQePvWkDMXAw/MIS5/iqSiHQ6xgj5OnNArROXPIpnI+MpV
         9wx1a9r4PUkZ7rbVremiEdiI97J9tsugc8Jt7CbKJhxfNLqshsYI3YWU6Lkl7XY0BtOD
         weNA==
X-Gm-Message-State: AOAM531gmWJmVKqX7fXIZzp8TPoLvIrBDtw/fGI2rp4CFI0pA990nH2L
        I/etRvYff2teN0AXlRyXjZJjrsCeOanYgTJTVnmcKjZS9R5wbOfdG8sH6BCMRdR/InnEWlMRZrV
        PnvM9i1PRnjwrz8QtAVLPNlk=
X-Received: by 2002:a17:906:953:: with SMTP id j19mr15932988ejd.56.1620481084937;
        Sat, 08 May 2021 06:38:04 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJzFvbAp38dTmWAMZAwwpW94VOeuZX5Da2ik3lCmzXFpTXik87IexgOfhSUVAjGI9GdLExFVbg==
X-Received: by 2002:a17:906:953:: with SMTP id j19mr15932981ejd.56.1620481084758;
        Sat, 08 May 2021 06:38:04 -0700 (PDT)
Received: from x1.localdomain (2001-1c00-0c1e-bf00-1054-9d19-e0f0-8214.cable.dynamic.v6.ziggo.nl. [2001:1c00:c1e:bf00:1054:9d19:e0f0:8214])
        by smtp.gmail.com with ESMTPSA id r17sm6380579edo.48.2021.05.08.06.38.04
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 08 May 2021 06:38:04 -0700 (PDT)
Subject: Re: [PATCH v2 0/4] hwmon: (sch56xx) Use devres for watchdog and
 platform_device_register_simple()
To:     W_Armin@gmx.de
Cc:     linux-hwmon@vger.kernel.org, linux@roeck-us.net, jdelvare@suse.com
References: <20210508131457.12780-1-W_Armin@gmx.de>
From:   Hans de Goede <hdegoede@redhat.com>
Message-ID: <6c82d444-b0c4-f4e6-93b7-ef40dee1a1b5@redhat.com>
Date:   Sat, 8 May 2021 15:38:03 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
MIME-Version: 1.0
In-Reply-To: <20210508131457.12780-1-W_Armin@gmx.de>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-hwmon.vger.kernel.org>
X-Mailing-List: linux-hwmon@vger.kernel.org

Hi,

On 5/8/21 3:14 PM, W_Armin@gmx.de wrote:
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
> v2:
> - drop sch5627_remove()
> - make sch56xx_watchdog_register() return void

Thanks, series (still) looks good to me:

Reviewed-by: Hans de Goede <hdegoede@redhat.com>

For the series.

Regards,

Hans


p.s.

For your next series when I give my Reviewed-by for v1 and
there are some small changes which require a v2, feel free to
add the Reviewed-by to the v2 series.




> 
> Armin Wolf (4):
>   hwmon: (sch56xx) Use devres functions for watchdog
>   hwmon: (sch56xx-common) Use strscpy
>   hwmon: (sch56xx-common) Use helper function
>   hwmon: (sch56xx-common) Simplify sch56xx_device_add
> 
>  drivers/hwmon/sch5627.c        | 18 ++--------
>  drivers/hwmon/sch5636.c        |  9 ++---
>  drivers/hwmon/sch56xx-common.c | 65 ++++++++++------------------------
>  drivers/hwmon/sch56xx-common.h |  4 +--
>  4 files changed, 25 insertions(+), 71 deletions(-)
> 
> --
> 2.20.1
> 

