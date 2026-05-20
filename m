Received: from mail-pl1-f169.google.com (mail-pl1-f169.google.com [209.85.214.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 00E9F34A3C4
	for <linux-hwmon@vger.kernel.org>; Wed, 20 May 2026 19:54:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.169
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779306885; cv=none; b=Wf7SgGr1TmELVgPenSxcjE+kilw1vxxPLwxKRt/GgfUCI5SqHpBrAjbnDBquyB/28R3hKTAvq30iQKFLhbnfUBABVmb0jqznZr9nUrSU/LLi+vy9D3Pl0edQOgToxcJZp/C8V27PQJs0axiTyfSX73tIcHI9aTUBanr7sCWcWyk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779306885; c=relaxed/simple;
	bh=9ZWtFRH0DPYU9OZpvc16UhZqJMlJFzczsymdwuMzGxY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Mn+kYii2wXLRVyo7c0MpLkLvdL4BWn+Ak+bKmVrvISJd1tc091EzkgCT27nqmwJQHwkq/+eC+HQUK9VwnTMC7b3/BQTnmgFvGiQg6TWwYEuXu33bwzNctW7bO5a1hcfC/VQgPWb2aJtlLjexP+VdqziOSD71ipVtAu2dba7ro+0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=V7gqvzRj; arc=none smtp.client-ip=209.85.214.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="V7gqvzRj"
Received: by mail-pl1-f169.google.com with SMTP id d9443c01a7336-2ba6485d219so38975635ad.3
        for <linux-hwmon@vger.kernel.org>; Wed, 20 May 2026 12:54:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1779306883; x=1779911683; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:sender
         :from:to:cc:subject:date:message-id:reply-to;
        bh=MvDmyYYDhU9M3W4nTBWC6Lb+TYu2a1Dlqugl0ynZCbs=;
        b=V7gqvzRjnpD/U1FBJiUhin3xfMWZDkhKCFHpT/XgNYO8nLcoGvUINYhbzflGJjY4bb
         sP0rRCHknKCyt2akAUK0amJptk+KaDxs/dd3N0RnOYCHrLogVlbIia89bRlSOPAYhqEh
         KOVYYERnwXuYGFcdY///0cYRlPW+xEmhF2lD3PTMhKFTxfKWTaCHvgQAAZrDL/NKA2A+
         V9rbYysPtF4ErNH8c9rLpPf/SqZ+78IA9ry2nzGLdKKhNTuleGhEkToosuhGPoPtBcDy
         em+qVW5J7XdwFzTCCD3yasEd+XHJQCLyyNeuLkmxmqcC1PrjKGTMT4GF+j+nSyL9cd8S
         pQ+w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779306883; x=1779911683;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:sender
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=MvDmyYYDhU9M3W4nTBWC6Lb+TYu2a1Dlqugl0ynZCbs=;
        b=qrrVXOpFWXIAf7k6FmHex5A1/gRX1hrDKvWnNWl8Rnu4afUogu+w37JL4PE5VOm8cP
         tXl2sEh7eHouSkLa9ah3mrWkJhzk7Q2ZFZwIlxA/GIIWH/+yHlCuB5DupBLORel0k7aH
         ZebGHraJgtE5UWo3i8X/q/7jGcZ0buOely4NOfqVa1Nbau0XRYqjl+NY+TeWLYvabQuY
         vvWAgfSXQuAGzV9wWoZpckaff1d20VIKUGUE2t6Sn6+0oDYap2HAeuw5pmOWhAVSQWiO
         bne5ZJYZAkfATKYkIAtdMHho/R9MpyEx7FvWOHk88eFRMe2KvKZhpVLgJcoOuk0A6tYh
         3jzA==
X-Gm-Message-State: AOJu0YzOQ0OhgRJNbGwHXOVzOPPzvcfftaE8j0sb7KtF4SnXH7PD/67O
	/Z4m0WCO5D3ZH3HklxflnTqoquFBhdTVIJNb3IT0jRZsvJWAxrGXnZNb4de2z2NX
X-Gm-Gg: Acq92OH8YYejqvxR9U56kefHo689vTcmVEilhEHts865V7EneH3QH+W4lHBIJ1Mw3s7
	y0GFvDYWc4uVSYnQh3AnewL7U9H/6Eg+wuaFD60klCjx88/0IWB+/WpudUoFdg0pTilQV25Qv6T
	CBdReaLWSRSku8UM3EwSAF+lW5OV0dc0Un+/gFuoEGUouAXdC3qROJWOQ0x/9Zfh0NRq3GMsAVu
	J8yZ7bdpHRDC5tUoKVYfUw3KyDGSA9ON8KdkijYJOnKjAnxN5by35GlLK71u2fKD6Qt3OBZT8is
	XjlQY89QzdiqZWMKzizvU0Med0Bfga0TvDRnCHL4Na+aDcX2RCb7I67dr0ovSza+rEJKWKHDJbq
	CUCxuaMc4kPLDWki0dBcqz4vvbsWKQVjxnlFOkNI9VrN85Z+EsCCvrpWDPgybNh0+O3DDvT14bC
	7Gdzp7VM6vsBKGRiP/lMwoBejV8m28zSR3NlGm4aUWCN4Ph1s=
X-Received: by 2002:a17:903:22c9:b0:2bc:e2ed:fd03 with SMTP id d9443c01a7336-2bd7e9c8834mr267611215ad.39.1779306883142;
        Wed, 20 May 2026 12:54:43 -0700 (PDT)
Received: from server.roeck-us.net ([2600:1700:e321:62f0:da43:aeff:fecc:bfd5])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2bd5d0fcb10sm227212495ad.60.2026.05.20.12.54.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 20 May 2026 12:54:42 -0700 (PDT)
Sender: Guenter Roeck <groeck7@gmail.com>
Date: Wed, 20 May 2026 12:54:41 -0700
From: Guenter Roeck <linux@roeck-us.net>
To: Reiner =?iso-8859-1?Q?Pr=F6ls?= <reiner.proels@gmail.com>
Cc: linux-hwmon@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] hwmon: nct6683 Add support for ASRock Z890 Pro-A
Message-ID: <7ec1cd4a-c094-42a2-ba60-e6cc7d82e7e2@roeck-us.net>
References: <4eee938d-e4ca-427d-a161-aa9ef737af3c@gmail.com>
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <4eee938d-e4ca-427d-a161-aa9ef737af3c@gmail.com>

On Wed, May 20, 2026 at 09:16:37PM +0200, Reiner Pröls wrote:
> From ac010d19f5ba1e44a0ddb83cc570f18ca3348015 Mon Sep 17 00:00:00 2001
> From: =?UTF-8?q?Reiner=20Pr=C3=B6ls?= <Reiner.Pröls@gmail.com>
> Date: Wed, 20 May 2026 20:59:57 +0200
> Subject: [PATCH] Add support for ASRock Z890 Pro-A mainboard

Subject should be
	"hwmon: (nct6683) Add support for ASRock Z890 Pro-A"
or similar. Actually, your outer subject comes close.

> MIME-Version: 1.0
> Content-Type: text/plain; charset=UTF-8
> Content-Transfer-Encoding: 8bit
> 

Description goes here. Look into the driver log for examples.

Also, it looks like you embedded your patch in another patch
with a different subject. That probably triggers:

WARNING: From:/Signed-off-by: email address mismatch: 'From: "Reiner Pröls" <Reiner.PrÃ¶ls@gmail.com>' != 'Signed-off-by: Reiner Pröls <Reiner.Pröls@gmail.com>'

Also, when I try to apply the patch, I get "patch is empty".

Please fix this up.

> Signed-off-by: Reiner Pröls <Reiner.Pröls@gmail.com>
> ---
>  drivers/hwmon/nct6683.c | 5 ++++-
>  1 file changed, 4 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/hwmon/nct6683.c b/drivers/hwmon/nct6683.c
> index 0581770380cc..1b9092f48c7d 100644
> --- a/drivers/hwmon/nct6683.c
> +++ b/drivers/hwmon/nct6683.c
> @@ -177,12 +177,13 @@ superio_exit(int ioreg)
>  #define NCT6683_CUSTOMER_ID_MSI3    0x207
>  #define NCT6683_CUSTOMER_ID_MSI4    0x20d
>  #define NCT6683_CUSTOMER_ID_AMD        0x162b
> -#define NCT6683_CUSTOMER_ID_ASROCK        0xe2c
> +#define NCT6683_CUSTOMER_ID_ASROCK    0xe2c
>  #define NCT6683_CUSTOMER_ID_ASROCK2    0xe1b
>  #define NCT6683_CUSTOMER_ID_ASROCK3    0x1631
>  #define NCT6683_CUSTOMER_ID_ASROCK4    0x163e
>  #define NCT6683_CUSTOMER_ID_ASROCK5    0x1621
>  #define NCT6683_CUSTOMER_ID_ASROCK6    0x1633
> +#define NCT6683_CUSTOMER_ID_ASROCK7    0x163d // Z890 Pro-A

No C++ comments in this file, please.

> 
>  #define NCT6683_REG_BUILD_YEAR        0x604
>  #define NCT6683_REG_BUILD_MONTH        0x605
> @@ -1248,6 +1249,8 @@ static int nct6683_probe(struct platform_device *pdev)
>          break;
>      case NCT6683_CUSTOMER_ID_ASROCK6:
>          break;
> +    case NCT6683_CUSTOMER_ID_ASROCK7:
> +        break;

Was this cut-and-paste ? There are no tabs, just spaces, meaning the
patch would not apply. That would also explain the duplicated headers.

Guenter

>      default:
>          if (!force)
>              return -ENODEV;
> -- 
> 2.43.0
> 
> 
