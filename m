Received: from mail-wm1-f44.google.com (mail-wm1-f44.google.com [209.85.128.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B682D28D830
	for <linux-hwmon@vger.kernel.org>; Thu, 15 May 2025 09:12:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747300327; cv=none; b=cR13MNkivwbAsuC3rcakjbbEEVfyGE8E+6EfKd1x7h9pWpfkApiEabByWmmXxATV5M9E1haWt+sZLVZ0h7psDG+dijz0NsznAIXrPJf8VhDhoNtHLqsAoSAUOL3qW7vs+k80jFDeu8+cBydGgHZxYrAbXhcRVQAsrPCcimhL1WQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747300327; c=relaxed/simple;
	bh=Y8fh0ydbwDFuT4JP0Uktyo5VIuBqssqojenovaU59/E=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=ryuLYOj3RtpZ8P3f3WDNvrvaCbA7GamT25kg64XeT8LpsWtop24gxtF5pWbKdUnAW3xUeaXidIgCxC2npNEoaEmnyBdg4lUL/6/EErJkFWtiSYAjfHRZJutE4BC9la4/VpGICAPeOSxVwCwkInJMfjhvlmRmooUII2/oy3EU0n0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=jJv3vwR0; arc=none smtp.client-ip=209.85.128.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="jJv3vwR0"
Received: by mail-wm1-f44.google.com with SMTP id 5b1f17b1804b1-43ce71582e9so5315975e9.1
        for <linux-hwmon@vger.kernel.org>; Thu, 15 May 2025 02:12:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1747300322; x=1747905122; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=CAE9bz2isgxzUGbrKGqqEdeq1PEN+8OwnZGGftLgteU=;
        b=jJv3vwR0aSTmk0oZeJL61m/SKSS731rgOU+85WuPrAwyCrQspNh4lPIk3tIJKmWaYD
         u3zp9d2VeDqo/yRrfPqotiW+R5Jzvu+J386ew48fRkQOEiFKEXrwP05CHUgDflCFgS1S
         bAlh2Cvx1MXcvEE1v4ENNQGy0adlfxzQDXMJ4Ucug9W3v1FXX3STo9cpedj1XwgUII/f
         B4yO/3D0sP4PVAiDBL0iNqWf2eVVGdkauG/LMQkow1Ny/vU6jysg7uK17qJ+6ZyngIIo
         n59n+6/2j13DMfRym3MC6S/QwAmi+XuJb+TKLAxSZ8URqSJvFgdE7WTH4YGU9Z/VqDmz
         RO7A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747300322; x=1747905122;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=CAE9bz2isgxzUGbrKGqqEdeq1PEN+8OwnZGGftLgteU=;
        b=vHB7pVyR4MZPCVC6bpKqFhBOng+x1bociOmVLfRff9RkZF5H77OzDLQ1i4HZNM3+XN
         cXHiHqOZ1ki4dIV/J8nrvdNbF53YDqsYPPzHuMDtKZzAMNdnIZv9UraFe4fGrt0Pc0+p
         WoChqmn6tHq9WUXn1mozKWt90HDnXBUYmeZGqwB6SLW1Qe3EWYa1gbRAtrG6T5NVzzRv
         T+phgQdh2kQG5IYlkTQieIXHi86OaNpj3VBzYTz0AXfbQLuYjbFuXothhjjhl9L3YFkG
         a9R7OkRZpC59icsV7A6mo8AAHzDyNckWr7UqcFOSk73ClvxMU4e/0aH3wcBAuBx+D8SN
         dsnw==
X-Forwarded-Encrypted: i=1; AJvYcCUUctrdH+xRFXzZhcFtYxHaeDfXMWCjnBmIOIkXMmYtXHSCYcXcp/gnxkUYNtDHQPxaNgRnsqmesbQ9Xg==@vger.kernel.org
X-Gm-Message-State: AOJu0Yw5EXD0jjVSZ4B6XkHftyaMpe3g4+ydj9osYknasMe9OzKEmndZ
	THZKI07ibinvylhkZj9Z5PEaSd34bRFLxUBrSzWhCAg4qUgHu5SjXRHWSYBM8gU=
X-Gm-Gg: ASbGncsE9EeSo19v/qDtwPprUIHf+40keuE6PKEcWaHLm2jq8/tY7D57vi7W/so7HWi
	Ym1wpMVc8n3pUkZRuKDdA/XiCESzY5+HS2SjVQlryGTTH8cUZrneOhcmMvtygnObQgbfxFH7fJr
	BKWerL4YJ4g320GGiBoLrFf8sOfM7fJRzcBDNC+B04ILvHsOkUWXOUt4EWMfLaLj+DRAyrpjBV9
	czwGRDH90u/tTEsHHVY0nkGxxO8UYIqmb5S64Zqy3jXWX8ElBfk6oKRcTZ9S0gc1LyIhqN8ZYmg
	Dlm1hwIp+yFMxhMYV4p4Y6TE39cp5kBHYpLZ8JF61H3puz+FyaAbmJ3hQIb7J8u/d9uAZMwOcSm
	dmSxDMUgPwkU5
X-Google-Smtp-Source: AGHT+IEiWqZK+wIF0dIQPPNEPiVIMFChIw3pA6T9sTYgeSc0xYst5cv/piO7TsYycRsa/pH81nx0gg==
X-Received: by 2002:a05:600c:b91:b0:43c:f597:d589 with SMTP id 5b1f17b1804b1-442f2177567mr56412345e9.27.1747300321871;
        Thu, 15 May 2025 02:12:01 -0700 (PDT)
Received: from [192.168.2.1] (146725694.box.freepro.com. [130.180.211.218])
        by smtp.googlemail.com with ESMTPSA id ffacd0b85a97d-3a1f57de100sm21837759f8f.2.2025.05.15.02.11.57
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 15 May 2025 02:12:01 -0700 (PDT)
Message-ID: <726e96bd-d4c9-450b-9161-241f05d3d82f@linaro.org>
Date: Thu, 15 May 2025 11:11:56 +0200
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/9] dt-bindings: timer: Add Sophgo SG2044 ACLINT timer
To: Chen Wang <unicorn_wang@outlook.com>, Inochi Amaoto
 <inochiama@gmail.com>, Andi Shyti <andi.shyti@kernel.org>
Cc: Jean Delvare <jdelvare@suse.com>, Guenter Roeck <linux@roeck-us.net>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Thomas Gleixner <tglx@linutronix.de>,
 Paul Walmsley <paul.walmsley@sifive.com>,
 Samuel Holland <samuel.holland@sifive.com>,
 Ulf Hansson <ulf.hansson@linaro.org>, Philipp Zabel
 <p.zabel@pengutronix.de>, Palmer Dabbelt <palmer@dabbelt.com>,
 Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>,
 Thomas Bonnefille <thomas.bonnefille@bootlin.com>, ghost
 <2990955050@qq.com>, Jarkko Nikula <jarkko.nikula@linux.intel.com>,
 Jisheng Zhang <jszhang@kernel.org>, Chao Wei <chao.wei@sophgo.com>,
 linux-hwmon@vger.kernel.org, devicetree@vger.kernel.org,
 sophgo@lists.linux.dev, linux-kernel@vger.kernel.org,
 linux-i2c@vger.kernel.org, linux-riscv@lists.infradead.org,
 linux-mmc@vger.kernel.org, Yixun Lan <dlan@gentoo.org>,
 Longbin Li <looong.bin@gmail.com>
References: <20250407010616.749833-1-inochiama@gmail.com>
 <20250407010616.749833-2-inochiama@gmail.com>
 <aCSmNRTVXQ51xj0m@mai.linaro.org>
 <MA0P287MB2262A447A98778BF4BC3DB2BFE90A@MA0P287MB2262.INDP287.PROD.OUTLOOK.COM>
Content-Language: en-US
From: Daniel Lezcano <daniel.lezcano@linaro.org>
In-Reply-To: <MA0P287MB2262A447A98778BF4BC3DB2BFE90A@MA0P287MB2262.INDP287.PROD.OUTLOOK.COM>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

On 5/15/25 02:03, Chen Wang wrote:
> Hi, Daniel,
> 
> Just a kindly reminder. There is a v2 of this patcheset [1], and I see 
> [1/9] of v2 has been picked by Andi [2].
> 
> Please double check if anything wrong or conflicted.

Thanks for the heads up

I think it is ok, I have the right version in my tree.

If you want to double check, it is here:

https://git.linaro.org/plugins/gitiles/people/daniel.lezcano/linux/+/refs/heads/timers/drivers/next


> Link: https://lore.kernel.org/linux-riscv/20250413223507.46480-1- 
> inochiama@gmail.com/ [1]
> 
> Link: https://lore.kernel.org/linux-riscv/ 
> egkwz23tyr3psl3eaqhzdhmvxlufem5vqdlwvl4y6henyeazuz@ch3oflv4ekw7/ [2]
> 
> 
> On 2025/5/14 22:18, Daniel Lezcano wrote:
>> On Mon, Apr 07, 2025 at 09:06:06AM +0800, Inochi Amaoto wrote:
>>> Like SG2042, SG2044 implements an enhanced ACLINT, so add necessary
>>> compatible string for SG2044 SoC.
>>>
>>> Signed-off-by: Inochi Amaoto <inochiama@gmail.com>
>>> ---
>> Applied, thanks


-- 
<http://www.linaro.org/> Linaro.org │ Open source software for ARM SoCs

Follow Linaro:  <http://www.facebook.com/pages/Linaro> Facebook |
<http://twitter.com/#!/linaroorg> Twitter |
<http://www.linaro.org/linaro-blog/> Blog
