Received: from mail-pj1-f51.google.com (mail-pj1-f51.google.com [209.85.216.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 397DC253932
	for <linux-hwmon@vger.kernel.org>; Sun,  8 Mar 2026 14:52:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772981559; cv=none; b=H4IQg3FXr4e0g91dK+pjxOIbuZgC59NxjRbZoowrUPzlWoaNHYhFeC4SaVsOJRi8to6LA8wRDTdLDZU+lvgBV2ovIU8HNm1IpDgXLm0Laj5PxhiowpeZI8/QVoL5aMKFXmCzw0xTL2aPUnrKohE2B/4cUC3YZaTgDFPk6pf0TO4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772981559; c=relaxed/simple;
	bh=mUxGiAvkhX06RPbeGQ8JcF69K7fuvaZ7WwxCUwyqwII=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=g+sWgxcwUX4zuxPkGkiYL5GPind52cU8gEF8gP3kMiOFhw4Jr8h96RKPc3Yl2/35Anp9UmpTOrKH2vniusGri5/MDUeT1qajUr2BIcJkct3fKCzR5R9MG5F/Ii+efpXIDrktqyt0gDMxx4rlMEF+w3MrMpu3y+ij1piSyDa4SLI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=EtohTwQ5; arc=none smtp.client-ip=209.85.216.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="EtohTwQ5"
Received: by mail-pj1-f51.google.com with SMTP id 98e67ed59e1d1-3598c008455so4426167a91.3
        for <linux-hwmon@vger.kernel.org>; Sun, 08 Mar 2026 07:52:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1772981557; x=1773586357; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:sender:from:to:cc:subject:date:message-id:reply-to;
        bh=OZtyD+jwbAlgTIlnkcICSaOtreatY1iW6AaKVLeO5qc=;
        b=EtohTwQ587xmNAPBOROSERzhAEL2L1hEGGdlUjKU/rzcG99xaAPQr4WA2kjEleaj0M
         ADf+SgsG/6bq/0rFstu6m2bKBfaeAanA5dgQ3Zx8foAdKo9DPFAj8VGrlYiBhhlyDhYx
         1zNvWKsqIPfI9e3meOoFzLixT0K9qNc+JlzQ7KaB8dQ6zyYFzOw0oYQZVwIiQrVrU30L
         4jujiLy2kAcimt6xpNkHwYoVBjU0dhDdBeaNWbU9IOgrtfxZ0OW0Jity+AI2UDfTHaMU
         IIIEUl179beb+cilJ251NwEda3QmOkhvJfaqclkPvFRyk7rTruTFPe2HrFEXfdxlNj+l
         ztwg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772981557; x=1773586357;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:sender:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=OZtyD+jwbAlgTIlnkcICSaOtreatY1iW6AaKVLeO5qc=;
        b=e7yoT9+izA51adnelH9cNZeZJKXmeiQn4HF6Y+2jUfqLR5waBiqA7TazIA+p6rOdEo
         6EL24MkNZJEPW1/RUs1cWAAh/RaHhRM14oxjrfac+8f+/c0RbvLJJ8cxhdvkgvgQSjWR
         e2GdVHZZTTGRJVIZAAVriKFOL28Fph5y3YH3pxUq5GbvjGR5AoUDXzP1NjdCVkHyPOYL
         BMD55+p8YWViqxGkA1G6U1vvp7unw1CElXxmgGSpjGaUsWV3ws+gOSfxgBbeLAyS4hN5
         jZ9Pa28keHJKbsz4Xbg6xRk8aQg9zBAGwXuP6xogY2WjswZ7OP7+MwRQU3tSYlLeS2w4
         06mw==
X-Forwarded-Encrypted: i=1; AJvYcCXmjhObDD1is3EjasZGdR/x+rvsJOaycSCzDvOD2zwLl5nwN/h+A+yhljqVq2vULhWnBhiB+4AlqpT1Lw==@vger.kernel.org
X-Gm-Message-State: AOJu0Yw7CTWMX06P5mPCVI3dXS3WiOosIdlW6rJAnZVk+AWc4vJUgRI4
	Uzv91VXatHy2Of1sDi0sfp1gWr7w5o/+oArr+oyU3Tpi8rPRuiBVDx2l
X-Gm-Gg: ATEYQzzY5+QcogBTT2YPeZyldAAhG606PnPwXkUTUmGiOdOFCQGJQdLldwbQH0xLLFz
	cBQ3rrfB9MFLOzkEHd/6qy8fG6YvSufZaj5H0aOwQVwQ/H4oHv3ccGjaqiUlgSSv8M04g3nNjC1
	Pitc+W8ER4IZYhZ8LPP3DkaazQlsqoLKfjZdshT6dCcm3DAUUA5WUcTNzotX9FywN75eDi7ZDTp
	BOfSLSsGDDVZtiP0C5Rw21JKe0yTQe9VQi67cCqQRKBLRUMTY1uYV7Bub1UQwRlgKnwHuAYpdQl
	0JdvVuQJY7+jK/VJ0YdXC5JkuHJ3AtojC321uJfAexxIWYRf+aB4qzqS1ev5hYwA8gpt/nmejOi
	DspQx9QoO7RKMcG4Ba0GUe7ff468h9z+6VC04d7neEjDe+/zr6PGs/A1KgZEvQkZonJb7n+yVP0
	cYuzBn6CE12/J9ZRB5tPwoSca316TrFrCi9vbLME1C4qzA7HT1/p6iKsRK67yyYch9P3GZymlr
X-Received: by 2002:a17:90b:2b4e:b0:359:94af:586b with SMTP id 98e67ed59e1d1-359be3a952fmr7194499a91.33.1772981557548;
        Sun, 08 Mar 2026 07:52:37 -0700 (PDT)
Received: from ?IPV6:2600:1700:e321:62f0:da43:aeff:fecc:bfd5? ([2600:1700:e321:62f0:da43:aeff:fecc:bfd5])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-359c01961a4sm7919164a91.15.2026.03.08.07.52.35
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 08 Mar 2026 07:52:36 -0700 (PDT)
Sender: Guenter Roeck <groeck7@gmail.com>
Message-ID: <26f9b0a7-5404-48b4-a63c-cb61e7f91151@roeck-us.net>
Date: Sun, 8 Mar 2026 07:52:34 -0700
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 6/9] hwmon: (dell-smm) Use new buffer-based WMI API
To: Armin Wolf <W_Armin@gmx.de>, Dell.Client.Kernel@dell.com,
 pali@kernel.org, mjg59@srcf.ucam.org
Cc: hansg@kernel.org, ilpo.jarvinen@linux.intel.com,
 platform-driver-x86@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-hwmon@vger.kernel.org
References: <20260308002522.4185-1-W_Armin@gmx.de>
 <20260308002522.4185-7-W_Armin@gmx.de>
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
 CQgHAwIGFQgCCQoLBBYCAwECHgECF4ACGQEFAmgrMyQFCSbODQkACgkQyx8mb86fmYGcWRAA
 oRwrk7V8fULqnGGpBIjp7pvR187Yzx+lhMGUHuM5H56TFEqeVwCMLWB2x1YRolYbY4MEFlQg
 VUFcfeW0OknSr1s6wtrtQm0gdkolM8OcCL9ptTHOg1mmXa4YpW8QJiL0AVtbpE9BroeWGl9v
 2TGILPm9mVp+GmMQgkNeCS7Jonq5f5pDUGumAMguWzMFEg+Imt9wr2YA7aGen7KPSqJeQPpj
 onPKhu7O/KJKkuC50ylxizHzmGx+IUSmOZxN950pZUFvVZH9CwhAAl+NYUtcF5ry/uSYG2U7
 DCvpzqOryJRemKN63qt1bjF6cltsXwxjKOw6CvdjJYA3n6xCWLuJ6yk6CAy1Ukh545NhgBAs
 rGGVkl6TUBi0ixL3EF3RWLa9IMDcHN32r7OBhw6vbul8HqyTFZWY2ksTvlTl+qG3zV6AJuzT
 WdXmbcKN+TdhO5XlxVlbZoCm7ViBj1+PvIFQZCnLAhqSd/DJlhaq8fFXx1dCUPgQDcD+wo65
 qulV/NijfU8bzFfEPgYP/3LP+BSAyFs33y/mdP8kbMxSCjnLEhimQMrSSo/To1Gxp5C97fw5
 3m1CaMILGKCmfI1B8iA8zd8ib7t1Rg0qCwcAnvsM36SkrID32GfFbv873bNskJCHAISK3Xkz
 qo7IYZmjk/IJGbsiGzxUhvicwkgKE9r7a1rOwU0ETofVZwEQALlLbQeBDTDbwQYrj0gbx3bq
 7kpKABxN2MqeuqGr02DpS9883d/t7ontxasXoEz2GTioevvRmllJlPQERVxM8gQoNg22twF7
 pB/zsrIjxkE9heE4wYfN1AyzT+AxgYN6f8hVQ7Nrc9XgZZe+8IkuW/Nf64KzNJXnSH4u6nJM
 J2+Dt274YoFcXR1nG76Q259mKwzbCukKbd6piL+VsT/qBrLhZe9Ivbjq5WMdkQKnP7gYKCAi
 pNVJC4enWfivZsYupMd9qn7Uv/oCZDYoBTdMSBUblaLMwlcjnPpOYK5rfHvC4opxl+P/Vzyz
 6WC2TLkPtKvYvXmdsI6rnEI4Uucg0Au/Ulg7aqqKhzGPIbVaL+U0Wk82nz6hz+WP2ggTrY1w
 ZlPlRt8WM9w6WfLf2j+PuGklj37m+KvaOEfLsF1v464dSpy1tQVHhhp8LFTxh/6RWkRIR2uF
 I4v3Xu/k5D0LhaZHpQ4C+xKsQxpTGuYh2tnRaRL14YMW1dlI3HfeB2gj7Yc8XdHh9vkpPyuT
 nY/ZsFbnvBtiw7GchKKri2gDhRb2QNNDyBnQn5mRFw7CyuFclAksOdV/sdpQnYlYcRQWOUGY
 HhQ5eqTRZjm9z+qQe/T0HQpmiPTqQcIaG/edgKVTUjITfA7AJMKLQHgp04Vylb+G6jocnQQX
 JqvvP09whbqrABEBAAHCwWUEGAECAA8CGwwFAmgrMyQFCSbODQkACgkQyx8mb86fmYHlgg/9
 H5JeDmB4jsreE9Bn621wZk7NMzxy9STxiVKSh8Mq4pb+IDu1RU2iLyetCY1TiJlcxnE362kj
 njrfAdqyPteHM+LU59NtEbGwrfcXdQoh4XdMuPA5ADetPLma3YiRa3VsVkLwpnR7ilgwQw6u
 dycEaOxQ7LUXCs0JaGVVP25Z2hMkHBwx6BlW6EZLNgzGI2rswSZ7SKcsBd1IRHVf0miwIFYy
 j/UEfAFNW+tbtKPNn3xZTLs3quQN7GdYLh+J0XxITpBZaFOpwEKV+VS36pSLnNl0T5wm0E/y
 scPJ0OVY7ly5Vm1nnoH4licaU5Y1nSkFR/j2douI5P7Cj687WuNMC6CcFd6j72kRfxklOqXw
 zvy+2NEcXyziiLXp84130yxAKXfluax9sZhhrhKT6VrD45S6N3HxJpXQ/RY/EX35neH2/F7B
 RgSloce2+zWfpELyS1qRkCUTt1tlGV2p+y2BPfXzrHn2vxvbhEn1QpQ6t+85FKN8YEhJEygJ
 F0WaMvQMNrk9UAUziVcUkLU52NS9SXqpVg8vgrO0JKx97IXFPcNh0DWsSj/0Y8HO/RDkGXYn
 FDMj7fZSPKyPQPmEHg+W/KzxSSfdgWIHF2QaQ0b2q1wOSec4Rti52ohmNSY+KNIW/zODhugJ
 np3900V20aS7eD9K8GTU0TGC1pyz6IVJwIE=
In-Reply-To: <20260308002522.4185-7-W_Armin@gmx.de>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 3/7/26 16:25, Armin Wolf wrote:
> Use the new buffer-based WMI API to also support ACPI firmware
> implementations that do not use ACPI buffers for returning the
> results of a SMM call.
> 
> Signed-off-by: Armin Wolf <W_Armin@gmx.de>
> ---
>   drivers/hwmon/dell-smm-hwmon.c | 47 ++++++++++++----------------------
>   1 file changed, 16 insertions(+), 31 deletions(-)
> 
> diff --git a/drivers/hwmon/dell-smm-hwmon.c b/drivers/hwmon/dell-smm-hwmon.c
> index 038edffc1ac7..07c05a82dc26 100644
> --- a/drivers/hwmon/dell-smm-hwmon.c
> +++ b/drivers/hwmon/dell-smm-hwmon.c
> @@ -12,8 +12,9 @@
>   
>   #define pr_fmt(fmt) KBUILD_MODNAME ": " fmt
>   
> -#include <linux/acpi.h>
> +#include <linux/align.h>
>   #include <linux/capability.h>
> +#include <linux/compiler_attributes.h>
>   #include <linux/cpu.h>
>   #include <linux/ctype.h>
>   #include <linux/delay.h>
> @@ -36,10 +37,10 @@
>   #include <linux/thermal.h>
>   #include <linux/types.h>
>   #include <linux/uaccess.h>
> +#include <linux/unaligned.h>
>   #include <linux/wmi.h>
>   
>   #include <linux/i8k.h>
> -#include <linux/unaligned.h>
>   
>   #define I8K_SMM_FN_STATUS	0x0025
>   #define I8K_SMM_POWER_STATUS	0x0069
> @@ -232,7 +233,7 @@ static const struct dell_smm_ops i8k_smm_ops = {
>   /*
>    * Call the System Management Mode BIOS over WMI.
>    */
> -static ssize_t wmi_parse_register(u8 *buffer, u32 length, unsigned int *reg)
> +static ssize_t wmi_parse_register(void *buffer, size_t length, unsigned int *reg)

Later in this function:

         memcpy_and_pad(&value, sizeof(value), buffer + sizeof(reg_size), reg_size, 0);

So the new code relies on pointer arithmetic on void *. This used to be invalid,
and it seems fragile.

>   {
>   	__le32 value;
>   	u32 reg_size;
> @@ -253,7 +254,7 @@ static ssize_t wmi_parse_register(u8 *buffer, u32 length, unsigned int *reg)
>   	return reg_size + sizeof(reg_size);
>   }
>   
> -static int wmi_parse_response(u8 *buffer, u32 length, struct smm_regs *regs)
> +static int wmi_parse_response(void *buffer, size_t length, struct smm_regs *regs)

Same here.

Given that those are internal functions, I don't really see the point of changing
the parameter type.

Thanks,
Guenter

>   {
>   	unsigned int *registers[] = {
>   		&regs->eax,
> @@ -261,7 +262,7 @@ static int wmi_parse_response(u8 *buffer, u32 length, struct smm_regs *regs)
>   		&regs->ecx,
>   		&regs->edx
>   	};
> -	u32 offset = 0;
> +	size_t offset = 0;
>   	ssize_t ret;
>   	int i;
>   
> @@ -273,19 +274,16 @@ static int wmi_parse_response(u8 *buffer, u32 length, struct smm_regs *regs)
>   		if (ret < 0)
>   			return ret;
>   
> -		offset += ret;
> +		/* WMI aligns u32 integers on a 4 byte boundary */
> +		offset = ALIGN(offset + ret, 4);
>   	}
>   
> -	if (offset != length)
> -		return -ENOMSG;
> -
>   	return 0;
>   }
>   
>   static int wmi_smm_call(struct device *dev, struct smm_regs *regs)
>   {
>   	struct wmi_device *wdev = container_of(dev, struct wmi_device, dev);
> -	struct acpi_buffer out = { ACPI_ALLOCATE_BUFFER, NULL };
>   	u32 wmi_payload[] = {
>   		sizeof(regs->eax),
>   		regs->eax,
> @@ -296,32 +294,19 @@ static int wmi_smm_call(struct device *dev, struct smm_regs *regs)
>   		sizeof(regs->edx),
>   		regs->edx
>   	};
> -	const struct acpi_buffer in = {
> +	const struct wmi_buffer in = {
>   		.length = sizeof(wmi_payload),
> -		.pointer = &wmi_payload,
> +		.data = &wmi_payload,
>   	};
> -	union acpi_object *obj;
> -	acpi_status status;
> +	struct wmi_buffer out;
>   	int ret;
>   
> -	status = wmidev_evaluate_method(wdev, 0x0, DELL_SMM_LEGACY_EXECUTE, &in, &out);
> -	if (ACPI_FAILURE(status))
> -		return -EIO;
> -
> -	obj = out.pointer;
> -	if (!obj)
> -		return -ENODATA;
> -
> -	if (obj->type != ACPI_TYPE_BUFFER) {
> -		ret = -ENOMSG;
> -
> -		goto err_free;
> -	}
> -
> -	ret = wmi_parse_response(obj->buffer.pointer, obj->buffer.length, regs);
> +	ret = wmidev_invoke_method(wdev, 0x0, DELL_SMM_LEGACY_EXECUTE, &in, &out);
> +	if (ret < 0)
> +		return ret;
>   
> -err_free:
> -	kfree(obj);
> +	ret = wmi_parse_response(out.data, out.length,  regs);
> +	kfree(out.data);
>   
>   	return ret;
>   }

