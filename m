Return-Path: <linux-hwmon-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2CCD1C0015E
	for <linux-hwmon@archiver.kernel.org>; Sat, 29 Jul 2023 14:25:24 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230200AbjG2OZX (ORCPT <rfc822;linux-hwmon@archiver.kernel.org>);
        Sat, 29 Jul 2023 10:25:23 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56334 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229619AbjG2OZW (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>);
        Sat, 29 Jul 2023 10:25:22 -0400
Received: from mail-pl1-x631.google.com (mail-pl1-x631.google.com [IPv6:2607:f8b0:4864:20::631])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 1BD8430F3
        for <linux-hwmon@vger.kernel.org>; Sat, 29 Jul 2023 07:25:21 -0700 (PDT)
Received: by mail-pl1-x631.google.com with SMTP id d9443c01a7336-1bbf0f36ce4so8546325ad.0
        for <linux-hwmon@vger.kernel.org>; Sat, 29 Jul 2023 07:25:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1690640720; x=1691245520;
        h=content-transfer-encoding:in-reply-to:subject:from:references:to
         :content-language:user-agent:mime-version:date:message-id:sender
         :from:to:cc:subject:date:message-id:reply-to;
        bh=01w551jPRNSzBVPPiAESDIncvRwT/U2qS1PhN3wbXq4=;
        b=m3YFj7VtdD6SKSqRs7iPKArUBAIt0p1AjyT4h7hmq7cdROpyuSzcT4QKAFWH5zZMUt
         NvA9eeXVlYCSPYeRiNfnbg9ONYM42+hMn33wvT41voItt8RxH2KLvdUMrxv7fpDz1dqe
         is0gxjgetSN7gUff14fM79U54wiRX8jpCcZmjt+IyEt56kQJfBZWlH/l5P1uo1Xvv1bz
         0dnAfyMRq6OVPv//kuw6vUF5sSqV40UTwGR5F8RORH85WvLlZRNO7Hie5fp1uR1SGqwZ
         VekKyhhdpbIXOneSduTp6VcqtjoF3NwG1yWwlyNgdgqTv6iYwbksjfuBzCz+pxuWZtqN
         vRbw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1690640720; x=1691245520;
        h=content-transfer-encoding:in-reply-to:subject:from:references:to
         :content-language:user-agent:mime-version:date:message-id:sender
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=01w551jPRNSzBVPPiAESDIncvRwT/U2qS1PhN3wbXq4=;
        b=bwd3sXC85a9cWhpo44HBVCjTNfSV4z1kJZtFoIEPQfdbwi+H8q+Qg17fRA2xJVT4lW
         T+MXJQfkX/T9j3Via6q2rFSCbT9cVgxHqHEtpZ/VrIwUQcRaofmbTwEE+ZN9YeFxwOj7
         VXoy0aPHP3L7ZoSKLH/4nv0lrg8c1J7rmgAA6ZCy61+8Jr+ztk3yzhZ6elFymrpiJvXK
         VslpVUIbS9nZ4hsokB0YxX80/9NhusHZjD4qlIwI1ctcW1vMzLtvr2OGTYqZMeBhoFde
         r7Saw61daFLXelFqjUsEgInQUs2UzPFmMnkmAd9JpVQB8lw5NjkYEQ8X5+7OWY+bl4BV
         r0rQ==
X-Gm-Message-State: ABy/qLbyJh0tcI2gH7QpVSJ1P5L5mWX5OMuua/0/lDTRxkATE9CAEmXt
        sWvFKKSZbYAGyg914DMOScs=
X-Google-Smtp-Source: APBJJlFOizjjiBIWj7tzHXK8mFQxC/KOPfxQH2b44ivmA2s3seSPnxvHyavCFyQDO8Yy9yxo7qqOjg==
X-Received: by 2002:a17:903:1ce:b0:1b7:f611:a66b with SMTP id e14-20020a17090301ce00b001b7f611a66bmr5810498plh.31.1690640720482;
        Sat, 29 Jul 2023 07:25:20 -0700 (PDT)
Received: from ?IPV6:2600:1700:e321:62f0:329c:23ff:fee3:9d7c? ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
        by smtp.gmail.com with ESMTPSA id jj6-20020a170903048600b001bba7aab826sm5378442plb.163.2023.07.29.07.25.19
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 29 Jul 2023 07:25:20 -0700 (PDT)
Sender: Guenter Roeck <groeck7@gmail.com>
Message-ID: <f68e7fd4-211a-1f76-b0e1-472352554bcb@roeck-us.net>
Date:   Sat, 29 Jul 2023 07:25:18 -0700
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.13.0
Content-Language: en-US
To:     Daniel Matyas <daniel.matyas23@gmail.com>,
        linux-hwmon@vger.kernel.org
References: <ZMNlCTsslxeYjj/4@daniel-Precision-5530>
From:   Guenter Roeck <linux@roeck-us.net>
Subject: Re: Functional enhancement of max31827
In-Reply-To: <ZMNlCTsslxeYjj/4@daniel-Precision-5530>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-hwmon.vger.kernel.org>
X-Mailing-List: linux-hwmon@vger.kernel.org

On 7/27/23 23:49, Daniel Matyas wrote:
> Dear hwmon community,
> 
> I developed the driver for the max31827 temperature sensor, but when
> doing so I omitted some functionalities of the chip, namely: PEC Error,
> Fault Queue, Comp/Int, Alarm Polarity, Resolution, Timeout and PEC
> Enable. I did not implement these, because there are no predefined
> attributes in the linux kernel which have similar meaning to these
> funcionalities.
> 
> I recently got a request from the client to implement these
> functionalities. I want to use SENSOR_DEVICE_ATTR to implement these. I
> did some reading and saw that using debufs is also a possibility.
> 
> I would be really greatful, if you could provide me with some advices.
> Should I proceed with device attributes defined by me? Should I use
> debufs? Maybe there is another and better way...
> 

pec related attributes should be attached to the i2c interface. Other
drivers already do that; look for pec_{show,store}. The same is true
for timeout.

Comp/Int and Alarm polarity are system properties which should be set
via devicetree.

For others I am not sure. Fault Queue also smells like a system property
since normally one would only modify it if a given system requires it
(for example because the sensors are noisy). The same is true for sensor
resolution, though that one is closest for considering a sysfs attribute.
For most sensors, the resolution is closely related to conversion time
and can be handled with that attribute. I think that isn't the case here,
and there are numerous chips where the resolution is configurable, so it
may make sense to consider a sysfs attribute.

Guenter

