Received: from mail-pg1-f170.google.com (mail-pg1-f170.google.com [209.85.215.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EA37C3659EF
	for <linux-hwmon@vger.kernel.org>; Wed,  4 Mar 2026 05:39:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772602758; cv=none; b=iH4JdyxyqKuUA/GMefFN0mPhpHnJcveaHBlnGB4YjBVn48ZFV+W5Hpslj10/YaZA0KkE2ks7V428ddxGTxrHZSsOHFoagpiDe4+rareHA7L2Alaj04xVVK+0ZnASWLkm1vNUvPkfWih/hqAYU20bqddJe8Mp3HFr692dmk+jB1g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772602758; c=relaxed/simple;
	bh=obFDts6KAak+x+mDVDgOJZFvbyX6/8GNkVp74d7oXlg=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=l6hb1fDanhIaKsfNTiNl0hcQaw3VkRQsQxaffpYZBQTN29HywUCfuohzgbgEH3lqSWeF5HB9ejDw96vQF0vgphvB3nf6EWKEhdx9g1DihjTvYTtDi5OU1ahvg3YHMt/C7KBTB3v1xSLGYxMap9y2rytuI2GOv3GQOFVw660MqKE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=QDR2gxWB; arc=none smtp.client-ip=209.85.215.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="QDR2gxWB"
Received: by mail-pg1-f170.google.com with SMTP id 41be03b00d2f7-c7382731edfso9596a12.1
        for <linux-hwmon@vger.kernel.org>; Tue, 03 Mar 2026 21:39:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1772602756; x=1773207556; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:sender:from:to:cc:subject:date:message-id:reply-to;
        bh=BhYImUAX853r2j1c8xMoNjA0OXH8nXsVJifQJFiO9cs=;
        b=QDR2gxWBUeyIC8e7jUQxZNUg+xwIaqEVZGgYqGHmGzAnOEdxztacB+1OzZ1bRGQEHA
         VPMxfGmn0jn/qf+HrXncmTVjT/gbsVNJ0LCWnvPlI+lI8aPRmYqP+iwlH0525UcE2JU8
         mETPB3ZMgf4MhkwZ26e6Dj2XbpL/fHAFfeOP3U2h9OjHwo9Vb3krYgtJ5+m8V0Xww0ub
         zQILqvfWblv2PgIfEdjjliNT8XR7FBh/MjjgCmMLwumPwIxtzE2rivJwZ4dS7ydsfZgX
         SRjqfTnvTekJQjK8JJHE8+n5pSdjkt3q2pulj50++E3lDA967Q3y1mw8X/bZJCAaI0yK
         aZkQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772602756; x=1773207556;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:sender:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=BhYImUAX853r2j1c8xMoNjA0OXH8nXsVJifQJFiO9cs=;
        b=PW1R9nLCc/C/Q7Onu8WIBtcxgWX0vQdVKgNIUsK64EktxDnVrqu9SgNmN4oQL5+QgQ
         4lQuwEPKvYfTo6MO7hdn+JzfxZMRquYmGAxxFsUSJorHCfFOmBFbyn7Hh6R5eJ5etaSf
         TUrH/BQF2hIAEDoHSI6vE9WVpwqJhhhOxmlbfrJKdFhiG09ZikBpcbPePmWQL0gNYGpv
         j0odFdFdKzG1cFuvDW+RBhowJbwQxb0x+GPNvFM6lm4u+rcFl6H1WHO+d+MLTrCAh0tM
         nE0yHBqF4CavaIzxOoUYa/cKftxVPKEBn6prwY5L/3/ROXxx6UohwaTF9t0JWEUnVNHM
         Q9sQ==
X-Forwarded-Encrypted: i=1; AJvYcCXsENGynNj1qBiC+miVM4Lfqc2WBMhsSmrDpqjPCz+ZrBiE4Sy8+zno9x7msk0/fAYf1ifoG0xAS/PqOg==@vger.kernel.org
X-Gm-Message-State: AOJu0YzGk4FF5jPqqie/XpdvIBs+TqAa1K2GlPgYa+gYAm0xXGZG8YoC
	zqpMHR1dz5JeqtSdze/FJs07Rl8/bppXgycvo6JplydMmaBuwvf+sZ+SEkdjyNn4
X-Gm-Gg: ATEYQzxocBGsOz727yuzZjuWZzyo4ul/qhwUUVE73DfN2kFzmwOS4nUfFd5nQktBHSr
	d8XtFHjD5nyN7IBVc0CkrPXrajRb6yiJEUkgk1yyV3gRY0utirHXE4yqsQErwfnA0NsGyABdMqR
	xXe261ccMhcqAawcYeyFsB6O43N6pLglk19ezitmMO7qXXpOMbNr2jLqukRkdiV6sHlVTy2YGk+
	Fk17SaSCR0iv+nmd+nXbGyPisxmPJt2TnMd+uCldJGGEgPuLc6Mov5Ie0JqZka/v6fTxZ7tiftl
	fQBS4uMQBrtqKcK83c0gimM+IIGMoaIIUi5XrrfR1/TSrM0iliyVksqYW4ItrLhh5XzEXFmY9Yp
	xj34f+79p83qba8lqnDi5OEBJnB9yOKQ79hMkx86Z/WrhxxYXXG+oiPoip5v7u88PlfbToAoIo5
	ewOTttg70y03BH7lzY/b+4urLxH7tSH2fcji8or8nP9lVuqIGxwm3NhWUDTg9RPilFwdKf8cpq
X-Received: by 2002:a17:903:1ce:b0:2ae:51bb:9809 with SMTP id d9443c01a7336-2ae6aae9514mr11617505ad.36.1772602756225;
        Tue, 03 Mar 2026 21:39:16 -0800 (PST)
Received: from ?IPV6:2600:1700:e321:62f0:da43:aeff:fecc:bfd5? ([2600:1700:e321:62f0:da43:aeff:fecc:bfd5])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2adfb69f996sm179970595ad.50.2026.03.03.21.39.13
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 03 Mar 2026 21:39:14 -0800 (PST)
Sender: Guenter Roeck <groeck7@gmail.com>
Message-ID: <dc013e02-c555-4769-9725-31cac353fd4b@roeck-us.net>
Date: Tue, 3 Mar 2026 21:39:12 -0800
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] hwmon: (pmbus/q54sj108a2) fix stack overflow in debugfs
 read
To: Sanman Pradhan <psanman@juniper.net>,
 Andrew Morton <akpm@linux-foundation.org>,
 Randy Dunlap <rdunlap@infradead.org>,
 Andy Shevchenko <andriy.shevchenko@intel.com>,
 "linux-hwmon@vger.kernel.org" <linux-hwmon@vger.kernel.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Cc: "Pradhan, Sanman" <sanman.pradhan@hpe.com>
References: <SA1PR05MB8708FB8CDA1A57DE77D158A7BA7CA@SA1PR05MB8708.namprd05.prod.outlook.com>
Content-Language: en-US
From: Guenter Roeck <linux@roeck-us.net>
Autocrypt: addr=linux@roeck-us.net; keydata=
 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
 np3900V20aS7eD9K8GTU0TGC1pyz6IVJwIE=
In-Reply-To: <SA1PR05MB8708FB8CDA1A57DE77D158A7BA7CA@SA1PR05MB8708.namprd05.prod.outlook.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 3/3/26 17:00, Sanman Pradhan wrote:
>  From 166d8a9220dc783b752cb212937a31e6e1adc811 Mon Sep 17 00:00:00 2001
> From: Sanman Pradhan <psanman@juniper.net>
> Date: Tue, 3 Mar 2026 16:22:08 -0800
> Subject: [PATCH] hwmon: (pmbus/q54sj108a2) fix stack overflow in debugfs read
> 
> The q54sj108a2_debugfs_read function suffers from a stack buffer overflow
> due to incorrect arguments passed to bin2hex(). The function currently
> passes 'data' as the destination and 'data_char' as the source.
> 
> Because bin2hex() converts each input byte into two hex characters, a
> 32-byte block read results in 64 bytes of output. Since 'data' is only
> 34 bytes (I2C_SMBUS_BLOCK_MAX + 2), this writes 30 bytes past the end
> of the buffer onto the stack.
> 
> Additionally, the arguments were swapped: it was reading from the
> zero-initialized 'data_char' and writing to 'data', resulting in
> all-zero output regardless of the actual I2C read.
> 
> Fix this by:
> 1. Expanding 'data_char' to 66 bytes to safely hold the hex output.
> 2. Correcting the bin2hex() argument order and using the actual read count.
> 3. Using a pointer to select the correct output buffer for the final
>     simple_read_from_buffer call.
> 
> Fixes: d014538aa385 ("hwmon: (pmbus) Driver for Delta power supplies Q54SJ108A2")
> Cc: stable@vger.kernel.org
> Signed-off-by: Sanman Pradhan <psanman@juniper.net>

This patch does not apply.

ERROR: patch seems to be corrupt (line wrapped?)
#235: FILE: drivers/hwmon/pmbus/q54sj108a2.c:78:
	int idx = *idxp;

Guenter

