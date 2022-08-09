Return-Path: <linux-hwmon-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B0BC6C19F2D
	for <linux-hwmon@archiver.kernel.org>; Tue,  9 Aug 2022 21:29:28 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229740AbiHIV25 (ORCPT <rfc822;linux-hwmon@archiver.kernel.org>);
        Tue, 9 Aug 2022 17:28:57 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35076 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229728AbiHIV20 (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>); Tue, 9 Aug 2022 17:28:26 -0400
Received: from mail-wr1-x434.google.com (mail-wr1-x434.google.com [IPv6:2a00:1450:4864:20::434])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 423136554A
        for <linux-hwmon@vger.kernel.org>; Tue,  9 Aug 2022 14:28:25 -0700 (PDT)
Received: by mail-wr1-x434.google.com with SMTP id j15so15701299wrr.2
        for <linux-hwmon@vger.kernel.org>; Tue, 09 Aug 2022 14:28:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:references:cc:to:subject:from:from:to:cc;
        bh=Rtiba47uHquaHYOrqwmT/iXYHs2FQdugnlHuXrEooPQ=;
        b=VFBiibdp2a1xO4BTmq2kVWHCWYHIn8/s3gEIiwCryQHKsl3Tzx+emnkDJDsopIbVL4
         umMb0NqpB7EOvk1L6gpC5nFwdoUrPvfWaKjtXCifqjnt9G3sPgcC+6ULnkYIsxTwrNLQ
         O2alJTQ6GBuwwkLrso9Jihz9pMXUHP2/XzTOh9TUxUHZjwiWaZLoPwrTkxmE6/BmI3nh
         7NQjIjiJf0rvEg5ycd+DRF7GtpmErQohBJEahO5FS33OEQAvpNMJv9q6OL4rtReh9bhJ
         2adrCaiN/Qxc5aHfSxi11S/i1TYwTUg1UeG7AN4/bRgWQbEvoXnYU/dfKX9PW5U9fv4L
         Pg0A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:references:cc:to:subject:from
         :x-gm-message-state:from:to:cc;
        bh=Rtiba47uHquaHYOrqwmT/iXYHs2FQdugnlHuXrEooPQ=;
        b=lJ3mLsZK9yLo6unFddLeHIcl1KRkDseiprpUq0dBVt2M3z3RpPZNCt2FQ9DPHxZZWj
         XPZod2KdoAHpFIPaJxO1Jpg5vDTPz/NKfk7r6CNO6AfjjPrxvs1uhC0yBNt4OzVJtAVO
         22RwH8KqQnW+fs+Yw/8FsqbcWumPJws2QzSqqf58wz2dLKb88voq0sG8kCCpb7hcRQO4
         lkNrOJAX+Reunh0dgQgStJ4gIGjQvs4M0YRy+fb6K1hwKANjpFY/HioZZjRg/saMZpQd
         /W/hOdhjkLrW4sXSdwoji7fnRakG//sbyAjlrueAIvmeOcgEnZS3o2IQTfquwZCWinMn
         Xzdw==
X-Gm-Message-State: ACgBeo17GFFIXyxSir/lkI9oGZqcSF6DDTtfuwGaTjbKFqLKM2hbSkHE
        IkxHvFUiOEASvCXszndn7kXu8sOCd1Q=
X-Google-Smtp-Source: AA6agR49A1yP1KDYeGE3SW0+8ovuvdY5Izh9yVYA5Fk1pX18p1cCMv6Nw/Yr48SHK3Pkun3EAWVvWg==
X-Received: by 2002:adf:d238:0:b0:21e:c972:7505 with SMTP id k24-20020adfd238000000b0021ec9727505mr15823642wrh.536.1660080503687;
        Tue, 09 Aug 2022 14:28:23 -0700 (PDT)
Received: from ?IPv6:fd00:835b:d940:d4fc::6? (2a01-036c-0116-43ce-0000-0000-0000-0006.pool6.digikabel.hu. [2a01:36c:116:43ce::6])
        by smtp.gmail.com with ESMTPSA id t28-20020adfa2dc000000b0021f17542fe2sm14678586wra.84.2022.08.09.14.28.22
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 09 Aug 2022 14:28:22 -0700 (PDT)
From:   "=?UTF-8?B?Wm9sdMOhbiBLxZF2w6Fnw7M=?=" <dirty.ice.hu@gmail.com>
X-Google-Original-From: =?UTF-8?B?Wm9sdMOhbiBLxZF2w6Fnw7M=?= <DirtY.iCE.hu@gmail.com>
Subject: Re: PROBLEM: NCT6775: suspend doesn't work after updating to Linux
 5.19
To:     Zev Weiss <zev@bewilderbeest.net>
Cc:     Guenter Roeck <linux@roeck-us.net>, linux-hwmon@vger.kernel.org
References: <f5990ef1-4efe-d2b1-8e50-c6890526c054@gmail.com>
 <YvLJ9TQeXP/miUgT@hatter.bewilderbeest.net>
Message-ID: <03c9bdca-846e-cd47-f628-6fc38bd0c27b@gmail.com>
Date:   Tue, 9 Aug 2022 23:28:20 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:4.8) Goanna/20220224
 Interlink/52.9.8090a1
MIME-Version: 1.0
In-Reply-To: <YvLJ9TQeXP/miUgT@hatter.bewilderbeest.net>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-hwmon.vger.kernel.org>
X-Mailing-List: linux-hwmon@vger.kernel.org

On 2022-08-09 22:56, Zev Weiss wrote:
> On Tue, Aug 09, 2022 at 01:27:48PM PDT, Zoltán Kővágó wrote:
>> Hi,
>>
>> [1.] One line summary of the problem:
>> NCT6775: suspend doesn't work after updating to Linux 5.19
>>
>> [2.] Full description of the problem/report:
>> After updating my kernel from 5.18.11 to 5.19, I've noticed that 
>> resuming after suspend no longer works: fans start up, then about a 
>> second later, the computer just shuts down, leaving the USB ports 
>> powered up (normally it turns them off on shutdown). The screens don't 
>> turn on during this timeframe, so I can't see any useful log messages.
>>
>> Bisecting between 5.18 (where it still worked) and 5.19 lead me to 
>> commit c3963bc0a0cf9ecb205a9d4976eb92b6df2fa3fd "hwmon: (nct6775) 
>> Split core and platform driver" which looks like a refactor commit, 
>> but apparently it broke something.
>>
> 
> Hi Zoltán,
> 
> Thanks for the thorough bug report.  You're right that that commit was 
> essentially just a refactor, though there was one slight change to the 
> nct6775_suspend() function introduced during the review process that may 
> perhaps have had some subtle unintended side-effects.
> 
> Can you test the following patch and report if it resolves the problem?
> 
> 
> Thanks,
> Zev

Hi Zev,

Thanks for the quick reply. Yes, it looks like your patch does solve the 
problem (I've applied it on top of 5.19 (after fighting with my mail 
client for a while) and suspended a few times, it's working so far).

Regards,
Zoltan
