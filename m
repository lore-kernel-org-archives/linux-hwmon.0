Received: from mail-pz2-f12.google.com (mail-pz2-f12.google.com [74.125.228.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B26CE4F648C
	for <linux-hwmon@vger.kernel.org>; Fri, 25 Sep 2026 21:19:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.228.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790371184; cv=none; b=eJQxj1ygtbbwOW68IMAiIGghYJDl3Imx9LLdwTA1eomvtQbhf1gdqhkM+RcQoIeh3unNVxUlYuyX/gzX0PmTetXOD0jC+MpDVz5ShXaP87A9ZpLFDE6YymZPN1BIAL2aGblvVp4dHX+YYmRVjU/CU1NmluJ8IiLNDWnY/0zNT5I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790371184; c=relaxed/simple;
	bh=0GWPqZpmdGFUSUdNZnUFUlJDkU2OEy7Ysxs/AaAevAk=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=eCfs2GqBOkfFpucPGFZnOoZzdamSPNVmgaKJPlAndY2jdERBpooVd244K1xMEaShKfqzeLuyCs96G81Xk+UmHbm4vHyFobD2haMH7frl56GOOkGB55HTXdaye/FgJwAsILtgS+QMl7GRx9b+19FJ67tBwfWmj+oFD7saDrc7fdQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=BSKa1VE5; arc=none smtp.client-ip=74.125.228.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="BSKa1VE5"
Received: by mail-pz2-f12.google.com with SMTP id 41be03b00d2f7-cc4c08393b0so587720a12.0
        for <linux-hwmon@vger.kernel.org>; Fri, 25 Sep 2026 14:19:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790371182; x=1790975982; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :content-type:mime-version:references:message-id:subject:cc:to:from
         :date:sender:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=JB0nUqbya8/nZnbD9q59QxieeAyOe2s3ehiXTlDcKL4=;
        b=BSKa1VE5VJY8h86oU2v5pKBpJIMFaWRw7l6J8d5l4DEtWlXq+LtN6GRsRZ0F37vWmV
         4tgxUZA9H/vYPCi/fKRjOmpYac8gIhZ1tWsabEqJi0mwVy5nNq+7ND4wy/mpJhr4yIvJ
         ObMgGoh8W/cG4ZceWhlAbqQnd5urz7cpdAfeCIGUDq2bcSKvgxU1gXOpGSLtcGkPUTXM
         lbnGebl2kXAZ7aadqbqpxHVkMf0ZCol5kRbv4M7KKsQ8NlDJaMWGcw8+re8qW062vYFO
         9CSG/1/TTg8UCOUvC6C15vBwhJ8UmLM+5bZZ0b16pZIdaF3psXf23V4t8onsYxEHD+eY
         2Jkg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790371182; x=1790975982;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :content-type:mime-version:references:message-id:subject:cc:to:from
         :date:sender:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=JB0nUqbya8/nZnbD9q59QxieeAyOe2s3ehiXTlDcKL4=;
        b=ncAq/gUxaPCHi1CoIL8xW2jBTuFszBpmU0c42na8T3pYTJc7kCUKSDch0BdARTy9dt
         SI6tW5h51UcOyBwX0VTrh3Tn64CjyiVuTK2Ah5LRfs6mE/Oiw9xJoi24OFBQrluTAFLi
         PLBBlWTWCh/+icqeUfe5eYX+74wd57bQiK0KVhxO8gsjfyg1jvzqCMzfmPBY37hJIixY
         vSE1MpZOIG0dZ2/2w6LRQS9ONZ+YzV/mAaQt+MF0CllMg840mTNdFjUGV04g5oAEV6Hr
         Fw/uemQfDmPKRxY1M6Vtq7KxcNTWLwVP5jMozmyJkvRkWuAqU0tX6a4hPEAayXxpsqwJ
         2OyQ==
X-Forwarded-Encrypted: i=1; AKwUvBz+1VgI+f2krZd/t2oetyq4lTbKUFcGdu/EECH/ZZBz4T1Eto0gFN50Nm6YnnNHiJxrAb0FO80B+KA9Cg==@vger.kernel.org
X-Gm-Message-State: AFuF++nlbjSmHlqWSrxOkEtz2tDzFzwsHoAkMA2Cw9dfPqiOeMW/03hx
	XTetW9+4C88RTT/nXHRS0IMrQjNTBn/EnfiVJJQU6OavFutcMtJhdvjS
X-Gm-Gg: AYBFou2kCQ3hBOF6yq3RHLMpJS5Fbmb3DmNJJT0ziHwZnZX++m4kKzlExmFNn4vSO3e
	G1ZeiRFawqhC/WdoqtAS4geBnHFCtsbR7zpUwFzKBag271TqpCP5zjoTRREIzGbiNUSXJLddME3
	gPO+NB2PS2EvB2bPDJoBoSG628OcFD45FDLXN76l/nSst7gqEoF/U/GayyLixnAD41v6CZ/tynb
	jZKkjWsRN3vgISRzBPzlonzb5zbGmPhnuWJbChlNMa6th+w+scXtHEYF0ddbzlkgL42n2YVO03V
	OZyQ3QaWELrXxaxTZzjExGOwvo/VNb1CGv8MrAVDi/yD/s4+IE+Dz5QxN14/EdKatPi23icjlxa
	tfcaGkIwQOXk2sDed51F4qxhSvR9mFz92PqU9kDLs9ZA6iE9+rXlCtQJsRqOuMJbSEPlJ7I/oX2
	MD4USqF5NplGb2HFKPW6mFCJIJSCyC1BxwFKDImaSSmvYNRRdikgbCYaUOhbpwbCf/PfmO3Hvf2
	AGctxCk4Y2R
X-Received: by 2002:a05:6a21:748b:b0:3dd:a196:9070 with SMTP id adf61e73a8af0-3de0e9432damr6262879637.58.1790371181958;
        Fri, 25 Sep 2026 14:19:41 -0700 (PDT)
Received: from server.roeck-us.net ([2600:1700:e321:62f0:da43:aeff:fecc:bfd5])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-cc787943cc9sm1828969a12.21.2026.09.25.14.19.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 25 Sep 2026 14:19:41 -0700 (PDT)
Sender: Guenter Roeck <groeck7@gmail.com>
Date: Fri, 25 Sep 2026 14:19:39 -0700
From: Guenter Roeck <linux@roeck-us.net>
To: Christian Lamparter <chunkeey@gmail.com>
Cc: Ridham Khurana <khurana.ridham222@gmail.com>,
	linux-hwmon@vger.kernel.org, linux-kernel@vger.kernel.org,
	Christian Lamparter <chunkeey@googlemail.com>,
	Alexander Sverdlin <alexander.sverdlin@gmail.com>,
	Nikita Shubin <nikita.shubin@maquefel.me>,
	Shuah Khan <shuah@kernel.org>, Jori Koolstra <jkoolstra@xs4all.nl>,
	Brigham Campbell <me@brighamcampbell.com>,
	linux-kernel-mentees@lists.linux.dev
Subject: Re: [PATCH] hwmon: (lm70) Fix rounding of negative temperatures
Message-ID: <3334ba64-2f0b-4e66-9a3b-84f46af70212@roeck-us.net>
References: <20260924205326.1739229-1-khurana.ridham222@gmail.com>
 <f28a5470-0d9e-4045-9c64-5614e0e88de2@gmail.com>
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <f28a5470-0d9e-4045-9c64-5614e0e88de2@gmail.com>

On Fri, Sep 25, 2026 at 08:03:06PM +0200, Christian Lamparter wrote:
> Hi,
> 
> On 9/24/26 10:53 PM, Ridham Khurana wrote:
> > temp1_input_show() drops the low bits of the temperature register by
> > dividing the raw value (raw / 32 on the LM70). These bits are not part
> > of the temperature: the LM70, LM71, LM74 and TMP122/TMP124 always
> > return some of them as 1, and the TMP125 fills them with copies of the
> > temperature LSB. Division rounds toward zero, so a negative temperature
> > with any of these bits set is reported one LSB too high.
> > 
> > For example, the TMP122 returns 0xffff for -0.0625 degrees C, which the
> > driver reports as 0. The LM70 returns 0xf39f for -25 degrees C, which
> > the driver reports as -24750.
> > 
> > Use an arithmetic right shift instead, which drops the low bits and
> > rounds down. tmp421 had a similar problem with negative values, fixed
> > by commit 724e8af85854 ("hwmon: (tmp421) fix rounding for negative
> > values").
> 
> For the TMP125 yes:
> 
> Reviewed-by: Christian Lamparter <chunkeey@gmail.com>
> 
> 
> > Fixes: e1a8e913f97e ("[PATCH] lm70: New hardware monitoring driver")
> > Fixes: a86e94dc946d ("hwmon: (lm70) Add support for LM71 and LM74")
> > Fixes: cd929672a9ef ("hwmon: (lm70) Add ti,tmp125 support")
> > Signed-off-by: Ridham Khurana <khurana.ridham222@gmail.com>
> > ----
> I wrote a little test program by hand (see below) and ran it on x64.
> No idea if different archs behave differently or if
> a clever unsafe math optimizing compiler flag will
> convert the  "/ 32" to a " >> 5" but I doubt that...
> 
> ---
> tmp125: raw:7ec0 tmp125_proposed: -2500 tmp125_now: -2500
> tmp125: raw:7eff tmp125_proposed: -2250 tmp125_now: -2000  <--- loss of percision
> tmp125: raw:7f00 tmp125_proposed: -2000 tmp125_now: -2000
> tmp125: raw:7f3f tmp125_proposed: -1750 tmp125_now: -1500  <--- more
> tmp125: raw:7f40 tmp125_proposed: -1500 tmp125_now: -1500
> tmp125: raw:7f7f tmp125_proposed: -1250 tmp125_now: -1000  <--- and this
> tmp125: raw:7f80 tmp125_proposed: -1000 tmp125_now: -1000
> tmp125: raw:7fbf tmp125_proposed:  -750 tmp125_now:  -500  <--- also bad
> tmp125: raw:7fc0 tmp125_proposed:  -500 tmp125_now:  -500
> tmp125: raw:7fff tmp125_proposed:  -250 tmp125_now:     0  <--- ouch
> tmp125: raw:   0 tmp125_proposed:     0 tmp125_now:     0
> tmp125: raw:  3f tmp125_proposed:   250 tmp125_now:   250
> tmp125: raw:  40 tmp125_proposed:   500 tmp125_now:   500
> tmp125: raw:  7f tmp125_proposed:   750 tmp125_now:   750
> tmp125: raw:  80 tmp125_proposed:  1000 tmp125_now:  1000
> tmp125: raw:  bf tmp125_proposed:  1250 tmp125_now:  1250
> tmp125: raw:  c0 tmp125_proposed:  1500 tmp125_now:  1500
> tmp125: raw:  ff tmp125_proposed:  1750 tmp125_now:  1750
> tmp125: raw: 100 tmp125_proposed:  2000 tmp125_now:  2000
> tmp125: raw: 13f tmp125_proposed:  2250 tmp125_now:  2250
> tmp125: raw: 140 tmp125_proposed:  2500 tmp125_now:  2500
> 

Sorry, you lost me with the above. Are you suggesting that the patch is
correct, that it is only correct for TMP125, or something else ?

Guenter

> (the positive values all look good.)
> 
> --- SNIP test.c program
> 
> #just name the file test.c and run make test (in a directory without any other makefile)
> #include <stdio.h>
> #include <asm-generic/int-l64.h>
> 
> static __s32 sign_extend32(__u32 value, int index)
> {
>         __u8 shift = 31 - index;
>         return (__s32)(value << shift) >> shift;
> }
> 
> static int tmp125_now(__s16 raw)
> {
>         return (sign_extend32(raw, 14) / 32) * 250;
> 
> }
> 
> static int tmp125_proposed(__s16 raw)
> {
>         return (sign_extend32(raw, 14) >> 5) * 250;
> 
> }
> 
> int main(int argc, char **args)
> {
>         for (__s16 raw = -320; raw <= 320; raw+=32) {
>                 __s16 tmp=raw & 0x7fe0 | ((raw & 32) >> 1) | ((raw & 32) >> 2) | ((raw & 32) >> 3) | ((raw & 32) >> 4) | ((raw & 32) >> 5);
>                 printf("tmp125: raw:%4x tmp125_proposed:%6d tmp125_now:%6d\n", tmp, tmp125_proposed(tmp), tmp125_now(tmp));
>         }
> 
>         return 0;
> }
> 
> --- SNAP
> 
> FYI: TMP125 datasheet says:
> "The  Temperature  Register  of  the  TMP125  is  a  16-bit, read-only register that stores
> the output of the most recentconversion. However, temperature is represented by only10-bits,
> which are in signed two’s complement format. Thefirst bit of the Temperature Register, D15,
> is a leading zero. Bits D14 and [sic] D5 are used to indicate temperature. Bits D4 to D0
> are the same as D5 (see Table 1)."
> 
> (They probably meant Bits D14 >>to<< D5 are used to indicate temperature).
> 
