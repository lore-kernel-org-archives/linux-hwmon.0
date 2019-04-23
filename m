Return-Path: <SRS0=5f14=SZ=vger.kernel.org=linux-hwmon-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.8 required=3.0 tests=DKIM_INVALID,DKIM_SIGNED,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_PASS,URIBL_BLOCKED
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id F07C0C10F14
	for <linux-hwmon@archiver.kernel.org>; Tue, 23 Apr 2019 13:29:55 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id BEC55214AE
	for <linux-hwmon@archiver.kernel.org>; Tue, 23 Apr 2019 13:29:55 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="AlEKQpPq"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727305AbfDWN3z (ORCPT <rfc822;linux-hwmon@archiver.kernel.org>);
        Tue, 23 Apr 2019 09:29:55 -0400
Received: from mail-pf1-f193.google.com ([209.85.210.193]:44478 "EHLO
        mail-pf1-f193.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726421AbfDWN3z (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>);
        Tue, 23 Apr 2019 09:29:55 -0400
Received: by mail-pf1-f193.google.com with SMTP id y13so7493185pfm.11
        for <linux-hwmon@vger.kernel.org>; Tue, 23 Apr 2019 06:29:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=sender:subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=MhNKPB0jxEVNxArnrLVpMJoAOx1MoJY+m++OirRqyVE=;
        b=AlEKQpPq3kQGEdW5tAsxsAjS4xqiNKW6KI3bxCFTtBoZbtEvysibjnWLSBq41+PeGK
         RbcGtoPbB1cFvVkeCBZJ8OTUSngxtzSk6aABt4KiwLENZlVeYt2YU/Wx+yQsTwc6E2L9
         ZiQaLynkv57MLVHu6CA0Wu4d6lhG7/tlO4FHDi3aqdGsAkCq8mnGfK7EcVShbNFUXUhr
         8O2Ukw0UhWAKwDnIVvYvod3FMKgrtImVYJ4/1c1AtMLNgqZDsDeIRnUQJJghxj+xk1eo
         4zPat2GcOYeishZsYR9onS1YoG3IItM3d5VhzYj5nvNcgfTdh/sZZRHc9J4Xu6OQ1xGQ
         Q9VQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:sender:subject:to:cc:references:from:message-id
         :date:user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=MhNKPB0jxEVNxArnrLVpMJoAOx1MoJY+m++OirRqyVE=;
        b=cF0fLPzmrWa7mGBapG1xYNXjUHe5pYMitc2ckWWBtnKmK2YE3jU6uoF49bDJ4VnUPD
         ENfHWfLPn7fEBgqv7dU/qUfY9OuXHkERrzZ7+egl5AzE3OhK73byybtbfBsgF7vpe1mn
         GzARoGOfikOuwKn5ACt7Tp1vmkiZKknXlWPQZ9FFDIFbiDaLqfRPRE89Gm6h3N62XSoE
         UgQmduBkQP+L79DWKXxVDX4ZM7BzJP/WLr3kLO4w9+UfANWFj+J8iXtK7MLXYV9SKAHS
         GJK4nuDgk5cLZ1xcrfsZT1MLCeQdIikzSuR8OVmSvp7lV7jFTfS11aC5hZnYbAdQsQjA
         6zeg==
X-Gm-Message-State: APjAAAXvH8Jsth1m9GH9rfT3SH2ep2ez/SKCfjCEQHVrFEDSvF5UYrs7
        4JskBmQ3GfgjyAhUTE6Krkbd96HP
X-Google-Smtp-Source: APXvYqyw3Nsd0dRyjVTfSHtLVDKibQYlcDUZl41Lq6hy92qCtn6cur/ccm749Y0qyTDNUtrh6e+xew==
X-Received: by 2002:a62:1795:: with SMTP id 143mr26497176pfx.104.1556026193975;
        Tue, 23 Apr 2019 06:29:53 -0700 (PDT)
Received: from server.roeck-us.net ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
        by smtp.gmail.com with ESMTPSA id t13sm27402857pgo.14.2019.04.23.06.29.51
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Tue, 23 Apr 2019 06:29:52 -0700 (PDT)
Subject: Re: [PATCH v5] hwmon: max6650: add thermal cooling device capability
To:     Jean-Francois Dagenais <jeff.dagenais@gmail.com>
Cc:     linux-hwmon@vger.kernel.org
References: <201904192317.2UiQUP23%lkp@intel.com>
 <20190420030233.4651-1-jeff.dagenais@gmail.com>
 <20190422134002.GA18419@roeck-us.net>
 <45CE0549-CDB8-4655-8309-CEF449FA0730@gmail.com>
From:   Guenter Roeck <linux@roeck-us.net>
Message-ID: <2a63161b-2b77-ec8c-9321-01accab17579@roeck-us.net>
Date:   Tue, 23 Apr 2019 06:29:51 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.6.1
MIME-Version: 1.0
In-Reply-To: <45CE0549-CDB8-4655-8309-CEF449FA0730@gmail.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Sender: linux-hwmon-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-hwmon.vger.kernel.org>
X-Mailing-List: linux-hwmon@vger.kernel.org

On 4/23/19 5:45 AM, Jean-Francois Dagenais wrote:
> 
>> On Apr 22, 2019, at 09:40, Guenter Roeck <linux@roeck-us.net> wrote:
>>
>> On a system which has CONFIG_THERMAL enabled but does not really utilize
>> it, the call to thermal_cdev_update() will result in the fan being stopped
>> immediately since max6650_set_cur_state() is called with state=0.
>>
>> I see that this function called from pwm_fan.c. It is not called from
>> gpio-fan.c or npcm750-pwm-fan.c. Other than from pwm-fan.c, it is only
>> called from thermal governors, and not from any other thermal drivers
>> registering a thermal cooling device. This leads me to believe that
>> the calls from here and from pwm_fan.c may be wrong.
>>
>> Are you sure that this call needed ? If so, can you explain ?
>> What happens in your system if you remove this call ?
> 
> Yes, you are correct. It is a carry over from pwm-fan.c and so probably wrong
> there too. I have tested without the thermal_cdev_update call in probe() and
> basically, if the cooling device is not part of a TZ, then set_cur_state is
> never called. If part of a TZ, it is called by the governor (step_wise in my
> case) as required and all works as expected.
> 

Excellent - thanks for testing and getting back.

Guenter

