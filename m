Return-Path: <linux-hwmon-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 54AA4C433F5
	for <linux-hwmon@archiver.kernel.org>; Tue, 15 Feb 2022 14:13:51 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232171AbiBOON7 (ORCPT <rfc822;linux-hwmon@archiver.kernel.org>);
        Tue, 15 Feb 2022 09:13:59 -0500
Received: from mxb-00190b01.gslb.pphosted.com ([23.128.96.19]:56806 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229745AbiBOON7 (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>);
        Tue, 15 Feb 2022 09:13:59 -0500
Received: from mail-ot1-x32b.google.com (mail-ot1-x32b.google.com [IPv6:2607:f8b0:4864:20::32b])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 689799AE61
        for <linux-hwmon@vger.kernel.org>; Tue, 15 Feb 2022 06:13:48 -0800 (PST)
Received: by mail-ot1-x32b.google.com with SMTP id l43-20020a9d1cab000000b005aa50ff5869so13895998ota.0
        for <linux-hwmon@vger.kernel.org>; Tue, 15 Feb 2022 06:13:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=sender:message-id:date:mime-version:user-agent:subject
         :content-language:to:cc:references:from:in-reply-to
         :content-transfer-encoding;
        bh=3jYIcQU0BEJFXgQgZzodj4ZJoQpS9kX+hwQIg5ZIeRk=;
        b=J1Jks/nKzH6zy39+6jp9TZRxepsjIdmvuf6RA8ZXEdVmTtV/bYajseDAwMzMycPPzA
         O5zpPWl7QPsMJNAU7AXfyCBcvmxeIi2RQtZbpc0V1fElUrnqe4c0Tof6uSzr8+SRbhLR
         k0VsK+6WgkGVCNc2TrNRt/zdOPi7fwozntdWc+vmnkHD2KCn2BfjOdqg8ccQVuvTPUIa
         JC9OV4zvp8yK7sp48KWnp3A4SYkx8D0fmHKGC3PvEacaJckIBmjzzaL+ijUDJ6mPFwNO
         /t+57i330bP0raAxDC8BbcDHdEsPnUqGhV3D++HNfdKMRJOnHq0+8tRsFLY2XUvkPcXO
         j41w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:sender:message-id:date:mime-version:user-agent
         :subject:content-language:to:cc:references:from:in-reply-to
         :content-transfer-encoding;
        bh=3jYIcQU0BEJFXgQgZzodj4ZJoQpS9kX+hwQIg5ZIeRk=;
        b=RWvdypkETyLILCkl/pfsgPQtjTFv4ULD6ABkGeCELEALMS3tRarYgTqMPIZa0zsPlk
         7zXRLTUWm+at4i4FCT68xTlWIGnTrDf6P5Tnqk+n3VkNNWw3bVpVI3diqAbnDNAhxW1D
         Ev/s8Y0BExA1M+rA7gVK/+plU1gXZwAHD8icgHo+UD7FHWFGT5FBY+Q99VRjz9MWVgH4
         wPmfd40hhVZNbjObi5WWmwp2oXeqHtKCNIQg7KwXr4KEqyqt2JPDWSHEwC5aunCUuQyC
         EUpZCQ4An4GQTKkjhLARWW9/ek9oKXd6PPFPwYbFqXXV+BjIW3yUchaZKMNE6M3lOnE5
         98YA==
X-Gm-Message-State: AOAM532sMqGPPcK6t8+jZuraXL2HDxHkaAr6Eq/j9M7ON4K19l3cihKM
        jIxz+9NpvF5CVF4xGV1wrZw=
X-Google-Smtp-Source: ABdhPJz3hO8Mgj/aRK/srYGcUTA9YNXvqLNZucTp0pWWWJTBiFjdDnC+SqpHuCZx9SZ1Hyu7ZYLyuw==
X-Received: by 2002:a9d:4f0a:: with SMTP id d10mr1362150otl.292.1644934427711;
        Tue, 15 Feb 2022 06:13:47 -0800 (PST)
Received: from ?IPV6:2600:1700:e321:62f0:329c:23ff:fee3:9d7c? ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
        by smtp.gmail.com with ESMTPSA id a8sm13965862otj.47.2022.02.15.06.13.45
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 15 Feb 2022 06:13:46 -0800 (PST)
Sender: Guenter Roeck <groeck7@gmail.com>
Message-ID: <8542b4c2-3aa3-c276-4cc4-b9b08ffb9c2b@roeck-us.net>
Date:   Tue, 15 Feb 2022 06:13:44 -0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.0
Subject: Re: [PATCH v2 2/2] hwmon: Add driver for Texas Instruments TMP464
 sensor chip
Content-Language: en-US
To:     Agathe Porte <agathe.porte@nokia.com>, linux-hwmon@vger.kernel.org
Cc:     Jean Delvare <jdelvare@suse.com>,
        Krzysztof Adamski <krzysztof.adamski@nokia.com>
References: <20220209133617.67297-1-agathe.porte@nokia.com>
 <20220209155308.88938-1-agathe.porte@nokia.com>
 <20220209155308.88938-2-agathe.porte@nokia.com>
 <53861f0c-6447-7a50-39c3-924290a6f9bf@roeck-us.net>
 <fec8df49-5ab1-c55a-b2ad-28f7591cf768@nokia.com>
 <1e28b6e1-8675-1059-1a79-7148e2a91e83@roeck-us.net>
 <277f551b-b732-8f9b-db8e-3432798e0984@nokia.com>
From:   Guenter Roeck <linux@roeck-us.net>
In-Reply-To: <277f551b-b732-8f9b-db8e-3432798e0984@nokia.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-hwmon.vger.kernel.org>
X-Mailing-List: linux-hwmon@vger.kernel.org

Hi Agathe,

On 2/15/22 05:40, Agathe Porte wrote:
> Hi Guenter,
> 
> Le 12/02/2022 à 00:53, Guenter Roeck a écrit :
>> Turns out the chip is by default locked, meaning all those configuration writes
>> fail unless I explicitly unlock the chip. How would you suggest to handle that
>> situation, and how do you handle it in your application ?
>>
> After reading the TMP464 datasheet, the device seems locked by default indeed:
> 
>> All of the configuration and limit registers may be locked for writes (making the registers write-protected), which
>> decreases the chance of software runaway from issuing false changes to these registers. The Lock column in
>> Table 3 identifies which registers may be locked. Lock mode does not effect read operations. To activate the lock
>> mode, Lock Register C4h must be set to 0x5CA6. The lock only remains active while the TMP464 device is
>> powered up. Because the TMP464 device does not contain nonvolatile memory, the settings of the configuration
>> and limit registers are lost once a power cycle occurs regardless if the registers are locked or unlocked.
>> In lock mode, the TMP464 device ignores a write operation to configuration and limit registers except for Lock
>> Register C4h. The TMP464 device does not acknowledge the data bytes during a write operation to a locked
>> register. To unlock the TMP464 registers, write 0xEB19 to register C4h. The TMP464 device powers up in locked
>> mode, so the registers must be unlocked before the registers accept writes of new data.
> 
>  From my deduction, since we do not unlock it with software, I guess that our local FPGA is doing the job of disabling the lock during power-on procedure.
> 
> I guess we could read and unlock the device when probing, and relock it after rmmod if it was locked during probing (store initial lock state). We do not want to relock it if it was unlocked before probe — like in our usecase — because other applications may use this "already unlocked" assumption (bootloader, FPGA code, …).
> 
> What do you think?
> 

Yes, that is exactly what I ended up doing.

Thanks,
Guenter
