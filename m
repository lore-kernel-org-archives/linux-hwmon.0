Return-Path: <SRS0=zEzc=VQ=vger.kernel.org=linux-hwmon-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.3 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_SANE_1 autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D02F0C76188
	for <linux-hwmon@archiver.kernel.org>; Fri, 19 Jul 2019 07:40:39 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id A23502082E
	for <linux-hwmon@archiver.kernel.org>; Fri, 19 Jul 2019 07:40:39 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="KKxYRpiW"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726373AbfGSHkj (ORCPT <rfc822;linux-hwmon@archiver.kernel.org>);
        Fri, 19 Jul 2019 03:40:39 -0400
Received: from mail-lj1-f194.google.com ([209.85.208.194]:40762 "EHLO
        mail-lj1-f194.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726247AbfGSHkj (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>);
        Fri, 19 Jul 2019 03:40:39 -0400
Received: by mail-lj1-f194.google.com with SMTP id m8so29822799lji.7
        for <linux-hwmon@vger.kernel.org>; Fri, 19 Jul 2019 00:40:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=HxjWTmOlI2zHHOnuRKNyfFqKVhK3MxTUteaFvUw9qAE=;
        b=KKxYRpiWYjlUrzcTzIiG55T0DdvUfseZbCPl9JPI0cpKSMHJzXqTy5SpxGdeCifXpq
         5OqMguYt+odOfUUxa67jjEIyh5XBsCkhz0DlsxsBSPTQr1SsM31fYD7QjL/6nA5spmnF
         JAPe1UD/gseZkENCuaBYSoyiG2o8RxVHEw1Wfcs7rQ6bT7lpEO0neSZjO0Gu6tvhhocj
         NrBCJK6n4ZN21D0QKo0uE1K3H8bRCJ4pquZC6AoHLqFg8NLru/oZoyW/59yGuW9IMP2d
         1DoJp3P20d2lAjjuTgLm7n2FDXXjBl8Un7BycH8QLmaqaKhXqf6Q1jduHLvhq83zyWVM
         oHxA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=HxjWTmOlI2zHHOnuRKNyfFqKVhK3MxTUteaFvUw9qAE=;
        b=JkJEXfl4KoBthZq7kvJnhvgDe76wZE0CzoyLh/fRZxmDpfIrzcq5ttt22Is8oV44/h
         jkN7ARe3zvix4UThMLzAlcFTbgDzXEiW8OW7JxH01aSCbv2CFftNW4XNFhBnRLKcolaP
         VZv4Jo15+gFWcQfUZI7r3afHnbDVxqzqsiYP1kUsP1h3QhDfNGfQPCdvQPbuJErfk5Ph
         yB+IerA6O2lyKu7uyzkC1Yrn1jk6LHktgfYvN66b/dX66lLgrC5BRaTAsjzbamUby+7k
         yzrCe1Ytu5/ZCUJTpv6BsAEroterHsSrFkAyWLW0wDzv9VwpsQBmceRdwkCSSwv6lw5j
         YgaA==
X-Gm-Message-State: APjAAAVXiQfbm4T3qDuNBgU7VjyCCi1FEir/aYn2bcUBFEjrIYSLaubJ
        Qhmt3c474HjApEcdy2eSqjgkqQdklep+HA==
X-Google-Smtp-Source: APXvYqw8dpkf2kNUMijOj6OUPkEuGVNzBmRQgevCHzKlNcWfe0vIDDrD58HjKRImykrPMvnsgyxqeA==
X-Received: by 2002:a2e:968f:: with SMTP id q15mr21793321lji.30.1563522036745;
        Fri, 19 Jul 2019 00:40:36 -0700 (PDT)
Received: from [192.168.0.100] (62-78-152-105.bb.dnainternet.fi. [62.78.152.105])
        by smtp.gmail.com with ESMTPSA id b27sm5515243ljb.11.2019.07.19.00.40.35
        (version=TLS1_3 cipher=AEAD-AES128-GCM-SHA256 bits=128/128);
        Fri, 19 Jul 2019 00:40:36 -0700 (PDT)
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
From:   Marcel Bocu <marcel.p.bocu@gmail.com>
Message-ID: <690c10a3-0f5f-6ba7-9dc9-b7150b300dd1@gmail.com>
Date:   Fri, 19 Jul 2019 10:40:32 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <20190718193330.GA23809@roeck-us.net>
Content-Type: text/plain; charset=utf-8
Content-Language: fr-classic
Content-Transfer-Encoding: 7bit
Sender: linux-hwmon-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-hwmon.vger.kernel.org>
X-Mailing-List: linux-hwmon@vger.kernel.org

On 18/07/2019 22:33, Guenter Roeck wrote:
> On Thu, Jul 18, 2019 at 09:26:16PM +0300, Marcel Bocu wrote:
>> The AMD Ryzen gen 3 processors came with a different PCI IDs for the
>> function 3 & 4 which are used to access the SMN interface. The root
>> PCI address however remained at the same address as the model 30h.
>>
>> Adding the F3/F4 PCI IDs respectively to the misc and link ids appear
>> to be sufficient for k10temp, so let's add them and follow up on the
>> patch if other functions need more tweaking.
>>
>> Signed-off-by: Marcel Bocu <marcel.p.bocu@gmail.com>
>> Tested-by: Marcel Bocu <marcel.p.bocu@gmail.com>
>>
> 
> How is this version of the patch series different to the first version ?

They seem pretty much identical except for the macro's name (71h vs 70h)
and the fact that I already Cc:ed the x86 crew. I had checked this
weekend if there were patches already for this, but I guess Vicki sent
his patches right after I checked. Sorry for the noise!

Could anyone add Vicki Pfau (I don't have his email address because I
subscribed to this list after he sent his patches), and then we can ask
him if he already submited his patches to x86 or not.

In any case, whatever patchset gets selected for inclusion, I suggest we
both sign off on the commit (I do not care about authorship). I will
anyway try to follow up with other patches to access the chipset's
temperature and the fan speed.

Sorry again for the noise!
Marcel
