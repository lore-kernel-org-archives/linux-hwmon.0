Received: from mail-pg1-f175.google.com (mail-pg1-f175.google.com [209.85.215.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9D20C18E06
	for <linux-hwmon@vger.kernel.org>; Fri, 15 Mar 2024 18:05:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.175
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1710525940; cv=none; b=RrAv6UNUd49ePA+XUpS75PqUs01HltdjKXBsydz/Ap8gRZDOgRqWyN+TfZPWBk8SXXIktYALwNTVqnCN++orOXaPNCIkVj79mAonDA+YlmVjobtu8c7U2tDa6lpJ+7tgC3r9tOzg27ZXOM9bCoQUOxfMNuB40guM2UAYPMdLHIY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1710525940; c=relaxed/simple;
	bh=RVCpoFVZVx+OMen290vlrhXMbc8lnUzw2tV9hON5YUY=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Onll/Gi78cXiig6g3avu48brgK4ghRHOYPQiMs8x8G0BO6ju2Z+k1/Vd/fUgYDW5rfTb5kWvpz4fkFiY0aepb61l7vti3y3MgsM7gXMtxsGlUk4/l/dtEcW8zGfoWz3zR8WJodFppmQ4DZe6dNNXEOhVz00bEs8xl9NQZwg2eOo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=QzerfHYC; arc=none smtp.client-ip=209.85.215.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="QzerfHYC"
Received: by mail-pg1-f175.google.com with SMTP id 41be03b00d2f7-5d3907ff128so1878211a12.3
        for <linux-hwmon@vger.kernel.org>; Fri, 15 Mar 2024 11:05:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1710525938; x=1711130738; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :sender:from:to:cc:subject:date:message-id:reply-to;
        bh=MN5Iro+jhUVYwiNe6VllWJ1u1FSKGDoula49d9INN+M=;
        b=QzerfHYCMP+Mxc+cUez4oG4Bizd3SyzIAsT4lMIDC3ctqDm0kwumxMFfnO8/TDBJuF
         uFgkcPqWMAZPHz4+TbVBR5/m9ZHlS5l98aRPv49tS7bLonpe5QYNYljKzWC6CZ2XF/GW
         g1e/ooJTwjOkQWYZimfjgjIAJgUCrv3DrKqgqYRfCLSxrwhTHWA5YLqZthzj4hao5HAX
         zrJEwt2xHN8TvnT2PTk+59lwqpPngCwtT0MT6w7eKK02udIazZxI7EgfvnNCkYsgKgSX
         n6DTKvDclV7qWFAntabZ8EDGuY5kMgBXbdi1lXE2wj4AVJIiwLfPJLUsii4GjY8pkkGZ
         jEdA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1710525938; x=1711130738;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :sender:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=MN5Iro+jhUVYwiNe6VllWJ1u1FSKGDoula49d9INN+M=;
        b=OKT4i0Jgz9NUAI4D1XwIGkzFO+kaTvv5AKxHL3L1IgUtyEKjMIadMFCNEiKaLO93zQ
         64n+NBXZImpJhYYAbEjD8JIuFCa0xf/e57OPWPguR/6oqQOoV1zdRgRTJ/dO3pNgezDZ
         KWSEj1XVY88OZ6hSGWE7o9nUdgTiBapfusIITHh3wQ+t6S+71LYaSiXZ01k7GATbD7W/
         JKLQrqhgLVVyoUP/EzAADdWAjnMSxYuURk5ahB0ZSSbNNZrbCVwzPHSc/xRbIUTOkafW
         JGg0QKITsgIJAcln+DmJtbc49FwuLjeUUkTM6caYZMqmcomssP47ADBb50duOcX1RIkQ
         cbXA==
X-Forwarded-Encrypted: i=1; AJvYcCWXPW0V9cAL5p9BufYoFw29OEw+LAhB+QIiS+2SSPjFkArrMJyD2jjj8x7So8vCFT3WQFZwewlmmZqWrqpOD3BbxodUGdkavUpav/4=
X-Gm-Message-State: AOJu0YwhBMHI37ch8b6eKMpBM4eIOWYOBDe7lRHfQCftBgUcBm3nChFh
	LbsPEDChHXdAKdsNAiuhO5pPJHnzsujUQADAIGXrbWQ03QT+oM7m
X-Google-Smtp-Source: AGHT+IFn0Hb6u53eRspnzbD4L2oneZqyNiqQthSJvrgWtnpJLUqopKfLtplacx/ORAOfXG/8pBAStg==
X-Received: by 2002:a17:90b:19d8:b0:29d:ef61:e56 with SMTP id nm24-20020a17090b19d800b0029def610e56mr3256127pjb.21.1710525937801;
        Fri, 15 Mar 2024 11:05:37 -0700 (PDT)
Received: from ?IPV6:2600:1700:e321:62f0:329c:23ff:fee3:9d7c? ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
        by smtp.gmail.com with ESMTPSA id i90-20020a17090a3de300b0029c69c5afd9sm3552171pjc.0.2024.03.15.11.05.36
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 15 Mar 2024 11:05:36 -0700 (PDT)
Sender: Guenter Roeck <groeck7@gmail.com>
Message-ID: <7fe93aaa-b0ac-4952-a5ef-f42b6053b42e@roeck-us.net>
Date: Fri, 15 Mar 2024 11:05:35 -0700
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 0/1] hwmon: (pmbus_core) Relative encoding of vout related
 commands
Content-Language: en-US
To: Lars Petter Mostad <larspm@gmail.com>, jdelvare@suse.com,
 linux-hwmon@vger.kernel.org
Cc: Lars Petter Mostad <lars.petter.mostad@appear.net>
References: <20240315151855.377627-1-lars.petter.mostad@appear.net>
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
In-Reply-To: <20240315151855.377627-1-lars.petter.mostad@appear.net>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 3/15/24 08:18, Lars Petter Mostad wrote:
> PMBus 1.3 allows for relative encoding of voltages in certain output
> voltage related commands. I'm starting this thread to ask if adding support
> for this, either by me or someone else, is of interest. I have made an
> initial attempt to add support that is adequate for my needs. I have
> included the patch for discussion. I don't expect it to be accepted as is.
> 
> I'm working on the software for an ARM64 based board that uses the
> TDK FS1412, which uses relative encoding. This is the only chip that uses
> this feature that I have access to. I only have access to this chip on this
> board, so I'm only able to test it on this architecture. I have to use the
> kernel sources from NXPs LLDP project, which ATTOW is based on kernel
> 6.1.55. I'm not able to test on a newer kernel at the moment. The board is
> fairly expensive, so I don't dare test setting voltages. I have only tested
> monitoring voltages.
> 
> In relative mode, certain output voltage related commands (e.g.
> VOUT_MARGIN_HIGH) are encoded relative to the nominal value (VOUT_COMMAND).
> If e.g. the high margin is to be 10% above the nominal value,
> VOUT_MARGIN_HIGH is set to 1.1. This factor is encoded the same way as
> VOUT_COMMAND (i.e. as indicated by VOUT_MODE).
> 
> I have been a little unsure about how to best organize the changes.
> Decoding the relative values requires access to the current value of
> VOUT_COMMAND. I decided to handle it the same way exponent is handled.
> I placed the relevant information next to exponent in pmbus_data.
> vout_mode_relative is true if relative encoding is used, vout_command
> stores what is believed to be the current VOUT_COMMAND. As exponent,
> vout_mode_relative is set during decoding of VOUT_MODE in
> pmbus_identify_common.
> 
> I decided to assume that VOUT_COMMAND is not changed outside the driver,
> as this is also done for VOUT_MODE. VOUT_COMMAND is read and saved during
> pmbus_init_common. It is also saved to vout_command during
> pmbus_regulator_set_voltage.
> 
> pmbus_regulator_set_voltage usually clamps the requested voltage to be
> between VOUT_MARGIN_LOW and VOUT_MARGIN_HIGH. This does not make sense in
> relative mode, as the margins move with the requested voltage. This part is
> skipped in relative mode.
> 
> pmbus_reg2data does the actual relative decoding. The pmbus_reg2data_*
> functions return the register value multiplied by 1000, which in relative
> mode means the permilleage of the nominal value. If we are in relative mode,
> and the current register is one of the registers that can use relative
> decoding, the permilleage value is multiplied with the stored vout_command.
> Currently, the vout_command in pmbus_data is stored decoded, i.e. 1000x and
> rounded to an integer. Better precision could be achieved if the
> multiplication was done inside each pmbus_reg2data_*, before the rounding
> to integer, but this would be a bit messier.
> 
> I welcome comments on wether this is of interest, and what is needed to
> get it into an acceptable state!
> 

My major concern is unintended side effects. In drivers/hwmon/pmbus/tps546d24.c
we "solve" the problem by explicitly setting absolute mode. Would that help
for the time being ?

I'd prefer to get some experience with actual chips (meaning evaluation boards)
before trying to provide a supposedly generic solution which retains relative mode.
I ordered a couple of evaluation boards for TPS546D24 variants. The evaluation
board for FS1412 is a bit too expensive for my liking, so I don't really want
to order that one. Do you know of any other chips supporting this functionality ?

Thanks,
Guenter

