Return-Path: <SRS0=+gze=VT=vger.kernel.org=linux-hwmon-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.3 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_SANE_1 autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7E8A6C7618F
	for <linux-hwmon@archiver.kernel.org>; Mon, 22 Jul 2019 21:12:42 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 4A4AA21955
	for <linux-hwmon@archiver.kernel.org>; Mon, 22 Jul 2019 21:12:42 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="pN011HWp"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730939AbfGVVMl (ORCPT <rfc822;linux-hwmon@archiver.kernel.org>);
        Mon, 22 Jul 2019 17:12:41 -0400
Received: from mail-lj1-f195.google.com ([209.85.208.195]:45724 "EHLO
        mail-lj1-f195.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728001AbfGVVMl (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>);
        Mon, 22 Jul 2019 17:12:41 -0400
Received: by mail-lj1-f195.google.com with SMTP id m23so38894470lje.12
        for <linux-hwmon@vger.kernel.org>; Mon, 22 Jul 2019 14:12:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=DZ9rq/sB+XRj6X5WYYCOnlMzb+1H7f5oeNLSNlUFzOc=;
        b=pN011HWpBiapBZ0NkMTAGGAGV7ycOz+12+ikt8yNhGWhKEo/cZsZwWHjFsNcM7Y/Nw
         +Cwf2/KZVRU28gwISb7zJ7S0ZHQ5N2cXEvPVtj0vgK22gRdUn1QXn/qdbISAuKWEok2b
         ucm7eBfj0OeptJMuTKd/t+A3N0aPvh7SJpO6DZCivrkfwQmCQOX6EnAy7BefvD/S427/
         46iALhgICH+J3djmZ98kd+kV2cHQ0c5/ItT+S31PHzAvPUeY00XD8inEn71pW8tIpShL
         pLtIXwYFJE7yw1wYMU/VKPjeiJhxKLEcGSnW/x1n8r/jpbc08UNSFG7ym2ZdKTDIpiGp
         7BAQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=DZ9rq/sB+XRj6X5WYYCOnlMzb+1H7f5oeNLSNlUFzOc=;
        b=lD48dfaUBcHX+HHaONoWqwyUysGLV05Ct5KoTgcQb/krmWLDkR9V3fQV/ibfpKAxI+
         k5vQ/mKSgBvUzYpv1jf1eEyLWJsl+SLNb1o5RfZXPvundy98QQHUiUdUf9cPg2ugvKza
         q7HuY6l5tWwcNIYMwSuW4CmIgLUIRXBxA8paLUUxJuZBQPkBEiMgRhI04IAzD3H7Y66M
         77jGYRoNtd4na6ohXAabVcEgMXxf6g12DmmPLt6zFf4pgowfOg8iS26BhvuWiJWkZN5F
         c9aiMGpXkHQzjc+xY/zxGjzta9C/m3nZWZJd81pqkiQq7X+7WEMHqtfA5Ku4WA7bgcuC
         PJWg==
X-Gm-Message-State: APjAAAW61P4Spk3nPc8TQWiKY1JOUGNHcgr1teWPDzaVDN5/BGXR8zEX
        hkx9Om3tZmUr6SxE7oFpmcZkcmXfyVk=
X-Google-Smtp-Source: APXvYqzHeKjhDXKbPEp9uM8MN8kmfBzu4LKOtleM+jLq7H9bJOFgiVyVlhP4PqG+KIyva9gVef2Mpg==
X-Received: by 2002:a2e:9753:: with SMTP id f19mr37274734ljj.113.1563829959313;
        Mon, 22 Jul 2019 14:12:39 -0700 (PDT)
Received: from [192.168.0.100] (62-78-152-105.bb.dnainternet.fi. [62.78.152.105])
        by smtp.gmail.com with ESMTPSA id q1sm7664058ljb.87.2019.07.22.14.12.38
        (version=TLS1_3 cipher=AEAD-AES128-GCM-SHA256 bits=128/128);
        Mon, 22 Jul 2019 14:12:38 -0700 (PDT)
Subject: Re: [PATCH v2 2/2] hwmon/k10temp: Add support for AMD family 17h,
 model 70h CPUs
To:     Guenter Roeck <linux@roeck-us.net>
Cc:     Vicki Pfau <vi@endrift.com>, Thomas Gleixner <tglx@linutronix.de>,
        Ingo Molnar <mingo@redhat.com>, Borislav Petkov <bp@alien8.de>,
        "H. Peter Anvin" <hpa@zytor.com>, x86@kernel.org,
        "Woods, Brian" <Brian.Woods@amd.com>,
        Clemens Ladisch <clemens@ladisch.de>,
        Jean Delvare <jdelvare@suse.com>, linux-hwmon@vger.kernel.org
References: <20190718182617.6964-2-marcel.p.bocu@gmail.com>
 <20190722174653.2391-1-marcel.p.bocu@gmail.com>
 <20190722182333.GA16112@roeck-us.net>
From:   Marcel Bocu <marcel.p.bocu@gmail.com>
Message-ID: <d105d4d3-ee33-ccc0-44b7-77fa153a7225@gmail.com>
Date:   Tue, 23 Jul 2019 00:12:36 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <20190722182333.GA16112@roeck-us.net>
Content-Type: text/plain; charset=utf-8
Content-Language: fr-classic
Content-Transfer-Encoding: 7bit
Sender: linux-hwmon-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-hwmon.vger.kernel.org>
X-Mailing-List: linux-hwmon@vger.kernel.org

On 22/07/2019 21:23, Guenter Roeck wrote:
> On Mon, Jul 22, 2019 at 08:46:53PM +0300, Marcel Bocu wrote:
>> It would seem like model 70h is behaving in the same way as model 30h,
>> so let's just add the new F3 PCI ID to the list of compatible devices.
>>
>> Unlike previous Ryzen/Threadripper, Ryzen gen 3 processors do not need
>> temperature offsets anymore. This has been reported in the press and
>> verified on my Ryzen 3700X by checking that the idle temperature
>> reported by k10temp is matching the temperature reported by the
>> firmware.
>>
>> Vicki Pfau sent an identical patch after I checked that no-one had
>> written this patch. I would have been happy about dropping my patch but
>> unlike for his patch series, I had already Cc:ed the x86 people and
>> they already reviewed the changes. Since Vicki has not answered to
>> any email after his initial series, let's assume he is on vacation
>> and let's avoid duplication of reviews from the maintainers and merge
>> my series. To acknowledge Vicki's anteriority, I added his S-o-b to
>> the patch.
>>
>> v2, suggested by Guenter Roeck and Brian Woods:
>>   - rename from 71h to 70h
>>
>> Signed-off-by: Vicki Pfau <vi@endrift.com>
>> Signed-off-by: Marcel Bocu <marcel.p.bocu@gmail.com>
>> Tested-by: Marcel Bocu <marcel.p.bocu@gmail.com>
>>
> Applied to hwmon-next.
> 
> Note that I made a small change to the description of each patch:
> 
> s/ he / she /
> s/his/her/

Thanks! I'll go find my brown bag and repeat 100 times "don't assume
gender!".

Now, let's see if we can find more sensors to expose :)

Marcel

> 
> Guenter
> 

