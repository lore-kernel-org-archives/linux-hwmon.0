Received: from mail-pf1-f170.google.com (mail-pf1-f170.google.com [209.85.210.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 58C6F206F14
	for <linux-hwmon@vger.kernel.org>; Mon, 16 Dec 2024 17:51:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1734371481; cv=none; b=lsLSfyYjkQMJfFtnnotBNdTZFp3CGLI77eX3lwKcJ2tYic+eVQdkg8oZSAU6lXc8viuint36flooLIZpSaWUlG6oSCcLyhIjSq93loEpW1en4hLBH1tF9/vQQSOamR7GPzboSYWQ3oXfQw/Pvvl7z4vffTatvVRHL/6ODuMYut0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1734371481; c=relaxed/simple;
	bh=mjZQ8rK+pUEXIUChPL+kvAmxmKeQ+x7/2IBXpHjsjvo=;
	h=Message-ID:Date:MIME-Version:Subject:To:References:From:
	 In-Reply-To:Content-Type; b=kLa1NqDSHNRq++F6mZpMf14XuA3qwjIG+B4POznBpuFlMo2y0rNtA/fZNBCpzODnfT0m8k8Rq19VJLbCGYw+wV1hkPMafxYTdJpG6Plhd9tAX4gPmYRBpUFFu8DosApjeE2SGL0L/r0m6DfJXu6bUB/JELysDC4LVXVoCb1wz7o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=kvxYPqVO; arc=none smtp.client-ip=209.85.210.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="kvxYPqVO"
Received: by mail-pf1-f170.google.com with SMTP id d2e1a72fcca58-728d1a2f180so3270527b3a.1
        for <linux-hwmon@vger.kernel.org>; Mon, 16 Dec 2024 09:51:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1734371478; x=1734976278; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:to:subject:user-agent:mime-version:date
         :message-id:sender:from:to:cc:subject:date:message-id:reply-to;
        bh=3YCQt2G8MPMcbpEhuKmdlLdgE7QDUSM0q9mZbt64Qgw=;
        b=kvxYPqVOGxDIt+p8iKcn314w11o5PZX+Gr3S7RivKi86TZOacwguoWW3bhEBtTXB1G
         QSN+GPY3XCCSRe/oBrD8N0cVu5JNba5kFP4SXLkUEttHXu6QycxUfmUG8aLPxYVIo04u
         LpvTuMeQbPn4OcJYV33k2V2XBgU4dw/yfiM94uf01H5Bh0cG5/u3CGhOFMblZRy5NhuU
         g8K8HYypZ9V+jG5Usf7ETY/zvUcaN8F0YsGIffyD9E6T5WdIUMEXu3LXv11D8qjT+cKG
         2X2a4Wf628Blv7j47eknyhPaDujxJeCoNPaNA2ggnnSx6nMVMMP0smHKdJ3zwxRT9to7
         HaDg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1734371478; x=1734976278;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:to:subject:user-agent:mime-version:date
         :message-id:sender:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=3YCQt2G8MPMcbpEhuKmdlLdgE7QDUSM0q9mZbt64Qgw=;
        b=w4GQ/arvP0PoedvK8xHTorNpAKPf7gOdbUPR8ED1YRKomCGTtTJHivcBBqH7KyPnun
         r3LJhUHDUHyHid4mLo4e0HC+G6dsuWM4o5JVGzUY3a7vXl6+99AppNH4doUMqBPenvq+
         Rr5UlYREzIer8JLpdLHCJ6AgTn4hKzxgHXlMiSXJRqpnPUbZU0seBiYJWyyuq4dCSdvG
         zAdmqoRu5HzpaZYgf0PrSUAEGousXFV/RnsmZeQL6Gq7H6cFbNUS1AC4PQeUoh25xkP3
         +9sFVheLwSaMl8ig07U+5kPtI+S1zfBbelf/qNwVS5u/T+iwHTWikkTGropnCr0tyHbO
         uyMw==
X-Forwarded-Encrypted: i=1; AJvYcCVhPk1NSDY2qhnFY6Irwbdl1XynbTPucYnTqesD3/10Z4FHwWJlDjojfiqgk77kPQaWRaMYigQ9OhxdpA==@vger.kernel.org
X-Gm-Message-State: AOJu0YwYA7Cg8gqOxUSHTycxuiguMPCXYU+MSg7eTkszYajSnGycvOiw
	ZV79BWmX3GR0t1zQY7SipttojqTQlC/VxqWNL/NSYfpCHmCqNL5WclFugQ==
X-Gm-Gg: ASbGncvI5bCN52NUWIBd6C89fvAlOPkSj0kQ9MuGB2VvA69CiavHrG/ax43IwyqdT2r
	qWKadGJnE7JfCutbATTPyKgI+Jja2GeBuxjUHQeB6LKiG9INeXuKGHfRlrQLHFj3xEefFEF/0F6
	h+Fu9ouwfhSi8zbuSOXEjgF2YZjfjkDwJPhih8A41wXpG135aSZGQnLoaXPBActM2hkWiTPkQS1
	B/PixnzNhlNixlXDXMmz1h40fmoo1rNmRyveiolGGVBtIW1uXCS84k1Tp+0LLFhxn+X5CBuokZ8
	W9bmwm1DRaEGAdR2u6B8enwR6pkxKg==
X-Google-Smtp-Source: AGHT+IHF0FxR/tSEhJ01BKMhngwVdqYXqPrDcMQ1Q4r1HbOqNjrSgLV/KM70mGrNhOvZr+YLax643A==
X-Received: by 2002:a05:6a00:1ad1:b0:728:f266:cb09 with SMTP id d2e1a72fcca58-72a787ef7c2mr247272b3a.13.1734371478606;
        Mon, 16 Dec 2024 09:51:18 -0800 (PST)
Received: from ?IPV6:2600:1700:e321:62f0:da43:aeff:fecc:bfd5? ([2600:1700:e321:62f0:da43:aeff:fecc:bfd5])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-72918bac570sm5019645b3a.131.2024.12.16.09.51.17
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 16 Dec 2024 09:51:17 -0800 (PST)
Sender: Guenter Roeck <groeck7@gmail.com>
Message-ID: <e036243c-912d-49a2-ae9a-52bc8c923352@roeck-us.net>
Date: Mon, 16 Dec 2024 09:51:16 -0800
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: Issue with Accessing All Temperatures on EMC1438 with emc1403
 Driver
To: fiona galla <fiona.ga92@gmail.com>, linux-hwmon@vger.kernel.org
References: <CALeoAQygKXoM4_Pq_5QDSaFWMK=Au-E5VOrp1UpdX3j_ucs2Hg@mail.gmail.com>
Content-Language: en-US
From: Guenter Roeck <linux@roeck-us.net>
Autocrypt: addr=linux@roeck-us.net; keydata=
 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
 mDW4+i+XlNFUPUYMrIKi9joBhu18ssf5i5Q=
In-Reply-To: <CALeoAQygKXoM4_Pq_5QDSaFWMK=Au-E5VOrp1UpdX3j_ucs2Hg@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

On 12/16/24 09:21, fiona galla wrote:
> Hello,
> 
> I am currently working with an EMC1438 temperature sensor using the
> `emc1403` driver.
> However, I am facing an issue where only 3 temperature sensors are
> being detected, while the sensor should report 8.
> Here is the Device Tree entry I’m currently using:
> 
> emc1438@4c { reg = <0x4c>; compatible = "microchip,emc1403"; };
> 

The compatible statement says it is an emc1403. That chip only has three
sensors. The driver works exactly as intended. Did you try the following ?
	compatible = "microchip,emc1408";

Guenter

