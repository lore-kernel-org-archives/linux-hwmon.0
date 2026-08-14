Received: from mail-wm1-f48.google.com (mail-wm1-f48.google.com [209.85.128.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3AB0248664C
	for <linux-hwmon@vger.kernel.org>; Fri, 14 Aug 2026 17:35:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786728938; cv=none; b=Y4UMWUtFnQh8fzNzQ5GcBiEnZ/eoxWJ5/qTNVoGybsLBscp36ul8N/0290rXaf0dnI9k5E8QeSGqOIuGbCCprq3c8dVN0b02bQJkPuH74hDnubIcymX462K1L5VDJdNYAnqHdj7QdDIU0glwUQbK+YEYykkEdBAbFEpcDfFnnIY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786728938; c=relaxed/simple;
	bh=ZSp8kcuPa4zSJOjijpCyKWPre2cCkNQIezmEiP1Rb5s=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=cN+u4NyI7e3zsiB2o69K5ra1V4CyAAHCceCXSkzfRGF9kbJGt4x9NMzVqWDON/EVWci2MCzQ+3toneWiE0l4IepKDNV5i+C3T2cUsS7ir3fDSMvzCi+WhOWWKO61suTi+wj+mV6dPPk/ECCwOM0HcaNsijhUWSm8YdfwVr3B9Mk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=MfI8pVnT; arc=none smtp.client-ip=209.85.128.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="MfI8pVnT"
Received: by mail-wm1-f48.google.com with SMTP id 5b1f17b1804b1-4994c49f588so10769765e9.0
        for <linux-hwmon@vger.kernel.org>; Fri, 14 Aug 2026 10:35:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1786728934; x=1787333734; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=a40VMlhH/9VccjXZglrfB7wRIR2LPsxaN+/Gt+UtGkc=;
        b=MfI8pVnTDHs5Onin3iffbiqNjykl0rRapSSwi+pTsdZ/sR+ApcbimmyToNCWGP7mVx
         3AF8ZB/eF1/nO4F3A5mtgNVwqVcynbUYL4kKBqHpj6YxujG9reyrqM+HQQfZUfZe2OyS
         gO6ff1PwRafOJFS7+hYxJSanBY0IE7maiv+jmG+ZHZiUH31lijhKVsmcpIe6ZIyFlNUS
         pKE2Zue8pVB2XLzPI+98TAI/VkJesrYxcEYRJ7RLcF4YJ+lL5Dp9fXRNLyumMzxe/PSq
         Uqo42XeoCLMAY+qJf47QBnrhbEm0Hv8jCfp5qmt9/lf0hAr9MFF9H/PqTwkmru0yg/uJ
         nJ/w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786728934; x=1787333734;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=a40VMlhH/9VccjXZglrfB7wRIR2LPsxaN+/Gt+UtGkc=;
        b=YIGIN3Er22mYQ0gh82kgc14WrEB7ltom6UBq7fH3WmqNqFgcLattnITqXkLUqrqdNF
         HH5r1DUt8dklZAPdMrJqSP0JQ93WXnub/gwOpJv9wmMqHk2lZN9vDdufzUyuU20Db45z
         n1CK2gHDZlJw5miRdaRljpL5Jv+QOEs7FRUccCXfMfZ0kV4opSDVAuiWCLxZ80NCoHFW
         yVyS34Qd4n5RJBBSLU16EGcy6qm5Hsc3VsCe7IGYp5yvaoAU2ScVH5vJlCb0H34aFqbf
         YN+/J0aFpgGnWHuxwXayAIPotkHfCZr/lGq56G8HzBpBsaOm5+6tSiR1qeNSiPm9lRJi
         NpfA==
X-Forwarded-Encrypted: i=1; AHgh+Rpet19TkT7XH/J/vNKhQ5xxEJXitcK6zDKlYNeT7ha+sUIRJ6Knf8/Lu31COzov9pvsNRDmHcKfI0JyHg==@vger.kernel.org
X-Gm-Message-State: AOJu0YwADZwgoKfFnEkuEVV93jdYnm+Sz5JyXN/B2q7x4GTfVv+xQ9et
	2Hqpo2wf4O9aXaqFklCF/FY86wy5Dko3rLDPtOPDgR6qEVgR+oQ9gUas
X-Gm-Gg: AR+sD12W8AARLdqUlaUWhAG9d09u4SAGRRbEb5xbsufIdZRCQGpZDGE+X3r+VJ+8hEA
	bGRXX1Qm8AWe6d+7S4zjGBkmNMK6XN49BmoK7z/7pgE6mRS5vJiBPF+qjj4fTS7CPye7TNr1phC
	cO5Wkn/UZA7dxDZrm2XWnVVoDJGhfyxiY+6uFPzMIVXiKzejFHG5XcaLHUuNu2pZRNXaiDDBTDf
	a7XamEtkhY01g8La/oSe9SNjN8LbLQrOQacPVGi2jTQ6Z58rW32ZR2ZMgikfJRpc+AZ+dmORtSm
	i91ktMaZAoCm6B3JScmsxM1gOFD5xjUPSWLfxl3C9JQsq/Y5MldYTxGhnm3Lkzo/QQpaiaG14sg
	MbrtaM2yt1MLye8u3VrG+t7cHd4SnaMgeeRYZ33A7gwl40F1RuVgAakFkzxBa20x0EG8MfQzKvm
	seBDttCQe7JYUuqUwUUpMy3nAceEsWytsyZAom1N5iUKocpBo7MDgb24nGDk6xshD8pAksToWVC
	ruP+x1XgH77xi5v35LNX8+ZvQu/MaT1BA==
X-Received: by 2002:a05:600d:117:b0:499:5f80:83ac with SMTP id 5b1f17b1804b1-49987ab4e1bmr68329775e9.7.1786728934527;
        Fri, 14 Aug 2026 10:35:34 -0700 (PDT)
Received: from [192.168.0.32] (cable-178-148-247-5.dynamic.sbb.rs. [178.148.247.5])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49987b25ad8sm56586045e9.2.2026.08.14.10.35.33
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 14 Aug 2026 10:35:34 -0700 (PDT)
Message-ID: <e640aa47-a879-46db-b10c-8ccce0ccd032@gmail.com>
Date: Fri, 14 Aug 2026 19:35:33 +0200
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 3/3] hwmon: (asus_rog_ryujin) Add ROG Ryujin III White
 Edition
To: Arie Miller <renari@arimil.com>, Guenter Roeck <linux@roeck-us.net>
Cc: Will Smith <github@notthatwillsmith.com>, Jonathan Corbet
 <corbet@lwn.net>, Shuah Khan <skhan@linuxfoundation.org>,
 linux-hwmon@vger.kernel.org, linux-doc@vger.kernel.org,
 linux-kernel@vger.kernel.org
References: <20260812103532.395049-1-renari@arimil.com>
 <20260812103532.395049-4-renari@arimil.com>
Content-Language: en-US
From: Aleksa Savic <savicaleksa83@gmail.com>
In-Reply-To: <20260812103532.395049-4-renari@arimil.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 8/12/26 12:35 PM, Arie Miller wrote:
> From: Will Smith <github@notthatwillsmith.com>
> 
> The ROG Ryujin III White Edition uses the same report layout as the
> other supported Ryujin III variants. Add its USB device ID and list it
> in the driver documentation.
> 
> The device was tested with the driver on the author's hardware.
> 
> Link: https://github.com/aleksamagicka/asus_rog_ryujin-hwmon/pull/10
> Signed-off-by: Will Smith <github@notthatwillsmith.com>
> Assisted-by: Codex:gpt-5.6-sol sparse
> Signed-off-by: Arie Miller <renari@arimil.com>
> ---
>   Documentation/hwmon/asus_rog_ryujin.rst | 1 +
>   drivers/hwmon/asus_rog_ryujin.c         | 3 +++
>   2 files changed, 4 insertions(+)
> 
> diff --git a/Documentation/hwmon/asus_rog_ryujin.rst b/Documentation/hwmon/asus_rog_ryujin.rst
> index cfdfe3712f19..b0d7ce8dd921 100644
> --- a/Documentation/hwmon/asus_rog_ryujin.rst
> +++ b/Documentation/hwmon/asus_rog_ryujin.rst
> @@ -8,6 +8,7 @@ Supported devices:
>   * ASUS ROG RYUJIN II 360
>   * ASUS ROG RYUJIN III EXTREME
>   * ASUS ROG RYUJIN III EVA EDITION
> +* ASUS ROG RYUJIN III WHITE EDITION
>   
>   Author: Aleksa Savic
>   
> diff --git a/drivers/hwmon/asus_rog_ryujin.c b/drivers/hwmon/asus_rog_ryujin.c
> index 79e5b6d6dae0..702edb831394 100644
> --- a/drivers/hwmon/asus_rog_ryujin.c
> +++ b/drivers/hwmon/asus_rog_ryujin.c
> @@ -19,6 +19,7 @@
>   #define USB_PRODUCT_ID_RYUJIN_AIO	0x1988	/* ASUS ROG RYUJIN II 360 */
>   #define USB_PRODUCT_ID_RYUJIN_III_EXTREME	0x1bcb
>   #define USB_PRODUCT_ID_RYUJIN_III_EVA		0x1ade
> +#define USB_PRODUCT_ID_RYUJIN_III_WHITE		0x1ada
>   
>   struct rog_ryujin_device_info {
>   	u8 temp_offset;
> @@ -590,6 +591,8 @@ static const struct hid_device_id rog_ryujin_table[] = {
>   	  .driver_data = (kernel_ulong_t)&rog_ryujin_iii_info },
>   	{ HID_USB_DEVICE(USB_VENDOR_ID_ASUS_ROG, USB_PRODUCT_ID_RYUJIN_III_EVA),
>   	  .driver_data = (kernel_ulong_t)&rog_ryujin_iii_info },
> +	{ HID_USB_DEVICE(USB_VENDOR_ID_ASUS_ROG, USB_PRODUCT_ID_RYUJIN_III_WHITE),
> +	  .driver_data = (kernel_ulong_t)&rog_ryujin_iii_info },
>   	{ }
>   };
>   

Reviewed-by: Aleksa Savic <savicaleksa83@gmail.com>

Thanks,
Aleksa
