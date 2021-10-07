Return-Path: <linux-hwmon-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 95570C4332F
	for <linux-hwmon@archiver.kernel.org>; Thu,  7 Oct 2021 16:31:03 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 7EA2961130
	for <linux-hwmon@archiver.kernel.org>; Thu,  7 Oct 2021 16:31:03 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S242081AbhJGQc4 (ORCPT <rfc822;linux-hwmon@archiver.kernel.org>);
        Thu, 7 Oct 2021 12:32:56 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56980 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S242645AbhJGQc4 (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>); Thu, 7 Oct 2021 12:32:56 -0400
Received: from mail-oi1-x22f.google.com (mail-oi1-x22f.google.com [IPv6:2607:f8b0:4864:20::22f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 5241BC061760
        for <linux-hwmon@vger.kernel.org>; Thu,  7 Oct 2021 09:31:02 -0700 (PDT)
Received: by mail-oi1-x22f.google.com with SMTP id o83so2301632oif.4
        for <linux-hwmon@vger.kernel.org>; Thu, 07 Oct 2021 09:31:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=sender:to:cc:references:from:subject:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=5dA3wSu50RP1JMAUNStkID2LYd9HCaAESbo99Gv+xaw=;
        b=dk6Oc6BCnUtJIa3CdtCxpzSAUfPLmRVaUMwiobmxwU+8gqLiHauIrqW8tPuQz7gr3E
         MqwU1r9o6GGIzuqbAkMn9HI2353DZNGlel+UfGTZL92+4qJzvpQv2nxhXSB+219e4AvT
         JFgmu/1limg6RMKfqfrL4cpAkYvC3mnUb56QeQ73ZAmFTYbLsgx8e15S9T7bM2W2zSvC
         Qb7Fy8TtE4wgysmU/A0kUIk+YIFa35ZVAOPQzx+AvYIRPeYv3lEqD+VVlkcUOoygl4KL
         kWFm4jPsuzhyR43fSIDj647ZzrK2FkS/5U0iY7K0y04XFJ4hPC91OQ/p0nZTqrj+hTCt
         dZ5g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:sender:to:cc:references:from:subject:message-id
         :date:user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=5dA3wSu50RP1JMAUNStkID2LYd9HCaAESbo99Gv+xaw=;
        b=Z7jAp/CJTcEo3bdpGFWjj/HDx7dM1rrU/+5pZ6GLB8jYtuzr20LfFIWhhJ9jrL/Lcc
         bstkyYWgmKHshKixVMBkEqaQ+vuXMuVOV+JguSoq72Fg90pbFK7n7CRVxQnJ3DyQlPmu
         Oq40m5UYxx7ccldemnhV9RXdTLsBpmx7j8LMB53hhG79JoLz7PjygeEMNTx1FVlYjDU+
         cKIyNU7Uiju3t0MuCEkZWn6UuhEWuzZL/sRm7KjoamUrbWjFEfqvJGqFB7oQaXD6YY1H
         BEatDK4GCBSF4OXOFvfQFJCheHD3omoEJTdBOkrN2w+EUxk+Ijp6b1ZG7piFMXfNQVSY
         sbHA==
X-Gm-Message-State: AOAM532vZKldZBEM0M7sAJ4f3eczCVBMN+uri8L0bZAPs+LXbtVr30ad
        YcBGXB7UumIPvowQ7bTmbqkefuF5QBM=
X-Google-Smtp-Source: ABdhPJxyJN/w+sB0wR3+AXwkG2WoWxZ3pOqBxMmtgyO/fQMjLF1t/jJ7kz1HzgNG8nRGQtZUn32J4g==
X-Received: by 2002:aca:3e09:: with SMTP id l9mr12770827oia.131.1633624261462;
        Thu, 07 Oct 2021 09:31:01 -0700 (PDT)
Received: from server.roeck-us.net ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
        by smtp.gmail.com with ESMTPSA id n8sm4882936ota.9.2021.10.07.09.31.00
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 07 Oct 2021 09:31:00 -0700 (PDT)
Sender: Guenter Roeck <groeck7@gmail.com>
To:     Armin Wolf <W_Armin@gmx.de>
Cc:     Jean Delvare <jdelvare@suse.com>, linux-hwmon@vger.kernel.org
References: <7aaa2734-514d-3752-01f1-fe3895718f55@gmx.de>
 <20211002140451.GA34532@roeck-us.net>
 <ce066c64-bf13-e6fa-278f-0dd6f2c2f45e@gmx.de>
From:   Guenter Roeck <linux@roeck-us.net>
Subject: Re: i5k_amb temp_mid replacement
Message-ID: <def290d3-8c45-a44b-ebc7-166a77e8a2b9@roeck-us.net>
Date:   Thu, 7 Oct 2021 09:30:58 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.13.0
MIME-Version: 1.0
In-Reply-To: <ce066c64-bf13-e6fa-278f-0dd6f2c2f45e@gmx.de>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-hwmon.vger.kernel.org>
X-Mailing-List: linux-hwmon@vger.kernel.org

On 10/7/21 7:20 AM, Armin Wolf wrote:
> Am 02.10.21 um 16:04 schrieb Guenter Roeck:
>> On Fri, Oct 01, 2021 at 12:13:53AM +0200, Armin Wolf wrote:
>>> Hello,
>>>
>>> while trying to convert i5k_temp to the new hwmon API to resolve
>>> https://bugzilla.kernel.org/show_bug.cgi?id=208693,
>>> i was asking myself whether or not temp_mid could be replaced with a
>>> standard sysfs attribute?
>>> Since afaik temp_mid and temp_max are both temperature limits, they
>>> could potentially be replaced with
>>> temp_max and temp_crit.
>>>
>> Quite likely. Unfortunately, the chipset documentation is not available
>> to the public, so it is difficult to determine what those temperatures
>> actually mean.
>>
>> Guenter
> Darrick Wong says the chipset documentation would support such a change.
> However, he fears that the changed meaning of tempX_max could confuse
> userspace
> programs.
> But i think the current not using standard attribute names will confuse
> even more
> programms.

I still don't know what temperature limits temp_mid and temp_max actually
reflect, so I still can not really comment.

Guenter
