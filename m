Received: from mail-pf1-f176.google.com (mail-pf1-f176.google.com [209.85.210.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C91C83815E9
	for <linux-hwmon@vger.kernel.org>; Sun, 29 Mar 2026 19:13:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.176
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774811584; cv=none; b=jaHRLavnKm89f4DLMih5X0M5WaFwyKlsLyX5K8+K/tMHpBwf6V+2kG2FtRXbGItKo0IAAOaYx8MsNbazkJXErKC6m3ed5hFhUzfII6KUwmmDCwejKZW5ZVXXCZYn4gx9LlWra9uy7ESSYzgro4fKfOSk5nDfFroicxfYsj4AxXA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774811584; c=relaxed/simple;
	bh=+gtjc7K7Q9IY44WHCSLCf4ByH3kzNJUq4oBtORDPPJk=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Pv7N6TjbI+ol/aXhb6Nv2kifdrxGumGlo3ojxdj9Zz78B8QAzHr/9mm1ljMXAnI4j8IqJrYEsUIsYDpiwGAg+5JN2K1u3TzoHhp3EIVPZnXDFCBc+Uay+LyY/tfyPHipTzIWgpzk3pFAVqleuE+j3HPd1L6yQqCU0N661KMjRDA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=PcJ+UmkC; arc=none smtp.client-ip=209.85.210.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="PcJ+UmkC"
Received: by mail-pf1-f176.google.com with SMTP id d2e1a72fcca58-82c70e4654eso1567905b3a.2
        for <linux-hwmon@vger.kernel.org>; Sun, 29 Mar 2026 12:13:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1774811583; x=1775416383; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:sender:from:to:cc:subject:date:message-id
         :reply-to;
        bh=QGckwBo/T6rYcFnagiWvk5nb04xfskv1xFoj3AxjaK4=;
        b=PcJ+UmkCXFc5rWp8VALG5jgNGyJe4OZh8DFGE8UnSIK4spQDxCvlUf8SbTjNUA6f8x
         N4sFTJdANrmvmaRe3dMzRmiCKkNOhDwProZJVfqmhUX6+HPdq/w0WPlS9JXpKxzPxKTm
         ghmMHyMiyyeQtTaI6VBD3JBlaN8DaYgZglHPGStHnLJ/kaxqE+p6mjRJeYP8LuFkDR+p
         RGVvKyx8kHu53HC5hKxNdalv2MPf+rEc+6xH9qy5C2MeDg3yqGfHk6cLelGofbqLiHAF
         uKpGA2RmeBCwHoMFFw6tSmpqiPzF21JALMCvKZjA1LYqNgZaVViofbQQMYCzSQnbVqxV
         b/hA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774811583; x=1775416383;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:sender:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=QGckwBo/T6rYcFnagiWvk5nb04xfskv1xFoj3AxjaK4=;
        b=LCnHoE5AkdFqUNZBfGJR4mRon8IvDRvS9Vf1G2SPKDmMD/yTAzEidIkf24ow91BYxe
         VZtGnHGxuxbht42sRuDOz6yldBYniQiXITTy9nBg86w9eqxrl3bO6MNTNPjsfdPocgCy
         04q3YREzIzQq0k2wcIDMmVcRnIwbZc2NJ8J3SnA5YB83YQ2lU5QD0cIPFfV9Vx/bmj1W
         aOMCkNo+K6OfeX6O0W6fXsgRxfp6cL7Wcll7s+20IjFpt78VWJBvFTf3Jphk/X5qmXE+
         XAIusW0yfp2wX5/tEpdxyU/9MJrNlXyrdtg3WzV/o6twk3pqbBIpzAqjw0jOVyBcVicO
         yxHg==
X-Gm-Message-State: AOJu0Yyo6y1Qj5nQ4vj7B/Eu5VPcFoNGxzLGZ+RJCvJXzxzaA2+3EYj1
	ITGZQ01sdzAVJAqX0q7TX/YpPL5C15d//fFA9kWpREQazF3lU0IObehX1NzJ3A==
X-Gm-Gg: ATEYQzw0FcjFAj84Y1qtxFscyCCmCVTvenw942C4YG6L0QTQXaHHkASm0LrE5b6Wk9U
	Z9+3xJ+8P1QyYdDKpXdLXIykVFFVmGdhKPwbP0nk6rXA36ZunOcr2vcIs5a7OMn+AopB2wRrh8H
	2sYAG7qNnDztx0EF9tR45ifNha9mj6htPyKVbGfYEI5pVjCO94A7Bb75XQuKCshDOlEvjMry5NA
	i3Z97n23G7JeBPYjTyDD07rwnOd8UNNmIZ/R1/0Cmz7RbZAT0ln4feN99IboktJDJObh+SH/Jss
	Bcqn5mqR39iKrdd2DxVsjw6BL94TjpKSNNJOq+IzTgYfkFkgZQGHM+duEUnWg+4tq6X+O5/xmNi
	eupRc5hpEdYlEksR9ZWQDvi6jV2A5UPY9DL9lrw/mKGdgIExTw7aAA2z0/XCP+VvXk1SdZ2srg1
	NO92riZ64uDv+VNRfO3tBjXvGQOfiP8FG9Re0a
X-Received: by 2002:a05:6a20:3d85:b0:398:a3e5:d04b with SMTP id adf61e73a8af0-39c87a3c1d9mr10836144637.33.1774811582804;
        Sun, 29 Mar 2026 12:13:02 -0700 (PDT)
Received: from server.roeck-us.net ([2600:1700:e321:62f0:da43:aeff:fecc:bfd5])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-c769179e3d3sm4268644a12.15.2026.03.29.12.13.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 29 Mar 2026 12:13:02 -0700 (PDT)
Sender: Guenter Roeck <groeck7@gmail.com>
Date: Sun, 29 Mar 2026 12:13:01 -0700
From: Guenter Roeck <linux@roeck-us.net>
To: "Pradhan, Sanman" <sanman.pradhan@hpe.com>
Cc: "linux-hwmon@vger.kernel.org" <linux-hwmon@vger.kernel.org>,
	"Delphine_CC_Chiu@Wiwynn.com" <Delphine_CC_Chiu@wiwynn.com>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
	Sanman Pradhan <psanman@juniper.net>
Subject: Re: [PATCH 3/4] hwmon: (pxe1610) Check return value of page-select
 write in probe
Message-ID: <0b1d3ee0-ea20-4224-959c-8423deae7610@roeck-us.net>
References: <20260329170925.34581-1-sanman.pradhan@hpe.com>
 <20260329170925.34581-4-sanman.pradhan@hpe.com>
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260329170925.34581-4-sanman.pradhan@hpe.com>

On Sun, Mar 29, 2026 at 05:09:48PM +0000, Pradhan, Sanman wrote:
> From: Sanman Pradhan <psanman@juniper.net>
> 
> pxe1610_probe() writes PMBUS_PAGE to select page 0 but does not check
> the return value. If the write fails, subsequent register reads operate
> on an indeterminate page, leading to silent misconfiguration.
> 
> Check the return value and propagate the error using dev_err_probe(),
> which also handles -EPROBE_DEFER correctly without log spam.
> 
> Fixes: 28ccdfd11344 ("hwmon: (pmbus) Add Infineon PXE1610 VR driver")
> Signed-off-by: Sanman Pradhan <psanman@juniper.net>

Applied, after fixing the "Fixes" SHA.

Thanks,
Guenter
