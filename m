Received: from mail-dy1-f179.google.com (mail-dy1-f179.google.com [74.125.82.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 23056221F2F
	for <linux-hwmon@vger.kernel.org>; Wed, 20 May 2026 13:02:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.82.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779282142; cv=none; b=j6uFsSmzgUGmWwPEcUmHCasQXocsayI6Zqr5VKntdRoeA1G8sH22eqX5YaOsMNphS/WsQKp+4njEjrXzIQk5V1TqPbIDt6ZM/ykr+YFWQmAHgrYVTSFoAl9OZUzH5jetIjPlJPiNtGzQPIkXx1BJ+qxAJkocx+t3Yhyu8IvyNqw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779282142; c=relaxed/simple;
	bh=j93IPlCCC0jhu4kbRm23KfYZcJ6s0/Cninai6kJslvQ=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=jKZZpfmzQJlc5jbgauqTeV17a/uq5e+Z4w0DcSGXsbl6Foy3mD/SK/n1toKrYAnodKtMX0c0Bz7ka7zRtMU50dHqiIqxXIkynvRG0Er6dfB8YZz2DvZZVQ82meLRTeQv7nwriAdZR0ATn2I19xQKeg5CLXYxmtT5d86BYlc5/X4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=KmtbibEN; arc=none smtp.client-ip=74.125.82.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="KmtbibEN"
Received: by mail-dy1-f179.google.com with SMTP id 5a478bee46e88-2f30a4601bbso4567850eec.1
        for <linux-hwmon@vger.kernel.org>; Wed, 20 May 2026 06:02:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1779282140; x=1779886940; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:sender:from:to:cc:subject:date:message-id:reply-to;
        bh=jBCWXLaXY0vvy4Zwxt1nquC/ity0PlQlsj91NUuNTVc=;
        b=KmtbibENgx0P4RVGCfHFyO2ij9X6Ok24dyKQ+NHFRl06yJ7SnB12km4pxt4DXjYMbV
         t9HWd/vfOfJmY/LtAyIWE6wmXUZMHPWP+/w4ynaWl4zGOPoBfslHOn8IT5voZjVXLGS9
         PyI3mR2K8ADH3+0ak6EyL+Fst/3soGY0vx3TJk6nQ5hRuUU1tFvmhs98b81lv9v06tcJ
         haXbJzfEDYBbMZM5fBA1W6GSEt85q5E2D56/qBRdwG9tyl8n1dyQIcmSzqaZntUUKenM
         Qfexkwf4tHA/Nauv08vODFcLfKzTlfImlMIuG0TpS66yXR4hJm3BykQoDQyCR3KzTs1G
         MutQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779282140; x=1779886940;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:sender:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=jBCWXLaXY0vvy4Zwxt1nquC/ity0PlQlsj91NUuNTVc=;
        b=sNQTMyu62DbgYL8TSws6Bt8Q9jIxFakZawmcliqqzouT8wwOXaaBMoYy32Zvbk5Dge
         6EKhHZO2DWW88RXquwW/O/h4li2A03zYsQ50+FQV/sXWTCvjkwtTyacstaVfiUKNcUIf
         1oi8oG48V+istHPY/1DPDtSxXo0Bv1URYBiaE52Om2780W91dqvifb9ifvwVRLo6/WJI
         iHHoSx+W7hxOjPlejKjj1Gfdh42e73ImACkDsuKirz+nvOGSiFlfllYr6wI0cPMD4Qdj
         iiyO8hG8m6X7izsHTTRz00ZIkMhZ88LM9eOygBId+x5C1eERZGes25MHzg6gxWT12AMG
         b3+w==
X-Forwarded-Encrypted: i=1; AFNElJ9KqZKSJMAWLch3xwUKI0gJdwy0+3J06OYebOC+w9dsZgpK4UyIwmtYSbxUMJKq4L/apxpC3iLJlzmc8w==@vger.kernel.org
X-Gm-Message-State: AOJu0Yy2R8lfk9tTKhe/hQ68uWKzCliTBW+koU0AA2+TVgeNwLX+yjPl
	29w0guzAyT7TKyGNcegDxA1x7gRQhaEWMvA6KDOg/289ski5S1j2rJlV
X-Gm-Gg: Acq92OGM/sYp3mMS2lpesdAtDy3XIbD69StZ93DC2KRkHO2op9BQPk3QnGRXvGMxY5M
	QLBE7p1Og5T9zGrjAJhhF/vIiY71QZc1wOU+Y2yV4j2CYxhmwHpoKBYyHL9fmys2UkIFqYxO9aM
	ZqfoNGRiydmyNAMUw+AfqgzguNs50KDziwPTHkIHsJQZd2bnBgPvivgd6bg2Im4ky7lCC6JGX2x
	x1vDJdmMa8+HCVrCXy70BlbtO3no7smaVZOJzT1nDTJwmAgTPOhB6Hgabl6Af+HFL6JkcCY+y6w
	KvpQMc/9UboHL7liuwsZn09U0lMB0op7Mt6Q2aBa97OtDP8WR/EUK2UJeNhDfG+VSrI/a99jORt
	jEC6ltk05Bf3sKEbjT0yFusw+G0qj3QTKtQA0sjxHIYxKMeUVVA0a2ZoK8yk43UciRtnEzxJfjA
	ePGEszttlrgSTqyFjamU9sbxv09bT2oQ==
X-Received: by 2002:a05:7300:7241:b0:2d9:a799:3c4f with SMTP id 5a478bee46e88-303986a68d3mr12488515eec.24.1779282140215;
        Wed, 20 May 2026 06:02:20 -0700 (PDT)
Received: from ?IPV6:2600:1700:e321:62f0:da43:aeff:fecc:bfd5? ([2600:1700:e321:62f0:da43:aeff:fecc:bfd5])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-302973bcc5asm18539569eec.22.2026.05.20.06.02.19
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 20 May 2026 06:02:19 -0700 (PDT)
Sender: Guenter Roeck <groeck7@gmail.com>
Message-ID: <dacef233-ce52-44b4-a74c-8d0935668caa@roeck-us.net>
Date: Wed, 20 May 2026 06:02:18 -0700
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 0/2] Add support for Infineon Digital eFuse XDP730
To: ashish yadav <ashishyadav78@gmail.com>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, linux-hwmon@vger.kernel.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 Ashish Yadav <ashish.yadav@infineon.com>
References: <20260519075558.91466-1-Ashish.Yadav@infineon.com>
 <51133193-57fb-4a22-bf9e-9817f1f52ad5@roeck-us.net>
 <CAJKbuCbW9frUay5Z1NzF+RbiCEU6t+-p20YTwNhdWjnxJu_FOg@mail.gmail.com>
Content-Language: en-US
From: Guenter Roeck <linux@roeck-us.net>
Autocrypt: addr=linux@roeck-us.net; keydata=
 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
 np3900V20aS7eD9K8GTU0TGC1pyz6IVJwIE=
In-Reply-To: <CAJKbuCbW9frUay5Z1NzF+RbiCEU6t+-p20YTwNhdWjnxJu_FOg@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 5/19/26 23:40, ashish yadav wrote:
> Hi Guenter,
> 
> Thanks for your time and response.
> You are entirely correct that the XDP720 and XDP730 drivers are 99% identical.
> The only functional difference between the two variants lies within
> their GIMON values.
> 
> To programmatically identify whether the current target device is an
> XDP720 or an XDP730, the system must query the MFR_MODEL register.
> Because this register is 8 bytes long, it requires an I2C Block Read
> operation to retrieve the model identifier string.
> However, some embedded I2C controllers do not natively support I2C Block Reads.
> It is precisely due to this hardware controller limitation that we
> proposed developing two separate drivers, ensuring reliable
> compatibility across different system architectures.
> 

All you need to do is to add the second compatible to the first driver,
and use driver_data (i2c_device_id) and data (of_device_id) to
distinguish the chips. Many other drivers do just that.

Guenter

