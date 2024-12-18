Received: from mail-pl1-f175.google.com (mail-pl1-f175.google.com [209.85.214.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 53D8F19AD48
	for <linux-hwmon@vger.kernel.org>; Wed, 18 Dec 2024 16:41:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.175
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1734540095; cv=none; b=bsxjhlsPwHkN2S2qgjAjAvEkbvximr1apqEIY3S7DIKg5k1P2isGmQ8PWLJTINoV/oLast/XbNWa2z5y85oQ54PgUPIGORF1hCKVqF/nSU3Z8Rss2XmfO8Gvg+Jzr9FBttD4EGr7+cqjTQrDaSt0TH1+50tpyArFNvz4EthcbmE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1734540095; c=relaxed/simple;
	bh=ytHXdOSddsVRaFAVzHs9xkUt9mqt1oPznaVYRB8oifc=;
	h=Message-ID:Date:MIME-Version:Subject:To:References:From:
	 In-Reply-To:Content-Type; b=Ug7Q1qm2zZl7oURHJrM1Hr72blJgmHL2Qax129VzT4vwExLJU1Dxtc9Vy+5Bgy5sP7JEqm1PhpsSCa/GBj6pBXO8vIh+RZT5o+Odu4/Ksvk2PnpbMzFzSfR++nu3oghcAJJKEnu3QNVpjLBWO6yKJ0Mf7E2BHQ7UNS7zGtBoKSI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=fyx0axwl; arc=none smtp.client-ip=209.85.214.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="fyx0axwl"
Received: by mail-pl1-f175.google.com with SMTP id d9443c01a7336-2156e078563so51147655ad.2
        for <linux-hwmon@vger.kernel.org>; Wed, 18 Dec 2024 08:41:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1734540092; x=1735144892; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:to:subject:user-agent:mime-version:date
         :message-id:sender:from:to:cc:subject:date:message-id:reply-to;
        bh=WZTETOWsuanuuLmUUKX8cmgpmK3E70hSBZ5aga2cqv4=;
        b=fyx0axwlYrawQBYiR+Ff+j73ZIprPOAr+EHt5fxhrk5V0h68RpIdfjRuQc68DN7WCH
         XAEk66ZCRd33zgISFPNkVWpwk3o98ZogF2O/ymhNO7A+1ltdRKCY9JZ+sSPH0AUuyvBt
         vrsY2J4zgJNsGGQGzQM+vwyayWwWcIyGyGiVO52iev2z7SKBKouL9K6Tvg8H/3aMtxE3
         5/2QCqLVzpVvGp0oGU+YsxgSTeA0BElBaqKK8EOKkVv5B2wVxCmvVPfq1VT8ROjT/1Cq
         HV5V3cp0TCXeW1KoG3QMZXavoB7B71iovEcPhxD+rRi9vxxi1ZofgMH6KYOHPCsxXiJB
         pYpQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1734540092; x=1735144892;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:to:subject:user-agent:mime-version:date
         :message-id:sender:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=WZTETOWsuanuuLmUUKX8cmgpmK3E70hSBZ5aga2cqv4=;
        b=WUDvxVu9VBHVUUOdJVQfCYuGKOYSFG2v2+Vdgl4Dl9I60R5wdflqj0hSRulk7U5Zz/
         pMYOB+3D3mD42NUEBmGKbceoT8PXWARNBEK+EhN+VbcZ7L07EME5kdZphcKdt72iHg9f
         ljXwuUWcynHezaGth+KqLtQE/q2unazR97WAdpEYip+YZ4rK3Q0PhNukrCfwTeXoMoFh
         504fvbAG/UtHZphBFQeMW5IPOdOyRfqqX0alIf+A3Oisfgs45hWmrrBiIxolgXABHyCy
         P9CrXFm4yyAVt2JbQKuGDt214vVoH5zpQO3WtMZbXuUQhJFfwCVo+/ovCptScUl1E1dL
         Vnbw==
X-Forwarded-Encrypted: i=1; AJvYcCXFe0z8jsYt3savjUkn1ht8/bSowWykyZ2KAvM313354iTCzSbLOKe1jiPCPx6z3clhV91CDymsyZnagQ==@vger.kernel.org
X-Gm-Message-State: AOJu0YxHJ5vcTwi3ljjwWYVDDfZbXtYLTonFTGyUzfgxdnZxOL6r0Fp+
	IdK9jGVmO8EycJcBQFHYexbXL2qNFmaxEHoOZ1LC87fQ2KrpmDbAz+IMXQ==
X-Gm-Gg: ASbGncvlHiXBn0nu1mX2mTdshRJu+oL1C72hj4uA13FYlUik1t42W1PA30ITEPvITnX
	bahSSowkoOmuypV14/KIJt04m5IrnRHmN4TRtaHWZOhAj+mQzS4dI9OmgIIgsrfXmkVAMY8bI7x
	cmamad5ocIg3qvHTeP4yhjX8n+L/Sc/PaKl9phAAO2e4vTzdD+ppxyiJ/b6GcVKXqUmWqhRdSnl
	yRnfNn6PX6b1e8giEQtS6myhpe6ricqlTuZ09C0AIkfkJ8q3gWW+dr7eMPfI9CcTTxt/vGzjjQf
	rvcKFN00MFq4XFk/pOgziI6zd/IP+w==
X-Google-Smtp-Source: AGHT+IE6OTIGS6mO1Exl8LuhyEFuj4abFJza38B2oEflzIOg+A9mGFeuFXRajOrXCb46Oct6rA+p1Q==
X-Received: by 2002:a17:902:ccd2:b0:216:7cef:99b3 with SMTP id d9443c01a7336-218d7280492mr54498515ad.52.1734540092567;
        Wed, 18 Dec 2024 08:41:32 -0800 (PST)
Received: from ?IPV6:2600:1700:e321:62f0:da43:aeff:fecc:bfd5? ([2600:1700:e321:62f0:da43:aeff:fecc:bfd5])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-218a1dcc554sm78797735ad.100.2024.12.18.08.41.31
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 18 Dec 2024 08:41:31 -0800 (PST)
Sender: Guenter Roeck <groeck7@gmail.com>
Message-ID: <5b9f29b9-8163-4fab-9ccb-718b672083f2@roeck-us.net>
Date: Wed, 18 Dec 2024 08:41:31 -0800
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [RFC/RFT PATCH v2] hwmon: (lm75) Hide register size differences
 in regmap access functions
To: Wolfram Sang <wsa+renesas@sang-engineering.com>,
 Hardware Monitoring <linux-hwmon@vger.kernel.org>
References: <20241218150404.2713377-1-linux@roeck-us.net>
 <Z2LzPeqyxqJz06dZ@ninjato>
 <bfb3ba78-206d-4f28-a57d-c25e7d90361d@roeck-us.net>
 <Z2L3dhneuMi9ckUe@ninjato>
Content-Language: en-US
From: Guenter Roeck <linux@roeck-us.net>
Autocrypt: addr=linux@roeck-us.net; keydata=
 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
 mDW4+i+XlNFUPUYMrIKi9joBhu18ssf5i5Q=
In-Reply-To: <Z2L3dhneuMi9ckUe@ninjato>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 12/18/24 08:25, Wolfram Sang wrote:
> 
>> Ah yes, 'client' can be passed as bus context, and isn't used elsewhere.
>> The access functions need lm75_data, but they can get the pointer to it
>> from drvdata.
> 
> Yup, that's exactly what I did.
> 
>> Maybe that should be part of this patch. I assume you'll take it over - do you
>> want to make that change or should I send another version ? Handling it in a
>> separate patch is fine with me as well if you prefer to do that.
> 
> Since I already have that patch on top, I suggest to keep it
> incremental. Also easier to debug if something goes wrong etc...
> 

All that makes me wonder: Do you by any chance have a means to test I3C support
on SPD5118 chips ? I have a patch series for that, but I can't test it so I
did not bother submitting it.

Thanks,
Guenter

