Received: from mail-pj1-f54.google.com (mail-pj1-f54.google.com [209.85.216.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8234B381A4
	for <linux-hwmon@vger.kernel.org>; Wed, 31 Jul 2024 17:57:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1722448661; cv=none; b=uOjtZQ3ziJPiEp7L7yNrN5inTtbOk3bRugdxMDOiSpINe39sOqmGFq3sdi/3kqAXPTjpUnQA+imGM8kP4o4bdBl3PJ3IQeciVoHFANLAJfjSZnyfkzFHgte3WcUb43QtgUZRyM6Ea1mQGwrbfILwYcVHZbrtwBZn4SRfH8yLruY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1722448661; c=relaxed/simple;
	bh=+AmWx7L81Bqby73F5R/wlm+3aguFKk5c2YNoujAJiYg=;
	h=Message-ID:Date:MIME-Version:Subject:From:To:Cc:References:
	 In-Reply-To:Content-Type; b=O0PGKccsWCK0RAJrA8jWE71ODTV4dkoDQsxoeZsqA90IEIFfR5RdYFFgQf8jkmsN5HBdNFd56GIho6MXJ+eG04Ygdtn/QioHcGw48rk0mSQcknV9dkFdL8BYzJETTxVePyYDEZvzndJgISdm9H1aUCjz8/2LMOeW4gOABCHs5zk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=YZ6Rgj/D; arc=none smtp.client-ip=209.85.216.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="YZ6Rgj/D"
Received: by mail-pj1-f54.google.com with SMTP id 98e67ed59e1d1-2cfdc4deeecso673773a91.3
        for <linux-hwmon@vger.kernel.org>; Wed, 31 Jul 2024 10:57:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1722448659; x=1723053459; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:content-language
         :references:cc:to:from:subject:user-agent:mime-version:date
         :message-id:sender:from:to:cc:subject:date:message-id:reply-to;
        bh=aBmTcHevO/b6FRbZSM9iDuJ5pAEznWsH9rGOzJr+Ndk=;
        b=YZ6Rgj/DmGydORAW9GApl+wW7/nCuV9q7HzkUHEX3D/zIHHTA364EAd8l1HIaaxuE5
         ibcV6eZhivcYhEV/RuRyd9WgChSLcKi32OOT7+Hqdxbj/wid3HgerxKwGfBcwsJDG0dF
         3EyjWSMVTVPZI1W8W95J+v0okqq+7jR0tu70pPyIGfsBkojtcEI6Tr8s0KGWNoTp0gJT
         lQJMIiw3L5mOhUUIsbW8tA17YoYHNUyzLKcqlaIHuuV1XnQakeDuWYezb0QIrobQLvpH
         jArCdtB8/jZLdYYjDQUEpQ2MNGHw1ImSDctLmazBEZzGczNLQch152v2uZP1l1/0RHm9
         EWYQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1722448659; x=1723053459;
        h=content-transfer-encoding:in-reply-to:autocrypt:content-language
         :references:cc:to:from:subject:user-agent:mime-version:date
         :message-id:sender:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=aBmTcHevO/b6FRbZSM9iDuJ5pAEznWsH9rGOzJr+Ndk=;
        b=PFOiLgF9ucBNBl+gkJ+j0X8UiySXmEETCaYseVM17d3j127SEdaB0qwJK1v980jO4V
         ivAcBfh4OKkKQ1gOrQF0CSTYy8HOCQeUDODL0dCnMOftto/Xn+D8kdYC2+sqW8En33S3
         QFjn01JnV81PQtKvTjDg8UURJikIGZKA02X5O1QgCGyIo12jg/HepCuWhn8QrGfT1OLk
         tGr820SlTRoFLltMXiPCzc6Q5t37TGAK5HsQdUjobwMvmLXuQQCWxhK2O+bfx0PRyRl8
         oYRGrZ861tn9E4/NNiuCJvvOVwxGQNPBqmMvUuWrnChZF3b774SefPtwAyxUxGrFBnVx
         pR2Q==
X-Gm-Message-State: AOJu0Yz4mtZkxSbFfyfm2HnCALjf7D4aq70yXUJH4xxSFmXLDqXgVVNp
	WwchkzTfsB61Zwhw1IN6gIBjNgHnLaJzQPb7GBl6NHGNNSN+t9Pi67LXGw==
X-Google-Smtp-Source: AGHT+IGnn+mpCgP7HjjkprATI8oJRsEEteposYNtAZ0FyzfYbET0dBGyMGRYF+e427XBnJAAvxBEJg==
X-Received: by 2002:a17:90b:4b01:b0:2c9:a151:44fb with SMTP id 98e67ed59e1d1-2cfe78c62acmr114003a91.22.1722448658697;
        Wed, 31 Jul 2024 10:57:38 -0700 (PDT)
Received: from ?IPV6:2600:1700:e321:62f0:329c:23ff:fee3:9d7c? ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-2cfdc4e3bbesm1642196a91.53.2024.07.31.10.57.37
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 31 Jul 2024 10:57:38 -0700 (PDT)
Sender: Guenter Roeck <groeck7@gmail.com>
Message-ID: <0152a598-1017-4317-9006-7cbdc539578e@roeck-us.net>
Date: Wed, 31 Jul 2024 10:57:37 -0700
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [bug report] hwmon: (nct7802) Use multi-byte regmap operations
From: Guenter Roeck <linux@roeck-us.net>
To: Dan Carpenter <dan.carpenter@linaro.org>
Cc: linux-hwmon@vger.kernel.org
References: <ba9874c8-cd7d-4855-9e95-0916d313b038@stanley.mountain>
 <fbe53f0f-ad7e-4d2e-9851-d7e5730461b7@roeck-us.net>
Content-Language: en-US
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
In-Reply-To: <fbe53f0f-ad7e-4d2e-9851-d7e5730461b7@roeck-us.net>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

On 7/31/24 10:42, Guenter Roeck wrote:
> On 7/31/24 10:31, Dan Carpenter wrote:
>> Hello Guenter Roeck,
>>
>> Commit ec408845bc0f ("hwmon: (nct7802) Use multi-byte regmap
>> operations") from Jul 9, 2024 (linux-next), leads to the following
>> Smatch static checker warning:
>>
>>     drivers/hwmon/nct7802.c:411 in_alarm_show()
>>     error: double locked '&data->access_lock' (orig line 406)
>>
>> drivers/hwmon/nct7802.c
>>      375 static ssize_t in_alarm_show(struct device *dev, struct device_attribute *attr,
>>      376                              char *buf)
>>      377 {
>>      378         struct sensor_device_attribute_2 *sattr = to_sensor_dev_attr_2(attr);
>>      379         struct nct7802_data *data = dev_get_drvdata(dev);
>>      380         int volt, min, max, ret;
>>      381         unsigned int val;
>>      382
>>      383         mutex_lock(&data->in_alarm_lock);
>>      384
>>      385         /*
>>      386          * The SMI Voltage status register is the only register giving a status
>>      387          * for voltages. A bit is set for each input crossing a threshold, in
>>      388          * both direction, but the "inside" or "outside" limits info is not
>>      389          * available. Also this register is cleared on read.
>>      390          * Note: this is not explicitly spelled out in the datasheet, but
>>      391          * from experiment.
>>      392          * To deal with this we use a status cache with one validity bit and
>>      393          * one status bit for each input. Validity is cleared at startup and
>>      394          * each time the register reports a change, and the status is processed
>>      395          * by software based on current input value and limits.
>>      396          */
>>      397         ret = regmap_read(data->regmap, 0x1e, &val); /* SMI Voltage status */
>>      398         if (ret < 0)
>>      399                 goto abort;
>>      400
>>      401         /* invalidate cached status for all inputs crossing a threshold */
>>      402         data->in_status &= ~((val & 0x0f) << 4);
>>      403
>>      404         /* if cached status for requested input is invalid, update it */
>>      405         if (!(data->in_status & (0x10 << sattr->index))) {
>>      406                 ret = nct7802_read_voltage(data, sattr->nr, 0);
>>
>> I believe that the mutex_lock(&data->access_lock); in nct7802_read_voltage()
>> was supposed to be deleted.
>>
> 
> Oops, most definitely yes.
> 

This is now fixed.

Again, thanks a lot for the report.

Guenter

