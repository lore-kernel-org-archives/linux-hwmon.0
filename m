Received: from mail-pf1-f171.google.com (mail-pf1-f171.google.com [209.85.210.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0667F2F5324
	for <linux-hwmon@vger.kernel.org>; Wed,  2 Sep 2026 00:57:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788310626; cv=none; b=VlW0gLKy2YqJsYvxLRjodPvKdbGRJAenWfhOJhRaPaLnTEcsLfQP8XFkZl6XwD+g3kNA/91EdjXcx5lSZXIX6Syy5I5d1ZBdr76nPy+mtRa39Ovy52T7pSEJpaYQhX8sD2zfGvytCrVN+m5RrvnjBgPwILVyvUALBcrhc+uhFhA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788310626; c=relaxed/simple;
	bh=vug2wvYMLEiXrvaMjCWF7jug1u4iI0rxQLxhiBCvmI4=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Bmj8gvlYzDSvK0v45trJkpr2DTFRKcfoOCv0GEEUSB/WmFETibZhPxBPW50nX+xWyBR/B7e8BdrwXJKpPsH/Kj3dbIfVsM8x21cukWP/cRsUWca/7VjN/p68qatv4pHf3aDU5kece+jq9iqe/snypMxn7/fW7I2ZdR6+uUhwgG4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=s/npIOG9; arc=none smtp.client-ip=209.85.210.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="s/npIOG9"
Received: by mail-pf1-f171.google.com with SMTP id d2e1a72fcca58-84f3ab8750cso392046b3a.0
        for <linux-hwmon@vger.kernel.org>; Tue, 01 Sep 2026 17:57:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788310624; x=1788915424; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=CV+T/YNqpLRG7Sw9Xa1thGzbEcMq47zLom+Xo3maG70=;
        b=s/npIOG9uSRlOF4uEGZ/M7MAEGv6Nb2xcutEJ1RBiKKnXaaHTu74a9OBPUMGMouYDF
         OsAMnLCBsKheIWGBsVehwVEqyUs+xDp+QfSUq3hYz2gEhBIQa0FCtjPpz9OqKMDZWqv1
         VGEWKcuYbT8ONrKO9ZLBLxxH0R91WtIsn1JnWI01RtWwX17xu5sjz3EayawL3il03XT9
         UFUNWYZcBhboRkxkxQ1NUWLKPAJiP2qOmFPcBmrcg2TNZvelsGnVEcdoByqA1yzgpBx4
         vI/gNcPVjlTsxnPj7iiAokbHY2Ca3hVfPxuFP8Ab8PWnFJkR/Z0ddfMCSuDOy/2UxRRh
         51kQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788310624; x=1788915424;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=CV+T/YNqpLRG7Sw9Xa1thGzbEcMq47zLom+Xo3maG70=;
        b=miry6c+xRFR6fv7WDKxLjxRny1dWoRpxo3NXx3Z68e1OAI4hpT+XT93/Bd4G9sX6aJ
         918Jbunlzkc8GXos9tcpVNKJ+Rp+0PqB7++AWYxv6ye5CedEbrv7VXcUkArqBZ7yL3hk
         mg31l9MCMqv1BDdbVPqni/9uP/HZdUYoEwBYgiZUF94iYTboOv7o8j7Rzw0AegxUTfyz
         rn217PqDLT5lCiQisWhis9EbwZKzBfwQHi7yP1P80jTD6Hsq8vRZW9HuTQOgHUGYf5Yc
         Zgoqj/SPooXH+GAVnc+qB2P4tHYUG2tLovEQgNARjfrT0ZWzW/JMgebhgzt165mOkHOr
         n1JA==
X-Gm-Message-State: AFuF++k9sQ0ufXlanPYvnMeUQJuU/WUeYltGLYwV0Bz3ViRbg/TO/KDC
	q7UzaknlBYiaZy+/g80pCl6vviMZiYlXvvZybO05ROlycyoMnLXBMdHA
X-Gm-Gg: AYBFou1KWyDRm6niLLMGUzYJJfNuDPe+otswSb9V2fw2XB75G5Mc6A+CpSswOMME68w
	bnZIiQx8PsP+lMuS9eE7HU4iwUESLwXDOwoQZP0xZ92rq6usNVHeH+5eiib7MTD1fRFUOVnWIzA
	wFfSPa3dYJWbBqV0Si7RuLZPXOv6j9c9lk8dnJM2KYd3yE1A3zSHmyyK/g1pwmHBs1h7KdF/ycQ
	cAoe/IeoyRn30QEHJ6ZK2J6GRVRy75LsPMdzd5WtMdY7uOL9MeghSmBDJ2/0Cgf1nBc2e1Ceo21
	UUWOvAe/d9KfGzq+dUGlcZl2Zcm7efhU1oPs2wd/EvuVifdWTg92RK330kIL/SfwN8gp6K4d2zQ
	uu7pD+7Ip0mymj+zs8iz0glUFFAdnMiWf7JILqS1bI+MgQ3GXbPJXNxjt5dpSkhnJwF9yCxSCWe
	1PCANU5nUYdlPHNVhhcoPo0QgLXBeOsyd1S6JQNzuwVDbr7PduZuRvZZ/fweF0klt2djHPaXi/p
	0DF+lLIwtHx9lQAPrymb17f5JtT/EoGCK87oR7c+0Y8rF3LB8xk+6fZ9Pm3
X-Received: by 2002:a05:6a00:1801:b0:857:7658:b407 with SMTP id d2e1a72fcca58-85ed520fadfmr2349235b3a.26.1788310624126;
        Tue, 01 Sep 2026 17:57:04 -0700 (PDT)
Received: from [10.21.0.95] (wnpgmb0592w-ds02-161-177-131.dynamic.bellmts.net. [207.161.177.131])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-85db2ad3e9bsm550428b3a.14.2026.09.01.17.57.02
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 01 Sep 2026 17:57:03 -0700 (PDT)
Message-ID: <11de1daa-702e-419e-912a-db37c9f28e92@gmail.com>
Date: Tue, 1 Sep 2026 19:57:00 -0500
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
Content-Language: en-US
From: Matthew Bettencourt <matthew.bettencourt@gmail.com>
In-Reply-To: <49cafd78-2468-4b43-a376-a8b2e2de2c19@roeck-us.net>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

Hello Guenter,

These are the only boot up messages I see for SMBus/i2c/piix4

[    1.848113] [    T272] i2c_dev: i2c /dev entries driver
[    6.093885] [    T727] piix4_smbus 0000:00:14.0: SMBus Host 
Controller at 0xb00, revision 0
[    6.093888] [    T727] piix4_smbus 0000:00:14.0: Using register 0x02 
for SMBus port selection
[    6.095020] [    T727] i2c i2c-12: Successfully instantiated SPD at 0x51
[    6.095981] [    T727] i2c i2c-12: Successfully instantiated SPD at 0x53
[    6.096039] [    T727] piix4_smbus 0000:00:14.0: Auxiliary SMBus Host 
Controller at 0xb20


I don't see anything on bus 13 or 14, I added 10-12 as well for good 
measure.
# sudo i2cdetect -y -a 14
      0  1  2  3  4  5  6  7  8  9  a  b  c  d  e  f
00: -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- --
10: -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- --
20: -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- --
30: -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- --
40: -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- --
50: -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- --
60: -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- --
70: -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- --
# sudo i2cdetect -y -a 13
      0  1  2  3  4  5  6  7  8  9  a  b  c  d  e  f
00: -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- --
10: -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- --
20: -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- --
30: -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- --
40: -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- --
50: -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- --
60: -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- --
70: -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- --
# sudo i2cdetect -y -a 12
      0  1  2  3  4  5  6  7  8  9  a  b  c  d  e  f
00: -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- --
10: -- -- -- -- -- 15 -- -- -- -- -- -- -- -- -- --
20: -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- --
30: -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- --
40: -- -- -- -- -- -- -- -- -- 49 -- 4b -- -- -- --
50: -- 51 -- 53 -- -- -- -- -- -- -- -- -- -- -- --
60: -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- --
70: -- 71 -- 73 -- -- -- -- -- -- -- -- -- -- 7e --
# sudo i2cdetect -y -a 11
      0  1  2  3  4  5  6  7  8  9  a  b  c  d  e  f
00: -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- --
10: -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- --
20: -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- --
30: 30 -- -- -- -- -- -- 37 -- -- -- -- -- -- -- --
40: -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- --
50: 50 -- -- -- -- -- -- -- -- -- -- -- -- -- -- --
60: -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- --
70: -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- --
# sudo i2cdetect -y -a 10
      0  1  2  3  4  5  6  7  8  9  a  b  c  d  e  f
00: -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- --
10: -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- --
20: -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- --
30: -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- --
40: -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- --
50: -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- --
60: -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- --
70: -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- --




On 9/1/26 5:36 PM, Guenter Roeck wrote:
> On 9/1/26 13:53, Matthew Bettencourt wrote:
>> Hello Guenter,
>>
>> I updated the piix4_transaction() (code below) to only print when 
>> there are failures. I then left the computer idle (~30 mins) while 
>> reading i2c info and SPD temps and I never saw any failures.
>>
>> I then did some sleep and resume with cycles with spd5118 driver 
>> enabled and that is when I started to see the error messages again in 
>> dmesg.It appears like there is always a failure but not every failure 
>> causes corruption in MR11. From what I observed it seems like any 
>> `CMD=1a` cause failures but no corruption while whenever there is a 
>> `CMD=0b` there is failure and corruption. Not sure what that might 
>> mean be but it is something I observed.
>>
> 
> No idea either.
> 
>> I then ran sleep and resume cycles with spd5118 disabled but still 
>> polling i2c devices and could not produce any errors, however this was 
>> just done via my desktop gui console so the script might be getting 
>> suspended before whatever it is in the sleep cycle that is causing 
>> this issue to occur.
>>
> 
> That is not surprising, as there is likely no other I2C device on that bus.
> 
> So we know that this only happens during suspend/resume. The corruption
> seems to be happening exactly once per suspend/resume cycle, and hit
> either the 0x1a read or the 0x0b read operation, but not both. To me this
> still looks like there is an unprotected access to the I2C controller.
> 
> What log messages do you see when the system starts up ? Is there anything
> along the line of "SMBus Host Controller at ..." or "Using register 0xXX 
> for
> SMBus port selection" ?
> 
> Also, is there any device at address 0x22 of bus 13 or 14 ?
> 
> Thanks,
> Guenter
> 
>>
>> --- sleep/resume #1 ---
>> [  179.066004] [   T3736] spd5118 12-0053: PRE BIT UPDATE: SUSPEND 
>> MR11 (0x0B) -> Cache: 0x00 | Bus: 0x00
>> [  179.066616] [   T3713] spd5118 12-0051: PRE BIT UPDATE: SUSPEND 
>> MR11 (0x0B) -> Cache: 0x00 | Bus: 0x00
>> [  179.068576] [   T3736] i2c i2c-12: [PIIX4 ERROR TRACE TRIGGERED] 
>> result=0
>>              STEP 1 (PRE-START)    : CNT=08, CMD=1a, ADD=a7, DAT0=00, 
>> DAT1=18
>>              STEP 2 (START BIT SET): CNT=08, CMD=1a, ADD=a7, DAT0=00, 
>> DAT1=18
>>              STEP 3 (POST-WAIT)    : STS=00, CNT=08, CMD=1a, ADD=a7, 
>> DAT0=00, DAT1=18
>>              STEP 4 (POST-CLEANUP) : CNT=08, CMD=01, ADD=45, DAT0=00, 
>> DAT1=18
>> [  179.068814] [   T3713] spd5118 12-0051: POST BIT UPDATE: SUSPEND 
>> MR11 (0x0B) -> Cache: 0x00 | Bus: 0x00
>> [  179.068888] [   T3736] spd5118 12-0053: POST BIT UPDATE: SUSPEND 
>> MR11 (0x0B) -> Cache: 0x00 | Bus: 0x00
>>
>> --- sleep/resume #2 ---
>> [  235.947153] [   T3700] spd5118 12-0053: PRE BIT UPDATE: SUSPEND 
>> MR11 (0x0B) -> Cache: 0x00 | Bus: 0x00
>> [  235.947827] [   T3699] spd5118 12-0051: PRE BIT UPDATE: SUSPEND 
>> MR11 (0x0B) -> Cache: 0x00 | Bus: 0x00
>> [  235.951600] [   T3700] i2c i2c-12: [PIIX4 ERROR TRACE TRIGGERED] 
>> result=0
>>              STEP 1 (PRE-START)    : CNT=08, CMD=0b, ADD=a7, DAT0=00, 
>> DAT1=00
>>              STEP 2 (START BIT SET): CNT=08, CMD=0b, ADD=a7, DAT0=00, 
>> DAT1=00
>>              STEP 3 (POST-WAIT)    : STS=00, CNT=08, CMD=01, ADD=45, 
>> DAT0=ff, DAT1=00
>>              STEP 4 (POST-CLEANUP) : CNT=08, CMD=01, ADD=45, DAT0=ff, 
>> DAT1=00
>> [  235.955119] [   T3699] spd5118 12-0051: POST BIT UPDATE: SUSPEND 
>> MR11 (0x0B) -> Cache: 0x00 | Bus: 0x00
>> [  235.955778] [   T3700] spd5118 12-0053: POST BIT UPDATE: SUSPEND 
>> MR11 (0x0B) -> Cache: 0x00 | Bus: 0x08
>>
>> --- sleep/resume #3 ---
>> [  298.628115] [   T3703] spd5118 12-0053: PRE BIT UPDATE: SUSPEND 
>> MR11 (0x0B) -> Cache: 0x00 | Bus: 0x00
>> [  298.629121] [   T3730] spd5118 12-0051: PRE BIT UPDATE: SUSPEND 
>> MR11 (0x0B) -> Cache: 0x00 | Bus: 0x00
>> [  298.631589] [   T3730] i2c i2c-12: [PIIX4 ERROR TRACE TRIGGERED] 
>> result=0
>>              STEP 1 (PRE-START)    : CNT=08, CMD=0b, ADD=a3, DAT0=00, 
>> DAT1=18
>>              STEP 2 (START BIT SET): CNT=08, CMD=0b, ADD=a3, DAT0=00, 
>> DAT1=18
>>              STEP 3 (POST-WAIT)    : STS=00, CNT=08, CMD=01, ADD=45, 
>> DAT0=ff, DAT1=18
>>              STEP 4 (POST-CLEANUP) : CNT=08, CMD=01, ADD=45, DAT0=ff, 
>> DAT1=18
>> [  298.636234] [   T3703] spd5118 12-0053: POST BIT UPDATE: SUSPEND 
>> MR11 (0x0B) -> Cache: 0x00 | Bus: 0x00
>> [  298.637812] [   T3730] spd5118 12-0051: POST BIT UPDATE: SUSPEND 
>> MR11 (0x0B) -> Cache: 0x00 | Bus: 0x08
>>
>> --- sleep/resume #4 ---
>> [  631.979533] [   T3021] spd5118 12-0053: PRE BIT UPDATE: SUSPEND 
>> MR11 (0x0B) -> Cache: 0x00 | Bus: 0x00
>> [  631.980193] [   T3017] spd5118 12-0051: PRE BIT UPDATE: SUSPEND 
>> MR11 (0x0B) -> Cache: 0x00 | Bus: 0x00
>> [  631.983008] [   T3021] i2c i2c-12: [PIIX4 ERROR TRACE TRIGGERED] 
>> result=0
>>              STEP 1 (PRE-START)    : CNT=08, CMD=1a, ADD=a7, DAT0=00, 
>> DAT1=18
>>              STEP 2 (START BIT SET): CNT=08, CMD=1a, ADD=a7, DAT0=00, 
>> DAT1=18
>>              STEP 3 (POST-WAIT)    : STS=00, CNT=08, CMD=01, ADD=45, 
>> DAT0=ff, DAT1=18
>>              STEP 4 (POST-CLEANUP) : CNT=08, CMD=01, ADD=45, DAT0=ff, 
>> DAT1=18
>> [  631.985028] [   T3021] spd5118 12-0053: POST BIT UPDATE: SUSPEND 
>> MR11 (0x0B) -> Cache: 0x00 | Bus: 0x00
>> [  631.987201] [   T3017] spd5118 12-0051: POST BIT UPDATE: SUSPEND 
>> MR11 (0x0B) -> Cache: 0x00 | Bus: 0x00
>>
>> --- sleep/resume #5 ---
>> [ 1288.503455] [  T10850] spd5118 12-0053: PRE BIT UPDATE: SUSPEND 
>> MR11 (0x0B) -> Cache: 0x00 | Bus: 0x00
>> [ 1288.504462] [  T10813] spd5118 12-0051: PRE BIT UPDATE: SUSPEND 
>> MR11 (0x0B) -> Cache: 0x00 | Bus: 0x00
>> [ 1288.505927] [  T10850] i2c i2c-12: [PIIX4 ERROR TRACE TRIGGERED] 
>> result=0
>>              STEP 1 (PRE-START)    : CNT=08, CMD=0b, ADD=a7, DAT0=00, 
>> DAT1=18
>>              STEP 2 (START BIT SET): CNT=08, CMD=0b, ADD=a7, DAT0=00, 
>> DAT1=18
>>              STEP 3 (POST-WAIT)    : STS=00, CNT=08, CMD=01, ADD=45, 
>> DAT0=ff, DAT1=18
>>              STEP 4 (POST-CLEANUP) : CNT=08, CMD=01, ADD=45, DAT0=ff, 
>> DAT1=18
>> [ 1288.511883] [  T10813] spd5118 12-0051: POST BIT UPDATE: SUSPEND 
>> MR11 (0x0B) -> Cache: 0x00 | Bus: 0x00
>> [ 1288.512541] [  T10850] spd5118 12-0053: POST BIT UPDATE: SUSPEND 
>> MR11 (0x0B) -> Cache: 0x00 | Bus: 0x08
>>
>>
>> --- sleep/resume #6 ---
>> [ 1339.566042] [  T10863] spd5118 12-0053: PRE BIT UPDATE: SUSPEND 
>> MR11 (0x0B) -> Cache: 0x00 | Bus: 0x00
>> [ 1339.566679] [  T10887] spd5118 12-0051: PRE BIT UPDATE: SUSPEND 
>> MR11 (0x0B) -> Cache: 0x00 | Bus: 0x00
>> [ 1339.570157] [  T10887] i2c i2c-12: [PIIX4 ERROR TRACE TRIGGERED] 
>> result=0
>>              STEP 1 (PRE-START)    : CNT=08, CMD=1a, ADD=a3, DAT0=00, 
>> DAT1=18
>>              STEP 2 (START BIT SET): CNT=08, CMD=1a, ADD=a3, DAT0=00, 
>> DAT1=18
>>              STEP 3 (POST-WAIT)    : STS=00, CNT=08, CMD=01, ADD=45, 
>> DAT0=ff, DAT1=18
>>              STEP 4 (POST-CLEANUP) : CNT=08, CMD=01, ADD=45, DAT0=ff, 
>> DAT1=18
>> [ 1339.572182] [  T10887] spd5118 12-0051: POST BIT UPDATE: SUSPEND 
>> MR11 (0x0B) -> Cache: 0x00 | Bus: 0x00
>> [ 1339.573363] [  T10863] spd5118 12-0053: POST BIT UPDATE: SUSPEND 
>> MR11 (0x0B) -> Cache: 0x00 | Bus: 0x00
>>
>> --- piix4 transaction function ---
>> int piix4_transaction(struct i2c_adapter *piix4_adapter, unsigned 
>> short piix4_smba)
>> {
>>      int temp;
>>      int result = 0;
>>      int timeout = 0;
>>
>>      dev_dbg(&piix4_adapter->dev, "Transaction (pre): CNT=%02x, 
>> CMD=%02x, "
>>      "ADD=%02x, DAT0=%02x, DAT1=%02x\n", inb_p(SMBHSTCNT),
>>              inb_p(SMBHSTCMD), inb_p(SMBHSTADD), inb_p(SMBHSTDAT0),
>>              inb_p(SMBHSTDAT1));
>>
>>      /* Register snapshot variables */
>>      u8 pre_cnt, pre_cmd, pre_add, pre_dat0, pre_dat1;
>>      u8 start_cnt, start_cmd, start_add, start_dat0, start_dat1;
>>      u8 postwait_sts, postwait_cnt, postwait_cmd, postwait_add, 
>> postwait_dat0, postwait_dat1;
>>      u8 post_cnt, post_cmd, post_add, post_dat0, post_dat1;
>>
>>      /* Step 1: Read initial register state before starting */
>>      pre_cnt  = inb_p(SMBHSTCNT);
>>      pre_cmd  = inb_p(SMBHSTCMD);
>>      pre_add  = inb_p(SMBHSTADD);
>>      pre_dat0 = inb_p(SMBHSTDAT0);
>>      pre_dat1 = inb_p(SMBHSTDAT1);
>>
>>      /* Make sure the SMBus host is ready to start transmitting */
>>      if ((temp = inb_p(SMBHSTSTS)) != 0x00) {
>>          dev_dbg(&piix4_adapter->dev, "SMBus busy (%02x). Resetting... 
>> \n", temp);
>>          outb_p(temp, SMBHSTSTS);
>>          if ((temp = inb_p(SMBHSTSTS)) != 0x00) {
>>              dev_err(&piix4_adapter->dev, "Failed! (%02x)\n", temp);
>>              return -EBUSY;
>>          }
>>      }
>>
>>      /* Start the transaction by setting bit 6 */
>>      outb_p(inb(SMBHSTCNT) | 0x040, SMBHSTCNT);
>>
>>      /* Step 2: Snapshot immediately after set start bit */
>>      start_cnt  = inb_p(SMBHSTCNT);
>>      start_cmd  = inb_p(SMBHSTCMD);
>>      start_add  = inb_p(SMBHSTADD);
>>      start_dat0 = inb_p(SMBHSTDAT0);
>>      start_dat1 = inb_p(SMBHSTDAT1);
>>
>>      /* Wait for transaction completion */
>>      if (srvrworks_csb5_delay)
>>          usleep_range(2000, 2100);
>>      else
>>          usleep_range(250, 500);
>>
>>      while ((++timeout < MAX_TIMEOUT) &&
>>          ((temp = inb_p(SMBHSTSTS)) & 0x01))
>>          usleep_range(250, 500);
>>
>>      /* Step 3: Snapshot right after wait loop */
>>      postwait_sts  = temp;
>>      postwait_cnt  = inb_p(SMBHSTCNT);
>>      postwait_cmd  = inb_p(SMBHSTCMD);
>>      postwait_add  = inb_p(SMBHSTADD);
>>      postwait_dat0 = inb_p(SMBHSTDAT0);
>>      postwait_dat1 = inb_p(SMBHSTDAT1);
>>
>>      if (timeout == MAX_TIMEOUT)
>>          result = -ETIMEDOUT;
>>      if (temp & 0x10)
>>          result = -EIO;
>>      if (temp & 0x08)
>>          result = -EIO;
>>      if (temp & 0x04)
>>          result = -ENXIO;
>>
>>      if (inb_p(SMBHSTSTS) != 0x00)
>>          outb_p(inb(SMBHSTSTS), SMBHSTSTS);
>>
>>      /* Step 4: Final snapshot */
>>      post_cnt  = inb_p(SMBHSTCNT);
>>      post_cmd  = inb_p(SMBHSTCMD);
>>      post_add  = inb_p(SMBHSTADD);
>>      post_dat0 = inb_p(SMBHSTDAT0);
>>      post_dat1 = inb_p(SMBHSTDAT1);
>>
>>      /*
>>       * Dump full diagnostic trace ONLY if:
>>       * 1. Hardware registers were mutated (pre vs post mismatch on 
>> CMD or ADD)
>>       * 2. The bus operation returned an error code
>>       */
>>      if (pre_cmd != post_cmd || pre_add != post_add || result != 0) {
>>          dev_err(&piix4_adapter->dev,
>>                  "[PIIX4 ERROR TRACE TRIGGERED] result=%d\n"
>>                  "  STEP 1 (PRE-START)    : CNT=%02x, CMD=%02x, 
>> ADD=%02x, DAT0=%02x, DAT1=%02x\n"
>>                  "  STEP 2 (START BIT SET): CNT=%02x, CMD=%02x, 
>> ADD=%02x, DAT0=%02x, DAT1=%02x\n"
>>                  "  STEP 3 (POST-WAIT)    : STS=%02x, CNT=%02x, 
>> CMD=%02x, ADD=%02x, DAT0=%02x, DAT1=%02x\n"
>>                  "  STEP 4 (POST-CLEANUP) : CNT=%02x, CMD=%02x, 
>> ADD=%02x, DAT0=%02x, DAT1=%02x\n",
>>                  result,
>>                  pre_cnt, pre_cmd, pre_add, pre_dat0, pre_dat1,
>>                  start_cnt, start_cmd, start_add, start_dat0, start_dat1,
>>                  postwait_sts, postwait_cnt, postwait_cmd, 
>> postwait_add, postwait_dat0, postwait_dat1,
>>                  post_cnt, post_cmd, post_add, post_dat0, post_dat1);
>>      }
>>
>>      if ((temp = inb_p(SMBHSTSTS)) != 0x00) {
>>          dev_err(&piix4_adapter->dev, "Failed reset at end of "
>>          "transaction (%02x)\n", temp);
>>      }
>>      dev_dbg(&piix4_adapter->dev, "Transaction (post): CNT=%02x, 
>> CMD=%02x, "
>>      "ADD=%02x, DAT0=%02x, DAT1=%02x\n", inb_p(SMBHSTCNT),
>>              inb_p(SMBHSTCMD), inb_p(SMBHSTADD), inb_p(SMBHSTDAT0),
>>              inb_p(SMBHSTDAT1));
>>
>>      return result;
>> }
>>
>>
>> Thanks,
>> Matthew
>>
>> On 9/1/26 12:04 PM, Guenter Roeck wrote:
>>> Hi Matthew,
>>>
>>> On 9/1/26 09:31, Matthew Bettencourt wrote:
>>>> Hello Guenter,
>>>>
>>>> I added additional logging into the piix4_transaction(). I will put 
>>>> the function call on the bottom. But as you guessed we are seeing 
>>>> not just MR11 corruption but also can trigger on other addresses as 
>>>> well. I was running the suspend/resume cycle and caught on both MR11 
>>>> issue and else where. Here is the dmesg log output.
>>>>
>>>> --- Other PIIX4 transation ---
>>> ...
>>>> [29287.881787] [ T204580] i2c i2c-12: [PIIX4 REGISTER MUTATION 
>>>> DETECTED] Pre: (CMD=0x1a, ADD=0xa3) -> Post: (CMD=0x01, ADD=0x45) | 
>>>> DAT0=0xff
>>> ...
>>>> [29312.945873] [ T204570] i2c i2c-12: [PIIX4 REGISTER MUTATION 
>>>> DETECTED] Pre: (CMD=0x0b, ADD=0xa7) -> Post: (CMD=0x01, ADD=0x45) | 
>>>> DAT0=0xff
>>>
>>> It may be a coincidence, but the two failed accesses are exactly 25 
>>> seconds apart.
>>>
>>> Would it be possible to drop the messages except for the failures and 
>>> run long-term
>>> accesses (for example by reading the temperatures and/or the nvmem 
>>> continuously) ?
>>> You should find the nvmem at /sys/bus/nvmem/devices/0-005[13]/nvmem.
>>>
>>> It might be useful to know if this only happens during suspend/resume 
>>> cycles
>>> or if it happens all the time, if it happens randomly or in specific 
>>> intervals,
>>> and if the failure pattern is always the same.
>>>
>>> Thanks,
>>> Guenter
>>>
>>
> 

