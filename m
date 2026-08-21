Received: from mail-pl1-f181.google.com (mail-pl1-f181.google.com [209.85.214.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C8B6A30594F
	for <linux-hwmon@vger.kernel.org>; Fri, 21 Aug 2026 02:04:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.181
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787277865; cv=none; b=YFhOt1G0qy8QH6IM0Cwx65Ur1QFvgoLirSSnc3bkEsxXLjH9mc5pndmN4LMKV+raLY3/yv9OhpyxanTmAH+UuwgkLmIlcqBZyroGxjQrGW6pXSbqAJ9rekxmRZvOa++YmGawEIDSaE98RYxtGY0wpqZP1yYQQ4vYVc6dQvYtHvo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787277865; c=relaxed/simple;
	bh=w5DUYNbjW7GqUzc+mq7sClh0IjYlojUpnWerxNc3sZQ=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=QtvSTOoAWmMRMFel1QzsH8H2Kg0xY0cb1mbV7H01S7iqcP9D9T7xS0ItgVqkxEYtavVVpKO4IuT9wpaq6zJtpI7aswDb3gSCEgImAx9JTg4Kf5qvthlYfNPHMPNPu6s84P7cb5TdXbc4bjO/j85cIpc7fRiWcfAlaolq313uxIE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=lCu5y1++; arc=none smtp.client-ip=209.85.214.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="lCu5y1++"
Received: by mail-pl1-f181.google.com with SMTP id d9443c01a7336-2caed617615so6119615ad.3
        for <linux-hwmon@vger.kernel.org>; Thu, 20 Aug 2026 19:04:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1787277863; x=1787882663; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:sender:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=iI3Z7GgqYc25x6cBox9+q0SwGZtkEQxnYhZfkabWWfw=;
        b=lCu5y1++zmw/DwzFJwa+uyNgcqp1gd4ghYXelhL8da756VavyxM+9JF3Z06UfPvJc2
         UzZvdyY69XfCEIckqCbrtUIRlO7yLA7V9Xzo+B5o7Mzi4NEWIKwljInZ6aPYPnHNvdBg
         2OpcuKhi5whcyPjkyaD+chFASstOV2lydm2sSkyhfiN4XktFCZvt8xzxEhQPu0akIMn1
         xQUjdBaq1iins4DSoIVuhoP/VhDXaVSzeiJtZOtRtqOh079wJaxKUwaPWnfKGj5pXosX
         OnVCgvzcTL2cScgmnx87buPIxpTDkVT72VWQraIldu3x/NRmH3CC4eu6kn73hxAggAyl
         8I+Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787277863; x=1787882663;
        h=content-transfer-encoding:content-type:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:sender:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=iI3Z7GgqYc25x6cBox9+q0SwGZtkEQxnYhZfkabWWfw=;
        b=VzUhnzZd/1XR5PD9E+6ncZZVWSvgeybCdNqUMhjcVpBwwcvyEtZthgOERkKWpc/sXW
         jD3Nf7askGK6UsQOelHAjR5pbDjZ2b9RjS26tOJPuKgcYlssnym+ACwhwKyMtAcBWjcM
         v1B0ycgJNxYWwlEgIYpReQnWFShwVL+WHiU3nvL7vmgm6DTna+Qpl3rFbxkBoFJS4nu3
         Bw+bG5PEd7smJFE/gWTIBT2BNA8pbl0FA+DUeHD805Rn5wxKNlLr96lkZGFrsGQ/fJ4G
         xbioAR+rvKMo5LXptb2iBkgXokCZRM3mGNqk54czvb+lb3TkAA7X5O3xAbgulXF59hPm
         i27A==
X-Forwarded-Encrypted: i=1; AHgh+Rql6/ZKSO7Tj2ZDeC7RQY0TnI/jHw0ei42a42CXOGdG38TA7BNHIP91x+9EdPI88bL2PBj/+Ls+9uWS9A==@vger.kernel.org
X-Gm-Message-State: AOJu0YzAAXBSqQOVOiMO02Cl9Oe5syHpDWX7GUlylgwfltXcXTzkszd0
	MxwjB2CbhBLMdsv/qQAzy8BcL5Rsf3CKnAt0IPp7BgA9za9f4pWWfgjQ
X-Gm-Gg: AR+sD12B2Ja4CW6+6t7zEs2hw6Qy0FPDCuzdynMHK8eaxITWQoEFrnlIibTXX0ZMvh3
	Pa0x4R42JoMsZvw/oxniimWMdNHirPlYkKmA3Cts0OcgOM1PyOMJylpvJmog+OiX0OI1DorgTwC
	9U5n0FuyeG5L9FEelDBp1aBbTJjxIdY9ZkWMDanrA5kTj8e4PGf0xCHK96J+2b9okzA7wBBktYu
	WKnHk3K3C5uJy9KzJHQVGFzDRK6+jA/ywao5l4jLvvXCs80T2Ed4TKq/MA3JxYgfElt/dgG7Ifr
	QVWaNI6EZtLSY75YNNtlDLqGKoaBbsqI7Mf5N87PR+SK5u7j2qDH8lCq1vYxiNITmK0IiYeBg4I
	Na3wmzuYPky4razuJoq1UOPe8J0qywtBoZ/sqElKgJ6XhJUJlYKT1ypUIcuMXrkgNMG2mZSy4r7
	mHuSW9MUPVzbLPSjwImHcnSTrAJrckTJDNOU4+la9RxLS5Lf9EWnBnSYIOYJA4y5zuza6BJmnnL
	GvxvQi0If+0l5D44Y+gU5MvaXqyqyWaPNGk4w==
X-Received: by 2002:a17:902:e78d:b0:2d3:6fac:d67c with SMTP id d9443c01a7336-2d64b09c688mr57206645ad.10.1787277863180;
        Thu, 20 Aug 2026 19:04:23 -0700 (PDT)
Received: from ?IPV6:2600:1700:e321:62f0:da43:aeff:fecc:bfd5? ([2600:1700:e321:62f0:da43:aeff:fecc:bfd5])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-327bef6ec40sm22470895eec.7.2026.08.20.19.04.20
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 20 Aug 2026 19:04:21 -0700 (PDT)
Sender: Guenter Roeck <groeck7@gmail.com>
Message-ID: <5bbbdc8d-828d-4b99-9581-c89cffb7c67a@roeck-us.net>
Date: Thu, 20 Aug 2026 19:04:20 -0700
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 2/2] hwmon: (starfive-fan-tach) Add fan tach driver for
 StarFive JHB100
To: Changhuang Liang <changhuang.liang@starfivetech.com>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "linux-hwmon@vger.kernel.org" <linux-hwmon@vger.kernel.org>,
 "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>
References: <20260819091601.41077-1-changhuang.liang@starfivetech.com>
 <20260819091601.41077-3-changhuang.liang@starfivetech.com>
 <033d3490-9848-436f-a7ad-e6ab73768031@roeck-us.net>
 <ZQ4PR01MB12025F1BFB7E3F897228AA40F2A42@ZQ4PR01MB1202.CHNPR01.prod.partner.outlook.cn>
 <9fc113e5-e56c-4e9f-8b29-914f39503b0f@roeck-us.net>
 <ZQ4PR01MB1202A9B4F415BE121B6984B0F2A32@ZQ4PR01MB1202.CHNPR01.prod.partner.outlook.cn>
Content-Language: en-US
From: Guenter Roeck <linux@roeck-us.net>
Autocrypt: addr=linux@roeck-us.net; keydata=
 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
 np3900V20aS7eD9K8GTU0TGC1pyz6IVJwIE=
In-Reply-To: <ZQ4PR01MB1202A9B4F415BE121B6984B0F2A32@ZQ4PR01MB1202.CHNPR01.prod.partner.outlook.cn>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 8/20/26 18:06, Changhuang Liang wrote:
...

>> So how long does it take to execute the "sensors" command with 16 active
>> fans ?
> 
> # time sensors
> starfive_fan_tach-isa-0000
> Adapter: ISA adapter
> fan1:           FAULT  (min =  300 RPM)
> fan2:           FAULT  (min =  300 RPM)
> fan3:           FAULT  (min =  300 RPM)
> fan4:           FAULT  (min =  300 RPM)
> fan5:           FAULT  (min =  300 RPM)
> fan6:           FAULT  (min =  300 RPM)
> fan7:           FAULT  (min =  300 RPM)
> fan8:           FAULT  (min =  300 RPM)
> fan9:           FAULT  (min =  300 RPM)
> fan10:          FAULT  (min =  300 RPM)
> fan11:          FAULT  (min =  300 RPM)
> fan12:          FAULT  (min =  300 RPM)
> fan13:          FAULT  (min =  300 RPM)
> fan14:          FAULT  (min =  300 RPM)
> fan15:          FAULT  (min =  300 RPM)
> fan16:       1800 RPM  (min =  300 RPM)
> 
> 
> real    0m4.865s
> user    0m0.023s
> sys     0m0.001s
> 

Normally I would say this is a no-go, but this is your chip
(and, as we say, your funeral). Just please document that reading
the fan status will take forever for disconnected fans.

Thanks,
Guenter

