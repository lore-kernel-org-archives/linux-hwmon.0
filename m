Received: from mail-pl1-f180.google.com (mail-pl1-f180.google.com [209.85.214.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6AAA328E02
	for <linux-hwmon@vger.kernel.org>; Sat, 27 Jan 2024 16:01:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1706371283; cv=none; b=AuWVr5x243RrpTtiuE7zf/+4q4pqyj1z8uSnEuyImcC5J3FS+GlNFeYOVbHSj7F+Twe/9jshrgBdmnDQjrPPLeKsq/Wk1tq3ReUFlM7Pc5DRQ6N3OQZjhgY++7+ZSyDwjI+2hnNHnqwXP8VbeI9uCrG0F8tOben9+czBixYLpzo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1706371283; c=relaxed/simple;
	bh=+Q302vV+umy6MvRit2qbx8EWiCUGSTUF/2PzhfDu2s4=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=hOrpITnge7YR0QWid042OZuVDPdsp33tN2oRr5UBmYTkgwzyNGypxomWh9Xyjgzpjj7NM2Jdgi/DRcGij1Fw/WDl5yDc/VDWrJ+Mp5vPT9pjqfJDxKFJep4UtrDUryMLRjmNWZyA3OVROp+803OL7njYgGimfrL1/bOPjAmLjvk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=XDXXDn3N; arc=none smtp.client-ip=209.85.214.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="XDXXDn3N"
Received: by mail-pl1-f180.google.com with SMTP id d9443c01a7336-1d71e24845aso9407115ad.0
        for <linux-hwmon@vger.kernel.org>; Sat, 27 Jan 2024 08:01:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1706371282; x=1706976082; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :sender:from:to:cc:subject:date:message-id:reply-to;
        bh=wMJuk6n6ZrtmrThyrX23kvXb94msOBNQ22fOlBJOB+c=;
        b=XDXXDn3NiBWsUrX8BZ5PYnU51y4r36bB5coXJLBIUUeRlL2apX5vIjdbrCcXei3YXa
         GZSUoEZTqB3RH6KqWCbLemN9v99d2ojS51v7afPyepC1JspDvsX7W8SfVwnK1UY/q8RG
         ehX35jnJdrCuzAsXotOTCW3DqRW2xCjki6lRKxaphc6tMEdneaaJOgcdbR5xtOVoOshM
         oe8kK0bhnozCVMssqTloiOY5lpchadKZqmWj0dxQ1GiXxFW+gU/pyFdm6J5gElLQRF/c
         yLj3sQV2ohqLQnN40DMrk/mqp63eJ1VjnjPsrMxaAAnnqtieSrIKxyrx8y5UnGYasAnV
         4MAA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1706371282; x=1706976082;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :sender:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=wMJuk6n6ZrtmrThyrX23kvXb94msOBNQ22fOlBJOB+c=;
        b=MgY0/pSf/Gzpt1IVMNLa1gR6ZqD7nIASQx6Z1pfO9QJ6xcXaTAD1z4MrepMrHBGACu
         QY4fFOrfC6l/ZC0Nx8cYswBum0QY/qMvFMpdYHADh3xcSI+RZ2XKFcxxLFGBnzb+XmBg
         i80vTuWSw0+JhkieXNYXPZBSHiN2ZSTxOgXxAVJ6fNHoLzTPNdLiSRnkK8GUwkxgyjd/
         D/QJS+esW5SE2IZmM9NTkVKiqKp5i7sqq2RYTv03zhUZCj5XadKK7BdsOQrs1JThkqg8
         7LgwqE3K2iOpJfnWLGJMD1FkVPkPasRWQ58SwaJGhqiz1CG1UVCUFSqUFBYt9sqwMKSa
         WU1A==
X-Gm-Message-State: AOJu0YyU0z3ua0GhcAfE+Rl3ovxQgBeLHqZXon/J6GRyj+OLy7mqxBRH
	ZZ9JMNqA8uSJGVlDUEM4J8aIqmFQjbzbGatKuD9il/XiWOeJvrLOZ73Qu+e4
X-Google-Smtp-Source: AGHT+IGwTiOsBMb0lI8OL0/4DYfke0lZ1kp6ZyU1ndfQ/BfFMZyHW8hJPycxPQUoI8WG2ARZq8Guvg==
X-Received: by 2002:a17:903:1249:b0:1d7:3563:88e8 with SMTP id u9-20020a170903124900b001d7356388e8mr995321plh.103.1706371281730;
        Sat, 27 Jan 2024 08:01:21 -0800 (PST)
Received: from ?IPV6:2600:1700:e321:62f0:329c:23ff:fee3:9d7c? ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
        by smtp.gmail.com with ESMTPSA id o18-20020a17090323d200b001d8cb103327sm25081plh.215.2024.01.27.08.01.20
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 27 Jan 2024 08:01:21 -0800 (PST)
Sender: Guenter Roeck <groeck7@gmail.com>
Message-ID: <a15701d4-d786-49b1-9ce2-894dff508679@roeck-us.net>
Date: Sat, 27 Jan 2024 08:01:19 -0800
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] hwmon: Remove I2C_CLASS_HWMON from drivers w/o detect()
 and address_list
Content-Language: en-US
To: Heiner Kallweit <hkallweit1@gmail.com>,
 Michael Hennerich <Michael.Hennerich@analog.com>,
 Jean Delvare <jdelvare@suse.com>, Ibrahim Tilki <Ibrahim.Tilki@analog.com>,
 Daniel Matyas <daniel.matyas@analog.com>
Cc: linux-hwmon@vger.kernel.org
References: <75747c6a-d414-4b07-8f66-5a5cdddc3c36@gmail.com>
From: Guenter Roeck <linux@roeck-us.net>
Autocrypt: addr=linux@roeck-us.net; keydata=
 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
 mDW4+i+XlNFUPUYMrIKi9joBhu18ssf5i5Q=
In-Reply-To: <75747c6a-d414-4b07-8f66-5a5cdddc3c36@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 1/27/24 07:02, Heiner Kallweit wrote:
> Class-based I2C probing requires detect() and address_list to be
> set in the I2C client driver, see checks in i2c_detect().
> It's misleading to declare I2C_CLASS_HWMON support if this
> precondition isn't met.
> 
> Signed-off-by: Heiner Kallweit <hkallweit1@gmail.com>
> ---
>   drivers/hwmon/adm1177.c       | 1 -
>   drivers/hwmon/ds1621.c        | 1 -
>   drivers/hwmon/ds620.c         | 1 -
>   drivers/hwmon/ina209.c        | 1 -
>   drivers/hwmon/ina238.c        | 1 -
>   drivers/hwmon/max127.c        | 1 -
>   drivers/hwmon/max31760.c      | 1 -
>   drivers/hwmon/max31790.c      | 1 -
>   drivers/hwmon/max31827.c      | 1 -
>   drivers/hwmon/max6621.c       | 1 -
>   drivers/hwmon/max6697.c       | 1 -
>   drivers/hwmon/occ/p8_i2c.c    | 1 -
>   drivers/hwmon/pmbus/ir36021.c | 1 -
>   drivers/hwmon/powr1220.c      | 1 -
>   drivers/hwmon/sbrmi.c         | 1 -
>   drivers/hwmon/sbtsi_temp.c    | 1 -
>   drivers/hwmon/w83773g.c       | 1 -

Follow-up question: You did not drop the class from drivers/hwmon/adt7410.c
and drivers/hwmon/emc2305.c. Is that because of the address_list in those
drivers ?

As far as I can see, both address_list and I2C_CLASS_HWMON are useless
in those drivers and could be dropped as well. Am I missing something ?

Thanks,
Guenter

