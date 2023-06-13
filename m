Return-Path: <linux-hwmon-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 461F6C77B7A
	for <linux-hwmon@archiver.kernel.org>; Tue, 13 Jun 2023 04:57:16 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S237495AbjFME5P (ORCPT <rfc822;linux-hwmon@archiver.kernel.org>);
        Tue, 13 Jun 2023 00:57:15 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59172 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S239712AbjFME5O (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>);
        Tue, 13 Jun 2023 00:57:14 -0400
Received: from mail-oi1-x231.google.com (mail-oi1-x231.google.com [IPv6:2607:f8b0:4864:20::231])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 80282C0
        for <linux-hwmon@vger.kernel.org>; Mon, 12 Jun 2023 21:57:04 -0700 (PDT)
Received: by mail-oi1-x231.google.com with SMTP id 5614622812f47-392116ae103so3015901b6e.0
        for <linux-hwmon@vger.kernel.org>; Mon, 12 Jun 2023 21:57:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1686632224; x=1689224224;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :sender:from:to:cc:subject:date:message-id:reply-to;
        bh=zyPW4enLSLkUEzMtEUkJNr7PUWyD6eRLmughrgiXKpo=;
        b=kdaiwwx8bOkzT12/uMvnqtNVWcpkEAkxfQJnO3Pcw7hvWaKz72l4mcn0o23DCUZgIY
         PEw07ZtXL+tFfCVoHv4Vvk4+JBD0Xftpp0oJe39Ytnj0JarkSarUjXZZfMYUEkYdelJ6
         +VzgBH09Ozr1E1Lo5tzck3/+tldxLVDToAdDS1b4XAg73+XQEtHei1IdyfK4PElCdLZi
         SAg4l6vAx91pYtl8tkJYWh9Hel0NibM+Ua94wM9ThRek8aDoRrlWBi6DSVnZmiiP7eSz
         QozIkmsB+BSW6ATi+GWdWBA6z54xZe+VAsstetq5kngO+b1hyNXThG04EdQ2nXiHB/6k
         dVsQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1686632224; x=1689224224;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :sender:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=zyPW4enLSLkUEzMtEUkJNr7PUWyD6eRLmughrgiXKpo=;
        b=MTrUxgjhV8MsjJH0MMCLnDW80QdU74OBSj5Ht0Gyd40tSc4mUY3UdEeQRHDTLGBQN3
         XPCPd+tXTsrd+d26H+Nqtf+zHJzqkwfis9r2RxJ9hazcDsljoLTtd5nTUl96pH05GvyF
         IpgJmMqxvS3DLDFdCp5T20OaGvdlP9FLcyA2GEBvsUoln1Z8Xd9v2OfNErH3Rhvdy2IY
         wtqsZ8NnOKqRxCj2AORiXEUYnpn3g0sLszuAyphbS6Mah5fAZ1uleOFcuvMfXvuufjKU
         ncGP3OBG8Vh1wKBmWl51Gc1D7ZJzmcEbXZHV8WS3GFzyAczJU6DCbtxWMrq3Jbi8g9x4
         0N9Q==
X-Gm-Message-State: AC+VfDwh7sYGL6qZ/LfTgPD68FWKB7gonOOFYYepbR7AMQ/NdCq8gRMT
        /LVz57wAAQIbO03lnlHqqdM=
X-Google-Smtp-Source: ACHHUZ7KEg4Ypchfbp1dme+ehsAFDOmIUjVZFJBm0tQXKD9d2Xl9EosgjRosCdCxR0f11+4t6CIMOg==
X-Received: by 2002:a05:6808:1187:b0:39c:8bd9:d8a2 with SMTP id j7-20020a056808118700b0039c8bd9d8a2mr6777748oil.2.1686632223644;
        Mon, 12 Jun 2023 21:57:03 -0700 (PDT)
