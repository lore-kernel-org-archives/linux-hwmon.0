Received: from mail-pf1-f175.google.com (mail-pf1-f175.google.com [209.85.210.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1A24226C3A2
	for <linux-hwmon@vger.kernel.org>; Sun,  8 Mar 2026 15:03:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.175
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772982199; cv=none; b=DBTbjJUfoV20ToTBEBuoZvnMM+Nn/L8IxGvUuWhJ4Xtsn2uLPRiKn8bGCnsPOQw72eZuCUCUqO4Nfysl6uFxknk0DJ4VKXQ3cuv4zxnU4L0f/HYmlUHczaDBu5IJXC3Szwojoh4VZD+XkN9sQvXp8UTRHQYOmx6vFHlS9EB05UU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772982199; c=relaxed/simple;
	bh=fshM5uTzhs3m8MZrrOuoNPEYO2iITVllJnlGB1ZGppc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=a/dW1IVenv8LyhkbCHWtzAK06QmNUIdlfOlzWdEcgvVBbfq88Hi4JxzK4iwp+QyqMoTZ9TjXuGwuijwQ7UoCdjlmKJv/Yx+LaGfl4ayi5cn7ax12/QXsc4t37mHLR7cgtWL0x62cGjSKuiEL9/LuowqkUBxboerx0rbAi1dEjhw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=AH86oDij; arc=none smtp.client-ip=209.85.210.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="AH86oDij"
Received: by mail-pf1-f175.google.com with SMTP id d2e1a72fcca58-82987437624so1676132b3a.1
        for <linux-hwmon@vger.kernel.org>; Sun, 08 Mar 2026 08:03:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1772982197; x=1773586997; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:sender:from:to:cc:subject:date:message-id
         :reply-to;
        bh=7YsnZcF0cr8MKQJngVB6zT9BhYiNQrSg7doPYXR0OYs=;
        b=AH86oDijMmuAf1WfJ+rNGLw1+qZ+9S1WuPWVyLI12CdciowR4Ydrt1gx3UrxuMyvAt
         ZYnmOJCWzAn5Fs/xjy9zNuoCvSR2qgUznwSyknUJml2jzlv1rpI7doZOzHd2VKMy0Tz1
         wJ8GcWRlFRXB9zPNY79K4e06j6un8bksaOqD1FZerTa32Kxbkq8Ui66Q9orjzgx0kkl1
         i8vtRC4QMGtmsBjmNjnq782Cy12Kx4lumlVEKi+vwpKHLmOEoaR5O/DIa52GAkNsL5cQ
         6ieqMobP+hj5al/zFn3bfJvAZZUEpXRSKu2gZaJy6WUqpCF5prxUX6K3awYv6g007vft
         8xYQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772982197; x=1773586997;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:sender:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=7YsnZcF0cr8MKQJngVB6zT9BhYiNQrSg7doPYXR0OYs=;
        b=foPZJkKlCsoP/Jz3cMFP/zM3Lv3leXBJBC+rdOMSSQ6L+ej2Rc53pXfyXiW0gK/w3d
         5LdF03MxmWS7XTm4k6piWGOKhw58wlfWVWvNwvFfZiQNgdeJlK/tfbeAggUBnv04Z3Ls
         uy7j9g6KKZ0ASrHxaoX2+YSp0aiv/bRPYgEK+EIqrFlnnS+MeaYkhJHGuaX7P/OJXaqF
         taJRDv11BjXQAhk4vGO3pjGqJW6uOVoOjWQnaW1cJCUNi/er0FT1LtamQrOAPKgOcvBL
         JGejxNrsh6Rc1UruOaVT1d/dUb/0ddG8UXQLyI3f0b2NX4E2I59ZsraWd/B5P8tIokAE
         P4Ig==
X-Gm-Message-State: AOJu0YwkGKn1hUX2oFjqNPEGZvAEYvEg20PPY9EKT1sczlymVpkK53eQ
	NYi2Is1G+4sbpQlu0YLoSvyA1UqpgGDmR0JjwxuvbPcZIWckVm1KWahIjMyqDoaJ
X-Gm-Gg: ATEYQzxjdjHIkTWEsYS5L8LXpdIjBTa6bHT1HqS+NlM27UpK8lwxnQvAiY4BnpH8s9s
	g4+7PsM0F8b+1AckW+EXEbM6fdG5pObM8w51hH+QcivfZJuPuAg8NJXND4ULcM7VLKDMGwgOFLp
	QaIFdHAUZq2MA4xH323Icp9iM16a8GJSzgbHgnu0/ntfq7LBDdsqI456xaPqzYKsTXyJq1uQ2v1
	tbjsb1xvl2BAr74wtASU7hlrF/4bubs0EOymly/UVruiv/TvEbAWQduP31t4PVktl8B8lGt0yqS
	2fM/aCTs8QWKKwN+jonQdx79xEMNrPqjQPdW0tJvpLB/N/JGCeZHNdIUyyAvRLPdaLvGdyRJCUO
	HTB/+0ACaU74ftG4xbjYqK7qRblXZIpPg9vcunOrkSXrIU/PX9lVsH8Fq8LBf5wTwC090h9XUIy
	1Xe79+444ThtEPKW7DTzOQ0Onhl4ebZXOvjX9f
X-Received: by 2002:a05:6a00:84a:b0:827:32dd:59c5 with SMTP id d2e1a72fcca58-829a2af0979mr6723969b3a.28.1772982197400;
        Sun, 08 Mar 2026 08:03:17 -0700 (PDT)
Received: from server.roeck-us.net ([2600:1700:e321:62f0:da43:aeff:fecc:bfd5])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-829a4656f36sm7024501b3a.14.2026.03.08.08.03.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 08 Mar 2026 08:03:16 -0700 (PDT)
Sender: Guenter Roeck <groeck7@gmail.com>
Date: Sun, 8 Mar 2026 08:03:15 -0700
From: Guenter Roeck <linux@roeck-us.net>
To: Tabrez Ahmed <tabreztalks@gmail.com>
Cc: linux-hwmon@vger.kernel.org, linux-kernel@vger.kernel.org,
	Shuah Khan <shuah@kernel.org>,
	Brigham Campbell <me@brighamcampbell.com>
Subject: Re: [PATCH] hwmon: (ads7871) Propagate SPI errors in voltage_show
Message-ID: <fe94f582-a4d5-4a81-81c9-562776880aba@roeck-us.net>
References: <20260308124714.84715-1-tabreztalks@gmail.com>
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260308124714.84715-1-tabreztalks@gmail.com>

On Sun, Mar 08, 2026 at 06:17:14PM +0530, Tabrez Ahmed wrote:
> The voltage_show() function previously ignored negative error codes
> returned by the underlying SPI read/write functions. Because negative
> numbers have their most significant bits set in two's complement, a
> failed SPI read returning -EIO (-5) would incorrectly evaluate to true
> when masked with MUX_CNV_BM (0x80).
> 
> This would cause the driver to enter the polling loop even when the SPI bus
> failed, eventually returning a misleading -ETIMEDOUT error to userspace
> instead of the actual hardware error. Furthermore, the return values of
> the initial SPI write and the final 16-bit SPI read were completely
> ignored.
> 
> Add proper error checking after every SPI operation to ensure hardware
> failures are immediately propagated back to userspace.
> 
> Suggested-by: Guenter Roeck <linux@roeck-us.net>
> Signed-off-by: Tabrez Ahmed <tabreztalks@gmail.com>

Applied.

Thanks,
Guenter
