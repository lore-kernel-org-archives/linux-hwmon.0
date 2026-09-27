Received: from mail-wr2-f35.google.com (mail-wr2-f35.google.com [74.125.225.99])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 00AB43C09FB
	for <linux-hwmon@vger.kernel.org>; Sun, 27 Sep 2026 11:10:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.225.99
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790507438; cv=none; b=EBPzFUQ44IrCUPXJoboYWub6jeTLOa1S961Knts89ZNx4opaDT/M+j3U7uTIbSjutg/69sCwZqxeby4vIMD6l7mWluztL460PBuTLwSh0Xkl5EJ8gcLtuVBL4kk+e5wfAyqDFU7VFBW8U4o5PvzxFLbQjkNaz/cfwcWx/JL+vJc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790507438; c=relaxed/simple;
	bh=Lyez7JVaJYxHxW1ImgrKFGnQCl31RuCVPGHH2ZZXIH4=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=NkRCPYqf05n/9JtdnBISOoWbV3OS7UzFcs9Y6a6P/0kFB/g2hnCwXbsp5bt9ovslu3nsSGpZfWzqrkINz9GzJH9ZSnV1whnozpH/y0SeeJbjNK/Lpi0OVSEHDfbsqFe2uPkxdTwH6gu42p1ZXOUzvTIM2EouipiSJ22UN1GE2mQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=InfzIBGf; arc=none smtp.client-ip=74.125.225.99
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="InfzIBGf"
Received: by mail-wr2-f35.google.com with SMTP id ffacd0b85a97d-4885a1480a2so1162037f8f.3
        for <linux-hwmon@vger.kernel.org>; Sun, 27 Sep 2026 04:10:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790507434; x=1791112234; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=m7AJ2hwe4+6QFOm6zh96W6e3NiB9GKNgjSqcd1c3qxc=;
        b=InfzIBGfwLLOf45tsOqk+KKRgO1hbcUBNl85RIquxs31/ao0Us64HRDiML1Mnwkx75
         YzsCELkBwzNcKJwRPDMIbl4a5vaGVd20UKgl0CzSV/VwH1UkjvIhUi+RRbnJLWdh9yRX
         qfnl15XBnJb2VBWrN+eCJjOPLNF+vcw5vj7MEROZiOu9dxGpjyHhU1UX3hZe69n9+aFS
         /ovnZXgpO42sivFJ2rxjgtrL9hbiHeuCLSKe6d0XwnxxlEJbP2FEDlvp6IdKZBtCLaIT
         6DwDGegOOR4nu5SzF1yjndKsO4vmTChgTP8jsYK231/e5WYdflqGRP6sX5EyC71KtFGk
         Kfeg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790507434; x=1791112234;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=m7AJ2hwe4+6QFOm6zh96W6e3NiB9GKNgjSqcd1c3qxc=;
        b=tXD2bhZktS3QqYHI0UWmk8/MG7krQ+sfEdCf51ot0t3DkT26/VcB2PLiaLCtkzY4IV
         ToHfIpcfHsRrbpUTOKzJQyXAxkzNTZ0N2olTr4/0Zwj/PfdgLs5zNatVtIu+wLoS1MDn
         dsq9IUVbSYWpkAhC4At7C35iRuBGxsMPyJ6cc5lUAwSnbHf9xJAQGZmNFMoTRqbcgK3D
         0Ba7IELRGt8Jh8mI4z30BEB9NZbjv1v2elbYid9Y5lKxYbm+XVBvdNDh5sLSL5XTI05M
         WcHW5Ojp/4vY/FvQI5BAv+3KjP6XIvPB7gSk5D7mcNgFFIzmHrMXNAyzsBijzZj1NbsW
         BGpg==
X-Forwarded-Encrypted: i=1; AKwUvByyRm1s/H0uJhTh0MqhglWG5nWyx6mEyXtZC3gzppvQWlfRzcRRbBavkWFYTrw31Dyw+Ks1Kexs96BhKg==@vger.kernel.org
X-Gm-Message-State: AFuF++nNwuN7Xyv1ZayuX5dLTA5Xw4S4620j6XhGbbI9ghQcsuAaF7JC
	FMLGDUaBvd59Kzsw1QualAJlgVwYa+pk0vwfeDmU0f+weaE/Lah2CzU/
X-Gm-Gg: AYBFou38lqF52yqCPAa7WOa5t1ndOBP3k32cv+0KNNVW0wXe6EnefU+Mj0/3NeLePmB
	LGSTMbCqaBiKw7wa88KQR3OGu1ognoqIONtItxPV0zEYcVXvsaNNMFaOwJ1dzS2V3+V1C2FAr5M
	cwDr6q+bzRZ9kpmIds/3O8qZuthSxjeEC/UJkMw681A0NTvkOASvwtduLXF6MkjWx+NMVlT5CN6
	m6OclDrgi5XqtFc0O4780N77XzMSIZIhLHgEn7otXEV5yrpZGsmZCyKPH8BNgTjMfvuTHjsfPi0
	Bwt9oxUPA+8AM7ncWNNffwhlO/XDtb6HYs7RMBf/Ik74tpfGpfhqk9y1rW2r1yLcUSOvEdf2Jtg
	TOHe4MJ/p2s9UzNLy2Jv5RbH+u/7hHHjuobBxM7T950Zt8gqNq1OEH+69bTJZ+vtdzEgSz3CZYu
	3m6TcskAJjJLoYyV7D7HjsdSKEvSb4d1AJ8tyv9wQRT+LxRb5F7fJ5ad0f/R4oC9h0iwNxe8dXB
	KCF6UK40c331bwAOdKdpGgq45lD/kukWcRCbkNb5JoDrmuQyJlzhihj7jY0A3480u58
