Return-Path: <linux-hwmon-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8CEB7C6FD1D
	for <linux-hwmon@archiver.kernel.org>; Tue,  4 Apr 2023 14:17:50 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235271AbjDDORt (ORCPT <rfc822;linux-hwmon@archiver.kernel.org>);
        Tue, 4 Apr 2023 10:17:49 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44804 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234083AbjDDORr (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>); Tue, 4 Apr 2023 10:17:47 -0400
Received: from mail-oi1-x22b.google.com (mail-oi1-x22b.google.com [IPv6:2607:f8b0:4864:20::22b])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D4656173E
        for <linux-hwmon@vger.kernel.org>; Tue,  4 Apr 2023 07:17:46 -0700 (PDT)
Received: by mail-oi1-x22b.google.com with SMTP id q27so23564952oiw.0
        for <linux-hwmon@vger.kernel.org>; Tue, 04 Apr 2023 07:17:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112; t=1680617866;
        h=content-transfer-encoding:in-reply-to:subject:from:references:cc:to
         :content-language:user-agent:mime-version:date:message-id:sender
         :from:to:cc:subject:date:message-id:reply-to;
        bh=dgshlThDFHGuV9efWciL4pcTf7l3h1vaK6/oh6ffmOQ=;
        b=RWrNvcyrBomhJ63tha5uZPWB6GrF2VYctN6HU/NQ3p+rqpQt1x8WWMj8TVb+RniNb9
         zFgv+ZdDNyCsFQBYhrlK1NCV/UbH9NRpmddjAscd9y38XN1tftGZ6QWxvlZgfjdm/E2H
         WzqFQdp6n53QQOpGfA4aaL+aVSyU2n6z+TldZuGMgLD0tZN/yEL0Rx363fwrO2o6s6yM
         MJjzPs6cWGRh0bDhFzbr/7lw01TiW7/xTBLeh/GgqyVd9QshiOojbcFNgUf7hPEjpC1s
         Cdvmr2ecCpTf/74i4T4odBbKfZGZ+EqBXXry0fnN/kqqET+y/zaIbxcmGtoK8CyVgall
         DHbQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1680617866;
        h=content-transfer-encoding:in-reply-to:subject:from:references:cc:to
         :content-language:user-agent:mime-version:date:message-id:sender
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=dgshlThDFHGuV9efWciL4pcTf7l3h1vaK6/oh6ffmOQ=;
        b=04SWgR7nmp9pwFs9qngGsecdTka0kEvt/OeIJyWLLZc0uOPkg0IawUAmQd2vXY6kpg
         FYEPr5+nfKAcp9YInaAkTgjQj2Im+QL9OFcZH40hwT7s8iIRn8b/GCtey//9MwMKCFTI
         qBnyM6snjOgw76jx7QmWmMWATYUAiLu6zwomv4KdZm7t4YhK7z1BUh7kJUfjcy41Opin
         937EfelM84/PjDgk/YVDwhGOumWLf2obqHFGJogvzYUIm5k0SmZl+T0TpW3jkhRX+TZE
         JlimztF4qyM3p/b7ul6IIdxmJN208n8yaYfynjnMV1nyqIy5dWgjR++yxuDWZ1VcSW0E
         4v2Q==
X-Gm-Message-State: AAQBX9chZyvD78EAe4o4C3kl1FtedaMHL0yHC/z0RkNQBW8bUgZrHV16
        BQilhtYWnafqRoYjueBgMtM=
X-Google-Smtp-Source: AKy350bw/5McbkKdM2HN2L8C51IxWUOMF5xwEtGVGYyzk5Aj4hz0A+EVvMptKwJXPgEYUQASm+3GxQ==
X-Received: by 2002:aca:2818:0:b0:386:9dc5:2cc0 with SMTP id 24-20020aca2818000000b003869dc52cc0mr1337116oix.25.1680617866190;
        Tue, 04 Apr 2023 07:17:46 -0700 (PDT)
