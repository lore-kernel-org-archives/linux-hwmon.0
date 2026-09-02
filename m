Received: from mail-pg1-f171.google.com (mail-pg1-f171.google.com [209.85.215.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F05274AEBCB
	for <linux-hwmon@vger.kernel.org>; Wed,  2 Sep 2026 17:37:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788370660; cv=none; b=dthXVK8KGNLYl0cex9e9mAu2yYUicr8TMrpTJDqd744d8EzzdaaOB1iIDO6QsRL1WML49Bfo21oKrswtlCK1Dw6/Zbbzazmrp3LVWK6sB4QMN4utjSBzpGy7jjG0zPQkRZ+yuPYIigOi76y3bST3qDuPYMLFZWoEKCatt2X+qgE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788370660; c=relaxed/simple;
	bh=m37hZlXLu7o+QJCT8gXldAaRh4+ThnnXsxOJuAQFx60=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=cW+b6JKQhpt5N6Saw6MCobcKWu/ATcpPV5TwfiAiSNQM67PflEgabvj/JLIv4DutKHomC74KFy7e/gxuEbVhTo3IpY3MnhFwaErsFpOQRlKWlN/Y0JkmkyUoKsNIGZlXT/i/BuOTWTiaqhpkGSuusgjYTGCWQdl+HUuOWZgdBGA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=DvcX+N7h; arc=none smtp.client-ip=209.85.215.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="DvcX+N7h"
Received: by mail-pg1-f171.google.com with SMTP id 41be03b00d2f7-cc1bc88a20eso1812975a12.3
        for <linux-hwmon@vger.kernel.org>; Wed, 02 Sep 2026 10:37:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788370655; x=1788975455; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=ho3tL4wP9lAngetSW7d9GmzKVGsoI3fi1/0eS8npSDw=;
        b=DvcX+N7hzK26ddIPtCusif1DVpzKxqo51aNYk19SU0VKawGCfVssCkQggt4pLGy6c9
         mw2RXL0dEBo/qgZidWRdwr2srxrWmujF8AQm1eLfKcoHj8Hd/6aQ/S9A5J3BCmMz/XrO
         fYRqGguo7qaTZRPe4TX9V6P7CuIuxeV3K8+heJa7qV7QP0P0GO8ZWMkOv30nGkYagzzf
         txeNAaAbreHH9RQJQZ5NaYZGK3Q9NPfNKLm/NbiZHbC5MDWE1FBvuOfAM7hIMSiX3BID
         smNewPBX3YBZfdGNXQfr5fDHWeVALqnPOixhMkq3YFb32ghFbMU//vuQUEBC8YiMYtlO
         YMEQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788370655; x=1788975455;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=ho3tL4wP9lAngetSW7d9GmzKVGsoI3fi1/0eS8npSDw=;
        b=H6phf5qkNFyuZHHLfH5Pd0GKaaIGMYrrYDB341FWJTR4zL1iooPqP2N9m5TlthGQ16
         bN/923gG45nWqwX9n1QKw30nAx3bgaTmM5IsHjrXNAERcJDRka1Ir4bTX/TAFH3rZfp+
         p9iupz8lYdOAaK4k6pQXlW/Z5EMdlVNorFVw1JXmEfn3aaCFCu6husEagxAYWgQ2iRNM
         nxU5lxM9U894rJ5N5wwqelzJsIaUKbNBijc2MCDiRGEKJD/FbikfaGZ2qtB/ou+m6i4p
         tp3S16dDKQ0wXzRXrMD6CUnf4YZ/QVNfvLMFzgBu8ODxUY+5Kpe/150vdhGDBqhk2SWS
         c39g==
X-Gm-Message-State: AFuF++keOSLzjm1EBySL899fFlOLPizx1w8fdGCfHBIOAndqp1scrN4I
	ZhsUKYqqaMOvlWyNW+sgJZl+QJFvGTdnnt9ENdBsrqU1kjhTR2BAt12C
X-Gm-Gg: AYBFou1+DutiPPOgXBsQirjzorkpk8BrnVkcZ7UayjYGQZKLjeJO686j656MIQnS38G
	xI59O9oCcEnWsJJGp89ZhW0q0zjXvY8k81/Fh6jkVUNmcbkkBiOPtoVGf/MyZ/SqSkSu5QB5zCI
	RNbtq9G3zHVFvyz4Bd468i/Xb/kPWeqsgpr4pCUYiQUaHcvhVHRPghT4UBy3mcv8r29IXLG7meX
	Me92P0QkoZYjRF3MFmWJkjT2V+FUcpcjZa0eDExOrgo9V6ezBKoNumKoTWRNJQ686TVDDTaqjV+
	63pB+yd6Rchy9D7CdIjAnod6VJOhGoC94Kcwyae0rXu9y/2qm+oj8SLALF2vKpKBu71YNARVPvS
	BNAUB8Gf37fV0SO/zjvFbFk9sOi5nsw8qAIvEgOREyS1jDXgugRowBiH5B5SNq98uW/vdTnLKTB
	2J6Wx/cmSFZDcCL8UMqtB+ZVPxCvxjQtlq75g6y6LgU0m2jq5nQdf33BLYveiglswvah9OR+c/o
	kjm/ycaP5CW8xgK0hvRyt6bkkdBeUCKfJbNdOlaIaaSshFrJSABV/4h
X-Received: by 2002:a17:90a:d403:b0:396:4cbf:45a2 with SMTP id 98e67ed59e1d1-39aee162852mr10758029a91.14.1788370654797;
        Wed, 02 Sep 2026 10:37:34 -0700 (PDT)
Received: from [10.198.0.120] (wnpgmb02ydw-ds01-112-62-45.dynamic.bellmts.net. [204.112.62.45])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-39b083e7167sm448061a91.5.2026.09.02.10.37.33
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 02 Sep 2026 10:37:34 -0700 (PDT)
Message-ID: <bb74ebc1-9ea6-4ab0-9443-d25f2f971e4e@gmail.com>
Date: Wed, 2 Sep 2026 12:37:32 -0500
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Betterbird (Linux)
Subject: Re: [BUG] SPD5118 Intermittent MR11 Corruption During Suspend/Resume
To: Guenter Roeck <linux@roeck-us.net>
Cc: linux-hwmon@vger.kernel.org, linux-kernel@vger.kernel.org
References: <1a8ea9da-1ac1-4312-a8ca-ea4a9f35093f@gmail.com>
 <ee284272-0da0-45b6-a3be-c76822e5d54f@roeck-us.net>
 <014b9438-e9b7-4be1-b816-002e83a068a0@roeck-us.net>
 <37132c40-aa82-4df1-b5ce-337601f3c085@gmail.com>
 <3c4e9f59-5272-48cf-a4a0-eeefcba955a9@roeck-us.net>
 <763a8b30-8548-4ff0-a1e9-8e74bbfe9b02@gmail.com>
 <6e8761aa-67ef-4624-834d-4b9d0ce729d6@roeck-us.net>
 <9753ed80-5666-42a6-b04c-99b9ef9326fe@gmail.com>
 <5c17ea39-c479-4f88-adc6-9a86f3dfb96a@roeck-us.net>
 <d80cf68e-a6cb-4b0b-807e-313be29ca8ae@gmail.com>
 <49cafd78-2468-4b43-a376-a8b2e2de2c19@roeck-us.net>
 <11de1daa-702e-419e-912a-db37c9f28e92@gmail.com>
 <67938f6d-d60f-44cf-9b03-fa472c8a8499@roeck-us.net>
 <65336f12-b821-449b-a637-31972807c676@gmail.com>
 <a953dcaa-cfff-40c8-85a9-c12601e49e85@roeck-us.net>
 <9cdf4b63-8f99-4a80-b0be-3f3df69e526e@gmail.com>
 <0de99cfa-7de4-4236-930c-2c037aa1648e@roeck-us.net>
 <2df09073-2d9f-4b6f-892b-45e7287a85c9@gmail.com>
 <56826d45-e18a-4f9e-94b0-3e6f335c4ee7@roeck-us.net>
Content-Language: en-US
From: Matthew Bettencourt <matthew.bettencourt@gmail.com>
In-Reply-To: <56826d45-e18a-4f9e-94b0-3e6f335c4ee7@roeck-us.net>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

Hello Guenter

 > I2C bus multiplexers only return a single data byte reflecting the
 > currently
 > selected bus. On writes they also accept a single byte, where a set bit
 > indicates
 > which of its channel(s) should be enabled. So i2cdump does not really 
work.
 > Actually, using i2cdump might have messed it up because the writes 
involved
 > might change the active bus... sorry, I should have mentioned before.
 > In general it is not safe to use i2cdump on an unknown device. Worst case
 > it can turn the hardware into a brick (seriously - I have seen that
 > happen).
 >
 > You could try "i2cget 12 0x71" and "i2cget 12 0x73". That should return
 > the active channel(s) if those are really I2C bus multiplexers. If they
 > are,
 > only a single bit should be set (again, i2cdump might have messed it up,
 > so you might want to reboot).

No worries, the system did not brick itself haha. I rebooted and 
executed the i2cget commands

# i2cget 12 0x71
WARNING! This program can confuse your I2C bus, cause data loss and worse!
I will read from device file /dev/i2c-12, chip address 0x71, current data
address, using read byte.
Continue? [Y/n] y
0x1f
# i2cget 12 0x73
WARNING! This program can confuse your I2C bus, cause data loss and worse!
I will read from device file /dev/i2c-12, chip address 0x73, current data
address, using read byte.
Continue? [Y/n] y
0x1f

 > so I don't have any of the AMDI0010 devices. Maybe that is the built-in
 > GPU ?

I thought I had disabled the igpu in the BIOS, but I might have reset 
the BIOS to factory settings at some point so it might have been become 
enabled again. I can check the BIOS settings when I get home.


 >> If it is worth while I have access to second AMD machine, PRO B850M-A
 >> WIFI/7600x3d/Teamgroup 2x16GB - FLBD532G6000HC30DC01, which I can swap
 >> parts from/to. Even though its a completely different system it might
 >> worth it to swap parts out and see then what comes up on either system
 >> to help identify what might be going on with the i2c bus devices.
 >>
 >
 > It might be worthwhile if that system does not suffer from the same
 > problem.
 >
 > Bus-wise I can see that you seem to have different I2C busses in your
 > system. I have

Yes I can do that. I will swap the RAM kits on both systems and see what 
happens, checking for the sleep/resume error message with the piix4 
transaction log.

Thanks,
Matthew

On 9/2/26 12:21 PM, Guenter Roeck wrote:
> Hi Matthew,
> 
> On 9/2/26 08:26, Matthew Bettencourt wrote:
>> Hello Guenter,
>>
>> Here is the i2cdump for those two 0x71 and 0x73 devices
>>
>> # i2cdump -y -f 12 0x73 b
>>       0  1  2  3  4  5  6  7  8  9  a  b  c  d  e  f    0123456789abcdef
>> 00: ff ff ff ff XX ff 12 ff 12 ff ff ff XX XX XX XX    ....X.?.?...XXXX
>> 10: XX 0f XX XX XX XX XX XX XX XX XX XX XX XX XX XX    X?XXXXXXXXXXXXXX
>> 20: XX XX XX XX XX XX XX XX XX XX XX XX XX XX XX XX    XXXXXXXXXXXXXXXX
>> 30: XX XX XX XX XX XX XX XX XX XX XX XX XX XX XX XX    XXXXXXXXXXXXXXXX
>> 40: XX XX XX XX XX XX XX XX XX XX XX XX XX XX XX XX    XXXXXXXXXXXXXXXX
>> 50: XX XX XX XX XX XX XX XX XX XX XX XX XX XX XX XX    XXXXXXXXXXXXXXXX
>> 60: XX XX XX XX XX XX XX XX XX XX XX XX XX XX XX XX    XXXXXXXXXXXXXXXX
>> 70: XX XX XX XX XX XX XX XX XX XX XX XX XX XX XX XX    XXXXXXXXXXXXXXXX
>> 80: 00 e1 f9 03 04 05 06 07 08 09 0a 0b 0c 0d 0e 0f    .???????????????
>> 90: 10 11 12 13 14 15 16 17 18 19 1a 1b 1c 1d 1e 1f    ????????????????
>> a0: 00 01 02 03 04 05 06 07 08 09 0a 0b 0c 0d 0e 0f    .???????????????
>> b0: 10 11 12 13 14 15 16 17 18 19 1a 1b 1c 1d 1e 1f    ????????????????
>> c0: 00 01 02 03 04 05 06 07 08 09 0a 0b 0c 0d 0e 0f    .???????????????
>> d0: 10 11 12 13 14 15 16 17 18 19 1a 1b 1c 1d 1e 1f    ????????????????
>> e0: 00 01 02 03 04 05 06 07 08 09 0a 0b 0c 0d 0e 0f    .???????????????
>> f0: 10 11 12 13 14 15 16 17 18 19 1a 1b 1c 1d 1e 1f    ????????????????
>> # i2cdump -y -f 12 0x71 b
>>       0  1  2  3  4  5  6  7  8  9  a  b  c  d  e  f    0123456789abcdef
>> 00: ff ff ff ff XX ff 57 ff 57 ff ff ff XX XX XX XX    ....X.W.W...XXXX
>> 10: XX 0f XX XX XX XX XX XX XX XX XX XX XX XX XX XX    X?XXXXXXXXXXXXXX
>> 20: XX XX XX XX XX XX XX XX XX XX XX XX XX XX XX XX    XXXXXXXXXXXXXXXX
>> 30: XX XX XX XX XX XX XX XX XX XX XX XX XX XX XX XX    XXXXXXXXXXXXXXXX
>> 40: XX XX XX XX XX XX XX XX XX XX XX XX XX XX XX XX    XXXXXXXXXXXXXXXX
>> 50: XX XX XX XX XX XX XX XX XX XX XX XX XX XX XX XX    XXXXXXXXXXXXXXXX
>> 60: XX XX XX XX XX XX XX XX XX XX XX XX XX XX XX XX    XXXXXXXXXXXXXXXX
>> 70: XX XX XX XX XX XX XX XX XX XX XX XX XX XX XX XX    XXXXXXXXXXXXXXXX
>> 80: 00 0b e0 03 04 05 06 07 08 09 0a 0b 0c 0d 0e 0f    .???????????????
>> 90: 10 11 12 13 14 15 16 17 18 19 1a 1b 1c 1d 1e 1f    ????????????????
>> a0: 00 01 02 03 04 05 06 07 08 09 0a 0b 0c 0d 0e 0f    .???????????????
>> b0: 10 11 12 13 14 15 16 17 18 19 1a 1b 1c 1d 1e 1f    ????????????????
>> c0: 00 01 02 03 04 05 06 07 08 09 0a 0b 0c 0d 0e 0f    .???????????????
>> d0: 10 11 12 13 14 15 16 17 18 19 1a 1b 1c 1d 1e 1f    ????????????????
>> e0: 00 01 02 03 04 05 06 07 08 09 0a 0b 0c 0d 0e 0f    .???????????????
>> f0: 10 11 12 13 14 15 16 17 18 19 1a 1b 1c 1d 1e 1f    ????????????????
>>
> 
> I2C bus multiplexers only return a single data byte reflecting the 
> currently
> selected bus. On writes they also accept a single byte, where a set bit 
> indicates
> which of its channel(s) should be enabled. So i2cdump does not really work.
> Actually, using i2cdump might have messed it up because the writes involved
> might change the active bus... sorry, I should have mentioned before.
> In general it is not safe to use i2cdump on an unknown device. Worst case
> it can turn the hardware into a brick (seriously - I have seen that 
> happen).
> 
> You could try "i2cget 12 0x71" and "i2cget 12 0x73". That should return
> the active channel(s) if those are really I2C bus multiplexers. If they 
> are,
> only a single bit should be set (again, i2cdump might have messed it up,
> so you might want to reboot).
> 
>> # ls -l /sys/bus/i2c/devices/
>> total 0
>> lrwxrwxrwx. 1 root root 0 Sep  2 10:08 12-0051 -> ../../../devices/ 
>> pci0000:00/0000:00:14.0/i2c-12/12-0051
>> lrwxrwxrwx. 1 root root 0 Sep  2 10:08 12-0053 -> ../../../devices/ 
>> pci0000:00/0000:00:14.0/i2c-12/12-0053
>> lrwxrwxrwx. 1 root root 0 Sep  2 10:08 i2c-0 -> ../../../devices/ 
>> platform/AMDI0010:00/i2c-0
>> lrwxrwxrwx. 1 root root 0 Sep  2 10:08 i2c-1 -> ../../../devices/ 
>> platform/AMDI0010:01/i2c-1
>> lrwxrwxrwx. 1 root root 0 Sep  2 10:08 i2c-10 -> ../../../devices/ 
>> pci0000:00/0000:00:01.1/0000:01:00.0/0000:02:00.0/0000:03:00.0/drm/ 
>> card1/card1-DP-2/i2c-10
>> lrwxrwxrwx. 1 root root 0 Sep  2 10:08 i2c-11 -> ../../../devices/ 
>> pci0000:00/0000:00:01.1/0000:01:00.0/0000:02:00.0/0000:03:00.0/drm/ 
>> card1/card1-DP-3/i2c-11
>> lrwxrwxrwx. 1 root root 0 Sep  2 10:08 i2c-12 -> ../../../devices/ 
>> pci0000:00/0000:00:14.0/i2c-12
>> lrwxrwxrwx. 1 root root 0 Sep  2 10:08 i2c-13 -> ../../../devices/ 
>> pci0000:00/0000:00:14.0/i2c-13
>> lrwxrwxrwx. 1 root root 0 Sep  2 10:08 i2c-14 -> ../../../devices/ 
>> pci0000:00/0000:00:14.0/i2c-14
>> lrwxrwxrwx. 1 root root 0 Sep  2 10:08 i2c-2 -> ../../../devices/ 
>> pci0000:00/0000:00:01.1/0000:01:00.0/0000:02:00.0/0000:03:00.0/i2c-2
>> lrwxrwxrwx. 1 root root 0 Sep  2 10:08 i2c-3 -> ../../../devices/ 
>> pci0000:00/0000:00:01.1/0000:01:00.0/0000:02:00.0/0000:03:00.0/i2c-3
>> lrwxrwxrwx. 1 root root 0 Sep  2 10:08 i2c-4 -> ../../../devices/ 
>> pci0000:00/0000:00:01.1/0000:01:00.0/0000:02:00.0/0000:03:00.0/i2c-4
>> lrwxrwxrwx. 1 root root 0 Sep  2 10:08 i2c-5 -> ../../../devices/ 
>> pci0000:00/0000:00:01.1/0000:01:00.0/0000:02:00.0/0000:03:00.0/i2c-5
>> lrwxrwxrwx. 1 root root 0 Sep  2 10:08 i2c-6 -> ../../../devices/ 
>> pci0000:00/0000:00:01.1/0000:01:00.0/0000:02:00.0/0000:03:00.0/i2c-6
>> lrwxrwxrwx. 1 root root 0 Sep  2 10:08 i2c-7 -> ../../../devices/ 
>> pci0000:00/0000:00:01.1/0000:01:00.0/0000:02:00.0/0000:03:00.0/i2c-7
>> lrwxrwxrwx. 1 root root 0 Sep  2 10:08 i2c-8 -> ../../../devices/ 
>> pci0000:00/0000:00:01.1/0000:01:00.0/0000:02:00.0/0000:03:00.0/i2c-8
>> lrwxrwxrwx. 1 root root 0 Sep  2 10:08 i2c-9 -> ../../../devices/ 
>> pci0000:00/0000:00:01.1/0000:01:00.0/0000:02:00.0/0000:03:00.0/drm/ 
>> card1/card1-DP-1/i2c-9
>> lrwxrwxrwx. 1 root root 0 Sep  2 10:08 i2c-MSFT8000:00 -> ../../../ 
>> devices/platform/AMDI0010:01/i2c-1/i2c-MSFT8000:00
>>
>>
>> If it is worth while I have access to second AMD machine, PRO B850M-A 
>> WIFI/7600x3d/Teamgroup 2x16GB - FLBD532G6000HC30DC01, which I can swap 
>> parts from/to. Even though its a completely different system it might 
>> worth it to swap parts out and see then what comes up on either system 
>> to help identify what might be going on with the i2c bus devices.
>>
> 
> It might be worthwhile if that system does not suffer from the same 
> problem.
> 
> Bus-wise I can see that you seem to have different I2C busses in your 
> system. I have
> 
> lrwxrwxrwx 1 root root 0 Aug 29 16:26 0-0050 -> ../../../devices/ 
> pci0000:00/0000:00:14.0/i2c-0/0-0050
> lrwxrwxrwx 1 root root 0 Aug 29 16:26 0-0051 -> ../../../devices/ 
> pci0000:00/0000:00:14.0/i2c-0/0-0051
> lrwxrwxrwx 1 root root 0 Aug 29 16:26 0-0052 -> ../../../devices/ 
> pci0000:00/0000:00:14.0/i2c-0/0-0052
> lrwxrwxrwx 1 root root 0 Aug 29 16:26 0-0053 -> ../../../devices/ 
> pci0000:00/0000:00:14.0/i2c-0/0-0053
> lrwxrwxrwx 1 root root 0 Aug 29 16:26 i2c-0 -> ../../../devices/ 
> pci0000:00/0000:00:14.0/i2c-0
> lrwxrwxrwx 1 root root 0 Aug 29 16:26 i2c-1 -> ../../../devices/ 
> pci0000:00/0000:00:14.0/i2c-1
> lrwxrwxrwx 1 root root 0 Aug 29 16:26 i2c-2 -> ../../../devices/ 
> pci0000:00/0000:00:14.0/i2c-2
> lrwxrwxrwx 1 root root 0 Aug 29 16:26 i2c-3 -> ../../../devices/ 
> pci0000:00/0000:00:01.1/0000:01:00.0/0000:02:00.0/0000:03:00.0/i2c-3
> lrwxrwxrwx 1 root root 0 Aug 29 16:26 i2c-4 -> ../../../devices/ 
> pci0000:00/0000:00:01.1/0000:01:00.0/0000:02:00.0/0000:03:00.0/i2c-4
> lrwxrwxrwx 1 root root 0 Aug 29 16:26 i2c-5 -> ../../../devices/ 
> pci0000:00/0000:00:01.1/0000:01:00.0/0000:02:00.0/0000:03:00.0/i2c-5
> lrwxrwxrwx 1 root root 0 Aug 29 16:26 i2c-6 -> ../../../devices/ 
> pci0000:00/0000:00:01.1/0000:01:00.0/0000:02:00.0/0000:03:00.0/i2c-6
> lrwxrwxrwx 1 root root 0 Aug 29 16:26 i2c-7 -> ../../../devices/ 
> pci0000:00/0000:00:01.1/0000:01:00.0/0000:02:00.0/0000:03:00.0/drm/ 
> card1/card1-DP-1/i2c-7
> 
> so I don't have any of the AMDI0010 devices. Maybe that is the built-in 
> GPU ?
> 
> Thanks,
> Guenter
> 

