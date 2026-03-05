Received: from mail-pf1-f171.google.com (mail-pf1-f171.google.com [209.85.210.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B35C878F4A
	for <linux-hwmon@vger.kernel.org>; Thu,  5 Mar 2026 01:36:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772674606; cv=none; b=GmBFBa/idIoNhnxcPS8tBkoWaRHGozx6PoJQVsF4sGqFXk4/bbsPTTU8EWUd2WAiiUhqAuivzLkdq76WuwLUDIo8MbTAT7ePzYDWfsQdnmZGl1eSKH0wG3JzN6h4pl7JEDmCJKwclN1062gHpgtFU0zZGs96JiKRkfzHtEclDJk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772674606; c=relaxed/simple;
	bh=67iKmk6rqRSR1Nn8vkJuFUlU5DHvGZfkfsPu66jtN0s=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=YooELaq8s4IMD77KHI5SnS3ihO8G6uL8sIpYbCQ25qTZsg/JXB6tzVk/Q5VC3ll8FjaV98ePPNMfbOTTEqBE7OyabN8rTBnwtB7+LTVwHn3lkCSEjnLYIz8Lwh5x0hnbI7R/LEuGgJInjOKKmvtWR/5czKtXZBDyBJXsxh2XSWU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Q2h1Q3F9; arc=none smtp.client-ip=209.85.210.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Q2h1Q3F9"
Received: by mail-pf1-f171.google.com with SMTP id d2e1a72fcca58-8274843810cso4329921b3a.3
        for <linux-hwmon@vger.kernel.org>; Wed, 04 Mar 2026 17:36:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1772674605; x=1773279405; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:sender:from:to:cc:subject:date:message-id:reply-to;
        bh=6hLnDZx3D9N5fA8dUWdtxpV/TF7dYCTwr8DsQpjSZrI=;
        b=Q2h1Q3F9nEsCJjFB+R/6IvGFncq8zARwCArwpJbMuzDu5bRHMXFUi/DItvVVH6Iwfx
         9lhT7pcwQd6TpHavQCSRl0y8de+gmXfbsYLEtadT1hBfmjb1KFIGlpKCVg4g96Y8QTLU
         dEWuujNygnUbfNZNkghNvr30/iwYM5gpU5sYNddr6Gafit4LufN4mqwrwGqMBdpP1QFU
         uFZwL4iCKxK1Y37z/CDj9khuP/V3EUYMWkqj48A7vr+Q/D6D/ZPlpqFXGcaEoulzbShV
         24Ng0Kbrq87D1cLczCvr6lm6NA7e1nfc97qmgdmczRibWrSHe2Zaqs1JeXUmssQBVlHs
         SM2Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772674605; x=1773279405;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:sender:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=6hLnDZx3D9N5fA8dUWdtxpV/TF7dYCTwr8DsQpjSZrI=;
        b=kSCxeCaESAuho7zVAA4fAnOiF7NeMcpw6uIkyQlaR4p5F1ynuRFQQErDBhTE8YmIXG
         vMVosr6UP4A91y84/hYgFnzWpxN2OhYWLHR2bXikwl7IVLJknp9Eh+RiqqRYocXXysRs
         psv6/2HJtG30feAz+t9SJXARgawmE7j3C/7X4lsTRd5z9xT855gzvMdoopkfWV13vABj
         zE8prKUBVYxjaHf29oeQuUOb0ISk3MSpYPgMvj3lEeOENFXnR/CJ508W6wVrMiq6jRfV
         24v8YEPIX19CrH2AgNhNN7MnQ25zml1QW4V80gbDVj262XBlpiFohI3j3Q2QtVMWRI25
         JRmw==
X-Gm-Message-State: AOJu0Yw25+otN/E8eNwujfZL4GW3woFQByBAKoktVNcqy3mN0phE8gqW
	tf4rlATtsFWgcNlwtTfYCfFx2oYsPVDFz1OLkTdQaLvXVWcTLN7m9FgTHDbtO8z4
X-Gm-Gg: ATEYQzxLZCxwR8/Sr/AtA3xsPCnHSOOFFHFK6uRrz0gn5MB8MKqFKG1BziQyHbs9C/z
	JkThjKuwVGo04jnUkoOXxwcJ829fT//wPEBVydKIpUGH1EGdWsw/hffSQOELPdbcK4HihB0+La1
	3+yN/bZXCyFZDBcvnf4QrqNjdl3lZvAWmPBhM/khQI3X38xv/kdGMcthu+k0lsLbuZRBP5yqohb
	ApyYSaYE0A5jEZhVO66qXVLRPOP2N8sUlwFVixSIY4R6u/Jl+lTWD5uEpql+W2PcEvGM+AjXgVC
	YbYnpCIkbt7vZCQfySUyD8FvkyfUX4kvoyf53HoH7bevC0Lqeafc0HGDJ/9/1Afe45BGGU1oK8i
	qcX4Qgtu3QpymwC1w9yN1i2fIvG8MdBSyLyoHGMLuq99tc1chLynfC9tsyRBYyi/C97ebLz5TnE
	gf0O/BvMQLNzEnTfI8FopgyPdWT9Z8oSi6bjZwNgGDD4Ys0qqhy5ivI0deHGHaD8KpLVuBSbKqV
	PStSCy37Zw=
X-Received: by 2002:a05:6a00:2d83:b0:829:6f28:1d6 with SMTP id d2e1a72fcca58-82972b627bbmr3457896b3a.13.1772674604865;
        Wed, 04 Mar 2026 17:36:44 -0800 (PST)
Received: from ?IPV6:2600:1700:e321:62f0:da43:aeff:fecc:bfd5? ([2600:1700:e321:62f0:da43:aeff:fecc:bfd5])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-8297e4fbb9asm1221820b3a.57.2026.03.04.17.36.43
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 04 Mar 2026 17:36:44 -0800 (PST)
Sender: Guenter Roeck <groeck7@gmail.com>
Message-ID: <8e34370e-b1c5-4074-b763-efe472c54367@roeck-us.net>
Date: Wed, 4 Mar 2026 17:36:43 -0800
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/5] hwmon: gigabyte_waterforce: Add PID for 2nd gen
 coolers.
To: =?UTF-8?B?TWljaGHFgiBNaXJvc8WCYXc=?= <mirq-linux@rere.qmqm.pl>,
 Aleksa Savic <savicaleksa83@gmail.com>
Cc: linux-hwmon@vger.kernel.org
References: <c7a3a0b6c1658a8ce4cc5962de18c5b2cdbcdb8f.1772661800.git.mirq-linux@rere.qmqm.pl>
Content-Language: en-US
From: Guenter Roeck <linux@roeck-us.net>
Autocrypt: addr=linux@roeck-us.net; keydata=
 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
 np3900V20aS7eD9K8GTU0TGC1pyz6IVJwIE=
In-Reply-To: <c7a3a0b6c1658a8ce4cc5962de18c5b2cdbcdb8f.1772661800.git.mirq-linux@rere.qmqm.pl>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

On 3/4/26 14:05, Michał Mirosław wrote:
> Signed-off-by: Michał Mirosław <mirq-linux@rere.qmqm.pl>
> ---
>   drivers/hwmon/gigabyte_waterforce.c | 8 +++++---
>   1 file changed, 5 insertions(+), 3 deletions(-)
> 
> diff --git a/drivers/hwmon/gigabyte_waterforce.c b/drivers/hwmon/gigabyte_waterforce.c
> index 27487e215bdd..ecefac756a19 100644
> --- a/drivers/hwmon/gigabyte_waterforce.c
> +++ b/drivers/hwmon/gigabyte_waterforce.c
> @@ -16,7 +16,6 @@
>   #define DRIVER_NAME	"gigabyte_waterforce"
>   
>   #define USB_VENDOR_ID_GIGABYTE		0x1044
> -#define USB_PRODUCT_ID_WATERFORCE	0x7a4d	/* Gigabyte AORUS WATERFORCE X240, X280 and X360 */

This is POV. I personally don't care, and I understand that some people feel
strongly about using or not using defines if only used once. However,
one thing I am opposed to is changing existing code unless it is a cleanup,
and this does not count as cleanup.

The original author preferred to use a define. Please stay with that
and add USB_PRODUCT_ID_WATERFORCE_II or similar.

Thanks,
Guenter
>   
>   #define STATUS_VALIDITY		(2 * 1000)	/* ms */
>   #define MAX_REPORT_LENGTH	6144
> @@ -397,8 +396,11 @@ static void waterforce_remove(struct hid_device *hdev)
>   }
>   
>   static const struct hid_device_id waterforce_table[] = {
> -	{ HID_USB_DEVICE(USB_VENDOR_ID_GIGABYTE, USB_PRODUCT_ID_WATERFORCE) },
> -	{ }
> +	/* AORUS WATERFORCE X240, X280 and X360 */
> +	{ HID_USB_DEVICE(USB_VENDOR_ID_GIGABYTE, 0x7a4d) },
> +	/* AORUS WATERFORCE II X240, X280 and X360 */
> +	{ HID_USB_DEVICE(USB_VENDOR_ID_GIGABYTE, 0x7a5e) },
> +	/* sentinel */ {}
>   };
>   
>   MODULE_DEVICE_TABLE(hid, waterforce_table);

