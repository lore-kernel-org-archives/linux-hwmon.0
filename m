Return-Path: <linux-hwmon-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.3 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,NICE_REPLY_A,
	SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1 autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C2F9AC07E95
	for <linux-hwmon@archiver.kernel.org>; Fri, 16 Jul 2021 15:03:54 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 984AC60FF3
	for <linux-hwmon@archiver.kernel.org>; Fri, 16 Jul 2021 15:03:54 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S240514AbhGPPGt (ORCPT <rfc822;linux-hwmon@archiver.kernel.org>);
        Fri, 16 Jul 2021 11:06:49 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50262 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233094AbhGPPGs (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>);
        Fri, 16 Jul 2021 11:06:48 -0400
Received: from mail-oi1-x22c.google.com (mail-oi1-x22c.google.com [IPv6:2607:f8b0:4864:20::22c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A3937C06175F;
        Fri, 16 Jul 2021 08:03:52 -0700 (PDT)
Received: by mail-oi1-x22c.google.com with SMTP id t25so11170505oiw.13;
        Fri, 16 Jul 2021 08:03:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=sender:to:cc:references:from:subject:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=i3KfiPtO0D3+NC1eT2ingGYsCONu0cw8923pwjmhYSQ=;
        b=u451MZ2w1rN0BBPzCDk0boPfHl0L5+K3zNMzLxmpZUEk2VLbW9jiV5doUQ09oV3H+N
         tfbE5dso8hBZ/yQ97EkZzp0P2xgGdJTPpVz9OtrLSt8tDXqSutH9iP0SZ0NJKhxxkS1K
         WJ7NqXADoU2h9eOJoGHdn9VSOKBbgoVVTVHTNf0pl7NfjIgQPQHz0S5S30f0MgQdgfPk
         WfF1yCIz0Jaa4eEWK9m7VkoHINKF4xVNTbj5oe50TLSIOuEsL7eP3YX46VViEW1j6g2Q
         m/BJpHMq9beKUsDoo9S8ypFk1Aev8/o6RkySatnvZ6higOngqBfNJsU05ZAjInlVQZdT
         pTyA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:sender:to:cc:references:from:subject:message-id
         :date:user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=i3KfiPtO0D3+NC1eT2ingGYsCONu0cw8923pwjmhYSQ=;
        b=tn+Ap9LERvxlwluSqmvY9Z5iWkHFEJtEbqtQTBPx36z3ONy/zZBkuxJWHCGDt1vx62
         9QRwV2TJrRmTqKtpYWZupUL8CsBOj6tpzPvsAmspjsQfZQUKP2UVyvYV5c0VJfOipz7C
         tgdnCmYhVFBAnwQS9upWr9U/x747fqhf/pIzhK5Y1Gchf1wO5/IpQXIk3G2SsBreQhSB
         lrWz8XMaKDsfabMK0gc1lIgu/UOWpsgvLllLa9EsAnjl51lsED8IWvecFO9QhZ5/9JWh
         9tXdILFbUuxkw4vcL7nMHpsMhieMU1nNHiR7xLXMak/qshAhY62b8tw9s7kJ3xHRbcNm
         E1ow==
X-Gm-Message-State: AOAM531l6+ZDgdK4SC0bxU9KdH1cJxB2Ig5XXGwml0C3X3sC1Q3aofrc
        PQD8ks7jUiEpbCcU9W0VpVPMeG5i/eQ=
X-Google-Smtp-Source: ABdhPJwecearIW6I2rzBiXgSYYFG80tvHnkIHUCY7FQPgN2JmoF9av1QqpKjCNrVv+iZ0ggn0U4gkQ==
X-Received: by 2002:aca:1112:: with SMTP id 18mr3902062oir.168.1626447832075;
        Fri, 16 Jul 2021 08:03:52 -0700 (PDT)
Received: from server.roeck-us.net ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
        by smtp.gmail.com with ESMTPSA id z7sm2081846oih.31.2021.07.16.08.03.50
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 16 Jul 2021 08:03:51 -0700 (PDT)
Sender: Guenter Roeck <groeck7@gmail.com>
To:     "Sa, Nuno" <Nuno.Sa@analog.com>
Cc:     Rob Herring <robh@kernel.org>,
        "linux-hwmon@vger.kernel.org" <linux-hwmon@vger.kernel.org>,
        "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
        Jean Delvare <jdelvare@suse.com>
References: <20210708120111.519444-1-nuno.sa@analog.com>
 <20210708120111.519444-4-nuno.sa@analog.com>
 <20210712172656.GA2142233@robh.at.kernel.org>
 <PH0PR03MB63668564A9A7B8F5D6E5F8D499129@PH0PR03MB6366.namprd03.prod.outlook.com>
 <20210715203937.GA3182741@roeck-us.net>
 <PH0PR03MB636641D09289D1F696A64C9299119@PH0PR03MB6366.namprd03.prod.outlook.com>
From:   Guenter Roeck <linux@roeck-us.net>
Subject: Re: [RFC PATCH 3/6] dt-bindings: axi-fan-control: add tacho
 properties
Message-ID: <f6d415a7-e113-1dda-727e-0d645c8114cb@roeck-us.net>
Date:   Fri, 16 Jul 2021 08:03:49 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <PH0PR03MB636641D09289D1F696A64C9299119@PH0PR03MB6366.namprd03.prod.outlook.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-hwmon.vger.kernel.org>
X-Mailing-List: linux-hwmon@vger.kernel.org

On 7/16/21 12:44 AM, Sa, Nuno wrote:
[ ... ]
>>
>> Are you sure you can ever get this stable ? Each fan has its own
>> properties
>> and tolerances. If you replace a fan in a given system, you might get
>> different RPM numbers. The RPM will differ widely from system to
>> system
>> and from fan to fan. Anything that assumes a specific RPM in
>> devicetree
>> data seems to be quite vulnerable to failures. I have experienced that
>> recently with a different chip which also tries to correlate RPM and
>> PWM
>> and fails quite miserably.
>>
>> In my experience, anything other than minimum fan speed is really a
>> recipe
>> for instability and sporadic false failures. Even setting a minimum fan
>> speed
>> is tricky because it depends a lot on the fan.
> 
> I see what you mean. So, I had to go through this process when testing
> this changes because the fan I'm using is different from the default one
> used to develop and stablish the default values in the IP core. The core

Exactly my point.

> provides you with a register which contains the tacho measurements in
> clock cycles. You can read that for all the PWM points of interest
> (with devmem2 for example) and make your own "calibration". I assume
> that people have to go through this process before putting some values
> in the devicetree. I'm aware this is not the neatest process but I guess it's
> acceptable...
> 

Do you really expect everyone using a system with this chip to go through
this process and update its devicetree configuration, and then repeat it
whenever a fan is changed ? Given how dynamic this is, I really wonder
if that information should be in devicetree in the first place.

Guenter
