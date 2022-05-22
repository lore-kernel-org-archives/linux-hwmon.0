Return-Path: <linux-hwmon-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B5E60C433F5
	for <linux-hwmon@archiver.kernel.org>; Sun, 22 May 2022 15:00:25 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S245431AbiEVPAZ (ORCPT <rfc822;linux-hwmon@archiver.kernel.org>);
        Sun, 22 May 2022 11:00:25 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35794 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232611AbiEVPAY (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>);
        Sun, 22 May 2022 11:00:24 -0400
Received: from mail-oa1-x29.google.com (mail-oa1-x29.google.com [IPv6:2001:4860:4864:20::29])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 405DB2D1D7;
        Sun, 22 May 2022 08:00:23 -0700 (PDT)
Received: by mail-oa1-x29.google.com with SMTP id 586e51a60fabf-f1d2ea701dso15483205fac.10;
        Sun, 22 May 2022 08:00:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=sender:message-id:date:mime-version:user-agent:subject
         :content-language:to:cc:references:from:in-reply-to
         :content-transfer-encoding;
        bh=0Jo5YhOwkkc99kqIEMnGb7pPmgYj0ra5sX4Uh/i+G4E=;
        b=B9eF5AlevrQ/4k48TriAScT7HsuzFVL21EQEp0EFpGjFbbyjtQeWRR5lM8cjQhosOA
         aE4xsjwF92pb/hop1xJoM3OkVwyndfdZzisDoaKVYq6P2xq3rBv7b4zIvYHCPFlkUa7g
         MJevUqkPO+icG/PRzcHmfu63bqGifs0FvcED+fLrZm0yHNKA5jQGOVVnZZCgh1pLysjJ
         gwyCrtP34FEoQvYLecSpk5awek6xZEyFk8MmZ5MFtOMKHO/MtzxdJUxqsTcmlDkbLMHm
         tPnOsd6RKqaMSPEr3fQpz28tgAR0SYzMKOa2m6poiRHsKIKpbLfw4s+LKXzyvGzNZgOg
         /Owg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:sender:message-id:date:mime-version:user-agent
         :subject:content-language:to:cc:references:from:in-reply-to
         :content-transfer-encoding;
        bh=0Jo5YhOwkkc99kqIEMnGb7pPmgYj0ra5sX4Uh/i+G4E=;
        b=EA2vtIc+59S6DsKABbxOv0hf+iCHQjfl3FMO+cMN3KrBgBM0n19tSoS1siXCq504aE
         aJBYjhVm8WUpIWs3//0mAugiupCpSa1/qK+vNS5RY0x9R8qBJ+GPomBvrayoUYD9m1TG
         pae4XmDhGKOgiS5xuENTzfjzNitMJrhNXhTlCayL0blpGR3HtohVyheMVgMD9mIDeuaI
         VlJ5vYRsLvmRjhbRcVgjwfcHiUye49YtqOoDvXIYpd1EMSyTxbyEYg6Cgzy/HJqVr0Ud
         cWZfgrsTebHsuu2v4k6sbldfpoih8K7FFnfWt3P7JRmrrRq7TDjM0X5/lQHerPiF3MbK
         rH0A==
X-Gm-Message-State: AOAM5337y1oa1FxelMjSn6RPtBz8At/V7lYGsnT2OKHGpYTctgaKuzqX
        X4YtWPPDf3oYrT/jqe7DQe8=
X-Google-Smtp-Source: ABdhPJwLBoJNBBAWn2q5XYLsslW9a5qrOz3VbF+fgrzLWT6kUUuURpWUnuoCD7sxDHZQV7Y2GYbeVw==
X-Received: by 2002:a05:6870:559b:b0:df:b72:d66f with SMTP id n27-20020a056870559b00b000df0b72d66fmr9581564oao.122.1653231621735;
        Sun, 22 May 2022 08:00:21 -0700 (PDT)
Received: from ?IPV6:2600:1700:e321:62f0:329c:23ff:fee3:9d7c? ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
        by smtp.gmail.com with ESMTPSA id x21-20020a05687031d500b000f1ca01a7besm2869023oac.24.2022.05.22.08.00.19
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 22 May 2022 08:00:20 -0700 (PDT)
Sender: Guenter Roeck <groeck7@gmail.com>
Message-ID: <7a9de7a6-b0dd-d696-ee3b-2b1c594e72f7@roeck-us.net>
Date:   Sun, 22 May 2022 08:00:18 -0700
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.8.1
Subject: Re: [PATCH 0/8] Add support for ADT7481 in lm90
Content-Language: en-US
To:     Slawomir Stepien <sst@poczta.fm>
Cc:     linux-hwmon@vger.kernel.org, devicetree@vger.kernel.org,
        jdelvare@suse.com, robh+dt@kernel.org,
        krzysztof.kozlowski+dt@linaro.org, przemyslaw.cencner@nokia.com,
        krzysztof.adamski@nokia.com, alexander.sverdlin@nokia.com
References: <20220520093243.2523749-1-sst@poczta.fm>
 <c1b1f02a-42c2-bc67-ab92-c0bf9dabbe94@roeck-us.net>
 <62a519ee-c909-bdb8-e686-084ffe8a8bcf@roeck-us.net>
 <YopOPSnafQi4n9Y+@t480s.localdomain>
From:   Guenter Roeck <linux@roeck-us.net>
In-Reply-To: <YopOPSnafQi4n9Y+@t480s.localdomain>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-hwmon.vger.kernel.org>
X-Mailing-List: linux-hwmon@vger.kernel.org

On 5/22/22 07:52, Slawomir Stepien wrote:
> On maj 20, 2022 09:01, Guenter Roeck wrote:
>> On 5/20/22 06:45, Guenter Roeck wrote:
>>> On 5/20/22 02:32, Slawomir Stepien wrote:
>>>> From: Slawomir Stepien <slawomir.stepien@nokia.com>
>>>>
>>>> This patch series adds support for ADT7481 in lm90.c driver and extends the
>>>> device-tree options for it.
>>>>
>>>> The ADT7481 is quite similar to MAX6696 (already supported in lm90) so a lot of
>>>> code is reused.
>>>>
>>>> One major problem in fitting the ADT7481 in lm90.c is the chip detection.
>>>> However it seems that the chip has been designed and produced with correct
>>>> values at locations: 0xfe (manufactured id) and 0xff (chip id), but this is not
>>>> documented in the datasheet.
>>>>
>>>
>>> Before we go too far along this route, would you mind using my own patch series
>>> as base to implement the devicetree changes ? I had prepared an extensive
>>> patch series a while ago, adding not only support for ADT7481 but for
>>> several other chips as well, I just never got around to sending it out.
>>>
>>
>> I made my lm90 patch series available in branch hwmon-lm90 of
>> git://git.kernel.org/pub/scm/linux/kernel/git/groeck/linux-staging.git
>>
>> The patches in this series were module tested and tested on real hardware
>> with the test scripts at git@github.com:groeck/module-tests.git;
>> look for scripts/lm90-real.sh and scripts/lm90.sh.
> 
> I will test that out.
> 
> If I would be happy with that branch, should I rebase all my changes based on that branch and send
> the patches to the lists?
> 

Yes, please, only I'll need to send my series first. With the commit
window coming up, I'll do that after I sent my pull request.

Thanks,
Guenter
