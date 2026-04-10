Received: from mail-dy1-f175.google.com (mail-dy1-f175.google.com [74.125.82.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A05773168E6
	for <linux-hwmon@vger.kernel.org>; Fri, 10 Apr 2026 16:30:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.82.175
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775838650; cv=none; b=IKc9s4nsnmtdbTAcJXhENBV8u+5UuHy43BL2FguyySgeYfNHS0cWcAUAHtXH9namyHXJDkzr8RoVVuCuV5CgZ0tNTL5UO/OCy6R8V7oqzDvX9zJqdqOI5egaB+vg93vqysAxUK2nUm0AGT+/9Ch6vxpfYn0c4uJwwUe+B8IH36Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775838650; c=relaxed/simple;
	bh=Undq6STZNqRrbFQaVnW7mDpSSi0KgbNQArRWEWLZ8SU=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=MQFJqP5FbP05IhKsmBzdfmAzl3VmnL7onUTx8YmKLDCtwKg2oFFVoe+U0y+jlo4aCwhhFHAPhVspTjxf5VoimHvVl8oG/sE4QRFZKFZRLobHdGwPXYE+a12vt6iaf+G2arVw1JDOX1vs6riJcZGEyGsjWnT98p5QsdCYJ3f+En4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=lVUymMSb; arc=none smtp.client-ip=74.125.82.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="lVUymMSb"
Received: by mail-dy1-f175.google.com with SMTP id 5a478bee46e88-2d64c756111so829860eec.1
        for <linux-hwmon@vger.kernel.org>; Fri, 10 Apr 2026 09:30:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1775838649; x=1776443449; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:sender:from:to:cc:subject:date:message-id:reply-to;
        bh=LhP5b/cZwXBwnnrIhhft7r+i2inPS25UHhwkMigbIjk=;
        b=lVUymMSbI7zd0dnPGBCiDIwUi+jfULmXXk/2+YZzsxkddheRlWqaG8/wahWB3gwmtZ
         kel91gzHzrue9UqlZmikwtbp1RJOhAcMwgVRyBb8E/HnBWquLrtxnmMhjY4p0EZPEOH8
         Mjum/+apCrmvc/hD+V6dCicP75BByXN+PH2WC/gLn4D9lM8ZXVMJT2KoO3kPg0ltlMdi
         DwKDu3r0jChZaIJn8pwjX4EzVIwaPks92pDdB14ou0dSRHYh1ZslXEerV/JdbuaHSsGr
         34CEBJmOh+Z1ZOYHs5/MORt/wUCxo/Q9iFj0b5gAi3vKud7TIp0yK3JO9iR0+MD40ZHc
         +NNA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775838649; x=1776443449;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:sender:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=LhP5b/cZwXBwnnrIhhft7r+i2inPS25UHhwkMigbIjk=;
        b=ZmOSPQeJ+DpidPm2hap08bcaYl2vAcJzvhjMGdDOpILBCTGJS8fALaNzM12DBk41Ri
         BSk44GJYby30iKRkwDDoA/JuPMeRHRHmt3nvvIIjZyiIXzJ050zp2riGJc39PeCcnj9t
         SbF2bHkITxL7yL+my0tNjGeDydBGGnN8YiVGrJ0QO0zzUDZ+xbBukzkp8/Ts/sMCa0hi
         l2DdZ19O5kTR17ZjT/B0oXOLpUjWQgVsLUmlOUxNHwfbeFwLJxw/RXckHdIl2IbUg7jD
         m130aO8NcpJQg/V5oPVEbm4ys3EIRNAM6yAsCO6ZKUAvRQZn7okDccPn0bj6Wg4iomqQ
         oPJA==
X-Forwarded-Encrypted: i=1; AJvYcCUvc9Ee05gq3BF0jowIvi4uIZZ/yVVe/TZf+Jv3t2XxmBV6/8zPuavQB5DfM/8gymutZs6PD7Za2UwoKA==@vger.kernel.org
X-Gm-Message-State: AOJu0YyhxOhFWuaTpIKARn+dHfeMOhEkxw6vXmNA3kADWjTOb2Oy/D0I
	DvO/NVan15U7axibShJBzC9ta4i9Xgks07Zt7l8sFkdEW5YttrYspmUF
X-Gm-Gg: AeBDiet8eqMnCkGym7qbKnAlm/mc2ebzUT851nx/sojk/WEF8mPJI6QFdnGr5+YL2QX
	M+kjOQc2rA8XOuVxg9neFC5YmXaStAEp2WmII1+ZKazMArUHyNUN2PWwdQPA5O4wdEnycOnRbY2
	RgAuMCA/SSXkJxKirUiFTmaaWXoK+kck0RMde2b+CXSwcCFy+cl0zz20iMe0lLVFvmC48O9GFWd
	Ici8rq2Mz6MWzJu0KjJHqxKOuxvnq+FR8AIyR8M9PdvP2VVqLBcgp9Q+DaX/fxB0C7z6hbiOpPs
	ABuy2Z4wGFrM5NJ+I4AI/3GxwHH6O50+Taba9/kDkKkN2mkuMn2rLEV9dmNe2NrCFQPCDczviV8
	4uLV4obn/pnUzuWBVkBMLhZPjdQG1eZY0dFk33wLf9CvKQ+9EjqrqYBkoFElfKhqd4D87PGZhyR
	vZwbSePMewmy2U5n5ZR7o7rzw3X2xulw9Zyun+Eu0wRF3M9w3PTtF7hkRxkY4c1Z8AetVUwBxh
X-Received: by 2002:a05:7300:f082:b0:2c1:7afc:df00 with SMTP id 5a478bee46e88-2d589361d94mr2267276eec.30.1775838648647;
        Fri, 10 Apr 2026 09:30:48 -0700 (PDT)
Received: from ?IPV6:2600:1700:e321:62f0:da43:aeff:fecc:bfd5? ([2600:1700:e321:62f0:da43:aeff:fecc:bfd5])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-2d5630ac330sm4803680eec.29.2026.04.10.09.30.47
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 10 Apr 2026 09:30:47 -0700 (PDT)
Sender: Guenter Roeck <groeck7@gmail.com>
Message-ID: <9872a816-9a4f-4826-a4c9-151efa73213d@roeck-us.net>
Date: Fri, 10 Apr 2026 09:30:46 -0700
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 2/2] hwmon: (pmbus/q54sj108a2) Add support for
 q50sn12072 and q54sn120a1
To: Brian Chiang <chiang.brian@inventec.com>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-hwmon@vger.kernel.org, Jack Cheng <Cheng.JackHY@inventec.com>
References: <20260402-add-support-for-q50sn12072-and-q54sn120a1-v3-0-67a5184e93b8@inventec.com>
 <20260402-add-support-for-q50sn12072-and-q54sn120a1-v3-2-67a5184e93b8@inventec.com>
Content-Language: en-US
From: Guenter Roeck <linux@roeck-us.net>
Autocrypt: addr=linux@roeck-us.net; keydata=
 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
 np3900V20aS7eD9K8GTU0TGC1pyz6IVJwIE=
In-Reply-To: <20260402-add-support-for-q50sn12072-and-q54sn120a1-v3-2-67a5184e93b8@inventec.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 4/1/26 18:29, Brian Chiang wrote:
> From: Jack Cheng <cheng.jackhy@inventec.com>
> 
> The Q50SN12072 and Q54SN120A1 are high-efficiency, high-density DC-DC power
> module from Delta Power Modules.
> 
> The Q50SN12072, quarter brick, single output 12V. This product provides up
> to 1200 watts of output power at 38~60V. The Q50SN12072 offers peak
> efficiency up to 98.3%@54Vin.
> 
> The Q54SN120A1, quarter brick, single output 12V. This product provides up
> to 1300 watts of output power at 40~60V. The Q54SN120A1 offers peak
> efficiency up to 98.1%@54Vin.
> 
> Add support for them to q54sj108a2 driver.
> 
> Signed-off-by: Jack Cheng <cheng.jackhy@inventec.com>
> Co-developed-by: Brian Chiang <chiang.brian@inventec.com>
> Signed-off-by: Brian Chiang <chiang.brian@inventec.com>
> ---
...
> -	/*
> -	 * The chips support reading PMBUS_MFR_MODEL.
> -	 */
>   	ret = i2c_smbus_read_block_data(client, PMBUS_MFR_MODEL, buf);
>   	if (ret < 0) {
>   		dev_err(dev, "Failed to read Manufacturer Model\n");
>   		return ret;
>   	}
> -	if (ret != 14 || strncmp(buf, "Q54SJ108A2", 10)) {
> +	for (mid = q54sj108a2_id; mid->name[0]; mid++) {
> +		if (!strncasecmp(mid->name, buf, strlen(mid->name)))
> +			break;
> +	}

If ret < strlen(mid->name), this check compares uninitialized data.
Also see Sashiko feedback:

https://sashiko.dev/#/patchset/20260402-add-support-for-q50sn12072-and-q54sn120a1-v3-0-67a5184e93b8%40inventec.com

Thanks,
Guenter

