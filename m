Return-Path: <SRS0=zEzc=VQ=vger.kernel.org=linux-hwmon-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.0 required=3.0 tests=DKIM_INVALID,DKIM_SIGNED,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_SANE_1 autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7345FC76195
	for <linux-hwmon@archiver.kernel.org>; Fri, 19 Jul 2019 13:27:06 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 4A40B21849
	for <linux-hwmon@archiver.kernel.org>; Fri, 19 Jul 2019 13:27:06 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="pc8sRhmK"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727833AbfGSN1F (ORCPT <rfc822;linux-hwmon@archiver.kernel.org>);
        Fri, 19 Jul 2019 09:27:05 -0400
Received: from mail-pl1-f194.google.com ([209.85.214.194]:44960 "EHLO
        mail-pl1-f194.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727717AbfGSN1F (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>);
        Fri, 19 Jul 2019 09:27:05 -0400
Received: by mail-pl1-f194.google.com with SMTP id t14so15610938plr.11
        for <linux-hwmon@vger.kernel.org>; Fri, 19 Jul 2019 06:27:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=sender:subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=gmAaLpQ7f1j1h7Fy50lcRauRdjbNZqvaCyk+X/OppZI=;
        b=pc8sRhmKZvziC9tML9K/ZbxESlQDnELszafa8/3TG76Uao3aqqOGkGpBzjAUVAaSvE
         eUjOPU1W/w7SCpOQYKDxfnJepAr9VDr/lDcy2J66lBTS9zStqpS5nw0khNurFcQNnL1X
         +rmT7sGGd1w5pQP4NtqEFqq1nIl92A9wm2j3V1SOXAH3KAY/Xe4OOCN4Gx//40evjxOz
         32jfM4xmphNFXcDAwn9v1Ia2CIka72UPKkm4v7nArzIf8I4Dp+UwIDzGGKXP14pym5WG
         C0hEXD9lTR6te3p0g8hRR9J2hxs0oDRXnixui1VtT4Dk7YRla33w0sdzSDF5HTYN8ZBe
         wPIQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:sender:subject:to:cc:references:from:message-id
         :date:user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=gmAaLpQ7f1j1h7Fy50lcRauRdjbNZqvaCyk+X/OppZI=;
        b=O2KAwSI3ZO6B9UKU4GG0q2bZR7nSal57FEFDioC9fBsaYSPQoAo0ALA2orO3WC60QW
         7k5qENcDbWC/D6ECOpEYu13c3AdUNTLpESRj22Xytfkef8bE9vPOIrKO9Zw8sqvqvrKs
         kN3T1KPwKMCTZMkSVeO+a5FsoPF1MSihWqoB84BXwuQKe7elZbrXwrFF+JMLorHvFeH+
         /cG/3l7Y5Wm0/9KeVTQ93pXsmJHLW7FyjZogkYF9N3Azkp85Lba7BvZRZAx8aninXuId
         XVPNElHFv9mlaxeWWgTaACGUVqUKl6FjMHib4lbKZv9NUW7MVhWKV5ZACsTJ8PZQKxDc
         lBtg==
X-Gm-Message-State: APjAAAXu9hUfnhjAqWLGn5LSSJdOsTOQh0/WCldZ/hj0mzVmwfkgHxZZ
        aOPpBfdOiLsKbrBFniDLBk/t8fBC
X-Google-Smtp-Source: APXvYqyHv8htyWKhEo+EBN8RnYuHnzJ4BRwYmjwXBmWpBR0Rscd/lbATIY6U8alMinImSmyGRPLdyA==
X-Received: by 2002:a17:902:145:: with SMTP id 63mr58737628plb.55.1563542824634;
        Fri, 19 Jul 2019 06:27:04 -0700 (PDT)
Received: from server.roeck-us.net ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
        by smtp.gmail.com with ESMTPSA id u7sm27005486pgr.94.2019.07.19.06.27.02
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Fri, 19 Jul 2019 06:27:03 -0700 (PDT)
Subject: Re: [PATCH 1/2] x86/amd_nb: Add PCI device IDs for family 17h, model
 71h
To:     Marcel Bocu <marcel.p.bocu@gmail.com>
Cc:     Thomas Gleixner <tglx@linutronix.de>,
        Ingo Molnar <mingo@redhat.com>, Borislav Petkov <bp@alien8.de>,
        "H. Peter Anvin" <hpa@zytor.com>, x86@kernel.org,
        "Woods, Brian" <Brian.Woods@amd.com>,
        Clemens Ladisch <clemens@ladisch.de>,
        Jean Delvare <jdelvare@suse.com>, linux-hwmon@vger.kernel.org
References: <20190718182617.6964-1-marcel.p.bocu@gmail.com>
 <20190718193330.GA23809@roeck-us.net>
 <690c10a3-0f5f-6ba7-9dc9-b7150b300dd1@gmail.com>
From:   Guenter Roeck <linux@roeck-us.net>
Message-ID: <91c6b4cb-2ae4-c2fb-faf4-110b2c426901@roeck-us.net>
Date:   Fri, 19 Jul 2019 06:27:01 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.7.2
MIME-Version: 1.0
In-Reply-To: <690c10a3-0f5f-6ba7-9dc9-b7150b300dd1@gmail.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Sender: linux-hwmon-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-hwmon.vger.kernel.org>
X-Mailing-List: linux-hwmon@vger.kernel.org

Hi Marcel,

On 7/19/19 12:40 AM, Marcel Bocu wrote:
> On 18/07/2019 22:33, Guenter Roeck wrote:
>> On Thu, Jul 18, 2019 at 09:26:16PM +0300, Marcel Bocu wrote:
>>> The AMD Ryzen gen 3 processors came with a different PCI IDs for the
>>> function 3 & 4 which are used to access the SMN interface. The root
>>> PCI address however remained at the same address as the model 30h.
>>>
>>> Adding the F3/F4 PCI IDs respectively to the misc and link ids appear
>>> to be sufficient for k10temp, so let's add them and follow up on the
>>> patch if other functions need more tweaking.
>>>
>>> Signed-off-by: Marcel Bocu <marcel.p.bocu@gmail.com>
>>> Tested-by: Marcel Bocu <marcel.p.bocu@gmail.com>
>>>
>>
>> How is this version of the patch series different to the first version ?
> 
> They seem pretty much identical except for the macro's name (71h vs 70h)

Normally (or at least so far) the device ID specifications are for a group
of models, not just for one chip in the group. Traditionally, AMD uses the
same PCI ID for model numbers 7xh, so 70h would probably be more appropriate.
Of course, that is hard to say without documentation from AMD, and I don't
see anything published for Ryzen 3000.

> and the fact that I already Cc:ed the x86 crew. I had checked this
> weekend if there were patches already for this, but I guess Vicki sent
> his patches right after I checked. Sorry for the noise!
> 
> Could anyone add Vicki Pfau (I don't have his email address because I
> subscribed to this list after he sent his patches), and then we can ask
> him if he already submited his patches to x86 or not.
> 
> In any case, whatever patchset gets selected for inclusion, I suggest we
> both sign off on the commit (I do not care about authorship). I will
> anyway try to follow up with other patches to access the chipset's
> temperature and the fan speed.
> 

Wouldn't that require patches to the Super-IO chip on your board ?
That seems orthogonal to this patch series (and to the R3000 CPU).

> Sorry again for the noise!

Sorry myself, I didn't realize that the patches were from different people
since they looked similar.

Guenter
