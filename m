Return-Path: <linux-hwmon-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-12.2 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	MAILING_LIST_MULTI,NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_SANE_1 autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C77A6C433F5
	for <linux-hwmon@archiver.kernel.org>; Tue, 21 Sep 2021 12:45:47 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id A317061168
	for <linux-hwmon@archiver.kernel.org>; Tue, 21 Sep 2021 12:45:47 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232725AbhIUMrP (ORCPT <rfc822;linux-hwmon@archiver.kernel.org>);
        Tue, 21 Sep 2021 08:47:15 -0400
Received: from smtp-relay-internal-0.canonical.com ([185.125.188.122]:46820
        "EHLO smtp-relay-internal-0.canonical.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S232667AbhIUMrO (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>);
        Tue, 21 Sep 2021 08:47:14 -0400
Received: from mail-wr1-f70.google.com (mail-wr1-f70.google.com [209.85.221.70])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
        (No client certificate requested)
        by smtp-relay-internal-0.canonical.com (Postfix) with ESMTPS id CF96A40265
        for <linux-hwmon@vger.kernel.org>; Tue, 21 Sep 2021 12:45:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canonical.com;
        s=20210705; t=1632228344;
        bh=x+m58rfACSvR6iQfy7mRWz1qBo1Tu3pMG+mU6G2XjQQ=;
        h=Subject:To:Cc:References:From:Message-ID:Date:MIME-Version:
         In-Reply-To:Content-Type;
        b=c0uzjxBjho4oJqVHsuHSrHHEDTP6VZaTmoQBor+n7TnxQIBYnFeWAFxj7fBw08kSG
         ej9JDjfqdd9bSrq0Ju9HPZU03SJsjPolt7ZnDIb4qoKnSsjj407Ym9qXovUICQwFul
         R6czjCeXaPJvjEIPArXId7kFK01m8bp8gopRoYm5TkKRXnpWET2yH6wAOFSAGvWiLf
         lfmEh3YsgEEaGJPTL3RAw+ZsnTjC/40+tSrlzfbo2+xuk9MZzUKpv77pOxHeAGycqB
         Wz3FQt35f4zAgcHN4LLsK7WTX4dRKVFFh3qzmRYw47HViwFbnu/TmU9CKhHR0QD0h/
         fOFL7FO9W5RMA==
Received: by mail-wr1-f70.google.com with SMTP id r15-20020adfce8f000000b0015df1098ccbso8727248wrn.4
        for <linux-hwmon@vger.kernel.org>; Tue, 21 Sep 2021 05:45:44 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=x+m58rfACSvR6iQfy7mRWz1qBo1Tu3pMG+mU6G2XjQQ=;
        b=5qzflMhkermFkcJolRfwgqzIk2SEhr1cUKjHeBzgJ/vYLsO5QI1NkKCVXiIu/GfV2f
         0KH3g94y4ttbID00HYUhD22Nvdo//YYByQqz3A43g7T4VDqcjNqif12eGFOJ+mAaD3Lh
         G3BSFXHxjE3VUh7pNRLxU6mFWNOeI3EaW5aWgv/Lq2KbdZgG89sQZ8X8wIbDXnfWdJF5
         fWTCbu5yRFwiPSIzFlMkADiHcpyP9OM7J697LG+AKzHZAjCsXLFTyRZ/q612tA/7Dk/K
         ttZKyAuu/JVRumseCqEKFHN4nJPKmO2FH50O+xxC+uMm50B3OTg8BNO7NvOLnhwIgnNw
         J3Kw==
X-Gm-Message-State: AOAM533yN47GW4wAM6M1u8Pmwt7fvd3pEBMuGMqujzeE1ap5hU+FTiYE
        ytBy9CgpbyaWoR/m29uUs9IqfTQQMObtDlaZ9TNdDuF1NgL+lIXwUMOu4EU39h9jKd+Ytdyh5m4
        +d+wjpyOxNs5ClegWApLnssGDuAf45pJvpTLJWvwB
X-Received: by 2002:a5d:5241:: with SMTP id k1mr3414709wrc.227.1632228344494;
        Tue, 21 Sep 2021 05:45:44 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxsq8DcEHNcAQrcIhXF4twIUhJPCUEGGHedfLeapLf2ovbo5mKFT3yWsUISrtvdOhTPrtjt7Q==
X-Received: by 2002:a5d:5241:: with SMTP id k1mr3414694wrc.227.1632228344328;
        Tue, 21 Sep 2021 05:45:44 -0700 (PDT)
Received: from [192.168.0.134] (lk.84.20.244.219.dc.cable.static.lj-kabel.net. [84.20.244.219])
        by smtp.gmail.com with ESMTPSA id s3sm17665260wra.72.2021.09.21.05.45.42
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 21 Sep 2021 05:45:43 -0700 (PDT)
Subject: Re: [PATCH 3/6] dt-bindings: hwmon: ibm,cffps: move to trivial
 devices
To:     Guenter Roeck <linux@roeck-us.net>
Cc:     Jean Delvare <jdelvare@suse.com>, Rob Herring <robh+dt@kernel.org>,
        Jiri Kosina <trivial@kernel.org>,
        Jonathan Cameron <Jonathan.Cameron@huawei.com>,
        linux-hwmon@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20210921102832.143352-1-krzysztof.kozlowski@canonical.com>
 <20210921102832.143352-3-krzysztof.kozlowski@canonical.com>
 <20210921123025.GC1043608@roeck-us.net>
From:   Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
Message-ID: <68fa27ae-4704-181f-e2f6-92635865798b@canonical.com>
Date:   Tue, 21 Sep 2021 14:45:42 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.13.0
MIME-Version: 1.0
In-Reply-To: <20210921123025.GC1043608@roeck-us.net>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-hwmon.vger.kernel.org>
X-Mailing-List: linux-hwmon@vger.kernel.org

On 21/09/2021 14:30, Guenter Roeck wrote:
> On Tue, Sep 21, 2021 at 12:28:29PM +0200, Krzysztof Kozlowski wrote:
>> The IBM Common Form Factor Power Supply Versions 1 and 2 bindings are
>> trivial, so they can be integrated into trivial devices bindings.
>>
>> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
> 
> I won't accept any of those "move to trivial devices" patches. In many cases
> the bindings are simply incomplete. I can not and will not make that call,
> and I always did and will leave it up to driver authors to decide if they
> want to add a device to trivial devices or provide explicit bindings.
> 
> Please stop sending those patches.
> 

Back in the older times, there were no trivial-devices and checkpatch
plus maintainers required documenting compatibles, so some of such
simple bindings were created.

I understand however your point, fair enough. I'll stop sending such
patches.

Best regards,
Krzysztof
