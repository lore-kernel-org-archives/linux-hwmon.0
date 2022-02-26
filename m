Return-Path: <linux-hwmon-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A563AC433F5
	for <linux-hwmon@archiver.kernel.org>; Sat, 26 Feb 2022 18:48:04 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232018AbiBZSsh (ORCPT <rfc822;linux-hwmon@archiver.kernel.org>);
        Sat, 26 Feb 2022 13:48:37 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55708 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230359AbiBZSsf (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>);
        Sat, 26 Feb 2022 13:48:35 -0500
Received: from mail-oo1-xc32.google.com (mail-oo1-xc32.google.com [IPv6:2607:f8b0:4864:20::c32])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 523A21F5863
        for <linux-hwmon@vger.kernel.org>; Sat, 26 Feb 2022 10:48:00 -0800 (PST)
Received: by mail-oo1-xc32.google.com with SMTP id y15-20020a4a650f000000b0031c19e9fe9dso11828322ooc.12
        for <linux-hwmon@vger.kernel.org>; Sat, 26 Feb 2022 10:48:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=sender:message-id:date:mime-version:user-agent:content-language:to
         :references:from:subject:in-reply-to:content-transfer-encoding;
        bh=BfaW59z6SUHrrfIIRGnCtdtKdZwkkemMWwrLAvvQwuI=;
        b=EhdessRoNr05le3kbRWgXahRyOx4/zRJ+TZB1ulcFG9PjvxKVyETnBXCTMzVCknC+/
         xSfV0cT8ZL+V4dqrecJUvEXlhT6Jm3Jok/5eLfEyERQ0ikIvafSTAqlkSK9J9H4ZwK/P
         m4yncP0AJyVvQnrERe6deOsN4grAxNaYNhQD6E5JnLMltod45HkfezxcP+A6uTW4gran
         JK4ugVJRjq8oehMAruAJeD6knholvq5WSHEvvefxD6WQ6kMXTy6irOV/k+9YONc+h8uL
         f826l9Oq7+8qq/MdYGgKQhS3zTqPlJb7BUCm3amWjkJMP8unyOBIyb+nBZQ6ITKD5ePA
         qsLA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:sender:message-id:date:mime-version:user-agent
         :content-language:to:references:from:subject:in-reply-to
         :content-transfer-encoding;
        bh=BfaW59z6SUHrrfIIRGnCtdtKdZwkkemMWwrLAvvQwuI=;
        b=GLJEUfDwOMMYXL9Js+1bDU7sWhQPcZ9WG4jihgu/KqdnaBcu2P7dc6a6YtjiG4Lku3
         0fc7fAd1ulRgDtgDD+9DwDvHcMvxm53IQcWFLgGQTMuOXzCLYhY3TmhIUXoNKAci/zgP
         q5JWV1q6C1od73e+ctDGAb7E3oYMxFC4vGzveskHimmDKyCVuRsijcYmx0n//96E7JYD
         YtCchodHz82XSvyFGs4dgNhd02zpJ8z1cr6jCxzgLm6ICPCkgBtMjOQPEvp46RWQF5e8
         VqVimPVhqoxyiF6Kd9Pbh4lZBxhUBZxddU/i47y1lsCfK9Hfx5pQ1WRked7iu0wI6oqe
         ZGcQ==
X-Gm-Message-State: AOAM531R7RdyiM8aIxMMDc8NULvd3QyUOz0iyDkJcFNA8iNrpOdaHDSr
        /3bFDkNb8gKUoM0QdCME+wj84qp5BUQ=
X-Google-Smtp-Source: ABdhPJxIKZtHydAuqYohkoBPBKU1WDx6yNxmrY/Ds3fMVTR8jtN5IC7PbtpQmSm0kSVF4lYNBkZVcQ==
X-Received: by 2002:a05:6870:3853:b0:d7:391:b1ce with SMTP id z19-20020a056870385300b000d70391b1cemr1530070oal.141.1645901279642;
        Sat, 26 Feb 2022 10:47:59 -0800 (PST)
Received: from ?IPV6:2600:1700:e321:62f0:329c:23ff:fee3:9d7c? ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
        by smtp.gmail.com with ESMTPSA id r4-20020a9d5cc4000000b005af6f4ff5e2sm2723149oti.61.2022.02.26.10.47.58
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 26 Feb 2022 10:47:59 -0800 (PST)
Sender: Guenter Roeck <groeck7@gmail.com>
Message-ID: <e8e5bca6-9014-ae36-ad02-b2edaf5e046e@roeck-us.net>
Date:   Sat, 26 Feb 2022 10:47:57 -0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.0
Content-Language: en-US
To:     Frank Crawford <frank@crawford.emu.id.au>,
        linux-hwmon@vger.kernel.org
References: <6c8b5fbd514df708af84630544eca6ee12766bbd.camel@crawford.emu.id.au>
From:   Guenter Roeck <linux@roeck-us.net>
Subject: Re: Reviving Support for it87.c
In-Reply-To: <6c8b5fbd514df708af84630544eca6ee12766bbd.camel@crawford.emu.id.au>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-hwmon.vger.kernel.org>
X-Mailing-List: linux-hwmon@vger.kernel.org

On 2/26/22 02:38, Frank Crawford wrote:
> Folks,
> 
> For sometime there has been no activity to update the it87 module, but
> for I've been collecting the various suggested patches and I've tested a
> number of them and am keen get these into the official kernel.
> 
> In fact the biggest set of patches are the set that seems to have come
> from here in late 2016 but never seems to have made it into the official
> kernel.
> 
> How can I go about getting this moving again?
> 

If you refer to my earlier patches, there are two problems with them.
First, they were not in a form acceptable for upstream submission
(one patch per logical change).
Second, and more severe, a lot of the code is experimental and
sometimes caused problems (restarts) on my systems. This was
especially the case if the hardware had a second device (another
it87xx or an embedded controller) accessing the chip in parallel.
I had tried some workarounds, but never really managed to stabilize
the code. While this is kind of ok for out-of-tree code, it isn't
acceptable for the upstream kernel. Getting support from ITE and/or
from a board vendor was all but impossible. ITE typically doesn't
even admit that a chip exists, and all I got from board vendors
- if anything - was "we don't support Linux". I don't know if it
is even remotely possible to fix those problems without support
from ITE and/or board vendors.

Guenter
