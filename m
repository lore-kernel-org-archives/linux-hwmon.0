Return-Path: <linux-hwmon-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 26CEBC74A5B
	for <linux-hwmon@archiver.kernel.org>; Sun, 12 Mar 2023 18:04:25 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231862AbjCLSEY (ORCPT <rfc822;linux-hwmon@archiver.kernel.org>);
        Sun, 12 Mar 2023 14:04:24 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38708 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231544AbjCLSDQ (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>);
        Sun, 12 Mar 2023 14:03:16 -0400
Received: from mail-oa1-x29.google.com (mail-oa1-x29.google.com [IPv6:2001:4860:4864:20::29])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C10614DBE1
        for <linux-hwmon@vger.kernel.org>; Sun, 12 Mar 2023 10:59:48 -0700 (PDT)
Received: by mail-oa1-x29.google.com with SMTP id 586e51a60fabf-17683b570b8so11531223fac.13
        for <linux-hwmon@vger.kernel.org>; Sun, 12 Mar 2023 10:59:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112; t=1678643932;
        h=content-transfer-encoding:in-reply-to:from:references:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :sender:from:to:cc:subject:date:message-id:reply-to;
        bh=WMSAEUV55JyZ68eRBSqIQlAsWCOrO1Gc0N2bCMh542k=;
        b=Y8hU5xNebe/Skczsvz281jvW4Rzy40fRpKMuvU9sJEH5GRic9ysR0gDZENjG3O93PE
         bPOOKAMIfDLBBFLcUqYOYQXuxPa4RksKeChRP93mYGPiHUIGcoAFYVqxzi4K+cf/RnXm
         G1t3dlx4nyLwHE41GOBpxfde4u8u/l5EWIzFcy5n9ukcGeELeroMiJCu4WvvSi9UhxXI
         k9PNBtF+PJBuDVw3KPz7aNEZ4lvS6l9lgmgkKPyvCC++Oj7ig3UY4MfqC/GiFZfYXLN9
         0Wc7gSg5uWnf1OW/tw5X9tmvRVXNGa4d2zoQBQTFVa+Khq0aAUpdnckLjWIlip4RUDFV
         R8fw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1678643932;
        h=content-transfer-encoding:in-reply-to:from:references:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :sender:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=WMSAEUV55JyZ68eRBSqIQlAsWCOrO1Gc0N2bCMh542k=;
        b=qgT3SsuAcuSwYgtGxsrhJkqTpRQ+UtAfFG9jRs6FHZOwtU0vlphCD5oV/T9wMeKAN5
         bYjfFgMEGL4rbJ0s1sL4bjq+QxQqdqictZqIkPwz7/ZUM+oQZZSZq6/tSzf9FfwzFcJg
         2RG4FpS4Yh0OEzn7HFrbEeijfzo7L9hffESNlZd7EfEdeRwKxwU9DExK8lZxze4o6v3p
         /lgY5kU/l5U3SlfNZPBi8sTXeAMZq9eXU8srmGdiDCxhO06PYAdbvpO6brwWsTj+T29h
         AgtLMK8BSd4bPK2TUnSPWttD9VSzfjN65foc+o1Aa9U13RejR1wg/6XBEWar3iPbHE+D
         ju0w==
X-Gm-Message-State: AO0yUKUxJh3kRhXxpkbFO2qaPxiHCYi7JutNAFgaJGcfgFwbR2mJvWsM
        ggc7UmFJ4g5cxJTDL+dk7hsv3sx1Fj0=
X-Google-Smtp-Source: AK7set/pWa70Tjcg2KoLwU0yUqRpJNEgY4Ey17W440LxsE+LkxhDjohLks7icII8ZO4Y4kyRqkRiew==
X-Received: by 2002:a05:6870:4190:b0:177:ad57:cb36 with SMTP id y16-20020a056870419000b00177ad57cb36mr1096303oac.27.1678643931808;
        Sun, 12 Mar 2023 10:58:51 -0700 (PDT)
