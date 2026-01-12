Received: from mail-dy1-f170.google.com (mail-dy1-f170.google.com [74.125.82.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9C36321D596
	for <linux-hwmon@vger.kernel.org>; Mon, 12 Jan 2026 21:31:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.82.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768253512; cv=none; b=p5AWK3HFnCE0MCmzYIp0y36ie0vG9ygWKG6XVl/lRtMxOX2wb4MDe/UDtgA6cByb276tIeVNSrfX8IBAZG5gWbqOWlkn9ErNphoSRe8p16+LrroZ4xOyqPMePpJHWXhwmh9PEUG6uKhVycYHGOJOu0GK0nKHZ01q/sfH06iqPSc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768253512; c=relaxed/simple;
	bh=+SUleTAyRRBgQnp+GBahWoiKEFLaCNTKSp8pUgYM+GA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=LLYJtOgqP0AD5ENjYqi2wPHVe3cQy+gY8UZMc45EVoo0z+LThpa+1DL/TW7vy5tlO/cZ1jRi3RFLua4EVEtg+XSoKD1U6UJxDGFbvHASuw1e7FmU0ChxTKcZUC2muJiUjZJJX8DbeURcBpjG6mnLez7kzFX30KmeUM1UyUtZriA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=JonyWNBX; arc=none smtp.client-ip=74.125.82.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="JonyWNBX"
Received: by mail-dy1-f170.google.com with SMTP id 5a478bee46e88-2b05fe2bf14so10572114eec.1
        for <linux-hwmon@vger.kernel.org>; Mon, 12 Jan 2026 13:31:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1768253509; x=1768858309; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:sender:from:to:cc:subject:date:message-id
         :reply-to;
        bh=7IuRcFHkwKrDdeOI7dQx6qfizBNnx38txGz3onHtm/o=;
        b=JonyWNBXHhZeuPq+9GDJQBwQnTOrdydLxlPYXvE0i583qHykaWi/xHB4tVy2kAl5U+
         MzTE+fiqJGKirJACREM4xMF/zyaROd0fXpf/bBDA0JwQolnfRoqmq8OoVDwV/ugkHy0H
         eH3XfgTZDycqsfJnf/TVkmdyFfWptuJq5A2Ilt+I4TxPksZbTQY+Gg97cbB48axDiEmL
         lQAmhNTNf6CoPLNu03JmvkgmbMR/MzEE6q2IRWjgUJR2rF01yXDFiibqkHS5ZzgT0pme
         ZO9Vk44mYzCXiJ2490UYldRn6GDeAT9f2dU7DPkzxhaE3jIbC3QNazo3dyQ7A9JB57XG
         9HnA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768253509; x=1768858309;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:sender:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=7IuRcFHkwKrDdeOI7dQx6qfizBNnx38txGz3onHtm/o=;
        b=Ks80h5rc357CPyj5xBpbeKLO9K2mIRYpyo3yDiir22Wi6DsC7fmkwjQHUgtC8Z2yD1
         JV2OfE2tbPXcivxU4IdHS91Cifdnnd67is8zPo6BnXZCekuCRbHEzV4WodsQdUhiWs64
         mQgiXnvS3VzflJTR7NnB1QQ1FzneM/0JFUWd6IdpChKcngSWmSkkOSkVQ49sBwMDFIze
         7V20kdLL+PoJjnlUE6taBbNRkrdBk0aIBbgrbPpN/lpMNtfJY6Jbxj6jmPNf4GvcyGDc
         YPLi4DKzZql66LCecWf4I3xJ4jlXnJu0hD1L5JqRL9U1Q0GRD3VQ+92AvgUah7UOx/mT
         ezJg==
X-Gm-Message-State: AOJu0YwIxqut6DFoPmM+zd+2D/3xBirICYLLZmr+eIVZFvUZplfp6iAP
	+nVzj9VbnzccQcZZ2Dd/i1FhFMALVWLsFYNXcNemVpCWpSxx+WbOLyCEc5ss/A==
X-Gm-Gg: AY/fxX5R/VJOiMDnBt2JYRS8xtGaWUL0Bdfob44Z4IWjvk+1e/yIG6IIOfC/BIwYNtW
	xulCd8MlX+Y4A3WCghCmKTlwIvc7EcUUK0roXjxfabkO5qUialZv3WUp1qk+toT/EsOeZ5Q6NNt
	7NMN5AUXQSWMn5A0/6EX3xNbrTTTHotkyEyLd2fy6HJeik2qIyWgyma4nwYUGiOKYgDnxEvSpDB
	tgCjBH9WUBhGHlBOdmp5LfTZQHFZkdAYY5WipFyT11d7qBhEmCF3d85oMhPs93aSD/NG7jTOxPb
	OfnUmXo+OnQtolg+r2+oOhzi/+0rZZaL0n0UpN5swk9PaUpsUaT0m4+eehSn0gD4k7zafe/e9pp
	dqw7UP0moTKAMiqPaPHjXRCBh4/HDdSdBy9LBRQ+wbBOjnZbBPPrgazIgMmYLFyNXAg6UjI7t2V
	yzPBAbeFI6IJZNwfu0WZf3njli
X-Google-Smtp-Source: AGHT+IHpZztL16EIgh5J9uoMm0fJvBu5YnDSJiyQ6GaXqEHGP3pFPlAOc494gTMr3EFP0hlmTU34jg==
X-Received: by 2002:a05:7300:aa6:b0:2b0:580b:856c with SMTP id 5a478bee46e88-2b17d2ba77bmr11536670eec.28.1768253508609;
        Mon, 12 Jan 2026 13:31:48 -0800 (PST)
Received: from server.roeck-us.net ([2600:1700:e321:62f0:da43:aeff:fecc:bfd5])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-2b1706a53fbsm16396116eec.12.2026.01.12.13.31.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 12 Jan 2026 13:31:48 -0800 (PST)
Sender: Guenter Roeck <groeck7@gmail.com>
Date: Mon, 12 Jan 2026 13:31:47 -0800
From: Guenter Roeck <linux@roeck-us.net>
To: "Ji-Ze Hong (Peter Hong)" <peter_hong@fintek.com.tw>
Cc: linux-hwmon@vger.kernel.org, linux-kernel@vger.kernel.org,
	hpeter+linux_kernel@gmail.com
Subject: Re: [PATCH V1] hwmon: f71882fg: Add F81968 support
Message-ID: <5a7023ad-10bc-472e-b759-31a3761bd3a4@roeck-us.net>
References: <20251223051040.10227-1-peter_hong@fintek.com.tw>
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251223051040.10227-1-peter_hong@fintek.com.tw>

On Tue, Dec 23, 2025 at 01:10:40PM +0800, Ji-Ze Hong (Peter Hong) wrote:
> This adds hardware monitor support the Fintek F81968 Super I/O chip.

"This adds" -> "Add", and "support for".

> It has fully compatible with F81866.

has -> is 

> 
> Several products share compatibility with the F81866. To better
> distinguish between them, this patch ensures the Product ID is

"this patch ensures" -> ensure that

> displayed when the device is probed.
> 
> Signed-off-by: Ji-Ze Hong (Peter Hong) <peter_hong@fintek.com.tw>

No need to resend, applied after changing the above.

Thanks,
Guenter

> ---
>  drivers/hwmon/f71882fg.c | 6 ++++--
>  1 file changed, 4 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/hwmon/f71882fg.c b/drivers/hwmon/f71882fg.c
> index df83f9866fbc..204059d2de6c 100644
> --- a/drivers/hwmon/f71882fg.c
> +++ b/drivers/hwmon/f71882fg.c
> @@ -51,6 +51,7 @@
>  #define SIO_F81866_ID		0x1010	/* Chipset ID */
>  #define SIO_F71858AD_ID		0x0903	/* Chipset ID */
>  #define SIO_F81966_ID		0x1502	/* Chipset ID */
> +#define SIO_F81968_ID		0x1806	/* Chipset ID */
>  
>  #define REGION_LENGTH		8
>  #define ADDR_REG_OFFSET		5
> @@ -2570,6 +2571,7 @@ static int __init f71882fg_find(int sioaddr, struct f71882fg_sio_data *sio_data)
>  		break;
>  	case SIO_F81866_ID:
>  	case SIO_F81966_ID:
> +	case SIO_F81968_ID:
>  		sio_data->type = f81866a;
>  		break;
>  	default:
> @@ -2599,9 +2601,9 @@ static int __init f71882fg_find(int sioaddr, struct f71882fg_sio_data *sio_data)
>  	address &= ~(REGION_LENGTH - 1);	/* Ignore 3 LSB */
>  
>  	err = address;
> -	pr_info("Found %s chip at %#x, revision %d\n",
> +	pr_info("Found %s chip at %#x, revision %d, devid: %04x\n",
>  		f71882fg_names[sio_data->type],	(unsigned int)address,
> -		(int)superio_inb(sioaddr, SIO_REG_DEVREV));
> +		(int)superio_inb(sioaddr, SIO_REG_DEVREV), devid);
>  exit:
>  	superio_exit(sioaddr);
>  	return err;
