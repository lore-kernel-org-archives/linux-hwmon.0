Received: from mail-pl1-f175.google.com (mail-pl1-f175.google.com [209.85.214.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2C2DF1FF7B3
	for <linux-hwmon@vger.kernel.org>; Tue, 17 Mar 2026 05:28:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.175
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773725333; cv=none; b=aCP7L0nQNHwRrShZ/6KkrR+g8TvBMq19VPrEwbJG6pCqn4FlSP1A9ViqPAa7C9C//OxJZYsXvhCx/LOVN6i82wcmqfHtG7R/mEKNxepWwaqUUj2Oqo4CBJK4EWnjOzJ9a5qWxH3O91GnYvEU4zcNShDl4htI5CO3UC9KG9ZElKc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773725333; c=relaxed/simple;
	bh=nScpxODeeaDmRFiqGHfZ+cws/rxtXm+wxj293A4VYfY=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=J2x/DuPNWqTemGeaVFNN1Rd19ZXQniNaPh8vQ6KeDslzde5nNgojjuBdvQ1taC8XMivfQMb3+HBgeQL7PvUHPai6vqn8FH910hbh6HWZXfibTyQBChiiVNbd2EzmbOOPjgipD0nPvdzHgMF7bLuNWPJ3QDthofW/n0+Tbu3TPdI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=HDcVKxKY; arc=none smtp.client-ip=209.85.214.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="HDcVKxKY"
Received: by mail-pl1-f175.google.com with SMTP id d9443c01a7336-2ab077e3f32so24309005ad.3
        for <linux-hwmon@vger.kernel.org>; Mon, 16 Mar 2026 22:28:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1773725331; x=1774330131; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:sender:from:to:cc:subject:date:message-id:reply-to;
        bh=osx3bAS3mcUXt2PIll1X6+HGGkw0USDW8vZ3il3IQlo=;
        b=HDcVKxKY0XZzIv07fHjwWtmu+xDBNIgFnpiz20drGoGs0BM71tFDA7HxcRgKu/erKh
         1KZgeyZjAfpdBY0+G4qeyUqyBY7O7llb4xlxu85j7hKdM9Nv2z8aUPU+Dgz8A0dCWEXK
         7v0Y/RDMDoOZ6DMslDG6RnLEjmler5o4ZHud1E/2Q4hVAKU5VEMzOcOKAe4P1HTpM1st
         11GAOiEl5H4a68xA6k5V8QAnM62yCQPg4IZSqjFitXUQk48AbbqnC3/bDbNGKrmJFgr4
         +2/F1QY8Qm0x4Yvks8uuK4tT7pDq1Cc9oJgrk3tpeEuf0Vdv5RD3RjIknFxT9fPJaiXN
         pjBA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1773725331; x=1774330131;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:sender:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=osx3bAS3mcUXt2PIll1X6+HGGkw0USDW8vZ3il3IQlo=;
        b=dO2J63p2v3HpyyABzHtGxpc/gwjPiih9cpwcrzL1SjuedEtndjIvSF8SqJdxWDUwT0
         P1MP9fQakV6Vq5mPth+bvAwHTKbO77X34f/sN96ef1FXlZ9RlgO884WbhE2TdN6YKMjL
         RFPSAhrhifFFhy6aAhZ12MO1ZpTBV4yNfklpTjY3PnwpP2uIR+zozZ6LPeaujR0TVqWH
         +jhdNY2BHOshYhmbwF5Bgb0iR2KkzmpeZpD78iLzoenyXSqL/7SVujHbEgIMM8QQfibJ
         j4oYnA4HwTi3MC6c/EHMKobXMFnQr8mj0QTtluxxR0rkiq5BuTCSPrzxQsv8KW+JFDXO
         ORUg==
X-Gm-Message-State: AOJu0YzhW/RS2c5vs9WczHOmBXC4E1lb4237rIHAlPkjKCFyMwhMGKEe
	q8wUU9ctXoipjf65vzEX33beZDXULE7a9/Eo8S8mipfmQKx5esXQ3rwO
X-Gm-Gg: ATEYQzzmMPYeGVPx8xU5fryqywofR9oEH+g8d36AWMLjSLaLtJ5apwWZ6RyDqtWV6d0
	o7+ubbJEQEiNZn0zQ3OfemXBdbfPFVSeCtk7p19V58GAMCH5ZsvPLgAgdc2rOeTvfzo1TKc32hb
	FkV9rSxw1LyeYJzB59BNtCK+a4tAIuRLHM2YKZVnAawCnssPka0D0MvG7bdF99rlxrUaE8ZKH68
	rSQLn66Qv5z0g8U7MsQ8B01YPDHGqKvy67wRLXxSnOz6y5CGdVkI6MvPE1bV+16GGCAELRmfPlj
	RCG1VLaefKfMj/wbmiTwWpRPRS6nTi09iLCc4lwbIx/TOYjqZog+2H4vYXudw4j5u9YR8PvFrzZ
	aTU5lBKem7olUZxvbWWHJMzvUiTwNzKvaJ8smujT7NgG3vPds8iKEqktzj98HsGfmXwlWdmucgP
	CW1/bWlLtPuxCT+ANWpJ3yv7nzdW/NeMaFiUSjzk55NPFJsE+kxFdNqBg4XHvIqz5SPLR8c352
X-Received: by 2002:a17:903:2c07:b0:2ae:7f9b:3148 with SMTP id d9443c01a7336-2aecaa091e7mr163810085ad.14.1773725331564;
        Mon, 16 Mar 2026 22:28:51 -0700 (PDT)
Received: from ?IPV6:2600:1700:e321:62f0:da43:aeff:fecc:bfd5? ([2600:1700:e321:62f0:da43:aeff:fecc:bfd5])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2aece8363b4sm125984925ad.76.2026.03.16.22.28.50
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 16 Mar 2026 22:28:51 -0700 (PDT)
Sender: Guenter Roeck <groeck7@gmail.com>
Message-ID: <428c3b91-1c9d-45ee-b980-4f3f1da50033@roeck-us.net>
Date: Mon, 16 Mar 2026 22:28:50 -0700
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] hwmon: add driver for ARCTIC Fan Controller
To: Aureo Serrano <aureo.serrano@arctic.de>,
 =?UTF-8?Q?Thomas_Wei=C3=9Fschuh?= <linux@weissschuh.net>
Cc: "linux-hwmon@vger.kernel.org" <linux-hwmon@vger.kernel.org>,
 Jonathan Corbet <corbet@lwn.net>, Shuah Khan <skhan@linuxfoundation.org>,
 "linux-doc@vger.kernel.org" <linux-doc@vger.kernel.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
References: <c6d6c506-1407-4676-b730-f9fff595bb75@roeck-us.net>
 <20260313111955.36811-1-aureo.serrano@arctic.de>
 <a3c4d461-c2b7-451d-b140-6d759da6f30c@t-8ch.de>
 <FR6P281MB59004A7AB7FC97402E5897A8EF41A@FR6P281MB5900.DEUP281.PROD.OUTLOOK.COM>
Content-Language: en-US
From: Guenter Roeck <linux@roeck-us.net>
Autocrypt: addr=linux@roeck-us.net; keydata=
 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
 np3900V20aS7eD9K8GTU0TGC1pyz6IVJwIE=
In-Reply-To: <FR6P281MB59004A7AB7FC97402E5897A8EF41A@FR6P281MB5900.DEUP281.PROD.OUTLOOK.COM>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

On 3/16/26 21:21, Aureo Serrano wrote:
> On 2026-03-13 18:41:38+0100, Thomas Weißschuh wrote:
>>> +#define ARCTIC_ACK_TIMEOUT_MS	1000
>>
>> One second is a very long time. How long does the device take in
>> practice?
> 
> Measured over 500 iterations: min ~32 ms, average ~100 ms, max ~563 ms.
> The latency is a characteristic of the device firmware and cannot be
> changed at this stage. I can change ARCTIC_ACK_TIMEOUT_MS from 1000 to 700.
> Does it work for you?
> 

Since you measured more than 500 ms, I'd suggest to keep the one-second timeout
and add a note saying that 563ms was observed. Twice the observed value doesn't
seem extreme to me.

Thanks,
Guenter

>>> +	memset(buf + 11, 0, ARCTIC_REPORT_LEN - 11);
>>
>> The magic '11' should be '1 + ARCTIC_NUM_FANS'.
>> Or even easier, use kzalloc() above.
> 
> Since the buffer is now struct-embedded and devm_kzalloc zeroes the struct
> at allocation, bytes 11-31 are always zero and the memset is not needed at
> all. This also addresses the suggestion from another reviewer to use a
> single once-allocated buffer rather than allocating per write. Hope that is
> acceptable.

