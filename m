Received: from mail-pf1-f177.google.com (mail-pf1-f177.google.com [209.85.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 79427208C4
	for <linux-hwmon@vger.kernel.org>; Fri,  8 Nov 2024 16:26:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.177
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1731083191; cv=none; b=Cx7rTaXzj/pKwhuSuLSLLhH8L3cqBDcOVAxHU/9+ZvI9uc3QOQXjdVwwjoIavtoHyPQF0HiC1sAXDaXx6TzZd7mTBNXSeai8wBlsjGC1NRwg2FTuk2dCzAPH/Hk0Zp4l2VpMi9s5Mr3a6VnA3vU4/U+7b+AbV+QAMJ+ze6mZ7T8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1731083191; c=relaxed/simple;
	bh=O0G9klQ8E+HpuwaeDrvzFR6i+M5MK0SexAIoTHS2GIw=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=t2cAR9aaZ6gkqzKHnYGAZQh8TPHP9TrcWUnYz7cTfoi+pSGXhan4T0Rt9lkPM9Rj8s8NGDeqt3ehE0cB+Du/CnPTp7sNDF9TmsiVgX+xPdgVYk/5mJpV72sbFSjJTp+W0aVQoiq2fdAF9nnZ8VcbVcUF/rPIajcUEywHOEKPVw0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=BA5VNcB6; arc=none smtp.client-ip=209.85.210.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="BA5VNcB6"
Received: by mail-pf1-f177.google.com with SMTP id d2e1a72fcca58-7240fa50694so1411914b3a.1
        for <linux-hwmon@vger.kernel.org>; Fri, 08 Nov 2024 08:26:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1731083189; x=1731687989; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:sender:from:to:cc:subject:date:message-id:reply-to;
        bh=ZJIip1SSvUOk+sJTTDkh7uoyoLO772xSjRHO2+YTUeo=;
        b=BA5VNcB6Ivq7X9nLnanQ1pLHTYNESBwbe8HP7Q+Sd1L4NBKX8S3GJLE9PKLnqxg/Ks
         psvcMaWCtCd+J+BQ9yXliZdIsdGS4ViO8Vl5uw8RirWG0v+Bf8cKu1Ybf3uBYuu7CJVx
         fqdDBzpQ2sBtvi5TUOZLtkFKxr4gtbk+d8KjJ55qxjE+ZT476Laa1o3uMBYWAqsCkBMo
         GgUEVLqTNLUn+WMhD7ojSlwH92ZW+oPNHPdoiI0ePZLig5X2yKu7fK9sB8l9IapMrM7R
         sYz7/fT5GlTnvoKie7/rWYBwfsRrcnkelelPOZVp2A2qiH/IH9TYEhHbb8dbcwexbr2B
         5kmw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1731083189; x=1731687989;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:sender:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ZJIip1SSvUOk+sJTTDkh7uoyoLO772xSjRHO2+YTUeo=;
        b=snIymVSH8nPr1w9zv+aQ+s8LXS1h975+BJaJrUDVgtYEcOoytkLvPhJVp/axQH7Ljh
         0pdK/z7qs/ms7EcJSYZGzEOQ6mQjn+C0raeeQRe1ey9u+4jTG/nRuQQ535ySqLMOcxwV
         fDE7FiRDVVavQSUPhlGZOeJdE+irT9lgGesIcw9bO3xJiUEtnv10PswPcV8EKMvorSgp
         wZ2eKz6r9tgvXX8gmpYTB7w8DL6KMe0N45P5+/S5IpTiSZ1f1KVt4XHDaWoUY9IjoYQI
         TIFdiIZBMRRKDNqVGAAgY99BQeUFyHH0Uza5gPGIMqkpB0O0E/BvR6QmYdFwVJZqT8Nl
         4OKA==
X-Forwarded-Encrypted: i=1; AJvYcCX/t2Mf3mWCdFqyGHDkRhM9bD8Ygow5VsRw8ZcGjHX6HHhBQlB9zfUHZsTlZX0HSVqhUkJu2HTlTfGwhQ==@vger.kernel.org
X-Gm-Message-State: AOJu0Yyga7/97uvJQw/JtnrihbBRVYv30+4LDhaoStmZbtNBdU3+anQn
	s8HYQ/MmoYQ0/BczIAWjNdQ6cvQB+qTJTksWjqTgzP9d+59zCZ2h
X-Google-Smtp-Source: AGHT+IGpsqSoSHtJgeZUzjGwGZZFig0qwtIaFWOqUODF9EcB1WLpn6mFiQYy6q76o3NDGabk4CUMXg==
X-Received: by 2002:a05:6a00:2e99:b0:71e:4ee1:6d79 with SMTP id d2e1a72fcca58-724132749f9mr4252390b3a.2.1731083188771;
        Fri, 08 Nov 2024 08:26:28 -0800 (PST)
Received: from ?IPV6:2600:1700:e321:62f0:329c:23ff:fee3:9d7c? ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-72407a571a8sm3848794b3a.195.2024.11.08.08.26.27
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 08 Nov 2024 08:26:28 -0800 (PST)
Sender: Guenter Roeck <groeck7@gmail.com>
Message-ID: <94683c23-ac6e-4bcd-836e-a1f3dfea5768@roeck-us.net>
Date: Fri, 8 Nov 2024 08:26:26 -0800
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: CPU/GPU fan control with safety via hwmon
To: Werner Sembach <wse@tuxedocomputers.com>,
 Hans de Goede <hdegoede@redhat.com>, linux-hwmon@vger.kernel.org
Cc: Armin Wolf <W_Armin@gmx.de>, Juno Computers USA <usa@junocomputers.com>
References: <172b7acd-4313-4924-bcbc-41b73b39ada0@tuxedocomputers.com>
 <f26d867e-f247-43bb-a78b-be0bce35c973@roeck-us.net>
 <a73488bf-fd53-4894-a47f-8d76148b5e10@tuxedocomputers.com>
Content-Language: en-US
From: Guenter Roeck <linux@roeck-us.net>
Autocrypt: addr=linux@roeck-us.net; keydata=
 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
 mDW4+i+XlNFUPUYMrIKi9joBhu18ssf5i5Q=
In-Reply-To: <a73488bf-fd53-4894-a47f-8d76148b5e10@tuxedocomputers.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

On 11/8/24 08:13, Werner Sembach wrote:
> Hi,
> 
> Am 08.11.24 um 15:30 schrieb Guenter Roeck:
>> On 11/8/24 04:05, Werner Sembach wrote:
>>> Hi everyone,
>>>
>>> I'm currently conceptualizing an upstream implementation for the fan control on our Sirius 16 Gen 1 & 2 devices which has the following custom WMI functions (pseudo code):
>>>
>>> void SMOD(bool mode): Toggle firmware controlled fans vs manually (aka via the commands below) controlled fans
>>> bool GMOD(): Get current SMOD setting
>>> int GCNT(): Get number of fans
>>> enum GTYP(int index): Returns "CPU-fan" or "GPU-fan"
>>> void SSPD(int index, int value): Set fan speed target as a fraction of max speed
>>> int GSPD(int index): Get current fan speed target as a fraction of max speed
>>> int GRPM(int index): Get current actual fan speed in revolutions per minute
>>> int GTMP(int index): Get temperature of thing fan with respective index is pointed at (CPU or GPU die, see GTYP)
>>>
>>> However there are some physical limitations that are not in the firmware and I would like to implement as low as possible in software, aka the driver, to avoid hardware damage:
>>>
>>> 1. Valid fan speeds are 0% (fan off) and 25-100%. Values from 1%-24% must not be written.
>>>
>>> 2. As long as GTMP is > 80°C fan speed must be at least 30%.
>>>
>>> We would love to see the same driver enforced restrictions in the Uniwil driver Armin is working on and the Clevo driver Juno Computers is working on.
>>>
>>> My Idea so far:
>>>
>>> 1. Round SSPD input: 0-12% -> 0%, 13-25% -> 25%
>>>
>>
>> That is acceptable.
>>
>>> 2. Periodically check GTMP (every second should be enough) in driver and if the temperature is over 80°C set current and incoming speed commands to at at least 30%.
>>>
>>> Is this legitimate with the hwmon design?
>>>
>>
>> No. That would have to utilize the thermal subsystem. hwmon is not intended to
>> _control_ the environment, only to monitor it.
> 
> Thanks for the hint, I was not aware of the thermal subsystem until now.
> 
> But still wondering, doesn't have the hwmon interface also some write functionality? Or am I completely mistaken here?
> 

That is to set limits and other chip configuration, not for active environmental control.

>>
>>> Second question: Is there a good way to implement a userspace controlled switch between auto and manual mode?
>>>
>>
>> Only if that is a direction to the chip to switch between modes.
> Yes, via WMI you can set the mode to "manual", then you can use the wmi to set the fan speed to whatever speed you like. When it is set to auto, the EC itself applies an internal fixed fan curve.

The standard attribute for that would be pwmX_enable (since fans are usually controlled through pwm).

Guenter

>>
>> Thanks,
>> Guenter
>>
> Kind regards,
> 
> Werner
> 
> PS.: By missclick I accidentally sent an empty email before. just ignore it.

