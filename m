Received: from mail-pj1-f45.google.com (mail-pj1-f45.google.com [209.85.216.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5787D3E1736
	for <linux-hwmon@vger.kernel.org>; Mon,  6 Jul 2026 20:29:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783369761; cv=none; b=MNt1UdROzyW614PFFxWkW3OaaFQipFy4OpqPyQPZW+LDvfePLh/ktF7YrsVMaTvmnJcC5vxkOJ7FyAMLuTU5j+VfpIeyFwwlWE0gLLQKtn0kD73/iwV9nt3PT/Lgu7V5w/xj29o2ZdBQctyLrY3nHAknH0TzXlKtCN/jkEXx8qg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783369761; c=relaxed/simple;
	bh=EWt7Xw8i5er8L57sSWKIPvuUtJg3JkhI0SqTFLFQA/0=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=dJnpJsZXduuFGPObQ92ssDSZNhNokRdg4rOu81QpJgeKmRLwfc6r7M43TeS6eXohaoeOSjbKnHh+N9D2zfX+4pxeRTH+7DEdwYI0qc/I5YBZRBaUuoRSfRIStDIBD6vihRpyRpZgIIUzs/s4gcqnIE9vgsQJDEG3HyTlkUs8pbc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Z6gMYnoF; arc=none smtp.client-ip=209.85.216.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Z6gMYnoF"
Received: by mail-pj1-f45.google.com with SMTP id 98e67ed59e1d1-381065a7a03so2586423a91.0
        for <linux-hwmon@vger.kernel.org>; Mon, 06 Jul 2026 13:29:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1783369760; x=1783974560; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:sender:from:to:cc:subject:date:message-id:reply-to;
        bh=xEDRYa0lpUIE9ZNDwBmwRPPgmsNF+mpXNTUYjy+B2Ik=;
        b=Z6gMYnoFn6V0an+1yhUcTwnMh47hCpPXKmcHb3rdGYVxnWQl1SEAxg5m3zHQnjQEn3
         Jmane7AmOtNoKJPbN2QfoGrV3hfUs1Cr7qRLgS0CzSoVrOHe8dco+J02BWO1uaRxZjQ6
         4XxyeMMTXbTBLla1bOoJpqWfjl8L1WS5h7YRnrpTlOIelOpxXsWRrn47psnEBSocQU1z
         w4wnfGX7NRKLUzxw3OAxTlAaQGBN/8GqueEsWbP7NyR9jDRBxGiZnLogPPkAkkFer4dl
         P/KcWwsnl639s5m/FYMqk5hquqUW+boM4e3JpgnwXsmr7CDikQd7Sc8/ntJya9vM2TT2
         HAGg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783369760; x=1783974560;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:sender:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=xEDRYa0lpUIE9ZNDwBmwRPPgmsNF+mpXNTUYjy+B2Ik=;
        b=b0H31k36dIauGJVG8Zd6mddpQcc4K/12SvfWXeaflON+wtf72wYhy3kElR6Iff/F8U
         Y5hoIaRsUS5zj2ZPU/zuvI15Wp6p5pnF/FJA/OHOy4iOJISQ1g2SFJHYVAJQ1nKAT3tL
         lhuVAWKz+enes9XMogr/wnZeN1yXcf7SHgUhY4mBR63x8dlLErw7jPvgzr4qntTmXWHm
         T4KOZrMOX6n97HJU5YoYlwcXKkNJvZxhN/COOXOmHv1tru6z95kTgZWkCQAH5wl40/n7
         oVcej7uBHAqSaZrJmxkHoHVOEOKjudDRQwwCojVf9bfLC5nLrJH2iRMkSL3KCqByMwJ8
         kjSA==
X-Forwarded-Encrypted: i=1; AHgh+RqYs1KVsGOjfhe8yiQ9d+lFU+GubTSCnUZPzNc5yUTXOXHwX+LCXyPBEdt7OwbFWsWqkdfRAVJDRuxrHg==@vger.kernel.org
X-Gm-Message-State: AOJu0Yz3MkC/N0dScRTKEJ5oAmc39X/xqiM1qS8GjSafXcFnwcT7B+5l
	raCHp4bafEvg0cY429l2yn4sZ379O/p4VtjL5rT6soNb25PpMFq+xk4W
X-Gm-Gg: AfdE7cm4QVcdNij3jhtn0YG57WJGp2U9rgl1hDtmKu6sSO5GlPzio0BoFUbDctl+S+N
	6c4R/zBbzXQoLI/nrWfGvSf5wF+jEKkDFNJMHSr95Q5D8XpfSSCbXOAm6KsRWj5EKAXCIf8Da2T
	3N+/lynd+J83f8ln8ysIhKVH4C9+pw3vq389ZgdQ+oZc6BUKbJVzUOmGX/RuQtyiZnitzpKHWpk
	N3a1/uuHVaVjoQJM6mfpsT9V0gDv/Xa607gT2ARqT0B6v577RYG1rBkOjYSrRa8Thh4omr/GwuG
	zh/qoCGrQV5KFN3Yg9nQx6MJ2BKWfSGkP3lIO+wPSoxPDg6VBeCsj+97L/2ixu+krGByeHeiJXU
	IsAnlQuBXLH0MON98gUg/mk9JnbIqBzxs5zK3YIU6fxua4/qYTQ6SlnRCbv5foEJEaz5ebcIFd6
	8/7sjUlOndl9UTTSy9JPT3C0blFjVQRc4541tay2r9H84eS0lVipWh2qZFPkibgQ==
X-Received: by 2002:a17:90b:3f45:b0:37f:eb45:e058 with SMTP id 98e67ed59e1d1-38756dd6b57mr1958436a91.19.1783369759594;
        Mon, 06 Jul 2026 13:29:19 -0700 (PDT)
Received: from ?IPV6:2600:1700:e321:62f0:da43:aeff:fecc:bfd5? ([2600:1700:e321:62f0:da43:aeff:fecc:bfd5])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-31174ac0557sm110156eec.26.2026.07.06.13.29.18
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 06 Jul 2026 13:29:19 -0700 (PDT)
Sender: Guenter Roeck <groeck7@gmail.com>
Message-ID: <192effa2-3d53-4708-9857-f00cba9c2b8a@roeck-us.net>
Date: Mon, 6 Jul 2026 13:29:17 -0700
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] hwmon: emc2103: use min_t() for explicit type in fan
 target clamp
To: David Laight <david.laight.linux@gmail.com>,
 Animesh Rai <animeshrai853@gmail.com>
Cc: steve.glendinning@shawell.net, linux-hwmon@vger.kernel.org,
 linux-kernel@vger.kernel.org
References: <20260706162519.6087-1-animeshrai853@gmail.com>
 <20260706205708.1da4fc75@pumpkin>
Content-Language: en-US
From: Guenter Roeck <linux@roeck-us.net>
Autocrypt: addr=linux@roeck-us.net; keydata=
 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
 np3900V20aS7eD9K8GTU0TGC1pyz6IVJwIE=
In-Reply-To: <20260706205708.1da4fc75@pumpkin>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 7/6/26 12:57, David Laight wrote:
> On Mon,  6 Jul 2026 21:55:19 +0530
> Animesh Rai <animeshrai853@gmail.com> wrote:
> 
>> Using min() with an explicit cast on one operand is fragile. Replace
>> with min_t(u16, ...) to make the intended comparison type explicit and
>> avoid implicit type conversion.
> 
> min_t() is worse than having a cast on the argument to min().
> It just casts both arguments to the specified type.
> If you'd tried you's have found you could have just deleted the cast.
> But why is new_target u16, it could just be 'unsigned int'.
> That saves a load of masking instructions.
> Were old_div 9 and new_div 1 the rescale could overflow 16 bits,
> overflowing 32 is much less likely.
> (The surrounding code may make the overflow impossible...)
> 
> If the code even right?
> It ignores values 0x1fe0 to 0x1fff (assuming the high bits can't
> be set) so they must be 'special' in some way, but doesn't stop the
> same 'special' values being generated when rescaled.
> 

No, it isn't, as reported by Sashiko. So the patch does not improve
anything while at the same time ignoring the real problems in the
driver.

Guenter

