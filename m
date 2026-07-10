Received: from mail-pj1-f51.google.com (mail-pj1-f51.google.com [209.85.216.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 632CC378D7B
	for <linux-hwmon@vger.kernel.org>; Fri, 10 Jul 2026 09:03:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783674182; cv=none; b=rosRWfLg5RdyX756W66+znluduybqW+lM74q4k9F7OJMPbp6g7+tmjl5uUdWP9nf4YNh1XJgvA7gVG9AY0zh1cEQiP2Brzk/MZZ3Sal2rzdp5991GPmfqn37PwRtevq1zTYSUTyeQpIGe68r14u0Bd1OngJEd2zyn4xttZ3CsyM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783674182; c=relaxed/simple;
	bh=yS+D7Yh6VLESKL29dn7AwPsjJuH2JMz3ARZkDbtPiaw=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=KQqN9KuEXok7pe4yisg9qtB3ckS42Ccdqm9ekl/h4vVV5XUkmTuqmQFZqdRA6zwSyeTK+Qmr2B5M1UOg3LGyd5QCeeSN1/LijCd4DrvnduTX72osM9vq3tTWosy8qzUk/phNZ/ZT4d7Frv2WbCpOnd2iZ5yFugDkblWxatLL7YE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=lXG0GYAG; arc=none smtp.client-ip=209.85.216.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="lXG0GYAG"
Received: by mail-pj1-f51.google.com with SMTP id 98e67ed59e1d1-37df72c9984so1180887a91.3
        for <linux-hwmon@vger.kernel.org>; Fri, 10 Jul 2026 02:03:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1783674180; x=1784278980; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:sender:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=xLUP21qH9+C2FWM0Q2A3xSawKuiQx3BFMnoKvPIx5rk=;
        b=lXG0GYAGxGz8MamP2dfcUWNUwEQkrwZTr0Z1bPnO/SgQ7dC+cTYebzhEpGB6pFsNpc
         EM0Xs+RtFaaxwpGFliXNTiozLERn9bv+DZo4DInvPKz9aEDtXOU6L1FVeEab46y/WUku
         e5lxREmWYj5qZJBtbKQ4XtgOySGByB+r713GIblpYCZnHgUUAXGA3fKeQUzCpJ4pktWs
         ag5kEj8HxXeDFbpGjjKQLL3sgOFNiPr/g+gtboK+qYanneix6HmDM5mqUiw/xgd3bA7w
         lS6Tk/vI5MhwWecXjjmDVBbEf0JQGzl+/LgzEYL/fXoZt6oLX2P84+RsurE/2pUS1lAQ
         ttpw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783674180; x=1784278980;
        h=content-transfer-encoding:content-type:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:sender:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=xLUP21qH9+C2FWM0Q2A3xSawKuiQx3BFMnoKvPIx5rk=;
        b=nENZl0RZwietPgHgTZ+yaCxsz8Hc22VILZC/uCU/r5g9bYHjHTC0H/c4/XAQlE2Nph
         FcA21royMiKu6bzcA32uWeedDQG5jBnJqlpGSbgxXIsKmQrKM2yW8loPkXydgnro+Z6l
         3tn0cBR74m4rIqnCQ/0F4gBiIHD/rMaCNQuoU9+ke021w+6R8awPHiEZ+5nPwXaaRhNG
         3yvL+TS33kNv3U0sr6a3AZsJL/KOdSarkQmlafwkpmW3AWp1DZ4X21gDpw5Vno1Jl8hI
         S2TGYnEm63YFnN2iHTYZem0j77zUxusCydg7hNJlYG4kUmh+zDG+7EpRx+rzNk+aHbsK
         EmIg==
X-Forwarded-Encrypted: i=1; AHgh+RpoADFJDT8boSugyLpQdfjNqXrn7cdGZRmIwvarwyOrP8B9QhzpmXyPgW3rNZ2hJpHZ92NqsEw/vww8Ug==@vger.kernel.org
X-Gm-Message-State: AOJu0YwZoZ7x/ORxhspG6K4rm39wx+ftQPVtSue8LMzwzDx32hEqgtN2
	30c+v1Sij5DnuLn3LoX0YeOrqTrDxeO9yvI8kOGOcmJVsNU9cI7CMsvm
X-Gm-Gg: AfdE7cnPxEnulPqxrjBzk5KAWNzVBlIbDHRmuMw5+v4v8Lk2jjX9QQ8OgFfmRNZ62dk
	Yu1d544c8pgVY6CIpUGo87exlh5aiKRLdTCmYVaXjluEQsHQtqOhWulEJs1SpZnWns8XAci7EXl
	1896yvjHakLwkp/J/VBhBL6mnUrAQ3M9wl2FD5bhsEAQLUrFIM0nL3zxKPnQ8UN9tXeDf6V0pZA
	BEWzWUKVlpSzSYGmXzGmZcZU1sc/2Wn5o//MhA3iBkSeyIK1GVwTqMNJo5akPvjdusEiF0qIW4H
	V4Jxi8JdGtMCnzBtp1XcBKejoiaf/bhJuFNHTNIfM1JHwOdQ199GezXsNDXZxDhiVRXfnGFvDRp
	OtKhlh/FQ7GNqAm3vWeHkUv2xDJkIX2Tug5KBtjKLaGtPbqOdbsMjDR/NYfO6YYWUgDchUwFmQe
	5fAm7X3fH0keE4WmaGoygDOBX7xZfmWDefN3p2q6sz9URJm5xHJ0w6qkHGzpjbGQ==
X-Received: by 2002:a17:90b:2583:b0:388:cfc4:7e6a with SMTP id 98e67ed59e1d1-38940638ab4mr10835570a91.13.1783674179698;
        Fri, 10 Jul 2026 02:02:59 -0700 (PDT)
Received: from ?IPV6:2600:1700:e321:62f0:da43:aeff:fecc:bfd5? ([2600:1700:e321:62f0:da43:aeff:fecc:bfd5])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-311747f596asm38928403eec.2.2026.07.10.02.02.58
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 10 Jul 2026 02:02:58 -0700 (PDT)
Sender: Guenter Roeck <groeck7@gmail.com>
Message-ID: <5bb24169-6d8f-4401-8650-2a04bf49a2c5@roeck-us.net>
Date: Fri, 10 Jul 2026 02:02:57 -0700
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/2] hwmon: (asus-ec-sensors) add T_Sensor for ROG STRIX
 X870E-E GAMING WIFI
To: Eugene Shalygin <eugene.shalygin@gmail.com>
Cc: Vishaal Saraiya <vishaal.saraiya@gmail.com>, linux-hwmon@vger.kernel.org,
 linux-kernel@vger.kernel.org
References: <20260709204037.1998433-1-eugene.shalygin@gmail.com>
 <20260709204037.1998433-2-eugene.shalygin@gmail.com>
 <ce6bca91-ca18-4764-a268-1429b41fb918@roeck-us.net>
 <CAB95QAQSevPFXHxJ0yGonjXee8-qG2KWUKW5YDT+C4Fuji33qQ@mail.gmail.com>
Content-Language: en-US
From: Guenter Roeck <linux@roeck-us.net>
Autocrypt: addr=linux@roeck-us.net; keydata=
 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
 np3900V20aS7eD9K8GTU0TGC1pyz6IVJwIE=
In-Reply-To: <CAB95QAQSevPFXHxJ0yGonjXee8-qG2KWUKW5YDT+C4Fuji33qQ@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Eugene,

On 7/9/26 22:47, Eugene Shalygin wrote:
> Hi Guenter,
> 
> On Fri, 10 Jul 2026 at 06:58, Guenter Roeck <linux@roeck-us.net> wrote:
>>
>>> Enable T_Sensor for ROG STRIX X870E-E GAMING WIFI. Board specs list the
>>> sensor, reading return -62, which is one of the blank values for
>>> temperature sensors in the ASUS EC.
>>>
>>
>> Just like Sashiko, I don't really understand this patch or, rather,
>> its description. What is the point of adding a sensor which is expected
>> to return -62 ?
> 
> The motherboard provides sockets where users can connect thermistors
> (T_Sensor, Water_In, Water_Out). When the socket is empty, readings
> the sensor value returns a special blank value, which is -40 for older
> board generations (maybe BIOSes?) and -62 for the newer ones. It is a
> good flag that the temperature sensor "exists" at the given EC
> registry index. Hope this clarifies the motivations behind the commit.
> 
> I should have noted those values and properly return -ENODATA, but now
> I'm not sure which board family uses which value. I will try to
> salvage this information from my notes and the Libre Hardware Monitor
> project (where I implemented blanks from the beginning and users fill
> that bit of information when adding support for their motherboards),
> but for now the driver returns those blank values as is when actual
> sensor is not connected. If that fails I will likely test for both for
> all the boards... Anyhow, this shortcomings will be addressed.
> 

Do you expect me (or anyone else) to be able to deduct that from
the patch description above ?

Guenter

