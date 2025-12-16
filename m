Received: from mail-pl1-f171.google.com (mail-pl1-f171.google.com [209.85.214.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 829D433A036
	for <linux-hwmon@vger.kernel.org>; Tue, 16 Dec 2025 09:46:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765878364; cv=none; b=NbCvWaNNrjBnozGQo7QtQAWQ+V8T79RckPf9op+hz3NueEQrZ3mHvQ3XW6m8c0SDyoyWBsrKMXlKfjVpIFSX2OJeGIZfeJZLUBsvI2UMw5KLTa4ZBE+4mm37JrYpaMuIUh6H8zqRVK1x9Rih2JNCqaBMQ5JGC+uj0oP5w+q5+Og=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765878364; c=relaxed/simple;
	bh=EAiYbw4WyMor4FXjwHkuVOsZqKsHvzMU5iwpf/bs4Jg=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=orqEc670035Xwl4KXsE4DLxkuR+Fj1icM9CdwkGuJ4s9RWwGet9TZwAqGn+I7F+PKqng2XCxwtqPylpHruKeUf277oA0X4aFluWk23SRopKWKvpoUAIKeHGIaYtlKlNVawYoL3ihjZ4dx8dVD3/1ulBLLMCFZ8zqGRG6cUB+R5A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=U9oAdpBY; arc=none smtp.client-ip=209.85.214.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="U9oAdpBY"
Received: by mail-pl1-f171.google.com with SMTP id d9443c01a7336-2a09757004cso33768885ad.3
        for <linux-hwmon@vger.kernel.org>; Tue, 16 Dec 2025 01:46:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1765878362; x=1766483162; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:sender:from:to:cc:subject:date:message-id:reply-to;
        bh=rAETedq3CiImREQzgcFlRHq/EHpa05ubN3d8W7ARWMs=;
        b=U9oAdpBYKgqqSsgOKN/0e2AgD5E6/KV4VG6QikSDSiIMQlzHqD6LP7XJdtA2+QFzrP
         FpymPxRBOI/d2ZpTDUkMzYR8xhO9KJy7Gr4oeY6aIIx+Z5C2S9nZMTmrDErsC89TBG1J
         hrVe11d3EsxhK3CLaRFdFuPSQO4pdVCDdZPKuXExi5aGd28Ye5Xp00lXkuduWbDLDqu6
         gTvBLWxwSfYQM6m6QLDtvNrAlMQ7kE1eT6cgo/AQLcth+NsgcvrcfB6haGIHfr1c2Qw2
         X11CSXLddtCoe8NSSnNMJcxMH/YOtpLn9e2cu0TBsaZbQlfi6aAySnG/ZT683J2sxJYx
         Xwng==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1765878362; x=1766483162;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:sender:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=rAETedq3CiImREQzgcFlRHq/EHpa05ubN3d8W7ARWMs=;
        b=K8yKhUD9JUrW3DQk+exifiCUOPla5qGxblKID95+cEKzbasFbHcIYY6rkvTL86ygPp
         50ldSzHZqg/4Y6lEaL2/KYsavOylUNxmupHTManf0Nn+5tfqEUk4XMYfH+uoULJCJWl5
         OdQfQcl2iFbnjGIW0KiJP3jOPLW1kuGlatR+AyT1Z0IoOEUqQUW/IYtl9ibfvKp6hwkH
         Oy2Sy1zfeajwtc4JQoihY+jSeYytKpS6v6Kj334Kr7j1brHn4KVPhHKu0zd/ware4bVl
         2LL8odHobBl1IcjHnbfr8nA6wN7dwY+aRtZcwXJqv2S3CcoKGuY+9y3iF0xX3vfJsp3d
         0Vmg==
X-Forwarded-Encrypted: i=1; AJvYcCWS6YQnhoy8IRYAG6ibAIaXlgQmSuhK1kejoRzUyvpSmRDvPLCJGIev48yCqZQ/NfJuM9eAbN/fFgoN4Q==@vger.kernel.org
X-Gm-Message-State: AOJu0YyRItWjT6e49+dJD9sGBzkVPlv73T/3a4R3XlO/UK78EHaqQUaZ
	j51IU+rnyGC1fEwwmWTev8fV5DQ4EmHVthXh3ScUTML5y0umx8hA4O49
X-Gm-Gg: AY/fxX4Yz8JH1RyTpbDVdsT8nYg53wq0YmYuf9fjvsaOYnMIzlwGFEiphSVI0LoScpo
	yAJysLk1vHkRBgOg/1NLYVY3irqAnSSN1LYqxU26of+8KqwhoImtUdAEUCmdqK53StlSCYOx/SC
	TtVEiUlTl1/H8OriX8MsgEZxBGryGaylQOZffa+fKIGzoDq5adX0tMfE1hiXTPdFCWBuIvZXKNZ
	bRNQroPHgNln27gd4bIHoyp91UfYYDbASJXJ/pIS1Ud3bRd84Ey3blCKeL9kVwSRM4gYTSZitlT
	4h7mO54SibCtYVmR08GcfTQyhF6KYOtTCr2zfIumq9nVkIOjyugClJRsDDoQsasMplCJMpiNlXR
	bC/1g3fd6O/GaaFv9vjBu/hdrBKl4yTHa/E7iv1B3088HAJWo3Ji9YHGIuVS+oEx2LHh7kxHe5M
	m2Qt9VrX2vLtp2PCIgw6KEVyksL6vFJl6anpcMBn+RykSZ9j/XvDAgJO9TNlu45Fzu2/+8hUQ=
X-Google-Smtp-Source: AGHT+IHHvVDhH7//NYZQZvYd4lFteU36oqFbLz2pEOppKYSpOJFZniQIKmUDEToL173aivtEOcFLbA==
X-Received: by 2002:a05:7022:f316:b0:11b:9386:a37e with SMTP id a92af1059eb24-11f34c49e5emr9677618c88.45.1765878361666;
        Tue, 16 Dec 2025 01:46:01 -0800 (PST)
Received: from ?IPV6:2600:1700:e321:62f0:da43:aeff:fecc:bfd5? ([2600:1700:e321:62f0:da43:aeff:fecc:bfd5])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-11f2e30491dsm54392693c88.16.2025.12.16.01.46.00
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 16 Dec 2025 01:46:01 -0800 (PST)
Sender: Guenter Roeck <groeck7@gmail.com>
Message-ID: <c8195f04-3492-4cf9-b2b0-6f3a1198ffa2@roeck-us.net>
Date: Tue, 16 Dec 2025 01:45:59 -0800
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/2] hwmon: (pmbus) Add support for multiple-function pin
To: Jeff Lin <jefflin994697@gmail.com>
Cc: grantpeltier93@gmail.com, karanja99erick@gmail.com,
 chiang.brian@inventec.com, krzk@kernel.org, william@wkennington.com,
 tzungbi@kernel.org, thorsten.blum@linux.dev, ninad@linux.ibm.com,
 linux-hwmon@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20251216091617.2581192-1-jefflin994697@gmail.com>
 <20251216091617.2581192-2-jefflin994697@gmail.com>
Content-Language: en-US
From: Guenter Roeck <linux@roeck-us.net>
Autocrypt: addr=linux@roeck-us.net; keydata=
 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
 np3900V20aS7eD9K8GTU0TGC1pyz6IVJwIE=
In-Reply-To: <20251216091617.2581192-2-jefflin994697@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 12/16/25 01:16, Jeff Lin wrote:
> Some pmbus chip support the additional multiple-function pin, which can
> detect and provide the connected device's current reading. The data
> format of the multiple-function ping must be confirmed with the chip
> vendor, as it may vary between different chips. However, it is
> problematic if the data format differs from the original 'iin' and 'iout'
> and we want to show both the current from multiple-function pin and the
> original 'iin' and 'iout'.
> 
> To solve the problem, add support for additional virtual current input
> and virtual current output, call it 'viin' and 'viout', respectively.
> 

Those are just additional current input and output values. That does not
require additional sensor classes. Just use the chip driver to map the
readings from the chip format to the format used by the existing iin and
iout (there is no 'viin" or "viout").

Also, please point to the standard regarding "multiple function pin".
The term must only be used in the common code or definitions if it has
a reference in the standard. Otherwise it is just a manufacturer specific
extension which has no place in common code. The second patch of the series,
which accesses some very vendor specific functions, strongly suggests that
this is the case.

Guenter

