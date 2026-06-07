Received: from mail-dl1-f52.google.com (mail-dl1-f52.google.com [74.125.82.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2C561322B88
	for <linux-hwmon@vger.kernel.org>; Sun,  7 Jun 2026 23:06:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.82.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780873603; cv=none; b=T1G0woei5EDxmI9aH2Xv9kqClW7eSz0n+a4ZAMDOQI+ZT8y5y4OTfaCrWa2Hx8l9aO/78LUjF7iAsMqgYm3m6xRms4mmA9IWkdIFniEslDjJjLmfMlb8019orlr22tU9RKaKbGTHfGw3mH3zfKmHTRr+SuTPee0HVWQN/kB1SAs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780873603; c=relaxed/simple;
	bh=kPrqkZOImJEwVQ7s3GvhcobQ075gqn9SswfG7ujrmus=;
	h=Message-ID:Date:MIME-Version:Subject:From:To:Cc:References:
	 In-Reply-To:Content-Type; b=aR4VA0I8wXjDB2lrC07WNNl+yyB1WU5y7ugDQlmP0m6ZC1cyMI7NyoJjc7lrVIB51WheHXaXktHXHryMDm4m1TJxaCdHVt1o4457qQtSL4uBNc5WQZk3DJMwwPYGLyJw0zVCU9Qo8xsM5Vu43SlBON7dBZAALGEs4BTfjT4PIqE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=msfAvySx; arc=none smtp.client-ip=74.125.82.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="msfAvySx"
Received: by mail-dl1-f52.google.com with SMTP id a92af1059eb24-137eb0d76beso2685763c88.0
        for <linux-hwmon@vger.kernel.org>; Sun, 07 Jun 2026 16:06:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1780873601; x=1781478401; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:content-language
         :references:cc:to:from:subject:user-agent:mime-version:date
         :message-id:sender:from:to:cc:subject:date:message-id:reply-to;
        bh=aa0pIIuhBk+rOGkwrS6QyL41EeSCfAnvIKaJSKLWeGM=;
        b=msfAvySxInURsZjgif0V8vJMktFXnunRZ35RHmyoXI2X/DAhsN2gYKNiDQJv375vw1
         JPvtIN/XrNT1WMnO1nlFhodkbS/1FcMPJDC5msrVtND6E/59wZGHvseVtMMpR8adipn6
         zOhtUXHnHmNx0oxW/OB5kn9LCSc1n9U9wzCc8H/zD1QPjDJ2+2zGL0U4VvfJWAD2G9fZ
         aThFqR5ZWhHbTNWQ1HE4QOhMERBDQ9Ptpj4K70R7S1qHG0rE6ALBeXhAtgmE6jG8tq/K
         OU09lMPZomFVg/Y2EKToAOWtTlkNCP9ORJYQqWI8XTjaH5tVWNyQzK2/lIphOPug0tdC
         Kiwg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780873601; x=1781478401;
        h=content-transfer-encoding:in-reply-to:autocrypt:content-language
         :references:cc:to:from:subject:user-agent:mime-version:date
         :message-id:sender:x-gm-gg:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to;
        bh=aa0pIIuhBk+rOGkwrS6QyL41EeSCfAnvIKaJSKLWeGM=;
        b=fy4hGcnuu5UXt3q9clb+9BiwTKPxdoFF5dWfNqomNT91sRLuVrrTS95ktH6pwMPs0D
         uTp93VJ5bW1B7HMzUask3n4nwQ0xkEn4lbjyvDCRWPdI1Wp3pIkdvXvTXG+U5ojRpXNf
         VN2sPq66XlsSQfsomdW1q3r18FBBAA9QUXQtXS9lDqu8he2+S/phNgm1sXAket0qgFl9
         5tobsSKx7NVn1OzJwjd/rmMrfOuLP3yd1JkJj4CUdTBFg9gG4bBdFGLp1PVH9si4eozk
         ZI5ptoGKiT/vJ07v099oFAgKRWKP+fUfEG/JzaHndXJf/6Ky4E4k6SB17oEHRI35/gJC
         8e+g==
X-Gm-Message-State: AOJu0Yxa1MYi7woBGm5rb7bJIG4dM2Tbx1sWymMN8d4Fl5nWRuOY4VAn
	PnoXFXmjufvXHlgiDWuIQaGJcwok1zqecB5sNNWVtesnPFJXiwuwFj9j
X-Gm-Gg: Acq92OFe8Bsw6lN+ScYrGoLfXeemeOF5gUguU6ea0r+g2cjui10RaFhTDvqauH406LA
	WVZqe3sPYPAyakaQBFaTGtdEivROIpNzwH2XsGFqjsdCcvesAGgVZbx6FJxKryVApyL2/v7T3wE
	sl5gU6P4c/xPr1uIPTrjyaUnUoCllee1imJbJJiSkW9Y7ZNi1uMf/JSnBknS8+zMMEInOFrEx/d
	MpOpGr6Ii8jbcNu8GI3D5hHIed3zDNfA9QEfz2I8rJis23GRYjmEJoCa7N3NI896Il1jFzjtX8a
	/pdA5MMpPWOp+8DXdRo7FE2Gpv3kK6M7ky/1uatdEYekId0x5nVs1ex+JUy5DhFh76d2jf9Qw9E
	hzb5E2+mjcKBpUB9bN/LL/HEssQXZxumWDL+zNhGsqAbBFGZRCfYeOpkXAbfHfRaWWg5qQ2EUKv
	xxi6k4URf8612MsEsyTsxMCVx/D1BP4g9J3LyzYJE+C4mzotNNafGfqnQkrAkwO1Skq1BVkN7Td
	WBlfrZ0qKNbbhs2bXBTGA==
X-Received: by 2002:a05:7022:e11:b0:138:e4:c4b5 with SMTP id a92af1059eb24-13807d9512amr5678708c88.17.1780873601217;
        Sun, 07 Jun 2026 16:06:41 -0700 (PDT)
Received: from ?IPV6:2600:1700:e321:62f0:da43:aeff:fecc:bfd5? ([2600:1700:e321:62f0:da43:aeff:fecc:bfd5])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3074df349d8sm14956583eec.22.2026.06.07.16.06.40
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 07 Jun 2026 16:06:40 -0700 (PDT)
Sender: Guenter Roeck <groeck7@gmail.com>
Message-ID: <583ce1ee-5472-416c-b8e1-2437ffdc5c75@roeck-us.net>
Date: Sun, 7 Jun 2026 16:06:39 -0700
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v1 0/3] hwmon: emc1403: Convert to use OF bindings
From: Guenter Roeck <linux@roeck-us.net>
To: Svyatoslav Ryhel <clamor95@gmail.com>, Jean Delvare <jdelvare@suse.com>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>
Cc: linux-hwmon@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org
References: <20260603141033.111300-1-clamor95@gmail.com>
 <ee0ea703-4c80-4212-9327-13e8342c10ac@roeck-us.net>
Content-Language: en-US
Autocrypt: addr=linux@roeck-us.net; keydata=
 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
 np3900V20aS7eD9K8GTU0TGC1pyz6IVJwIE=
In-Reply-To: <ee0ea703-4c80-4212-9327-13e8342c10ac@roeck-us.net>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

On 6/7/26 15:52, Guenter Roeck wrote:
> On 6/3/26 07:10, Svyatoslav Ryhel wrote:
>> Document and add OF support to this LM90 compatible thermal sensor
>> family.
>>
> 
> The chips have similarities to LM90, but they are not "compatible".
> Please do not make such claims.
> 

On top of that, this summary is widely inaccurate. The series does not just
"add OF support to this LM90 compatible thermal sensor family". It also adds
regulator support.

> Guenter
> 
>> Jonas Schwöbel (1):
>>    hwmon: (emc1403) Convert to use OF bindings
>>
>> Svyatoslav Ryhel (2):
>>    dt-bindings: hwmon: lm90: Document SMSC EMC1402/1403/1404/1428
>>    hwmon: (emc1403) Add regulator support
>>
>>   .../bindings/hwmon/national,lm90.yaml         | 109 +++++++++++++-----
>>   drivers/hwmon/emc1403.c                       |  25 +++-
>>   2 files changed, 100 insertions(+), 34 deletions(-)
>>
> 
> 

