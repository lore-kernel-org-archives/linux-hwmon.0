Received: from mail-wm1-f43.google.com (mail-wm1-f43.google.com [209.85.128.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A4FFA1BC3C;
	Sun, 26 Jan 2025 19:16:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1737918967; cv=none; b=IJpazxh7LgxApzx9FNzS1Aom9oNULE6wkhOZ3S2SPPEKek4UdWNXV6qxaw0nusu7dIHMFGGIODXZLxH/bAEoGXUFThuSJ3O3SWVe61E6jqLC0Njs93t8UzE7hhQIhhgxNQTmHd0opakXHUkZqtOf96MmWcJw0KCKCOepvBNKG8Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1737918967; c=relaxed/simple;
	bh=DbpF7IdylgT9EIOW8ASq3bnPiBETV/PA5Iug4ylmqlk=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=JDKS8argMDkcwTZCCdTg1k/B2DJ+S2QigEx1jy3WOgmB4wwYFDerGeuXN0yOfLtc9A2YMyghW2QOCpjRL6I7csvra2es+ZteZi0ycmpaKpyhMh4gGXa2mTKpturpLC3juPb/yLISqclz9PgpRQ2CaAqmHK3Zu9LL/OMhl51qM7U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=OIW5tMvF; arc=none smtp.client-ip=209.85.128.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="OIW5tMvF"
Received: by mail-wm1-f43.google.com with SMTP id 5b1f17b1804b1-4362bae4d7dso25978315e9.1;
        Sun, 26 Jan 2025 11:16:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1737918964; x=1738523764; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=P7d3nHmsZeYuaU6Wy31SpyuyJfW31sxLNL9J194WwWg=;
        b=OIW5tMvFZYp+u/1FxiQNcMtIZsv430szsN2j/rp682/SBJnipC3AZNqp28w15C23+G
         ySdXHC9yF4h+ME5oe+du/7uMVh6C5VT66efKScp5BYmnKceYDMWoEnQiL9UWEfgA6vhR
         Gd3RP9GCwNUI1B0RFC0+T4Kj9cfgrNGrwPno6Vykih8adRowI7Mks62Iy9WM+ms2lRJh
         6NhCZumvVKqbKODZtQs297o8NkMhGj3QDzV7Wdbs4RBNAgqJqKfZuKO0mt9Q0bB+RdUF
         5cTd31uqNdiHWgGhalYAMmqFl+FKecHDodCo9NJunpfIT07mXDojzSFCpCJMneb7SNkN
         98ww==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1737918964; x=1738523764;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=P7d3nHmsZeYuaU6Wy31SpyuyJfW31sxLNL9J194WwWg=;
        b=q/yOUxEcbiQbzkIhP2YozbwWv2BGtbbkpY47o5GY57Jxh2PD1a4My1J5rfuQJ3kdaR
         1aJ/wBFIYgw53eTLojYWX2lgetFHvCKHvqHvR3E3u3cB7s9Ey/Ce3uZKlg4wvgV+kBqT
         IPXrS2acA1FTuX6Fdb7DWxJBJsdx3BSSOJ29852nkFrhqbZ8i5jHyMd0TkF82DuxT/Og
         4G5OHxQ21/NhTKqyUf8uz5xkJ1oqI1T5aSjHz9d2cGlMZJJZb308XfdYTQPtJlrxjxQX
         1CYE11TPbIVaFMq/6vCiYwk6IyEhG6hdpE+ID5oncmCLLi8Rk5nipKxnv2xgyzYqyFz5
         Cm4w==
X-Forwarded-Encrypted: i=1; AJvYcCVajKqc0S6sxw5ytfBczOKaPsVTP7K3vr9O0xXlCSt1nn95UMnOHypjMW+B+nnILQT4zXMU9Xiff3m8vBoG@vger.kernel.org, AJvYcCWlZ7te3RbNRSnpBH9QMkU1N325b6/B4Kk4ofh8FdKCgMUpQOCQGUw0tduji03QgzuEdk/PhyucTpdC@vger.kernel.org
X-Gm-Message-State: AOJu0YzLdz5ERz2OF/BEcs9hivlFOl3jVzzOYo8b6xhMBzwh6iNSXJro
	oMXK9Z/VhmeLgwMQRKSXutE9xwNNLhQvW7DK1fFD72K6wJ1iKAxh
X-Gm-Gg: ASbGnctRlYETSR/srXlAzrcU7Mw+XEXPlwjueAvxxv6kFucGhMcwlwJ/+eH79S7jZ3E
	4MwqegPCPkBQ1bteVDFtid3Xlr8yWGVMBm0MMnNa4fSUstDNjR+cnXT5n3KbQBBnX5H+07bGgO/
	wj0fOJkEtZYpEjo4woze4rPi3uJIVX5wLU9uNw/rrTOT7rmLDcgrMHaXlS8cZak9SKgnEZ9pj0Y
	Yb5O5zVDJRzXzDzkQ+zxTMG2fRaw6op0lIahofxY6CPdZuFn913/oKeNKh9hv510+hciz9Yurf2
	JU4J3eMVTucHhkbEQ8uCjC9hYVyd4mKWbvNp4y3yM6bIPQjJzudl1n4kgGG1kIdFC3dVnQR9WOg
	5KJxvX1/X9W9wDEglgrTAyozTnKueHXldNJpIaZXh+X3g0L6cU6NGfPVHLYqozifbQTWvSShPFw
	WFEW8ftw==
X-Google-Smtp-Source: AGHT+IEqxaA+UUz+1/b4zNc3jUj4rZPq0t7IwwWU12uFm5szX22Q5LgeAhCZRs5Wl+LiVQfqMJHjQQ==
X-Received: by 2002:a05:600c:3484:b0:434:f8e5:1bb with SMTP id 5b1f17b1804b1-438913e48fdmr363531245e9.12.1737918963786;
        Sun, 26 Jan 2025 11:16:03 -0800 (PST)
Received: from ?IPV6:2a02:8388:e103:2700:6509:cde7:b0a9:d5b3? (2a02-8388-e103-2700-6509-cde7-b0a9-d5b3.cable.dynamic.v6.surfer.at. [2a02:8388:e103:2700:6509:cde7:b0a9:d5b3])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-438bd4a283csm105452325e9.0.2025.01.26.11.16.02
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 26 Jan 2025 11:16:03 -0800 (PST)
Message-ID: <0e003860-004c-4004-ad13-36c77e1b8378@gmail.com>
Date: Sun, 26 Jan 2025 20:16:01 +0100
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/2] hwmon: add driver for HTU31
To: Guenter Roeck <linux@roeck-us.net>, jdelvare@suse.com,
 conor+dt@kernel.org, robh@kernel.org, krzk@kernel.org,
 christophe.jaillet@wanadoo.fr
Cc: linux-hwmon@vger.kernel.org, linux-kernel@vger.kernel.org,
 devicetree@vger.kernel.org
References: <20250126144155.430263-1-andrey.lalaev@gmail.com>
 <20250126144155.430263-2-andrey.lalaev@gmail.com>
 <1f76d87e-cf99-4114-bb3f-d812bbc5b45f@roeck-us.net>
Content-Language: en-GB
From: Andrei Lalaev <andrey.lalaev@gmail.com>
In-Reply-To: <1f76d87e-cf99-4114-bb3f-d812bbc5b45f@roeck-us.net>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 26.01.2025 15:59, Guenter Roeck wrote:
> On 1/26/25 06:40, Andrei Lalaev wrote:
>> Add base support for HTU31 temperature and humidity sensor.
>>
>> Besides temperature and humidity values, the driver also exports a 24-bit
>> serial number and heater control to sysfs.
>>
>> Signed-off-by: Andrei Lalaev <andrey.lalaev@gmail.com>
>> ---
> ...
>> +
>> +static struct attribute *htu31_attrs[] = {
>> +    &dev_attr_heater_enable.attr,
>> +    &dev_attr_serial_number.attr,
> 
> I'll accept the heater enable attribute as sysfs attribute,
> but the serial number is most definitely not a hardware monitoring
> attribute. Please expose is through debugfs.

It makes sense. Will be moved to debugfs in v3.

Thank you!

 
Best regards,
Andrei Lalaev