Received: from ?IPV6:2600:1700:e321:62f0:329c:23ff:fee3:9d7c? ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
        by smtp.gmail.com with ESMTPSA id s3-20020acac203000000b0038694b7dc09sm5173305oif.55.2023.04.04.07.17.44
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 04 Apr 2023 07:17:45 -0700 (PDT)
Sender: Guenter Roeck <groeck7@gmail.com>
Message-ID: <721f26ab-045b-830a-09fd-50dc21e8cafe@roeck-us.net>
Date:   Tue, 4 Apr 2023 07:17:43 -0700
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.9.0
Content-Language: en-US
To:     "Heimpold, Michael" <michael.heimpold@chargebyte.com>,
        Jean Delvare <jdelvare@suse.com>,
        =?UTF-8?Q?Uwe_Kleine-K=c3=b6nig?= <u.kleine-koenig@pengutronix.de>,
        "linux-hwmon@vger.kernel.org" <linux-hwmon@vger.kernel.org>,
        Matthias Schiffer <matthias.schiffer@ew.tq-group.com>,
        Alexander Stein <alexander.stein@ew.tq-group.com>
Cc:     "mhei@heimpold.de" <mhei@heimpold.de>,
        "Wahren, Stefan" <stefan.wahren@chargebyte.com>
References: <AS1PR10MB51907B404B1DF68C81FCAA43F2939@AS1PR10MB5190.EURPRD10.PROD.OUTLOOK.COM>
From:   Guenter Roeck <linux@roeck-us.net>
Subject: Re: Incompatible userspace API of pwm-fan driver
In-Reply-To: <AS1PR10MB51907B404B1DF68C81FCAA43F2939@AS1PR10MB5190.EURPRD10.PROD.OUTLOOK.COM>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-hwmon.vger.kernel.org>
X-Mailing-List: linux-hwmon@vger.kernel.org

On 4/4/23 00:59, Heimpold, Michael wrote:
> Hi all,
> 
> our product “Tarragon” is an embedded Linux system, a charging station
> controller with the possibility to attach a fan.
> This fan can be controlled via PWM and the Linux driver we use for
> it is "pwmfan". On top in userspace, we use fancontrol and pwmconfig
> from lm-sensors.
> 
> We recently switched over to a newer Linux kernel version and noticed that
> commit b99152d4f04b (“hwmon: (pwm-fan) Switch regulator dynamically”)
> introduced an “issue”: now the pwm1_enable file is present in the sysfs API
> but the way the driver implements this is not compatible with the
> expectations by fancontrol/pwmconfig:
> 
> According to https://www.kernel.org/doc/Documentation/hwmon/sysfs-interface:
> 
> -snip-
> pwm[1-*]_enable
>      Fan speed control method:
>      0: no fan speed control (i.e. fan at full speed)
>      1: manual fan speed control enabled (using pwm[1-*])
>      2+: automatic fan speed control enabled
>      Check individual chip documentation files for automatic mode
>      details.
> -snap-
> 
> This is also what pwmconfig and fancontrol expects.
> 
> But the driver implementation does this:
> 
> Quote from https://www.kernel.org/doc/Documentation/hwmon/pwm-fan.rst
> -snip-
> pwm1_enable rw keep enable mode, defines behaviour when pwm1=0
>      0 -> disable pwm and regulator
>      1 -> enable pwm; if pwm==0, disable pwm, keep regulator enabled
>      2 -> enable pwm; if pwm==0, keep pwm and regulator enabled
>      3 -> enable pwm; if pwm==0, disable pwm and regulator
> -snap-
> 

Unfortunately that is a common problem with many drivers. The problem is that
especially "no fan speed control (i.e. fan at full speed)" is really a bad API
to start with, because it doesn't support a modern system where one may
have something else in mind when saying "disable pwm". Maybe we need to
revert the patch, or introduce mode 4 for "disable pwm and regulator"
and use 0 for "set fan to full speed and keep regulator enabled".

Uwe, any thoughts ?

Guenter

> As workaround, we have adapted the two mentioned scripts. The used approach
> is to check whether this special hwmon driver is used and ignore
> the pwm1_enable file in this moment.
> I posted this topic (combined with our patch) also to lm-sensors list
> yesterday, for reference see:
> https://marc.info/?l=lm-sensors&m=168051630023128&w=2
> 
> I’m/we are not sure, what the "correct" resolution here would be,
> so looking forward to your feedback.
> 
> PS: I'm not subscribed to the list(s), please keep Cc-ing me, thanks.
> 
> Best regards,
> Michael
> 

