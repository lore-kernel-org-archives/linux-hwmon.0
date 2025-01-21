Received: from mail-pj1-f52.google.com (mail-pj1-f52.google.com [209.85.216.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1A9031BF24;
	Tue, 21 Jan 2025 01:45:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1737423954; cv=none; b=SsYAKw/iNdiTsYAK02dNs1EWykiwMr+CSmTylgXHeULGWHHawmeDpOK155y0cejbxKNmCydhp3bHUESYVpOdG/6PzDAv78xA9CmDZy1ZM1RgC73edXtWsezGaaq1cSR2Cwyahd/pgiFDrWYnaOD0FHNZcONmxyzHgHE2gr2zfcU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1737423954; c=relaxed/simple;
	bh=/yzteNkZ3adgHsuKguGT4D7OV/MjhhR39zzMcticf4g=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=BUYWGFieUorscqLTOvbErEEVJwkhy11QeH4QO8IgflHF+JVboaH8N/XNWhFibyx9Cd9LllrKMTrWXwS093aO6K2ThbM4dgztfIUxO4Bgcj5JJJ+OkjVNedQIy4+TimQu/Be5LKrx0VlxQZH8VBck5rSwMdspCa2jnnZZJTEXuCU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=DbuH4fgI; arc=none smtp.client-ip=209.85.216.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="DbuH4fgI"
Received: by mail-pj1-f52.google.com with SMTP id 98e67ed59e1d1-2f13acbe29bso9355542a91.1;
        Mon, 20 Jan 2025 17:45:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1737423952; x=1738028752; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:sender:from:to:cc:subject:date:message-id:reply-to;
        bh=VKVsqZF9+6ovBx/OIhYqLQbyeUxQ8EOaPTZIXYaobcw=;
        b=DbuH4fgI0a/CqG+S/NSumCek0BrxJAnnc3NG00MMm3DwCFdtTlbzHuRspf2Ih+w5dE
         Oa2sWLC9MmaHh5ZX0Hjdhl+QVr5imys+aGuxTyk8JtA6TwzNK7F2jCxU/PlfPuXG9MTO
         uW+8XcdgoW+eTXs9os2Jq7asm13lQlpsMOLm9VR7krrnqq3tS9PvWbtJ/6SkgtsT5GUp
         Hh4jMTRxH4maa0xJvhPma/DcjleRKSqHDkb1sRxLylgfmiuZVY5gy5lLvtYT9L5u/eZt
         u4fP9/r19KFWYUaUrTETsZUu66K4CgFM4C4cL/6KmKbIEtHXC+yCUAbJ3YVT6ORAraum
         jvOQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1737423952; x=1738028752;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:sender:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=VKVsqZF9+6ovBx/OIhYqLQbyeUxQ8EOaPTZIXYaobcw=;
        b=l8A2zOmYv5avgud5ru0VcVjAWrDHipWNQVikErO4oSItBPFo0JN3HtGRgECanyd6pC
         cQ0ElokQu0hUNBtZ3CnkJPQW2xv5sdHgXK/zHD8KG5jvqttKrCd/h3xGiFassoaE5z+D
         CinWgGsVFh41NIlpJwokrhlwzPrzmZCXU09euhkQAwMVzSCzxGoZw7PoUKr0OZbELyjq
         abZbPTV+YuNO7JhgsJvaO3K6F2+gqcOzP+G49yoHrbna+vc/iJV0znb/c7FLtoy8YBSb
         okoZcFra48aRNk2oGxMWrmlw3oX2nvHgDjp0tFNCzwanWVvfq1Q0H6+IBtW8h/VgtIpv
         NgUQ==
X-Forwarded-Encrypted: i=1; AJvYcCWPMvNN5PVcljv3J97neRm7dfeNRzIVc3zb+QCquSY54pkuA0ZdXJM0tWIOHjsrQsVpJWr+3IcuimzjWA==@vger.kernel.org, AJvYcCXAdhZrtBEUmEGjNrWZiw5/bGLHeWAcz5aFFHmPKZfNAxrwTy0bTdx+UQY6J1/kHtMuHzhsCR9jfEZsEqjd@vger.kernel.org
X-Gm-Message-State: AOJu0YyCPG/KqVOPK07H1oJsi1HtaJSMEIUKKKlUVgLSBQ8Nz5xR0pnD
	EptYLqoYh87LjFlL6tz7Wy0xV3w7HhMjXqShHbZLQE858aoMo/TL
X-Gm-Gg: ASbGnctXgSEkBOethewn6mDp6MusBtCj9anBcWtTLs3WgayOw/3fZqrh0m0SP9QGG0z
	WcGLEaQ5eGN4TwCTNcRVo4LzOftzpmecVwR8cHDgRQPKDLxYq1/ixb37tIuiHMBFvojnh7UhMtY
	Co3zvZKm7mz0rZRtQLSVNeZbTasSwl2ZX5+pEc0GWI17ZMrcLmbZZRO0rvnE5Tt4C8LSPrNrqCP
	YNhL0O1VTvra9COkjOYC/FWgxgGyMGXmrZVkwF4PfpwIrfS2wcOvQe02sMHT2bVRzD0GeuPGquT
	Kj8k8PTFrnAOAtjEzdBXR+k9ZuQy2OckVND580rWhSY=
X-Google-Smtp-Source: AGHT+IHHNyfaCKJMSwWS7JlxQV7Jij9hUuXw79ed0N0JqlcirWn+UtqFQ3Il8oHbx+enznGlSKbChw==
X-Received: by 2002:a05:6a00:2d1b:b0:724:db17:f975 with SMTP id d2e1a72fcca58-72db1ca2f49mr22939336b3a.12.1737423952184;
        Mon, 20 Jan 2025 17:45:52 -0800 (PST)
Received: from ?IPV6:2600:1700:e321:62f0:da43:aeff:fecc:bfd5? ([2600:1700:e321:62f0:da43:aeff:fecc:bfd5])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-72daba53723sm8092379b3a.147.2025.01.20.17.45.50
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 20 Jan 2025 17:45:51 -0800 (PST)
Sender: Guenter Roeck <groeck7@gmail.com>
Message-ID: <db04ca68-dea3-4c1d-9378-cb0316759d16@roeck-us.net>
Date: Mon, 20 Jan 2025 17:45:50 -0800
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] hwmon: ina238: Add support for shunt voltage scaling
To: Potin Lai <potin.lai.pt@gmail.com>
Cc: Jean Delvare <jdelvare@suse.com>, Patrick Williams <patrick@stwcx.xyz>,
 linux-hwmon@vger.kernel.org, linux-kernel@vger.kernel.org,
 Cosmo Chou <cosmo.chou@quantatw.com>, Potin Lai <potin.lai@quantatw.com>
References: <20250121-potin-ina238-shunt-voltage-scaling-v1-1-36d5dfe027f5@gmail.com>
 <ef0741d5-832e-4c15-ae45-f4efcf4bc443@roeck-us.net>
 <CAGfYmwX2fEPmLbc2rP=R10WaV_LpX-_uy+SZnJ+gYg3bnO_Yag@mail.gmail.com>
Content-Language: en-US
From: Guenter Roeck <linux@roeck-us.net>
Autocrypt: addr=linux@roeck-us.net; keydata=
 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
 mDW4+i+XlNFUPUYMrIKi9joBhu18ssf5i5Q=
In-Reply-To: <CAGfYmwX2fEPmLbc2rP=R10WaV_LpX-_uy+SZnJ+gYg3bnO_Yag@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

On 1/20/25 17:18, Potin Lai wrote:
> On Tue, Jan 21, 2025 at 12:38 AM Guenter Roeck <linux@roeck-us.net> wrote:
>>
>> On 1/20/25 08:23, Potin Lai wrote:
>>> The INA238 sensor reports shunt voltage with microvolt precision.
>>> However, the hwmon driver currently exposes this value only in
>>> millivolts via `in0_input`, which results in a loss of precision for
>>> readings within the range of ±1 mV.
>>>
>>> This patch introduces an `in0_scale` attribute to provide the scaling
>>> factor applied to the shunt voltage reading. By exposing this attribute,
>>> users can accurately interpret the in0_input values in microvolts,
>>> preserving the sensor's full precision.
>>>
>>> Signed-off-by: Potin Lai <potin.lai.pt@gmail.com>
>>
>> Sorry, this is an ABI violation and thus a no-go. in0_input is and will
>> always be reported in mV.
>>
>> Guenter
>>
> 
> Hi Guenter,
> In our use case, the shunt voltage is less than 1 mv most of the time.
> I would like to get your advice on the correct way of getting
> microvolt reading from the driver? Thank you.
> 

Given that V = I * R, assuming you know the shunt resistor value,
it is an easy calculation which does not require any code changes.

Possible alternatives:
- Create a debugfs file to display the voltage in uV.
   See drivers/hwmon/isl28022.c for an example.
- Implement a hwmon -> iio bridge and use IIO to report
   the voltage.

Having said that, do you have an actual use case ? What is the point
of knowing the voltage across the shunt resistor ? "Because the chip
reports it" is not a use case. Literally _every_ current sensor chip
ultimately reports the shunt resistor voltage, after all (typically
as current; calculation see above). Commit 63fb21afc1f5 ("hwmon:
(ina2xx) Use shunt voltage to calculate current") is a case in point.

Guenter

