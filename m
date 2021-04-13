Return-Path: <linux-hwmon-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-17.3 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,NICE_REPLY_A,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_1 autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 43E72C433B4
	for <linux-hwmon@archiver.kernel.org>; Tue, 13 Apr 2021 08:11:58 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 20EC960FE8
	for <linux-hwmon@archiver.kernel.org>; Tue, 13 Apr 2021 08:11:58 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S237579AbhDMIMQ (ORCPT <rfc822;linux-hwmon@archiver.kernel.org>);
        Tue, 13 Apr 2021 04:12:16 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:27364 "EHLO
        us-smtp-delivery-124.mimecast.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S229660AbhDMIMP (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>);
        Tue, 13 Apr 2021 04:12:15 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1618301516;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=NcHHomT6XP7dUHqtTC8fwd/Wu41KN+IcNV1lgcEgFCE=;
        b=DSE4bwpjenJPb2cL1gYi+Pcb3IjnP7bS6a7y4gYy4eRSod1zxQ/DE0C5z5Ci+NSTw+4Ca5
        99DxDoQyB+vvS3ezo9OMsABLX6z+OmOmvxIbnSP3OA1+wcsQA1aXgUGCnCQt6FnYD1nLuH
        UUqf/D8BjZO3L57AYvNBZ+0dj34sfxI=
Received: from mail-ej1-f69.google.com (mail-ej1-f69.google.com
 [209.85.218.69]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-20-GEs76VQaP0aFXLLux3gmPg-1; Tue, 13 Apr 2021 04:11:54 -0400
X-MC-Unique: GEs76VQaP0aFXLLux3gmPg-1
Received: by mail-ej1-f69.google.com with SMTP id lb4so2553036ejb.21
        for <linux-hwmon@vger.kernel.org>; Tue, 13 Apr 2021 01:11:54 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=NcHHomT6XP7dUHqtTC8fwd/Wu41KN+IcNV1lgcEgFCE=;
        b=VgI6kSuxAysTVBqm3hhKS2YXPXTNxV/AiK30t5iBt89uqzNyJ8MJup5OAE8inUdcGO
         KfgJNQNCRNktYKxtbX22xslGE6ygfkkHHHjB6xriPsusBi+biZdknXkZ2UoDJkJlTId9
         AK94gKbM4CbXDiq+UDIwWSGKx2vj/zBsNWV9RyQdCz6PrBsjifhQyXzK9olQZJq5U4iq
         O2LqydNG43Jpd9GIynRaouD+MIL31qekq4W5/66pU2wJQFswZz4eNBZynNGqljTrTJXc
         BP4Rl+poXlBwJWx+BA92hwbq4R9A4mllxwIcFrJTSiEMdj5heFvxtdgWFs5Z50NVCBog
         8l6Q==
X-Gm-Message-State: AOAM533ly++81ZsSksG0NniDqjPxAmTTZ3FJR7zBWBonueIGVVAIQMKD
        9vFTQjg6KZjV/2WPTbWEGXWRY4KyoU0XynAR37STb5dm9pKmUaXRPv5gjGuB+pmbrVa9vc0sDO8
        jwWbWadr+MM79UjnvYo6R+M0KUldADaecv6snYNJ9nHwpib31T3APRzOvR92hHdT2uZFQHDHR/V
        o=
X-Received: by 2002:a17:906:a052:: with SMTP id bg18mr30987257ejb.18.1618301512835;
        Tue, 13 Apr 2021 01:11:52 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJyxWW8xmtv2YC38Mj6RLGvg7HGlabvO1gVCw38Yq+qDC+yDNgwsXTwsHyJ7CzpfQ1UGVtopmw==
X-Received: by 2002:a17:906:a052:: with SMTP id bg18mr30987243ejb.18.1618301512636;
        Tue, 13 Apr 2021 01:11:52 -0700 (PDT)
Received: from x1.localdomain (2001-1c00-0c1e-bf00-1054-9d19-e0f0-8214.cable.dynamic.v6.ziggo.nl. [2001:1c00:c1e:bf00:1054:9d19:e0f0:8214])
        by smtp.gmail.com with ESMTPSA id cy5sm8928191edb.46.2021.04.13.01.11.51
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 13 Apr 2021 01:11:51 -0700 (PDT)
Subject: Re: [PATCH 0/2] hwmon: (sch5627) Replace hwmon_device_register()
To:     W_Armin@gmx.de
Cc:     linux-hwmon@vger.kernel.org
References: <20210411164225.11967-1-W_Armin@gmx.de>
From:   Hans de Goede <hdegoede@redhat.com>
Message-ID: <f9fc2b35-c634-97d3-54d0-0048586f4abc@redhat.com>
Date:   Tue, 13 Apr 2021 10:11:51 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
MIME-Version: 1.0
In-Reply-To: <20210411164225.11967-1-W_Armin@gmx.de>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-hwmon.vger.kernel.org>
X-Mailing-List: linux-hwmon@vger.kernel.org

Hi,

On 4/11/21 6:42 PM, W_Armin@gmx.de wrote:
> From: Armin Wolf <W_Armin@gmx.de>
> 
> When the sch5627 driver is loaded, a warning is displayed during
> bootup about hwmon_device_register() being deprecated.
> 
> The first patch solves that issue, and the second patch adds
> a minor optimization when reading sensor data.
> 
> Both patches have been tested on a Fujitsu Esprimo P720
> and appear to work without issues.

Thank you for doing this, both patches look good to me:

Reviewed-by: Hans de Goede <hdegoede@redhat.com>

For both patches.

Regards,

Hans



> Armin Wolf (2):
>   hwmon: (sch5627) Convert to hwmon_device_register_with_info()
>   hwmon: (sch5627) Split sch5627_update_device()
> 
>  drivers/hwmon/sch5627.c | 445 ++++++++++++++++------------------------
>  1 file changed, 180 insertions(+), 265 deletions(-)
> 
> --
> 2.20.1
> 

