Received: from mail-pf1-f178.google.com (mail-pf1-f178.google.com [209.85.210.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 406D52D7D41
	for <linux-hwmon@vger.kernel.org>; Tue,  3 Feb 2026 19:49:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.178
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770148200; cv=none; b=SUDa3ybcazLEdFymUhbdQ/Lu3rwZnHbBs7wEKPuoqPtXikzj+GveYshHbwp5QuppMkXWJcsWY6GKyuhAfhLKVzIDhBIcJq0BWC+QQpIxb10poK0cWyCQ3lwgVIQBNM/jIiUXYTDryXXJJO5VrfljmJ5ofP76Z1I+DH5vIlaaOW8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770148200; c=relaxed/simple;
	bh=8yqaWvFBoa/SfjhhEsFDdO8IBd4p8vjoJIIi0PUV2Tc=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=DRz/XgHB4FXz3iyZ1VqDS0xrhDIdhgutjsG2dPQzig5zv0KcP61twQbW+1U/zglAt3tXCOw/GMI055D5hvjvjdsvR6thgLxfR6lJ61atDRKsYFW2dF9eAW5khVhm0T4Fe2SUc4z34UV19gb03fG12qG4xFE7ISWWkW7NlJat4YY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=CcqgVSzs; arc=none smtp.client-ip=209.85.210.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="CcqgVSzs"
Received: by mail-pf1-f178.google.com with SMTP id d2e1a72fcca58-8231061d234so5164360b3a.1
        for <linux-hwmon@vger.kernel.org>; Tue, 03 Feb 2026 11:49:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1770148198; x=1770752998; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:sender:from:to:cc:subject:date:message-id:reply-to;
        bh=nRRoedO7pIrvQr8rG24QJUDO8pC7NzW/21AwdIBdf7s=;
        b=CcqgVSzsT5iEZ1pJO3GibWAxmjaZcIcFNaR7rCSzC0Wb+hDrbJ6ICisbH+VTQWLFAP
         wbI91khSIGPXXix3Iu4uzLatCXbrTrT/b1Zx5XvvShu8buIhNQ56RoEA5tTExDgXjmnb
         /Yg62y8yi/9LQ22jcS0d2kVH3aSNUr3WTeYIxU/Zp8AR/E36LWeiKg2cEKQuGAXpDlRC
         daC0X3sX7CYE0fu4cn+Q/oVhiS18wJ26nrgaPkZ5SKtrLOEl168J8nX61c0N/m6A2LXZ
         qAJYCol602mJf+Zy+i2Df8JT8MfLA+Ua49sYjBH7PmNLySA8Apqbr1cKe01o/1pxBor5
         65ZA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770148198; x=1770752998;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:sender:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=nRRoedO7pIrvQr8rG24QJUDO8pC7NzW/21AwdIBdf7s=;
        b=BxA6ty8Qi4Lc9Hh2zajSqRH9fblGPvBmkTXpmjrINUfLc6Xv8tDAMh+ADR72/h6Xpm
         lToTA9weqWl9q6ey28tBBbZHZN1ih++5CKq65TenHQBb0RiHOaGsBbgzCB+NBYm7A0uL
         j6obwCUqVItM47WYStQtih/IQErtOLZs7uRJK9awc0qeI1PvXJ6hDnXjYAuBF9Em70kl
         EYaFqZm37tzl4eqx8UeWFSnzNq3VNIyXL98HOF6HQuvZVY9O83+DUuDzlKqLkRtyh8GT
         BdlaM/5GJj0lT8WLPyh6/KFNI6trF27Edd20TOqVb8oA8fQZ0Y1HM7WfM8tUUWIJLKJu
         or9Q==
X-Forwarded-Encrypted: i=1; AJvYcCV1a5eSJCCJ74PtcaXH7xvRmbHVqXEM6P+f/mIGYxqJgPq0zJHrnazEZQI+KrQXKyVYw9kGv/sNf3lQzw==@vger.kernel.org
X-Gm-Message-State: AOJu0YwDblzb2HT2eZI+tuAEf3vwpJh/cGAzOPtoypVU0MnlvASXc16z
	QqxV1Mud8bY8MS22GTvkStu24t0CnPLI5XVXHGA8PjDzJhaS8ndneXm94G0bHW2z
X-Gm-Gg: AZuq6aK7F2J5L6W7Lcj/fJ6OElUdj7p34g48xFxfztwW5Np6Nk+8Ega2MTMKn+UHoB5
	MXnx+j9QuQNq44zygfY3acKbC47iNhnrpnxUt1L16VeXj/HDokK7ey5blBZ5HgmFkaLOXX2V73+
	6GNCHMqfFa9mVoit6jnz5GGSoE5hLABD1zckOGQoh2jodopLFKPdl+s6NX0V/BFy/gWtafPL7TM
	PeoEfia7BkyiGIgtjJAu2ye5R/zTMe65EclGb1swjaCcuNQunMgOZ3EGilloNU22TFD0vcXVTds
	94EGRxPNM83uxpL6oAD9DW+4d0fBd5wvtRw4HURF/sd8SceFo81Z78d1UOzno10rdMn4RshjL0j
	S/cnl42b1ZK4d3GIqwEGxXDOVta71gIm3vTDewSOjorD2ufnmRBzazfqZbHgpAievb3ud7e7i38
	c88vKCClwBOjvI2yjOrvVNH27UEX0Zlc+J/lSyekmPd9bws9SqB4AZnmRgrI4X
X-Received: by 2002:a05:6a00:b82:b0:81f:50ea:5da1 with SMTP id d2e1a72fcca58-8241c163d0amr570712b3a.2.1770148198572;
        Tue, 03 Feb 2026 11:49:58 -0800 (PST)
Received: from ?IPV6:2600:1700:e321:62f0:da43:aeff:fecc:bfd5? ([2600:1700:e321:62f0:da43:aeff:fecc:bfd5])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-8241d163850sm174141b3a.2.2026.02.03.11.49.57
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 03 Feb 2026 11:49:58 -0800 (PST)
Sender: Guenter Roeck <groeck7@gmail.com>
Message-ID: <9fcdbf1d-ab91-4330-88ad-7fb5d26cd5d9@roeck-us.net>
Date: Tue, 3 Feb 2026 11:49:57 -0800
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] hwmon: (spd5118) Explicitly enable temperature sensor in
 probe function
To: Kurt Borja <kuurtb@gmail.com>,
 Hardware Monitoring <linux-hwmon@vger.kernel.org>
Cc: Armin Wolf <W_Armin@gmx.de>, Tinsae Tadesse <tinsaetadesse2015@gmail.com>
References: <20260131152048.2299403-1-linux@roeck-us.net>
 <DG5KLLWBJEF7.2H0M48M16C4SS@gmail.com>
Content-Language: en-US
From: Guenter Roeck <linux@roeck-us.net>
Autocrypt: addr=linux@roeck-us.net; keydata=
 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
 np3900V20aS7eD9K8GTU0TGC1pyz6IVJwIE=
In-Reply-To: <DG5KLLWBJEF7.2H0M48M16C4SS@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 2/3/26 11:23, Kurt Borja wrote:
> On Sat Jan 31, 2026 at 10:20 AM -05, Guenter Roeck wrote:
>> Instantiating the driver does not make sense if the temperature sensor
>> is disabled, so enable it unconditionally in the probe function.
>>
>> If that fails, write operations to the chip are likely disabled
>> by the I2C controller. Bail out with an error message if that happens.
> 
> Hi Guenter,
> 
> As I mentiond in the other thread, after applying this patch the probe
> fails
> 
> 	spd5118 17-0051: error -ENXIO: Failed to enable temperature sensor (write protected ?)
> 	spd5118 17-0053: error -ENXIO: Failed to enable temperature sensor (write protected ?)
> 
> This would be a regression in my platform because, even though the
> register is write protected, I can still get temperature readings just
> fine (even after the resume error).
> 

Yes, but after the next BIOS update it might not work anymore, and
it is impossible to suspend the system. On top of that, it instantiates
the spd eeprom which can not really be accessed because that code _does_
need to write into the chip.

There is no safe way for a spd5118 compliant chip to be accessed reliably
with write protection active. There is nothing we can do about that.

Guenter

