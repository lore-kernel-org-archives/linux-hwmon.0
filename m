Received: from mail-pl1-f176.google.com (mail-pl1-f176.google.com [209.85.214.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C471470812;
	Mon,  6 Jan 2025 18:59:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.176
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736189977; cv=none; b=LVnaiU5kD3mCTZSsSCrEobaU8vbarsM7uXp3wrq0AGgIcpGRu2fNaVGAQXXWM7x0+OPrrt7Mosv7FiMvwwEJecMOTw6qcBvx5SL6WijsNZlucumffuTHe7gHB3VBZwHphSSxxyg+kYVa+wIBG99W7yiBWtUS+t9o/+5UdND7Iis=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736189977; c=relaxed/simple;
	bh=yhVjUp89GQXxqiTcKbCjZffJssDeVtri6t5u+S/Hhy4=;
	h=Message-ID:Date:MIME-Version:Subject:To:References:From:
	 In-Reply-To:Content-Type; b=EV6yY3jHMwOYbYPow8K6EzDF7YkqZV0/wnhhsfS6d3q0oIF1BAhDD43/LnZa1+hbM6iqLKYrwOCsxD477bqgMMsx8fyAc9MJ2lvAtCRhsDSJyHQr/xabxasvV34Bqc7Xs88gyXsVc0X3kvzVCzT7e2N629xXBbeKAri1zBC6tFE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=aq4ANmDW; arc=none smtp.client-ip=209.85.214.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="aq4ANmDW"
Received: by mail-pl1-f176.google.com with SMTP id d9443c01a7336-21628b3fe7dso206531745ad.3;
        Mon, 06 Jan 2025 10:59:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1736189975; x=1736794775; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:to:subject:user-agent:mime-version:date
         :message-id:sender:from:to:cc:subject:date:message-id:reply-to;
        bh=OD1zF/aARdnkj4JC9PmL7Mk82mhE+Oh01wC5iewFMVA=;
        b=aq4ANmDW5b63HFSdHLq63pqCxT0qcdss66YUPyy+nioVqKLCwoOvuEKvUnNzETxG8v
         cUUhpEl5f7C9AaPAHS6AWoUO4i82Z+4ioRKqB2/YNXc3i2coLIO/JHkM3awM9tw/4MJx
         LslshL5zeKD3TrP+QM7Cz674TEAtf3XJMINkppnHV0LMvuamFp96sna+yuPaKRofH0K5
         aZKsQ/xoNxAVxk053U6DYGQz+PZiYynGWsVvRFmaMoQgTawTh10IJJ/cfEReYXVVBNpr
         y/h5FsmV3UvlFLUnz7JRiTP8UsH4jAhS/cp5/roPpSUn0MAkFx97hs3flRwXoCqHCPBT
         k0tQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1736189975; x=1736794775;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:to:subject:user-agent:mime-version:date
         :message-id:sender:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=OD1zF/aARdnkj4JC9PmL7Mk82mhE+Oh01wC5iewFMVA=;
        b=bD9+SR0uECpPQjZoYY2dfamDm/VI/C24c5vvxUJ98IYVuILhTV8/gGUTkzQWeEGKmE
         LlEnwcPa41/d/EJdvsi9jZAXkwD9Yg0hjBFRdaDWZPp+B3xFNc1f1IVdHdcNFm2CSUKS
         V4EB/IFeBE9f5fgjlvSfZGXGTGKyPZBtpwtfSaIJl7V++RbTdU+O5a6xWi2VllsN5pOE
         g/D512a9Sn+Gew9tBvq99v9+USyyBN3FVrthkhmc/qvOsNFAMxeXv+zETwqWNCNZpR2l
         7PP4mSxnEGI6rPn/d/gjg/L0v5mOAGEbqU/+gVeRMZO1gvfuFb/X+Gk947ppTkNODyuo
         YMtA==
X-Forwarded-Encrypted: i=1; AJvYcCVGX32+VeIaEuaegqVImh09NSjTK3QbCwO81Z7oLpzpAMpYp3yDRFcSWmEmVULPjxWZiMWjT5GjpZqPcw==@vger.kernel.org, AJvYcCVxff5jXP1LDPp5RhLKv+vADAgJF5TU9X/TdG5ye9algn6hv4P9bGFHO1sEk+URKyLxEENbfX63GCTInB5p@vger.kernel.org
X-Gm-Message-State: AOJu0YxmHWPBTyhzzbSDUdQhPQsH5K+s1TLY186V0SmGIkzqL1B1eT8u
	bWfwGs9kBfgn00tzTrJBxJeYtVXUFlrsdMeDaHzC6iJJiGyk9lY2/21k8w==
X-Gm-Gg: ASbGncvcY9knWvrOuTKvA/JcyuV+hdJ/R3srrzTDiVXnV6yi+LIzpAFmJ008yAMqV/X
	50YqoT9orMXl/JjCL5zK+rxGzgSJeSVO0j5G2S3V/VfmqQlsabnZ+MQ+UXBpq6LKsoV8uYg25Hh
	/hMs2LdulDBjb+PVqdrrT92P/lgFOgjgO7l2PWs0laEwBCSSObudawT7hwyYO/2AmuJZuGsuWYY
	7N3wX5DfZWzKWn/6ForJL+aPpLj0ZdFH8hW2ZlZzg/gDOma4lBZHjTB9WCuDcEBDUuda78zLdxe
	K+j2ODg5qgXbc/xmmI6OVMVfp6vIeA==
X-Google-Smtp-Source: AGHT+IFNun+m2XucxxpEIinndN9qmYLISi5VjYzhB06sKakWbss3ZeMg0zUNASFCYwRLVhoZvT/D8w==
X-Received: by 2002:a17:902:dacf:b0:215:b5c6:9ee8 with SMTP id d9443c01a7336-219e6e85b4dmr618585285ad.7.1736189974924;
        Mon, 06 Jan 2025 10:59:34 -0800 (PST)
Received: from ?IPV6:2600:1700:e321:62f0:da43:aeff:fecc:bfd5? ([2600:1700:e321:62f0:da43:aeff:fecc:bfd5])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-219dc96eadcsm297087365ad.73.2025.01.06.10.59.33
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 06 Jan 2025 10:59:34 -0800 (PST)
Sender: Guenter Roeck <groeck7@gmail.com>
Message-ID: <76c4efa6-7765-42ee-a91b-dc8d5f9e9b3e@roeck-us.net>
Date: Mon, 6 Jan 2025 10:59:33 -0800
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/3] hwmon/adt7470: resolve faulty 'temp*_alarm' values
 read output
To: Adrian DC <radian.dc@gmail.com>, Jean Delvare <jdelvare@suse.com>,
 linux-hwmon@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20250105195521.3263193-1-radian.dc@gmail.com>
 <20250105195521.3263193-3-radian.dc@gmail.com>
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
In-Reply-To: <20250105195521.3263193-3-radian.dc@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 1/5/25 11:55, Adrian DC wrote:
> Tested with the following script:

The patch description is supposed to explain what is changed, and why.
Test results are appropriate after "---", but not as patch description.

> ---
> 
> {
>    # Access hwmon
>    cd /sys/class/hwmon/hwmon1/
> 
>    # Check alarms
>    alarms() {
>      echo -n ' [READ]'
>      echo -n " fan[1234]_alarm = $(cat ./fan[1234]_alarm | tr '\n' ' ')"
>      echo -n " temp{[123456789],10}_alarm = $(cat ./temp{[123456789],10}_alarm | tr '\n' ' ')"
>      echo ''
>    }
> 
>    # Configure hardware
>    echo '0' >./alarm_mask
>    echo '10' >./num_temp_sensors
> 
>    # Test fans
>    for fan in $(seq 1 4); do
>      echo " [TEST] fan${fan}_min : Min FAN speed ${fan} under limit"
>      echo '65535' >"./fan${fan}_min"
>      sleep 4
>      alarms
>      echo '0' >"./fan${fan}_min"
>      sleep 5
>    done
> 
>    # Test temperatures
>    for temp in $(seq 1 10); do
>      echo " [TEST] temp${temp}_max : Max temperature ${temp} over limit"
>      echo '-126000' >"./temp${temp}_max"
>      sleep 5
>      alarms
>      echo '127000' >"./temp${temp}_max"
>      sleep 5
>    done
> 
>    # Test clean
>    echo ' [TEST] Final state'
>    alarms
> }
> ---
> 
> Faulty values:
>    [TEST] temp1_max : Max temperature 1 over limit
>    [READ] fan[1234]_alarm = 0 0 0 0  temp{[123456789],10}_alarm = 0 1 0 1 0 1 0 1 0 1
>    [TEST] temp2_max : Max temperature 2 over limit
>    [READ] fan[1234]_alarm = 0 0 0 0  temp{[123456789],10}_alarm = 0 0 0 0 0 0 0 0 0 0
> ---
> 
> Fixed values:
>   [TEST] fan1_min : Min FAN speed 1 under limit
>   [READ] fan[1234]_alarm = 1 0 0 0  temp{[123456789],10}_alarm = 0 0 0 0 0 0 0 0 0 0
>   [TEST] fan2_min : Min FAN speed 2 under limit
>   [READ] fan[1234]_alarm = 0 1 0 0  temp{[123456789],10}_alarm = 0 0 0 0 0 0 0 0 0 0
>   [TEST] fan3_min : Min FAN speed 3 under limit
>   [READ] fan[1234]_alarm = 0 0 1 0  temp{[123456789],10}_alarm = 0 0 0 0 0 0 0 0 0 0
>   [TEST] fan4_min : Min FAN speed 4 under limit
>   [READ] fan[1234]_alarm = 0 0 0 1  temp{[123456789],10}_alarm = 0 0 0 0 0 0 0 0 0 0
>   [TEST] temp1_max : Max temperature 1 over limit
>   [READ] fan[1234]_alarm = 0 0 0 0  temp{[123456789],10}_alarm = 1 0 0 0 0 0 0 0 0 0
>   [TEST] temp2_max : Max temperature 2 over limit
>   [READ] fan[1234]_alarm = 0 0 0 0  temp{[123456789],10}_alarm = 0 1 0 0 0 0 0 0 0 0
>   [TEST] temp3_max : Max temperature 3 over limit
>   [READ] fan[1234]_alarm = 0 0 0 0  temp{[123456789],10}_alarm = 0 0 1 0 0 0 0 0 0 0
>   ...
> ---
> 
> Signed-off-by: Adrian DC <radian.dc@gmail.com>
> ---
>   drivers/hwmon/adt7470.c | 52 +++++++++++++++++++++++++++++++++++++++--
>   1 file changed, 50 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/hwmon/adt7470.c b/drivers/hwmon/adt7470.c
> index 712bc41b4a0d..afb881385dbb 100644
> --- a/drivers/hwmon/adt7470.c
> +++ b/drivers/hwmon/adt7470.c
> @@ -551,7 +551,40 @@ static int adt7470_temp_read(struct device *dev, u32 attr, int channel, long *va
>   		*val = 1000 * data->temp_max[channel];
>   		break;
>   	case hwmon_temp_alarm:
> -		*val = !!(data->alarm & channel);
> +		switch (channel) {
> +		case 0:
> +			*val = !!(data->alarm & ADT7470_R1T_ALARM);
> +			break;
> +		case 1:
> +			*val = !!(data->alarm & ADT7470_R2T_ALARM);
> +			break;
> +		case 2:
> +			*val = !!(data->alarm & ADT7470_R3T_ALARM);
> +			break;
> +		case 3:
> +			*val = !!(data->alarm & ADT7470_R4T_ALARM);
> +			break;
> +		case 4:
> +			*val = !!(data->alarm & ADT7470_R5T_ALARM);
> +			break;
> +		case 5:
> +			*val = !!(data->alarm & ADT7470_R6T_ALARM);
> +			break;
> +		case 6:
> +			*val = !!(data->alarm & ADT7470_R7T_ALARM);
> +			break;
> +		case 7:
> +			*val = !!(data->alarm & (ADT7470_R8T_ALARM << 8));
> +			break;
> +		case 8:
> +			*val = !!(data->alarm & (ADT7470_R9T_ALARM << 8));
> +			break;
> +		case 9:
> +			*val = !!(data->alarm & (ADT7470_R10T_ALARM << 8));
> +			break;
> +		default:
> +			return -EOPNOTSUPP;
> +		}

This can be simplified as
		if (channel < 7)
			*val = !!(data->alarm & BIT(channel));
		else
			*val = !!(data->alarm & BIT(channel + 1);

>   		break;
>   	default:
>   		return -EOPNOTSUPP;
> @@ -648,7 +681,22 @@ static int adt7470_fan_read(struct device *dev, u32 attr, int channel, long *val
>   			*val = 0;
>   		break;
>   	case hwmon_fan_alarm:
> -		*val = !!(data->alarm & (1 << (12 + channel)));
> +		switch (channel) {
> +		case 0:
> +			*val = !!(data->alarm & (ADT7470_FAN1_ALARM << 8));
> +			break;
> +		case 1:
> +			*val = !!(data->alarm & (ADT7470_FAN2_ALARM << 8));
> +			break;
> +		case 2:
> +			*val = !!(data->alarm & (ADT7470_FAN3_ALARM << 8));
> +			break;
> +		case 3:
> +			*val = !!(data->alarm & (ADT7470_FAN4_ALARM << 8));
> +			break;
> +		default:
> +			return -EOPNOTSUPP;
> +		}

I don't immediately see the problem with the current code, nor do I see a functional
difference. Please explain. Either case, the switch statement is unnecessary.

>   		break;
>   	default:
>   		return -EOPNOTSUPP;

