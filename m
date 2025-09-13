Received: from mail-pf1-f173.google.com (mail-pf1-f173.google.com [209.85.210.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 992552C21C3
	for <linux-hwmon@vger.kernel.org>; Sat, 13 Sep 2025 11:02:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.173
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757761350; cv=none; b=IDtuMKgW2/bOv6JCzE+4W0iigCLTk1ACOo5tl3Pw+4blhYrEFskN1tsMioN4LQT5r88fDKcqt3hnA1R7eL/dh/gDRNLVXEj6OF3c/Q9vLwuwcmyof96x/zYEFUBIyW10RS/J8Rtajf/8zPIJau5UyhIrconnU1sOAXaK6ZmcCtM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757761350; c=relaxed/simple;
	bh=BXHeodyc6oI0LqMSWJ3CeHdCp3CLonWo1Am23e37j80=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=SPvspFmwYH0/64Yh7V4+y38uG+4ujZIi8otqhW2mpOWlnM1B1xZp+G9gbQp9IOEAirRHnsY3ovrMPY8mTldp7H+y4nebzKOEo7+BRrwN8Qw3mhnyCmJh7nTkEb92I2cG5Ae6KfrhkgNt4rIbtNoSzJRFZO3AtcLdNaiufUk3aC8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=THdh2vyh; arc=none smtp.client-ip=209.85.210.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="THdh2vyh"
Received: by mail-pf1-f173.google.com with SMTP id d2e1a72fcca58-7742adc1f25so1882920b3a.2
        for <linux-hwmon@vger.kernel.org>; Sat, 13 Sep 2025 04:02:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1757761349; x=1758366149; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:sender
         :from:to:cc:subject:date:message-id:reply-to;
        bh=lSHxxUm5MkO+s5BZz5eceu1yg1KflUbRrShjzBDT/G0=;
        b=THdh2vyh3Jtpg3laeiJ84oORXNH7/VgDJ77kVd6Ugetpn3RAsllx+5kgQ+X+1TMvSy
         AkZ4j5jr4PDOKVrKlgCWqdabAtbxFcyDjd46vSn4ojicK2lcOxpczQMB95lhfLR5hDV6
         CySMeL7MPjHZULkL6SD7dk0FxG+zpqbEOmHraI/rtcZH+xPNZYFSd/WpVS31glpuYyrm
         E60FEN8aLs598rPvXM4j1gcZ1gUS8vHDjV9j3SmPSv0KS66B04p6YMvHkmw02PLCPig2
         kqvTyDGk51WDe1LQI28sFig1Pm3qcgqodq2EkG/cnrg3sodYFE63vdBBCi+f/r1tVbcG
         Adgg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1757761349; x=1758366149;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:sender
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=lSHxxUm5MkO+s5BZz5eceu1yg1KflUbRrShjzBDT/G0=;
        b=iT5sbiR5t+jp2PlPfQrJ7mofbpnImXa/I1JHH3CW2/WHcYdGkgzIYhLLFeXI77q7vY
         mQFtd5hiSDgR+wdT+QsW0YlTw/VpEEfDhdoDwWMnj840hpBnOhcj7ITFf+wzB/T2mawN
         MRm/NmnDpIDd1hVCwfng1iDS+s4Q8x+l19YO7TtGeOcaTuPy++sSFEXHaPACWND7GqNh
         rCKOzjPcRVOTesacySGqSnxzMMDcyzG/Imr75WaPrmsVyxYyW+oHfHJvs1eHujAOvpLk
         dmIsxlYQhyd5gH+G0v+qMcS4CJYZnJlWtVALqQRenf63beer5ul/9zBpdVKOReJ6W4S5
         TF+Q==
X-Forwarded-Encrypted: i=1; AJvYcCVzOzope9CgzJb43fnOIPBBQvDRijzWwnLHLPxnZEyT6lh1HH7rOkrn8/T2Nk/JRPoDnwuAUBNq5dFHUw==@vger.kernel.org
X-Gm-Message-State: AOJu0YwQ7roztrexGfD5tpwxOqwQXXYL+XktySZuNNNLLjuZPAa5EKsH
	BZtS4niex5fTLAmHNwEcwOR8M2w8TF9kjW/FZiH2TxfTwbWTyOVNDiop
X-Gm-Gg: ASbGncvayul1x7jygBgx7BeHsfb0zNMBou1PU5nCg7no7B1Gd1Zr1cHcfcZCkj8hiuV
	wLMPwrXbrIpnJGPrtJxTVK/bmLP+oHNco93vxx2SQ/zOTE1ATIuDLXy8eZj2I+Cu+CQspp5hSxl
	AJVfO7jURDTtIBIpj/fk3o9tLvHYR3wj4VKtDUYWyUpfTLPiyHA/BnTpppJguIx3juR0ko5eZ0W
	HwtXLlcQkAK5fq9v9WfGwHS59HrjCMU/yySwhyN1/UJr2gaavl5UAA9JAG3WJ3atD72NU3IvB7r
	jfWRaRXfET/0mJxw91qY73dnTvQrbWE9+jtSE/g+g3/eF88g38b9zqEDt4nnh7bW+R27Ht03OJK
	p/xKz4h5ULXR4EUMEdicvzV/ZGdQnu5MPpD+5EpKtx/idFQ==
X-Google-Smtp-Source: AGHT+IE4JTVtkLqMLoiz8/TSrmFSmKr5Hr/jEFds8tWyqz0lknQdtFDueUAIhY8b3MH0shhwJn12bw==
X-Received: by 2002:a17:902:e807:b0:252:8cc1:84a3 with SMTP id d9443c01a7336-25d26e484f0mr71857785ad.43.1757761348521;
        Sat, 13 Sep 2025 04:02:28 -0700 (PDT)
Received: from server.roeck-us.net ([2600:1700:e321:62f0:da43:aeff:fecc:bfd5])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-25c3b305054sm74144345ad.133.2025.09.13.04.02.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 13 Sep 2025 04:02:27 -0700 (PDT)
Sender: Guenter Roeck <groeck7@gmail.com>
Date: Sat, 13 Sep 2025 04:02:26 -0700
From: Guenter Roeck <linux@roeck-us.net>
To: Nuno =?iso-8859-1?Q?S=E1?= <noname.nuno@gmail.com>
Cc: nuno.sa@analog.com, linux-hwmon@vger.kernel.org,
	linux-gpio@vger.kernel.org, devicetree@vger.kernel.org,
	linux-doc@vger.kernel.org, Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Jean Delvare <jdelvare@suse.com>, Jonathan Corbet <corbet@lwn.net>,
	Linus Walleij <linus.walleij@linaro.org>,
	Bartosz Golaszewski <brgl@bgdev.pl>
Subject: Re: [PATCH v2 2/3] hwmon: ltc4283: Add support for the LTC4283 Swap
 Controller
Message-ID: <0ce54816-2f00-4682-8fde-182950c500b9@roeck-us.net>
References: <20250903-ltc4283-support-v2-0-6bce091510bf@analog.com>
 <20250903-ltc4283-support-v2-2-6bce091510bf@analog.com>
 <742fe9b5-bc53-45f2-a5f1-d086a0c9dd1c@roeck-us.net>
 <0765a0b89779331c62a3f136ef030f7f2f40ea47.camel@gmail.com>
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <0765a0b89779331c62a3f136ef030f7f2f40ea47.camel@gmail.com>

On Fri, Sep 12, 2025 at 03:00:22PM +0100, Nuno Sá wrote:
...
> 
> i2cdump -y -r 0x41-0x79 1 0x15 w
>      0,8  1,9  2,a  3,b  4,c  5,d  6,e  7,f
> 40:      b004 0000 b00c a03e a03e a03e 2501
> 48: 0000 1a03 e07f e07f f07f e07f e07f e07f
> 50: e07f e07f e07f e07f e07f e07f 0000 0000
> 58: 0000 7002 7002 7002 b07e b07e b07e a030
> 60: 9030 a030 0000 0000 802f 1000 1000 f0ff
> 68: a004 a004 0014 a004 a004 c004 0000 0000
> 70: 0000 0000 0000 0000 0000 0000 0000 0000
> 78: 0000 0000
> 
Thanks - this should do. Note that I am traveling and will be away from my
systems until September 25, so I'll only be able to look into this further
after I am back.

Guenter
