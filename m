Received: from mail-pg1-f177.google.com (mail-pg1-f177.google.com [209.85.215.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 916A02F25F3
	for <linux-hwmon@vger.kernel.org>; Tue,  1 Sep 2026 00:16:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.177
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788221785; cv=none; b=R7rWT1CFNw5gZWdneuRSm0ct6hHm62hfFzqS2Q+rkq5NrfXNW0xMIgtR7i5eUDfrU4npxk1L+QA6BOO8LbVFsOKkNK4m7ttD9ls1QHayZTdMLEllwVxWnFer0IrCf+uh/5+rOt2BzzF/RTkbjypH14XEk8mS8MglCeSAzdxLLr0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788221785; c=relaxed/simple;
	bh=wWd6FpJoBAUfxzqnHYWFxP6viUHJty1h+MngnoYm7jo=;
	h=Message-ID:Date:MIME-Version:Subject:To:References:Cc:From:
	 In-Reply-To:Content-Type; b=BlF/Cw/Fm5YA0dX5dnlAt9IR0EEhKvwPe3mCMPcEGkdr+iPdL5ikQN1pzx/LNPdlGm94azwWuGMBs+JatmdEFFJQIBziFl8bShia2IHUBsuiRbCAbJe6MPBP9ku3MywraHJRRp+rvK9kYjdHhohCB+Q4JUTe8UcGVO02NBPZrKQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=TLaI5ma6; arc=none smtp.client-ip=209.85.215.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="TLaI5ma6"
Received: by mail-pg1-f177.google.com with SMTP id 41be03b00d2f7-cc1cbb64a1fso4029850a12.1
        for <linux-hwmon@vger.kernel.org>; Mon, 31 Aug 2026 17:16:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788221783; x=1788826583; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from:cc
         :content-language:references:to:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=/NH7GQnLQc0hjyaM40uObrrRPPN00SH54u5Q+Jsz9iY=;
        b=TLaI5ma6U7WgtzyFq4OFiT29OQ+wF+awwaaAIe97dEfhJsRx9LRRWYFyODsd5ejQWk
         OeGV6Qjv42msV0T6YCCQpVh7QkvogEWg8KXwzJjcS+a9ADTyibMml4/gGVNkhyKDpgyR
         yJegyplGWAf9uO2JnMPTNOVSf8s63ZNVDTDB9HocML6/sizGlju/c+pxAGUNvsc1VdYx
         y2ouV787/g7bzS5dRuyHLuB4Ccxzu8+4q+wpP1ejGIxSRdSyQt27QnhoQSDv6BnmOoaa
         4gqTtiW5iK6ZIoZ54gQsx9jB2YOpKENqvNULgl8+TJ6re1ajagvKvsClV9gHDhFW+VAO
         i7Iw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788221783; x=1788826583;
        h=content-transfer-encoding:content-type:in-reply-to:from:cc
         :content-language:references:to:subject:user-agent:mime-version:date
         :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=/NH7GQnLQc0hjyaM40uObrrRPPN00SH54u5Q+Jsz9iY=;
        b=PhL4h6TeCiCiyMs7R5y0Bnn0VyznkHHXYeUx1Q8H8grwBuuTbgd3jPWMgsw60FKq9t
         l9FgJPhf1lzbPIj9a3lMwLkMgt4c3xKjwpFqVBJ8qX2BTs1HeTC80rgugXcRlxVBY+Ec
         8cnWzIhz+kyr0/CO/9mWl2XXHso2mWGNDTRN5QsGxuPAL2f7+z8gjKs9FWzux26qppI9
         b/L4R+sEx9MmgcJmBHgKLefpePWomizCQM48f1FEsAgiqYRxOH4HbOjGmvntDio4ghse
         RkZIxUrZDvohaH1/kQGQQOMOfHCd1d9LYVeaVRwXqZCZNBLdMtw51/6B+t+ki2Ex+yXO
         YHYQ==
X-Gm-Message-State: AFuF++mJ2bXxqq1fbBhUkzp+OHg9OB9GGEMVreqlT9DkB5E1IRwHLl6d
	8yOmyXpseJkfUEJY+A3SuluY77bJe3onR2YPHPlt9vrNUw2HAXpyrDer
X-Gm-Gg: AYBFou2T73ZS9LtCNLjPWKr4SJVrBQ75IGjTnrtHpITa76IsYo8L/GgJ0EuDGmbGvwX
	i6PTY0cNEXzQA6V00D37Tu/XjtSjyPijjWdgnZlESnRLPcD3HtKJeEufKPsW8CMn9TNRPOBGsfQ
	lK/MiXC2Uyh7LDsM84MpYnwEkKX1VVzFLK/AESFuFblpy7qlExKle3oJBUOH1N0RD+IkewvhO8r
	E+YxeOSFVKOuC75TqCREXZaIhbhAzKp6M+svqDRE28NavtlWNghJhMUKHMYaDGuPRPOO0xMvXbE
	lh1qwkQvzJ5i3/4cjTn/KTlwDiMPbPZ5Y6cadl++CwsUYsrRYzsGifGzeHnHmpi0tJm7OB5bYTY
	z0s3CrPlpVCDKmG3JZu1+9orpy0KFcwkMhbX/BvkRHJTk08t82BJljD5zuiRE54yMinhwKUGe8B
	7K4HQ0bvp+OwPTB1H9yHKzDFocan/YqZZ24Muh2sadxD3NQQR1vrFjkS8vLSE8ZL2XIHCnOzSqy
	Xw3JPO+unQp7o721dh1t+ueG0jqPVIwYBLIRIaTRZKGu5zQGPMZwzO97xB8
X-Received: by 2002:a17:90b:530c:b0:381:1c96:829b with SMTP id 98e67ed59e1d1-396d0d4c43amr46601349a91.3.1788221780530;
        Mon, 31 Aug 2026 17:16:20 -0700 (PDT)
Received: from [10.21.0.95] (wnpgmb0592w-ds02-161-177-131.dynamic.bellmts.net. [207.161.177.131])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-39914b4ea7asm1056747a91.13.2026.08.31.17.16.19
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 31 Aug 2026 17:16:19 -0700 (PDT)
Message-ID: <763a8b30-8548-4ff0-a1e9-8e74bbfe9b02@gmail.com>
Date: Mon, 31 Aug 2026 19:16:17 -0500
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Betterbird (Linux)
Subject: Re: [BUG] SPD5118 Intermittent MR11 Corruption During Suspend/Resume
To: Guenter Roeck <linux@roeck-us.net>
References: <1a8ea9da-1ac1-4312-a8ca-ea4a9f35093f@gmail.com>
 <ee284272-0da0-45b6-a3be-c76822e5d54f@roeck-us.net>
 <014b9438-e9b7-4be1-b816-002e83a068a0@roeck-us.net>
 <37132c40-aa82-4df1-b5ce-337601f3c085@gmail.com>
 <3c4e9f59-5272-48cf-a4a0-eeefcba955a9@roeck-us.net>
Content-Language: en-US
Cc: linux-hwmon@vger.kernel.org, linux-kernel@vger.kernel.org
From: Matthew Bettencourt <matthew.bettencourt@gmail.com>
In-Reply-To: <3c4e9f59-5272-48cf-a4a0-eeefcba955a9@roeck-us.net>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

Hello Guenter,

Here is the list of i2c devices on my machine

grep . /sys/class/i2c-dev/*/name
/sys/class/i2c-dev/i2c-0/name:Synopsys DesignWare I2C adapter
/sys/class/i2c-dev/i2c-10/name:AMDGPU DM aux hw bus 1
/sys/class/i2c-dev/i2c-11/name:AMDGPU DM aux hw bus 2
/sys/class/i2c-dev/i2c-12/name:SMBus PIIX4 adapter port 0 at 0b00
/sys/class/i2c-dev/i2c-13/name:SMBus PIIX4 adapter port 2 at 0b00
/sys/class/i2c-dev/i2c-14/name:SMBus PIIX4 adapter port 1 at 0b20
/sys/class/i2c-dev/i2c-1/name:Synopsys DesignWare I2C adapter
/sys/class/i2c-dev/i2c-2/name:AMDGPU SMU 0
/sys/class/i2c-dev/i2c-3/name:AMDGPU SMU 1
/sys/class/i2c-dev/i2c-4/name:AMDGPU DM i2c hw bus 0
/sys/class/i2c-dev/i2c-5/name:AMDGPU DM i2c hw bus 1
/sys/class/i2c-dev/i2c-6/name:AMDGPU DM i2c hw bus 2
/sys/class/i2c-dev/i2c-7/name:AMDGPU DM i2c hw bus 3
/sys/class/i2c-dev/i2c-8/name:AMDGPU DM i2c OEM bus
/sys/class/i2c-dev/i2c-9/name:AMDGPU DM aux hw bus 0

The dmesg output I provided was captured with i2c debugging enabled. 
When the issue occurred those are the only i2c transitions I saw.

I will try and add some additional logging and checks the controller 
driver and see if there are any other i2c transactions with the same 
symptoms.

 >  The only ideas I have is that somehow an access to another I2C bus
 > messes up controller registers, or that there is a real hardware problem.

I am not against the determination that there might hardware issue, 
however I got down this rabbit hole after I read a forum post on 
level1techs where someone else had the exact issue with the same memory 
kit. I have posted in that forum as well but have not gotten a reply. 
The original post sounds very similar to this issue but the user never 
reports on the actual SPD5118 registers so it is hard to know for sure.

https://forum.level1techs.com/t/msi-x870e-carbon-9950x-2x48gb-ram-bizzare-issues/222454/23

Thanks,
Matthew

On 8/31/26 6:38 PM, Guenter Roeck wrote:
> On 8/31/26 16:10, Matthew Bettencourt wrote:
>> Hi Guenter,
>>
>> I checked the i2c bus and there is nothing at address 0x22:
>>
>> # i2cdetect -y 12
>>       0  1  2  3  4  5  6  7  8  9  a  b  c  d  e  f
>> 00:                         -- -- -- -- -- -- -- --
>> 10: -- -- -- -- -- 15 -- -- -- -- -- -- -- -- -- --
>> 20: -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- --
>> 30: -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- --
>> 40: -- -- -- -- -- -- -- -- -- 49 -- 4b -- -- -- --
>> 50: -- 51 -- 53 -- -- -- -- -- -- -- -- -- -- -- --
>> 60: -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- --
>> 70: -- 71 -- 73 -- -- --
>>
> 
> That means that
> 
>>>>> [  277.574130] [   T3293] i2c i2c-12: Transaction (pre): CNT=08, 
>>>>> CMD=0b, ADD=a3, DAT0=00, DAT1=18
>>>>> [  277.575552] [   T3293] i2c i2c-12: Transaction (post): CNT=08, 
>>>>> CMD=01, ADD=45, DAT0=ff, DAT1=18
>>>                                                                           ^^      ^^       ^^
>>> This is unexpected. It was supposed to read MR11 from 0x51, but the 
>>> returned data is 0xff,
>>> and the CMD and ADD register values are changed. 0xff is returned to 
>>> the calling code as MR11.
>>>
> 
> this is a real problem. I don't really know what to suggest here. You could
> add some debugging code into the controller driver and check if / how often
> CMD or ADD changes its value between pre and post, and generate a log 
> message
> if that happens. The value should never change. If it happens when 
> reading MR11
> I suspect that it happens with other accesses as well.
> 
> What I2C controllers do you have in your system ? "grep . /sys/class/ 
> i2c-dev/*/name"
> should tell. Also, do you see any other I2C transactions on other I2C
> busses ? The only ideas I have is that somehow an access to another I2C bus
> messes up controller registers, or that there is a real hardware problem.
> 
> Thanks,
> Guenter
> 
>>>>> [  277.575617] [    T113] i2c i2c-12: Transaction (pre): CNT=08, 
>>>>> CMD=1a, ADD=a7, DAT0=ff, DAT1=18
>>>>> [  277.576169] [    T113] i2c i2c-12: Transaction (post): CNT=08, 
>>>>> CMD=1a, ADD=a7, DAT0=00, DAT1=18
>>>
>>> Read MR26 of 0x53 (=0x00, enabled)
>>>
>>>>> [  277.576237] [   T3293] i2c i2c-12: Transaction (pre): CNT=08, 
>>>>> CMD=0b, ADD=a2, DAT0=f8, DAT1=18
>>>>> [  277.577061] [   T3293] i2c i2c-12: Transaction (post): CNT=08, 
>>>>> CMD=0b, ADD=a2, DAT0=f8, DAT1=18
>>>
>>> Write 0xf8 into MR11 of 0x51. This is where things go wrong. The call 
>>> originates
>>> from regmap, which tries to configure page 0 (lower 3 bit) while 
>>> leaving the upper
>>> bits alone (which were 0xff from above corrupted read).
>>>
>>>>> [  277.577121] [    T113] i2c i2c-12: Transaction (pre): CNT=08, 
>>>>> CMD=0b, ADD=a7, DAT0=f8, DAT1=18
>>>>> [  277.578063] [    T113] i2c i2c-12: Transaction (post): CNT=08, 
>>>>> CMD=0b, ADD=a7, DAT0=00, DAT1=18
>>>
>>> Read MR11 of 0x53 (=0x00)
>>>
>>>>> [  277.578127] [   T3293] i2c i2c-12: Transaction (pre): CNT=08, 
>>>>> CMD=1a, ADD=a3, DAT0=00, DAT1=18
>>>>> [  277.579062] [   T3293] i2c i2c-12: Transaction (post): CNT=08, 
>>>>> CMD=1a, ADD=a3, DAT0=00, DAT1=18
>>>
>>> Read MR26 of 0x51 (0x00 -> enabled)
>>>
>>>>> [  277.579131] [    T113] i2c i2c-12: Transaction (pre): CNT=08, 
>>>>> CMD=1a, ADD=a6, DAT0=01, DAT1=18
>>>>> [  277.579560] [    T113] i2c i2c-12: Transaction (post): CNT=08, 
>>>>> CMD=1a, ADD=a6, DAT0=01, DAT1=18
>>>
>>> Disable temperature sensor support on 0x53 (MR26 := 0x01)
>>>
>>>>> [  277.579620] [   T3293] i2c i2c-12: Transaction (pre): CNT=08, 
>>>>> CMD=0b, ADD=a3, DAT0=01, DAT1=18
>>>>> [  277.580170] [   T3293] i2c i2c-12: Transaction (post): CNT=08, 
>>>>> CMD=0b, ADD=a3, DAT0=08, DAT1=18
>>>
>>> Read MR11 of 0x51. Since 0xf8 was written above, 0x08 is "as expected".
>>>
>>>>> [  277.580234] [    T113] i2c i2c-12: Transaction (pre): CNT=08, 
>>>>> CMD=0b, ADD=a7, DAT0=08, DAT1=18
>>>>> [  277.581061] [    T113] i2c i2c-12: Transaction (post): CNT=08, 
>>>>> CMD=0b, ADD=a7, DAT0=00, DAT1=18
>>>
>>> Read MR11 of 0x53 (0x00 -> page 0)
>>>
>>>>> [  277.581072] [    T113] spd5118 12-0053: POST BIT UPDATE: SUSPEND 
>>>>> MR11 (0x0B) -> Cache: 0x00 | Bus: 0x00
>>>>> [  277.581128] [   T3293] i2c i2c-12: Transaction (pre): CNT=08, 
>>>>> CMD=1a, ADD=a2, DAT0=01, DAT1=18
>>>>> [  277.581559] [   T3293] i2c i2c-12: Transaction (post): CNT=08, 
>>>>> CMD=1a, ADD=a2, DAT0=01, DAT1=18
>>>
>>> Disable temperature sensor support on 0x51 (MR26 := 0x01)
>>>
>>>>> [  277.581626] [   T3293] i2c i2c-12: Transaction (pre): CNT=08, 
>>>>> CMD=0b, ADD=a3, DAT0=01, DAT1=18
>>>>> [  277.582236] [   T3293] i2c i2c-12: Transaction (post): CNT=08, 
>>>>> CMD=0b, ADD=a3, DAT0=08, DAT1=18
>>>
>>> Read MR11 from 0x51, wrong as before
>>>
>>>>> [  277.582250] [   T3293] spd5118 12-0051: POST BIT UPDATE: SUSPEND 
>>>>> MR11 (0x0B) -> Cache: 0x00 | Bus: 0x08
>>>>>
>>>>>
>>>>> --- The logs that are of interest ---
>>>>> [  277.573085] [   T3293] spd5118 12-0051: PRE BIT UPDATE: SUSPEND 
>>>>> MR11 (0x0B) -> Cache: 0x00 | Bus: 0x00
>>>>> …
>>>>> …
>>>>> …
>>>>> [  277.582250] [   T3293] spd5118 12-0051: POST BIT UPDATE: SUSPEND 
>>>>> MR11 (0x0B) -> Cache: 0x00 | Bus: 0x08
>>>>>
>>>>> I enabled i2c debugging as well in case it helps. The lines I 
>>>>> focusing on are “PRE BIT UPDATE…” and “POST BIT UPDATE…”, 
>>>>> immediately after regmap_update_bits() the physical bus value for 
>>>>> MR11 shifts to 0x08 while the regmap cache remains 0x00.
>>>>>
>>>>> I looked through the history of spd5118 patches and bugs and 
>>>>> noticed there has been some issues around suspend and sleep cycles. 
>>>>> This might be a deeper issue than just the spd5118 driver.
>>>>>
>>>
>>> Those problems are related to I2C controllers on some Intel boards, 
>>> which disable
>>> write operations. That does not affect AMD systems.
>>>
>>> The problem is that one of the MR11 read operations fails or, rather, 
>>> returns
>>> bad data. This bad data then corrupts the register when written back.
>>> This by itself is odd. There should be at least a debug log message 
>>> if there is
>>> an error in piix4_transaction(). Is there anything on address 0x22 on 
>>> that I2C bus ?
>>> It almost appears as if there is a parallel access to the I2C 
>>> controller (for
>>> example from ACPI) which would corrupt the data for the spd5118 access.
>>>
>>>>> Additional Notes:
>>>>> - Intermittent Nature: The issue is intermittent and typically 
>>>>> reproduces within ~10 sleep/resume cycles.
>>>>>
>>>>> - Single DIMM Testing: I was unable to reproduce the issue with 
>>>>> only 1 DIMM installed after running over 30 sleep/resume cycles, 
>>>>> though the intermittent nature makes it hard to rule out entirely.
>>>>>
>>>
>>> Both is not surprising, given that we are dealing with corrupted data 
>>> when
>>> reading from MR11. I have no idea how that corruption can happen. The 
>>> above
>>> is a wild guess: If there is indeed ACPI access to the I2C 
>>> controller, the
>>> only remedy I can think of would be to black-list the I2C controller 
>>> driver
>>> itself.
>>>
>>> Thanks,
>>> Guenter
>>>
>>>>> - Hardware Health: Memory stability was verified with a varitey of 
>>>>> memory tests with zero errors. Issue occurs with JEDEC and XMP 
>>>>> profiles enabled
>>>>>
>>>>>
>>>>> --- Steps to Reproduce ---
>>>>> 1. Boot system from cold boot. Load the spd5118 driver.
>>>>> 2. Put system to sleep
>>>>> 3. Wake system
>>>>> 4. Check value of MR11, if corrupted warm reboot go to step 7
>>>>> 6. Go to step 2, repeat
>>>>> 7. System now shows corrupted DIMM with a size of 2GB
>>>>>
>>>>> --- My test spd5118_suspend function ---
>>>>> static int spd5118_suspend(struct device *dev)
>>>>> {
>>>>>   struct spd5118_data *data = dev_get_drvdata(dev);
>>>>>   struct regmap *regmap = data->regmap;
>>>>>   u32 cache_val = 0, bus_val = 0;
>>>>>   u32 regval;
>>>>>   int err;
>>>>>
>>>>>   err = regmap_read(regmap, SPD5118_REG_TEMP_CONFIG, &regval);
>>>>>   if (err < 0)
>>>>>   return err;
>>>>>
>>>>>
>>>>>   /* 1. Read cached MR11 value from RAM */
>>>>>   regmap_read(regmap, SPD5118_REG_I2C_LEGACY_MODE, &cache_val);
>>>>>
>>>>>   /* 2. Read physical MR11 value directly from I2C bus */
>>>>>   regcache_cache_bypass(regmap, true);
>>>>>   regmap_read(regmap, SPD5118_REG_I2C_LEGACY_MODE, &bus_val);
>>>>>   regcache_cache_bypass(regmap, false);
>>>>>
>>>>>   /* 3. Output both on the exact same log line */
>>>>>   dev_info(dev, "PRE BIT UPDATE: SUSPEND MR11 (0x0B) -> Cache: 
>>>>> 0x%02x | Bus: 0x%02x\n", cache_val, bus_val);
>>>>>
>>>>>   regcache_cache_bypass(regmap, true);
>>>>>   regmap_update_bits(regmap, SPD5118_REG_TEMP_CONFIG, 
>>>>> SPD5118_TS_DISABLE,
>>>>>   SPD5118_TS_DISABLE);
>>>>>   regcache_cache_bypass(regmap, false);
>>>>>
>>>>>   /* 1. Read cached MR11 value from RAM */
>>>>>   regmap_read(regmap, SPD5118_REG_I2C_LEGACY_MODE, &cache_val);
>>>>>
>>>>>      /* 2. Read physical MR11 value directly from I2C bus */
>>>>>      regcache_cache_bypass(regmap, true);
>>>>>      regmap_read(regmap, SPD5118_REG_I2C_LEGACY_MODE, &bus_val);
>>>>>      regcache_cache_bypass(regmap, false);
>>>>>
>>>>>      /* 3. Output both on the exact same log line */
>>>>>      dev_info(dev, "POST BIT UPDATE: SUSPEND MR11 (0x0B) -> Cache: 
>>>>> 0x%02x | Bus: 0x%02x\n", cache_val, bus_val);
>>>>>
>>>>>      regcache_cache_only(regmap, true);
>>>>>      regcache_mark_dirty(regmap);
>>>>>
>>>>>      return 0;
>>>>> }
>>>>
>>>
>>
> 

