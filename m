Received: from mail-pg1-f179.google.com (mail-pg1-f179.google.com [209.85.215.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EAF753E6DE8
	for <linux-hwmon@vger.kernel.org>; Mon,  7 Sep 2026 20:45:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788813949; cv=none; b=eBoSmqffOcZh/60vLnw8PMDawo4xUzowaus2tyrLz5t3rcHzzCxA1Nh48tvaCcxz9Gw1m82ntGw1DE8g/bFAbcFBg5b8IxYqJlI/xDwI2ZF+rV3swfPgnx7MAjAI2v/53QHDUh+eizd8sutBE8ziYJ/GoAO64o8xDcwjRagjY+s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788813949; c=relaxed/simple;
	bh=CPWm+hocHeEMJStLxAePVuE6mUhVnF4LuV+Kps3m5bg=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=OaXh8gTHAsqTHsEb/jriBSBPLK7yNO56odFXTrCo9yGt0BRiFADpMtL1AiclCRSOceRXMUUTbiPWUUyZGOaJ1cU6QTpirhaKZzMm/bpdQ0rZaDwpRryLO5SEnPTyCRqvAXTl+21zQIowVH88s1XSdFr2hteK3cWgTnPfGJqSgCk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=N80vz9DY; arc=none smtp.client-ip=209.85.215.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="N80vz9DY"
Received: by mail-pg1-f179.google.com with SMTP id 41be03b00d2f7-cc439aa0078so3152952a12.0
        for <linux-hwmon@vger.kernel.org>; Mon, 07 Sep 2026 13:45:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788813946; x=1789418746; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:sender:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=yKFQMDZI744lGQKbB13keNLgxM4gqMYw/XKck3CakQ0=;
        b=N80vz9DYB3bm+QLM4T7VvS6gvz33iaIhxhcwCPlFMfezR4yIPSA5zNLRh35frVHem/
         CO7o/CIU8bsZ6iEnEDM+VPHv/O0Mkjn8gTOzjmK+c+Wkvt5uAAtxpFeo2kWt6KzHgiyN
         Yw1XPty6H9hcB4xwvbOyb4gNyZUF43SAgecvK6sZYO3zMEgZ+zpa6y+bdMYqQwGHWSDK
         55Lk3EfIbQ0ehJaGRHDlZAcbkWhE1s2dseYwuX17MTrC1LjW0f6w8xuzkfg46/13nzR0
         OQmckxzuG/crv+NOLe6Tdwx0ajrSUaLrw/EjOQrm7oEvnJ1cENWVW3SJUdKCYLiOjvPp
         oGJA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788813946; x=1789418746;
        h=content-transfer-encoding:content-type:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:sender:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=yKFQMDZI744lGQKbB13keNLgxM4gqMYw/XKck3CakQ0=;
        b=CnMMqLdpqozSPbvPNq7PidKgsZdL2+3fMXU7SOalAQGvV05Rucd+8cNMaUx2isdjMz
         ueWzjytK+vcZk0t7buF5uf8LxItV10I0NFq4zlEWNxbPn0tvMKUqp3xMhwg+5sJ9B3XD
         HAdH0H2yvfbqfX6wHytnBDkGdooQv7Bh8CpVWSg1MDtPYSmN4RENCzpcCJkfQTKvrlqO
         zGYm/quSfNUiUxZX3J+KnVMt03QFaaTxrXIYCj1JbVXXjJMCjw9ctdDpeQh1B+KV+dTo
         yUa2DjuL86MmTcKg+G42gu2jdIPykUKGaQia5ft6jBAaNHu8Auj+SnB7H7AX1IjQrjSr
         lk+w==
X-Gm-Message-State: AFuF++km853Mep/8BCMg80PBUPWJFkuw8BBJArIR+yjgJfj8XCmwZu7O
	/4Ik9fRAXz5XrrTPl05752z0lZxt+jwfKjKgNzMV3f09pIZuAL2djRgy
X-Gm-Gg: AYBFou0P9OlMUBeSCBbaH5IvXbiXm0ic6uxljabpry8PL1PrvN1EkT2fcyDKugIBE+F
	q3Jg2sud6OSsgVlFw2djM00a3HZEpBUdDM68gXOTuDCZNU8CJLgiXcvau8Xr637sINBRG8hts5G
	fNNboUOV8RplXkelElPfJMKd1CkcJeQKIfHpgiLYD6T10vRCpHR2uxTkIy3q5flgXJ87wLN/fFY
	X2Azul7lRN8Sr/TD6UMnrpnsYK5g9DWwq5/KwbgfCGsjRiHkW3wE9RHH/Voo6tgkIAYz/dTKRYM
	d/OUowUgz0LzuT6yHNlf2ypDwoGoqPG+e836eG8FJ1OduxedweGoZM3t7RYC4iasRmR9SWBXZbZ
	l5uO789q817XuSVrjgb6T8gqejgkZH6MI2oGie4T2nz7uwbdH4T1t9xJNnXOXcBkJuDeR3+2XoO
	h8w+50Tfqqx1vsPKEGUb1okLlF5ONgX292nF1Nv3h2uUgOpS/MSV+F7L+kktGZrg079TfbFYMFn
	KNDC0EumvQmZbQPIfjkv2c0w1LPXnCoe+kYlc0=
X-Received: by 2002:a17:90b:4c06:b0:396:b98b:a3c2 with SMTP id 98e67ed59e1d1-39b26116d9fmr32402317a91.8.1788813945794;
        Mon, 07 Sep 2026 13:45:45 -0700 (PDT)
Received: from ?IPV6:2600:1700:e321:62f0:da43:aeff:fecc:bfd5? ([2600:1700:e321:62f0:da43:aeff:fecc:bfd5])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3339b608409sm34629947eec.21.2026.09.07.13.45.44
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 07 Sep 2026 13:45:45 -0700 (PDT)
Sender: Guenter Roeck <groeck7@gmail.com>
Message-ID: <8ba0d9db-a9ae-44d1-96f4-54eaaa6666f9@roeck-us.net>
Date: Mon, 7 Sep 2026 13:45:43 -0700
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] hwmon: (yogafan) Add support for new Lenovo models
To: Sergio Melas <sergiomelas@gmail.com>
Cc: linux-hwmon@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20260907112929.1531690-1-sergiomelas@gmail.com>
Content-Language: en-US
From: Guenter Roeck <linux@roeck-us.net>
Autocrypt: addr=linux@roeck-us.net; keydata=
 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
 np3900V20aS7eD9K8GTU0TGC1pyz6IVJwIE=
In-Reply-To: <20260907112929.1531690-1-sergiomelas@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 9/7/26 04:29, Sergio Melas wrote:
> Add DMI quirk entries and map correct ACPI paths and configurations for
> additional Lenovo laptop models: Yoga 14cACN 2021, IdeaPad 3 15ALC6 Ub
> and Yoga 740-15IML, leveraging DMI product family matching.
> 
> Signed-off-by: Sergio Melas <sergiomelas@gmail.com>
> ---

This should be tagged v2, and change log goes here.

Guenter

>   drivers/hwmon/yogafan.c | 29 +++++++++++++++++++++++++++++
>   1 file changed, 29 insertions(+)
> 
> diff --git a/drivers/hwmon/yogafan.c b/drivers/hwmon/yogafan.c
> index 413ddc721..aa3284560 100644
> --- a/drivers/hwmon/yogafan.c
> +++ b/drivers/hwmon/yogafan.c
> @@ -53,6 +53,11 @@ struct yoga_fan_data {
>   };
>   
>   /* Specific configurations mapped via DMI */
> +static const struct yogafan_config yoga_740_15iml_cfg = {
> +	.multiplier = 100,
> +	.fan_count = 1,
> +	.paths = { "\\_SB.PCI0.LPCB.EC0.FANS", NULL }
> +};
>   
>   static const struct yogafan_config yoga_8bit_fans_cfg = {
>   	.multiplier = 100,
> @@ -200,6 +205,30 @@ static const struct hwmon_chip_info yoga_fan_chip_info = {
>   };
>   
>   static const struct dmi_system_id yogafan_quirks[] = {
> +	{
> +		.ident = "Lenovo Yoga 740-15IML",
> +		.matches = {
> +			DMI_MATCH(DMI_SYS_VENDOR, "LENOVO"),
> +			DMI_MATCH(DMI_PRODUCT_FAMILY, "Yoga 740-15IML"),
> +		},
> +		.driver_data = (void *)&yoga_740_15iml_cfg,
> +	},
> +	{
> +		.ident = "Lenovo IdeaPad 3 15ALC6 Ub",
> +		.matches = {
> +			DMI_MATCH(DMI_SYS_VENDOR, "LENOVO"),
> +			DMI_MATCH(DMI_PRODUCT_FAMILY, "IdeaPad 3 15ALC6 Ub"),
> +		},
> +		.driver_data = (void *)&xiaoxin_8bit_dual_cfg,
> +	},
> +	{
> +		.ident = "Yoga 14cACN 2021",
> +		.matches = {
> +			DMI_MATCH(DMI_SYS_VENDOR, "LENOVO"),
> +			DMI_MATCH(DMI_PRODUCT_FAMILY, "Yoga 14cACN 2021"),
> +		},
> +		.driver_data = (void *)&yoga_8bit_fans_cfg,
> +	},
>   	{
>   		.ident = "Lenovo LOQ 15IAX9",
>   		.matches = {

