Received: from mail-pl1-f182.google.com (mail-pl1-f182.google.com [209.85.214.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 96A5315E5D4
	for <linux-hwmon@vger.kernel.org>; Tue,  7 Jan 2025 03:24:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736220300; cv=none; b=lcRVkbr+ZQOiVQnAP2lsPRZxJBibvoDl7eC6Chh3/0fvn4vaQ+ErYWIS0Ms+m2X8y6Sf4/M1zc8f3bT7HvWIc3uenOGdi9qcJHq2zVd0LnhneGWh0nfNPpV55Bu5UqCFXYA5KKZ3ncculkLuXKTWwQ7CDr/2DZK1J27FvQbEQZg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736220300; c=relaxed/simple;
	bh=4hSfvYCHSmzEmnmmCwUvxbN/VFw0ZCOLfVkD9JrTRAE=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=h/kQDmLkIs7ePFfK9Ap+YXj60X9D1sPBrUV5cKSobjOZim+lmgG0Y5Lh0+UfxoXEhjG2XB3Trlp3UnuIWzXVUzwBYAo1SnvymI+YnxQLxv4GXaTF9x4UI7/cZtVYRYSSgoe+qQr4PSg1q8twE49GRZEN0AhBcXjdrXhMAZ1bVE4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=bBGXWlxR; arc=none smtp.client-ip=209.85.214.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="bBGXWlxR"
Received: by mail-pl1-f182.google.com with SMTP id d9443c01a7336-21683192bf9so214797495ad.3
        for <linux-hwmon@vger.kernel.org>; Mon, 06 Jan 2025 19:24:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1736220297; x=1736825097; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:sender:from:to:cc:subject:date:message-id:reply-to;
        bh=ITnfaUxIYsREs4eeX4Th3Bv/+WSvf6YBNluNVrpT4xQ=;
        b=bBGXWlxRUwGu/KNl8s65FitKaT+SrOCOY06Xb244DJGMo5+cNY4q1Zpn9/63Cqa9Cg
         w8LtaqKI41eccAf8q1qnN0hSWsZ1M06DllmrlX8jw2NyrEGHlyIohXXoVdykjsgWjaj2
         hVRsGhWm/YlguwXHKHzMJ+KA7yW2BXYixRPWoxB1mhep8V6nLASUOw3pQdpYQAnM6vGI
         eWISbOU2/G5j973Xr8PvLwxvw6A7hT+dg6TG1XMA54a9q2aeVKpd3x9biYyRpUTdsaPO
         Dw+kgMKZVsXtcZwv3zZeW7hmaMUvMw+kx+f3QPoj8hKWX5tH3Lf4oMWrp8UwvAzB2LnJ
         yhhQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1736220297; x=1736825097;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:sender:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ITnfaUxIYsREs4eeX4Th3Bv/+WSvf6YBNluNVrpT4xQ=;
        b=wTcBGm8C1kcmuh+DbsMuc5Lm24LMEgncTumcUwjyjjijr0kwyOj++6Gx8jgKawDVB2
         f1SyuHwlKXZnR/4nbG+pO7hv9cPnqiZ/KtYHgWK/XVlCfN6jJi1QM1INDqKcpf24j4WP
         YnYCOXKuvzh+PhMOkKtbbxxEEoY/3nVxo2WuDvm6SvV59RD2wl9AX6ZqxaGR36asUPbN
         f28Ws0dRTJRqSTvm7mNLn+xv4lI5Epv+5Hs+rqfhT8nNdWOSQA9vHaf/X+lEh8sDyk1t
         xWuJuQDKCdvVy6FokYuGJogsnv+egp+XoLU8bwYghw0gYFQh4AjdSgzIbgI8NxoKaAjx
         Wrxw==
X-Gm-Message-State: AOJu0YwBudbql9EBPdHIS15Ca7xvcVugHudu2VHAL/WQT/Ebx4G9U+gx
	jDM17a4G96Jk5eXBnaxkQWWycDUX64X17330C459nbm9V/gzlXyT99iREA==
X-Gm-Gg: ASbGncucG0IPsGUt3qK/YH/yKysIbi/5cG172EQU/ccX9xEIAk3qWzAO/tdb/24D8NL
	UUzAR1os59Y4xk/5ytNkjmigk9wBMebF4vo95T5KwRvOAprCzrPqXreQ48fv3YVqc73cON7b+PA
	uTk0mZn4FIzl7lqg0l5MWwfOoChSBijdD6U9/+c1dJ8o7UcbRt0lvnw31JFwm0vb6cR29BAtDW9
	h0qJBS23dpydJvRfEvdjKyNP9o+Q7H/KwrAFQ1g9lPlpAjCYy4TS5Oe0+YTuzpcw7hKIVIqfb+0
	nd1oZiFdK5JauZqzYjYNuUk8LZuqnA==
X-Google-Smtp-Source: AGHT+IHIALqkOHRrDBVGWKBarmjSnuB9kz3tmasa9LAn0eV1hX2IJO2ssk/W6+KqtS47cfi4Wq9CrQ==
X-Received: by 2002:a17:903:230d:b0:20c:9821:69af with SMTP id d9443c01a7336-219e70c018cmr855872845ad.45.1736220296685;
        Mon, 06 Jan 2025 19:24:56 -0800 (PST)
Received: from ?IPV6:2600:1700:e321:62f0:da43:aeff:fecc:bfd5? ([2600:1700:e321:62f0:da43:aeff:fecc:bfd5])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-219dca02a8csm297377335ad.269.2025.01.06.19.24.55
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 06 Jan 2025 19:24:56 -0800 (PST)
Sender: Guenter Roeck <groeck7@gmail.com>
Message-ID: <7d830f09-aba8-4bff-9fc4-8f40113cb7af@roeck-us.net>
Date: Mon, 6 Jan 2025 19:24:54 -0800
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3] hwmon: (nct6683) Add another customer ID for MSI
To: John <therealgraysky@proton.me>
Cc: "linux-hwmon@vger.kernel.org" <linux-hwmon@vger.kernel.org>,
 Jean Delvare <jdelvare@suse.com>
References: <RHgpMv2vm9aouIOCtyVI2mjH9atCSSL2Zo7fO9QqQwapyOv1ATQhPQGgITlRHcXcEGY_PcyxUPmbXmbPlqCGyFgaEjhuPeaCGvWY4UdB1uA=@proton.me>
 <d6d10360-a2a4-4910-b3c3-80bf9d67383a@roeck-us.net>
 <zw2UJN123_RVNb7oaPDKfZjROMOGtEoLGZN9xK1Ha-p7Nqi-f2a682LoKaHhj498dDGqbuApHa5VYNWoB8GLlUhI4cAdj213hU95zEmzxPk=@proton.me>
 <KY1Lwa2kjE7V78ZKOvQv0IavCNAQXJMIL4LYAALEUI52yxCxzzucAifFH8Y1wRFUm38ZZsBvCM0poaJL6bIqnjS1tL1o9K-h_h5-JJAe2rk=@proton.me>
 <2dc31c52-2ca1-459c-8423-7d367d1619a6@roeck-us.net>
 <43w0nnxd04iDaHsiW0YhJOpdkr4W2DNlLQ1zRJOG0B_dd5se040WWEupLETO53QEyvVzQw88MgzWa5H-_X7TJGz3cZZPQBjtjWdLFnEBD4M=@proton.me>
Content-Language: en-US
From: Guenter Roeck <linux@roeck-us.net>
Autocrypt: addr=linux@roeck-us.net; keydata=
 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
 mDW4+i+XlNFUPUYMrIKi9joBhu18ssf5i5Q=
In-Reply-To: <43w0nnxd04iDaHsiW0YhJOpdkr4W2DNlLQ1zRJOG0B_dd5se040WWEupLETO53QEyvVzQw88MgzWa5H-_X7TJGz3cZZPQBjtjWdLFnEBD4M=@proton.me>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 1/6/25 17:17, John wrote:
> On Monday, January 6th, 2025 at 5:57 PM, Guenter Roeck <linux@roeck-us.net> wrote:
> 
>> More serious though is what checkpatch has to say:
>>
>> WARNING: From:/Signed-off-by: email address mismatch: 'From: John Audia therealgraysky@proton.me' != 'Signed-off-by: John Audia thereadgraysky@proton.me'
>>
>>
>> Notice "therealgraysky" vs. "thereadgraysky"
>> ^ ^
>>
>> This means I can't fix the problems myself (which I would have done
>> since I already spent way too much time on this).
> 
> Apologizes for the typo.
> 

Why didn't you send the e-mail below as patch, as would have been expected ?

Never mind, applied, after resolving conflicts and dropping the non-patch
part of the patch.

Guenter

