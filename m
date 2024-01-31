Received: from mail-pl1-f178.google.com (mail-pl1-f178.google.com [209.85.214.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5F7A3634
	for <linux-hwmon@vger.kernel.org>; Wed, 31 Jan 2024 01:10:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.178
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1706663430; cv=none; b=NRfioPmIOlp+VFK22D70yVlZGZVbQ/jVRilFuwT2BbcUs37TaiaPoeFxT5O+hqfEJCcKD40iLvdRa19oX+qOCIOeN3/qRlFn0lkcXX+5+sBrj/id2X23KAAj/bwa0PL8J2+iU15ps/brKVODCH4Cdn1QGWRKXgcuAxD37xK/xv0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1706663430; c=relaxed/simple;
	bh=SHIFFk4r7HTsH3128an16jNnomo2+vLkUaly2w9f0HI=;
	h=Message-ID:Date:MIME-Version:Subject:To:References:From:
	 In-Reply-To:Content-Type; b=hSJ0sbyWj7obMAlVGHAdVmM5braL+g7RKKl7Nx6vDASrEBMIC8HtwFNerXlcQ9fsB7teJnWjjoy3M3SQNJXC+wnx2UQZcq+JwBXxvkwa4z8daZSihfYogslJihI+UiZMb6yjTBuk8r8bpDNJ5szHoVU5evAcU9/02VtEnjQIR5I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=dZXVC3hM; arc=none smtp.client-ip=209.85.214.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="dZXVC3hM"
Received: by mail-pl1-f178.google.com with SMTP id d9443c01a7336-1d7881b1843so38429975ad.3
        for <linux-hwmon@vger.kernel.org>; Tue, 30 Jan 2024 17:10:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1706663427; x=1707268227; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :sender:from:to:cc:subject:date:message-id:reply-to;
        bh=r1AnzlQnWOZPDIcCFp1UkihMb8E6oE7qbUH8q67Wnds=;
        b=dZXVC3hMkyIrS5CadMPlkAXkNZ7mRU8gmJleDoq3r1MmAknz8ZmGxqLGkWCHZQXPSx
         9Bc8dDl+fjmsRdxW2Ndq0PNMKwzyQ8vO7UpjggRfMCYB15WT1KMMvf9XC4lKXDEPFNz+
         CUAT4kxTT0q1goERZ/6lS5ipQrSywG4ezIkExPKRQpS7jhqrEj8fwE9zNrYTyaJsA8Ar
         Da+M38HT0GaODNWFnTHg9cq7ttTwIWdMSMNhLIAIqbfIlgfmRoAl0cislmNP10wiAsUQ
         GHjSTUpq6lW7BYNMIyX9q1lM6zID2+ms/Nbx4WqojMJ3ncHevH0y/kZmpmJf6JdQgbLj
         teQg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1706663427; x=1707268227;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :sender:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=r1AnzlQnWOZPDIcCFp1UkihMb8E6oE7qbUH8q67Wnds=;
        b=ayDWYEfcjLwMgez2cdc4XEqcDWGZFBHC+cGd2okbemNcBh/+asw4cuiLiDSsXkP2JX
         5U5QRmY9KK+uhFW15FVDhauoQNMv90cP2XZOWFlkm6oFQrJnv9YvuIEQB6vD06Hw7MUo
         GsR2cwUtHMkpZiErHhWGeQ9bBE66YW1Pqb5OHdsyu7L3xNpcAUEi2/+rYD2yDCfnZBYT
         NmTtpohqAn4EBfSVIbc5iIy9PwOhc5w0kOPfsq6vZGmJAdQXtkKmJBGHVB+e35W6jJP9
         unh8H9bJZRbf+PJ5VmyeGmKiJrYMAYZEggoH4qJQqoOPctGI3LqwaHvokHHzSHFbzS/t
         g4sQ==
X-Gm-Message-State: AOJu0YzuRRYvUIpMVQ1HNVqhRDoDhI33L9lhQtZR4hZcsHwAVCXQIA7H
	3W1ubujTTmDLdS/lNgekMn1C5/+AnqAldHe2XTL7Sde0aVPdwZ7ps9gEvRY2
X-Google-Smtp-Source: AGHT+IFN4xQi+ZKFhHj7pEVjw6rPM9i2JElCD1zykMEv58h5V1h2zhJMMXiIrW4sVyigG7+jgUd3eg==
X-Received: by 2002:a17:902:ecd1:b0:1d7:428f:50fd with SMTP id a17-20020a170902ecd100b001d7428f50fdmr421763plh.31.1706663427563;
        Tue, 30 Jan 2024 17:10:27 -0800 (PST)
Received: from ?IPV6:2600:1700:e321:62f0:329c:23ff:fee3:9d7c? ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
        by smtp.gmail.com with ESMTPSA id d21-20020a170903209500b001d8e3cb1528sm4274462plc.264.2024.01.30.17.10.26
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 30 Jan 2024 17:10:26 -0800 (PST)
Sender: Guenter Roeck <groeck7@gmail.com>
Message-ID: <38692993-7a24-4555-bfc4-435952162cb7@roeck-us.net>
Date: Tue, 30 Jan 2024 17:10:25 -0800
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: Clarification on shunt-resistor value for ina219
Content-Language: en-US
To: Sahaj Sarup <sahaj.sarup@linaro.org>, linux-hwmon@vger.kernel.org
References: <CAKZ1LvMMri3dVKxGDCY5mkXKA1evkOaD4dGF02A9qYdbiWMp7Q@mail.gmail.com>
From: Guenter Roeck <linux@roeck-us.net>
Autocrypt: addr=linux@roeck-us.net; keydata=
 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
 mDW4+i+XlNFUPUYMrIKi9joBhu18ssf5i5Q=
In-Reply-To: <CAKZ1LvMMri3dVKxGDCY5mkXKA1evkOaD4dGF02A9qYdbiWMp7Q@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 1/30/24 03:46, Sahaj Sarup wrote:
> Hi,
> 
> I had a quick question about the ina219 driver
> 
> https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/tree/Documentation/devicetree/bindings/hwmon/ti,ina2xx.yaml
> 
> Is the devictree expecting the shunt-resistor value that is actually
> on the PCB or is it some calculation based on the calibration value
> being a static 4096?
> 
> I am confused because of this comment in the driver

The comment refers to the relationship between calibration value
and shunt divider. It (tries to) explain how the values in
ina2xx_set_shunt() are calculated. The shunt resistor value provided
in devicetree or with platform data should be accurate.

> 
> ```
> In order to keep calibration register value fixed, the product of
> current_lsb and shunt_resistor should also be fixed and equal to
> shunt_voltage_lsb = 1 / shunt_div multiplied by 10^9 in order to keep
> the scale.
> ```
> 
> I am seeing a bit of deviation with a 13 mOhm shunt at 12v 3A, I am
> getting a reading of 3.14 A from the ina219.
> 

Given that there are always system deviations/inaccuracies, that doesn't
sound too bad to me. If you can calibrate against actual measurements,
you could try to improve accuracy by providing a slightly different shunt
resistor value.

Guenter

