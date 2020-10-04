Return-Path: <SRS0=wGth=DL=vger.kernel.org=linux-hwmon-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-10.3 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	MENTIONS_GIT_HOSTING,NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_SANE_1 autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 88F64C4363C
	for <linux-hwmon@archiver.kernel.org>; Sun,  4 Oct 2020 15:38:11 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 35A42206C1
	for <linux-hwmon@archiver.kernel.org>; Sun,  4 Oct 2020 15:38:11 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="bMHsZV7z"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725830AbgJDPiL (ORCPT <rfc822;linux-hwmon@archiver.kernel.org>);
        Sun, 4 Oct 2020 11:38:11 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54684 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725825AbgJDPiK (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>); Sun, 4 Oct 2020 11:38:10 -0400
Received: from mail-ot1-x344.google.com (mail-ot1-x344.google.com [IPv6:2607:f8b0:4864:20::344])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 89E59C0613CE
        for <linux-hwmon@vger.kernel.org>; Sun,  4 Oct 2020 08:38:10 -0700 (PDT)
Received: by mail-ot1-x344.google.com with SMTP id s66so6236292otb.2
        for <linux-hwmon@vger.kernel.org>; Sun, 04 Oct 2020 08:38:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=sender:subject:to:cc:references:from:autocrypt:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=MllTX5lkyinbm+9yd8QINpn755lrC2Ssw7XGJkixoPU=;
        b=bMHsZV7zJvknt6MlnmQZj1QZFOULSOytMO9kOZ8u44StFv5DSdBU0hcLMSStuBtZVn
         mdO9ELr0xwadh/3OkGTrHR7my7dvXgsAAB+QBUqF9zLPm3Hlam5sqUkSe6F+qkkh1uq9
         uzTEUY9J+DBA0aQlbY7iJNfPcEazZT381E0f0UCwYm1SjOc2yFySOhdJjvPgwdy8iIF1
         HOa4tYaVqynmqlWb1xHpMmfovJVan4OmLBQw2Yzs/iOapzW6cgJ7KH10GPKftaWJJQip
         omyPMv21zlUTjJZBPGj17457rWVdRwQJfOSpPertKeB1RLJmm2JrSPb26XQ103JCrcPF
         +SVg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:sender:subject:to:cc:references:from:autocrypt
         :message-id:date:user-agent:mime-version:in-reply-to
         :content-language:content-transfer-encoding;
        bh=MllTX5lkyinbm+9yd8QINpn755lrC2Ssw7XGJkixoPU=;
        b=Fn/y6Z8N0xSgdsmsu6lTiprqbY5bgN76U2DIny4uZF2u3padeGZcju/l9RECB14wyY
         CHwoEdjBWhDUNeCA58KGANW8bwu5l8ZOdOOpUh+xXYMMa+FxFggjkijoKFGRuupKXUgQ
         P9uapDIiIFs8V6On/eWMpeovVoF1KRzPx15UTJjJF5XOhJvfXhuEFTD9enOKnuqcI4d/
         NyP3p2kr6VLMJvDp+E2LaZnyH1pgdR9PhBnZBTPw5GNZAOxrKAdgb+vjQTbVa+ryR05f
         AClnameVRvUFanAbbwG/tsEZmWQEvDUFHnbJKIwS8BXQYgxp9gtjbMkHTnNadUc6Mc/N
         3tkg==
X-Gm-Message-State: AOAM5327clVNXQqEg6LtaXCJyD1vVI7sYJu5m42fNqaeMERGcbjwB1C/
        qAsjBUZDTglquYBrj7QFQZpoxkwaSmI=
X-Google-Smtp-Source: ABdhPJzdBtKn281OTt72n8T4glUimsxK6kKuS6iL1Q9zHqt8Uf0d5XpfG6wthNgvRDk22W7IJCpPbw==
X-Received: by 2002:a9d:a65:: with SMTP id 92mr8336851otg.264.1601825889613;
        Sun, 04 Oct 2020 08:38:09 -0700 (PDT)
Received: from server.roeck-us.net ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
        by smtp.gmail.com with ESMTPSA id l1sm2244499ooe.20.2020.10.04.08.38.08
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 04 Oct 2020 08:38:09 -0700 (PDT)
Sender: Guenter Roeck <groeck7@gmail.com>
Subject: Re: [PATCH 0/2] pwm-fan: Support multiple tach inputs & fix RPM calc
To:     Paul Barker <pbarker@konsulko.com>, Kamil Debski <kamil@wypas.org>,
        Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>,
        Jean Delvare <jdelvare@suse.com>
Cc:     linux-hwmon@vger.kernel.org
References: <20200920180943.352526-1-pbarker@konsulko.com>
 <20200920180943.352526-3-pbarker@konsulko.com>
 <CAM9ZRVs=33NJGEn783BMEhZxKwuhSSuaTW1QtX3E7wz0mLGiaw@mail.gmail.com>
From:   Guenter Roeck <linux@roeck-us.net>
Autocrypt: addr=linux@roeck-us.net; keydata=
 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
 mDW4+i+XlNFUPUYMrIKi9joBhu18ssf5i5Q=
Message-ID: <c972365d-25c6-add8-bcd6-93dc76c59fa4@roeck-us.net>
Date:   Sun, 4 Oct 2020 08:38:07 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <CAM9ZRVs=33NJGEn783BMEhZxKwuhSSuaTW1QtX3E7wz0mLGiaw@mail.gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-hwmon.vger.kernel.org>
X-Mailing-List: linux-hwmon@vger.kernel.org

On 10/4/20 1:49 AM, Paul Barker wrote:
> On Sun, 20 Sep 2020 at 19:09, Paul Barker <pbarker@konsulko.com> wrote:
>>
>> These changes were made to support a custom board where one PWM output
>> is routed to two fans, each of which has a tachometer signal routed to a
>> GPIO input on the SoC. While debugging on this board it was found that
>> the RPM readings were being overestimated due to a bug in the
>> calculation code so I've included a fix for that.
>>
>> As the custom board doesn't currently support the latest mainline kernel
>> I've tested these changes on a SanCloud BeagleBone Enhanced using an
>> oscilloscope to check the PWM output and a signal generator to simulate
>> the fan tachometer signals. I've tested variants of the device tree with
>> 0, 1 and 2 fan tachometer inputs configured to ensure the logic in the
>> probe function is correct.
>>
>> The device tree bindings changes have been submitted in a separate
>> patch.
>>
>> These changes can also be pulled from:
>>
>>   https://gitlab.com/pbarker.dev/staging/linux.git
>>   tag: for-hwmon/pwm-fan_2020-09-20
>>
>> Paul Barker (2):
>>   hwmon: pwm-fan: Support multiple tachometer inputs
>>   hwmon: pwm-fan: Fix RPM calculation
>>
>>  drivers/hwmon/pwm-fan.c | 164 ++++++++++++++++++++++++----------------
>>  1 file changed, 100 insertions(+), 64 deletions(-)
>>
>>
>> base-commit: 2835d860d3fcc3e4829e96987544e811d35dee48
> 
> Ping on these, I've not had any feedback for 2 weeks.
> 

Unfortunately the patches are a bit difficult to understand,
and I did not have the time to fully analyze them. One thing I can say
is that the order should be reversed - the bug fix should come first.
Also, patch 2 adds a potential divide by 0 problem, if 'delta'
happens to be 0.

There are little details, such as replacing 'int pulses' with
'unsigned int pulses', which make things more difficult to review.
atomic_t is int. Assigning it to an unsigned int _should_ not matter
here, but again such little changes make it more difficult to review
a patch because they require extra scrutiny.

Guenter
