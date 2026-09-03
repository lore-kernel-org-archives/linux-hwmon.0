Received: from mail-pj1-f42.google.com (mail-pj1-f42.google.com [209.85.216.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C74BD401A08
	for <linux-hwmon@vger.kernel.org>; Thu,  3 Sep 2026 21:05:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788469552; cv=none; b=t3iXOkmQA5k/q6mXmBmvY/6PGXTfApJVouirG/SJagPGshfK163JmJBNUMctDo5q7M/80gKGmn1nlV9XCqmz87+x4tJig/1vSHbjZ/qUgYObzb3lGTcCr3vIYEt6AEXw94Vv04trJ7rzztt8ROvCQ/gp+jm1LBWntQ/pmdeajoY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788469552; c=relaxed/simple;
	bh=SOR9fOIt3kBxiRpEZhQdRNk36+I0q9GbOCdrTRgTeWc=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=utkq/I9jbVGr5kfIwxZ/sZSzKEnN9T/LNp6vmx66puiJtvktbDzVPZ+Utm7Nje5hdo7H7qkB1zKf08h8y3D1oIV2xtwcCzGpm/JxxjEKVr8pYVtPk/YyFjIBE5S4N3YywVoGoP8ZZ8eECv8VR0Ce4hEr+KIN2dmH6E+pNEx9i1M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=VPW9DXMz; arc=none smtp.client-ip=209.85.216.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="VPW9DXMz"
Received: by mail-pj1-f42.google.com with SMTP id 98e67ed59e1d1-398d2b28acfso207705a91.1
        for <linux-hwmon@vger.kernel.org>; Thu, 03 Sep 2026 14:05:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788469550; x=1789074350; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:sender:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=60P5FvTjKGMcVafsSO2v7sG3m4btNPCdvxmW+oE/rmM=;
        b=VPW9DXMzVc6TdQ5J0hItX8ZBoaz/F6mE0HfxplBk8APZt5oUVc23qD4U/KLHeoTbWd
         ouhr+bU8nHIBZHklWHd/6NpXrQ0Fuoyp5RPHI3WZoLUfHFVNE9beuFaXM/sAY+Hf5kaH
         n0NcRbAIfYZCz/m8SGlvBL4MTv1a61L5RpSKHn6eAEY5OkGWk43BbiKTikH4XyDoK52Q
         WCZjEEFgt1f/CAsBr7OJ6wiu9kO6KZCwyBE7UUxZlCMrehwyi5mH76EHszEwJ8G9P0TL
         beaRoKepjw8PQ4cp2K7T3furmTGME+GBXZgbpOdH8WO9k2HmGdBY2ibxe7GzRV0ukUvc
         trEg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788469550; x=1789074350;
        h=content-transfer-encoding:content-type:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:sender:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=60P5FvTjKGMcVafsSO2v7sG3m4btNPCdvxmW+oE/rmM=;
        b=WS4ktNtMBNQPqKnCBsnYQ5epiZTi4nKJiiiCXPlR9s+kCDZdekN/K6og8TjqPYR2SE
         KOpXTNQhOvMUNJevy5nAi/A0f7bT6rzg+q7PIPqyBFnESN7BmBxdie2Q+TcXOzqXqZrH
         Huq3INw+lqPJ/pOTPy3BLom8be6nhhKgyIBMkbNJQwqSD77egxqfjc5fhUG5SY/FncuZ
         6Zr8biufMIJf1oovZwvUVOvWMllWJyPErmGfn8V6clDJ1n89Lxoq375K/B7bMla9NZDe
         FMJkad2RSBhEAjL/x4txofOgP9Ix9JGlb7rFLrBcriV1CifBGlysnj31D8gH5Iuz0Ne/
         z+Kg==
X-Forwarded-Encrypted: i=1; AKwUvBzj68G00SYL4lpA0rbUX+1ycO67gcX6aZyuiTXzfJQfNCBnnuaZqX2BbGZkcTSP+sOWcF3FTqM1hWEoyw==@vger.kernel.org
X-Gm-Message-State: AFuF++nv0zV01O8plCWe224qXW8+Ty5VkrA6R1VdedmQWMygrwlmmYmp
	Q2OvLNjmMWEeCyA5iM92At3EM2FvEq5QMnXF7457Kq9mxsrpvn8flPBf
X-Gm-Gg: AYBFou1suUS7uO5SYxTwtQeTrodXTlp5wSlh8Z1XO/LYMar8SjgNXwZagWfNh5v90Rt
	n1GAgESOe3EnoaSgNrSU39qqissiexn/hotmlB0ToWF/N3YlC6w82eFB1vUlW/LpzDkUFvf3hjO
	Tn2hj/QaaFPWqd4Qvzef115KoEBw9aBBJwkHFGurCkJLEwm+Y3+eVL9w/G/f8VXC6r5MbYRZG1o
	1STe5i67yH8zgpUpIGUw8YEQX4tHNuimxTpnLNXfdKGzNTapCpbmGx/KloJLf95OILocI4H5Sdp
	ionwSTUp1vd9jK9kQ4uH7OFrjXCmm4c/K3susWX+t2/T0jExJ0RP6O6SvKV2IJ2Ppe2oG7rlkGa
	q+s+2PBxmnlIwWCHt4u3HzWfoJsJIKdhBH9YaMwURceXs7iGz0848M80lP2C6PKn2v4nFqA8YLK
	YFGrXh1r/GyTeQte6cytHqospq17UCg27vObYpJ+shCDXkPk/VPEX2jGG1cvLE+42XK50KHod/p
	B/T/ge7M/NNs+nDhTNo4pGj0pWe5nLMbM4fBg==
X-Received: by 2002:a17:90b:564c:b0:37f:e326:6557 with SMTP id 98e67ed59e1d1-39b2612338dmr2047120a91.4.1788469549990;
        Thu, 03 Sep 2026 14:05:49 -0700 (PDT)
Received: from ?IPV6:2600:1700:e321:62f0:da43:aeff:fecc:bfd5? ([2600:1700:e321:62f0:da43:aeff:fecc:bfd5])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-39b260cd2aasm767627a91.3.2026.09.03.14.05.48
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 03 Sep 2026 14:05:49 -0700 (PDT)
Sender: Guenter Roeck <groeck7@gmail.com>
Message-ID: <5480c69c-8e98-443e-96d7-30e64e886373@roeck-us.net>
Date: Thu, 3 Sep 2026 14:05:48 -0700
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [BUG] SPD5118 Intermittent MR11 Corruption During Suspend/Resume
To: Matthew Bettencourt <matthew.bettencourt@gmail.com>
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
 <e1a6a91d-d03e-4e7a-ba7b-9268284ce7e8@gmail.com>
Content-Language: en-US
From: Guenter Roeck <linux@roeck-us.net>
Autocrypt: addr=linux@roeck-us.net; keydata=
 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
 np3900V20aS7eD9K8GTU0TGC1pyz6IVJwIE=
In-Reply-To: <e1a6a91d-d03e-4e7a-ba7b-9268284ce7e8@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi Matthew,

On 9/3/26 11:25, Matthew Bettencourt wrote:
> Hello Guenter,
> 
>  > This system [MSI PRO B850M-A WIF/7600x3d] does _not_ have a problem, or did I misunderstand the above ?
> 
> That is correct. I was unable to replicate the issue with the MSI PRO B850M-A WIF and 7600x3d. The MR11 registered never got corrupted during sleep/resume and I never saw any piix4 errors logged when using my piix4 driver with the additional logging enabled.
> 
> I never swapped the CPUs as that was more hassle than I was willing to do right now, but if it something that might be useful I can probably try that at some point.
> 
I don't think that would help. From all the reports I browsed through
so far, the common denominator seems to be that the affected systems use
a X870 or X870E chipset.

Anyway, couple of ideas:

- Do you have the latest BIOS installed on your system ?
   Some statements online seem to suggest that the problem
   _may_ be fixed with the latest BIOS on at least some
   of the affected systems.

- Please boot the affected system with "usbcore.autosuspend=-1"
   kernel command line parameter.
   There are some claims online that this might resolve the problem.
   I have no idea why that would be the case, but I guess it does
   not hurt trying. Of course, if that _does_ work, we have yet another
   mystery to solve.

- Do you have memory with RGB-anything in the affected system ? If so,
   is it controlled by the BIOS ? If yes, please disable the functionality
   if that is possible.

Thanks,
Guenter

