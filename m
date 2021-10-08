Return-Path: <linux-hwmon-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C1C9AC433EF
	for <linux-hwmon@archiver.kernel.org>; Fri,  8 Oct 2021 13:11:50 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 9BBEA61038
	for <linux-hwmon@archiver.kernel.org>; Fri,  8 Oct 2021 13:11:50 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S241702AbhJHNNp (ORCPT <rfc822;linux-hwmon@archiver.kernel.org>);
        Fri, 8 Oct 2021 09:13:45 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57310 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S241522AbhJHNNo (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>); Fri, 8 Oct 2021 09:13:44 -0400
Received: from mail-oo1-xc35.google.com (mail-oo1-xc35.google.com [IPv6:2607:f8b0:4864:20::c35])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 9C6AEC061570;
        Fri,  8 Oct 2021 06:11:49 -0700 (PDT)
Received: by mail-oo1-xc35.google.com with SMTP id r1-20020a4a9641000000b002b6b55007bfso728693ooi.3;
        Fri, 08 Oct 2021 06:11:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=sender:to:cc:references:from:subject:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=q1IIoNZrvzr/hNM2qUG7pSqa5Zq3cpShJfrzoqqC0pI=;
        b=iNG0boy5ahfBaBaU5bTlJI+gmvF2knwFpycn11yVC4AcKWlhpPtzeeA6AodEeOinDN
         2YvcFllf2/ney3M/CJ55TenJn+fmIc8dJ7sqGVppW4VWWESBRw77chLmAtCCrk9fOq5s
         KAZI+RZ7k0zWvSfJrNEyJ5INIaZtxY9LXz6/UW1SqY1K5Fs2JK2C5GWaJSly1N23cMwK
         8e+BOz1e63jpbPwZ+UHPbVPLp20NHv+aAc3diPqsnlyGPqtDMjW5vjH6JmUQnmFp94Kv
         zivQYvXLJR7o6RLbKKnRF4FtFOEjwLGmLI5BR9nDKes6Uvf7j54NNVabRyfULK02CigF
         0s4w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:sender:to:cc:references:from:subject:message-id
         :date:user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=q1IIoNZrvzr/hNM2qUG7pSqa5Zq3cpShJfrzoqqC0pI=;
        b=ma4eLP35giC06H5XOLqUis/YFcP8jvv9FhfIxspm0EAnhDQk55WgQqxhG5L+eoLaM4
         ayWdFy13Lkxbm5ufKHJGAjEs6VOyWjiF5Ndbc6FDq44OD2oRZGUhQHzB6RAHfZbLT+Vu
         sb+WVOYEOQkrSGCqYtHIq68GsYSrmv/Qtp0GXjzA6cgYhGOIlOsqXC9MxnPmAWSL6ZCg
         KNmehLU6I90r/SBhdBVC02x7kuvayz0LuiEKKk/qx57qbdCSxklB21L+M6mfZL61dUEf
         FdFzTdYbtmQTB3b5VS7fr10hsxCejOlM94s7CC+Ttvc+/vidjB9TR844m74Qq/YGpRYR
         cu5g==
X-Gm-Message-State: AOAM530pcYWkPWX+pw8k1qVVNQf1uv8UAXLvWILL5+cL7+Rva3lgy+O/
        wn07RfPC7YQj4te/KxxE+0l1GR7KJJk=
X-Google-Smtp-Source: ABdhPJzPIc/aO6gYXmcp99zYUpnx8i+SkATO0WxqHHyIVl6PjnSdtTRzDncrhYDQ53mHQxQNSF0k3Q==
X-Received: by 2002:a4a:d455:: with SMTP id p21mr7958124oos.97.1633698708609;
        Fri, 08 Oct 2021 06:11:48 -0700 (PDT)
Received: from server.roeck-us.net ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
        by smtp.gmail.com with ESMTPSA id m23sm478611oom.34.2021.10.08.06.11.46
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 08 Oct 2021 06:11:47 -0700 (PDT)
Sender: Guenter Roeck <groeck7@gmail.com>
To:     Oskar Senft <osk@google.com>
Cc:     Krzysztof Adamski <krzysztof.adamski@nokia.com>,
        Rob Herring <robh@kernel.org>,
        Jean Delvare <jdelvare@suse.com>,
        Linux HWMON List <linux-hwmon@vger.kernel.org>,
        devicetree@vger.kernel.org
References: <12984255aac11a3edfc0e6278e1a1cac70ce97ec.1631021349.git.krzysztof.adamski@nokia.com>
 <YUkKCe7845uCqoy5@robh.at.kernel.org> <20210921125831.GB1864238@roeck-us.net>
 <CAL_JsqLo=inkKVKSU8N=_h90RfpDk6NNWPKdKyTXh-VvqXDCag@mail.gmail.com>
 <20210921205247.GA2363535@roeck-us.net>
 <CAL_Jsq+NXuF+F7OE3vyEbTUj6sxyMHVWHXbCuPPoFaKjpyZREQ@mail.gmail.com>
 <20210924002951.GA3027924@roeck-us.net>
 <YU2D7L7QMgCJZUeb@localhost.localdomain>
 <20210924114636.GB2694238@roeck-us.net>
 <CABoTLcQYHZbsgzXN7XXKQdDn8S-YsuE+ks9WShAEKcBJojEfcQ@mail.gmail.com>
 <20210925132631.GB1240690@roeck-us.net>
 <CABoTLcTKAn5TVs3wadZQiheeKA5kUGBtMRbFWprRWoqRJV=J9Q@mail.gmail.com>
From:   Guenter Roeck <linux@roeck-us.net>
Subject: Re: [PATCH 8/8] dt-bindings: hwmon: allow specifying channels for
 tmp421
Message-ID: <1fe19e35-972d-c50a-c04f-a3eb4d09e1db@roeck-us.net>
Date:   Fri, 8 Oct 2021 06:11:45 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.13.0
MIME-Version: 1.0
In-Reply-To: <CABoTLcTKAn5TVs3wadZQiheeKA5kUGBtMRbFWprRWoqRJV=J9Q@mail.gmail.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-hwmon.vger.kernel.org>
X-Mailing-List: linux-hwmon@vger.kernel.org

On 10/8/21 5:55 AM, Oskar Senft wrote:
> Hi Guenter
> 
>> Numbering in sysfs is not relevant here; the index should always start with 0.
> Ok, in that case, I'll encode LTD as @0 and RTD1..3 as @1..@3.
> 
>>> In this example, RTD1, RTD2 and LTD would be temperature sensors and
>>> RTD3 would be a voltage sensor.
>>>
>>> Would that make more sense? Is the use of strings acceptable?
>>>
>> I don't think so. I am quite sure that rtd3 is still a temperature,
>> and I am not sure if other sensor types on that chip may need dt
>> configuration.
> Reading the existing nct7802_in_is_visible() and
> nct7802_temp_is_visible() [1] in I read that RTD3 could either be
> voltage or temperature.
> 

Ah yes, you are correct. The same applies to RTD1 and RTD2, actually,
Sorry, it has been too long since I wrote the driver. And it really needs
a conversion to the new hwmon API.

Guenter

> I'll go ahead and propose another patch version on [3] for that.
> 
> [1] https://github.com/torvalds/linux/blob/master/drivers/hwmon/nct7802.c#L778
> [2] https://github.com/torvalds/linux/blob/master/drivers/hwmon/nct7802.c#L679
> [3] https://lore.kernel.org/all/20210921004627.2786132-1-osk@google.com/
> 

