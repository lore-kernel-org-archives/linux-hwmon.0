Return-Path: <linux-hwmon-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 182A2C433F5
	for <linux-hwmon@archiver.kernel.org>; Wed, 27 Apr 2022 13:45:53 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236168AbiD0NtC (ORCPT <rfc822;linux-hwmon@archiver.kernel.org>);
        Wed, 27 Apr 2022 09:49:02 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44496 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S236336AbiD0Nsr (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>);
        Wed, 27 Apr 2022 09:48:47 -0400
Received: from mail-oi1-x230.google.com (mail-oi1-x230.google.com [IPv6:2607:f8b0:4864:20::230])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 7E3BE3E24C8
        for <linux-hwmon@vger.kernel.org>; Wed, 27 Apr 2022 06:45:34 -0700 (PDT)
Received: by mail-oi1-x230.google.com with SMTP id v65so1976107oig.10
        for <linux-hwmon@vger.kernel.org>; Wed, 27 Apr 2022 06:45:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=sender:message-id:date:mime-version:user-agent:subject
         :content-language:to:cc:references:from:in-reply-to
         :content-transfer-encoding;
        bh=HyGrdjmzrbAMtf1VKtoWYEf6piADwwUY+zQQt26oGQA=;
        b=qMIGvDLRE8oOL7krN52V7JLgg/T0XDmZSlD1Y6sbFXJwduXtaekfAhr/aB6GjdQlKp
         JyFdp0HIeOvEnFV/8MeQ8ONNMI6WhT+mCg0sNCDSwgj7xqm1vMBRlYhXdHdiA5a1Syn8
         9P6VpWKuTTr6oV3yIhZjW7LSyS/gKpVh0SN/v8QEhye9sWX34EY5F+geGEvbELQvkxpu
         /gweg12j4UKJDJjEq/GZDi5RlIhkT8+w0BFOycMwmmkCeyR9+yZOnoFBTFTRXcm2cCO8
         FrFcs+ONLi+cbjwd6fDuEH7szw+VuQO0OGY2OrbCESOB5ik6ESvuLegpDz0OMWmq9i2h
         ZaHA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:sender:message-id:date:mime-version:user-agent
         :subject:content-language:to:cc:references:from:in-reply-to
         :content-transfer-encoding;
        bh=HyGrdjmzrbAMtf1VKtoWYEf6piADwwUY+zQQt26oGQA=;
        b=lcWfQBsaqAUqJS51a/70pmjQLUtmfbL8CruKzfd24xk0qyqnQSSfkJ2GnQl3ZvU4Pt
         AXMC6+jMzsLpm/OQVU+b+jpqr28CC3ZbLLPs8tAY6UqWaCJ/qQE6mafDo0q00TGUhHRe
         Xuu8jpTBNIJ+Bz8itVyUquu3Z2CfxgQAlXSLkQUDJENWYeFoTo4GiVYaoDVDtmVsFSd1
         dEz+jtnW2CmuyDzm6gvsMyfznURJphNcSqxOYkBqkBIGRACwXHPITbpLv4mW015HtDbH
         qPb187o8F9UVoy/sHuZ53iWRPnRdcUWv0RoAcON1wnsD4zXBIBUAiXoh0MA7A4+6XU8O
         ujdw==
X-Gm-Message-State: AOAM5326os6+RAiNIKb/36yoNrmwml7vJkaxAPM4QBkK+M5Hesmfoa0N
        kMW3KbHbLFmVeLHpzel2ORI=
X-Google-Smtp-Source: ABdhPJwVCdPAyfTjjnaOrsSEKTDlkNqvT/ZE+97BYVD/+aMDgULmv0qzgXWqP5TJ4/aLlNvNwKIPQA==
X-Received: by 2002:a05:6808:10d0:b0:325:2a84:5a64 with SMTP id s16-20020a05680810d000b003252a845a64mr7681911ois.249.1651067134001;
        Wed, 27 Apr 2022 06:45:34 -0700 (PDT)
Received: from ?IPV6:2600:1700:e321:62f0:329c:23ff:fee3:9d7c? ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
        by smtp.gmail.com with ESMTPSA id t3-20020a05687044c300b000e686d13892sm628504oai.44.2022.04.27.06.45.31
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 27 Apr 2022 06:45:32 -0700 (PDT)
Sender: Guenter Roeck <groeck7@gmail.com>
Message-ID: <eef45828-82df-1771-0ef9-454008836154@roeck-us.net>
Date:   Wed, 27 Apr 2022 06:45:30 -0700
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.7.0
Subject: Re: [PATCH] hwmon (occ): Avoid polling OCC during probe
Content-Language: en-US
To:     Eddie James <eajames@linux.ibm.com>, linux-hwmon@vger.kernel.org
Cc:     jdelvare@suse.com, joel@jms.id.au
References: <20220426144555.12120-1-eajames@linux.ibm.com>
 <c813b754-591d-3fba-0450-7b73087c1de6@roeck-us.net>
 <b387f7b9-5b87-a2f9-501f-57258b70e387@linux.ibm.com>
From:   Guenter Roeck <linux@roeck-us.net>
In-Reply-To: <b387f7b9-5b87-a2f9-501f-57258b70e387@linux.ibm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-hwmon.vger.kernel.org>
X-Mailing-List: linux-hwmon@vger.kernel.org

On 4/26/22 08:26, Eddie James wrote:
> 
> On 4/26/22 10:01, Guenter Roeck wrote:
>> On 4/26/22 07:45, Eddie James wrote:
>>> Instead of polling the OCC during the probe, use the "occ_active"
>>> sysfs file to control when the driver polls the OCC for sensor data.
>>> The reason for this change is that the SBE, which is the device by
>>> which the driver communicates with the OCC, cannot handle communications
>>> during certain system state transitions.
>>>
>>
>> This is hackish, to say the least. Why not just instantiate the driver
>> manually instead if userspace interaction is indeed needed, and there
>> is no means to auto-instantiate it only after the hardware is ready ?
> 
> 
> Well, the occ-hwmon platform devices are currently created by the parent FSI occ device (that's a bit of a hack too). I poked through the platform/device/bus interfaces but couldn't work out how to create the device but not probe it, so that userspace could later bind the device to the driver. The current userspace does just that, but it relies on the the initial probe failing since SBE can't handle the communications yet. The error scenario is that the SBE can get into a bad state, so communications shouldn't even be attempted.
> 
> So to answer your question, there's no reason not to just instantiate the driver manually, but I don't actually know how to do so with these drivers.
> 
> 
>>
>> On the other side, what means does userspace have to determine that
>> the SBE/OCC is ready ? Can't that same mechanism not be used in the
>> kernel to auto-instantiate the driver ?
> 
> 
> No it's impossible, it's not just some bit we can check in HW unfortunately, the signal is PLDM (platform level data model) over the network.
> 

What a mess.

The subject and description are misleading. The code doesn't
"avoid polling during probe", it delays hwmon registration until
directed to do it by writing into a new sysfs attribute.
Please update accordingly.

Thanks,
Guenter
