Received: from mail-pg1-f178.google.com (mail-pg1-f178.google.com [209.85.215.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4BBF042049F
	for <linux-hwmon@vger.kernel.org>; Wed,  2 Sep 2026 15:26:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.178
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788362769; cv=none; b=TAwH9xKZUc9AF91h+6qN97jzi7TmrHQrOAxKgwy6a5DORt0wFs3FXFOIV71tWsDZj7P6cbCerHxtXRNGE+PJFrXz8fQRpsZvbHbKfAC8EM0/OXV0CYIRY5fSXbao5gK/dbcCdJ5dqBJkAdbUcNtYHXZB1nE5bkVEKtlLioGZCZ4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788362769; c=relaxed/simple;
	bh=7K+90HQ+vxFbJbuxcZk+ZoC6fFFrhxfTA/u8scc+3vs=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=b+BqAxthnIEh+5U1tMlNJXld4EQVZRBabLL1iDVWzPy0b2v66gjnagLLUrg3wxJIIAFWlPdIx5HCrjlnFFvGTiHynFPwxoTAdEsMbD6i8BkuQmNtjaU2llRNkrGTzVaZAUp29foJqpb/kGZc5xFd6t4749jH1/TIOlrfzEDCUAU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ZyUqxvin; arc=none smtp.client-ip=209.85.215.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ZyUqxvin"
Received: by mail-pg1-f178.google.com with SMTP id 41be03b00d2f7-ca97d139d5fso1191243a12.0
        for <linux-hwmon@vger.kernel.org>; Wed, 02 Sep 2026 08:26:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788362766; x=1788967566; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=kMwOx2sYizTmW1diH6nl/zWvZ0A6l4Kku/Ao1BFigLA=;
        b=ZyUqxvinFEqPpNrCnoel4uWnkS/z80JVhLpGt13GVPViRL8lOrS/R3VFRiPEmL+SS9
         RC2I3bNyPtY/WPxPFiREqbZRfTvSH2qUaRsAThZWRAaY8FrHugu25zHETTifRsvy+Ngq
         G/jNo/iUy1xSUXGwXAxESa8biWhv7Xxuvq1WNww7mo46RzjSMpPlD2EsD7KM/oonD2zH
         pJh8azbvUlVtr/z3R68P8yftrj9EDSCRkDlQAB7CxgO+11Q+gyyIPGgxQZq5HuOw9KZd
         U48F2/nigRl/Z1WfUJMPiGv29uTO5aXqjSCZDE/ayscEZrNI7TXOyQ/D/+zGTc9Onhxq
         aXcw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788362766; x=1788967566;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=kMwOx2sYizTmW1diH6nl/zWvZ0A6l4Kku/Ao1BFigLA=;
        b=FrneV/tU6WYzx1Im2uVWeejqiiR65JMg5T+pFXZjYSey0jl7sjK1C/Dc4y+ixv5GHq
         DmygxwR1q4D9iOa9drs50ogjEhH1hiZLLe2dMcR71UQTOTB7jeW1jvmwG1ZHH/JX+hlI
         5PFhJHm5jySZfhaZuVkQryZwsOsFcShzQEYtJohbGyqtimY1jFNRUKycv+kzoQG1Z0Ko
         MQQo6JlfBLefwa0ylsYKJnY+e3urO3qiVKkumnJP48KSu3hvLdhmwHf4V4ZKOnRFtTSO
         rmTYiaR42ApD3qmku2EgFIxS7BwD7S50F0tN+hvtVM0wphwGNgrMhrxajg5ShBjFSKrs
         NpmQ==
X-Gm-Message-State: AFuF++mn8B/sv2NjefZPXym84xsLwI2Y5IX5Bk3vL3gIPJ6+moiwgxMU
	YndVxCvJD7Qb6XV+TP8HrzSUkvXF+1Y4mHpPE0V77ygXElNQn9ePhmRE
X-Gm-Gg: AR+sD11keC2l+5NROKQ9oBIoF5iMIMBECX9i+UKisSB3dn3rzAA+EuFkg/LwUvryG5B
	8bbA8DuVqCl2CYQYL9qq8IUE8mQgk8oc9jlGaN7sEn2DDS6BGc99/YYTAVdWevLcRYywcjAJHXt
	kK6rGjXzawEjjq18QVXN0APlVPGimFi6kulcn8sTAFgo80miMADthwklMLvnxkf7urLCR+UZiZ4
	VPS3bvJDQ0rVEZt4tVNbw74Vujpp5EIlS8NYSwprnGCfhayuYUAgT/OheR2hgJube2XvH/HMnwX
	606hJFI3jXlb6wMuOWFDrisUVmUbk510oxcaa17a9c4B6/1RkCxmtJbfS6iug5eYYWXOSp8FQeX
	dy2pn2uQC8BhZu1fzLPK9UdmU4xHlZPFilsWoR+iTN06hL8GLd070gjT1BJgRXU+pWVBy6n241R
	yabPQqgm7qT3ZB+GpEnBJc2fGZCVU45dmNzGttkIM2kfZwa/s7WrkdhQ+MclaXpc9kCzUC/cYwM
	s3pSqTlGRK2Sx+4dHmOF5R0Zo5BvEurkBmgfD+7bUGh7yDvNgzlF5EWwtgC5pDOiOw=
X-Received: by 2002:a05:6a20:2d22:b0:3d3:aec2:4dcb with SMTP id adf61e73a8af0-3d9b051aa7dmr9753941637.23.1788362766308;
        Wed, 02 Sep 2026 08:26:06 -0700 (PDT)
Received: from [10.198.0.120] (wnpgmb02ydw-ds01-112-62-45.dynamic.bellmts.net. [204.112.62.45])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-cc34cedfe69sm1359342a12.13.2026.09.02.08.26.05
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 02 Sep 2026 08:26:05 -0700 (PDT)
Message-ID: <2df09073-2d9f-4b6f-892b-45e7287a85c9@gmail.com>
Date: Wed, 2 Sep 2026 10:26:03 -0500
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
Content-Language: en-US
From: Matthew Bettencourt <matthew.bettencourt@gmail.com>
In-Reply-To: <0de99cfa-7de4-4236-930c-2c037aa1648e@roeck-us.net>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

Hello Guenter,

Here is the i2cdump for those two 0x71 and 0x73 devices

# i2cdump -y -f 12 0x73 b
      0  1  2  3  4  5  6  7  8  9  a  b  c  d  e  f    0123456789abcdef
00: ff ff ff ff XX ff 12 ff 12 ff ff ff XX XX XX XX    ....X.?.?...XXXX
10: XX 0f XX XX XX XX XX XX XX XX XX XX XX XX XX XX    X?XXXXXXXXXXXXXX
20: XX XX XX XX XX XX XX XX XX XX XX XX XX XX XX XX    XXXXXXXXXXXXXXXX
30: XX XX XX XX XX XX XX XX XX XX XX XX XX XX XX XX    XXXXXXXXXXXXXXXX
40: XX XX XX XX XX XX XX XX XX XX XX XX XX XX XX XX    XXXXXXXXXXXXXXXX
50: XX XX XX XX XX XX XX XX XX XX XX XX XX XX XX XX    XXXXXXXXXXXXXXXX
60: XX XX XX XX XX XX XX XX XX XX XX XX XX XX XX XX    XXXXXXXXXXXXXXXX
70: XX XX XX XX XX XX XX XX XX XX XX XX XX XX XX XX    XXXXXXXXXXXXXXXX
80: 00 e1 f9 03 04 05 06 07 08 09 0a 0b 0c 0d 0e 0f    .???????????????
90: 10 11 12 13 14 15 16 17 18 19 1a 1b 1c 1d 1e 1f    ????????????????
a0: 00 01 02 03 04 05 06 07 08 09 0a 0b 0c 0d 0e 0f    .???????????????
b0: 10 11 12 13 14 15 16 17 18 19 1a 1b 1c 1d 1e 1f    ????????????????
c0: 00 01 02 03 04 05 06 07 08 09 0a 0b 0c 0d 0e 0f    .???????????????
d0: 10 11 12 13 14 15 16 17 18 19 1a 1b 1c 1d 1e 1f    ????????????????
e0: 00 01 02 03 04 05 06 07 08 09 0a 0b 0c 0d 0e 0f    .???????????????
f0: 10 11 12 13 14 15 16 17 18 19 1a 1b 1c 1d 1e 1f    ????????????????
# i2cdump -y -f 12 0x71 b
      0  1  2  3  4  5  6  7  8  9  a  b  c  d  e  f    0123456789abcdef
00: ff ff ff ff XX ff 57 ff 57 ff ff ff XX XX XX XX    ....X.W.W...XXXX
10: XX 0f XX XX XX XX XX XX XX XX XX XX XX XX XX XX    X?XXXXXXXXXXXXXX
20: XX XX XX XX XX XX XX XX XX XX XX XX XX XX XX XX    XXXXXXXXXXXXXXXX
30: XX XX XX XX XX XX XX XX XX XX XX XX XX XX XX XX    XXXXXXXXXXXXXXXX
40: XX XX XX XX XX XX XX XX XX XX XX XX XX XX XX XX    XXXXXXXXXXXXXXXX
50: XX XX XX XX XX XX XX XX XX XX XX XX XX XX XX XX    XXXXXXXXXXXXXXXX
60: XX XX XX XX XX XX XX XX XX XX XX XX XX XX XX XX    XXXXXXXXXXXXXXXX
70: XX XX XX XX XX XX XX XX XX XX XX XX XX XX XX XX    XXXXXXXXXXXXXXXX
80: 00 0b e0 03 04 05 06 07 08 09 0a 0b 0c 0d 0e 0f    .???????????????
90: 10 11 12 13 14 15 16 17 18 19 1a 1b 1c 1d 1e 1f    ????????????????
a0: 00 01 02 03 04 05 06 07 08 09 0a 0b 0c 0d 0e 0f    .???????????????
b0: 10 11 12 13 14 15 16 17 18 19 1a 1b 1c 1d 1e 1f    ????????????????
c0: 00 01 02 03 04 05 06 07 08 09 0a 0b 0c 0d 0e 0f    .???????????????
d0: 10 11 12 13 14 15 16 17 18 19 1a 1b 1c 1d 1e 1f    ????????????????
e0: 00 01 02 03 04 05 06 07 08 09 0a 0b 0c 0d 0e 0f    .???????????????
f0: 10 11 12 13 14 15 16 17 18 19 1a 1b 1c 1d 1e 1f    ????????????????

# ls -l /sys/bus/i2c/devices/
total 0
lrwxrwxrwx. 1 root root 0 Sep  2 10:08 12-0051 -> 
../../../devices/pci0000:00/0000:00:14.0/i2c-12/12-0051
lrwxrwxrwx. 1 root root 0 Sep  2 10:08 12-0053 -> 
../../../devices/pci0000:00/0000:00:14.0/i2c-12/12-0053
lrwxrwxrwx. 1 root root 0 Sep  2 10:08 i2c-0 -> 
../../../devices/platform/AMDI0010:00/i2c-0
lrwxrwxrwx. 1 root root 0 Sep  2 10:08 i2c-1 -> 
../../../devices/platform/AMDI0010:01/i2c-1
lrwxrwxrwx. 1 root root 0 Sep  2 10:08 i2c-10 -> 
../../../devices/pci0000:00/0000:00:01.1/0000:01:00.0/0000:02:00.0/0000:03:00.0/drm/card1/card1-DP-2/i2c-10
lrwxrwxrwx. 1 root root 0 Sep  2 10:08 i2c-11 -> 
../../../devices/pci0000:00/0000:00:01.1/0000:01:00.0/0000:02:00.0/0000:03:00.0/drm/card1/card1-DP-3/i2c-11
lrwxrwxrwx. 1 root root 0 Sep  2 10:08 i2c-12 -> 
../../../devices/pci0000:00/0000:00:14.0/i2c-12
lrwxrwxrwx. 1 root root 0 Sep  2 10:08 i2c-13 -> 
../../../devices/pci0000:00/0000:00:14.0/i2c-13
lrwxrwxrwx. 1 root root 0 Sep  2 10:08 i2c-14 -> 
../../../devices/pci0000:00/0000:00:14.0/i2c-14
lrwxrwxrwx. 1 root root 0 Sep  2 10:08 i2c-2 -> 
../../../devices/pci0000:00/0000:00:01.1/0000:01:00.0/0000:02:00.0/0000:03:00.0/i2c-2
lrwxrwxrwx. 1 root root 0 Sep  2 10:08 i2c-3 -> 
../../../devices/pci0000:00/0000:00:01.1/0000:01:00.0/0000:02:00.0/0000:03:00.0/i2c-3
lrwxrwxrwx. 1 root root 0 Sep  2 10:08 i2c-4 -> 
../../../devices/pci0000:00/0000:00:01.1/0000:01:00.0/0000:02:00.0/0000:03:00.0/i2c-4
lrwxrwxrwx. 1 root root 0 Sep  2 10:08 i2c-5 -> 
../../../devices/pci0000:00/0000:00:01.1/0000:01:00.0/0000:02:00.0/0000:03:00.0/i2c-5
lrwxrwxrwx. 1 root root 0 Sep  2 10:08 i2c-6 -> 
../../../devices/pci0000:00/0000:00:01.1/0000:01:00.0/0000:02:00.0/0000:03:00.0/i2c-6
lrwxrwxrwx. 1 root root 0 Sep  2 10:08 i2c-7 -> 
../../../devices/pci0000:00/0000:00:01.1/0000:01:00.0/0000:02:00.0/0000:03:00.0/i2c-7
lrwxrwxrwx. 1 root root 0 Sep  2 10:08 i2c-8 -> 
../../../devices/pci0000:00/0000:00:01.1/0000:01:00.0/0000:02:00.0/0000:03:00.0/i2c-8
lrwxrwxrwx. 1 root root 0 Sep  2 10:08 i2c-9 -> 
../../../devices/pci0000:00/0000:00:01.1/0000:01:00.0/0000:02:00.0/0000:03:00.0/drm/card1/card1-DP-1/i2c-9
lrwxrwxrwx. 1 root root 0 Sep  2 10:08 i2c-MSFT8000:00 -> 
../../../devices/platform/AMDI0010:01/i2c-1/i2c-MSFT8000:00


If it is worth while I have access to second AMD machine, PRO B850M-A 
WIFI/7600x3d/Teamgroup 2x16GB - FLBD532G6000HC30DC01, which I can swap 
parts from/to. Even though its a completely different system it might 
worth it to swap parts out and see then what comes up on either system 
to help identify what might be going on with the i2c bus devices.

Thanks,
Matthew
On 9/2/26 9:52 AM, Guenter Roeck wrote:
> Hi Matthew,
> 
> On 9/2/26 07:00, Matthew Bettencourt wrote:
>> Hello Guenter,
>>
>>  > It would be something like
>>  >
>>  > sudo acpidump > acpi.log
>>  > acpixtract acpi.log
>>  > iasl -d *.dat
>>  >
>>  > You'll get a number of.dsl files with cryptic assembler-style
>>  > code and data. Then the digging starts ... you may find something
>>  > like "Name (SMB0, 0x0B00)" in dsdt.dsl. Then we can only hope to
>>  > figure out if ACPI actually accesses it.
>>
>> That wasn't as hard as I thought. I got everything decoding I guess, I 
>> just did a grep on all the dsl files for SMB.
>>
>> $ grep -i -rn "SMB" *.dsl
> 
> That matches almost exactly the dsdt files on my main system (MSI MAG B650M
> MORTAR WIFI with 9900X). Either I have the same problem (I don't usually
> suspend) or we'll have to find something else to blame. I do see different
> devices on the same bus, though.
> 
>       0  1  2  3  4  5  6  7  8  9  a  b  c  d  e  f
> 00:                         -- -- -- -- -- -- -- --
> 10: -- -- -- -- -- 15 -- -- -- -- -- -- -- -- -- --
> 20: -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- --
> 30: -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- --
> 40: -- -- -- -- -- -- -- -- 48 49 4a 4b -- -- -- 4f
> 50: UU UU UU UU -- -- -- -- -- -- -- -- -- -- -- --
> 60: -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- --
> 70: -- -- -- -- -- -- -- --
> 
> [spd5118 is loaded, which explains the UU, and the system has
> 4 DIMMs]
> 
> Compared to yours:
> 
>       0  1  2  3  4  5  6  7  8  9  a  b  c  d  e  f
> 00:                         -- -- -- -- -- -- -- --
> 10: -- -- -- -- -- 15 -- -- -- -- -- -- -- -- -- --
> 20: -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- --
> 30: -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- --
> 40: -- -- -- -- -- -- -- -- -- 49 -- 4b -- -- -- --
> 50: -- 51 -- 53 -- -- -- -- -- -- -- -- -- -- -- --
> 60: -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- --
> 70: -- 71 -- 73 -- -- --
> 
> That does make me wonder what you have on 0x71 and 0x73,
> because those are often I2C bus multiplexers. That could mess
> up everything if some entity selects a different bus.
> 
> Guenter
> 

