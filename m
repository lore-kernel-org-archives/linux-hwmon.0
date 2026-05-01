Received: from mail-dl1-f43.google.com (mail-dl1-f43.google.com [74.125.82.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 263B01A9F8D
	for <linux-hwmon@vger.kernel.org>; Fri,  1 May 2026 19:32:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.82.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777663971; cv=none; b=D27MGLixHCkRGDBOh8LK9OWhTdwCK1V/ehmbajI/ITlkKIz10nl3e9exn51wuekajL2wPezm6IhoU3m8TQWmghjii5w63iPUXI8UWBj0ARLUL5opLA4rYgAgl0Jgnt8diu+V+0OXdMY0H9LvRTFPVdpnMsD1nAgiSF6Zn628gL4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777663971; c=relaxed/simple;
	bh=hTHIz+/tAO64LwsE/3jSAZmYzii7GdaAIgDuYHN/knE=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=ubNk0iKK/2nRj9wOLMG9VNVC99589VgVYDIhrzUlbJFQZZiKk1ZkRpzvk0rqSb7ySn1B6zR64b5fVBC6skwg6Q6XImM9NIGrYBDAs3zitg7CL1l5IIyWVIDslljijKjXj28jqkHW1EnjScP0vnqvybn4zv7AU3ZymEsVwQpETaM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=rtyZvAdr; arc=none smtp.client-ip=74.125.82.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="rtyZvAdr"
Received: by mail-dl1-f43.google.com with SMTP id a92af1059eb24-12dfbcc0703so973687c88.1
        for <linux-hwmon@vger.kernel.org>; Fri, 01 May 2026 12:32:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1777663969; x=1778268769; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:sender:from:to:cc:subject:date:message-id:reply-to;
        bh=cdEzZB8ARiChwuNSQzGR2iUqcN1oqQjQshROMA615kc=;
        b=rtyZvAdrVQM3v/M7o5WusVvZ5Z5sbInlw1MiApob2Bv1wjJJO9+RZ4J5Grr6jE/UNR
         s6D3Cnqg7iEa5T8UmMcWiA9hwFKPv1Po17HBxnMxw43hLMcT2U7LcBdJKl1rFZksnq5x
         svP1F5n9I7Tk0TKhWAFAAFNTX4PB6/eLwmtci4U6iQ6AbyGEKEc6HuAK0Hfs5UHSuXeO
         U3J5s/dVdviJW94nH1bK2Axu4zyGTaCfQPjfN3ZKnNF5qqqz5QT8s9xQGQHwSAeL+NMJ
         Kei4BCjxPZOVYUf01y7GWOQQlvTu8XXNgW0eev+y4wrb8zZBaKDjbM7siROiE/XiiHbC
         HCRg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777663969; x=1778268769;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:sender:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=cdEzZB8ARiChwuNSQzGR2iUqcN1oqQjQshROMA615kc=;
        b=G31aglWuB38bFxVW244saNO6ezXjq29Q5a0mzZwNZTlezfYwKEfiiZpOlTgMae1Yw5
         vu822KJq+6OgC991cSQ9RqNK1LdrgpvnE1EeKjAogCRhiZWP1I78YzUj+cm8lkO8maaU
         DB7XrF1Gc7ohK5y0geIjTk6c+ukbEvlxvmsfSjaXpYRcXhQlmkc8+2HI1j1NzDORbFcP
         xW0/OkCRKu1DGCyzBEJd6MXiH06YHX8hcouIwCkcmCG0KFMu3XbsYTQ9AI5HSQ/KrRle
         jr88JgWxMjzb3yvford3mNzkddspw/McPT6edG2qHYUD+MtnNGoJwQAxJuucTq76ZBK3
         uVYg==
X-Forwarded-Encrypted: i=1; AFNElJ+TA9IXk13mcaZC32A4JlWnDnLv+KWvR3zf0C7PnRhBtVN1OAGBni5BdGSJdRuYnSBJkiHtvn1rEachFQ==@vger.kernel.org
X-Gm-Message-State: AOJu0YzQXO1QlJBQej44/naqHBhvoDE6lIiDmrYPZ0n593Oa2L6nx/YM
	HeJgo74gfwavSN0Wf7Lzjt8Pc2kRXPj0SEtk9PRmaHaI+SGTF7uDa2qo6RZF5w==
X-Gm-Gg: AeBDiesk3niHXBZt3gLrrSxVoZeIGxR85jSbuuBGgW2Qnk53nHTbZ52hIIzldmqz1HM
	W4B8MDtW1jrmFiBxJY7cBRyBXeix4pI05mgY4APYZq59f9Dz8P6N38vlpwU3PaX+2X4JQ+2wIrd
	WT16zH+yj+v2w3YdbKI3q4KhtmZ+28infxgS1WryjsGauL2wtINM06CO+6yFzBfTaRbOTYLK8Zo
	dJMWFAUPL+2CEX7nqOgVnTDRfOjM83eF342+nHjELFF27tS/VOcMiQeCnCFwaQIIUa8hJeAb0o3
	yEECPFQ0hFBg6jjc7zit7itRL/0ZBqCzvmWMJluDxtuzSg8TLvpxsZ5IhXiPW1UKVQujW02BaFA
	lWfsIeu6p1S21r6HdO8SktR0LzZjlBAWh6pETTJCH5uKyu1Hc5waY38GnVvDnkkYFpYki1uRaQi
	r8bf3TZDlMNkCLibk7lmxysJQkCwoJ53R/CRZJ3WYC3TEAFBo1bCeyCFpANty34Fsx1aSOdBTs/
	Teg/kG7ZnM=
X-Received: by 2002:a05:7022:4c:b0:128:cedb:33c6 with SMTP id a92af1059eb24-12dfd7d1ac1mr271848c88.16.1777663969150;
        Fri, 01 May 2026 12:32:49 -0700 (PDT)
Received: from ?IPV6:2600:1700:e321:62f0:da43:aeff:fecc:bfd5? ([2600:1700:e321:62f0:da43:aeff:fecc:bfd5])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-12df8424ef1sm5442562c88.9.2026.05.01.12.32.48
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 01 May 2026 12:32:48 -0700 (PDT)
Sender: Guenter Roeck <groeck7@gmail.com>
Message-ID: <92fd08f3-f6c9-4a1e-a01e-c5d12b23503f@roeck-us.net>
Date: Fri, 1 May 2026 12:32:47 -0700
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/2] hwmon: (lm75) Support active-high alert polarity
To: Conor Dooley <conor@kernel.org>,
 Markus Stockhausen <markus.stockhausen@gmx.de>
Cc: robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org,
 jdelvare@suse.com, linux-hwmon@vger.kernel.org, devicetree@vger.kernel.org
References: <20260501120518.3085501-1-markus.stockhausen@gmx.de>
 <20260501120518.3085501-3-markus.stockhausen@gmx.de>
 <20260501-earache-balance-3ac33716ac5a@spud>
Content-Language: en-US
From: Guenter Roeck <linux@roeck-us.net>
Autocrypt: addr=linux@roeck-us.net; keydata=
 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
 np3900V20aS7eD9K8GTU0TGC1pyz6IVJwIE=
In-Reply-To: <20260501-earache-balance-3ac33716ac5a@spud>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 5/1/26 10:05, Conor Dooley wrote:
> On Fri, May 01, 2026 at 02:05:18PM +0200, Markus Stockhausen wrote:
>> All chips supported by this driver support configurable active-high
>> alert polarity. This is already documented in the devicetree description.
>> Add support for it to the driver.
>>
>> The default polarity of the devices is 0 (active-low). So there is
>> no need to change the clear mask. For consistency reasons adapt the
>> hard-coded configuration value of the AS6200. It is the only device
>> that defaults to active-high polarity.
> 
> Uh, I dunno if you can do this, changing defaults is an ABI break
> typically. What makes it okay to do that in this case?
> 

Turns out the driver doesn't actually set the polarity bit due to a driver
bug, and no one noticed. Also, _if_ active high polarity is set, the _alarm
attribute shows the wrong value due to a second bug in the driver.
Given all that, there is no real ABI breakage.

Guenter

