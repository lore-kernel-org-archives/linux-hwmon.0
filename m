Return-Path: <SRS0=zEzc=VQ=vger.kernel.org=linux-hwmon-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.3 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_SANE_1 autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id F2686C7618F
	for <linux-hwmon@archiver.kernel.org>; Fri, 19 Jul 2019 15:31:03 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id C85E22184E
	for <linux-hwmon@archiver.kernel.org>; Fri, 19 Jul 2019 15:31:03 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="c7T98Gyo"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728185AbfGSPbD (ORCPT <rfc822;linux-hwmon@archiver.kernel.org>);
        Fri, 19 Jul 2019 11:31:03 -0400
Received: from mail-lf1-f67.google.com ([209.85.167.67]:46209 "EHLO
        mail-lf1-f67.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726711AbfGSPbD (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>);
        Fri, 19 Jul 2019 11:31:03 -0400
Received: by mail-lf1-f67.google.com with SMTP id z15so17750711lfh.13
        for <linux-hwmon@vger.kernel.org>; Fri, 19 Jul 2019 08:31:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=Pm1/Wvc5C7bhQadmbtctN3xj2YqDjAuo06jhAO8ZURE=;
        b=c7T98Gyo1E+96ViAiN+OrNKNC9qlpmaYcxchP1czHlmZwE2aU2f8szaxNHNL6KJTtj
         JcgnHyQjlrG9WR2AaLGhmJaiAlkq3s7S3LYBr4uF+WFLvTkaTydf5ORh5wtJCv3M4MsQ
         Xz6H3oMJbkW5v75WwJmluLq/6m3Tte2eKmJs9mHW6XefyTo91IlM6Tx4DPHawwjn5+Dw
         Ajuae7RUpVOAPhngR4YjrDRASvrE5f43UhgChm5Rl+TdbP2w2kJedR+z5qRNH21tLSD4
         3Ox+Jhgw5bvtv3jr5yKcPw21PMYWyAcnU/OOJmjoLMbnbVRqJKXz2hEX8pvqMPPlarCe
         WWwg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=Pm1/Wvc5C7bhQadmbtctN3xj2YqDjAuo06jhAO8ZURE=;
        b=ZCQ4fzqijE2/XHw8WCR85KWyo9WGft5lE/U54KM0t/2eLQZD8jblUhBwht3ErHQ0yP
         kyuVhBz5GMpH86lChHiSebr8kv1rcEAAADBgEF8z4qU6Arp8zFOmIALtFlnV3ic53w/M
         c2L06dbNA76vIFkooFSW4XFk617kK2FR+4x5KFGClxUmVfdydQ/jZrtcYLch6n2PziYz
         y4+42aUkjjnlkyvW0fKZh6FeCOsg0jjwgOxHe7Pb/oZZ30Q5XbB3lUvAavkbMhUmpS8G
         3pcGMa8ApTD4+ogfiL/DECUkA71igp0IOfPFkaW3xWTfrCogI5kaA048dc1UL7xMdHTn
         o0gw==
X-Gm-Message-State: APjAAAUTdz8p6w8LCKH/mU1ttKkFv54W7NyDgSZq4sKu5GYgkAx78M2M
        najWj6Pbd1KIryqv11OuiWGyAGWyorD+AA==
X-Google-Smtp-Source: APXvYqxqchNQbPMF00W9laK1RupXQqF0xSxEi8euKfovan5qKYKj8HIj52VyjCbxplarrJV5HouYnw==
X-Received: by 2002:ac2:4c84:: with SMTP id d4mr24308177lfl.1.1563550260704;
        Fri, 19 Jul 2019 08:31:00 -0700 (PDT)
Received: from [192.168.0.100] (62-78-152-105.bb.dnainternet.fi. [62.78.152.105])
        by smtp.gmail.com with ESMTPSA id p87sm5698943ljp.50.2019.07.19.08.30.59
        (version=TLS1_3 cipher=AEAD-AES128-GCM-SHA256 bits=128/128);
        Fri, 19 Jul 2019 08:31:00 -0700 (PDT)
Subject: Re: [PATCH 1/2] x86/amd_nb: Add PCI device IDs for family 17h, model
 71h
To:     Guenter Roeck <linux@roeck-us.net>
Cc:     Thomas Gleixner <tglx@linutronix.de>,
        Ingo Molnar <mingo@redhat.com>, Borislav Petkov <bp@alien8.de>,
        "H. Peter Anvin" <hpa@zytor.com>, x86@kernel.org,
        "Woods, Brian" <Brian.Woods@amd.com>,
        Clemens Ladisch <clemens@ladisch.de>,
        Jean Delvare <jdelvare@suse.com>, linux-hwmon@vger.kernel.org
References: <20190718182617.6964-1-marcel.p.bocu@gmail.com>
 <20190718193330.GA23809@roeck-us.net>
 <690c10a3-0f5f-6ba7-9dc9-b7150b300dd1@gmail.com>
 <91c6b4cb-2ae4-c2fb-faf4-110b2c426901@roeck-us.net>
From:   Marcel Bocu <marcel.p.bocu@gmail.com>
Message-ID: <33703f78-c704-b904-8643-59a1fb1849fa@gmail.com>
Date:   Fri, 19 Jul 2019 18:30:56 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <91c6b4cb-2ae4-c2fb-faf4-110b2c426901@roeck-us.net>
Content-Type: text/plain; charset=utf-8
Content-Language: fr-classic
Content-Transfer-Encoding: 7bit
Sender: linux-hwmon-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-hwmon.vger.kernel.org>
X-Mailing-List: linux-hwmon@vger.kernel.org

On 19/07/2019 16:27, Guenter Roeck wrote:
> Hi Marcel,
> 
> On 7/19/19 12:40 AM, Marcel Bocu wrote:
>> On 18/07/2019 22:33, Guenter Roeck wrote:
>>> On Thu, Jul 18, 2019 at 09:26:16PM +0300, Marcel Bocu wrote:
>>>> The AMD Ryzen gen 3 processors came with a different PCI IDs for the
>>>> function 3 & 4 which are used to access the SMN interface. The root
>>>> PCI address however remained at the same address as the model 30h.
>>>>
>>>> Adding the F3/F4 PCI IDs respectively to the misc and link ids appear
>>>> to be sufficient for k10temp, so let's add them and follow up on the
>>>> patch if other functions need more tweaking.
>>>>
>>>> Signed-off-by: Marcel Bocu <marcel.p.bocu@gmail.com>
>>>> Tested-by: Marcel Bocu <marcel.p.bocu@gmail.com>
>>>>
>>>
>>> How is this version of the patch series different to the first version ?
>>
>> They seem pretty much identical except for the macro's name (71h vs 70h)
> 
> Normally (or at least so far) the device ID specifications are for a group
> of models, not just for one chip in the group. Traditionally, AMD uses the
> same PCI ID for model numbers 7xh, so 70h would probably be more appropriate.
> Of course, that is hard to say without documentation from AMD, and I don't
> see anything published for Ryzen 3000.

Makes sense. Thanks for giving me some historical background!

> 
>> and the fact that I already Cc:ed the x86 crew. I had checked this
>> weekend if there were patches already for this, but I guess Vicki sent
>> his patches right after I checked. Sorry for the noise!
>>
>> Could anyone add Vicki Pfau (I don't have his email address because I
>> subscribed to this list after he sent his patches), and then we can ask
>> him if he already submited his patches to x86 or not.
>>
>> In any case, whatever patchset gets selected for inclusion, I suggest we
>> both sign off on the commit (I do not care about authorship). I will
>> anyway try to follow up with other patches to access the chipset's
>> temperature and the fan speed.
>>
> 
> Wouldn't that require patches to the Super-IO chip on your board ?
> That seems orthogonal to this patch series (and to the R3000 CPU).

Yes, but what I meant is that I don't mind not having authorship on
these patches since most of my work will be on adding new features.
Sorry for not being clear.

> 
>> Sorry again for the noise!
> 
> Sorry myself, I didn't realize that the patches were from different people
> since they looked similar.

I can't blame you for that! Could anyone in this thread add Vicki Pfau
to figure out what's the best course of action?

We could merge his patches (if he contacted the x86 crew), make a v2 of
mine (71h -> 70h, add his Signed-off-by?) and merge, or some other option?

Marcel

> 
> Guenter
> 

