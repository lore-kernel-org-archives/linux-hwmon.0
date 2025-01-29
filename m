Received: from mail-pl1-f180.google.com (mail-pl1-f180.google.com [209.85.214.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DC2521D8A16;
	Wed, 29 Jan 2025 16:17:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738167423; cv=none; b=nrMpL8+hBGiLlXXl44kwFZw9P5fWrhMmr+0NwpTVAvdiH8vo/7j/Amos0iWtwJ9XDowoi/whK+ElCQnZ4P/U2X7nu3ZRFCMOZ1dVyvH6HGTsF4CKkPwNrbxLNiK3s/nyRHh5bUwQupVZNJijWeucH6T5ovrVIRYq//MJyUEc5as=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738167423; c=relaxed/simple;
	bh=vMH4AHbNEo1X8xdCjwKUe3JGzbmrvf0LTKHttulIVzE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=YnzHRtJOn59bSDCkWHK/pPWFDy5WLvYyeWCYYT26YHXap+COh7GF4FBdFAHc0NV+tpQ0Xm/uLCRcuHlwC361Efau1qiEKoj18xxVzBuset0nsWRmDfIQuojzShmTetlrJvhMQ0ZFL7HY/mf02R2TJ/+vRtAEuPGHEzixI5ynyrA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=MgDPP8QY; arc=none smtp.client-ip=209.85.214.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="MgDPP8QY"
Received: by mail-pl1-f180.google.com with SMTP id d9443c01a7336-2166f1e589cso10140945ad.3;
        Wed, 29 Jan 2025 08:17:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1738167421; x=1738772221; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:sender:from:to:cc:subject:date:message-id
         :reply-to;
        bh=+VUI39JDNpJS/4Dkbxml91Zz8NppmMw6YG9DqWL8daE=;
        b=MgDPP8QY1yTtifaU6qMeXKGSKzatyDguQy4Y/yhVgCHJe0kIl5nQFK4FjjGljX01jx
         Vm9bcY02m8TvqXFHlIaW98NRTVwo7PI6be33XzZ0hHmoPcjg5gCNUA79hFB3iNduy386
         usKG4LVAIvMM1ppuJgqT3+buvBbzZEVY34WaS6Vzfb8UIuvQu9DKscvhVNyns21wf9BD
         flIpnrDFVit6YUBdqF84jxr8ZW0VESWUGIPcj8A53lZdV2CqTiVxCAzVJEBxhicyMHtc
         pguFRMRsNZ9mrXLTiRTPDLLFX6RNU6Xb3UuKrlVnjUNuOxzBlmkKOP/KnwYI+W3aeMZ8
         PVHQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738167421; x=1738772221;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:sender:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=+VUI39JDNpJS/4Dkbxml91Zz8NppmMw6YG9DqWL8daE=;
        b=STIaW5kc0k40SsknYCdEqktbXr4qqS7g8ESLJi6k8jlWd3jdtzyrBKMposjmXpktIo
         iObKPlBwRDDjDToA1wRXCyjuwNxvsq6zhJJk4qNxHol92unf/0gf4TIcE26wnKE+dci3
         bGm7ppYMuwlIaDgPzkGz3TkGnfB1HfclqrMVvvU7qUBnJ7AniQ/Wqfpb7MI5FJTZRUiF
         Lv4T1C7CgVpHkee9J0xG9vznK3WtDgkEbgC1NV+wkngceWdXwEJLfRbaeAShu4wuyi8N
         H4prklLfnvv+NpJ6/+4AlxUzEYudmreg2GlTin1LDrup62qGoqxMS4ZProadjvoO6jpR
         fITA==
X-Forwarded-Encrypted: i=1; AJvYcCV+TXdElH6/n5I1HojIKO1GjcEX0l6CzyLvsdyek8kqa+Dd4qddQxUlYVDo4f9zDFIRa0q1YQQ5sY0ewSqH@vger.kernel.org, AJvYcCWMRsKNgKFeqgeuqiaFQpY1FzJNjpdfD8XYXCuEiIAggY0Qtc9Bffok4vqCZ590Waxf9FF64WtV4ZYZ@vger.kernel.org, AJvYcCXFSpYVmpGCRzKqFoori0r/kGUKuUafkwqkvMqs4NlNl8BvX8bCxnfwKxWRdjxMLDu9oNwCPJrZyr7s6JE=@vger.kernel.org, AJvYcCXs3TlIeF+fsJ+WKILMFi4jnM0xzbcNKE7/iozcrSST3wxoI1K63sTHH1EWc8NXhBgvt6k8992uXUWF@vger.kernel.org
X-Gm-Message-State: AOJu0YxD5P4j87Fqjk0a8SH6TaDgMN/ytZYDW2fYFDdLKHDRbDfp9VHU
	6j631kGRW8e9yvFOgUUC4yZEKTGDDQLxowh8TO98qzBX5Hr85jQE
X-Gm-Gg: ASbGncteXkG9kFkjaqY6Ap1iiPZmnA/L9NK9TuXbWKccjOW5gGfb82MLtjx7ZC8wd7V
	SU0NjlG4YeYATAnUmY1mTM2sOdEaavuDS/YfqnGS/kwiz1mnvbC7fwrr620AvwT1hSfsZS/qjpW
	oJZiUQsLOr0PHn+Oam55IjKpa2CU151PxVS96zXLvHd2hr1NXldb2R1po8GNVTaq407/ElzhbOC
	Puc70NQuKgrkeIQ3/bLK/LtPMvDmxYTMFZoGEieHk4RNpIQ8Rt6TCsDOkoRWQ+EYQEbThDwKWVs
	hz55HWMHwxTKu/WFkDzo6RWq50AI
X-Google-Smtp-Source: AGHT+IELa2WDnyf0caGv/2YsDLATCRcceGBwlZspcs8P+p/HSdm6UyCQEItqhuAmYJCmem3vzMGrVg==
X-Received: by 2002:a17:903:98c:b0:21a:8839:4f4d with SMTP id d9443c01a7336-21dd7c46868mr52558965ad.6.1738167421080;
        Wed, 29 Jan 2025 08:17:01 -0800 (PST)
Received: from server.roeck-us.net ([2600:1700:e321:62f0:da43:aeff:fecc:bfd5])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-21da3d9e216sm102863585ad.21.2025.01.29.08.17.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 29 Jan 2025 08:17:00 -0800 (PST)
Sender: Guenter Roeck <groeck7@gmail.com>
Date: Wed, 29 Jan 2025 08:16:59 -0800
From: Guenter Roeck <linux@roeck-us.net>
To: Ming Yu <a0282524688@gmail.com>
Cc: tmyu0@nuvoton.com, jdelvare@suse.com, corbet@lwn.net, robh@kernel.org,
	krzk+dt@kernel.org, conor+dt@kernel.org,
	linux-hwmon@vger.kernel.org, linux-doc@vger.kernel.org,
	linux-kernel@vger.kernel.org, devicetree@vger.kernel.org
Subject: Re: [PATCH v2 1/2] hwmon: (lm90): Add support for NCT7716, NCT7717
 and NCT7718
Message-ID: <c9e2c3ef-852c-4a6f-87c2-de209a49be94@roeck-us.net>
References: <20250117100744.1571385-1-a0282524688@gmail.com>
 <20250117100744.1571385-2-a0282524688@gmail.com>
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250117100744.1571385-2-a0282524688@gmail.com>

On Fri, Jan 17, 2025 at 06:07:43PM +0800, Ming Yu wrote:
> NCT7716 is similar to NCT7717 but has one more address support,
> both of them only have a 8 bit resolution local thermal sensor.
> 
> NCT7718 has 11 bit resoulution remote thermal sensor.
> 
> Signed-off-by: Ming Yu <a0282524688@gmail.com>

Applied to hwmon-next.

Note that the branch will only be pushed to linux-next after the commit
window closed.

Thanks,
Guenter
