Received: from mail-pl1-f178.google.com (mail-pl1-f178.google.com [209.85.214.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 41A685FEE6;
	Thu, 23 Jan 2025 03:31:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.178
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1737603064; cv=none; b=SY8IcX/zA0NKbvw0t4dIvNGuWSUdSXEZ6X+Z1x672GhayA3+hEeU87nUEtHBHMGKiOZ1pDkZ5JaVa2h+GBGwTnf5jHVdJsdTeYWmGWJCLHSrN1HtZ4osLqiQ+DRELeF7c62GYtT4Ea4wWYB6eAwckKddC3leyWjhDxHnI4Rrpmk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1737603064; c=relaxed/simple;
	bh=xrl5z8Ll2TqDuAd39ZGKT2p6sIGrMhLVtKtDEmreQjY=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=f3+WcJRDp/t/+NdjPCxXKY53+zveqHPmrOyU18lgWvR4BKvqQWgxhutreXOb3m3HJ5b0hXlav4LLgbvZY4X47PKIkTxGNv4NKIgeJXm1MjHpnJozr4BYI82whuULMLag/aJ/AkAqTj8iSQLyZ+Lob2jpVjlnlGniBhQ2a7iIKYY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=blL29bMI; arc=none smtp.client-ip=209.85.214.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="blL29bMI"
Received: by mail-pl1-f178.google.com with SMTP id d9443c01a7336-2156e078563so5192205ad.2;
        Wed, 22 Jan 2025 19:31:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1737603062; x=1738207862; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:sender:from:to:cc:subject:date:message-id:reply-to;
        bh=9TctogefYusXIIGZ4bwwlA4HUSpBuD5+2I0brlCcpsQ=;
        b=blL29bMIo2NFwHp+dXukzBs0bL2Ul+20XTelpbF06TWt0saYddQavodIfbcf3u1QE8
         MCdghpeRSAFzufSxSUrv++onap3+SNK4OFWKp8PACaKp/80+vyTgDnFnoZhN8qpG3AJo
         0r3wXpHbaW0CQdZIHc+pXh3V1s/JQp5JfGr6fT9UN4oVe3aF/zkH1g6x9JsFkJlYzsb/
         yH3Fr7aMgTwXqGb8mK58VdkYUNYh/RCWilzhVnDr7Eu++kSVEuTea3E0ti4D7nCzAcSU
         7Pvd7Manz6DzOPm0iSovP4Ub4XCi0NoDnc95LxI6fIk9ILXCCYYRkka/AVqPaR7b+4GU
         c1LQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1737603062; x=1738207862;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:sender:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=9TctogefYusXIIGZ4bwwlA4HUSpBuD5+2I0brlCcpsQ=;
        b=ipDYv914r2xdHrVgpXEilgwST8A3ePYOQpdv+SpFkD7aC1hLyh8RDD7w7mfVfmhRYE
         fsCODCADOm4rgWB8fHJYVZUBshuTxphvR/TvH+QElUiBDsdrTo8JKJ1N4aBmsnSaYmhK
         +7XzBoxseah29RpT2GxnqTgKZ+8y7NrG022Z+ktEpKT5qM6W5OlAhv4oZO3WsNI2fco7
         YHWJF28K+dOHjuDlcMnIaa445J3Bqls7HRbUojksvnX8K0bNTGH0edXUI8BWPyltIO4+
         q34+Iq/gprJNJYGoWlyDh9D+CbHo7MjUXq5xcNRm4SEM0Xvivhd33C1DxmuwtP7HxBlu
         4w0A==
X-Forwarded-Encrypted: i=1; AJvYcCUK7boU+96OWYb6Wh7D9Ra9ZSpfJESzERyVb/Ofx36FrMUsptmPdMdKATBVUNV7G2gQMTEyBlJDUD3Lr8w=@vger.kernel.org, AJvYcCWAOnHWIcaJU5RTi9+xMUHeO4SVDjGF423tfXzWTdVPSnYfDaXWiaUsjLopJBsDrUDKA5k8un/C9PNF@vger.kernel.org, AJvYcCXmG3sW/Pr09+6fzmoqJ+rWMHlZ3Sf8Sn8sQECOAeUXiAt8NVvMNpVRyoBJjPVbVTfKjg3PnPKNKuyZayfy@vger.kernel.org
X-Gm-Message-State: AOJu0Yye016XpzGiJ+CoZa+ZXYwFDslvg8b9YF268unX6IMxYzAZV3Eb
	XBSHnVuLYJl/IjNISGJ4+sWQZzvQTTnA8ur88Oa+k8PEGBgKqK71
X-Gm-Gg: ASbGncsj7YwAqpaOSo0y9P+mAzeIy+4e42xQt6gpvsYf6iNDIPwf1W12Iat0Vr7YFtO
	yUFxfcPwk7yXjA9srz0Bxrb6/gQbth2YcdQItDY+BsO0oySk3I7xAeimZyvo6w6UtbU1iov8tk+
	/HdnurQSWC3XHvIPDqTR2XLXD9NqMgDUPgCqLd5xdB5r8ld9NNU6nDCDdUm/xJncu7WTfU6n1Lf
	3R19OrYn0geR+obj2EFiiUktKKHp/m8O9KLSVZcoalMHoD0fuAF7lxeRl8FZLWJpPI7m8Jvuzjm
	n3Dn/IfzsKGBe5fjLL8HsqV6sKv/KN+LLpch8os9P5juBdYB7M4OLg==
X-Google-Smtp-Source: AGHT+IFbBzLf6BPJZJvPUAmUWhra8zja4yvhl2s7pKKVwzoOvyATIV2J/hG4x+KItPeWB7iM89uD+g==
X-Received: by 2002:a05:6a21:6d98:b0:1e1:72ce:fefc with SMTP id adf61e73a8af0-1eb214e5175mr41370085637.22.1737603062344;
        Wed, 22 Jan 2025 19:31:02 -0800 (PST)
Received: from ?IPV6:2600:1700:e321:62f0:da43:aeff:fecc:bfd5? ([2600:1700:e321:62f0:da43:aeff:fecc:bfd5])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-a9bcc323847sm9704724a12.23.2025.01.22.19.31.00
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 22 Jan 2025 19:31:01 -0800 (PST)
Sender: Guenter Roeck <groeck7@gmail.com>
Message-ID: <0eda52b5-59c2-4ad2-bb2c-5846dbfbf3e9@roeck-us.net>
Date: Wed, 22 Jan 2025 19:30:59 -0800
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 1/2] dt-bindings:Add SQ52206 to ina2xx devicetree
 bindings
To: Wenliang Yan <wenliang202407@163.com>, krzk@kernel.org
Cc: conor+dt@kernel.org, corbet@lwn.net, devicetree@vger.kernel.org,
 jdelvare@suse.com, krzk+dt@kernel.org, linux-hwmon@vger.kernel.org,
 linux-kernel@vger.kernel.org, robh@kernel.org
References: <20250122-funky-beryl-whale-a8bcbb@krzk-bin>
 <20250123013626.1085859-1-wenliang202407@163.com>
Content-Language: en-US
From: Guenter Roeck <linux@roeck-us.net>
Autocrypt: addr=linux@roeck-us.net; keydata=
 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
 mDW4+i+XlNFUPUYMrIKi9joBhu18ssf5i5Q=
In-Reply-To: <20250123013626.1085859-1-wenliang202407@163.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 1/22/25 17:36, Wenliang Yan wrote:
> At 2025-01-22 15:59:02, "Krzysztof Kozlowski" <krzk@kernel.org> wrote:
>> On Wed, Jan 22, 2025 at 09:29:39AM +0800, Wenliang Yan wrote:
>>> Add the sq52206 compatible to the ina2xx.yaml
>>>
>>> Signed-off-by: Wenliang Yan <wenliang202407@163.com>
>>> ---
>>>
>>> Add the meaning of 'shunt-gain' in SQ52206.
>>
>> You already sent v3... and you got comment from me. You ignored both
>> Conor and me, so me doing third time the same and expecting different
>> results would be definition of insanity.
>>
>> Please read carefully submitting patches before posting new version.
>>
>> Best regards,
>> Krzysztof
> 
> Sorry, I have received your comment and 'acked'. I was originally
> planning to resend [PATCH v3 2/2], because I have not received a
> response from Guenter Roeck<linux@roeck-us.net>. However, I forgot to
> add 'RESEND' in the title. Thank you for your patient reply.
> I apologize again.
> 

A resend after just four days, plus dropping all Acks ? Are you serious ?

Please keep in mind that not all of us are getting paid for doing this.
If I am otherwise busy, it will take longer. Sometimes it will take
much longer. If you resend a patches, they will end up at the tail
of my review queue. If you drop Acks, expect me to dig it all up,
and figure out on my own what if anything changed, the patches will
end up even further down, as in "I'll look into this series if I have
nothing else left to review".

Guenter