Received: from ?IPV6:2600:1700:e321:62f0:329c:23ff:fee3:9d7c? ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
        by smtp.gmail.com with ESMTPSA id v12-20020a65568c000000b00514256c05c2sm7762314pgs.7.2023.06.12.21.57.01
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 12 Jun 2023 21:57:02 -0700 (PDT)
Sender: Guenter Roeck <groeck7@gmail.com>
Message-ID: <81601ed2-c1df-fd5e-2f01-6545ce4cf698@roeck-us.net>
Date:   Mon, 12 Jun 2023 21:57:00 -0700
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.11.0
Subject: Re: ASRock B650E Taichi support
Content-Language: en-US
To:     jurgenacc@tutanota.com
Cc:     "linux-hwmon@vger.kernel.org" <linux-hwmon@vger.kernel.org>
References: <NUjvz8u--3-9@tutanota.com>
 <5704a3ac-3097-74d5-e5a7-993fcd78a1e7@roeck-us.net>
 <NVUpwQa--3-9@tutanota.com>
 <94fd7588-dd3a-4530-bfe8-a213b68dfc33@roeck-us.net>
 <NVoIkKr--3-9@tutanota.com>
 <21fd227e-337b-4d87-a84a-d1bb9bea4110@roeck-us.net>
 <NVpLTjt--3-9@tutanota.com> <NXmqDz9--3-9@tutanota.com>
From:   Guenter Roeck <linux@roeck-us.net>
In-Reply-To: <NXmqDz9--3-9@tutanota.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-hwmon.vger.kernel.org>
X-Mailing-List: linux-hwmon@vger.kernel.org

On 6/12/23 20:42, jurgenacc@tutanota.com wrote:
> Is there anything I can do to help getting the support for NCT6799D? Also, is it normal that I don't see any sensors after loading NCT6686D?
> 
I think I'll probably just apply the current code for v6.5. It isn't perfect -
temperature sensor support is incomplete - but better incomplete support than
nothing.

For NCT6686D: You could try setting the "force" module parameter.

Guenter

> Thanks,
> Jurgen.
> 
> 
> May 19, 2023, 2:51 PM by jurgenacc@tutanota.com:
> 
>> My bad. I'm relatively new to Linux. This is the output of the "sensors" command:
>>
>> amdgpu-pci-0300
>> Adapter: PCI adapter
>> vddgfx:      825.00 mV
>> fan1:           0 RPM  (min =    0 RPM, max = 3300 RPM)
>> edge:         +34.0°C  (crit = +100.0°C, hyst = -273.1°C)
>>                         (emerg = +105.0°C)
>> junction:     +38.0°C  (crit = +110.0°C, hyst = -273.1°C)
>>                         (emerg = +115.0°C)
>> mem:          +38.0°C  (crit = +100.0°C, hyst = -273.1°C)
>>                         (emerg = +105.0°C)
>> PPT:          38.00 W  (cap = 303.00 W)
>>
>> k10temp-pci-00c3
>> Adapter: PCI adapter
>> Tctl:         +44.6°C
>> Tccd1:        +35.8°C
>> Tccd2:        +40.9°C
>>
>> nvme-pci-4700
>> Adapter: PCI adapter
>> Composite:    +40.9°C
>>
>> amdgpu-pci-5000
>> Adapter: PCI adapter
>> vddgfx:        1.32 V
>> vddnb:         1.15 V
>> edge:         +42.0°C
>> PPT:          46.25 W
>>
>> iwlwifi_1-virtual-0
>> Adapter: Virtual device
>> temp1:        +30.0°C
>>
>> nvme-pci-4f00
>> Adapter: PCI adapter
>> Composite:    +36.9°C  (low  = -273.1°C, high = +81.8°C)
>>                         (crit = +84.8°C)
>> Sensor 1:     +36.9°C  (low  = -273.1°C, high = +65261.8°C)
>> Sensor 2:     +42.9°C  (low  = -273.1°C, high = +65261.8°C)
>>
>> These are the same as before, so no new sensors.
>>
>> Thanks,
>> Jurgen.
>>
>>
>> May 19, 2023, 1:47 PM by linux@roeck-us.net:
>>
>>> On Fri, May 19, 2023 at 03:59:34PM +0200, jurgenacc@tutanota.com wrote:
>>>
>>>> Hi,
>>>>
>>>> Loading the nct6683 did not give an error. However the sensors-detect gives the same output "Sorry, no sensors were detected."
>>>>
>>> ??? The sensors-detect command and kernel drivers have no relationship
>>> to each other.
>>>
>>> Question is if you see any sensors after loading the nct6683 driver.
>>>
>>> Guenter
>>>
>>
>>
> 