Received: from ?IPV6:2600:1700:e321:62f0:329c:23ff:fee3:9d7c? ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
        by smtp.gmail.com with ESMTPSA id v11-20020a9d5a0b000000b0068bcc902b82sm2338509oth.71.2023.03.12.10.58.50
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 12 Mar 2023 10:58:51 -0700 (PDT)
Sender: Guenter Roeck <groeck7@gmail.com>
Message-ID: <0c64777d-f843-88de-f0e7-8dbd153e2a6e@roeck-us.net>
Date:   Sun, 12 Mar 2023 10:58:49 -0700
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.7.1
Subject: Re: Sensor for Asus Pro A520M-C II/CSM
Content-Language: en-US
To:     Holger Kiehl <Holger.Kiehl@dwd.de>,
        Jean Delvare <jdelvare@suse.com>, linux-hwmon@vger.kernel.org
References: <389043e8-b523-cd89-b4da-83acea01521@praktifix.dwd.de>
From:   Guenter Roeck <linux@roeck-us.net>
In-Reply-To: <389043e8-b523-cd89-b4da-83acea01521@praktifix.dwd.de>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-hwmon.vger.kernel.org>
X-Mailing-List: linux-hwmon@vger.kernel.org

On 3/12/23 06:06, Holger Kiehl wrote:
> Hello,
> 
> with the attached patch some sensor information is shown
> with Asus Pro A520M-C II/CSM:
> 
>     dmesg |grep nct6775
>     [   23.765392] nct6775: Found NCT6798D or compatible chip at 0x2e:0x290
> 
> And sensors now shows:
> 
>     nct6798-isa-0290
>     Adapter: ISA adapter
>     in0:                      312.00 mV (min =  +0.00 V, max =  +1.74 V)
>     in1:                        1.02 V  (min =  +0.00 V, max =  +0.00 V)  ALARM
>     in2:                        3.42 V  (min =  +0.00 V, max =  +0.00 V)  ALARM
>     in3:                        3.38 V  (min =  +0.00 V, max =  +0.00 V)  ALARM
>     in4:                        1.03 V  (min =  +0.00 V, max =  +0.00 V)  ALARM
>     in5:                        1.02 V  (min =  +0.00 V, max =  +0.00 V)  ALARM
>     in6:                      200.00 mV (min =  +0.00 V, max =  +0.00 V)  ALARM
>     in7:                        3.42 V  (min =  +0.00 V, max =  +0.00 V)  ALARM
>     in8:                        3.28 V  (min =  +0.00 V, max =  +0.00 V)  ALARM
>     in9:                      920.00 mV (min =  +0.00 V, max =  +0.00 V)  ALARM
>     in10:                     512.00 mV (min =  +0.00 V, max =  +0.00 V)  ALARM
>     in11:                     504.00 mV (min =  +0.00 V, max =  +0.00 V)  ALARM
>     in12:                       1.03 V  (min =  +0.00 V, max =  +0.00 V)  ALARM
>     in13:                     256.00 mV (min =  +0.00 V, max =  +0.00 V)  ALARM
>     in14:                       1.47 V  (min =  +0.00 V, max =  +0.00 V)  ALARM
>     fan1:                        0 RPM  (min =    0 RPM)
>     fan2:                        0 RPM  (min =    0 RPM)
>     fan3:                      355 RPM  (min =    0 RPM)
>     fan7:                        0 RPM  (min =    0 RPM)
>     SYSTIN:                    +25.0°C  (high = +80.0°C, hyst = +75.0°C)  sensor = thermistor
>     CPUTIN:                    +26.5°C  (high = +80.0°C, hyst = +75.0°C)  sensor = thermistor
>     AUXTIN0:                   +97.0°C    sensor = thermistor
>     AUXTIN1:                   +25.0°C    sensor = thermistor
>     AUXTIN2:                   +25.0°C    sensor = thermistor
>     AUXTIN3:                    +1.0°C    sensor = thermistor
>     PECI Agent 0 Calibration:  +26.0°C
>     PCH_CHIP_CPU_MAX_TEMP:      +0.0°C
>     PCH_CHIP_TEMP:              +0.0°C
>     PCH_CPU_TEMP:               +0.0°C
>     TSI0_TEMP:                 +27.9°C
>     intrusion0:               ALARM
>     intrusion1:               OK
>     beep_enable:              disabled
> 
> The patch is against 6.2.5.
> 
> Thank you very much for all the hwmon work!
> 
> Regards,
> Holger

Please see

Documentation/process/submitting-patches.rst
Documentation/process/submit-checklist.rst

for information on how to submit patches into the upstream Linux kernel.

Thanks,
Guenter

