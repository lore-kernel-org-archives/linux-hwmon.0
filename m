Received: from mail-pg1-f169.google.com (mail-pg1-f169.google.com [209.85.215.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A8FF078F39;
	Thu, 19 Dec 2024 14:15:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.169
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1734617754; cv=none; b=KsJSmm0Blt4H5qwn9mobgacap5IteCWeZHi6ge9YRnfkLsJ5khTCM/Cy8SBMrzoydDnu/vNxR64qnJiMdgG5Q/HVT5BemQkhQFtYaVVQKP6mikqggfsAw02sujlQfsYDYCfyHsCqFEAP9IG5DakzfJBrioNvxk3p1gSiHn6eh7A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1734617754; c=relaxed/simple;
	bh=1KRUMR+6t0iOb3/g7Opz7ByVCynt2Qv8DUUf+8A2mcM=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=RRCpejtoDnvYM1zq6p9hreyyLd1y+FWb0zwNLNbZ6ytiILfQmkzfC0PkJ7iCFp6kSdAag7vihQkfn5WiOOhBNUhs98hiZPreul6hmta7r+Kyt+/DjzogIn8Rfwk1DVMtlzS9q12tuq4SG4v1eqGe7G0WF2lb4HQmfXcF+VxSbOM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=COx+ninK; arc=none smtp.client-ip=209.85.215.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="COx+ninK"
Received: by mail-pg1-f169.google.com with SMTP id 41be03b00d2f7-7feb6871730so495799a12.2;
        Thu, 19 Dec 2024 06:15:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1734617752; x=1735222552; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:sender:from:to:cc:subject:date:message-id:reply-to;
        bh=RhmqnTi2nAVFOJeQQRmixgnNtQifLf9u6y2lqPkscPU=;
        b=COx+ninKJC49AlohtX04k2WDlYZSIe40aikdq/rhcM1JYCl6yTRB0HaBSUbID7SQtT
         /rcvQawMSJvUFw6tvj0Sg8UrC/Fl60DpXG3Zjycs+ZdyWKpLRDTvHofuZ/oyYU5PBpCa
         Tp3ZbLM8ZgolxDTudBStNILvPQeuLGAnkuq8LGB+YIBFbkpZ8Q71/vCWs/Pq4tEWip56
         JTBYEecg7EFXmSF2ReRYX1d0ndDug/Qx7EZamii2j56pi6CKnBjKGayfn32W3ile80mi
         Jg1lGr9vhpM64DSi0HZMQkX1FrxbK1EipND4v3blG4F3cv+n6f26aKw63uEvB7plylPZ
         96GA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1734617752; x=1735222552;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:sender:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=RhmqnTi2nAVFOJeQQRmixgnNtQifLf9u6y2lqPkscPU=;
        b=V61R/P+2LJo5mY7k6fwPy7NaRzAkSIx87iUuBFM970Khztgx8LBt7Z0ESX9GbGsFVl
         7FiF3aRUe61hwwaM/J+N2W7mueqAJx4ZU4VPIlAiFW3H7t+LAfSTRjZuSkHlsfWNAEV/
         0Rw/uxWRs5Yh87WjGolL/odDx82sBqYujTfEqY57+rUQ/XeDqX0MZLWhz1V3StUn6LT4
         iqk8H0c31PvYU7LK1ajoOQ/l7NPtIcD05hfkyIgA89XU3CY7BBk+8lALvJEyu0ORLiPy
         ahux4db26Cv64SUTn/NTFQ/5a1gclVWOcnNkxchdGakZhg0xuUItWrl/iP+tEh7fgq2z
         qzww==
X-Forwarded-Encrypted: i=1; AJvYcCVLuSiFgq9sTauBhqCbxQxQp7ga9L4mykmbRP/4zXV6IqwBbaU8JPO9yUCuSykN2CwcrCUceCgBzqvoe5s=@vger.kernel.org
X-Gm-Message-State: AOJu0Yx5BEFt6dVxKTN1GJBfthtpq3oaYbjC8gVTxDuTnKKlL6WKA+cM
	WsyNmY0I4AoDAnNdFVLpz6HVpHELr7tYxQIE2eDCta9M3rDA9S7HXAfdRw==
X-Gm-Gg: ASbGncuQN4bC3GHxijCsCRSk79gVMjUzgYJLD0vWmxKCe1ZgJnYvrae5VHZbk5TRfpq
	hafTF/s77hf5LUaDavpYwjjPqVvhA5LNzKzAt8cJxnpx3MxyiRGzB+4nWSrbng7qgBftl7Cfuxm
	ushn7wVo1aeY5zP9a+JH2BM11x37o0kVKhsP58uJlsvKDPfyUUBgt5eF+SCDKoozh/smpQyHY5K
	w1Z98ZgSYCIOiRsT9hgueRYgJ+pYYiFEw256kvxJ56D1iTybuKHBJSWZVcvNgD02bX1tX54ZqYV
	S/dggsB8gI437nWjwVTTVRQc1FKcHQ==
X-Google-Smtp-Source: AGHT+IFmIbQEF01Q+cTfi/yhT8l5hePh0MJIdMggaqWj1uk2sgdH64jfrHANMFtleKf7Ytu74G/IHg==
X-Received: by 2002:a17:90b:4ecf:b0:2ee:c5ea:bd91 with SMTP id 98e67ed59e1d1-2f443d4549dmr5142788a91.29.1734617751743;
        Thu, 19 Dec 2024 06:15:51 -0800 (PST)
Received: from ?IPV6:2600:1700:e321:62f0:da43:aeff:fecc:bfd5? ([2600:1700:e321:62f0:da43:aeff:fecc:bfd5])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-219dc9cdea0sm12649825ad.155.2024.12.19.06.15.50
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 19 Dec 2024 06:15:51 -0800 (PST)
Sender: Guenter Roeck <groeck7@gmail.com>
Message-ID: <0f584d88-6264-4f7f-9600-0ebe8c0b8c64@roeck-us.net>
Date: Thu, 19 Dec 2024 06:15:49 -0800
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] hwmon: pmbus: dps920ab: Add ability to instantiate
 through i2c
To: Denis Kirjanov <kirjanov@gmail.com>, robert.marko@sartura.hr,
 jdelvare@suse.com
Cc: linux-hwmon@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20241219094755.14098-1-kirjanov@gmail.com>
Content-Language: en-US
From: Guenter Roeck <linux@roeck-us.net>
Autocrypt: addr=linux@roeck-us.net; keydata=
 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
 mDW4+i+XlNFUPUYMrIKi9joBhu18ssf5i5Q=
In-Reply-To: <20241219094755.14098-1-kirjanov@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 12/19/24 01:47, Denis Kirjanov wrote:
> Now we can bind the driver with a command like:
> 
> echo "dps920ab" 0x58 > /sys/bus/i2c/devices/i2c-0/new_device
> ...
> [616189.076211] i2c i2c-0: new_device: Instantiated device dps920ab at 0x58
> 

This is not an appropriate patch description.
Please refer to Documentation/process/submitting-patches.rst.

Thanks,
Guenter

> Signed-off-by: Denis Kirjanov <kirjanov@gmail.com>
> ---
>   drivers/hwmon/pmbus/dps920ab.c | 7 +++++++
>   1 file changed, 7 insertions(+)
> 
> diff --git a/drivers/hwmon/pmbus/dps920ab.c b/drivers/hwmon/pmbus/dps920ab.c
> index cc5aac9dfdb3..c002ed41f517 100644
> --- a/drivers/hwmon/pmbus/dps920ab.c
> +++ b/drivers/hwmon/pmbus/dps920ab.c
> @@ -190,12 +190,19 @@ static const struct of_device_id __maybe_unused dps920ab_of_match[] = {
>   
>   MODULE_DEVICE_TABLE(of, dps920ab_of_match);
>   
> +static struct i2c_device_id dps920ab_i2c_match[] = {
> +	{ "dps920ab" },
> +	{}
> +};
> +MODULE_DEVICE_TABLE(i2c, dps920ab_i2c_match);
> +
>   static struct i2c_driver dps920ab_driver = {
>   	.driver = {
>   		   .name = "dps920ab",
>   		   .of_match_table = of_match_ptr(dps920ab_of_match),
>   	},
>   	.probe = dps920ab_probe,
> +	.id_table = dps920ab_device_id,
>   };
>   
>   module_i2c_driver(dps920ab_driver);

