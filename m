Received: from mail-pl1-f181.google.com (mail-pl1-f181.google.com [209.85.214.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7784F3207
	for <linux-hwmon@vger.kernel.org>; Thu, 30 May 2024 06:51:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.181
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1717051870; cv=none; b=NvNGjU4jc7wHiExzkcgDBA0vBMsMLYXyKZAow/tyvu6TsMfH7YJYgCluHqEL35QEKm+xqdusmgnWiTLziRWJ7Wp37mlMhrD3YAOnMeefRLqYT4Hfvatir5ZZ7/NeFOONpVDB9xiK5tey5Q3GaUbWjboO/Ulp+wVGs66ld0ILtbc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1717051870; c=relaxed/simple;
	bh=EF9Loe314WDzrFal3A4ws8qykuA1rSEES96qbfJkB0Q=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Dh9SLUtdwR+j2TVD9nA3Sz48sPmYmcg6Cc5JLxqlb0eriq2278j/qZtXbZWin+u4dzRgMBuvjRcDAIrHMdT0yN4Y/cofbgz1FTICvEikfQkj9zNVC+q7XxtJG0/D/XXl5CkLTLX3iE9kXoaxFWcji5LTtHYxSifVJU1YgRisf5U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=dgEyJNOq; arc=none smtp.client-ip=209.85.214.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="dgEyJNOq"
Received: by mail-pl1-f181.google.com with SMTP id d9443c01a7336-1f082d92864so4594405ad.1
        for <linux-hwmon@vger.kernel.org>; Wed, 29 May 2024 23:51:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1717051868; x=1717656668; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:sender:from:to:cc:subject:date:message-id:reply-to;
        bh=w4EoDLWtZQpnJ3yLVcS0rQFdVAnThzMf754Dfrywp90=;
        b=dgEyJNOqKM2WmhrmcB7SlmEgsh873iPOHmQCDgIcQdSic8FXthI0E5dzMmfhcToLfE
         IDlPlkqQSHF6o9x6RIDvARwAjiytcvvi3ZBiOw6HhVwwMCxQwLlg5MtZm+1Upc7h+tfK
         cB4QvFM/8IXG4zOYOhIUkwXCt3BE67Mwu0M+rsOr4TNWV5ojVDxhuglbRJcNsFqnbBZ2
         IyPjeUoJmvYiIlCeqbpARe++mCEMTHqen4bmz2TbchAhtO9Xfh5cEL+cyO7Zw7efenL8
         VluhGeyl7lu+q/0mVru2EYrb/6rtaZIYNuSGHtNKHBCzexFrhxHbaz8ORSoIixa/3b3s
         uS2g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1717051868; x=1717656668;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:sender:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=w4EoDLWtZQpnJ3yLVcS0rQFdVAnThzMf754Dfrywp90=;
        b=aGT1SpqyGpP487uv2S74fVW5l/OsMzD4Mh0FT32Rw7NIa980pk5Ac2z09ZvQTGZ6ht
         CFeI6Y4LHSjmNVnowN76iH3UuujAsaIVbVK9AR2+i8zNEtuH14bgdXCMEUrAujq2K8Y8
         bxXL4Yjtu1kJ3y6He1Cvbqyy0sfnukB6xj6z1t9wEEwPgr3Ct7nuO7fDBx74yT2odG5p
         EBMulSEF57SHZoTgt1hzPzl+hht/6sOnQ98dNMw9nOBFOb1zYZF4EbtUvMh8tHbcnqe2
         MoC/jsM8+SZY7UDVmHSepETpt/vqH6qkjobKlztaItoLacJE9AgwKsscK+KJ7EV98w22
         Vo2w==
X-Forwarded-Encrypted: i=1; AJvYcCUOcqE5CFh1ZC/P61ffMw0sfVCvpmRDXqadNTgDV5qntdoFjmKQwaWpd+GhawITx54le/oiCwydfeT/OByRFCy1FF/STZBzlfKLQXA=
X-Gm-Message-State: AOJu0YxHeBfhR59nb7gutZzuOj58knjnW+0Je7eopVbce3Dn1p8HcAZy
	nKW8B6WOWsSR9oJdpsJ8+tbFGDErJusgCFn6RkjGNJCLyrCNs1LZczBvzQ==
X-Google-Smtp-Source: AGHT+IFzwxbrprg0MqJhoRD2H/cJnq2JUZHtkY/LCs6n3d8omYiq9qrZ3FQrTkrgksvCsNonAk+Fdg==
X-Received: by 2002:a17:902:ca0c:b0:1f4:8266:87d0 with SMTP id d9443c01a7336-1f619b28182mr11484125ad.59.1717051867547;
        Wed, 29 May 2024 23:51:07 -0700 (PDT)
Received: from ?IPV6:2600:1700:e321:62f0:329c:23ff:fee3:9d7c? ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-1f46ad93c2esm92665825ad.263.2024.05.29.23.51.05
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 29 May 2024 23:51:06 -0700 (PDT)
Sender: Guenter Roeck <groeck7@gmail.com>
Message-ID: <74d93580-b890-4bf9-8d7b-d8809f18640c@roeck-us.net>
Date: Wed, 29 May 2024 23:51:04 -0700
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/2] hwmon: Add PEC attribute support to hardware
 monitoring core
To: =?UTF-8?Q?Nuno_S=C3=A1?= <noname.nuno@gmail.com>,
 linux-hwmon@vger.kernel.org
Cc: Radu Sabau <radu.sabau@analog.com>
References: <20240529180132.72350-1-linux@roeck-us.net>
 <20240529180132.72350-2-linux@roeck-us.net>
 <2b2ccdd71d8005ccbddd1d0c566c3a6444645978.camel@gmail.com>
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
In-Reply-To: <2b2ccdd71d8005ccbddd1d0c566c3a6444645978.camel@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

On 5/29/24 23:37, Nuno Sá wrote:
[ ... ]
>> +static ssize_t pec_show(struct device *dev, struct device_attribute *dummy,
>> +			char *buf)
>> +{
>> +	struct i2c_client *client = to_i2c_client(dev);
>> +
>> +	return sprintf(buf, "%d\n", !!(client->flags & I2C_CLIENT_PEC));
> 
> sysfs_emit()?
> 
Done.
> 
> with the above,
> 
> Acked-by: Nuno Sa <nuno.sa@analog.com>
> 
Thanks!

Guenter

