Received: from mail-pf1-f172.google.com (mail-pf1-f172.google.com [209.85.210.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B3E621EB5CF
	for <linux-hwmon@vger.kernel.org>; Sat, 19 Apr 2025 22:38:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745102336; cv=none; b=YrXn4i0SUKlEwvO09whyiTV/aHva9ZqAsueCLvSxE/+yLKuG4oVfKE3SnoY/A/zvbPtYkiYQ+dHZ2tyuUJJYb1B7gU8w+EGg4ocQBpTZ00DEOtyIngnwE9LpDPQA9FR1Niep6iYa1x6daxwEk6NXGeEnt1EMD4wWXiFsspl50Xk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745102336; c=relaxed/simple;
	bh=U750WMqu40iLciT/mTogBYr6harB3KvLgXN/fLg+AOE=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=QkTmwWa3yce7XYZLqIQzuvGJthmTOQNps2fghRTftNxd/h90jfAWP0N2Q/5u7Xvq5+V4G3Mgah16gBBU7klAZ6HxsKBbRCqS767OhCvE8zBOVvasZbOOq3e7WsyX47oJXrxJm1wiXn9ynIgfa6QfxaV6+9a/na0ynhsVU1sAzyM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=eiQ+NO7o; arc=none smtp.client-ip=209.85.210.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="eiQ+NO7o"
Received: by mail-pf1-f172.google.com with SMTP id d2e1a72fcca58-736c1cf75e4so2685934b3a.2
        for <linux-hwmon@vger.kernel.org>; Sat, 19 Apr 2025 15:38:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1745102334; x=1745707134; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:sender:from:to:cc:subject:date:message-id:reply-to;
        bh=QBYHQ4JnuwsmkkqEwegYrlQyKiFdsE20ywWr4x5+QhI=;
        b=eiQ+NO7orRwQFGaFhn48+rwBDNL8Tp1eBiC4EB1LTZrror8IIJcWZyamJujJvrObbY
         6PriNWpoIY0AwBpeaOsBqGHJaleATOHHOG2Vxria5nTpbHZVvD8Sd8FVpSwX6dXkRSae
         5BckiJI4JLsZ2TKiRuS/YJm73j85JlqvRzq6gji5hONteNAxCmcXvfB3pgCoY0pmchdp
         XfVqQ+UPchjXQDZV4WusU6guXtRvoK9cxqCyOIWvK6tbn4lpnCdFyd0iB7NID6RYF30y
         THVNVBKHfFh3YDc7bast9vKJsCfQrrnAx/ty/Tpc3L7x/CVG3P0sFvIpaLK/7Lpr0pww
         NIaA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745102334; x=1745707134;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:sender:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=QBYHQ4JnuwsmkkqEwegYrlQyKiFdsE20ywWr4x5+QhI=;
        b=KBWCjfvHxpVXwKF7bwHS9MyYn8g/bfGvUXgnTx1iTTCLIAkxUDk9RhLF8O7AOY/Djs
         viLq81tZJr3LDa6a269bw1yvAPs7xMy1614aK1lonIWRMcepWOhVKRMVI/GvqGQnhZem
         K41ekCSLPY0eZLvfXCFS2dvi15DBIz1nd1BM6U7RydylMQJORU39iagIffGpCvf74JBs
         RcnrBVEdKiU9Y8W04csKLJq08+kQm8D9poHferoR52AeX+vLr4ILj7tmpzvwh7mrjmCI
         K4hTi9Kqi/lVn3vrCDU4SHz8nW/KGK6E8Y8YeArsWk9+FzDnrEcfy/+hqt6+Mt41lTV3
         7v+A==
X-Gm-Message-State: AOJu0Yy+TqXXA8ijj/CXfkcWYWMdhFLUCQJchkEkap74tfJq+NaHTSDS
	+HrzObK5sEv8MvDGlIcjUk7pibHymK94+mK2uOXJmFl7r1lwJ2UkPFfVNQ==
X-Gm-Gg: ASbGncsisIz9oRT6j6NxH0h0HJEBRjWccdIy2MRh8BrmmAa8Cp9gH53bKX+T2clGvEZ
	L24ndGVrGog2ugogBueaONBOh76yq9k9eZvgDXOOCEPPcaOlmIVqVq6H/x+katnbbsrF0NtNlg3
	j2QZSyJsFYHiTreoMFA6ZRHl8u4OTlmNKfNrlCX1nxEXFb/2yWE9oDA933H7MLhnwHtMEYoMqt9
	hqGq6pVd0Ff3fJtsJxLciFEoco2UUqrS1xj/XnbcY9y/LBsTdX1DJm3ibO0CS0fvhFow4KG/gjv
	ik33cyTfhwKYMpdRApGT/gMN31jYDpn2o16crWUPPMNYQFCR+Klw56tZX8VMvaZdO4UNVdDEvuX
	iZR9jORgELmK5xg==
X-Google-Smtp-Source: AGHT+IHfBHLARaADdc7r8EHFWi9IUcG4ALJ3nI5REFxU9pPRcqk7qDQE/fpGaxg3Ub1i8VY9qtFVnQ==
X-Received: by 2002:a05:6a21:1645:b0:1f5:706b:5410 with SMTP id adf61e73a8af0-203cbd46b3amr11070261637.38.1745102333770;
        Sat, 19 Apr 2025 15:38:53 -0700 (PDT)
Received: from ?IPV6:2600:1700:e321:62f0:da43:aeff:fecc:bfd5? ([2600:1700:e321:62f0:da43:aeff:fecc:bfd5])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-73dbf8e4e5dsm3925816b3a.61.2025.04.19.15.38.53
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 19 Apr 2025 15:38:53 -0700 (PDT)
Sender: Guenter Roeck <groeck7@gmail.com>
Message-ID: <eb5796e8-de76-4e91-9192-65b9af7a4d49@roeck-us.net>
Date: Sat, 19 Apr 2025 15:38:52 -0700
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: PMBus memory overflow
To: Matt Corallo <yalbrymrb@mattcorallo.com>
Cc: linux-hwmon@vger.kernel.org
References: <985cd95f-155b-4b8a-9fe7-59938d0c2b8f@mattcorallo.com>
 <9e01e3ec-3ac5-4d83-a065-d00d568b9cc7@roeck-us.net>
 <e030f44f-11ee-4739-b9d3-c22883bbbf02@mattcorallo.com>
 <336f298f-497f-4dd9-97ee-50b81221be06@roeck-us.net>
 <1b1eccff-a306-4e17-a6bf-fd3203c61605@mattcorallo.com>
 <1edc8396-535d-4cdf-bbb7-11d559d4c257@roeck-us.net>
 <cfc2b3c8-3f94-407a-a4d5-e7d81686eb2d@mattcorallo.com>
 <84258b48-03b5-4129-bed5-f8200996f2eb@roeck-us.net>
 <fcfd78d2-238d-4b68-b6ec-5ee809c4ef08@mattcorallo.com>
Content-Language: en-US
From: Guenter Roeck <linux@roeck-us.net>
Autocrypt: addr=linux@roeck-us.net; keydata=
 xsFNBE6H1WcBEACu6jIcw5kZ5dGeJ7E7B2uweQR/4FGxH10/H1O1+ApmcQ9i87XdZQiB9cpN
 RYHA7RCEK2dh6dDccykQk3bC90xXMPg+O3R+C/SkwcnUak1UZaeK/SwQbq/t0tkMzYDRxfJ7
 nyFiKxUehbNF3r9qlJgPqONwX5vJy4/GvDHdddSCxV41P/ejsZ8PykxyJs98UWhF54tGRWFl
 7i1xvaDB9lN5WTLRKSO7wICuLiSz5WZHXMkyF4d+/O5ll7yz/o/JxK5vO/sduYDIlFTvBZDh
 gzaEtNf5tQjsjG4io8E0Yq0ViobLkS2RTNZT8ICq/Jmvl0SpbHRvYwa2DhNsK0YjHFQBB0FX
 IdhdUEzNefcNcYvqigJpdICoP2e4yJSyflHFO4dr0OrdnGLe1Zi/8Xo/2+M1dSSEt196rXaC
 kwu2KgIgmkRBb3cp2vIBBIIowU8W3qC1+w+RdMUrZxKGWJ3juwcgveJlzMpMZNyM1jobSXZ0
 VHGMNJ3MwXlrEFPXaYJgibcg6brM6wGfX/LBvc/haWw4yO24lT5eitm4UBdIy9pKkKmHHh7s
 jfZJkB5fWKVdoCv/omy6UyH6ykLOPFugl+hVL2Prf8xrXuZe1CMS7ID9Lc8FaL1ROIN/W8Vk
 BIsJMaWOhks//7d92Uf3EArDlDShwR2+D+AMon8NULuLBHiEUQARAQABzTJHdWVudGVyIFJv
 ZWNrIChMaW51eCBhY2NvdW50KSA8bGludXhAcm9lY2stdXMubmV0PsLBgQQTAQIAKwIbAwYL
 CQgHAwIGFQgCCQoLBBYCAwECHgECF4ACGQEFAlVcphcFCRmg06EACgkQyx8mb86fmYFg0RAA
 nzXJzuPkLJaOmSIzPAqqnutACchT/meCOgMEpS5oLf6xn5ySZkl23OxuhpMZTVX+49c9pvBx
 hpvl5bCWFu5qC1jC2eWRYU+aZZE4sxMaAGeWenQJsiG9lP8wkfCJP3ockNu0ZXXAXwIbY1O1
 c+l11zQkZw89zNgWgKobKzrDMBFOYtAh0pAInZ9TSn7oA4Ctejouo5wUugmk8MrDtUVXmEA9
 7f9fgKYSwl/H7dfKKsS1bDOpyJlqhEAH94BHJdK/b1tzwJCFAXFhMlmlbYEk8kWjcxQgDWMu
 GAthQzSuAyhqyZwFcOlMCNbAcTSQawSo3B9yM9mHJne5RrAbVz4TWLnEaX8gA5xK3uCNCeyI
 sqYuzA4OzcMwnnTASvzsGZoYHTFP3DQwf2nzxD6yBGCfwNGIYfS0i8YN8XcBgEcDFMWpOQhT
 Pu3HeztMnF3HXrc0t7e5rDW9zCh3k2PA6D2NV4fews9KDFhLlTfCVzf0PS1dRVVWM+4jVl6l
 HRIAgWp+2/f8dx5vPc4Ycp4IsZN0l1h9uT7qm1KTwz+sSl1zOqKD/BpfGNZfLRRxrXthvvY8
 BltcuZ4+PGFTcRkMytUbMDFMF9Cjd2W9dXD35PEtvj8wnEyzIos8bbgtLrGTv/SYhmPpahJA
 l8hPhYvmAvpOmusUUyB30StsHIU2LLccUPPOwU0ETofVZwEQALlLbQeBDTDbwQYrj0gbx3bq
 7kpKABxN2MqeuqGr02DpS9883d/t7ontxasXoEz2GTioevvRmllJlPQERVxM8gQoNg22twF7
 pB/zsrIjxkE9heE4wYfN1AyzT+AxgYN6f8hVQ7Nrc9XgZZe+8IkuW/Nf64KzNJXnSH4u6nJM
 J2+Dt274YoFcXR1nG76Q259mKwzbCukKbd6piL+VsT/qBrLhZe9Ivbjq5WMdkQKnP7gYKCAi
 pNVJC4enWfivZsYupMd9qn7Uv/oCZDYoBTdMSBUblaLMwlcjnPpOYK5rfHvC4opxl+P/Vzyz
 6WC2TLkPtKvYvXmdsI6rnEI4Uucg0Au/Ulg7aqqKhzGPIbVaL+U0Wk82nz6hz+WP2ggTrY1w
 ZlPlRt8WM9w6WfLf2j+PuGklj37m+KvaOEfLsF1v464dSpy1tQVHhhp8LFTxh/6RWkRIR2uF
 I4v3Xu/k5D0LhaZHpQ4C+xKsQxpTGuYh2tnRaRL14YMW1dlI3HfeB2gj7Yc8XdHh9vkpPyuT
 nY/ZsFbnvBtiw7GchKKri2gDhRb2QNNDyBnQn5mRFw7CyuFclAksOdV/sdpQnYlYcRQWOUGY
 HhQ5eqTRZjm9z+qQe/T0HQpmiPTqQcIaG/edgKVTUjITfA7AJMKLQHgp04Vylb+G6jocnQQX
 JqvvP09whbqrABEBAAHCwWUEGAECAA8CGwwFAlVcpi8FCRmg08MACgkQyx8mb86fmYHNRQ/+
 J0OZsBYP4leJvQF8lx9zif+v4ZY/6C9tTcUv/KNAE5leyrD4IKbnV4PnbrVhjq861it/zRQW
 cFpWQszZyWRwNPWUUz7ejmm9lAwPbr8xWT4qMSA43VKQ7ZCeTQJ4TC8kjqtcbw41SjkjrcTG
 wF52zFO4bOWyovVAPncvV9eGA/vtnd3xEZXQiSt91kBSqK28yjxAqK/c3G6i7IX2rg6pzgqh
 hiH3/1qM2M/LSuqAv0Rwrt/k+pZXE+B4Ud42hwmMr0TfhNxG+X7YKvjKC+SjPjqp0CaztQ0H
 nsDLSLElVROxCd9m8CAUuHplgmR3seYCOrT4jriMFBtKNPtj2EE4DNV4s7k0Zy+6iRQ8G8ng
 QjsSqYJx8iAR8JRB7Gm2rQOMv8lSRdjva++GT0VLXtHULdlzg8VjDnFZ3lfz5PWEOeIMk7Rj
 trjv82EZtrhLuLjHRCaG50OOm0hwPSk1J64R8O3HjSLdertmw7eyAYOo4RuWJguYMg5DRnBk
 WkRwrSuCn7UG+qVWZeKEsFKFOkynOs3pVbcbq1pxbhk3TRWCGRU5JolI4ohy/7JV1TVbjiDI
 HP/aVnm6NC8of26P40Pg8EdAhajZnHHjA7FrJXsy3cyIGqvg9os4rNkUWmrCfLLsZDHD8FnU
 mDW4+i+XlNFUPUYMrIKi9joBhu18ssf5i5Q=
In-Reply-To: <fcfd78d2-238d-4b68-b6ec-5ee809c4ef08@mattcorallo.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 4/19/25 12:29, Matt Corallo wrote:

> Hmm, doesn't seem to trigger it at least with pmbus_peek.c, the following diff still doesn't hit the too big prints:
> 

Only idea I have at this point is to either enable smbus tracing in the kernel
or (better) to add test code into i2c_smbus_read_block_data() to see what
exactly triggers the problem.

Guenter

