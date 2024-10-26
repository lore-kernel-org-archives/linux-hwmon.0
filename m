Received: from mail-pf1-f177.google.com (mail-pf1-f177.google.com [209.85.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 28A81168BE
	for <linux-hwmon@vger.kernel.org>; Sat, 26 Oct 2024 16:20:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.177
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729959619; cv=none; b=BvrP4RxpFm2Y7FxnxRFxWHvyyeRp/0SR/kmfoA8hXZGeOyxfLFOA1udwMH2Ci2yWqSf4kbhdYdmkAjtInjaYx2hmMyRgoeh54ZYBpLWqqXG2JxnbJKiBiXuQmoWSFa6zzNx6MsxkVLKJWIYv/9tZaeN+C0dePwQhBFrtPsbK5/Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729959619; c=relaxed/simple;
	bh=wtRJcT5QF70m4ZI8QH/V13/SVTqpd8GreuGIIKC3vj4=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=RfR3Zn6Datm2pt+rUU1HRHwlFeNrC86+iQ46HbbjRkwUMhBxNGk2au95JViZyN0fhLbjc4HL9aB2axs9LImpDdDH83wWQRdLMlLSrzptCxRQe3kbFmbE1NkaXOZ+2pMjcN6KtHz47G5wv5l+E3EU8LaC3ds8ew6+893tj7WSbPE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=CBFlxdhE; arc=none smtp.client-ip=209.85.210.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="CBFlxdhE"
Received: by mail-pf1-f177.google.com with SMTP id d2e1a72fcca58-71e467c3996so2241319b3a.2
        for <linux-hwmon@vger.kernel.org>; Sat, 26 Oct 2024 09:20:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1729959617; x=1730564417; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:sender:from:to:cc:subject:date:message-id:reply-to;
        bh=re6it7QNT5pvkhKgtFCJFOJQJhXl10l1Jg+uGFaA4mQ=;
        b=CBFlxdhEAVOKCFFCWlvvoOomBd+Ht2ZI0WnwHW7jQbe7P58yMkLRtgKf4YdT2LPVBB
         KedzdtmUZISTgowkzKDvOFKLZq2ZUZqu29+WhFLeBLYdRM9wAB+ZeFE0DZQjS+MD0frA
         7gy4DP8or6d3PkNJczZtFOhqBVH0hXkjQylYo64eO2bvq0jGjafBbYnN+cyeMioIZmaM
         j5ATWHSvgQpz9pE29PB69AFVIQ7NR3Z0NzYfd19BIcHUb3JCJ+X+i0Pjq8ZMaUQzT4Wy
         R1MSMH0RgGw/v+LMorEzNTaAQynpL1uWZIoImcbYzJiTFtJ0EZrbs37TDxOqiaw1Nt3v
         /8/A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1729959617; x=1730564417;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:sender:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=re6it7QNT5pvkhKgtFCJFOJQJhXl10l1Jg+uGFaA4mQ=;
        b=DNYNy8y6gA+jzQpuCQ1JqmsX4UpbSYWBFZqo6FO5fObMPz+3S6UC6+YNXjb24Hqn5T
         vrF+Pqz2k4iB/T/rJd/IhQeus8ISe/MXEu0JAtuhFifNphcVOdcQyCtLvBouapaK07/h
         xMG+gfe5NkAryfzcQWBPm81X1RSFmBSUz1RCGrT7XNOk19c1OufWxCRZ5ZQ/TKiB8G73
         wmqTYYqPl08fZ5B42FH58zaYtEDO5IfBFVCdk+ML9RzzhRbWH8IbkzjhYe2i0fRbBr/i
         ldG+GIa/uCpFtFa6Cs05qRl+lAcRScJZ4NVYFkQj61b2CdLlsIXsJCcwI0LgR/aDNqsY
         zLyA==
X-Gm-Message-State: AOJu0YwPewNX4hAaRYlrvw78czZjIMZFqjPhUrHG+j+7TaPVDZ/x5gyi
	63sPrUuVgVbiZvb10SvoYCQ2M0dwZEqaRY0yMiI05ClyOFy1rXRlPEoFWA==
X-Google-Smtp-Source: AGHT+IElUgAwC1bEre8uxWXxP7RP4LJUHgw/jEOGcDak88KMQH0/EOHz7SQVFUVm7sy1SMdaR6fwBw==
X-Received: by 2002:a05:6a20:cf84:b0:1d9:2a8:ce1e with SMTP id adf61e73a8af0-1d9a840d44dmr4370530637.30.1729959617367;
        Sat, 26 Oct 2024 09:20:17 -0700 (PDT)
Received: from ?IPV6:2600:1700:e321:62f0:329c:23ff:fee3:9d7c? ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-72057950457sm2979727b3a.95.2024.10.26.09.20.16
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 26 Oct 2024 09:20:16 -0700 (PDT)
Sender: Guenter Roeck <groeck7@gmail.com>
Message-ID: <b41d5ddf-757c-4e78-ace0-927e381d94c4@roeck-us.net>
Date: Sat, 26 Oct 2024 09:20:15 -0700
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/2] hwmon: (pwm-fan) add option to leave fan on shutdown
To: Akinobu Mita <akinobu.mita@gmail.com>,
 Billy Tsai <billy_tsai@aspeedtech.com>
Cc: "linux-hwmon@vger.kernel.org" <linux-hwmon@vger.kernel.org>,
 Rob Herring <robh+dt@kernel.org>,
 Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>
References: <20210923023448.4190-1-akinobu.mita@gmail.com>
 <20211011143421.GA2374570@roeck-us.net>
 <D056E665-7386-42E0-8A16-383B66FA3179@aspeedtech.com>
 <OSQPR06MB7252105381A0A3E8E7B80F6F8B4D2@OSQPR06MB7252.apcprd06.prod.outlook.com>
 <CAC5umyh8QXkUnqJFs4TK5YpvjSB7tJV3pFGv8ChsCbDfDS4zFA@mail.gmail.com>
Content-Language: en-US
From: Guenter Roeck <linux@roeck-us.net>
Autocrypt: addr=linux@roeck-us.net; keydata=
 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
 mDW4+i+XlNFUPUYMrIKi9joBhu18ssf5i5Q=
In-Reply-To: <CAC5umyh8QXkUnqJFs4TK5YpvjSB7tJV3pFGv8ChsCbDfDS4zFA@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 10/26/24 01:08, Akinobu Mita wrote:
> Hi Billy,
> 
> I have updated and resubmitted these patches. I don't have the hardware to test
> at the moment, so is it possible for you to test it?


You did not provide a change log. I do not review patch resubmissions
without change log.

Guenter

