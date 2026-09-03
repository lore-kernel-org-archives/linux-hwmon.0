Received: from mail-pg1-f176.google.com (mail-pg1-f176.google.com [209.85.215.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E589B397920
	for <linux-hwmon@vger.kernel.org>; Thu,  3 Sep 2026 18:25:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.176
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788459954; cv=none; b=OGkks6D7YoKCQb6GnIseukaYYFjs/S1m3tIrosr8AOFeXEGeHnv+/nqrNEm8w7XrdYABSV/NNkaF9yMCnn3wJqF8VllvAT74ZGKdVWIz47Enlhwm7kqY5GybdeFcrMi6fUVki1pwBr7LVUcd4yfBYDEVdregBkMcO+QbeYtklcI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788459954; c=relaxed/simple;
	bh=BmWTXzd0JbKtRhQn0a6Vq6PBbWnQ+GWQBkJ6EqYP3Js=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=UtVuqIqwpGYCncAj7g66JWnuLM0XYz5IArXsiaBrG1oieCOq7krs/uRYebGLBmpYmt0oLvV9LEgLNQA3lCLjm54ci1tZuMXA5gkoMbhjRS9DAYZ478zxgTXUnuq2CYh3K1GEgSfYm8sl2TcVFt/1aMaQaaeSMktEXrVLPqwLwnk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=cxEl14/T; arc=none smtp.client-ip=209.85.215.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="cxEl14/T"
Received: by mail-pg1-f176.google.com with SMTP id 41be03b00d2f7-ca80d708489so108239a12.1
        for <linux-hwmon@vger.kernel.org>; Thu, 03 Sep 2026 11:25:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788459938; x=1789064738; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=lh1NC+90e9f8GiH/DU3CMsC96o2J9Pk6lOGr43nttu8=;
        b=cxEl14/TDUiqo2ug/pn4Ph2sGylmz9+3nqYyTWH6CBDI6l7Kx7CwmpXm0nasg1ZHbn
         9cKlc362mxL56c5XbuNte0oF5pEo9RS4zWK+E2Z3bs3Jpl06Mf2vCSVEXAyRBcbe0SW0
         zhohtL7zu86b/gWXyb1A2nKLqW5fTNF3lZ2LK4b2AU68PFnQb0L0rw9pYVY0YlwDjf20
         dGONAU547wFRHutx8GdJWVYaPTITMx2dAlalTyLWs8KjegD80maYG6vE1g2zHWJR8DRh
         4BA1UMSOakbNUwLWMuegSPGub3CdlaoE3HSKu7qiVDWNbuQXCKe2eUrw1WUQOCx8EhUM
         tzaw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788459938; x=1789064738;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=lh1NC+90e9f8GiH/DU3CMsC96o2J9Pk6lOGr43nttu8=;
        b=Vg81gSzaOOGxlf98Xoladgwch00sCYICumaOfRbENmpN+UvvroclGmB1MhMFo8OtnB
         FHGs6ljzwf26lNSyQwj29RWm6+aCI2q/HOYw4JRtH3pHbFfhuDXg9Fyh0a4vq7M1losP
         P8caDa61tQEW9Wd704WvynfOtj/l4uPDHmACcUHh/F7nrC9PmUP5q5Bcx/A0b7oqU6dB
         AUAYH46rx0Y3MT5t15oBUQnsdsSo0EXXZS4KbkVMxTtbHRwERJXBkO2tswVhFZBO29DY
         1m4qaPe9XTgIw9VKT8iCnn+GQK5Ef1UPVx3WPL6mp8hX2/9zkxuQ/s5Zv90H/ol/GMhP
         0EkA==
X-Forwarded-Encrypted: i=1; AKwUvByT6m+mFFiG/b4j5/d457Cx4NMhGW6Gzw8mb9WRU60vgrVKrD9P7+AhyvMMC1TxIVRsG8sJpgVstvWTwQ==@vger.kernel.org
X-Gm-Message-State: AFuF++lPam7WSA/98DwelIK3HMI5qrYBWiU9hnr69oP8DYST4HSC2gP8
	rMMDLZpJ68bP72JfzDHqw9yEiT8UdYo7rhGveE3YrtbH/GeSiiDO7B4h6iRYVNZwcNY=
X-Gm-Gg: AYBFou2R9srPHq2bEYS2V9TZJGO7h82pf4UmY5autVeqWZjL3/YJkosiZ+gjcpNeUfN
	19jUPUTjk7W9WQSgMT2RPZIiHXzYJrooQTX5MkjQ/DvEYEzpeAf1iFcz5CKiCwH25Jx96eaUd8s
	dduDaQhZqQLMxk8jvkKHWXVtESPzCuAl5PpVVrA1yw0XIWmk+9y6im3LHZLG7TgFhsgCdPOKkdV
	yMrc/wQZvi3UdafESK8CnnUFnwKSs6VGmIxy07CVgB1RF26iiUTXfAfgQNjVVhG7QtdZ3TUoKYU
	u5Hnv6Z/qCAmx3g1cttW226oNyyuNJ5LPi6lTFbz0MaI+Xf77BqziEIEfA9p5UTEgKyBNzRFUED
	WxvThNYN2RKLUgDmCNHM+2AkjBUDoW7fsowZ9HkfTY6duQnGxzBXB+zVKr0gBjtau3VqhxgVQLT
	SRG9gQuH6vB1lZOyIJbnMdeorezEvlkLS0rqx3927R4hvy7B8v1JWZ/d+FYxj8F7NaDaMFpYN8i
	noDmoxywStMDvuTmqK6KNM+N+DqXk3EvxlWr+CKfN4WWELBgrLuV3o9z0xl
X-Received: by 2002:a17:90a:149:b0:38e:42f5:d096 with SMTP id 98e67ed59e1d1-39b12fccb47mr2852521a91.0.1788459937526;
        Thu, 03 Sep 2026 11:25:37 -0700 (PDT)
Received: from [10.21.0.95] (wnpgmb0592w-ds02-161-177-131.dynamic.bellmts.net. [207.161.177.131])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-39b08bcd243sm6629821a91.5.2026.09.03.11.25.36
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 03 Sep 2026 11:25:37 -0700 (PDT)
Message-ID: <e1a6a91d-d03e-4e7a-ba7b-9268284ce7e8@gmail.com>
Date: Thu, 3 Sep 2026 13:25:34 -0500
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Betterbird (Linux)
Subject: Re: [BUG] SPD5118 Intermittent MR11 Corruption During Suspend/Resume
To: Guenter Roeck <linux@roeck-us.net>
Cc: Armin Wolf <W_Armin@gmx.de>, linux-hwmon@vger.kernel.org,
 linux-kernel@vger.kernel.org, "Rafael J. Wysocki" <rafael@kernel.org>,
 "linux-acpi@vger.kernel.org" <linux-acpi@vger.kernel.org>
References: <46191fa9-fa4a-4c16-b618-2c0c6dc09102@gmx.de>
 <531be24a-bad0-40f6-8e30-3d4da565afcb@gmail.com>
 <a2efdc40-c73c-4892-9fea-9470c0f9823b@gmx.de>
 <0388506d-9ddc-4825-bf28-95c8eef219b6@gmail.com>
 <57a05dea-3cce-4ecf-bbe1-ab7464f8c224@gmx.de>
 <a5d32ab5-f545-4e11-bf0b-88d3eaa68890@gmail.com>
 <474a37bb-0774-4710-8458-ea28d7c54c89@gmx.de>
 <c81e7caf-d3e4-4212-be9b-ec35d0a04086@gmail.com>
 <c096b0d7-90c2-4d91-9776-9f109679c309@gmx.de>
 <7ca2e621-e0a1-4eee-bcd1-2ded610f1beb@gmail.com>
 <cff09168-9a88-494d-bc82-d9a5e4de22a7@roeck-us.net>
Content-Language: en-US
From: Matthew Bettencourt <matthew.bettencourt@gmail.com>
In-Reply-To: <cff09168-9a88-494d-bc82-d9a5e4de22a7@roeck-us.net>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

Hello Guenter,

 > This system [MSI PRO B850M-A WIF/7600x3d] does _not_ have a problem, 
or did I misunderstand the above ?

That is correct. I was unable to replicate the issue with the MSI PRO 
B850M-A WIF and 7600x3d. The MR11 registered never got corrupted during 
sleep/resume and I never saw any piix4 errors logged when using my piix4 
driver with the additional logging enabled.

I never swapped the CPUs as that was more hassle than I was willing to 
do right now, but if it something that might be useful I can probably 
try that at some point.

Thanks,
Matthew

On 9/3/26 1:16 PM, Guenter Roeck wrote:
> On Thu, Sep 03, 2026 at 01:01:30PM -0500, Matthew Bettencourt wrote:
>> I know we think we identify the root cause of the issue but I was curious if
>> this was an issue on my other system. I did some tests on both systems and
>> it looks like it iis only affecting my Asrock x870 Pro-A Wifi motherboard
>>
>> --- Test #1 - MSI PRO B850M-A WIFI/7600x3d/Teamgroup 2x16GB -
>> FLBD532G6000HC30DC01
>> Result: No issue. I used my piix4 driver with the extra logging but during
>> sleep/resume cycles I never saw any errors.
>>
>> --- Test #2 - MSI PRO B850M-A WIFI/7600x3d/G.Skill 2x32GB -
>> F5-6400J3239G32GX2-TZ5RK
>> Result: No issue. I used my piix4 driver with the extra logging but during
>> sleep/resume cycles I never saw any errors.
>>
>> --- Test #3 Asrock X870 Pro-A WiFi/9800x3d/Teamgroup 2x16GB -
>> FLBD532G6000HC30DC01
>> Result: I was able to replicate the issue. I loaded my piix4 driver with the
>> added logging and the on the first sleep I saw the errors I was getting with
>> the G.Skill kit. Upon waking up the MR11 was set to 0x08 and when I
>> attempted a warm reboot the system would not boot successfully. None of
>> motherboard diagnostic LEDs were illuminated. I had to do a full cold boot
>> before the system came up.
>>
>>
>> In case it is helpful is here some info from the MSI PRO B850M-A WIFI
>> system.
> 
> This system does _not_ have a problem, or did I misunderstand the above ?
> 
> Ultimately, if you have seen the problem only on the Asrock system, it might
> be either the CPU (7600x3d vs. 9800x3d), the chipset (B850M vs. X870), or
> the motherboard. Maybe we can find more information from others to narrow
> it down further. Worst case we may have to disable the driver for affected
> boards or CPUs.
> 
> Thanks,
> Guenter
> 
>> DESKTOP-V211MG0:~ # i2cdetect -l
>> i2c-0   i2c             Synopsys DesignWare I2C adapter         I2C adapter
>> i2c-1   i2c             AMDGPU SMU 0                            I2C adapter
>> i2c-2   i2c             AMDGPU SMU 1                            I2C adapter
>> i2c-3   i2c             AMDGPU DM i2c hw bus 0                  I2C adapter
>> i2c-4   i2c             AMDGPU DM i2c hw bus 1                  I2C adapter
>> i2c-5   i2c             AMDGPU DM i2c hw bus 2                  I2C adapter
>> i2c-6   i2c             AMDGPU DM i2c hw bus 3                  I2C adapter
>> i2c-7   i2c             AMDGPU DM aux hw bus 0                  I2C adapter
>> i2c-8   i2c             AMDGPU DM aux hw bus 1                  I2C adapter
>> i2c-9   i2c             AMDGPU DM aux hw bus 2                  I2C adapter
>> i2c-10  smbus           SMBus PIIX4 adapter port 0 at 0b00      SMBus
>> adapter
>> i2c-11  smbus           SMBus PIIX4 adapter port 2 at 0b00      SMBus
>> adapter
>> i2c-12  smbus           SMBus PIIX4 adapter port 1 at 0b20      SMBus
>> adapter
>> DESKTOP-V211MG0:~ # i2cdetect -y 10
>>       0  1  2  3  4  5  6  7  8  9  a  b  c  d  e  f
>> 00:                         -- -- -- -- -- -- -- --
>> 10: -- -- -- -- -- 15 -- -- -- -- -- -- -- -- -- --
>> 20: -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- --
>> 30: -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- --
>> 40: -- -- -- -- -- -- -- -- -- 49 -- 4b -- -- -- 4f
>> 50: -- UU -- UU -- -- -- -- -- -- -- -- -- -- -- --
>> 60: -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- --
>> 70: -- -- -- -- -- -- -- --
>> DESKTOP-V211MG0:~ # cat /proc/iomem
>> 00000000-00000fff : Reserved
>> 00001000-0009ffff : System RAM
>> 000a0000-000fffff : Reserved
>>    000a0000-000dffff : PCI Bus 0000:00
>>    000f0000-000fffff : System ROM
>> 00100000-099fefff : System RAM
>> 099ff000-09ffffff : Reserved
>> 0a000000-0a1fffff : System RAM
>> 0a200000-0a20ffff : ACPI Non-volatile Storage
>> 0a210000-0affffff : System RAM
>> 0b000000-0b020fff : Reserved
>> 0b021000-6fd35fff : System RAM
>> 6fd36000-6fd92fff : Reserved
>> 6fd93000-742d1fff : System RAM
>> 742d2000-742d2fff : Reserved
>> 742d3000-78b7efff : System RAM
>> 78b7f000-95cfefff : Reserved
>>    95cce000-95cd1fff : MSFT0101:00
>>      95cce000-95cd1fff : MSFT0101:00
>>    95cd2000-95cd5fff : MSFT0101:00
>>      95cd2000-95cd5fff : MSFT0101:00
>> 95cff000-97cfefff : ACPI Non-volatile Storage
>> 97cff000-97dfefff : ACPI Tables
>> 97dff000-98708fff : System RAM
>> 98709000-98709fff : ACPI Non-volatile Storage
>> 9870a000-99e81fff : System RAM
>> 99e82000-99e83fff : ACPI Non-volatile Storage
>> 99e84000-99ff8fff : System RAM
>> 99ff9000-99ffbfff : Reserved
>> 99ffc000-99ffffff : System RAM
>> 9a000000-9bffffff : Reserved
>> 9d7f3000-9d7fffff : Reserved
>> a0000000-dfffffff : PCI Bus 0000:00
>>    dee00000-df4fffff : PCI Bus 0000:05
>>      dee00000-df4fffff : PCI Bus 0000:06
>>        dee00000-df0fffff : PCI Bus 0000:0f
>>          dee00000-deffffff : 0000:0f:00.0
>>            dee00000-deffffff : 0000:0f:00.0
>>          df000000-df007fff : 0000:0f:00.0
>>        df200000-df2fffff : PCI Bus 0000:11
>>          df200000-df27ffff : 0000:11:00.0
>>          df280000-df2803ff : 0000:11:00.0
>>            df280000-df2803ff : ahci
>>        df300000-df3fffff : PCI Bus 0000:10
>>          df300000-df307fff : 0000:10:00.0
>>            df300000-df307fff : xhci-hcd
>>        df400000-df4fffff : PCI Bus 0000:0e
>>          df400000-df40ffff : 0000:0e:00.0
>>            df400000-df40ffff : r8169
>>          df410000-df413fff : 0000:0e:00.0
>>    df600000-df9fffff : PCI Bus 0000:13
>>      df600000-df6fffff : 0000:13:00.4
>>        df600000-df6fffff : xhci-hcd
>>      df700000-df7fffff : 0000:13:00.3
>>        df700000-df7fffff : xhci-hcd
>>      df800000-df8fffff : 0000:13:00.2
>>        df800000-df8fffff : ccp
>>      df900000-df907fff : 0000:13:00.6
>>        df900000-df907fff : ICH HD audio
>>      df908000-df909fff : 0000:13:00.2
>>        df908000-df909fff : ccp
>>    dfa00000-dfcfffff : PCI Bus 0000:01
>>      dfa00000-dfbfffff : PCI Bus 0000:02
>>        dfa00000-dfbfffff : PCI Bus 0000:03
>>          dfa00000-dfafffff : 0000:03:00.0
>>          dfb00000-dfb1ffff : 0000:03:00.0
>>          dfb20000-dfb23fff : 0000:03:00.1
>>            dfb20000-dfb23fff : ICH HD audio
>>      dfc00000-dfc03fff : 0000:01:00.0
>>    dfd00000-dfdfffff : PCI Bus 0000:14
>>      dfd00000-dfdfffff : 0000:14:00.0
>>        dfd00000-dfdfffff : xhci-hcd
>>    dfe00000-dfefffff : PCI Bus 0000:12
>>      dfe00000-dfe03fff : 0000:12:00.0
>>        dfe00000-dfe03fff : nvme
>>      dfe04000-dfe05fff : 0000:12:00.0
>>        dfe04000-dfe05fff : nvme
>>    dff00000-dfffffff : PCI Bus 0000:04
>>      dff00000-dff03fff : 0000:04:00.0
>>        dff00000-dff03fff : nvme
>> e0000000-efffffff : PCI ECAM 0000 [bus 00-ff]
>>    e0000000-efffffff : PNP0C01:00
>> f0000000-f1ffffff : PCI Bus 0000:00
>> f2000000-f6ffffff : PCI Bus 0000:00
>> f7200000-f72fffff : PNP0C02:02
>>    f7210510-f721053f : MSFT0101:00
>> f7600000-f767ffff : amd_iommu
>> feb00000-feb00fff : PNP0C02:04
>>    feb00000-feb00007 : SB800 TCO
>> fec00000-fec003ff : IOAPIC 0
>> fec01000-fec013ff : IOAPIC 1
>> fec10000-fec10fff : PNP0C02:04
>> fec40000-fec40fff : AMDIF031:00
>>    fec40000-fec40fff : AMDIF031:00 AMDIF031:00
>> fed00000-fed003ff : HPET 0
>>    fed00000-fed003ff : PNP0103:00
>> fed81500-fed818ff : AMDI0030:00
>>    fed81500-fed818ff : AMDI0030:00 AMDI0030:00
>> fedc0000-fedc0fff : PNP0C02:04
>> fedc2000-fedc2fff : AMDI0010:00
>>    fedc2000-fedc2fff : AMDI0010:00 AMDI0010:00
>> fee00000-fee00fff : Reserved
>>    fee00000-fee00fff : PNP0C02:04
>> ff000000-ffffffff : PNP0C02:04
>> 100000000-85defffff : System RAM
>>    440200000-44145356f : Kernel code
>>    441600000-44255cfff : Kernel rodata
>>    442600000-44293b23f : Kernel data
>>    443260000-4437fffff : Kernel bss
>> 85df00000-85ef3ffff : RAM buffer
>> 85ef40000-85fffffff : Reserved
>> 860000000-fcffffffff : PCI Bus 0000:00
>>    f800000000-fc0fffffff : PCI Bus 0000:01
>>      f800000000-fc0fffffff : PCI Bus 0000:02
>>        f800000000-fc0fffffff : PCI Bus 0000:03
>>          f800000000-fbffffffff : 0000:03:00.0
>>          fc00000000-fc0fffffff : 0000:03:00.0
>> fd00000000-ffffffffff : Reserved
>> 3ffc00000000-3fffffffffff : 0000:03:00.0
>> DESKTOP-V211MG0:~ # cat /proc/ioports
>> 0000-03af : PCI Bus 0000:00
>>    0000-001f : dma1
>>    0020-0021 : pic1
>>    0040-0043 : timer0
>>    0050-0053 : timer1
>>    0060-0060 : keyboard
>>    0061-0061 : PNP0800:00
>>    0064-0064 : keyboard
>>    0070-0071 : PNP0B00:00
>>      0070-0071 : rtc0
>>    0080-008f : dma page reg
>>    00a0-00a1 : pic2
>>    00b4-00b4 : ACPI PM2_CNT_BLK
>>    00c0-00df : dma2
>>    00f0-00ff : fpu
>> 03b0-03df : PCI Bus 0000:00
>> 03e0-0cf7 : PCI Bus 0000:00
>>    03f8-03ff : serial
>>    040b-040b : PNP0C02:04
>>    04d0-04d1 : PNP0C02:04
>>    04d6-04d6 : PNP0C02:04
>>    0800-089f : PNP0C02:04
>>      0800-0803 : ACPI PM1a_EVT_BLK
>>      0804-0805 : ACPI PM1a_CNT_BLK
>>      0808-080b : ACPI PM_TMR
>>      0820-0827 : ACPI GPE0_BLK
>>    0900-090f : PNP0C02:04
>>    0910-091f : PNP0C02:04
>>    0a00-0a0f : PNP0C02:03
>>    0a10-0a1f : PNP0C02:03
>>    0a20-0a2f : PNP0C02:03
>>    0b00-0b0f : PNP0C02:04
>>      0b00-0b08 : piix4_smbus
>>    0b20-0b3f : PNP0C02:04
>>      0b20-0b28 : piix4_smbus
>>    0c00-0c01 : PNP0C02:04
>>    0c14-0c14 : PNP0C02:04
>>    0c50-0c51 : PNP0C02:04
>>    0c52-0c52 : PNP0C02:04
>>    0c6c-0c6c : PNP0C02:04
>>    0c6f-0c6f : PNP0C02:04
>>    0cd8-0cdf : PNP0C02:04
>> 0cf8-0cff : PCI conf1
>> 0d00-ffff : PCI Bus 0000:00
>>    e000-efff : PCI Bus 0000:05
>>      e000-efff : PCI Bus 0000:06
>>        e000-efff : PCI Bus 0000:0e
>>          e000-e0ff : 0000:0e:00.0
>>    f000-ffff : PCI Bus 0000:01
>>      f000-ffff : PCI Bus 0000:02
>>        f000-ffff : PCI Bus 0000:03
>>          f000-f0ff : 0000:03:00.0
>> DESKTOP-V211MG0:~ # dmesg | grep -iE "resource|conflict|acpi"
>> [    0.000000] [      T0] BIOS-e820: [mem
>> 0x000000000a200000-0x000000000a20ffff]  ACPI NVS
>> [    0.000000] [      T0] BIOS-e820: [mem
>> 0x0000000095cff000-0x0000000097cfefff]  ACPI NVS
>> [    0.000000] [      T0] BIOS-e820: [mem
>> 0x0000000097cff000-0x0000000097dfefff]  ACPI data
>> [    0.000000] [      T0] BIOS-e820: [mem
>> 0x0000000098709000-0x0000000098709fff]  ACPI NVS
>> [    0.000000] [      T0] BIOS-e820: [mem
>> 0x0000000099e82000-0x0000000099e83fff]  ACPI NVS
>> [    0.000000] [      T0] efi: ACPI=0x97ce5000 ACPI 2.0=0x97ce5014
>> TPMFinalLog=0x97cb1000 SMBIOS=0x84861000 SMBIOS 3.0=0x84860000
>> MEMATTR=0x7213a018 ESRT=0x742d2098 MOKvar=0x81c9d000 INITRD=0x633f8f98
>> RNG=0x97d51018 TPMEventLog=0x97d44018
>> [    0.003514] [      T0] ACPI: Early table checksum verification disabled
>> [    0.003517] [      T0] ACPI: RSDP 0x0000000097CE5014 000024 (v02 ALASKA)
>> [    0.003520] [      T0] ACPI: XSDT 0x0000000097CE4728 00010C (v01 ALASKA A
>> M I    01072009 AMI  01000013)
>> [    0.003524] [      T0] ACPI: FACP 0x0000000097DF4000 000114 (v06 ALASKA A
>> M I    01072009 AMI  00010013)
>> [    0.003527] [      T0] ACPI: DSDT 0x0000000097D7C000 06C316 (v02 ALASKA A
>> M I    01072009 INTL 20230628)
>> [    0.003528] [      T0] ACPI: FACS 0x0000000097CE1000 000040
>> [    0.003529] [      T0] ACPI: _SDM 0x0000000098709000 000055 (v03 ALASKA A
>> M I    01072009 AMI  01000013)
>> [    0.003531] [      T0] ACPI: SSDT 0x0000000097DF6000 008689 (v02 AMD
>> Splinter 00000002 MSFT 04000000)
>> [    0.003532] [      T0] ACPI: SSDT 0x0000000097DF5000 0001AD (v02 ALASKA
>> CPUSSDT  01072009 AMI  01072009)
>> [    0.003533] [      T0] ACPI: FIDT 0x0000000097DED000 00009D (v01 ALASKA A
>> M I    01072009 AMI  00010013)
>> [    0.003535] [      T0] ACPI: MCFG 0x0000000097DEC000 00003C (v01 ALASKA A
>> M I    01072009 MSFT 00010013)
>> [    0.003536] [      T0] ACPI: HPET 0x0000000097DEB000 000038 (v01 ALASKA A
>> M I    01072009 AMI  00000005)
>> [    0.003537] [      T0] ACPI: WDRT 0x0000000097DEA000 000047 (v01 ALASKA A
>> M I    01072009 AMI  00000005)
>> [    0.003538] [      T0] ACPI: UEFI 0x00000000972A3000 000048 (v01 ALASKA A
>> M I    01072009 AMI  01000013)
>> [    0.003539] [      T0] ACPI: FPDT 0x0000000097DE9000 000044 (v01 ALASKA A
>> M I    01072009 AMI  01000013)
>> [    0.003541] [      T0] ACPI: VFCT 0x0000000097D6D000 00E284 (v01 ALASKA A
>> M I    00000001 AMD  33504F47)
>> [    0.003542] [      T0] ACPI: SSDT 0x0000000097DF0000 003A7E (v02 AMD
>> AMD CPU  00000001 AMD  00000001)
>> [    0.003543] [      T0] ACPI: SSDT 0x0000000097DEF000 000041 (v02 AMD
>> AppCompD 00000001 INTL 20230628)
>> [    0.003544] [      T0] ACPI: BGRT 0x0000000097DEE000 000038 (v01 ALASKA A
>> M I    01072009 AMI  00010013)
>> [    0.003546] [      T0] ACPI: TPM2 0x0000000097D6C000 00004C (v04 ALASKA A
>> M I    00000001 AMI  00000000)
>> [    0.003547] [      T0] ACPI: SSDT 0x0000000097D6B000 0006D4 (v02 AMD
>> CPMWLRC  00000001 INTL 20230628)
>> [    0.003548] [      T0] ACPI: SSDT 0x0000000097D6A000 0008BA (v02 AMD
>> CPMDFDG2 00000001 INTL 20230628)
>> [    0.003550] [      T0] ACPI: SSDT 0x0000000097D69000 000788 (v02 AMD
>> CPMDFIG5 00000001 INTL 20230628)
>> [    0.003551] [      T0] ACPI: SSDT 0x0000000097D5F000 009B81 (v02 AMD
>> CPMCMN   00000001 INTL 20230628)
>> [    0.003552] [      T0] ACPI: SSDT 0x0000000097D5C000 002891 (v02 AMD
>> AOD      00000001 INTL 20230628)
>> [    0.003553] [      T0] ACPI: WSMT 0x0000000097D5B000 000028 (v01 ALASKA A
>> M I    01072009 AMI  00010013)
>> [    0.003555] [      T0] ACPI: APIC 0x0000000097D5A000 00015E (v06 ALASKA A
>> M I    01072009 AMI  00010013)
>> [    0.003556] [      T0] ACPI: IVRS 0x0000000097D59000 00019E (v02 AMD
>> AmdTable 00000001 AMD  00000001)
>> [    0.003557] [      T0] ACPI: SSDT 0x0000000097D58000 000500 (v02 AMD
>> MEMTOOL0 00000002 INTL 20230628)
>> [    0.003559] [      T0] ACPI: SSDT 0x0000000097D57000 0009D0 (v02 AMD
>> CPMMSOSC 00000001 INTL 20230628)
>> [    0.003560] [      T0] ACPI: SSDT 0x0000000097D56000 00047C (v02 AMD
>> AMDWOV   00000001 INTL 20230628)
>> [    0.003561] [      T0] ACPI: SSDT 0x0000000097D54000 001046 (v02 AMD
>> CPMACPV4 00000001 INTL 20230628)
>> [    0.003562] [      T0] ACPI: SSDT 0x0000000097D53000 00053E (v02 AMD
>> CPMAPMFD 00000001 INTL 20230628)
>> [    0.003563] [      T0] ACPI: SSDT 0x0000000097D52000 00044E (v02 AMD
>> AmdTable 00000001 INTL 20230628)
>> [    0.003564] [      T0] ACPI: Reserving FACP table memory at [mem
>> 0x97df4000-0x97df4113]
>> [    0.003565] [      T0] ACPI: Reserving DSDT table memory at [mem
>> 0x97d7c000-0x97de8315]
>> [    0.003566] [      T0] ACPI: Reserving FACS table memory at [mem
>> 0x97ce1000-0x97ce103f]
>> [    0.003567] [      T0] ACPI: Reserving _SDM table memory at [mem
>> 0x98709000-0x98709054]
>> [    0.003567] [      T0] ACPI: Reserving SSDT table memory at [mem
>> 0x97df6000-0x97dfe688]
>> [    0.003568] [      T0] ACPI: Reserving SSDT table memory at [mem
>> 0x97df5000-0x97df51ac]
>> [    0.003568] [      T0] ACPI: Reserving FIDT table memory at [mem
>> 0x97ded000-0x97ded09c]
>> [    0.003569] [      T0] ACPI: Reserving MCFG table memory at [mem
>> 0x97dec000-0x97dec03b]
>> [    0.003569] [      T0] ACPI: Reserving HPET table memory at [mem
>> 0x97deb000-0x97deb037]
>> [    0.003570] [      T0] ACPI: Reserving WDRT table memory at [mem
>> 0x97dea000-0x97dea046]
>> [    0.003571] [      T0] ACPI: Reserving UEFI table memory at [mem
>> 0x972a3000-0x972a3047]
>> [    0.003571] [      T0] ACPI: Reserving FPDT table memory at [mem
>> 0x97de9000-0x97de9043]
>> [    0.003572] [      T0] ACPI: Reserving VFCT table memory at [mem
>> 0x97d6d000-0x97d7b283]
>> [    0.003572] [      T0] ACPI: Reserving SSDT table memory at [mem
>> 0x97df0000-0x97df3a7d]
>> [    0.003573] [      T0] ACPI: Reserving SSDT table memory at [mem
>> 0x97def000-0x97def040]
>> [    0.003573] [      T0] ACPI: Reserving BGRT table memory at [mem
>> 0x97dee000-0x97dee037]
>> [    0.003574] [      T0] ACPI: Reserving TPM2 table memory at [mem
>> 0x97d6c000-0x97d6c04b]
>> [    0.003574] [      T0] ACPI: Reserving SSDT table memory at [mem
>> 0x97d6b000-0x97d6b6d3]
>> [    0.003575] [      T0] ACPI: Reserving SSDT table memory at [mem
>> 0x97d6a000-0x97d6a8b9]
>> [    0.003576] [      T0] ACPI: Reserving SSDT table memory at [mem
>> 0x97d69000-0x97d69787]
>> [    0.003577] [      T0] ACPI: Reserving SSDT table memory at [mem
>> 0x97d5f000-0x97d68b80]
>> [    0.003577] [      T0] ACPI: Reserving SSDT table memory at [mem
>> 0x97d5c000-0x97d5e890]
>> [    0.003578] [      T0] ACPI: Reserving WSMT table memory at [mem
>> 0x97d5b000-0x97d5b027]
>> [    0.003578] [      T0] ACPI: Reserving APIC table memory at [mem
>> 0x97d5a000-0x97d5a15d]
>> [    0.003579] [      T0] ACPI: Reserving IVRS table memory at [mem
>> 0x97d59000-0x97d5919d]
>> [    0.003580] [      T0] ACPI: Reserving SSDT table memory at [mem
>> 0x97d58000-0x97d584ff]
>> [    0.003580] [      T0] ACPI: Reserving SSDT table memory at [mem
>> 0x97d57000-0x97d579cf]
>> [    0.003581] [      T0] ACPI: Reserving SSDT table memory at [mem
>> 0x97d56000-0x97d5647b]
>> [    0.003581] [      T0] ACPI: Reserving SSDT table memory at [mem
>> 0x97d54000-0x97d55045]
>> [    0.003582] [      T0] ACPI: Reserving SSDT table memory at [mem
>> 0x97d53000-0x97d5353d]
>> [    0.003582] [      T0] ACPI: Reserving SSDT table memory at [mem
>> 0x97d52000-0x97d5244d]
>> [    0.004295] [      T0] ACPI: PM-Timer IO Port: 0x808
>> [    0.004300] [      T0] ACPI: LAPIC_NMI (acpi_id[0xff] high edge
>> lint[0x1])
>> [    0.004314] [      T0] ACPI: INT_SRC_OVR (bus 0 bus_irq 0 global_irq 2
>> dfl dfl)
>> [    0.004315] [      T0] ACPI: INT_SRC_OVR (bus 0 bus_irq 9 global_irq 9
>> low level)
>> [    0.004317] [      T0] ACPI: Using ACPI (MADT) for SMP configuration
>> information
>> [    0.004318] [      T0] ACPI: HPET id: 0x10228201 base: 0xfed00000
>> [    0.029146] [      T0] ACPI: Core revision 20260408
>> [    0.195872] [      T1] ACPI: PM: Registering ACPI NVS region [mem
>> 0x0a200000-0x0a20ffff] (65536 bytes)
>> [    0.195872] [      T1] ACPI: PM: Registering ACPI NVS region [mem
>> 0x95cff000-0x97cfefff] (33554432 bytes)
>> [    0.195872] [      T1] ACPI: PM: Registering ACPI NVS region [mem
>> 0x98709000-0x98709fff] (4096 bytes)
>> [    0.195872] [      T1] ACPI: PM: Registering ACPI NVS region [mem
>> 0x99e82000-0x99e83fff] (8192 bytes)
>> [    0.211568] [      T1] acpiphp: ACPI Hot Plug PCI Controller Driver
>> version: 0.5
>> [    0.212716] [      T1] ACPI: Added _OSI(Module Device)
>> [    0.212717] [      T1] ACPI: Added _OSI(Processor Device)
>> [    0.212719] [      T1] ACPI: Added _OSI(Processor Aggregator Device)
>> [    0.232763] [      T1] ACPI: 16 ACPI AML tables successfully acquired and
>> loaded
>> [    0.262944] [      T1] ACPI: \_SB_: platform _OSC: OS support mask
>> [006e7eff]
>> [    0.263452] [      T1] ACPI: \_SB_: platform _OSC: OS control mask
>> [006e7eff]
>> [    0.263758] [      T1] ACPI: USB4 _OSC: OS supports USB3+ DisplayPort+
>> PCIe+ XDomain+
>> [    0.263759] [      T1] ACPI: USB4 _OSC: OS controls USB3+ DisplayPort+
>> PCIe+ XDomain+
>> [    0.264875] [      T1] ACPI: Interpreter enabled
>> [    0.264891] [      T1] ACPI: PM: (supports S0 S3 S4 S5)
>> [    0.264892] [      T1] ACPI: Using IOAPIC for interrupt routing
>> [    0.267118] [      T1] PCI: Using host bridge windows from ACPI; if
>> necessary, use "pci=nocrs" and report a bug
>> [    0.267546] [      T1] ACPI: Enabled 10 GPEs in block 00 to 1F
>> [    0.270413] [      T1] ACPI: \_SB_.PCI0.GP17.XHC0.P0U0: New power
>> resource
>> [    0.272310] [      T1] ACPI: \_SB_.PCI0.GP17.XHC1.P0U1: New power
>> resource
>> [    0.276206] [      T1] ACPI: \_SB_.PCI0.GP19.XHC2.P0U2: New power
>> resource
>> [    0.276979] [      T1] ACPI: \_SB_.PCI0.GPP0.M237: New power resource
>> [    0.277047] [      T1] ACPI: \_SB_.PCI0.GPP0.SWUS.M237: New power
>> resource
>> [    0.277122] [      T1] ACPI: \_SB_.PCI0.GPP0.SWUS.SWDS.M237: New power
>> resource
>> [    0.277430] [      T1] ACPI: \_SB_.PCI0.GPP1.P0NV: New power resource
>> [    0.278464] [      T1] ACPI: \_SB_.PCI0.GPP7.PWRS: New power resource
>> [    0.278856] [      T1] ACPI: \_SB_.PCI0.GPP7.UP00.PWRS: New power
>> resource
>> [    0.279214] [      T1] ACPI: \_SB_.PCI0.GPP7.UP00.DP00.PWRS: New power
>> resource
>> [    0.279920] [      T1] ACPI: \_SB_.PCI0.GPP7.UP00.DP08.PWRS: New power
>> resource
>> [    0.280176] [      T1] ACPI: \_SB_.PCI0.GPP7.UP00.DP08.EP00.PWRS: New
>> power resource
>> [    0.280465] [      T1] ACPI: \_SB_.PCI0.GPP7.UP00.DP10.PWRS: New power
>> resource
>> [    0.280721] [      T1] ACPI: \_SB_.PCI0.GPP7.UP00.DP10.WN00.PWRS: New
>> power resource
>> [    0.281009] [      T1] ACPI: \_SB_.PCI0.GPP7.UP00.DP18.PWRS: New power
>> resource
>> [    0.281262] [      T1] ACPI: \_SB_.PCI0.GPP7.UP00.DP18.LN00.PWRS: New
>> power resource
>> [    0.281547] [      T1] ACPI: \_SB_.PCI0.GPP7.UP00.DP20.PWRS: New power
>> resource
>> [    0.282249] [      T1] ACPI: \_SB_.PCI0.GPP7.UP00.DP28.PWRS: New power
>> resource
>> [    0.282563] [      T1] ACPI: \_SB_.PCI0.GPP7.UP00.DP30.PWRS: New power
>> resource
>> [    0.283076] [      T1] ACPI: \_SB_.PCI0.GPP7.UP00.DP30.EP00.PWRS: New
>> power resource
>> [    0.283389] [      T1] ACPI: \_SB_.PCI0.GPP7.UP00.DP38.PWRS: New power
>> resource
>> [    0.283896] [      T1] ACPI: \_SB_.PCI0.GPP7.UP00.DP38.EP00.PWRS: New
>> power resource
>> [    0.284281] [      T1] ACPI: \_SB_.PCI0.GPP7.UP00.DP40.PWRS: New power
>> resource
>> [    0.284513] [      T1] ACPI: \_SB_.PCI0.GPP7.UP00.DP48.PWRS: New power
>> resource
>> [    0.285020] [      T1] ACPI: \_SB_.PCI0.GPP7.UP00.DP48.EP00.PWRS: New
>> power resource
>> [    0.285333] [      T1] ACPI: \_SB_.PCI0.GPP7.UP00.DP50.PWRS: New power
>> resource
>> [    0.285694] [      T1] ACPI: \_SB_.PCI0.GPP7.UP00.DP50.EP00.PWRS: New
>> power resource
>> [    0.286053] [      T1] ACPI: \_SB_.PCI0.GPP7.UP00.DP58.PWRS: New power
>> resource
>> [    0.286409] [      T1] ACPI: \_SB_.PCI0.GPP7.UP00.DP58.EP00.PWRS: New
>> power resource
>> [    0.286767] [      T1] ACPI: \_SB_.PCI0.GPP7.UP00.DP60.PWRS: New power
>> resource
>> [    0.287120] [      T1] ACPI: \_SB_.PCI0.GPP7.UP00.DP60.XH00.PWRS: New
>> power resource
>> [    0.292508] [      T1] ACPI: \_SB_.PCI0.GPP7.UP00.DP68.PWRS: New power
>> resource
>> [    0.292815] [      T1] ACPI: \_SB_.PCI0.GPP7.UP00.DP68.SA00.PWRS: New
>> power resource
>> [    0.292870] [      T1] ACPI: \_SB_.PCI0.GPP8.PWR1: New power resource
>> [    0.298205] [      T1] ACPI: \_SB_.PRWL: New power resource
>> [    0.298234] [      T1] ACPI: \_SB_.PRWB: New power resource
>> [    0.299179] [      T1] ACPI: PCI Root Bridge [PCI0] (domain 0000 [bus
>> 00-ff])
>> [    0.299184] [      T1] acpi PNP0A08:00: _OSC: OS supports [ExtendedConfig
>> ASPM ClockPM Segments MSI EDR HPX-Type3]
>> [    0.299349] [      T1] acpi PNP0A08:00: _OSC: OS now controls
>> [PCIeHotplug SHPCHotplug PME AER PCIeCapability LTR DPC]
>> [    0.300031] [      T1] pci_bus 0000:00: root bus resource [io
>> 0x0000-0x03af window]
>> [    0.300033] [      T1] pci_bus 0000:00: root bus resource [io
>> 0x03e0-0x0cf7 window]
>> [    0.300034] [      T1] pci_bus 0000:00: root bus resource [io
>> 0x03b0-0x03df window]
>> [    0.300036] [      T1] pci_bus 0000:00: root bus resource [io
>> 0x0d00-0xffff window]
>> [    0.300037] [      T1] pci_bus 0000:00: root bus resource [mem
>> 0x000a0000-0x000dffff window]
>> [    0.300038] [      T1] pci_bus 0000:00: root bus resource [mem
>> 0xf2000000-0xf6ffffff window]
>> [    0.300040] [      T1] pci_bus 0000:00: root bus resource [mem
>> 0xf0000000-0xf1ffffff window]
>> [    0.300041] [      T1] pci_bus 0000:00: root bus resource [mem
>> 0xa0000000-0xdfffffff window]
>> [    0.300042] [      T1] pci_bus 0000:00: root bus resource [mem
>> 0x860000000-0xfcffffffff window]
>> [    0.300044] [      T1] pci_bus 0000:00: root bus resource [bus 00-ff]
>> [    0.331546] [      T1] ACPI: PCI: Interrupt link LNKA configured for IRQ
>> 0
>> [    0.331599] [      T1] ACPI: PCI: Interrupt link LNKB configured for IRQ
>> 0
>> [    0.331645] [      T1] ACPI: PCI: Interrupt link LNKC configured for IRQ
>> 0
>> [    0.331700] [      T1] ACPI: PCI: Interrupt link LNKD configured for IRQ
>> 0
>> [    0.331751] [      T1] ACPI: PCI: Interrupt link LNKE configured for IRQ
>> 0
>> [    0.331793] [      T1] ACPI: PCI: Interrupt link LNKF configured for IRQ
>> 0
>> [    0.331835] [      T1] ACPI: PCI: Interrupt link LNKG configured for IRQ
>> 0
>> [    0.331878] [      T1] ACPI: PCI: Interrupt link LNKH configured for IRQ
>> 0
>> [    0.342854] [      T1] PCI: Using ACPI for IRQ routing
>> [    0.349223] [      T1] e820: register RAM buffer resource [mem
>> 0x099ff000-0x0bffffff]
>> [    0.349225] [      T1] e820: register RAM buffer resource [mem
>> 0x0a200000-0x0bffffff]
>> [    0.349226] [      T1] e820: register RAM buffer resource [mem
>> 0x0b000000-0x0bffffff]
>> [    0.349227] [      T1] e820: register RAM buffer resource [mem
>> 0x6fd36000-0x6fffffff]
>> [    0.349228] [      T1] e820: register RAM buffer resource [mem
>> 0x742d2000-0x77ffffff]
>> [    0.349229] [      T1] e820: register RAM buffer resource [mem
>> 0x78b7f000-0x7bffffff]
>> [    0.349230] [      T1] e820: register RAM buffer resource [mem
>> 0x98709000-0x9bffffff]
>> [    0.349231] [      T1] e820: register RAM buffer resource [mem
>> 0x99e82000-0x9bffffff]
>> [    0.349232] [      T1] e820: register RAM buffer resource [mem
>> 0x99ff9000-0x9bffffff]
>> [    0.349233] [      T1] e820: register RAM buffer resource [mem
>> 0x9a000000-0x9bffffff]
>> [    0.349234] [      T1] e820: register RAM buffer resource [mem
>> 0x85df00000-0x85fffffff]
>> [    0.351581] [      T1] acpi PNP0C01:00: Reserved [mem
>> 0xe0000000-0xefffffff]
>> [    0.351630] [      T1] acpi PNP0C02:00: Could not reserve [mem
>> 0xf7600000-0xf767ffff]
>> [    0.351662] [      T1] acpi PNP0C02:01: Could not reserve [mem
>> 0x1000000000000 window]
>> [    0.351685] [      T1] acpi PNP0C02:02: Reserved [mem
>> 0xf7200000-0xf72fffff]
>> [    0.351819] [      T1] acpi PNP0C02:03: Reserved [io  0x0a00-0x0a0f]
>> [    0.351821] [      T1] acpi PNP0C02:03: Reserved [io  0x0a10-0x0a1f]
>> [    0.351822] [      T1] acpi PNP0C02:03: Reserved [io  0x0a20-0x0a2f]
>> [    0.351981] [      T1] acpi PNP0C02:04: Skipped [io  0x0010-0x001f]
>> [    0.351982] [      T1] acpi PNP0C02:04: Skipped [io  0x0022-0x003f]
>> [    0.351984] [      T1] acpi PNP0C02:04: Skipped [io  0x0063]
>> [    0.351985] [      T1] acpi PNP0C02:04: Skipped [io  0x0065]
>> [    0.351986] [      T1] acpi PNP0C02:04: Skipped [io  0x0067-0x006f]
>> [    0.351987] [      T1] acpi PNP0C02:04: Skipped [io  0x0072-0x007f]
>> [    0.351988] [      T1] acpi PNP0C02:04: Skipped [io  0x0080]
>> [    0.351989] [      T1] acpi PNP0C02:04: Skipped [io  0x0084-0x0086]
>> [    0.351991] [      T1] acpi PNP0C02:04: Skipped [io  0x0088]
>> [    0.351992] [      T1] acpi PNP0C02:04: Skipped [io  0x008c-0x008e]
>> [    0.351993] [      T1] acpi PNP0C02:04: Skipped [io  0x0090-0x009f]
>> [    0.351994] [      T1] acpi PNP0C02:04: Skipped [io  0x00a2-0x00bf]
>> [    0.351995] [      T1] acpi PNP0C02:04: Skipped [io  0x00b1]
>> [    0.351996] [      T1] acpi PNP0C02:04: Skipped [io  0x00e0-0x00ef]
>> [    0.351997] [      T1] acpi PNP0C02:04: Reserved [io  0x04d0-0x04d1]
>> [    0.351999] [      T1] acpi PNP0C02:04: Reserved [io  0x040b]
>> [    0.352000] [      T1] acpi PNP0C02:04: Reserved [io  0x04d6]
>> [    0.352001] [      T1] acpi PNP0C02:04: Reserved [io  0x0c00-0x0c01]
>> [    0.352002] [      T1] acpi PNP0C02:04: Reserved [io  0x0c14]
>> [    0.352003] [      T1] acpi PNP0C02:04: Reserved [io  0x0c50-0x0c51]
>> [    0.352005] [      T1] acpi PNP0C02:04: Reserved [io  0x0c52]
>> [    0.352007] [      T1] acpi PNP0C02:04: Reserved [io  0x0c6c]
>> [    0.352008] [      T1] acpi PNP0C02:04: Reserved [io  0x0c6f]
>> [    0.352009] [      T1] acpi PNP0C02:04: Reserved [io  0x0cd8-0x0cdf]
>> [    0.352010] [      T1] acpi PNP0C02:04: Reserved [io  0x0800-0x089f]
>> [    0.352011] [      T1] acpi PNP0C02:04: Reserved [io  0x0b00-0x0b0f]
>> [    0.352013] [      T1] acpi PNP0C02:04: Reserved [io  0x0b20-0x0b3f]
>> [    0.352014] [      T1] acpi PNP0C02:04: Reserved [io  0x0900-0x090f]
>> [    0.352015] [      T1] acpi PNP0C02:04: Reserved [io  0x0910-0x091f]
>> [    0.352017] [      T1] acpi PNP0C02:04: Reserved [mem
>> 0xfedc0000-0xfedc0fff]
>> [    0.352018] [      T1] acpi PNP0C02:04: Reserved [mem
>> 0xfee00000-0xfee00fff]
>> [    0.352020] [      T1] acpi PNP0C02:04: Reserved [mem
>> 0xfec10000-0xfec10fff]
>> [    0.352021] [      T1] acpi PNP0C02:04: Reserved [mem
>> 0xfeb00000-0xfeb00fff]
>> [    0.352023] [      T1] acpi PNP0C02:04: Reserved [mem
>> 0xff000000-0xffffffff]
>> [    0.352052] [      T1] pnp: PnP ACPI init
>> [    0.356086] [      T1] pnp: PnP ACPI: found 1 devices
>> [    0.361974] [      T1] clocksource: acpi_pm: mask: 0xffffff max_cycles:
>> 0xffffff, max_idle_ns: 2085701024 ns
>> [    0.364471] [      T1] pci_bus 0000:00: resource 4 [io  0x0000-0x03af
>> window]
>> [    0.364472] [      T1] pci_bus 0000:00: resource 5 [io  0x03e0-0x0cf7
>> window]
>> [    0.364474] [      T1] pci_bus 0000:00: resource 6 [io  0x03b0-0x03df
>> window]
>> [    0.364475] [      T1] pci_bus 0000:00: resource 7 [io  0x0d00-0xffff
>> window]
>> [    0.364476] [      T1] pci_bus 0000:00: resource 8 [mem
>> 0x000a0000-0x000dffff window]
>> [    0.364477] [      T1] pci_bus 0000:00: resource 9 [mem
>> 0xf2000000-0xf6ffffff window]
>> [    0.364479] [      T1] pci_bus 0000:00: resource 10 [mem
>> 0xf0000000-0xf1ffffff window]
>> [    0.364480] [      T1] pci_bus 0000:00: resource 11 [mem
>> 0xa0000000-0xdfffffff window]
>> [    0.364481] [      T1] pci_bus 0000:00: resource 12 [mem
>> 0x860000000-0xfcffffffff window]
>> [    0.364483] [      T1] pci_bus 0000:01: resource 0 [io  0xf000-0xffff]
>> [    0.364484] [      T1] pci_bus 0000:01: resource 1 [mem
>> 0xdfa00000-0xdfcfffff]
>> [    0.364485] [      T1] pci_bus 0000:01: resource 2 [mem
>> 0xf800000000-0xfc0fffffff 64bit pref]
>> [    0.364487] [      T1] pci_bus 0000:02: resource 0 [io  0xf000-0xffff]
>> [    0.364488] [      T1] pci_bus 0000:02: resource 1 [mem
>> 0xdfa00000-0xdfbfffff]
>> [    0.364489] [      T1] pci_bus 0000:02: resource 2 [mem
>> 0xf800000000-0xfc0fffffff 64bit pref]
>> [    0.364490] [      T1] pci_bus 0000:03: resource 0 [io  0xf000-0xffff]
>> [    0.364492] [      T1] pci_bus 0000:03: resource 1 [mem
>> 0xdfa00000-0xdfbfffff]
>> [    0.364493] [      T1] pci_bus 0000:03: resource 2 [mem
>> 0xf800000000-0xfc0fffffff 64bit pref]
>> [    0.364494] [      T1] pci_bus 0000:04: resource 1 [mem
>> 0xdff00000-0xdfffffff]
>> [    0.364496] [      T1] pci_bus 0000:05: resource 0 [io  0xe000-0xefff]
>> [    0.364497] [      T1] pci_bus 0000:05: resource 1 [mem
>> 0xdee00000-0xdf4fffff]
>> [    0.364498] [      T1] pci_bus 0000:06: resource 0 [io  0xe000-0xefff]
>> [    0.364499] [      T1] pci_bus 0000:06: resource 1 [mem
>> 0xdee00000-0xdf4fffff]
>> [    0.364501] [      T1] pci_bus 0000:0e: resource 0 [io  0xe000-0xefff]
>> [    0.364502] [      T1] pci_bus 0000:0e: resource 1 [mem
>> 0xdf400000-0xdf4fffff]
>> [    0.364503] [      T1] pci_bus 0000:0f: resource 1 [mem
>> 0xdee00000-0xdf0fffff]
>> [    0.364505] [      T1] pci_bus 0000:10: resource 1 [mem
>> 0xdf300000-0xdf3fffff]
>> [    0.364506] [      T1] pci_bus 0000:11: resource 1 [mem
>> 0xdf200000-0xdf2fffff]
>> [    0.364507] [      T1] pci_bus 0000:12: resource 1 [mem
>> 0xdfe00000-0xdfefffff]
>> [    0.364508] [      T1] pci_bus 0000:13: resource 1 [mem
>> 0xdf600000-0xdf9fffff]
>> [    0.364510] [      T1] pci_bus 0000:14: resource 1 [mem
>> 0xdfd00000-0xdfdfffff]
>> [    0.623138] [      T1] tpm_crb_acpi MSFT0101:00: Disabling hwrng
>> [    0.623309] [      T1] ACPI: bus type drm_connector registered
>> [    0.718152] [      T1] acpi LNXPOWER:10: hash matches
>> [    1.750754] [    T391] ACPI: bus type USB registered
>> [    1.765068] [    T379] ACPI: video: Video Device [VGA] (multi-head: yes
>> rom: no  post: no)
>> [    1.765696] [    T379] input: Video Bus as
>> /devices/pci0000:00/0000:00:08.1/acpi.video_bus.0/input/input0
>> [   13.217571] [    T659] ACPI: button: Power Button [PWRB]
>> [   13.217672] [    T659] ACPI: button: Power Button [PWRF]
>> DESKTOP-V211MG0:~ #
>>
>> On 9/2/26 2:51 PM, Armin Wolf wrote:
>>> Am 02.09.26 um 21:40 schrieb Matthew Bettencourt:
>>>
>>>> Hello Armin,
>>>>
>>>>> Does dmesg contain any lines similar to "Resource conflict; ACPI
>>>> support
>>>>> missing from driver?"?
>>>>
>>>>
>>>> I cannot find any of those lines in the dmesg
>>>>
>>>> # dmesg | grep -iE "resource|conflict|acpi"
>>>> [    0.000000] [      T0] BIOS-e820: [mem
>>>> 0x000000000a200000-0x000000000a21dfff]  ACPI NVS
>>>> [    0.000000] [      T0] BIOS-e820: [mem
>>>> 0x00000000911ff000-0x00000000931fefff]  ACPI NVS
>>>> [    0.000000] [      T0] BIOS-e820: [mem
>>>> 0x00000000931ff000-0x00000000951fefff]  ACPI data
>>>> [    0.000000] [      T0] BIOS-e820: [mem
>>>> 0x000000009b015000-0x000000009b016fff]  ACPI NVS
>>>> [    0.000000] [      T0] efi: ACPI=0x931e4000 ACPI 2.0=0x931e4014
>>>> TPMFinalLog=0x931b1000 SMBIOS=0x8af88000 SMBIOS 3.0=0x8af87000
>>>> MEMATTR=0x7c0bb698 ESRT=0x7e24c218 MOKvar=0x8affc000
>>>> INITRD=0x7c0b3f18 RNG=0x9513e018 TPMEventLog=0x95139018
>>>> [    0.003329] [      T0] ACPI: Early table checksum verification
>>>> disabled
>>>> [    0.003331] [      T0] ACPI: RSDP 0x00000000931E4014 000024 (v02
>>>> ALASKA)
>>>> [    0.003334] [      T0] ACPI: XSDT 0x00000000931E3728 000104 (v01
>>>> ALASKA A M I    00000001 AMI  01000013)
>>>> [    0.003337] [      T0] ACPI: FACP 0x00000000951F4000 000114 (v06
>>>> ALASKA A M I    00000001 AMI  00010013)
>>>> [    0.003341] [      T0] ACPI: DSDT 0x0000000095179000 0710EA (v02
>>>> ALASKA A M I    00000001 INTL 20230628)
>>>> [    0.003342] [      T0] ACPI: FACS 0x00000000931E1000 000040
>>>> [    0.003343] [      T0] ACPI: SSDT 0x00000000951F6000 008689 (v02
>>>> AMD   Splinter 00000002 MSFT 04000000)
>>>> [    0.003344] [      T0] ACPI: SSDT 0x00000000951F5000 000221 (v02
>>>> ALASKA CPUSSDT  00000001 AMI  00000001)
>>>> [    0.003345] [      T0] ACPI: FIDT 0x00000000951EE000 00009C (v01
>>>> ALASKA A M I    00000001 AMI  00010013)
>>>> [    0.003346] [      T0] ACPI: MCFG 0x00000000951ED000 00003C (v01
>>>> ALASKA A M I    00000001 MSFT 00010013)
>>>> [    0.003347] [      T0] ACPI: HPET 0x00000000951EC000 000038 (v01
>>>> ALASKA A M I    00000001 AMI  00000005)
>>>> [    0.003348] [      T0] ACPI: FPDT 0x00000000951EB000 000044 (v01
>>>> ALASKA A M I    01072009 AMI  01000013)
>>>> [    0.003349] [      T0] ACPI: VFCT 0x000000009516A000 00E284 (v01
>>>> ALASKA A M I    00000001 AMD  31504F47)
>>>> [    0.003350] [      T0] ACPI: BGRT 0x00000000951F3000 000038 (v01
>>>> ALASKA A M I    00000001 AMI  00010013)
>>>> [    0.003351] [      T0] ACPI: TPM2 0x00000000951F2000 00004C (v04
>>>> ALASKA A M I    00000001 AMI  00000000)
>>>> [    0.003352] [      T0] ACPI: SSDT 0x0000000095165000 004DEE (v02
>>>> AMD   AMD CPU  00000001 AMD  00000001)
>>>> [    0.003353] [      T0] ACPI: SSDT 0x00000000951F1000 000041 (v02
>>>> AMD   AppCompD 00000001 INTL 20230628)
>>>> [    0.003354] [      T0] ACPI: SSDT 0x0000000095157000 00D2AE (v02
>>>> AMD   DISCUSB4 00000002 INTL 20230628)
>>>> [    0.003355] [      T0] ACPI: SSDT 0x00000000951F0000 0006D4 (v02
>>>> AMD   CPMWLRC  00000001 INTL 20230628)
>>>> [    0.003356] [      T0] ACPI: SSDT 0x00000000951EF000 0008BA (v02
>>>> AMD   CPMDFDG2 00000001 INTL 20230628)
>>>> [    0.003356] [      T0] ACPI: SSDT 0x0000000095156000 000788 (v02
>>>> AMD   CPMDFIG5 00000001 INTL 20230628)
>>>> [    0.003357] [      T0] ACPI: SSDT 0x000000009514C000 009B4F (v02
>>>> AMD   CPMCMN   00000001 INTL 20230628)
>>>> [    0.003358] [      T0] ACPI: SSDT 0x0000000095149000 002A66 (v02
>>>> AMD   AOD      00000001 INTL 20230628)
>>>> [    0.003359] [      T0] ACPI: MHSP 0x0000000095148000 0000C8 (v04
>>>> AMD   AGESA    20505348 ?    00000001)
>>>> [    0.003360] [      T0] ACPI: SSDT 0x0000000095147000 0000E5 (v02
>>>> MSFT   MHSP     00000004 INTL 20230628)
>>>> [    0.003361] [      T0] ACPI: WSMT 0x0000000095146000 000028 (v01
>>>> ALASKA A M I    00000001 AMI  00010013)
>>>> [    0.003362] [      T0] ACPI: APIC 0x0000000095145000 00015E (v06
>>>> ALASKA A M I    00000001 AMI  00010013)
>>>> [    0.003363] [      T0] ACPI: IVRS 0x0000000095144000 00019E (v02
>>>> AMD   AmdTable 00000001 AMD  00000001)
>>>> [    0.003364] [      T0] ACPI: SSDT 0x0000000095143000 000500 (v02
>>>> AMD   MEMTOOL0 00000002 INTL 20230628)
>>>> [    0.003365] [      T0] ACPI: SSDT 0x0000000095142000 0009D0 (v02
>>>> AMD   CPMMSOSC 00000001 INTL 20230628)
>>>> [    0.003366] [      T0] ACPI: SSDT 0x0000000095141000 00047C (v02
>>>> AMD   AMDWOV   00000001 INTL 20230628)
>>>> [    0.003367] [      T0] ACPI: SSDT 0x0000000095140000 00053E (v02
>>>> AMD   CPMAPMFD 00000001 INTL 20230628)
>>>> [    0.003368] [      T0] ACPI: SSDT 0x000000009513F000 00044E (v02
>>>> AMD   AmdTable 00000001 INTL 20230628)
>>>> [    0.003369] [      T0] ACPI: Reserving FACP table memory at [mem
>>>> 0x951f4000-0x951f4113]
>>>> [    0.003369] [      T0] ACPI: Reserving DSDT table memory at [mem
>>>> 0x95179000-0x951ea0e9]
>>>> [    0.003370] [      T0] ACPI: Reserving FACS table memory at [mem
>>>> 0x931e1000-0x931e103f]
>>>> [    0.003370] [      T0] ACPI: Reserving SSDT table memory at [mem
>>>> 0x951f6000-0x951fe688]
>>>> [    0.003370] [      T0] ACPI: Reserving SSDT table memory at [mem
>>>> 0x951f5000-0x951f5220]
>>>> [    0.003370] [      T0] ACPI: Reserving FIDT table memory at [mem
>>>> 0x951ee000-0x951ee09b]
>>>> [    0.003371] [      T0] ACPI: Reserving MCFG table memory at [mem
>>>> 0x951ed000-0x951ed03b]
>>>> [    0.003371] [      T0] ACPI: Reserving HPET table memory at [mem
>>>> 0x951ec000-0x951ec037]
>>>> [    0.003371] [      T0] ACPI: Reserving FPDT table memory at [mem
>>>> 0x951eb000-0x951eb043]
>>>> [    0.003371] [      T0] ACPI: Reserving VFCT table memory at [mem
>>>> 0x9516a000-0x95178283]
>>>> [    0.003372] [      T0] ACPI: Reserving BGRT table memory at [mem
>>>> 0x951f3000-0x951f3037]
>>>> [    0.003372] [      T0] ACPI: Reserving TPM2 table memory at [mem
>>>> 0x951f2000-0x951f204b]
>>>> [    0.003372] [      T0] ACPI: Reserving SSDT table memory at [mem
>>>> 0x95165000-0x95169ded]
>>>> [    0.003372] [      T0] ACPI: Reserving SSDT table memory at [mem
>>>> 0x951f1000-0x951f1040]
>>>> [    0.003373] [      T0] ACPI: Reserving SSDT table memory at [mem
>>>> 0x95157000-0x951642ad]
>>>> [    0.003373] [      T0] ACPI: Reserving SSDT table memory at [mem
>>>> 0x951f0000-0x951f06d3]
>>>> [    0.003373] [      T0] ACPI: Reserving SSDT table memory at [mem
>>>> 0x951ef000-0x951ef8b9]
>>>> [    0.003373] [      T0] ACPI: Reserving SSDT table memory at [mem
>>>> 0x95156000-0x95156787]
>>>> [    0.003374] [      T0] ACPI: Reserving SSDT table memory at [mem
>>>> 0x9514c000-0x95155b4e]
>>>> [    0.003374] [      T0] ACPI: Reserving SSDT table memory at [mem
>>>> 0x95149000-0x9514ba65]
>>>> [    0.003374] [      T0] ACPI: Reserving MHSP table memory at [mem
>>>> 0x95148000-0x951480c7]
>>>> [    0.003374] [      T0] ACPI: Reserving SSDT table memory at [mem
>>>> 0x95147000-0x951470e4]
>>>> [    0.003375] [      T0] ACPI: Reserving WSMT table memory at [mem
>>>> 0x95146000-0x95146027]
>>>> [    0.003375] [      T0] ACPI: Reserving APIC table memory at [mem
>>>> 0x95145000-0x9514515d]
>>>> [    0.003375] [      T0] ACPI: Reserving IVRS table memory at [mem
>>>> 0x95144000-0x9514419d]
>>>> [    0.003375] [      T0] ACPI: Reserving SSDT table memory at [mem
>>>> 0x95143000-0x951434ff]
>>>> [    0.003375] [      T0] ACPI: Reserving SSDT table memory at [mem
>>>> 0x95142000-0x951429cf]
>>>> [    0.003376] [      T0] ACPI: Reserving SSDT table memory at [mem
>>>> 0x95141000-0x9514147b]
>>>> [    0.003376] [      T0] ACPI: Reserving SSDT table memory at [mem
>>>> 0x95140000-0x9514053d]
>>>> [    0.003376] [      T0] ACPI: Reserving SSDT table memory at [mem
>>>> 0x9513f000-0x9513f44d]
>>>> [    0.004132] [      T0] ACPI: PM-Timer IO Port: 0x808
>>>> [    0.004137] [      T0] ACPI: LAPIC_NMI (acpi_id[0xff] high edge
>>>> lint[0x1])
>>>> [    0.004150] [      T0] ACPI: INT_SRC_OVR (bus 0 bus_irq 0
>>>> global_irq 2 dfl dfl)
>>>> [    0.004152] [      T0] ACPI: INT_SRC_OVR (bus 0 bus_irq 9
>>>> global_irq 9 low level)
>>>> [    0.004154] [      T0] ACPI: Using ACPI (MADT) for SMP
>>>> configuration information
>>>> [    0.004154] [      T0] ACPI: HPET id: 0x10228201 base: 0xfed00000
>>>> [    0.030331] [      T0] ACPI: Core revision 20260408
>>>> [    0.196042] [      T1] ACPI: PM: Registering ACPI NVS region [mem
>>>> 0x0a200000-0x0a21dfff] (122880 bytes)
>>>> [    0.196042] [      T1] ACPI: PM: Registering ACPI NVS region [mem
>>>> 0x911ff000-0x931fefff] (33554432 bytes)
>>>> [    0.196042] [      T1] ACPI: PM: Registering ACPI NVS region [mem
>>>> 0x9b015000-0x9b016fff] (8192 bytes)
>>>> [    0.205167] [      T1] acpiphp: ACPI Hot Plug PCI Controller
>>>> Driver version: 0.5
>>>> [    0.205845] [      T1] ACPI: Added _OSI(Module Device)
>>>> [    0.205846] [      T1] ACPI: Added _OSI(Processor Device)
>>>> [    0.205846] [      T1] ACPI: Added _OSI(Processor Aggregator Device)
>>>> [    0.212142] [      T1] ACPI: 17 ACPI AML tables successfully
>>>> acquired and loaded
>>>> [    0.237892] [      T1] ACPI: \_SB_: platform _OSC: OS support
>>>> mask [006e7eff]
>>>> [    0.239494] [      T1] ACPI: \_SB_: platform _OSC: OS control
>>>> mask [006e7eff]
>>>> [    0.239578] [      T1] ACPI: USB4 _OSC: OS supports USB3+
>>>> DisplayPort+ PCIe+ XDomain+
>>>> [    0.239579] [      T1] ACPI: USB4 _OSC: OS controls USB3+
>>>> DisplayPort+ PCIe+ XDomain+
>>>> [    0.239906] [      T1] ACPI: Interpreter enabled
>>>> [    0.239916] [      T1] ACPI: PM: (supports S0 S3 S4 S5)
>>>> [    0.239916] [      T1] ACPI: Using IOAPIC for interrupt routing
>>>> [    0.272403] [      T1] PCI: Using host bridge windows from ACPI;
>>>> if necessary, use "pci=nocrs" and report a bug
>>>> [    0.272544] [      T1] ACPI: Enabled 8 GPEs in block 00 to 1F
>>>> [    0.273425] [      T1] ACPI: \_SB_.PCI0.GP17.XHC0.P0U0: New power
>>>> resource
>>>> [    0.273941] [      T1] ACPI: \_SB_.PCI0.GP17.XHC1.P0U1: New power
>>>> resource
>>>> [    0.274789] [      T1] ACPI: \_SB_.PCI0.GP19.XHC2.P0U2: New power
>>>> resource
>>>> [    0.275014] [      T1] ACPI: \_SB_.PCI0.GPP0.M237: New power resource
>>>> [    0.275032] [      T1] ACPI: \_SB_.PCI0.GPP0.SWUS.M237: New power
>>>> resource
>>>> [    0.275053] [      T1] ACPI: \_SB_.PCI0.GPP0.SWUS.SWDS.M237: New
>>>> power resource
>>>> [    0.275143] [      T1] ACPI: \_SB_.PCI0.GPP1.P0NV: New power resource
>>>> [    0.275454] [      T1] ACPI: \_SB_.PCI0.GPP7.PWRS: New power resource
>>>> [    0.275560] [      T1] ACPI: \_SB_.PCI0.GPP7.UP00.PWRS: New power
>>>> resource
>>>> [    0.275661] [      T1] ACPI: \_SB_.PCI0.GPP7.UP00.DP00.PWRS: New
>>>> power resource
>>>> [    0.275858] [      T1] ACPI: \_SB_.PCI0.GPP7.UP00.DP08.PWRS: New
>>>> power resource
>>>> [    0.276000] [      T1] ACPI: \_SB_.PCI0.GPP7.UP00.DP08.EP00.PWRS:
>>>> New power resource
>>>> [    0.276087] [      T1] ACPI: \_SB_.PCI0.GPP7.UP00.DP10.PWRS: New
>>>> power resource
>>>> [    0.276187] [      T1] ACPI: \_SB_.PCI0.GPP7.UP00.DP10.WN00.PWRS:
>>>> New power resource
>>>> [    0.276288] [      T1] ACPI: \_SB_.PCI0.GPP7.UP00.DP18.PWRS: New
>>>> power resource
>>>> [    0.276387] [      T1] ACPI: \_SB_.PCI0.GPP7.UP00.DP18.LN00.PWRS:
>>>> New power resource
>>>> [    0.276489] [      T1] ACPI: \_SB_.PCI0.GPP7.UP00.DP20.PWRS: New
>>>> power resource
>>>> [    0.276718] [      T1] ACPI: \_SB_.PCI0.GPP7.UP00.DP28.PWRS: New
>>>> power resource
>>>> [    0.276860] [      T1] ACPI: \_SB_.PCI0.GPP7.UP00.DP28.EP00.PWRS:
>>>> New power resource
>>>> [    0.276947] [      T1] ACPI: \_SB_.PCI0.GPP7.UP00.DP30.PWRS: New
>>>> power resource
>>>> [    0.277088] [      T1] ACPI: \_SB_.PCI0.GPP7.UP00.DP30.EP00.PWRS:
>>>> New power resource
>>>> [    0.277176] [      T1] ACPI: \_SB_.PCI0.GPP7.UP00.DP38.PWRS: New
>>>> power resource
>>>> [    0.277243] [      T1] ACPI: \_SB_.PCI0.GPP7.UP00.DP38.EP00.PWRS:
>>>> New power resource
>>>> [    0.277324] [      T1] ACPI: \_SB_.PCI0.GPP7.UP00.DP40.PWRS: New
>>>> power resource
>>>> [    0.277423] [      T1] ACPI: \_SB_.PCI0.GPP7.UP00.DP40.EP00.PWRS:
>>>> New power resource
>>>> [    0.277523] [      T1] ACPI: \_SB_.PCI0.GPP7.UP00.DP48.PWRS: New
>>>> power resource
>>>> [    0.277591] [      T1] ACPI: \_SB_.PCI0.GPP7.UP00.DP48.EP00.PWRS:
>>>> New power resource
>>>> [    0.277669] [      T1] ACPI: \_SB_.PCI0.GPP7.UP00.DP50.PWRS: New
>>>> power resource
>>>> [    0.277737] [      T1] ACPI: \_SB_.PCI0.GPP7.UP00.DP50.EP00.PWRS:
>>>> New power resource
>>>> [    0.277815] [      T1] ACPI: \_SB_.PCI0.GPP7.UP00.DP58.PWRS: New
>>>> power resource
>>>> [    0.277882] [      T1] ACPI: \_SB_.PCI0.GPP7.UP00.DP58.EP00.PWRS:
>>>> New power resource
>>>> [    0.277961] [      T1] ACPI: \_SB_.PCI0.GPP7.UP00.DP60.PWRS: New
>>>> power resource
>>>> [    0.278061] [      T1] ACPI: \_SB_.PCI0.GPP7.UP00.DP60.XH00.PWRS:
>>>> New power resource
>>>> [    0.279355] [      T1] ACPI: \_SB_.PCI0.GPP7.UP00.DP68.PWRS: New
>>>> power resource
>>>> [    0.279475] [      T1] ACPI: \_SB_.PCI0.GPP7.UP00.DP68.SA00.PWRS:
>>>> New power resource
>>>> [    0.279778] [      T1] ACPI: \_SB_.PCI0.GPP8.PWRS: New power resource
>>>> [    0.284003] [      T1] ACPI: \_SB_.PCI0.GPP8.U4UP.PWRS: New power
>>>> resource
>>>> [    0.287479] [      T1] ACPI: \_SB_.PCI0.GPP8.U4UP.U4P0.PWRS: New
>>>> power resource
>>>> [    0.289892] [      T1] ACPI: \_SB_.PCI0.GPP8.U4UP.U4P0.UP0D.PWRS:
>>>> New power resource
>>>> [    0.290165] [      T1] ACPI: \_SB_.PCI0.GPP8.U4UP.U4P1.PWRS: New
>>>> power resource
>>>> [    0.293587] [      T1] ACPI: \_SB_.PCI0.GPP8.U4UP.U4P1.UP1D.PWRS:
>>>> New power resource
>>>> [    0.293777] [      T1] ACPI: \_SB_.PCI0.GPP8.U4UP.U4P2.PWRS: New
>>>> power resource
>>>> [    0.296122] [      T1] ACPI: \_SB_.PCI0.GPP8.U4UP.U4P2.UXHC.PWRS:
>>>> New power resource
>>>> [    0.298840] [      T1] ACPI: \_SB_.PCI0.GPP8.U4UP.U4P3.PWRS: New
>>>> power resource
>>>> [    0.301222] [      T1] ACPI: \_SB_.PCI0.GPP8.U4UP.U4P3.UHI0.PWRS:
>>>> New power resource
>>>> [    0.304956] [      T1] ACPI: \_SB_.PRWL: New power resource
>>>> [    0.304967] [      T1] ACPI: \_SB_.PRWB: New power resource
>>>> [    0.305249] [      T1] ACPI: PCI Root Bridge [PCI0] (domain 0000
>>>> [bus 00-ff])
>>>> [    0.305253] [      T1] acpi PNP0A08:00: _OSC: OS supports
>>>> [ExtendedConfig ASPM ClockPM Segments MSI EDR HPX-Type3]
>>>> [    0.305298] [      T1] acpi PNP0A08:00: _OSC: OS now controls
>>>> [PCIeHotplug SHPCHotplug PME AER PCIeCapability LTR DPC]
>>>> [    0.305570] [      T1] pci_bus 0000:00: root bus resource [io
>>>> 0x0000-0x03af window]
>>>> [    0.305571] [      T1] pci_bus 0000:00: root bus resource [io
>>>> 0x03e0-0x0cf7 window]
>>>> [    0.305572] [      T1] pci_bus 0000:00: root bus resource [io
>>>> 0x03b0-0x03df window]
>>>> [    0.305572] [      T1] pci_bus 0000:00: root bus resource [io
>>>> 0x0d00-0xffff window]
>>>> [    0.305573] [      T1] pci_bus 0000:00: root bus resource [mem
>>>> 0x000a0000-0x000dffff window]
>>>> [    0.305573] [      T1] pci_bus 0000:00: root bus resource [mem
>>>> 0xf2000000-0xf6ffffff window]
>>>> [    0.305574] [      T1] pci_bus 0000:00: root bus resource [mem
>>>> 0xf0000000-0xf1ffffff window]
>>>> [    0.305574] [      T1] pci_bus 0000:00: root bus resource [mem
>>>> 0xa0000000-0xdfffffff window]
>>>> [    0.305575] [      T1] pci_bus 0000:00: root bus resource [mem
>>>> 0x1060000000-0xfcffffffff window]
>>>> [    0.305575] [      T1] pci_bus 0000:00: root bus resource [bus 00-ff]
>>>> [    0.340759] [      T1] ACPI: PCI: Interrupt link LNKA configured
>>>> for IRQ 0
>>>> [    0.340778] [      T1] ACPI: PCI: Interrupt link LNKB configured
>>>> for IRQ 0
>>>> [    0.340793] [      T1] ACPI: PCI: Interrupt link LNKC configured
>>>> for IRQ 0
>>>> [    0.340813] [      T1] ACPI: PCI: Interrupt link LNKD configured
>>>> for IRQ 0
>>>> [    0.340830] [      T1] ACPI: PCI: Interrupt link LNKE configured
>>>> for IRQ 0
>>>> [    0.340845] [      T1] ACPI: PCI: Interrupt link LNKF configured
>>>> for IRQ 0
>>>> [    0.340860] [      T1] ACPI: PCI: Interrupt link LNKG configured
>>>> for IRQ 0
>>>> [    0.340874] [      T1] ACPI: PCI: Interrupt link LNKH configured
>>>> for IRQ 0
>>>> [    0.348579] [      T1] PCI: Using ACPI for IRQ routing
>>>> [    0.354012] [      T1] e820: register RAM buffer resource [mem
>>>> 0x099ff000-0x0bffffff]
>>>> [    0.354013] [      T1] e820: register RAM buffer resource [mem
>>>> 0x0a200000-0x0bffffff]
>>>> [    0.354014] [      T1] e820: register RAM buffer resource [mem
>>>> 0x0b000000-0x0bffffff]
>>>> [    0.354014] [      T1] e820: register RAM buffer resource [mem
>>>> 0x7c639000-0x7fffffff]
>>>> [    0.354015] [      T1] e820: register RAM buffer resource [mem
>>>> 0x7e24c000-0x7fffffff]
>>>> [    0.354015] [      T1] e820: register RAM buffer resource [mem
>>>> 0x8307f000-0x83ffffff]
>>>> [    0.354015] [      T1] e820: register RAM buffer resource [mem
>>>> 0x9b015000-0x9bffffff]
>>>> [    0.354016] [      T1] e820: register RAM buffer resource [mem
>>>> 0x9bff7000-0x9bffffff]
>>>> [    0.354016] [      T1] e820: register RAM buffer resource [mem
>>>> 0x105de80000-0x105fffffff]
>>>> [    0.356685] [      T1] acpi PNP0C01:00: Reserved [mem
>>>> 0xe0000000-0xefffffff]
>>>> [    0.356705] [      T1] acpi PNP0C02:00: Could not reserve [mem
>>>> 0xf7600000-0xf767ffff]
>>>> [    0.356714] [      T1] acpi PNP0C02:01: Could not reserve [mem
>>>> 0x1000000000000 window]
>>>> [    0.356767] [      T1] acpi PNP0C02:02: Reserved [io 0x0280-0x028f]
>>>> [    0.356767] [      T1] acpi PNP0C02:02: Reserved [io 0x0290-0x029f]
>>>> [    0.356768] [      T1] acpi PNP0C02:02: Reserved [io 0x02a0-0x02af]
>>>> [    0.356768] [      T1] acpi PNP0C02:02: Reserved [io 0x02b0-0x02bf]
>>>> [    0.356808] [      T1] acpi PNP0C02:03: Skipped [io 0x0010-0x001f]
>>>> [    0.356809] [      T1] acpi PNP0C02:03: Skipped [io 0x0022-0x003f]
>>>> [    0.356809] [      T1] acpi PNP0C02:03: Skipped [io  0x0063]
>>>> [    0.356810] [      T1] acpi PNP0C02:03: Skipped [io  0x0065]
>>>> [    0.356810] [      T1] acpi PNP0C02:03: Skipped [io 0x0067-0x006f]
>>>> [    0.356810] [      T1] acpi PNP0C02:03: Skipped [io 0x0072-0x007f]
>>>> [    0.356811] [      T1] acpi PNP0C02:03: Skipped [io  0x0080]
>>>> [    0.356811] [      T1] acpi PNP0C02:03: Skipped [io 0x0084-0x0086]
>>>> [    0.356811] [      T1] acpi PNP0C02:03: Skipped [io  0x0088]
>>>> [    0.356812] [      T1] acpi PNP0C02:03: Skipped [io 0x008c-0x008e]
>>>> [    0.356812] [      T1] acpi PNP0C02:03: Skipped [io 0x0090-0x009f]
>>>> [    0.356812] [      T1] acpi PNP0C02:03: Skipped [io 0x00a2-0x00bf]
>>>> [    0.356813] [      T1] acpi PNP0C02:03: Skipped [io  0x00b1]
>>>> [    0.356813] [      T1] acpi PNP0C02:03: Skipped [io 0x00e0-0x00ef]
>>>> [    0.356813] [      T1] acpi PNP0C02:03: Reserved [io 0x04d0-0x04d1]
>>>> [    0.356814] [      T1] acpi PNP0C02:03: Reserved [io  0x040b]
>>>> [    0.356814] [      T1] acpi PNP0C02:03: Reserved [io  0x04d6]
>>>> [    0.356815] [      T1] acpi PNP0C02:03: Reserved [io 0x0c00-0x0c01]
>>>> [    0.356815] [      T1] acpi PNP0C02:03: Reserved [io  0x0c14]
>>>> [    0.356816] [      T1] acpi PNP0C02:03: Reserved [io 0x0c50-0x0c51]
>>>> [    0.356816] [      T1] acpi PNP0C02:03: Reserved [io  0x0c52]
>>>> [    0.356817] [      T1] acpi PNP0C02:03: Reserved [io  0x0c6c]
>>>> [    0.356817] [      T1] acpi PNP0C02:03: Reserved [io  0x0c6f]
>>>> [    0.356817] [      T1] acpi PNP0C02:03: Reserved [io 0x0cd8-0x0cdf]
>>>> [    0.356818] [      T1] acpi PNP0C02:03: Reserved [io 0x0800-0x089f]
>>>> [    0.356818] [      T1] acpi PNP0C02:03: Reserved [io 0x0b00-0x0b0f]
>>>> [    0.356819] [      T1] acpi PNP0C02:03: Reserved [io 0x0b20-0x0b3f]
>>>
>>> Here the SMBus controller is reserved for the ACPI firmware. The
>>> pix4_smbus controller
>>> probes significantly later, so i see no reason why the check fails here.
>>>
>>> I CCed the ACPI maintainer, maybe he has an idea why this happens.
>>>
>>> Thanks,
>>> Armin Wolf
>>>
>>>> [ 0.356819] [      T1] acpi PNP0C02:03: Reserved [io  0x0900-0x090f]
>>>> [    0.356819] [      T1] acpi PNP0C02:03: Reserved [io 0x0910-0x091f]
>>>> [    0.356820] [      T1] acpi PNP0C02:03: Reserved [mem
>>>> 0xfedc0000-0xfedc0fff]
>>>> [    0.356821] [      T1] acpi PNP0C02:03: Reserved [mem
>>>> 0xfee00000-0xfee00fff]
>>>> [    0.356822] [      T1] acpi PNP0C02:03: Reserved [mem
>>>> 0xfec10000-0xfec10fff]
>>>> [    0.356822] [      T1] acpi PNP0C02:03: Reserved [mem
>>>> 0xff000000-0xffffffff]
>>>> [    0.356838] [      T1] pnp: PnP ACPI init
>>>> [    0.358796] [      T1] pnp: PnP ACPI: found 0 devices
>>>> [    0.363888] [      T1] clocksource: acpi_pm: mask: 0xffffff
>>>> max_cycles: 0xffffff, max_idle_ns: 2085701024 ns
>>>> [    0.365766] [      T1] pci_bus 0000:00: resource 4 [io
>>>> 0x0000-0x03af window]
>>>> [    0.365766] [      T1] pci_bus 0000:00: resource 5 [io
>>>> 0x03e0-0x0cf7 window]
>>>> [    0.365767] [      T1] pci_bus 0000:00: resource 6 [io
>>>> 0x03b0-0x03df window]
>>>> [    0.365767] [      T1] pci_bus 0000:00: resource 7 [io
>>>> 0x0d00-0xffff window]
>>>> [    0.365768] [      T1] pci_bus 0000:00: resource 8 [mem
>>>> 0x000a0000-0x000dffff window]
>>>> [    0.365768] [      T1] pci_bus 0000:00: resource 9 [mem
>>>> 0xf2000000-0xf6ffffff window]
>>>> [    0.365768] [      T1] pci_bus 0000:00: resource 10 [mem
>>>> 0xf0000000-0xf1ffffff window]
>>>> [    0.365769] [      T1] pci_bus 0000:00: resource 11 [mem
>>>> 0xa0000000-0xdfffffff window]
>>>> [    0.365769] [      T1] pci_bus 0000:00: resource 12 [mem
>>>> 0x1060000000-0xfcffffffff window]
>>>> [    0.365770] [      T1] pci_bus 0000:01: resource 0 [io 0xf000-0xffff]
>>>> [    0.365770] [      T1] pci_bus 0000:01: resource 1 [mem
>>>> 0xdeb00000-0xdedfffff]
>>>> [    0.365771] [      T1] pci_bus 0000:01: resource 2 [mem
>>>> 0xf000000000-0xf80fffffff 64bit pref]
>>>> [    0.365771] [      T1] pci_bus 0000:02: resource 0 [io 0xf000-0xffff]
>>>> [    0.365772] [      T1] pci_bus 0000:02: resource 1 [mem
>>>> 0xdeb00000-0xdecfffff]
>>>> [    0.365772] [      T1] pci_bus 0000:02: resource 2 [mem
>>>> 0xf000000000-0xf80fffffff 64bit pref]
>>>> [    0.365772] [      T1] pci_bus 0000:03: resource 0 [io 0xf000-0xffff]
>>>> [    0.365773] [      T1] pci_bus 0000:03: resource 1 [mem
>>>> 0xdeb00000-0xdecfffff]
>>>> [    0.365773] [      T1] pci_bus 0000:03: resource 2 [mem
>>>> 0xf000000000-0xf80fffffff 64bit pref]
>>>> [    0.365774] [      T1] pci_bus 0000:04: resource 1 [mem
>>>> 0xdef00000-0xdeffffff]
>>>> [    0.365774] [      T1] pci_bus 0000:05: resource 0 [io 0xc000-0xdfff]
>>>> [    0.365774] [      T1] pci_bus 0000:05: resource 1 [mem
>>>> 0xde200000-0xde6fffff]
>>>> [    0.365775] [      T1] pci_bus 0000:06: resource 0 [io 0xc000-0xdfff]
>>>> [    0.365775] [      T1] pci_bus 0000:06: resource 1 [mem
>>>> 0xde200000-0xde6fffff]
>>>> [    0.365776] [      T1] pci_bus 0000:09: resource 0 [io 0xd000-0xdfff]
>>>> [    0.365776] [      T1] pci_bus 0000:09: resource 1 [mem
>>>> 0xde600000-0xde6fffff]
>>>> [    0.365776] [      T1] pci_bus 0000:0a: resource 0 [io 0xc000-0xcfff]
>>>> [    0.365777] [      T1] pci_bus 0000:0a: resource 1 [mem
>>>> 0xde500000-0xde5fffff]
>>>> [    0.365777] [      T1] pci_bus 0000:0e: resource 1 [mem
>>>> 0xde400000-0xde4fffff]
>>>> [    0.365778] [      T1] pci_bus 0000:0f: resource 1 [mem
>>>> 0xde300000-0xde3fffff]
>>>> [    0.365778] [      T1] pci_bus 0000:10: resource 1 [mem
>>>> 0xde200000-0xde2fffff]
>>>> [    0.365778] [      T1] pci_bus 0000:11: resource 0 [io 0x6000-0xbfff]
>>>> [    0.365779] [      T1] pci_bus 0000:11: resource 1 [mem
>>>> 0xac000000-0xdc7fffff]
>>>> [    0.365779] [      T1] pci_bus 0000:11: resource 2 [mem
>>>> 0xb000000000-0xefffffffff 64bit pref]
>>>> [    0.365780] [      T1] pci_bus 0000:12: resource 0 [io 0x6000-0xbfff]
>>>> [    0.365780] [      T1] pci_bus 0000:12: resource 1 [mem
>>>> 0xac000000-0xdc7fffff]
>>>> [    0.365780] [      T1] pci_bus 0000:12: resource 2 [mem
>>>> 0xb000000000-0xefffffffff 64bit pref]
>>>> [    0.365781] [      T1] pci_bus 0000:13: resource 0 [io 0x9000-0xbfff]
>>>> [    0.365781] [      T1] pci_bus 0000:13: resource 1 [mem
>>>> 0xc4000000-0xdbffffff]
>>>> [    0.365782] [      T1] pci_bus 0000:13: resource 2 [mem
>>>> 0xd000000000-0xefffffffff 64bit pref]
>>>> [    0.365782] [      T1] pci_bus 0000:43: resource 0 [io 0x6000-0x8fff]
>>>> [    0.365782] [      T1] pci_bus 0000:43: resource 1 [mem
>>>> 0xac000000-0xc3ffffff]
>>>> [    0.365783] [      T1] pci_bus 0000:43: resource 2 [mem
>>>> 0xb000000000-0xcfffffffff 64bit pref]
>>>> [    0.365783] [      T1] pci_bus 0000:73: resource 1 [mem
>>>> 0xdc400000-0xdc7fffff]
>>>> [    0.365784] [      T1] pci_bus 0000:74: resource 1 [mem
>>>> 0xdc000000-0xdc3fffff]
>>>> [    0.365784] [      T1] pci_bus 0000:75: resource 0 [io 0xe000-0xefff]
>>>> [    0.365784] [      T1] pci_bus 0000:75: resource 1 [mem
>>>> 0xdd000000-0xde0fffff]
>>>> [    0.365785] [      T1] pci_bus 0000:76: resource 1 [mem
>>>> 0xde700000-0xdeafffff]
>>>> [    0.365785] [      T1] pci_bus 0000:77: resource 1 [mem
>>>> 0xdee00000-0xdeefffff]
>>>> [    1.326301] [      T1] tpm_crb_acpi MSFT0101:00: Disabling hwrng
>>>> [    1.326411] [      T1] ACPI: bus type drm_connector registered
>>>> [    2.224322] [    T411] ACPI: bus type USB registered
>>>> [    2.224438] [    T445] ACPI: video: Video Device [VGA]
>>>> (multi-head: yes  rom: no  post: no)
>>>> [    2.224679] [    T445] input: Video Bus as /devices/
>>>> pci0000:00/0000:00:08.1/acpi.video_bus.0/input/input0
>>>> [    2.228112] [    T444] ACPI: bus type thunderbolt registered
>>>> [   18.641366] [    T740] ACPI: button: Power Button [PWRB]
>>>> [   18.641684] [    T740] ACPI: button: Power Button [PWRF]
>>>>
>>>>
>>>>
>>>> Thanks,
>>>> Matthew
>>>> On 9/2/26 2:31 PM, Armin Wolf wrote:
>>>>> Am 02.09.26 um 21:25 schrieb Matthew Bettencourt:
>>>>>
