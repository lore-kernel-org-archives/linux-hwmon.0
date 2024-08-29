Received: from mail-oo1-f46.google.com (mail-oo1-f46.google.com [209.85.161.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 307FB1B1405
	for <linux-hwmon@vger.kernel.org>; Thu, 29 Aug 2024 16:53:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.161.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724950405; cv=none; b=I3W/Q46NeddctLFgwhllqwE9SKcOUWJd/2tR7+Mr3hJsILi+byiNaaq8KCIiW7PV7KzCvRk4dtUC8maJrk03GIjyAGsRWc/srWwJMpU2Xgc4MZnFhUt2YvkUSWVu/HJsruBH401lQwAUTkU7uDu4KdqK4X2Aw12EghsOEqcrm48=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724950405; c=relaxed/simple;
	bh=aA94mr1NZ5I1gV70ru+k/r3pRzgq0XjVkI2Q4QvLAg4=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=fZUq+VObzAv/xG2c6m/L6idTnKF8P695NVeOjALxfSdlN7coiNniXCbUow+nCR6K9qJW+eoirCITpl0bSNqvc+/Haowb3VacqyXcT8Yt97YqvAthD2N5kiRmfRnOGDT6o2+5RRmnqk0E0GpIvZ+QF9fLT6QXfMGwLYuYJ27Yo7o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=KRKxCS46; arc=none smtp.client-ip=209.85.161.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="KRKxCS46"
Received: by mail-oo1-f46.google.com with SMTP id 006d021491bc7-5d5e97b8a22so502739eaf.2
        for <linux-hwmon@vger.kernel.org>; Thu, 29 Aug 2024 09:53:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1724950403; x=1725555203; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:sender:from:to:cc:subject:date:message-id:reply-to;
        bh=zrko/vv+qxMZ8yS1ksH/yceV01RVII6SKzTLHGAstVE=;
        b=KRKxCS46x6ttxamDnF3jLvvoZ7sNCAK8jaM4YzVq4LPtcKMfze1y4z+ZwOPAvSKU1+
         +YstzQNOrJjxKdnpL7IabT7V8ufQ33ztUg7ua89KT3beDPvZhpubqBfvbME2mHzjeEIn
         zeOLnUYH8tHm4ZuuxuifSOYz5/rjNPmtiTg6g3YvSh/YW2JQmQsjssdR7wiTjbJQwzGA
         yh27JBMu41tEVtF0125vEVGH6TyQGR23rOQiJJtkEyVknu1mNS8tVC6IhQy+xr0CkH4o
         OPBlewlN/vnEJlnE+jImfxwLEi6pfdz82Mv7w08Z/hvCpBGuvmNiNlIm7+OscEPBLgHw
         RFcg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1724950403; x=1725555203;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:sender:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=zrko/vv+qxMZ8yS1ksH/yceV01RVII6SKzTLHGAstVE=;
        b=kBUqBusA6k0+UVLxubroKmcjOWCQPqM85wRTvzq+ysAdCpaZQvgp8wfTT9urCTssZu
         a8vJSEAbH2+zP1FjHdynYgHqLNfEUXPXgapLJroSFZZdizWZt5Gf52zIYA0jh4LkbVl/
         KhL7cF2yIPE3LfrkUDX1R9xWQ8puNZzggceFj3nM6cQCqoT+piKltQrvq3xts0tT2ZWX
         hNuAVAHxGKsz4j9IBkIaliCK72zD33HOHc6tZaL6yyjKsfdjlG5aG8sfSkAguYjGm6Dr
         NfyqsaEA0w8tllwCffyNVwyPAJh3hC0wR7advCKCieaQQIPU3lG4S5F758cza4MhEDmN
         Qlrg==
X-Gm-Message-State: AOJu0YwrsMSqeZpx276A8coFc0B+C8KISe9+y0vVqYAF5C2UP8A9R6M+
	Vca4NTz1zXxLyOROISkh97/6pDzqrFgYUznzaowpYNpsDG5pAgbp9d3BXA==
X-Google-Smtp-Source: AGHT+IHd2zNQ99Ga/xHmqyefKoxxZ+JAsQIiXYIhFE3/OJgOgRTPTJ4s1rhb5rcoeKcRyZCti/8K0Q==
X-Received: by 2002:a05:6871:e264:b0:270:4dbb:195a with SMTP id 586e51a60fabf-277900c729cmr3347313fac.15.1724950403099;
        Thu, 29 Aug 2024 09:53:23 -0700 (PDT)
Received: from ?IPV6:2600:1700:e321:62f0:329c:23ff:fee3:9d7c? ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-7d22e9bd58asm1455316a12.72.2024.08.29.09.53.21
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 29 Aug 2024 09:53:22 -0700 (PDT)
Sender: Guenter Roeck <groeck7@gmail.com>
Message-ID: <4d03106d-3f64-4493-ac75-94030a584732@roeck-us.net>
Date: Thu, 29 Aug 2024 09:53:21 -0700
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 11/11] hwmon: (ina2xx) Convert to use with_info hwmon API
To: Tzung-Bi Shih <tzungbi@kernel.org>
Cc: Hardware Monitoring <linux-hwmon@vger.kernel.org>
References: <20240827153455.1344529-1-linux@roeck-us.net>
 <20240827153455.1344529-12-linux@roeck-us.net>
 <ZtCL74Hra1pYFuR2@tzungbi-laptop>
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
In-Reply-To: <ZtCL74Hra1pYFuR2@tzungbi-laptop>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 8/29/24 07:55, Tzung-Bi Shih wrote:
> On Tue, Aug 27, 2024 at 08:34:55AM -0700, Guenter Roeck wrote:
>> +static int ina2xx_in_read(struct device *dev, u32 attr, int channel, long *val)
>> +{
>> +	int voltage_reg = channel ? INA2XX_BUS_VOLTAGE : INA2XX_SHUNT_VOLTAGE;
>> +	u32 under_voltage_mask = channel ? INA226_BUS_UNDER_VOLTAGE_MASK
>> +					 : INA226_SHUNT_UNDER_VOLTAGE_MASK;
>> +	u32 over_voltage_mask = channel ? INA226_BUS_OVER_VOLTAGE_MASK
>> +					: INA226_SHUNT_OVER_VOLTAGE_MASK;
>> +	struct ina2xx_data *data = dev_get_drvdata(dev);
>> +	struct regmap *regmap = data->regmap;
>> +	unsigned int regval;
>> +	int ret;
>> +
>> +	switch (attr) {
>> +	case hwmon_in_input:
>> +		ret = regmap_read(regmap, voltage_reg, &regval);
>> +		if (ret)
>> +			return ret;
>> +		*val = ina2xx_get_value(data, voltage_reg, regval);
> 
> Doesn't it need to call ina2xx_read_init() too?  Originally, [1][2] call
> ina2xx_value_show() and then ina2xx_read_reg() and detect if the chip has
> been reset.
> 

No, because reading the voltage does not require calibration. If a voltage
happens to report 0V, it is just 0V, and does not indicate that the chip
has been reset. That applies to both shunt and bus voltage.

Thanks,
Guenter

