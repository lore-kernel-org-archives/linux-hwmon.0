Received: from mail-pj1-f42.google.com (mail-pj1-f42.google.com [209.85.216.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7A60233A6FE
	for <linux-hwmon@vger.kernel.org>; Tue, 16 Dec 2025 09:56:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765878968; cv=none; b=vA3E1Knv6svK3oabf0MtXhsPI59IvfJteesVkEtXLe0HK5jJ7qX5VqBukTE78/+6W/vX0PPp7AF4hWsH4hEXYL/RvBkmZXCa/3wIxmtADPaO/0obzj6S1nxzE5gO/Bf2giQ/gjfXUpgjEQ1oe05Yqr6ySXJTAHYBBXubVlLyw/w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765878968; c=relaxed/simple;
	bh=XJJIHr6Q1JJAgL+vBlV3w1lpSRk1guGZLjwwI2qXOAQ=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=f0JFGO1LiVFWHXfpGm+oS50JK3BkzyvbzRU1t9YlkVGc7QWKUlkMvkIQWM04LQpVKlBz+jM4GWMK2NzTQi40BwH5wxy4rxkA7Ju31a7zuznP6+4FOcIH4DvUnh6WjMPnJeDlTFmRl0BREDi1qE5xmJAiPC9JSVPaWE/6pwygE7I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=K2OZftK4; arc=none smtp.client-ip=209.85.216.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="K2OZftK4"
Received: by mail-pj1-f42.google.com with SMTP id 98e67ed59e1d1-34c71f462d2so2115088a91.0
        for <linux-hwmon@vger.kernel.org>; Tue, 16 Dec 2025 01:56:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1765878965; x=1766483765; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:sender:from:to:cc:subject:date:message-id:reply-to;
        bh=tWAo9yxcAKMS797MIfjEnL+hjPHa9s8SOsUEcC0Lt2g=;
        b=K2OZftK4rXmJUPk7ML7Kgj3/VkTPnPUQSKFDWRwmyjBbLImABfNcFOKhS5BlGRWi4c
         52YvFfcBRNH7jjhwQEbdusQ24CBNJK421FlGJPemRUn+gKzwKJ2dniXAt+XwKmbuxZI9
         QkVXLjj8mJWF6/Vz+xJG9W6JQTRGwZYMilSt+4G7LmvTQ5tT+Pr9XNYiP5rv01uBt1lF
         zkQ5tJ7LXAA/Kg8AyGIVK7ypLkxcBuaWYmTEgoP5+dMlMKF8YPRkAA/XyMpURgtDwbAx
         +jpUBsRAFkpk/Qry+gXNAntxjqUFKghgoPvhpXCM2AlA4r8h6i9ZTI4asWKznKXohzRV
         lemg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1765878965; x=1766483765;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:sender:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=tWAo9yxcAKMS797MIfjEnL+hjPHa9s8SOsUEcC0Lt2g=;
        b=clgRwebuOCLN3dZ4RD85Q97H+Kmb647ZuwrfbZjfQdCvIegEpJQH8H9Zmr9GECJZ64
         M3BL3fhB6M6rqrvKCTFFoi5N+mNxfwSjXppSMJMp/72ZxCUy3jouyX9XveCPrZslDdSD
         O1JAiIydD5NkyHO4Fe8nVi4CLZW30kpAD8nzZMIQrbZWCQW0n6ZePLLeDKaSIG+fhvbe
         IOvqaj3XUzXCR8jVXNLiX5V9za3tUtS55tES97VYJVYBg7KainvSMsX9I4nR5Ia4fPrr
         gV5smvERn07ZjLXhq0jYbnTEYzXQaharJsuSvZbbIJD4RL5bEuC4RUYQlbDF03QVreC7
         gqGg==
X-Forwarded-Encrypted: i=1; AJvYcCV8ftKIo1A9GUe+D8IDLPDCbYh9Rr5FyCr9kvAIF3XAErtMQNEmD3cmpwkY3Fve/D3ogyc73SCDni6kwA==@vger.kernel.org
X-Gm-Message-State: AOJu0YxeSCSc/SHZmT13bjG8ck6z83jdaVqZzRargmnF1Tjg/mmNY+u5
	MXwKJh4rEebiJTBPwTGGsPax3OIsFahefCyYwqre2JKFrm57M6nx/tVU
X-Gm-Gg: AY/fxX4hmOYImVBQLvlkDZZL0Yy8fxxiFh+2ftgUlWx48FQ22E+8ZlNGcx7q4jiX923
	Nr3+DgREdo84PG0YlrU2Opt8K4lMB2SqsVMEQNa3cHNfyBqDo7QabfcCQlfEX4hZh+jqgBnDlu3
	zGDF12pSMi6A2c1UiDQPiB8kRucF3Pbk8vL7C3pW14dy0rDenf+fzymmer2gp0Pd+azIKYT0auh
	dd34G74cpL2rL6sdA3qQONbffjZvjaVJo86dn8Lp98P5rr72EhuwrA1xlz3pqIvVfF3xArnRCT9
	8OSxKcO/Bj+YueemC8j3uoT+46fRoEjjHMef1H5P4p8x6AMsa1mg0xo4JsBZM7NvLxAEbbOn178
	jIW1/c3hJS6ovH+V4JTyYQgfB/CB+Rv64FEK3O8VIja7/SUqasfMHwy2S5t/udBBdc8qRKYQQ7H
	9cd92MPodXTvm9nKoIVjJjNdaAFDELunPAY6xZS+m5seX2e4DUlM/9bQVWrAWL
X-Google-Smtp-Source: AGHT+IGCCiMGid6OExMc/l5cKtrt3bs+vHOYZLQrQC8t6fnPCDoiLTqZu72DKzZlvN90IPKyX82JvA==
X-Received: by 2002:a05:7022:1b0c:b0:11b:ceee:a49f with SMTP id a92af1059eb24-11f349a17bdmr9539870c88.8.1765878965104;
        Tue, 16 Dec 2025 01:56:05 -0800 (PST)
Received: from ?IPV6:2600:1700:e321:62f0:da43:aeff:fecc:bfd5? ([2600:1700:e321:62f0:da43:aeff:fecc:bfd5])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-11f43288340sm17296118c88.6.2025.12.16.01.56.04
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 16 Dec 2025 01:56:04 -0800 (PST)
Sender: Guenter Roeck <groeck7@gmail.com>
Message-ID: <186a5116-da08-4ec3-a410-4e308fb0cf0b@roeck-us.net>
Date: Tue, 16 Dec 2025 01:56:03 -0800
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/2] hwmon/pmbus: (isl68137) Add multiple-function pin for
 raa229141a
To: Jeff Lin <jefflin994697@gmail.com>
Cc: grantpeltier93@gmail.com, karanja99erick@gmail.com,
 chiang.brian@inventec.com, krzk@kernel.org, william@wkennington.com,
 tzungbi@kernel.org, thorsten.blum@linux.dev, ninad@linux.ibm.com,
 linux-hwmon@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20251216091617.2581192-1-jefflin994697@gmail.com>
 <20251216091617.2581192-3-jefflin994697@gmail.com>
Content-Language: en-US
From: Guenter Roeck <linux@roeck-us.net>
Autocrypt: addr=linux@roeck-us.net; keydata=
 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
 np3900V20aS7eD9K8GTU0TGC1pyz6IVJwIE=
In-Reply-To: <20251216091617.2581192-3-jefflin994697@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 12/16/25 01:16, Jeff Lin wrote:
> In addition to supporting PMBus-based current monitoring, the RAA229141A
> also provides two multifunction pins(PIN44,PIN45) that can be used to
> sense the input and output current of nearby devices.
> 
> Readings from these multifunction pins are not reported using the
> standard PMBus direct or linear data formats. Instead, they must be
> retrieved via the Renesas-specific Dicrect Memory Access(DMA)
> command codes and scaled by a factor of 10.
> 
Is there a public datasheet to explain this ?

 From what I can see in this code, it does not even remotely look like
it is part of the PMBus standard. It looks like very vendor specific
additional current values. Also, multi-function implies that those are,
as the name says, multi-function pins. There needs to be additional
information explaining how they are associated to specific functionality
such as input or output  current. Just declaring that it be so is insufficient.

Guenter

> Signed-off-by: Jeff Lin <jefflin994697@gmail.com>
> ---
>   drivers/hwmon/pmbus/isl68137.c | 45 ++++++++++++++++++++++++++++++++++
>   1 file changed, 45 insertions(+)
> 
> diff --git a/drivers/hwmon/pmbus/isl68137.c b/drivers/hwmon/pmbus/isl68137.c
> index 97b61836f53a..e60771614941 100644
> --- a/drivers/hwmon/pmbus/isl68137.c
> +++ b/drivers/hwmon/pmbus/isl68137.c
> @@ -178,6 +178,33 @@ static const struct attribute_group *isl68137_attribute_groups[] = {
>   	NULL,
>   };
>   
> +#define RAA_READ_DMA_DATA 0xc5
> +#define RAA_WRITE_DMA_ADDRESS 0xc7
> +
> +/* DMA address for input current in PIN44 and output current in PIN45 */
> +static const unsigned char dma_address_in[] = { 0xD3, 0xE0 };
> +static const unsigned char dma_address_out[] = { 0x42, 0xEE };
> +static int read_val_route_by_dma(struct i2c_client *client, const char *addr)
> +{
> +	int ret;
> +	/* Set up DMA address */
> +	ret = i2c_smbus_write_i2c_block_data(client, RAA_WRITE_DMA_ADDRESS, 2, addr);
> +
> +	if (ret < 0) {
> +		dev_err(&client->dev,
> +			"Set DMA address failed for address 0x%02x 0x%02x\n", addr[0], addr[1]);
> +		return ret;
> +	}
> +	/* Read DMA data */
> +	u8 buf[2];
> +
> +	ret = i2c_smbus_read_i2c_block_data(client, RAA_READ_DMA_DATA, 2, buf);
> +	if (ret < 0)
> +		return ret;
> +	u16 value = ((u16)buf[1]<<8) | buf[0];
> +	return value;
> +};
> +
>   static int raa_dmpvr2_read_word_data(struct i2c_client *client, int page,
>   				     int phase, int reg)
>   {
> @@ -207,6 +234,12 @@ static int raa_dmpvr2_read_word_data(struct i2c_client *client, int page,
>   			ret = clamp_val(temp, 0, 0xffff);
>   		}
>   		break;
> +	case PMBUS_VIRT_READ_IIN:
> +		ret = read_val_route_by_dma(client, dma_address_in);
> +		break;
> +	case PMBUS_VIRT_READ_IOUT:
> +		ret = read_val_route_by_dma(client, dma_address_out);
> +		break;
>   	default:
>   		ret = -ENODATA;
>   		break;
> @@ -408,6 +441,18 @@ static int isl68137_probe(struct i2c_client *client)
>   		info->format[PSC_CURRENT_OUT] = linear;
>   		info->format[PSC_POWER] = linear;
>   		info->format[PSC_TEMPERATURE] = linear;
> +		info->format[PSC_VIRT_CURRENT_IN] = direct,
> +		info->format[PSC_VIRT_CURRENT_OUT] = direct,
> +		/* DIRECT read format 10mA/LSB */
> +		info->m[PSC_VIRT_CURRENT_IN] = 1,
> +		info->b[PSC_VIRT_CURRENT_IN] = 0,
> +		info->R[PSC_VIRT_CURRENT_IN] = 2,
> +		/* DIRECT read format 10mA/LSB */
> +		info->m[PSC_VIRT_CURRENT_OUT] = 1,
> +		info->b[PSC_VIRT_CURRENT_OUT] = 0,
> +		info->R[PSC_VIRT_CURRENT_OUT] = 2,
> +		info->func[0] |= PMBUS_HAVE_VIRT_IIN;
> +		info->func[0] |= PMBUS_HAVE_VIRT_IOUT;
>   		info->pages = 2;
>   		info->read_word_data = raa_dmpvr2_read_word_data;
>   		info->write_word_data = raa_dmpvr2_write_word_data;

