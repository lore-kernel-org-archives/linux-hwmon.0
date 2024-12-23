Received: from mail-oi1-f172.google.com (mail-oi1-f172.google.com [209.85.167.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7E691624;
	Mon, 23 Dec 2024 07:57:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1734940676; cv=none; b=g7NC6dSP6BNGBrO3K0KuEvLYcHjPK/sdT20ahKVBKhM0JWa0MOrxSFpvLUkcyYxlrmRynIqwNuSRFVeTEzR0y/QhjZyyPWDEPxZyGtgNnbBYn3zJq4pjdgwSpJwhn2lZft65NjbUnWZT6ugGfu4mBOWc3K4Pc2FlkJF3agcvXGA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1734940676; c=relaxed/simple;
	bh=WB81xD4CM6v7rHmlKhdwR6c2V81c4jb5gjuQliNhxg0=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=RcLtvUcTV5zXd4ypGWeSS79oVNdVvoh5afu40juWYfTW2KInHOSsCc030kLevVT22ucHsDRSiOhj6rqpEdI6wWZOXygAgn7u33vC4bWh3Oy36xO0E6tTe2e8bbZA3c2zkbiikyJ88h5jTJJEIvng7p8UxZgyqn36eGCmuNTsMpw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=HVFGQfIB; arc=none smtp.client-ip=209.85.167.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="HVFGQfIB"
Received: by mail-oi1-f172.google.com with SMTP id 5614622812f47-3eb7f3b1342so1638766b6e.1;
        Sun, 22 Dec 2024 23:57:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1734940673; x=1735545473; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=pEtgNmSzYfLLItv4Y7mIGCRKQyJmT/Cj2Q9r7iX2u50=;
        b=HVFGQfIB3hnJnoNamCC3S2vecL4MU9lrFZrljtY5yhqCr1ISOuh8DluJu0JeyhvkES
         jHfID3qKFh4MthMxM66wBIqpEDxiDdYH7K7c4UsKDEg8ftqcitC6oDjN5TxHCdF/0cT/
         jFmOV/tBaDn+tIkqJSPu68XLAesA4rxc3d/Am1GJ8bKS+fZpA6xRxfEPLh6NWdWzlyVc
         /kAIq2Gem1DMxquDnVkFzu//NSGeaNiNKXxlijaVPT80fikzmDISo3311AUKki18fB9l
         qGXUSLjQa+i2Ti5kqC/pDtTsY22xXDpG/Cl81isAekAWN6j7nEc9VP243lHRW6mLIR2Q
         424g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1734940673; x=1735545473;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=pEtgNmSzYfLLItv4Y7mIGCRKQyJmT/Cj2Q9r7iX2u50=;
        b=CiUc5/AKfcxYZqJvUcgBPdjkf/6MC/thzjtvvsrlw8IIHpq4ux9evwSFGMpa0pygA6
         CtMmRyBSbLLxfNp3ZGAp3Z/4jdIcgM1nZ7BMT4NsiPVpZBWD2ZtHP8zle7BqNH64ddsc
         K6nVQ4gAutNHkDpKWp9l4vkqSdlA6wuvCg27QQjbdzIldh8TyeQcA28mAl5LJIKk4cyy
         YgnTZ7YoYbIrv4+bEpqbUONcbH1eQbs2/wT2fbDK/LAIg4phC1UhB8qHO/NZOONloPik
         kDR4E5mXmhio7tLS9n9Aq1fnH+L4NIRqymeN14lsJwIjc/fYjpt+M1hHQ5oUwaNMUvNl
         eVCA==
X-Forwarded-Encrypted: i=1; AJvYcCUl5ZELj+aMIJnloCXwxV6Y8uOQ00qz35GLu0OhVCX3XjKkPDGqi0rGSR+hv6gHBGaJjW6oNYj5ZR7f1A==@vger.kernel.org, AJvYcCXgHXFK9ll9A8FMiTznUovwjaIPeXtGB5QDdtTn9H/0CbRnbM5peoumM0xtv1Rs0jY7fUZVzDXwpgXhiEwu@vger.kernel.org
X-Gm-Message-State: AOJu0Ywnd+s3/u5T+JzHKAtY0rQmjTYl/XxIrOstECPWYkJyKDrhKyIW
	k4NdhZtxFj9DLa586CHmOIAwLCLyfTfmGe7Jk5KHtJuLMf+He2qJ
X-Gm-Gg: ASbGncvspw0JqEykCyuisg0y2T2IGkLS/IyQIgSibMvs4EcW/Rzx8auqEPHOmJ49434
	v68HQUxp4pThgyOON5P7saJgWu6NUW4G7HQIOkFATY/wQlMbYJ+1KpRQEXJCl9/A/W1gnipBU1v
	AFXwoojC42n0BPYvWLc0ROox2b2vojv4F9pLL20tacxn6Sopo6uyhZC5Xbs9ktRR1qc2RvIdL5N
	wGD3rh2ufjTPRs7ViBRWXLHG4Dy4hFeX3zcESdTH4sSLJutIvQH5msY0ASOUHUyNWF9sJEj
X-Google-Smtp-Source: AGHT+IF7xWd7UgvjyPbLvl9kBCLwvaeWoFNe/Im1cPM/u9dAXkG0c3YaAwHL4Mv9rqEZXlMUWeZdMA==
X-Received: by 2002:a05:6808:1b14:b0:3e6:3205:1a71 with SMTP id 5614622812f47-3ed88f0da29mr5534984b6e.15.1734940673556;
        Sun, 22 Dec 2024 23:57:53 -0800 (PST)
Received: from ?IPV6:2600:6c56:7d00:582f::64e? ([2600:6c56:7d00:582f::64e])
        by smtp.googlemail.com with ESMTPSA id 006d021491bc7-5f4daf3cafdsm2099716eaf.0.2024.12.22.23.57.52
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 22 Dec 2024 23:57:53 -0800 (PST)
Message-ID: <1d8b0389-e93a-4f9a-9d3a-e9f61b62e560@gmail.com>
Date: Mon, 23 Dec 2024 01:57:51 -0600
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] hwmon: (nct6683) Add customer ID for ASRock B650 Steel
 Legend WiFi
To: Max Ammann <max@maxammann.org>, jdelvare@suse.com
Cc: linux@roeck-us.net, linux-hwmon@vger.kernel.org,
 linux-kernel@vger.kernel.org
References: <20241214102201.122851-1-max@maxammann.org>
Content-Language: en-US
From: Russell Haley <yumpusamongus@gmail.com>
In-Reply-To: <20241214102201.122851-1-max@maxammann.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

I just modprobed it with force=1 on an Asrock Z890 Pro-A Wifi and:

> [11107.683746] nct6683: Found NCT6686D or compatible chip at 0x2e:0xa20
> [11107.683920] nct6683 nct6683.2592: Enabling support for unknown customer ID 0x163d
> [11107.687827] nct6683 nct6683.2592: NCT6686D EC firmware version 1.0 build 08/30/24

I don't know what the standard for this is, but you could perhaps throw
0x163d in too, if this is sufficient information to prove it's safe.

Nothing visibly went wrong, and it reads voltages and fan speeds, but
the pwms are all read-only.

On 12/14/24 4:22 AM, Max Ammann wrote:
> This value was found on an ASRock B650 Steel Legend WiFi with an
> NCT6686D chip.
> 
> Signed-off-by: Max Ammann <max@maxammann.org>
> ---
>  Documentation/hwmon/nct6683.rst | 1 +
>  drivers/hwmon/nct6683.c         | 3 +++
>  2 files changed, 4 insertions(+)
> 
> diff --git a/Documentation/hwmon/nct6683.rst b/Documentation/hwmon/nct6683.rst
> index 2a7a78eb1b46..f224639229d2 100644
> --- a/Documentation/hwmon/nct6683.rst
> +++ b/Documentation/hwmon/nct6683.rst
> @@ -63,6 +63,7 @@ Intel DH87MC	NCT6683D EC firmware version 1.0 build 04/03/13
>  Intel DB85FL	NCT6683D EC firmware version 1.0 build 04/03/13
>  ASRock X570	NCT6683D EC firmware version 1.0 build 06/28/19
>  ASRock X670E	NCT6686D EC firmware version 1.0 build 05/19/22
> +ASRock B650 Steel Legend WiFi	NCT6686D EC firmware version 1.0 build 11/09/23
>  MSI B550	NCT6687D EC firmware version 1.0 build 05/07/20
>  MSI X670-P	NCT6687D EC firmware version 0.0 build 09/27/22
>  =============== ===============================================
> diff --git a/drivers/hwmon/nct6683.c b/drivers/hwmon/nct6683.c
> index f71615e06a8f..3d31b8e2c835 100644
> --- a/drivers/hwmon/nct6683.c
> +++ b/drivers/hwmon/nct6683.c
> @@ -178,6 +178,7 @@ superio_exit(int ioreg)
>  #define NCT6683_CUSTOMER_ID_ASROCK		0xe2c
>  #define NCT6683_CUSTOMER_ID_ASROCK2	0xe1b
>  #define NCT6683_CUSTOMER_ID_ASROCK3	0x1631
> +#define NCT6683_CUSTOMER_ID_ASROCK4	0x163e
>  
>  #define NCT6683_REG_BUILD_YEAR		0x604
>  #define NCT6683_REG_BUILD_MONTH		0x605
> @@ -1233,6 +1234,8 @@ static int nct6683_probe(struct platform_device *pdev)
>  		break;
>  	case NCT6683_CUSTOMER_ID_ASROCK3:
>  		break;
> +	case NCT6683_CUSTOMER_ID_ASROCK4:
> +		break;
>  	default:
>  		if (!force)
>  			return -ENODEV;

