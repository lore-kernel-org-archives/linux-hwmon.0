Return-Path: <SRS0=Oktm=EO=vger.kernel.org=linux-hwmon-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.3 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,NICE_REPLY_A,
	SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1 autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B46B1C388F9
	for <linux-hwmon@archiver.kernel.org>; Sun,  8 Nov 2020 16:35:56 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 71F25206ED
	for <linux-hwmon@archiver.kernel.org>; Sun,  8 Nov 2020 16:35:56 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ud/x+EBA"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728068AbgKHQf4 (ORCPT <rfc822;linux-hwmon@archiver.kernel.org>);
        Sun, 8 Nov 2020 11:35:56 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57450 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727958AbgKHQfz (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>); Sun, 8 Nov 2020 11:35:55 -0500
Received: from mail-oi1-x233.google.com (mail-oi1-x233.google.com [IPv6:2607:f8b0:4864:20::233])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 50464C0613CF
        for <linux-hwmon@vger.kernel.org>; Sun,  8 Nov 2020 08:35:54 -0800 (PST)
Received: by mail-oi1-x233.google.com with SMTP id o25so6572990oie.5
        for <linux-hwmon@vger.kernel.org>; Sun, 08 Nov 2020 08:35:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=sender:subject:to:references:from:autocrypt:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=Rz0gMn0YTO9DXao+SKW+OBW9sRfd1++7HLgdRN1/ePk=;
        b=ud/x+EBAl9mUdL2XgVvLS8xvs8j7ScUMBHsmW8gTlxH3p1Ebmvi/PDW7Nbd5o+L8c9
         4yhrm/nN+mO8ZQP0ZR9LS7c5rW0TiqjGUmdKBG0fx0JuMh63x6f1JA8Dx4TXCvA9v+Nr
         Dp7DGTXlPLYv+7Kqk8O3iwBb0ImEJJvV2SMm9WxfFEdrwMx1wflnPnfVc6TaV+1GceP8
         p9IUJN4+qCMTHj2wzetJPhFaSuI+hWTwJmFt3DZEtYl0P27Y+Aecxn/eihFoN2EfORgV
         aBTMgR1w6spJwvE7eXTwsXO1Xr3OK1TuXdG5YdnM3r15tys3ahsG/aNYOp0G3F+T0WWt
         o+XA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:sender:subject:to:references:from:autocrypt
         :message-id:date:user-agent:mime-version:in-reply-to
         :content-language:content-transfer-encoding;
        bh=Rz0gMn0YTO9DXao+SKW+OBW9sRfd1++7HLgdRN1/ePk=;
        b=X7I7C9gqS/S9Ns0ppW0rok+I03jEwFWSKftHpQlvhI67lGo5zgCSVReYFnYdPnnG1F
         WcghIvEQmsWo+IcZ0wj3PxlGxdriAPsjXRoNZdQ1nLH9EZLNSjCnAlxIHnTus6EFq9P8
         qzoN79QWw8kuJaE/ChVJZ4htmsWMQKnCA4sBJ1TvK0MAgr4MI1ilusqwX3LDmS3sSvJY
         YGoSKMHbYRcsX2+SKuYk3eOnfQA/3eBtox+CRwcFOOMZ1tlgx7+/OBq1/3CEpA7ZI15Z
         8ksdUT0QalQU49B8n16q2dV4glps/A/KiSsIa99ihVS3WY6Hcnfl17kxA05bsLd1jGiI
         LrBg==
X-Gm-Message-State: AOAM53366L0MpZXVmyUIQkP24jaT1yTt4oM01PVGi3ck9vBRgvIuHzJY
        DrKPCqbQqrZ15qpp/jdZIbL6RnoqoaU=
X-Google-Smtp-Source: ABdhPJzBF7gBt1u6mhVLNrnXVWmH0LCquxXIEx7Njw2vDuv82ZmDcSm5n1981mYMrlvWUbuHpzYHhg==
X-Received: by 2002:aca:d6ce:: with SMTP id n197mr6015616oig.151.1604853353536;
        Sun, 08 Nov 2020 08:35:53 -0800 (PST)
Received: from server.roeck-us.net ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
        by smtp.gmail.com with ESMTPSA id t199sm1817480oif.25.2020.11.08.08.35.52
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 08 Nov 2020 08:35:53 -0800 (PST)
Sender: Guenter Roeck <groeck7@gmail.com>
Subject: Re: applesmc Battery charge limiter
To:     Brad Campbell <lists2009@fnarfbargle.com>,
        linux-hwmon@vger.kernel.org
References: <0831391e-e8d0-1398-d835-a14d7ac0a310@fnarfbargle.com>
From:   Guenter Roeck <linux@roeck-us.net>
Autocrypt: addr=linux@roeck-us.net; keydata=
 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
 mDW4+i+XlNFUPUYMrIKi9joBhu18ssf5i5Q=
Message-ID: <9ea3b3e0-3133-d440-9bb7-f34009581882@roeck-us.net>
Date:   Sun, 8 Nov 2020 08:35:52 -0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <0831391e-e8d0-1398-d835-a14d7ac0a310@fnarfbargle.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-hwmon.vger.kernel.org>
X-Mailing-List: linux-hwmon@vger.kernel.org

On 10/25/20 11:43 PM, Brad Campbell wrote:
> G'day all,
> 
> As has been recently documented on loads of Mac forums, it turns out that some older Macbook hardware can set the SMC to stop charging at an arbitrary battery charge level.
> On supported machines this is the BCLM SMC key. I've also found that on my MacbookPro 11,1 the BFCL key sets the threshold at which the SMC changes the charging led from orange to green (that doesn't seem to be documented anywhere).
> 
> On my machine I set them to 4b & 4a respectively, and the battery stops charging at ~75% and the led goes green. I boot into OSX and use smcutil to set this, but it sticks until either a firmware update or SMC reset and hasn't caused an issues in Linux with suspend or hibernate for the month or so I've had it working.
> 
> I've been considering adding this to the applesmc driver, but as it tends to take me inordinate amounts of time to do this stuff I thought I'd ask before I start :
> 
> - Would it likely be accepted?
> - Apple seems to set BFCL at ~5% less than BCLM. Would it be policy to do similarly arbitrary, or should the keys be exposed independently?
> 
> I'm happy to do a bit of work and put some patches forward, but I'd rather gauge interest and get some direction before I start.
> 

How do you suggest to make those changes ? If it fits into some other subsystem
(probably power, modeled as charger) it might be worth considering, but we
really don't need any more non-standard code in this driver.

Thanks,
Guenter

> My VAIO had this 10 years ago so it's nice to see Apple catch up, even if the functionality has been there but hidden for years.
> 
> Regards,
> Brad

