Received: from mail-dy1-f180.google.com (mail-dy1-f180.google.com [74.125.82.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 827963148A6
	for <linux-hwmon@vger.kernel.org>; Fri, 13 Mar 2026 16:43:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.82.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773420188; cv=none; b=f/VMAnoONfOKcYlMpoUbDapBvqIMaUdgROW2cHdAtACrhMSwD/L3k7s5tdB65IRqQ3x2dpBE/n6lyZdlduOgmhr2lnHh1/7toInjnegMjDwTGP4eCpToHTdfAuaOlD7lQwAW+wxbSJKBaLwHOHKfOQRmp5q8fP/T8vkLx3C3NOM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773420188; c=relaxed/simple;
	bh=zlRIgOImR/uumFdlR8WxrN+QalNMEfx8ZmyExUCB6tU=;
	h=Message-ID:Date:MIME-Version:Subject:To:References:From:
	 In-Reply-To:Content-Type; b=Zz4GZ7neDmFYap6pE/rLA7N1GA8wTdbDRdvfsPhBbdh8C4840677zMutaop15+r03AFUt2B1xodD26UJLJ7+XZtfxdr3Q17/BwdoGAHRhtUx/qKMYalqA1HvoKvywYVnNyc+r7w5NUZK/H/zT7NTe7TPp/cKLst8UYaXXpBVTqA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=dQvrPkds; arc=none smtp.client-ip=74.125.82.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="dQvrPkds"
Received: by mail-dy1-f180.google.com with SMTP id 5a478bee46e88-2ba895adfeaso2529656eec.0
        for <linux-hwmon@vger.kernel.org>; Fri, 13 Mar 2026 09:43:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1773420184; x=1774024984; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:to:subject:user-agent:mime-version:date
         :message-id:sender:from:to:cc:subject:date:message-id:reply-to;
        bh=LWpMleXeNGJbcRRb6cLG/z+cv1aNu0VX8WIE0+zW61k=;
        b=dQvrPkds1aj9/CkHk85Ob120lChJZkLMrNAp5Vqat7i1Rv5GYCT9pURblSnlvgsRg9
         L3FKaa9TbVQZvM9G4WklObIyxhCWh96cq9eQagHW49ThWv2jBXrRHXaip8/lCbbHNBGn
         eJdA57hl8W+W5bNW0msL/UR9chfPv3kFHi4vLhWDSIfC++AG91ykRjDpXvgtjA70Bxmp
         uRim3RhnOD9vT0lmQoTyMZ31uk2YJ2QHZw/rEMTTLVgTCE4Imn/BmpIbjalDEfqLoMBl
         q6k3SQddG2XZxf+5lt4oEpYr9DpBuhfv4dtvSNCcmOwZeIUut1lVDkaXb/wykeOB79gT
         6/6A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1773420184; x=1774024984;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:to:subject:user-agent:mime-version:date
         :message-id:sender:x-gm-gg:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to;
        bh=LWpMleXeNGJbcRRb6cLG/z+cv1aNu0VX8WIE0+zW61k=;
        b=Smwko4L8g+l9k+Spk/LZgpxd8pTP5GfDQ/sUumgPwGj4vm8KTCbJ94T8NRTZcKfnm1
         Ub0/9oiQbPPT5CbSPW04kRq0P+Kanhn73+csB8DBnXw1ilFihlUMhCSbErVojyimVx9Z
         wDm+6qvdiBwlIpl8L9i0OewhPLNd/ppGZxktmxij95kwFc3rQJwIchio5qZ28VXtXPo2
         k+GI2sTYKWYyGnkxorTLJBUqQAJSx2QOy7TR8bEfc8iw3nBWV7AEpvQf7RmdbTM2qDbf
         78JxPnWnt0pXq6q4d7q2/3cxnVWiQo9u4X7InHylvaUkjoMZOuRE+AOmVd1xbTwWtxJ6
         lSRA==
X-Forwarded-Encrypted: i=1; AJvYcCX4nHkDfVka7KQ2cP5rwprdkTmgx6vIUEPRWc5diSkt3Cson57vSyjU1e1r08lzw0poPS8A0FRjvmS3jw==@vger.kernel.org
X-Gm-Message-State: AOJu0YxHGGCuMPz9M3i593pkG48s92BwggYrTloRD6gtZ3kQRO6WPk2T
	IlMgAapyTcx0xT4GmOYDZVdt6kFZQO/lJFan4QRQvvXJeKEj67d6+O53
X-Gm-Gg: ATEYQzzg6ctly1QTBhBrXkaD7CthVHAAmvEOJfHL9cDfQCFyQ8x5mKRyv+ReZoAbWOR
	ISRpElFOFE/hH6xii5LaTaDvKGIatoQ9E7jxiRAj/2n2lK7zxRpViaGHojIhxh6xxmSyfcvAQsy
	nLWuviovYi8KaGyYGrDO6LM5iJuIk+wvilb+h3UXXTDV+BSdXVftncTT0/0y7okr9Z5O8sHbHKV
	XB58XgCyOA7UaAjndQHdvAFb+QkHTIEUpCznLwHutiOqIXBGG2aJ/ZZA9aIZKDoYaKVqYypQW2j
	vTpbfgGcaLT6+RJflwBC39JCneq+Jv7aiS6jx52K5o7t6cNtSpS2L7/8WHtKn9LShz0pmvzhs5O
	UoA6oOz1sk383orrnDlXWgAc4QvyBDiEpR70UeHfOuXEFKf/T2qdOjol3wJCy3fe9KESpkxlkVl
	tR9MDaGV8ZxPxURGtiPSKCqhLdzSbJhXn4zpktgvFgsbgz7nxTdINPbrsEYdnoOWiGfUGeOQTK
X-Received: by 2002:a05:7300:80c2:b0:2be:723:a9b0 with SMTP id 5a478bee46e88-2bea543ac63mr1642608eec.5.1773420184215;
        Fri, 13 Mar 2026 09:43:04 -0700 (PDT)
Received: from ?IPV6:2600:1700:e321:62f0:da43:aeff:fecc:bfd5? ([2600:1700:e321:62f0:da43:aeff:fecc:bfd5])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-2bead5a07d6sm2538877eec.27.2026.03.13.09.43.03
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 13 Mar 2026 09:43:03 -0700 (PDT)
Sender: Guenter Roeck <groeck7@gmail.com>
Message-ID: <97b6c751-0115-4d00-b212-352f37e5914d@roeck-us.net>
Date: Fri, 13 Mar 2026 09:43:02 -0700
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: Weird Dell SMM bug since 6.18
To: =?UTF-8?Q?Jan_Clau=C3=9Fen?= <jan.claussen10@web.de>,
 linux-hwmon@vger.kernel.org
References: <b476fdf2-1ce6-46ca-8c98-13e0ae1613b3@web.de>
Content-Language: en-US
From: Guenter Roeck <linux@roeck-us.net>
Autocrypt: addr=linux@roeck-us.net; keydata=
 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
 np3900V20aS7eD9K8GTU0TGC1pyz6IVJwIE=
In-Reply-To: <b476fdf2-1ce6-46ca-8c98-13e0ae1613b3@web.de>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

On 3/13/26 05:39, Jan Claußen wrote:
> Hi,
> 
> I've been experiencing a very weird bug since kernel 6.18 and had been staying on 6.12 LTS because of it over the last months. I am using the application coolercontrol to control the case fans on my old Dell Precision 5810. Here is some background https://gitlab.com/coolercontrol/coolercontrol/-/work_items/557
> 
> To be clear, I am not 100% sure if this is a bug in the kernel or in the in the application. I am not the only one experiencing it though and the maintainers of coolercontrol don't know what caused it either, so I am hoping for some help/advice here.
> 
> The issue:
> 
> Everything was fine on 6.17 and when 6.18 was released coolercontrol said it couldn't write the pwm attributes anymore. They were writable using echo though. After downgrading to 6.17 everything was fine again. I took the time to bisect the kernel from 6.17 to 6.18 and got the following result:
> 
> c050daf69f3edf72e274eaa321f663b1779c4391 is the first bad commit
> commit c050daf69f3edf72e274eaa321f663b1779c4391
> Merge: 989253cc46ff 8f2689f194b8
> Author: Linus Torvalds <torvalds@linux-foundation.org>
> Date:   Wed Oct 1 10:33:17 2025 -0700
> 
>      Merge tag 'pwm/for-6.18-rc1' of git://git.kernel.org/pub/scm/linux/kernel/git/ukleinek/linux
> 
>      Pull pwm updates from Uwe Kleine-König:
>       "The core highlights for this cycle are:
> 
>         - The pca9586 driver was converted to the waveform API
> 
>         - Waveform drivers automatically provide a gpio chip to make PWMs
>           usable as GPIOs (The pca9586 driver did that in a driver specific
>           implementation before)
> 
>        Otherwise it's the usual mix of fixes and device tree and driver
>        changes to support new hardware variants"
> 
>      * tag 'pwm/for-6.18-rc1' of git://git.kernel.org/pub/scm/linux/kernel/git/ukleinek/linux: (30 commits)
>        pwm: cros-ec: Avoid -Wflex-array-member-not-at-end warnings
>        dt-bindings: pwm: samsung: add exynos8890 compatible
>        dt-bindings: pwm: apple,s5l-fpwm: Add t6020-fpwm compatible
>        dt-bindings: pwm: nxp,lpc1850-sct-pwm: Minor whitespace cleanup in example
>        pwm: pca9586: Convert to waveform API
>        pwm: pca9685: Drop GPIO support
>        pwm: pca9685: Make use of register caching in regmap
>        pwm: pca9685: Use bulk write to atomicially update registers
>        pwm: pca9685: Don't disable hardware in .free()
>        pwm: Add the S32G support in the Freescale FTM driver
>        dt-bindings: pwm: fsl,vf610-ftm-pwm: Add compatible for s32g2 and s32g3
>        pwm: mediatek: Lock and cache clock rate
>        pwm: mediatek: Fix various issues in the .apply() callback
>        pwm: mediatek: Implement .get_state() callback
>        pwm: mediatek: Initialize clks when the hardware is enabled at probe time
>        pwm: mediatek: Rework parameters for clk helper function
>        pwm: mediatek: Introduce and use a few more register defines
>        pwm: mediatek: Simplify representation of channel offsets
>        pwm: tiecap: Document behaviour of hardware disable
>        pwm: Provide a gpio device for waveform drivers
>        ...
> 
>   Documentation/devicetree/bindings/pwm/apple,s5l-fpwm.yaml      |  3 +-
>   Documentation/devicetree/bindings/pwm/fsl,vf610-ftm-pwm.yaml   | 11 ++--
>   Documentation/devicetree/bindings/pwm/nxp,lpc1850-sct-pwm.yaml |  2 +-
>   Documentation/devicetree/bindings/pwm/pwm-samsung.yaml         |  1 +
>   Documentation/devicetree/bindings/timer/renesas,rz-mtu3.yaml   |  7 ++-
>   drivers/pwm/Kconfig                                            |  9 ++++
>   drivers/pwm/core.c                                             | 108 +++++++++++++++++++++++++++++++++-----
>   drivers/pwm/pwm-berlin.c                                       |  4 +-
>   drivers/pwm/pwm-cros-ec.c                                      | 10 ++--
>   drivers/pwm/pwm-fsl-ftm.c                                      | 35 ++++++++++++-
>   drivers/pwm/pwm-loongson.c                                     |  2 +-
>   drivers/pwm/pwm-mediatek.c                                     | 308 ++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++------------------------------
>   drivers/pwm/pwm-pca9685.c                                      | 515 ++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++-----------------------------------------------------------------------------------------------------------
>   drivers/pwm/pwm-tiecap.c                                       |  4 ++
>   drivers/pwm/pwm-tiehrpwm.c                                     | 154 ++++++++++++++++++++++--------------------------------
>   include/linux/pwm.h                                            |  3 ++
>   16 files changed, 661 insertions(+), 515 deletions(-)
> 
> This seemed like it could be it, as it's pwm-related, but nothing Dell-specific. One merge before though there was
> 
> 1c1658058c99 hwmon: (dell-smm) Add support for automatic fan mode
> 
> which could be related. Since the pwm_enable attribute was introduced in 6.18, I am suspecting it has something to do with it.
> 
> Now the weird part:
> 

I strongly suspect that the bisect is a red herring. I'd suggest to revert
commits fae00a7186cec and 1c1658058c99b and see if that makes a difference.

Thanks,
Guenter

