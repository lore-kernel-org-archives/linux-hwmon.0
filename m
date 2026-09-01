Received: from mail-pf1-f171.google.com (mail-pf1-f171.google.com [209.85.210.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 16F054399F4
	for <linux-hwmon@vger.kernel.org>; Tue,  1 Sep 2026 03:10:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788232218; cv=none; b=bwS1FCP1kolornau8mtrIjwzwKQ0DrNSUSvAMqVz/OoJ0F3QtH96Dni+Dz+1jyfli1Dn9aB6l1ry1m9pi0iHEC8nUkiPhWLqMA7udsr7Q+cMdCJm+Nfcqilsw+M0Cd92TmJtOulrQa0GWaQGr+KxVNUXLyDkBK22p2YClIxCdhg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788232218; c=relaxed/simple;
	bh=dI9wR2MlBFCP15mnLNzqQyuNmkPftOf+2gi9PAfHkiY=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=ry1FcTiN6U2eU+swpgH56Zylf+i60CsmJOtD8vuFwBp3WNc1h59kNqMcXpQEj7inRLxHQtzYwm2twFSnhhk5MSUKEHXTE0uWbtjhGP72mButuaqCJpaoTUbBoMEV9aeoFnNR00GA6yN5qmu+dyj+Npl40euuGg0+gYJuwaBoluA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=N4VEJn17; arc=none smtp.client-ip=209.85.210.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="N4VEJn17"
Received: by mail-pf1-f171.google.com with SMTP id d2e1a72fcca58-84830c774a0so438250b3a.1
        for <linux-hwmon@vger.kernel.org>; Mon, 31 Aug 2026 20:10:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788232214; x=1788837014; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:sender:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=jhJ8n25LzOc8lbhEbWbszgHxjWzBW7yAadsVbbI5nCc=;
        b=N4VEJn17gs2Ii0nHeTdVXWDsHkypZq1th3UDuVFHtzTwLfQxtydIRyudRmREF6qccy
         DqKCwRkUIrLbLnRW6gHw5FB9vQG8njQWRN331hJGVQwDY0WFhEfZ+O2aUzPLUhNmkffz
         r9gYkJ4+u328IU3vw/yWDAMGy8TidGJ152ZvFIUvD/6NvTmRvLqhBZSSovSINN37v2jJ
         tCDQ0gAcrFIjizBlzyGkJqrThdormNpK3/gaI6owPJ3JvnVEeBODPYVB62lzyavIvoTL
         /o05K07JFO43YMZV6yqG5lPBOC+wDfOzBN+0GsrehGdEkrzrZ3kLjehFkNG7BR2JX7Eb
         wDug==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788232214; x=1788837014;
        h=content-transfer-encoding:content-type:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:sender:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=jhJ8n25LzOc8lbhEbWbszgHxjWzBW7yAadsVbbI5nCc=;
        b=q5x5mJTUo1HbiQ98giP22D11XvDod2at9CRVWhRD94na07587DKZyoTSFsDvCu/2ub
         Fwa4VgQithQ7FfO46Mi4B7U4buEA+PJN31iFOIwL0/iRyYJU2Lm/rqejgIv7gexjdbLW
         2Mm0ui9jr8U8GfTieU3GqjzFpAm1dFiVWRelAtlm58K5VGBgcjYBzS9MI9/fSfDf1K72
         oNYj6s42KrRvVtjZrUAIgETPv4u5NDme/jd1tCEDpqu0Hg6leeWhzyKHNB0Bp/cr04Yu
         hJhGIiQRy4oXgTiZnPm+YJ/CowMwO3jGpdvBZ98NfbRayz42AGDQytlv5IDIFnkP7o/6
         qgXA==
X-Gm-Message-State: AFuF++kwNqhzvLCqd7zXe9S/0/T5ib5dmIoixX9bterWKI7D2h94yGtd
	/HmfQgY4FjwNYSbOXA4N2vRLIBm+qC6IA0yDkfRn8ChIu8i/XabUgEnt
X-Gm-Gg: AR+sD10i7aLrYdXfRH25D07GW9OYOKC9CPqQmdyuEB/VxQZ8OFUN1yIbpDT5156p2Lo
	CkGzY/SwzM+gUHwFcdwTW+jFWCevMa1SjU9F8KzVpuHMiIsUHPFr2Xdva5CD+5bQwOaJBkPpnyY
	ZsaTVj6D6esWWGaLrJsuAIL2i2wnPQx27ww27wAi/9/IncWZjt5qHwgkD61JRd+Wkes5spwlz66
	rq+gdgunFN5k254pPCAk5fyXot5IvjxEYSx3xjL1GyGIRo5iAupzMJNRrd6pPg5EoTzPI6nGr2v
	CkqlIIJ39+QyQaZ9Fa597Vgq3je3sWm0mO2H+ar2je99MfgVedAA7ujtjlnrceNqk5RbBXjMTHl
	BVHT310syPFBiblXwryH5lh5ALNQ0JdE8mYgj5SeIE94Q//AEChvlklga/TEppSGd8de47ezF3T
	2ZQ+ctMgeUUvSpxjU+aKXJcSFK7X3GsgLGv5tN77cM3ofrFeqsKg0J63YJ9AZC6gOtGhfom5EiB
	oRUQY8tm44yjvZGgbD17g96uGz06Tv4trV005ZdPG5O0WEl
X-Received: by 2002:a05:6a20:430b:b0:3d0:c5c0:d9b3 with SMTP id adf61e73a8af0-3d269b4f03emr43822140637.18.1788232213947;
        Mon, 31 Aug 2026 20:10:13 -0700 (PDT)
Received: from ?IPV6:2600:1700:e321:62f0:da43:aeff:fecc:bfd5? ([2600:1700:e321:62f0:da43:aeff:fecc:bfd5])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3286fa20e2fsm34570628eec.28.2026.08.31.20.10.12
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 31 Aug 2026 20:10:13 -0700 (PDT)
Sender: Guenter Roeck <groeck7@gmail.com>
Message-ID: <6e8761aa-67ef-4624-834d-4b9d0ce729d6@roeck-us.net>
Date: Mon, 31 Aug 2026 20:10:12 -0700
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [BUG] SPD5118 Intermittent MR11 Corruption During Suspend/Resume
To: Matthew Bettencourt <matthew.bettencourt@gmail.com>
Cc: linux-hwmon@vger.kernel.org, linux-kernel@vger.kernel.org
References: <1a8ea9da-1ac1-4312-a8ca-ea4a9f35093f@gmail.com>
 <ee284272-0da0-45b6-a3be-c76822e5d54f@roeck-us.net>
 <014b9438-e9b7-4be1-b816-002e83a068a0@roeck-us.net>
 <37132c40-aa82-4df1-b5ce-337601f3c085@gmail.com>
 <3c4e9f59-5272-48cf-a4a0-eeefcba955a9@roeck-us.net>
 <763a8b30-8548-4ff0-a1e9-8e74bbfe9b02@gmail.com>
Content-Language: en-US
From: Guenter Roeck <linux@roeck-us.net>
Autocrypt: addr=linux@roeck-us.net; keydata=
 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
 np3900V20aS7eD9K8GTU0TGC1pyz6IVJwIE=
In-Reply-To: <763a8b30-8548-4ff0-a1e9-8e74bbfe9b02@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

On 8/31/26 17:16, Matthew Bettencourt wrote:
> Hello Guenter,
> 
> Here is the list of i2c devices on my machine
> 
> grep . /sys/class/i2c-dev/*/name
> /sys/class/i2c-dev/i2c-0/name:Synopsys DesignWare I2C adapter
> /sys/class/i2c-dev/i2c-10/name:AMDGPU DM aux hw bus 1
> /sys/class/i2c-dev/i2c-11/name:AMDGPU DM aux hw bus 2
> /sys/class/i2c-dev/i2c-12/name:SMBus PIIX4 adapter port 0 at 0b00
> /sys/class/i2c-dev/i2c-13/name:SMBus PIIX4 adapter port 2 at 0b00
> /sys/class/i2c-dev/i2c-14/name:SMBus PIIX4 adapter port 1 at 0b20
> /sys/class/i2c-dev/i2c-1/name:Synopsys DesignWare I2C adapter
> /sys/class/i2c-dev/i2c-2/name:AMDGPU SMU 0
> /sys/class/i2c-dev/i2c-3/name:AMDGPU SMU 1
> /sys/class/i2c-dev/i2c-4/name:AMDGPU DM i2c hw bus 0
> /sys/class/i2c-dev/i2c-5/name:AMDGPU DM i2c hw bus 1
> /sys/class/i2c-dev/i2c-6/name:AMDGPU DM i2c hw bus 2
> /sys/class/i2c-dev/i2c-7/name:AMDGPU DM i2c hw bus 3
> /sys/class/i2c-dev/i2c-8/name:AMDGPU DM i2c OEM bus
> /sys/class/i2c-dev/i2c-9/name:AMDGPU DM aux hw bus 0
> 
> The dmesg output I provided was captured with i2c debugging enabled. When the issue occurred those are the only i2c transitions I saw.
> 
> I will try and add some additional logging and checks the controller driver and see if there are any other i2c transactions with the same symptoms.
> 
>  >  The only ideas I have is that somehow an access to another I2C bus
>  > messes up controller registers, or that there is a real hardware problem.
> 
> I am not against the determination that there might hardware issue, however I got down this rabbit hole after I read a forum post on level1techs where someone else had the exact issue with the same memory kit. I have posted in that forum as well but have not gotten a reply. The original post sounds very similar to this issue but the user never reports on the actual SPD5118 registers so it is hard to know for sure.
> 
> https://forum.level1techs.com/t/msi-x870e-carbon-9950x-2x48gb-ram-bizzare-issues/222454/23
> 

I think your log shows exactly what happens (at least in your case):
The I2C controller sometimes returns 0xff when reading MR11, and from
there everything goes downhill. As mentioned below, I would suggest to
add code into piix4_transaction(), check if SMBHSTCMD or SMBHSTADD changes
between pre and post, and print an error log message when this happens.
Per your log message, when it happens, the controller returns an MR11
value of 0xff which is obviously bad and will trigger all kinds
of issues.

Obviously that isn't going to explain _why_ this happens, but it is a
starting point. As for why this is (only) seen if the spd5118 driver
is loaded: There is no other code writing back MR11. If there is some
firmware issue, the problem may still exist but not have any adverse
impact.

With the debug code mentioned above, we would at least have a chance
to figure out if there are any other failing read operations or if this
really only affects MR11.

Thanks,
Guenter

> Thanks,
> Matthew
> 
> On 8/31/26 6:38 PM, Guenter Roeck wrote:
>> On 8/31/26 16:10, Matthew Bettencourt wrote:
>>> Hi Guenter,
>>>
>>> I checked the i2c bus and there is nothing at address 0x22:
>>>
>>> # i2cdetect -y 12
>>>       0  1  2  3  4  5  6  7  8  9  a  b  c  d  e  f
>>> 00:                         -- -- -- -- -- -- -- --
>>> 10: -- -- -- -- -- 15 -- -- -- -- -- -- -- -- -- --
>>> 20: -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- --
>>> 30: -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- --
>>> 40: -- -- -- -- -- -- -- -- -- 49 -- 4b -- -- -- --
>>> 50: -- 51 -- 53 -- -- -- -- -- -- -- -- -- -- -- --
>>> 60: -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- --
>>> 70: -- 71 -- 73 -- -- --
>>>
>>
>> That means that
>>
>>>>>> [  277.574130] [   T3293] i2c i2c-12: Transaction (pre): CNT=08, CMD=0b, ADD=a3, DAT0=00, DAT1=18
>>>>>> [  277.575552] [   T3293] i2c i2c-12: Transaction (post): CNT=08, CMD=01, ADD=45, DAT0=ff, DAT1=18
>>>>                                                                           ^^      ^^       ^^
>>>> This is unexpected. It was supposed to read MR11 from 0x51, but the returned data is 0xff,
>>>> and the CMD and ADD register values are changed. 0xff is returned to the calling code as MR11.
>>>>
>>
>> this is a real problem. I don't really know what to suggest here. You could
>> add some debugging code into the controller driver and check if / how often
>> CMD or ADD changes its value between pre and post, and generate a log message
>> if that happens. The value should never change. If it happens when reading MR11
>> I suspect that it happens with other accesses as well.
>>
>> What I2C controllers do you have in your system ? "grep . /sys/class/ i2c-dev/*/name"
>> should tell. Also, do you see any other I2C transactions on other I2C
>> busses ? The only ideas I have is that somehow an access to another I2C bus
>> messes up controller registers, or that there is a real hardware problem.
>>
>> Thanks,
>> Guenter
>>
>>>>>> [  277.575617] [    T113] i2c i2c-12: Transaction (pre): CNT=08, CMD=1a, ADD=a7, DAT0=ff, DAT1=18
>>>>>> [  277.576169] [    T113] i2c i2c-12: Transaction (post): CNT=08, CMD=1a, ADD=a7, DAT0=00, DAT1=18
>>>>
>>>> Read MR26 of 0x53 (=0x00, enabled)
>>>>
>>>>>> [  277.576237] [   T3293] i2c i2c-12: Transaction (pre): CNT=08, CMD=0b, ADD=a2, DAT0=f8, DAT1=18
>>>>>> [  277.577061] [   T3293] i2c i2c-12: Transaction (post): CNT=08, CMD=0b, ADD=a2, DAT0=f8, DAT1=18
>>>>
>>>> Write 0xf8 into MR11 of 0x51. This is where things go wrong. The call originates
>>>> from regmap, which tries to configure page 0 (lower 3 bit) while leaving the upper
>>>> bits alone (which were 0xff from above corrupted read).
>>>>
>>>>>> [  277.577121] [    T113] i2c i2c-12: Transaction (pre): CNT=08, CMD=0b, ADD=a7, DAT0=f8, DAT1=18
>>>>>> [  277.578063] [    T113] i2c i2c-12: Transaction (post): CNT=08, CMD=0b, ADD=a7, DAT0=00, DAT1=18
>>>>
>>>> Read MR11 of 0x53 (=0x00)
>>>>
>>>>>> [  277.578127] [   T3293] i2c i2c-12: Transaction (pre): CNT=08, CMD=1a, ADD=a3, DAT0=00, DAT1=18
>>>>>> [  277.579062] [   T3293] i2c i2c-12: Transaction (post): CNT=08, CMD=1a, ADD=a3, DAT0=00, DAT1=18
>>>>
>>>> Read MR26 of 0x51 (0x00 -> enabled)
>>>>
>>>>>> [  277.579131] [    T113] i2c i2c-12: Transaction (pre): CNT=08, CMD=1a, ADD=a6, DAT0=01, DAT1=18
>>>>>> [  277.579560] [    T113] i2c i2c-12: Transaction (post): CNT=08, CMD=1a, ADD=a6, DAT0=01, DAT1=18
>>>>
>>>> Disable temperature sensor support on 0x53 (MR26 := 0x01)
>>>>
>>>>>> [  277.579620] [   T3293] i2c i2c-12: Transaction (pre): CNT=08, CMD=0b, ADD=a3, DAT0=01, DAT1=18
>>>>>> [  277.580170] [   T3293] i2c i2c-12: Transaction (post): CNT=08, CMD=0b, ADD=a3, DAT0=08, DAT1=18
>>>>
>>>> Read MR11 of 0x51. Since 0xf8 was written above, 0x08 is "as expected".
>>>>
>>>>>> [  277.580234] [    T113] i2c i2c-12: Transaction (pre): CNT=08, CMD=0b, ADD=a7, DAT0=08, DAT1=18
>>>>>> [  277.581061] [    T113] i2c i2c-12: Transaction (post): CNT=08, CMD=0b, ADD=a7, DAT0=00, DAT1=18
>>>>
>>>> Read MR11 of 0x53 (0x00 -> page 0)
>>>>
>>>>>> [  277.581072] [    T113] spd5118 12-0053: POST BIT UPDATE: SUSPEND MR11 (0x0B) -> Cache: 0x00 | Bus: 0x00
>>>>>> [  277.581128] [   T3293] i2c i2c-12: Transaction (pre): CNT=08, CMD=1a, ADD=a2, DAT0=01, DAT1=18
>>>>>> [  277.581559] [   T3293] i2c i2c-12: Transaction (post): CNT=08, CMD=1a, ADD=a2, DAT0=01, DAT1=18
>>>>
>>>> Disable temperature sensor support on 0x51 (MR26 := 0x01)
>>>>
>>>>>> [  277.581626] [   T3293] i2c i2c-12: Transaction (pre): CNT=08, CMD=0b, ADD=a3, DAT0=01, DAT1=18
>>>>>> [  277.582236] [   T3293] i2c i2c-12: Transaction (post): CNT=08, CMD=0b, ADD=a3, DAT0=08, DAT1=18
>>>>
>>>> Read MR11 from 0x51, wrong as before
>>>>
>>>>>> [  277.582250] [   T3293] spd5118 12-0051: POST BIT UPDATE: SUSPEND MR11 (0x0B) -> Cache: 0x00 | Bus: 0x08
>>>>>>
>>>>>>
>>>>>> --- The logs that are of interest ---
>>>>>> [  277.573085] [   T3293] spd5118 12-0051: PRE BIT UPDATE: SUSPEND MR11 (0x0B) -> Cache: 0x00 | Bus: 0x00
>>>>>> …
>>>>>> …
>>>>>> …
>>>>>> [  277.582250] [   T3293] spd5118 12-0051: POST BIT UPDATE: SUSPEND MR11 (0x0B) -> Cache: 0x00 | Bus: 0x08
>>>>>>
>>>>>> I enabled i2c debugging as well in case it helps. The lines I focusing on are “PRE BIT UPDATE…” and “POST BIT UPDATE…”, immediately after regmap_update_bits() the physical bus value for MR11 shifts to 0x08 while the regmap cache remains 0x00.
>>>>>>
>>>>>> I looked through the history of spd5118 patches and bugs and noticed there has been some issues around suspend and sleep cycles. This might be a deeper issue than just the spd5118 driver.
>>>>>>
>>>>
>>>> Those problems are related to I2C controllers on some Intel boards, which disable
>>>> write operations. That does not affect AMD systems.
>>>>
>>>> The problem is that one of the MR11 read operations fails or, rather, returns
>>>> bad data. This bad data then corrupts the register when written back.
>>>> This by itself is odd. There should be at least a debug log message if there is
>>>> an error in piix4_transaction(). Is there anything on address 0x22 on that I2C bus ?
>>>> It almost appears as if there is a parallel access to the I2C controller (for
>>>> example from ACPI) which would corrupt the data for the spd5118 access.
>>>>
>>>>>> Additional Notes:
>>>>>> - Intermittent Nature: The issue is intermittent and typically reproduces within ~10 sleep/resume cycles.
>>>>>>
>>>>>> - Single DIMM Testing: I was unable to reproduce the issue with only 1 DIMM installed after running over 30 sleep/resume cycles, though the intermittent nature makes it hard to rule out entirely.
>>>>>>
>>>>
>>>> Both is not surprising, given that we are dealing with corrupted data when
>>>> reading from MR11. I have no idea how that corruption can happen. The above
>>>> is a wild guess: If there is indeed ACPI access to the I2C controller, the
>>>> only remedy I can think of would be to black-list the I2C controller driver
>>>> itself.
>>>>
>>>> Thanks,
>>>> Guenter
>>>>
>>>>>> - Hardware Health: Memory stability was verified with a varitey of memory tests with zero errors. Issue occurs with JEDEC and XMP profiles enabled
>>>>>>
>>>>>>
>>>>>> --- Steps to Reproduce ---
>>>>>> 1. Boot system from cold boot. Load the spd5118 driver.
>>>>>> 2. Put system to sleep
>>>>>> 3. Wake system
>>>>>> 4. Check value of MR11, if corrupted warm reboot go to step 7
>>>>>> 6. Go to step 2, repeat
>>>>>> 7. System now shows corrupted DIMM with a size of 2GB
>>>>>>
>>>>>> --- My test spd5118_suspend function ---
>>>>>> static int spd5118_suspend(struct device *dev)
>>>>>> {
>>>>>>   struct spd5118_data *data = dev_get_drvdata(dev);
>>>>>>   struct regmap *regmap = data->regmap;
>>>>>>   u32 cache_val = 0, bus_val = 0;
>>>>>>   u32 regval;
>>>>>>   int err;
>>>>>>
>>>>>>   err = regmap_read(regmap, SPD5118_REG_TEMP_CONFIG, &regval);
>>>>>>   if (err < 0)
>>>>>>   return err;
>>>>>>
>>>>>>
>>>>>>   /* 1. Read cached MR11 value from RAM */
>>>>>>   regmap_read(regmap, SPD5118_REG_I2C_LEGACY_MODE, &cache_val);
>>>>>>
>>>>>>   /* 2. Read physical MR11 value directly from I2C bus */
>>>>>>   regcache_cache_bypass(regmap, true);
>>>>>>   regmap_read(regmap, SPD5118_REG_I2C_LEGACY_MODE, &bus_val);
>>>>>>   regcache_cache_bypass(regmap, false);
>>>>>>
>>>>>>   /* 3. Output both on the exact same log line */
>>>>>>   dev_info(dev, "PRE BIT UPDATE: SUSPEND MR11 (0x0B) -> Cache: 0x%02x | Bus: 0x%02x\n", cache_val, bus_val);
>>>>>>
>>>>>>   regcache_cache_bypass(regmap, true);
>>>>>>   regmap_update_bits(regmap, SPD5118_REG_TEMP_CONFIG, SPD5118_TS_DISABLE,
>>>>>>   SPD5118_TS_DISABLE);
>>>>>>   regcache_cache_bypass(regmap, false);
>>>>>>
>>>>>>   /* 1. Read cached MR11 value from RAM */
>>>>>>   regmap_read(regmap, SPD5118_REG_I2C_LEGACY_MODE, &cache_val);
>>>>>>
>>>>>>      /* 2. Read physical MR11 value directly from I2C bus */
>>>>>>      regcache_cache_bypass(regmap, true);
>>>>>>      regmap_read(regmap, SPD5118_REG_I2C_LEGACY_MODE, &bus_val);
>>>>>>      regcache_cache_bypass(regmap, false);
>>>>>>
>>>>>>      /* 3. Output both on the exact same log line */
>>>>>>      dev_info(dev, "POST BIT UPDATE: SUSPEND MR11 (0x0B) -> Cache: 0x%02x | Bus: 0x%02x\n", cache_val, bus_val);
>>>>>>
>>>>>>      regcache_cache_only(regmap, true);
>>>>>>      regcache_mark_dirty(regmap);
>>>>>>
>>>>>>      return 0;
>>>>>> }
>>>>>
>>>>
>>>
>>
> 

