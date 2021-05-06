Return-Path: <linux-hwmon-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-10.3 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	MAILING_LIST_MULTI,NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 581CFC433ED
	for <linux-hwmon@archiver.kernel.org>; Thu,  6 May 2021 02:04:54 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 218A0613C7
	for <linux-hwmon@archiver.kernel.org>; Thu,  6 May 2021 02:04:54 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230033AbhEFCFu (ORCPT <rfc822;linux-hwmon@archiver.kernel.org>);
        Wed, 5 May 2021 22:05:50 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:51798 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229488AbhEFCFu (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>); Wed, 5 May 2021 22:05:50 -0400
Received: from mail-oi1-x22c.google.com (mail-oi1-x22c.google.com [IPv6:2607:f8b0:4864:20::22c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 351F1C061574
        for <linux-hwmon@vger.kernel.org>; Wed,  5 May 2021 19:04:53 -0700 (PDT)
Received: by mail-oi1-x22c.google.com with SMTP id u16so4105625oiu.7
        for <linux-hwmon@vger.kernel.org>; Wed, 05 May 2021 19:04:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=sender:subject:to:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=OAeaEKIglNyg6aettpjmC0fCuPP3VKAxWJDYSH1t8fQ=;
        b=CEZUw7kOtdHvHUcltn+c1kH8eweTkLuHKqYGyAjomSFeSnb9sRxWtRrQcz+6CfK1zA
         XfZ5JopFHmbKK/GMgiD7R9hImypXZ9LUEueWLJJ4+SVcHDxWM89+OVqy/jIYyEuKF3hp
         veOuNhHh7LC3B3UReii4LgFVW4WNZf53ineEhIhu4QqAsSbyMxh30af6q0o2jhH5avmz
         xPVQo42gB1r8TchtwvIFxpE1Tjy3a3DtQfzOsfUmi1SHs5zx4wWTjtynOiF20jzEoSv2
         CtEitxSNE8SK2xTnPObDcGlG4pKqTAFHAS8ILkktBI6qQubMyIIYkwFl3gMsZ+15eZ1Y
         GXjw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:sender:subject:to:references:from:message-id
         :date:user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=OAeaEKIglNyg6aettpjmC0fCuPP3VKAxWJDYSH1t8fQ=;
        b=qj8/UMeT5H7VsV1V6NgLDUmiBHt4QFI7OJ1qAj4FNpATQu3A+NBvDHyXHbuO4Yt7uI
         sp3vZTIFjUaPhVktB7yo1XebuTRskGfoitGKKSIfv43PQTEIuYsofujeRyljjUhImko2
         tkm9W48lMbryQd3jmqZnIzdFaS+zuEHwidAo/YGNEJSXDtSAeifcHIVq1wjwS9G5CC8Y
         b4jMNSYzsTK16nAg7ZCzNZ/OLEYvdo/ouml4yM0K+O9L1S+/k3dJlWZ9L+yLvbHinTUC
         hB5Q/CLNkSkxtNl2VVns7aCGUI9DY4rEsU8XP0nWzY1+wpd/Z+2DwjgA/sjNk3zbRPht
         IWRQ==
X-Gm-Message-State: AOAM530Zkz16cCntnrmgFDTcXn1MoQunBPaPSs/fDdxC0fmqJiovhl/0
        RUCJWGJi6/pDmz3TwUa9UY9VXH6e5HU=
X-Google-Smtp-Source: ABdhPJz/AWpDDKY/DlVSrnT3Fb7hxVFENoS1VUHbjnFIriOhBgoBOvCSThk2LMhnBpXzvCCqHW6A8Q==
X-Received: by 2002:aca:409:: with SMTP id 9mr9060726oie.179.1620266692431;
        Wed, 05 May 2021 19:04:52 -0700 (PDT)
Received: from server.roeck-us.net ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
        by smtp.gmail.com with ESMTPSA id i17sm194031oie.36.2021.05.05.19.04.51
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 05 May 2021 19:04:52 -0700 (PDT)
Sender: Guenter Roeck <groeck7@gmail.com>
Subject: Re: [PATCH] hwmon: (nct6775) Support access via Asus WMI
To:     Bernhard Seibold <mail@bernhard-seibold.de>,
        linux-hwmon@vger.kernel.org
References: <523324cb-4e9d-c8f3-abe1-94158368aa45@bernhard-seibold.de>
From:   Guenter Roeck <linux@roeck-us.net>
Message-ID: <08262b12-4345-76a9-87be-66d630af3a59@roeck-us.net>
Date:   Wed, 5 May 2021 19:04:50 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.1
MIME-Version: 1.0
In-Reply-To: <523324cb-4e9d-c8f3-abe1-94158368aa45@bernhard-seibold.de>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-hwmon.vger.kernel.org>
X-Mailing-List: linux-hwmon@vger.kernel.org

On 5/5/21 1:12 PM, Bernhard Seibold wrote:
> Support accessing the chip via Asus WMI. This enables the driver to work
> on boards where the IO region is reserved by ACPI.
> 
> Signed-off-by: Bernhard Seibold <mail@bernhard-seibold.de>
> Tested-by: Artem S. Tashkinov <aros@gmx.com>

No, this makes the driver unmaintainable. There should be a separate
driver which only makes WMI/ACPI accesses for everything.

Guenter