X-Received: by 2002:a05:600c:4ec8:b0:49f:dd10:3c71 with SMTP id 5b1f17b1804b1-49fe66c61c4mr189586755e9.11.1790507433948;
        Sun, 27 Sep 2026 04:10:33 -0700 (PDT)
Received: from shift (p200300d5ff3cee0050f496fffe46beef.dip0.t-ipconnect.de. [2003:d5:ff3c:ee00:50f4:96ff:fe46:beef])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a0016fd85fsm52932255e9.1.2026.09.27.04.10.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 27 Sep 2026 04:10:32 -0700 (PDT)
Received: from localhost ([127.0.0.1])
	by shift.daheim with esmtp (Exim 4.100.1)
	(envelope-from <chunkeey@gmail.com>)
	id 1xAmkJ-000000006Ml-11Hm;
	Sun, 27 Sep 2026 13:10:30 +0200
Message-ID: <63e6e9f0-04c3-485d-8fdb-5e96a1ebd1f5@gmail.com>
Date: Sun, 27 Sep 2026 13:10:30 +0200
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] hwmon: (lm70) Fix rounding of negative temperatures
To: David Laight <david.laight.linux@gmail.com>
Cc: Ridham Khurana <khurana.ridham222@gmail.com>,
 Guenter Roeck <linux@roeck-us.net>, linux-hwmon@vger.kernel.org,
 linux-kernel@vger.kernel.org, Christian Lamparter <chunkeey@googlemail.com>,
 Alexander Sverdlin <alexander.sverdlin@gmail.com>,
 Nikita Shubin <nikita.shubin@maquefel.me>, Shuah Khan <shuah@kernel.org>,
 Jori Koolstra <jkoolstra@xs4all.nl>,
 Brigham Campbell <me@brighamcampbell.com>,
 linux-kernel-mentees@lists.linux.dev
References: <20260924205326.1739229-1-khurana.ridham222@gmail.com>
 <f28a5470-0d9e-4045-9c64-5614e0e88de2@gmail.com>
 <20260927073115.15110623@pumpkin>
Content-Language: de-DE
From: Christian Lamparter <chunkeey@gmail.com>
In-Reply-To: <20260927073115.15110623@pumpkin>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

On 9/27/26 8:31 AM, David Laight wrote:
>>
>> On 9/24/26 10:53 PM, Ridham Khurana wrote:
>>> temp1_input_show() drops the low bits of the temperature register by
>>> dividing the raw value (raw / 32 on the LM70). These bits are not part
>>> of the temperature: the LM70, LM71, LM74 and TMP122/TMP124 always
>>> return some of them as 1, and the TMP125 fills them with copies of the
>>> temperature LSB. Division rounds toward zero, so a negative temperature
>>> with any of these bits set is reported one LSB too high.
>>>
>>> For example, the TMP122 returns 0xffff for -0.0625 degrees C, which the
>>> driver reports as 0. The LM70 returns 0xf39f for -25 degrees C, which
>>> the driver reports as -24750.
>>>
>>> Use an arithmetic right shift instead, which drops the low bits and
>>> rounds down. tmp421 had a similar problem with negative values, fixed
>>> by commit 724e8af85854 ("hwmon: (tmp421) fix rounding for negative
>>> values").
>>
>> For the TMP125 yes:
>>
>> Reviewed-by: Christian Lamparter <chunkeey@gmail.com>
>>
>>
>>> Fixes: e1a8e913f97e ("[PATCH] lm70: New hardware monitoring driver")
>>> Fixes: a86e94dc946d ("hwmon: (lm70) Add support for LM71 and LM74")
>>> Fixes: cd929672a9ef ("hwmon: (lm70) Add ti,tmp125 support")
>>> Signed-off-by: Ridham Khurana <khurana.ridham222@gmail.com>
>>> ----
>> I wrote a little test program by hand (see below) and ran it on x64.
>> No idea if different archs behave differently or if
>> a clever unsafe math optimizing compiler flag will
>> convert the  "/ 32" to a " >> 5" but I doubt that...
> 
> A compiler will convert an unsigned divide to a shift, but can't
> do so for signed divides.
 > > But you'll also get flagged because C doesn't define right shifts
> for negative values.

Hmm... For at least x86, any compiler should see that the is an integer type
and use the Shift Arithmetic Right (SAR) instead of the SHR instruction. From
what I know that SAR instructions is very old, like 8086 with improvements
some major improvements on the 286... And linux started with the 386 so, this
should work even into the past. (But please correct if this is wrong).

I can't tell what clang would do, but GCC says this (second last bullet point):
<https://gcc.gnu.org/onlinedocs/gcc/Integers-implementation.html>

|Bitwise operators act on the representation of the value including both
|the sign and value bits, where the sign bit is considered immediately above
|the highest-value value bit. Signed ‘>>’ acts on negative numbers by sign extension.
|
|As an extension to the C language, GCC does not use the latitude given in C99 and
|later to treat certain aspects of signed ‘<<’ as undefined.
|However, -fsanitize=shift (and -fsanitize=undefined) will diagnose such cases.
|They are also diagnosed where constant expressions are required.

So, the << (shift left) could indeed be a problem/undefined.

Cheers,
Christian
