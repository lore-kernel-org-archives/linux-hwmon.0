Received: from mail-pj1-f54.google.com (mail-pj1-f54.google.com [209.85.216.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E114D4AA57B
	for <linux-hwmon@vger.kernel.org>; Wed,  2 Sep 2026 17:21:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788369713; cv=none; b=C5HELz9xDYAZg8cbjmu45GUKaT2mcciUKX/tL9dBbmj0EfUs09qBrHRntDF9dPbgEr92p5p00luXUuP++q+hGQhSKhIwVgTBbdVF7D7TzwMp7JoL51wOET3WN/JNlebVbXmlCkLRemfLEwo48UlsOpNDb8iCw3L4oo8AEhKo65Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788369713; c=relaxed/simple;
	bh=Cbwzu8rXIJUiVu9+IeUdlVICi7IaF8Z8Kk9VmHQP3L0=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=frKCdCkb795ScBKw2AYMHqIjeDt9PG2WFkcVKuHYQoYcBHzQrlO6BYN1a7JOledlhYKEeNs9qjU5q++/ejyC+gbOf6tw4KV9RpKZYOVxmSVLkmmc/pp+zSaCYCsIpueKbxcSwzqN6FFYdmd0oCd1ULU5he5nG+8vRiCSFQrjxr0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=NW3kgX1p; arc=none smtp.client-ip=209.85.216.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="NW3kgX1p"
Received: by mail-pj1-f54.google.com with SMTP id 98e67ed59e1d1-398a4dcf289so1560935a91.2
        for <linux-hwmon@vger.kernel.org>; Wed, 02 Sep 2026 10:21:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788369711; x=1788974511; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:sender:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Epr4vvqjxUGUVPjJ1am+KeorzVpdgtbuB59p1B9RHNU=;
        b=NW3kgX1pgEi8uoWEqgGuGpandlQAoWhBN2kiLYTJn4vqnon210DiOhiamfTNJvheTO
         NG3WLwr9hgEV5f6NmXV47LuAQVhlLeWFn7FO+9JkAi6hCpaxefYY+JMc3kqP71unAwEE
         OOGm4ghJ2e+LnzGVhaQDzD+hF+05H8xmhQc4ziKMcMdYEN0VZhzLV/LcNAX7THLy55o5
         TsoJe90orbPNGieN2xUHH3TwSLnqF7mhzzNfhyzbi0vS6Z/GTBeF5XrDQIb1xrKNnQOP
         0rOKEVISeZ4xnyp+5k0KCyiyzMs0RYXDeMF4qmvvoPKbgOxVcnjya3dAiMmsG0cbi8m5
         r4xQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788369711; x=1788974511;
        h=content-transfer-encoding:content-type:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:sender:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=Epr4vvqjxUGUVPjJ1am+KeorzVpdgtbuB59p1B9RHNU=;
        b=USVdSDbBVaDdjpb1ay15NgbejCRDzngqheI6CQVLomH0YpO2FSr8+d1Os486PgoNDr
         WM9Nnx9BMdFjSlNb7docuj1oSZjmKSuMTTiW7+DnNbZYY0mY2DukN/E0wQO8mfyYQFQB
         8G3Q72QF/jStU1iDeOAJwCpfeQUU0556z2W8kbw3ytuMxthKldxD1IZ03nhyPbNidAVb
         RGaN8Y82f1juPwZVZo4ttsc/rOiIlCHke963ErCh31doV0OBrsT1mZpAPK96ddmP/wao
         OQN4UeyPzKXkhzVEwVNfYZS3TS3fKDh3U+tY5oaTPa5kUvOkXOgV0WPBAnAJ8e4AYu9Z
         oo2Q==
X-Gm-Message-State: AFuF++k2z1VZJlH21HF1uGah4Knwsvp+q8XH3o0nIODs8uWc0MG4HJ3c
	NmfpayXllVqFMdzhZpLaoYe0nf6rmBPl1bOyz2H4ZbzWsAORIoI+6qcy
X-Gm-Gg: AYBFou0O/FkOAwU3xXVA1+AFvcxjKJq57XDZPGXab56gEnCnvr8NkWwWHxtDm+4yX8/
	1OIqArlp7ciVe2PgS90yR8F9i3sQKY8zdXdbb2oMmoerAMCod+RH+3k/VqSWGIuHiwvuAEsEPpV
	uahM+uSnRDoF8aMujvLulgeVit130sh9/zhJlL7qhrKvqApIJ1N7e4jp1rGulDQxRtIji4SxAm5
	o8MXM2k7S9SOKZDHcFil+wCUvF1CdfodiXBJ4+z86rccIF6+Ai1di5kDV7gLOKE2aSaA5GexMZg
	sKtOgOBD03w4prfHwnQ1iEPDZXlvVTfoaq0qDS2DAqecNzr/aepJJkOZJ9JwVkCHba4B8k6wGoS
	4PDpaWMd+x47ZyY3I5gF4m0zwPQojaklUEL/bgJta09fjnGybbSwtr0qpzrCN7Oed+Bqx+EByE9
	1WFjiW9rni3/5sy/LIhURdTAPHaQkeC1dyGemoY7SOgHiGfeUqsFGPzSHPHdsWs0u/edAlgsXw9
	AssHlc75NnzAY5oow9cAk580eHlpH4Azl0uMA==
X-Received: by 2002:a17:90a:e7c9:b0:395:4290:46e0 with SMTP id 98e67ed59e1d1-39aedf5da48mr8846328a91.5.1788369710824;
        Wed, 02 Sep 2026 10:21:50 -0700 (PDT)
Received: from ?IPV6:2600:1700:e321:62f0:da43:aeff:fecc:bfd5? ([2600:1700:e321:62f0:da43:aeff:fecc:bfd5])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-39b0861e54csm392768a91.10.2026.09.02.10.21.49
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 02 Sep 2026 10:21:50 -0700 (PDT)
Sender: Guenter Roeck <groeck7@gmail.com>
Message-ID: <56826d45-e18a-4f9e-94b0-3e6f335c4ee7@roeck-us.net>
Date: Wed, 2 Sep 2026 10:21:49 -0700
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
Content-Language: en-US
From: Guenter Roeck <linux@roeck-us.net>
Autocrypt: addr=linux@roeck-us.net; keydata=
 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
 np3900V20aS7eD9K8GTU0TGC1pyz6IVJwIE=
In-Reply-To: <2df09073-2d9f-4b6f-892b-45e7287a85c9@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

Hi Matthew,

On 9/2/26 08:26, Matthew Bettencourt wrote:
> Hello Guenter,
> 
> Here is the i2cdump for those two 0x71 and 0x73 devices
> 
> # i2cdump -y -f 12 0x73 b
>       0  1  2  3  4  5  6  7  8  9  a  b  c  d  e  f    0123456789abcdef
> 00: ff ff ff ff XX ff 12 ff 12 ff ff ff XX XX XX XX    ....X.?.?...XXXX
> 10: XX 0f XX XX XX XX XX XX XX XX XX XX XX XX XX XX    X?XXXXXXXXXXXXXX
> 20: XX XX XX XX XX XX XX XX XX XX XX XX XX XX XX XX    XXXXXXXXXXXXXXXX
> 30: XX XX XX XX XX XX XX XX XX XX XX XX XX XX XX XX    XXXXXXXXXXXXXXXX
> 40: XX XX XX XX XX XX XX XX XX XX XX XX XX XX XX XX    XXXXXXXXXXXXXXXX
> 50: XX XX XX XX XX XX XX XX XX XX XX XX XX XX XX XX    XXXXXXXXXXXXXXXX
> 60: XX XX XX XX XX XX XX XX XX XX XX XX XX XX XX XX    XXXXXXXXXXXXXXXX
> 70: XX XX XX XX XX XX XX XX XX XX XX XX XX XX XX XX    XXXXXXXXXXXXXXXX
> 80: 00 e1 f9 03 04 05 06 07 08 09 0a 0b 0c 0d 0e 0f    .???????????????
> 90: 10 11 12 13 14 15 16 17 18 19 1a 1b 1c 1d 1e 1f    ????????????????
> a0: 00 01 02 03 04 05 06 07 08 09 0a 0b 0c 0d 0e 0f    .???????????????
> b0: 10 11 12 13 14 15 16 17 18 19 1a 1b 1c 1d 1e 1f    ????????????????
> c0: 00 01 02 03 04 05 06 07 08 09 0a 0b 0c 0d 0e 0f    .???????????????
> d0: 10 11 12 13 14 15 16 17 18 19 1a 1b 1c 1d 1e 1f    ????????????????
> e0: 00 01 02 03 04 05 06 07 08 09 0a 0b 0c 0d 0e 0f    .???????????????
> f0: 10 11 12 13 14 15 16 17 18 19 1a 1b 1c 1d 1e 1f    ????????????????
> # i2cdump -y -f 12 0x71 b
>       0  1  2  3  4  5  6  7  8  9  a  b  c  d  e  f    0123456789abcdef
> 00: ff ff ff ff XX ff 57 ff 57 ff ff ff XX XX XX XX    ....X.W.W...XXXX
> 10: XX 0f XX XX XX XX XX XX XX XX XX XX XX XX XX XX    X?XXXXXXXXXXXXXX
> 20: XX XX XX XX XX XX XX XX XX XX XX XX XX XX XX XX    XXXXXXXXXXXXXXXX
> 30: XX XX XX XX XX XX XX XX XX XX XX XX XX XX XX XX    XXXXXXXXXXXXXXXX
> 40: XX XX XX XX XX XX XX XX XX XX XX XX XX XX XX XX    XXXXXXXXXXXXXXXX
> 50: XX XX XX XX XX XX XX XX XX XX XX XX XX XX XX XX    XXXXXXXXXXXXXXXX
> 60: XX XX XX XX XX XX XX XX XX XX XX XX XX XX XX XX    XXXXXXXXXXXXXXXX
> 70: XX XX XX XX XX XX XX XX XX XX XX XX XX XX XX XX    XXXXXXXXXXXXXXXX
> 80: 00 0b e0 03 04 05 06 07 08 09 0a 0b 0c 0d 0e 0f    .???????????????
> 90: 10 11 12 13 14 15 16 17 18 19 1a 1b 1c 1d 1e 1f    ????????????????
> a0: 00 01 02 03 04 05 06 07 08 09 0a 0b 0c 0d 0e 0f    .???????????????
> b0: 10 11 12 13 14 15 16 17 18 19 1a 1b 1c 1d 1e 1f    ????????????????
> c0: 00 01 02 03 04 05 06 07 08 09 0a 0b 0c 0d 0e 0f    .???????????????
> d0: 10 11 12 13 14 15 16 17 18 19 1a 1b 1c 1d 1e 1f    ????????????????
> e0: 00 01 02 03 04 05 06 07 08 09 0a 0b 0c 0d 0e 0f    .???????????????
> f0: 10 11 12 13 14 15 16 17 18 19 1a 1b 1c 1d 1e 1f    ????????????????
> 

I2C bus multiplexers only return a single data byte reflecting the currently
selected bus. On writes they also accept a single byte, where a set bit indicates
which of its channel(s) should be enabled. So i2cdump does not really work.
Actually, using i2cdump might have messed it up because the writes involved
might change the active bus... sorry, I should have mentioned before.
In general it is not safe to use i2cdump on an unknown device. Worst case
it can turn the hardware into a brick (seriously - I have seen that happen).

You could try "i2cget 12 0x71" and "i2cget 12 0x73". That should return
the active channel(s) if those are really I2C bus multiplexers. If they are,
only a single bit should be set (again, i2cdump might have messed it up,
so you might want to reboot).

> # ls -l /sys/bus/i2c/devices/
> total 0
> lrwxrwxrwx. 1 root root 0 Sep  2 10:08 12-0051 -> ../../../devices/pci0000:00/0000:00:14.0/i2c-12/12-0051
> lrwxrwxrwx. 1 root root 0 Sep  2 10:08 12-0053 -> ../../../devices/pci0000:00/0000:00:14.0/i2c-12/12-0053
> lrwxrwxrwx. 1 root root 0 Sep  2 10:08 i2c-0 -> ../../../devices/platform/AMDI0010:00/i2c-0
> lrwxrwxrwx. 1 root root 0 Sep  2 10:08 i2c-1 -> ../../../devices/platform/AMDI0010:01/i2c-1
> lrwxrwxrwx. 1 root root 0 Sep  2 10:08 i2c-10 -> ../../../devices/pci0000:00/0000:00:01.1/0000:01:00.0/0000:02:00.0/0000:03:00.0/drm/card1/card1-DP-2/i2c-10
> lrwxrwxrwx. 1 root root 0 Sep  2 10:08 i2c-11 -> ../../../devices/pci0000:00/0000:00:01.1/0000:01:00.0/0000:02:00.0/0000:03:00.0/drm/card1/card1-DP-3/i2c-11
> lrwxrwxrwx. 1 root root 0 Sep  2 10:08 i2c-12 -> ../../../devices/pci0000:00/0000:00:14.0/i2c-12
> lrwxrwxrwx. 1 root root 0 Sep  2 10:08 i2c-13 -> ../../../devices/pci0000:00/0000:00:14.0/i2c-13
> lrwxrwxrwx. 1 root root 0 Sep  2 10:08 i2c-14 -> ../../../devices/pci0000:00/0000:00:14.0/i2c-14
> lrwxrwxrwx. 1 root root 0 Sep  2 10:08 i2c-2 -> ../../../devices/pci0000:00/0000:00:01.1/0000:01:00.0/0000:02:00.0/0000:03:00.0/i2c-2
> lrwxrwxrwx. 1 root root 0 Sep  2 10:08 i2c-3 -> ../../../devices/pci0000:00/0000:00:01.1/0000:01:00.0/0000:02:00.0/0000:03:00.0/i2c-3
> lrwxrwxrwx. 1 root root 0 Sep  2 10:08 i2c-4 -> ../../../devices/pci0000:00/0000:00:01.1/0000:01:00.0/0000:02:00.0/0000:03:00.0/i2c-4
> lrwxrwxrwx. 1 root root 0 Sep  2 10:08 i2c-5 -> ../../../devices/pci0000:00/0000:00:01.1/0000:01:00.0/0000:02:00.0/0000:03:00.0/i2c-5
> lrwxrwxrwx. 1 root root 0 Sep  2 10:08 i2c-6 -> ../../../devices/pci0000:00/0000:00:01.1/0000:01:00.0/0000:02:00.0/0000:03:00.0/i2c-6
> lrwxrwxrwx. 1 root root 0 Sep  2 10:08 i2c-7 -> ../../../devices/pci0000:00/0000:00:01.1/0000:01:00.0/0000:02:00.0/0000:03:00.0/i2c-7
> lrwxrwxrwx. 1 root root 0 Sep  2 10:08 i2c-8 -> ../../../devices/pci0000:00/0000:00:01.1/0000:01:00.0/0000:02:00.0/0000:03:00.0/i2c-8
> lrwxrwxrwx. 1 root root 0 Sep  2 10:08 i2c-9 -> ../../../devices/pci0000:00/0000:00:01.1/0000:01:00.0/0000:02:00.0/0000:03:00.0/drm/card1/card1-DP-1/i2c-9
> lrwxrwxrwx. 1 root root 0 Sep  2 10:08 i2c-MSFT8000:00 -> ../../../devices/platform/AMDI0010:01/i2c-1/i2c-MSFT8000:00
> 
> 
> If it is worth while I have access to second AMD machine, PRO B850M-A WIFI/7600x3d/Teamgroup 2x16GB - FLBD532G6000HC30DC01, which I can swap parts from/to. Even though its a completely different system it might worth it to swap parts out and see then what comes up on either system to help identify what might be going on with the i2c bus devices.
> 

It might be worthwhile if that system does not suffer from the same problem.

Bus-wise I can see that you seem to have different I2C busses in your system. I have

lrwxrwxrwx 1 root root 0 Aug 29 16:26 0-0050 -> ../../../devices/pci0000:00/0000:00:14.0/i2c-0/0-0050
lrwxrwxrwx 1 root root 0 Aug 29 16:26 0-0051 -> ../../../devices/pci0000:00/0000:00:14.0/i2c-0/0-0051
lrwxrwxrwx 1 root root 0 Aug 29 16:26 0-0052 -> ../../../devices/pci0000:00/0000:00:14.0/i2c-0/0-0052
lrwxrwxrwx 1 root root 0 Aug 29 16:26 0-0053 -> ../../../devices/pci0000:00/0000:00:14.0/i2c-0/0-0053
lrwxrwxrwx 1 root root 0 Aug 29 16:26 i2c-0 -> ../../../devices/pci0000:00/0000:00:14.0/i2c-0
lrwxrwxrwx 1 root root 0 Aug 29 16:26 i2c-1 -> ../../../devices/pci0000:00/0000:00:14.0/i2c-1
lrwxrwxrwx 1 root root 0 Aug 29 16:26 i2c-2 -> ../../../devices/pci0000:00/0000:00:14.0/i2c-2
lrwxrwxrwx 1 root root 0 Aug 29 16:26 i2c-3 -> ../../../devices/pci0000:00/0000:00:01.1/0000:01:00.0/0000:02:00.0/0000:03:00.0/i2c-3
lrwxrwxrwx 1 root root 0 Aug 29 16:26 i2c-4 -> ../../../devices/pci0000:00/0000:00:01.1/0000:01:00.0/0000:02:00.0/0000:03:00.0/i2c-4
lrwxrwxrwx 1 root root 0 Aug 29 16:26 i2c-5 -> ../../../devices/pci0000:00/0000:00:01.1/0000:01:00.0/0000:02:00.0/0000:03:00.0/i2c-5
lrwxrwxrwx 1 root root 0 Aug 29 16:26 i2c-6 -> ../../../devices/pci0000:00/0000:00:01.1/0000:01:00.0/0000:02:00.0/0000:03:00.0/i2c-6
lrwxrwxrwx 1 root root 0 Aug 29 16:26 i2c-7 -> ../../../devices/pci0000:00/0000:00:01.1/0000:01:00.0/0000:02:00.0/0000:03:00.0/drm/card1/card1-DP-1/i2c-7

so I don't have any of the AMDI0010 devices. Maybe that is the built-in GPU ?

Thanks,
Guenter

