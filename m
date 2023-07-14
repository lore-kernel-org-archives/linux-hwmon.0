Return-Path: <linux-hwmon-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C2F27C001DF
	for <linux-hwmon@archiver.kernel.org>; Fri, 14 Jul 2023 22:27:07 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229986AbjGNW1H (ORCPT <rfc822;linux-hwmon@archiver.kernel.org>);
        Fri, 14 Jul 2023 18:27:07 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59202 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229914AbjGNW1G (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>);
        Fri, 14 Jul 2023 18:27:06 -0400
Received: from mail-pl1-x631.google.com (mail-pl1-x631.google.com [IPv6:2607:f8b0:4864:20::631])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 0E9242D48
        for <linux-hwmon@vger.kernel.org>; Fri, 14 Jul 2023 15:26:53 -0700 (PDT)
Received: by mail-pl1-x631.google.com with SMTP id d9443c01a7336-1b8ad356fe4so15699015ad.2
        for <linux-hwmon@vger.kernel.org>; Fri, 14 Jul 2023 15:26:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1689373612; x=1691965612;
        h=content-transfer-encoding:in-reply-to:subject:from:references:cc:to
         :content-language:user-agent:mime-version:date:message-id:sender
         :from:to:cc:subject:date:message-id:reply-to;
        bh=KYf7+074zKU5JSmP74Q6cWtarjvwh/yFsj3NY8+swho=;
        b=GlfuH2pnPClvJZ+ZVQbNZm9+IK/TNPFVgYT6nDbkM+NKAdfDTlNF4zZIsMH7quYBJg
         45yPsZm3ZaXl8p4T04lrXOlElNM3n2Ii8CRWVx3izr4SUUU21KUuVs8gXlUQQMZG9kuN
         pz1IDcmREE3LsPN6EVNoxAHi0MX/uzK0WxTfjL0Umw87Ongs5N+qd5db7F6Szg2ABLBJ
         9ZyGcbtXb5dACedNIfmZ/WcIpF9MNWpGybns1YKvUCN9gk5k/TBAcBmqLfKNbaG/Q5B+
         hGFTGvxlp6LMI8gOh4U+q7ceEL5oZkXkIZq+ZqlbyvZkM682sJh1pCUv3q3BTJTBfa6+
         Wkkw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1689373612; x=1691965612;
        h=content-transfer-encoding:in-reply-to:subject:from:references:cc:to
         :content-language:user-agent:mime-version:date:message-id:sender
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=KYf7+074zKU5JSmP74Q6cWtarjvwh/yFsj3NY8+swho=;
        b=bKPr/Qoldtz3mXSe7N9hoZ8WOixdVcIZeIIX8xu4URghkTtJwIL5xJVtp6TzL7UrmY
         41kwmQDQ1jsmK4LljyeF2FZ/oqM7MYQq50X75SkgEK9jUwovP5GD6EHcz0NS/c1cDy2v
         QcoYRv51mK+vwBWvMSgtby/CgyLqa5g/AVhA2A7GopzhfM1qSu1CXLJBO1I8MOiPK9R3
         VJxxER8tPZi2yQdqGhif852JC99D747w6Dg9N1w2HKXTnFZafJ7oCyo0y8Iu+xC+Ra/i
         vbWnWFuy7t99P+24l+PbzMSwuHtsg4QMRaHWhjaIC9NdEX8ugS3W/6u3r5v2PbHPf3jM
         PVcQ==
X-Gm-Message-State: ABy/qLZ4kwZcnlZRuqpzlEkFZS+KIN6AvwCzTT41Icw+JRarJr4UlacB
        O5dZiOvNHGsKTCC3ZNl9yR8=
X-Google-Smtp-Source: APBJJlHJPgZPBAGwgojnBGrY6ozAteVJOJbTSk8fahjqh0WnybX602qlvHcsDiEVaWmhWQhPnNHc+Q==
X-Received: by 2002:a17:90a:a089:b0:263:f590:f231 with SMTP id r9-20020a17090aa08900b00263f590f231mr4235721pjp.26.1689373612376;
        Fri, 14 Jul 2023 15:26:52 -0700 (PDT)
Received: from ?IPV6:2600:1700:e321:62f0:329c:23ff:fee3:9d7c? ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
        by smtp.gmail.com with ESMTPSA id p1-20020a63ab01000000b005348af1b84csm8043257pgf.74.2023.07.14.15.26.50
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 14 Jul 2023 15:26:51 -0700 (PDT)
Sender: Guenter Roeck <groeck7@gmail.com>
Message-ID: <168c418f-4805-4e89-c88c-f08d4157172b@roeck-us.net>
Date:   Fri, 14 Jul 2023 15:26:49 -0700
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.13.0
Content-Language: en-US
To:     Rodrigo Vivi <rodrigo.vivi@kernel.org>
Cc:     "Dixit, Ashutosh" <ashutosh.dixit@intel.com>,
        linux-hwmon@vger.kernel.org, intel-xe@lists.freedesktop.org
References: <20230627183043.2024530-1-badal.nilawar@intel.com>
 <87ilb385fv.wl-ashutosh.dixit@intel.com>
 <5aa93c3a-a4c5-9ca3-6ecd-38cef9f59605@roeck-us.net>
 <874jmme276.wl-ashutosh.dixit@intel.com>
 <d571bfca-9156-7280-a5eb-783c431500c3@roeck-us.net>
 <ZLGuUM2+5OjTCmay@rdvivi-mobl4>
From:   Guenter Roeck <linux@roeck-us.net>
Subject: Re: [Intel-xe] [PATCH v2 0/6] Add HWMON support for DGFX
In-Reply-To: <ZLGuUM2+5OjTCmay@rdvivi-mobl4>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-hwmon.vger.kernel.org>
X-Mailing-List: linux-hwmon@vger.kernel.org

On 7/14/23 13:21, Rodrigo Vivi wrote:
[ ... ]

> Hi Guenter,
> 
> First of all sorry for jumping late here. I'm totally with you here and we should
> definitely only use the new API. For standard entries that will definitely
> reduce the code size.
> 
> So, since we are talking about reducing code here, and looking to other DRM
> drivers, and thinking about the needs on this new Xe driver, I'm wondering
> if you would consider accepting 'frequency' as a standard hwmon attribute.
> 
> We would need it to be RW so we could use to put freq requests as well,
> and possibly different types/domains and even throttle reasons on top.
> 
> So we could then try to unify all the drm drivers in a common drm-hwmon
> layer putting an end in all abuses and deprecated users.
> 
> But before moving fwd with any proposal I'd like to hear your thoughts on
> this 'frequency' block as standard attribute.
> 

I really don't see how this would fit under "hardware monitoring".
Making it writable would be even worse - this is most definitely not a limit but
an actual value. The notion of limit actually shows that it is not a good fit as
a monitoring attribute: I can not conceive the notion of a "maximum" or "minimum"
frequency limit, or an "under" or "over" frequency.

If this is about thermal control/management, you might want to consider registering
with devfreq and the thermal subsystem (see devfreq_cooling_register() and
friends for reference).

Thanks,
Guenter

