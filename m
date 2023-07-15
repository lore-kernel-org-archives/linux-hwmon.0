Return-Path: <linux-hwmon-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 93E3EC001B0
	for <linux-hwmon@archiver.kernel.org>; Sat, 15 Jul 2023 17:25:48 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229472AbjGORZr (ORCPT <rfc822;linux-hwmon@archiver.kernel.org>);
        Sat, 15 Jul 2023 13:25:47 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:34026 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229973AbjGORZr (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>);
        Sat, 15 Jul 2023 13:25:47 -0400
Received: from mail-pf1-x42c.google.com (mail-pf1-x42c.google.com [IPv6:2607:f8b0:4864:20::42c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E4223272E
        for <linux-hwmon@vger.kernel.org>; Sat, 15 Jul 2023 10:25:43 -0700 (PDT)
Received: by mail-pf1-x42c.google.com with SMTP id d2e1a72fcca58-6687446eaccso3087888b3a.3
        for <linux-hwmon@vger.kernel.org>; Sat, 15 Jul 2023 10:25:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1689441943; x=1692033943;
        h=content-transfer-encoding:in-reply-to:subject:from:references:cc:to
         :content-language:user-agent:mime-version:date:message-id:sender
         :from:to:cc:subject:date:message-id:reply-to;
        bh=+DlUwxzTd/BRWowARDOrvBDHDuAiWLe3hAzSMX1LAjA=;
        b=EmdTQRD7XcS99gLnAtibd9ovAk7QkiNxGoWoAhoOb7Ep03yzT7zAsmHlwxl4Wod0Yt
         z7tB9uOeSC6qyFXdkEV6i1HSUFK/Z+JMKmxEHJfgDtdpL6Ofwtq0XaMa+bkCh2RwX+i7
         AgkEw9xH8rgjyp+IQqVPYPsv8wZM4nlo6xm/gLH/Ln0esOcqhR3dM9VQGLqurGKFBbEH
         5DNZjGQMx/Dpv1DNb/ky/jGnm/KTMaAjYk03shnqOOd/ciJeRuLfIRLtKEVRhF55gKJO
         TVRRxvPYcyNHvoeQdQb5ggTCrAeMrdGmpTkx8beayJtcxJrZnBfnNyNqCRtTVXm3LEVg
         D7Bw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1689441943; x=1692033943;
        h=content-transfer-encoding:in-reply-to:subject:from:references:cc:to
         :content-language:user-agent:mime-version:date:message-id:sender
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=+DlUwxzTd/BRWowARDOrvBDHDuAiWLe3hAzSMX1LAjA=;
        b=ApJmknCUFq5lhLvLev+3muy1dV5lGpolbLZw8HOem5w2WEf9pLFH1UsKV/2B+vyek8
         n7B12sB+YYvWxSD/DneohVnDXkOSGk+D8Dj4jB8FoXe29CHF1th9igDU7Vpf5bbYRhpx
         q0GLZ8gmC0YuVPSrcWhVrD+g05ALvu9b1WOfYGqv5mXhxbTs+VsrqXVFxy8lMTqi1KAk
         ShKlx/vVoUyameP17SUaxs13RL9gTRtjFr8dXERGcmBKn+KGo4J1czfgQs8NyRLkB4BI
         4FPsqjeHQhIXluEjNyoGAbqcr0Okfz7aG/loEYHmqm7F9taSV51lC3SvMzbXmVz6lM3i
         3YFQ==
X-Gm-Message-State: ABy/qLaIcZgTpZHeJhgVdiXorbnb1NRGjBJ8DmBB0OD7tSCDhOtuX23j
        zBUctG1dGRpWcrVXSuNVzPqHpEsUyk0=
X-Google-Smtp-Source: APBJJlGMJyVESyKQ5d/CTwwjbN8w5XeKLxVb1aEKCL/q6+Wd/umnafxRRFJDtVtsSI8wkyyVkVsANA==
X-Received: by 2002:a05:6a00:18a4:b0:66a:2ff1:dee3 with SMTP id x36-20020a056a0018a400b0066a2ff1dee3mr10321835pfh.6.1689441943331;
        Sat, 15 Jul 2023 10:25:43 -0700 (PDT)
Received: from ?IPV6:2600:1700:e321:62f0:329c:23ff:fee3:9d7c? ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
        by smtp.gmail.com with ESMTPSA id c19-20020aa78e13000000b0062bc045bf4fsm9424218pfr.19.2023.07.15.10.25.42
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 15 Jul 2023 10:25:42 -0700 (PDT)
Sender: Guenter Roeck <groeck7@gmail.com>
Message-ID: <6521e90c-68b2-ded2-18da-dac73b10602d@roeck-us.net>
Date:   Sat, 15 Jul 2023 10:25:41 -0700
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.13.0
Content-Language: en-US
To:     Ahmad Khalifa <ahmad@khalifa.ws>
Cc:     linux-hwmon@vger.kernel.org
References: <20230715152931.1307087-1-ahmad@khalifa.ws>
 <fbd3724f-2c89-cdf6-5fcf-3ddbbffd8aec@roeck-us.net>
 <76e2ca3d-f8dc-8196-e2e5-d8f1e00b0b4d@khalifa.ws>
From:   Guenter Roeck <linux@roeck-us.net>
Subject: Re: [PATCH] hwmon: (nct6775) Change labels for nct6799
In-Reply-To: <76e2ca3d-f8dc-8196-e2e5-d8f1e00b0b4d@khalifa.ws>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-hwmon.vger.kernel.org>
X-Mailing-List: linux-hwmon@vger.kernel.org

On 7/15/23 09:39, Ahmad Khalifa wrote:
> On 15/07/2023 17:09, Guenter Roeck wrote:
>> On 7/15/23 08:29, Ahmad Khalifa wrote:
>>>    * #temp lists the number of monitored temperature sources (first value) plus
>>>    * the number of directly connectable temperature sensors (second value).
>>> + *
>>> + * (*) nct6799d-r based on nct6796d-s and both quite different to nct6796d
>>
>> We should not say "based on" without evidence (that is, someone from Nuvoton confirming
>> that this is the case), and "both quite different to nct6796d" is just confusing.
>> nct6799d is _expected_ to be different to nct6796d. This should say something like
>> "nct6796d-s is similar to nct6799d-r with minor differences which do not affect the
>> driver".
> 
> It was Nuvoton support that told me that NCT6799D-R was a customer-
> specific chip, but "very similar" to 6796d-S.
> 
> The point here was to specify the relevant chip ids and to say that the
> driver treats both the same way, so I can rephrase it to say "driver
> treats both the same way" maybe?
> 

It should say that the two chips are similar and that the driver does not
treat them differently. I'll leave the exact wording to you.

> However, I'm somewhat sure the temperature sources on 6799d-R use one of
> the reserved values when setup through the bios.
> 
>> Apparently there are also NCT6796D-E (Nuvoton's web site) and NCT6796D-R
>> (LibreHardwareMonitor). Do you know anything about those chips ? Based on the
>> chip ID, NCT6796-R seems to be a variant of NCT6798D with chip ID 0xd42a.
> 
> Do you know which board had the NCT6796-R, it seems the R suffix is
> "customer-specific"?
> 

 From LibreHardwareMonitor commit log:

Add initial NCT6796D-R support

     This is used by Asrock X570 Pro4

>> Any chance you can share the datasheet for NCT6796D-S ?
> 
> Of course:
> https://khalifa.ws/randomfiles/nuvoton/NCT6796D-S_Datasheet_V0_6.pdf
> 
Thanks!

Guenter

