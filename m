Received: from mail-pl1-f169.google.com (mail-pl1-f169.google.com [209.85.214.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BADC3391846
	for <linux-hwmon@vger.kernel.org>; Sat, 11 Apr 2026 22:59:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.169
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775948395; cv=none; b=ThDomXnF7YRs04AUCPXH/ErN0xAOSwX1bdaPm4XG870hWmbKhLNi+hiIJL8MnRO7UuYldHILzNn6uGUqgigF1tu+NxzUbDrUmXOZAhQCpjKwTFLl8bm0hVOuK0jtsSQGYrERrSF0Q5aOUuNewqN0YC3wjy/E8g9h9qAwPqKvEm4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775948395; c=relaxed/simple;
	bh=OVteo0HPf4IqosIYpbzWZzsDn0QWnpxwmTeh3yG+gIA=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=sdVXdW3K1J8K6q0IRu2oBK/1p0F84fTN54rfh2nOMsYrbPAtPIaoE6qR2LX8+oZLFBDIiBkHIEzFRM6OlJwwtuvZmFTAhQdkfMXtOmy0fkTzzirKesaVnqvA0Jso+0vNXFjJco/GiUChVCziOV8xNTIC0bui6JTNy5F0GaPL8uM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=CsP1sJAk; arc=none smtp.client-ip=209.85.214.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="CsP1sJAk"
Received: by mail-pl1-f169.google.com with SMTP id d9443c01a7336-2a871daa98fso20986905ad.1
        for <linux-hwmon@vger.kernel.org>; Sat, 11 Apr 2026 15:59:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1775948392; x=1776553192; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:sender:from:to:cc:subject:date:message-id:reply-to;
        bh=VcuQRkZDz7067fWMZSqf+4+CIaJ9+tKPgCh6sJvEzAg=;
        b=CsP1sJAkNkEuhG5QG6JpHn8D8Z2ZJICt8yF1s5TlnNOZ89lklLJ7l0mrZ2khvjHN5F
         maWI31zynHyXbepDWy09aIaef4ywduwOWQq3l6qA9Z4D4Mdfvfz+Py1QWdolpgYpbNLg
         Ybwyj8O5pZB9Ndou6yCygZvD4N55lID/cTB44//8VXlcbUPgvmDOG16remyVBqtJtHAV
         gDqDf1DuH75S4V+Ce2Mn2BT8jQLEFCh4ul2azLTXmKaMYrQ43G7upLYIsLNjpRV+IY4b
         4GArCUp9kJKxPuJ1hp9wKgK1g/JHwEH8SxY6xWu9nmp2vmmQBD7Oj/DAyDjRbmZkal2W
         Xj8A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775948392; x=1776553192;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:sender:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=VcuQRkZDz7067fWMZSqf+4+CIaJ9+tKPgCh6sJvEzAg=;
        b=g7qpdQmviKu7vNdJqDpAsQqjMl9Kz54nAbjNeTFlTJGlTpg3PZL9KqtM+275ftqi1R
         +yBOrcoA13ZkoUaeqIrqEz+NlCXML/qM8aZjuxQOPvSblLQG2RirMMl6IML/BnZAskie
         utSLmGNnuH7pGQyoSo75vbF8MGyw0I3auURM5slCAntq2nNZRgo4M3RcIFAQyvFUgQXs
         suUwOg6M8W90ksktlEG5uw687kWnpTU06tj0F7G8MGj0j4u2+leiPGALVh3vBTgCCE66
         J44BQMfCDUN1p1RWJdA4uafXSA9cNX09tO2FMQjc7DEccTid1x5uIuNGrzeIRVMnCx5q
         OoMg==
X-Gm-Message-State: AOJu0YyfoNQJh2BdgLLHFUTYjRnUCpyZYc0crn/ZvB36f9GpFkrxPuRZ
	aQt+EVM0bRavIGjGHCjdE+NfnhR6L9RzgKRSIC15L4jGzr367tbaKPBi
X-Gm-Gg: AeBDievd8+hU3iJ3vWoWCH3oBsdBz6GY6DxOQbj01Fz6zseTqb4/ykKKM7a5jAQSRl8
	irQpQ4eU1NV1B8YiB/NkvoHgEpQY2zn1aB/4ONhEAJ1rBc4Tl30J+5TOtbEj5yspzHYcOXWMBmi
	993bHcrLFETQIPzLwVkm93SlraP41FV8k9SlYbpUD0ungmQPWiLL6JAISm56bjGWDvkl553E0wr
	RnZ4EtOih59eIbx2hMVlytdCehMPQjHxs00s02/MtH7Zsf4srV7qV70zgy3sgPm5OCPX5FsgRXY
	fSFZbHoFWU48Yyc20gnWBBXxiJ4242iYG444dOh6JXyfWzBvMt0nVM4Tiiy11LIYjm7xB4jHRHt
	GjMWyN5CGTzCkm2yhPQqrL7PZxCdziCI5sRsKEh8cUJGubIJVVfR7J9F+JlZ/dYnZSeZRXioc44
	wLcmyDY861Zfc+L0xfyqRAqUgHQFy8xGSZm9KBPgkeKl3T1AOJrTJOVTYB1LqaWu17cNe9D1Yr
X-Received: by 2002:a17:903:2983:b0:2b2:523f:50d with SMTP id d9443c01a7336-2b2d5a48755mr95221805ad.29.1775948392042;
        Sat, 11 Apr 2026 15:59:52 -0700 (PDT)
Received: from ?IPV6:2600:1700:e321:62f0:da43:aeff:fecc:bfd5? ([2600:1700:e321:62f0:da43:aeff:fecc:bfd5])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2b2d4f48cfdsm71909305ad.82.2026.04.11.15.59.51
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 11 Apr 2026 15:59:51 -0700 (PDT)
Sender: Guenter Roeck <groeck7@gmail.com>
Message-ID: <faeb48a6-14e7-48c1-884d-dd164442d3cf@roeck-us.net>
Date: Sat, 11 Apr 2026 15:59:50 -0700
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] hwmon: (nct6683) Add customer ID for ASRock B650I
 Lightning WiFi
To: pklotz0@protonmail.com
Cc: linux-hwmon@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20260411203953.9843-2-pklotz0@protonmail.com>
Content-Language: en-US
From: Guenter Roeck <linux@roeck-us.net>
Autocrypt: addr=linux@roeck-us.net; keydata=
 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
 np3900V20aS7eD9K8GTU0TGC1pyz6IVJwIE=
In-Reply-To: <20260411203953.9843-2-pklotz0@protonmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 4/11/26 13:40, pklotz0@protonmail.com wrote:
> From: Petr Klotz <pklotz0@protonmail.com>
> 
> This value was found on ASRock B650I Lightning WiFi with NCT6686D chip.

This is not an appropriate patch description.

AI prompt: "Convert the patch description to a format matching the requirements in
Documentation/process/submitting-patches.rst"

and it gives me:

hwmon: (nct6683) Add a new customer ID for ASRock B650I Lightning WiFi

The ASRock B650I Lightning WiFi motherboard uses an NCT6686D chip with a
customer ID of 0x1633. Without this ID, the nct6683 driver fails to
recognize the hardware on this board, preventing hardware monitoring
from working.

Add NCT6683_CUSTOMER_ID_ASROCK6 (0x1633) to the list of supported customer
IDs and update the probe function to handle it.

> Signed-off-by: Petr Klotz <pklotz0@protonmail.com>
> ---

Change log goes here, not in a separate e-mail.

Guenter

>   drivers/hwmon/nct6683.c | 3 +++
>   1 file changed, 3 insertions(+)
> 
> diff --git a/drivers/hwmon/nct6683.c b/drivers/hwmon/nct6683.c
> index 4a8380414038..0581770380cc 100644
> --- a/drivers/hwmon/nct6683.c
> +++ b/drivers/hwmon/nct6683.c
> @@ -182,6 +182,7 @@ superio_exit(int ioreg)
>   #define NCT6683_CUSTOMER_ID_ASROCK3	0x1631
>   #define NCT6683_CUSTOMER_ID_ASROCK4	0x163e
>   #define NCT6683_CUSTOMER_ID_ASROCK5	0x1621
> +#define NCT6683_CUSTOMER_ID_ASROCK6	0x1633
>   
>   #define NCT6683_REG_BUILD_YEAR		0x604
>   #define NCT6683_REG_BUILD_MONTH		0x605
> @@ -1245,6 +1246,8 @@ static int nct6683_probe(struct platform_device *pdev)
>   		break;
>   	case NCT6683_CUSTOMER_ID_ASROCK5:
>   		break;
> +	case NCT6683_CUSTOMER_ID_ASROCK6:
> +		break;
>   	default:
>   		if (!force)
>   			return -ENODEV;

