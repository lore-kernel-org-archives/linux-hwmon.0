Return-Path: <linux-hwmon-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-10.3 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	MENTIONS_GIT_HOSTING,NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1A59CC07E96
	for <linux-hwmon@archiver.kernel.org>; Wed,  7 Jul 2021 01:51:08 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id E71DA61CB2
	for <linux-hwmon@archiver.kernel.org>; Wed,  7 Jul 2021 01:51:07 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229953AbhGGBxq (ORCPT <rfc822;linux-hwmon@archiver.kernel.org>);
        Tue, 6 Jul 2021 21:53:46 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41478 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229949AbhGGBxq (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>); Tue, 6 Jul 2021 21:53:46 -0400
Received: from mail-oi1-x22a.google.com (mail-oi1-x22a.google.com [IPv6:2607:f8b0:4864:20::22a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 314F0C061574
        for <linux-hwmon@vger.kernel.org>; Tue,  6 Jul 2021 18:51:07 -0700 (PDT)
Received: by mail-oi1-x22a.google.com with SMTP id t3so1591221oic.5
        for <linux-hwmon@vger.kernel.org>; Tue, 06 Jul 2021 18:51:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=sender:subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=8QxqxI5LQdeUvPwpJ7a80+L/+OpYgkHhFxwW1iKGh7E=;
        b=f3HWIZO+kG8RRiCQlragIj3WmswvO6Zz2P+/Rm4tSlsie/zl/7MHMfhyreE5Mnkc8T
         J4KiqDgtsvQ6/elRccMq9kDrP7v2UfXFx1NILG8tPkFMn9TXZUXifgb6RFYbcY+Q/hki
         GsJqM/RPVzwHzNOL4vsyin82uKCTnIuV/YJ4W/s6OvFmU9QIVy3f/A2HHEnbRdzTLO4b
         wcCWgaMR9NbEmvg+dEaK+8S7VXAH3hTnE+NIJB78As8hgpqqwtWJ4YRNkA1XqTDWsSR+
         ekBOrnSFeCf9z+z0gLrLFvJPi6fBOEHYuKqX78Q1fv1q+jpFhADbw+EXFppIko/qKAcv
         veBg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:sender:subject:to:cc:references:from:message-id
         :date:user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=8QxqxI5LQdeUvPwpJ7a80+L/+OpYgkHhFxwW1iKGh7E=;
        b=KVVWs8KmvVwdpT2l7+t9/wNb0A586PnHTAv0LsEazOyotFmnVwLB3C/TlFySwdXRF/
         OPAY5TaOOdsOJwVo+volrT1r71+ehGSBr8sPFpsLenwerFAXcNbfnwAiX/EXegZTgbtj
         8vMis6uA1l/RmnUqLiak72vHEEvo6vuenjDnc91DgyHx9PWXDnMxU2tqc2bPL6kWT6e5
         4dLkg1u6Wum/SFHDZZRwgCtB1RS14lqGILTm6+pw/FCgG2jTvyMTFFI39dpP9vts3D0k
         1wJD40CVShppk2siRpqoTpel1QgghqTYrh1HFd/4e01SaQN6MGIx8lb/laqp2TpLUENc
         5a0g==
X-Gm-Message-State: AOAM530rQhQaB+lhoiMrz5MHQfjJebyMX3vA8jG3WEUYCNaMrliCIkaD
        XNa8K40x8YC3BBdlrrtcTbXaNZRSlvs=
X-Google-Smtp-Source: ABdhPJzw3X8v0IHi4EgxL8klccH4i3RWWXQBWsXh7XXw1kl80z9nd9GqBFgU/oWqprjW/3d3oyijJw==
X-Received: by 2002:aca:af57:: with SMTP id y84mr2894997oie.138.1625622666251;
        Tue, 06 Jul 2021 18:51:06 -0700 (PDT)
Received: from server.roeck-us.net ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
        by smtp.gmail.com with ESMTPSA id n1sm3217347ooj.42.2021.07.06.18.51.03
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 06 Jul 2021 18:51:04 -0700 (PDT)
Sender: Guenter Roeck <groeck7@gmail.com>
Subject: Re: PATCH: HWMON: (nct6775) Correct number of inputs on NCT6796D
To:     Henk <henk.vergonet@gmail.com>
Cc:     linux-hwmon@vger.kernel.org
References: <CAMFK4TN9jcvwkdBdX1E4zH2NzS0LbCFqGW+MUzCKXor=4UwoBw@mail.gmail.com>
 <f3106f6d-1fa0-129f-28a2-9a85b5f9c453@roeck-us.net>
 <CAMFK4TMzZVAKdbJRMvUHdO3m+V1pNk59PyLXSxPkPFCsgr-rPg@mail.gmail.com>
From:   Guenter Roeck <linux@roeck-us.net>
Message-ID: <e46d1215-121a-7480-cfa7-38d3f4bc0444@roeck-us.net>
Date:   Tue, 6 Jul 2021 18:51:02 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <CAMFK4TMzZVAKdbJRMvUHdO3m+V1pNk59PyLXSxPkPFCsgr-rPg@mail.gmail.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-hwmon.vger.kernel.org>
X-Mailing-List: linux-hwmon@vger.kernel.org

On 7/6/21 6:40 PM, Henk wrote:
> Thank you Guenter,
> 
> This should be fixed now, here is a reading from the sensors output
> without any scaling done:
> 
> $ sensors
> nct6796-isa-0290
> Adapter: ISA adapter
> ...
> in15 VIN9:   840.00 mV
> ...
> 
> Changes available on: https://github.com/hvegh/linux.git
> 
> Op ma 5 jul. 2021 om 16:47 schreef Guenter Roeck <linux@roeck-us.net>:
>>
>> As for the patch itself, it doesn't define the limit register addresses
>> in NCT6775_REG_IN_MAX[] and NCT6775_REG_IN_MIN[], and it doesn't define
>> the register address itself in NCT6779_REG_IN[]. That means it won't work.
>>
>> Guenter

This is not an acceptable patch format.

Guenter
