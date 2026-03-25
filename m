Received: from mail-dy1-f176.google.com (mail-dy1-f176.google.com [74.125.82.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7461E3C9EFC
	for <linux-hwmon@vger.kernel.org>; Wed, 25 Mar 2026 14:21:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.82.176
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774448464; cv=none; b=gWUwcbWNHDVq+vJ6zt3mFiPCByj1IMPi+t6KHIGVY5nA1PQOopYuyySIop2JSlnL8nL/FOZ2evTFsz3K3NqahH6nlcHtlD0x+QNT0MR3eC1ixhzkXHGv9P8ncFNUSJiTntcxDElt9iQkpwDaLaHqKVOsj5Oz/AW4EHgAwiTSibE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774448464; c=relaxed/simple;
	bh=nyIevaqXhT3rwmENRdoKTBDLBj1F8IcBozyA4s/q8FA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=WchYGNgk6ZUnQphmEZjRNhZqL/vfnc/h7Lba3lh8+rYZRTt5S3kQcnXgYGI0I2rDBuXMfDyzxQNKLmx4+380GYTkRSlL6gf/yMUqHgJjvDzanoUjN321RFIHGdWYPJnxw3sg6MeOzYHMPSMdBdxEyvJChBdeTiJpx3Q9XBbcFzg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=acB6yhhg; arc=none smtp.client-ip=74.125.82.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="acB6yhhg"
Received: by mail-dy1-f176.google.com with SMTP id 5a478bee46e88-2bdcf5970cdso802120eec.0
        for <linux-hwmon@vger.kernel.org>; Wed, 25 Mar 2026 07:21:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1774448461; x=1775053261; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:sender:from:to:cc:subject:date:message-id
         :reply-to;
        bh=/S5mOriTguhW1xaEQeXyyeJMvod6MSEvAssopruD0u8=;
        b=acB6yhhgAJAwkzBErsun6FFDwRd0OT55HQ4LqThv7zpb9chNU8h3IOIm/fN86ElMDD
         5tNKIYGqiQ1aNzQ1BD0RNyN5E5kTLuwT1Li6LLqWNAhSUbwuwXIqkvXRmVJKfj+nrepP
         rrcqdpPpFyrkXCVRbo3OSspCs+PNo3rhpXqdIrC1LZFsDba7HIC7R8dEFPje4rmwaQtJ
         Ox/b1XMP6EZB0CUUic6PyeKUExGZSSlzSWzUoyyEOIV2waD4KrUq7BIka2vUnZ5Fps8Q
         KBk4KOQrtfLa/ZHFLHriEBi18zpBLq7ouY1+iUeXOjO0jr3/Nxc4BAtRHb+9beHgSlWd
         xiGw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774448461; x=1775053261;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:sender:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=/S5mOriTguhW1xaEQeXyyeJMvod6MSEvAssopruD0u8=;
        b=UQxmbM5m1xXrbwDFEqNmsEqOL+oSx1KcQ2cwG3c7HqWPZFsKqv4Kn+K0wef/Z5pgnM
         wFW33iounIY8aN39Z49TdFlgMKW1zNDXJwqooApMaH/IAEj0AQgopUf+Muk95jKz/4Tn
         M0Kcvmo3TZoumUqAeAQrdSyXC2UkUCIbwKEC3FBMhoMbi8XstjenQTrytHPgSVHMSwBc
         Vq1rYTJVS0mJ3zNvsIOXmNtpDemB5ZXayDTVTY918Hx7pH559d51HWhYPGsLIoWtmlVd
         76BOVtPEmGM7ctkFICdz4z0hTAsMqNcOma98PxeydkHLpaLs5IYOSG6DmP4JFJr8vbNH
         2q4Q==
X-Forwarded-Encrypted: i=1; AJvYcCWrHm7yQvE45URBiybdIgbOHdQARVY1O4DoCh8yuTwvFLhBuMuBBHT2Gsv9XH19Ls2jnOvn5u+XYUBqUg==@vger.kernel.org
X-Gm-Message-State: AOJu0YyynSnKLYb3PoAscrpzSIt+E2cTGDJ2kUrLlJLZuhuiEWtAkEGf
	HFWH2mTBj3i+6FuKp7mhizPXd3viYshKe3Qx83jvwgDdzLcewlIff5yB
X-Gm-Gg: ATEYQzw8iJfwdSI851FeuZQJcGhTIg8p6WR3ECQm/m/mcuxc/fuLl2pZlJFoQJc7ANf
	9QXAzMHN4SryMQ2Bc8ktQF4k6/OnIouln0qGyJmJvINBjeiShe2PdA9/42m96NvgyRt5TCc2ZeD
	XN+y52RtWdZhlTNnHA0BjlqJOe+30K9kS4rZz5YiPiSAr4vCvAH2OyuVajciHaQcfWLDHZz1kz4
	SCWTT2ItLzVlANHk8IFQ8VK7n9yZZaoHJSYhjJcEeMsnTGWLXEz8z8g1KD6ZlRnnar79sFRi/fm
	6zbcHkWoftK479NbJktvuJtTyVEiRpRt52Kk28EFGuJ6TzLv1HZts8GW9fYCzMAQ4nzXawUbnBB
	C/1e3ZQj6OowTk5WDoBYDssBGZwLnl3feayRZ3FcZbQ1qPStUZS1GNt9fNfA/oY7uRn6KZSi5Ks
	JxwLsg+pXVn/F3M0iO+M17qfHBozUR2tmM+/F5
X-Received: by 2002:a05:7300:371e:b0:2c0:b92d:267d with SMTP id 5a478bee46e88-2c14b46dc8emr3673818eec.2.1774448461293;
        Wed, 25 Mar 2026 07:21:01 -0700 (PDT)
Received: from server.roeck-us.net ([2600:1700:e321:62f0:da43:aeff:fecc:bfd5])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-2c10b2d01f7sm17923085eec.23.2026.03.25.07.21.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 25 Mar 2026 07:21:00 -0700 (PDT)
Sender: Guenter Roeck <groeck7@gmail.com>
Date: Wed, 25 Mar 2026 07:20:59 -0700
From: Guenter Roeck <linux@roeck-us.net>
To: Dawei Liu <dawei.liu.jy@renesas.com>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Jonathan Corbet <corbet@lwn.net>,
	Shuah Khan <skhan@linuxfoundation.org>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Magnus Damm <magnus.damm@gmail.com>,
	Grant Peltier <grant.peltier.jg@renesas.com>,
	Linda Xin <linda.xin.jg@renesas.com>,
	Tabrez Ahmed <tabreztalks@gmail.com>, linux-hwmon@vger.kernel.org,
	devicetree@vger.kernel.org, linux-doc@vger.kernel.org,
	linux-renesas-soc@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v5 2/2] hwmon: (pmbus/isl68137) Add support for Renesas
 RAA228942 and RAA228943
Message-ID: <4e5107a3-6fee-42a7-9911-3d50a3557241@roeck-us.net>
References: <20260325090208.857-1-dawei.liu.jy@renesas.com>
 <20260325090208.857-3-dawei.liu.jy@renesas.com>
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260325090208.857-3-dawei.liu.jy@renesas.com>

On Wed, Mar 25, 2026 at 05:02:08PM +0800, Dawei Liu wrote:
> Add I2C device IDs for Renesas RAA228942 and RAA228943.
> 
> At the Linux PMBus hwmon interface level currently supported by this
> driver, these devices are compatible with the existing 2-rail non-TC
> controllers, so devicetree will use fallback compatibles and no
> dedicated OF match entries are needed.
> 
> Signed-off-by: Dawei Liu <dawei.liu.jy@renesas.com>

Applied.

Sorry for the v4 noise. Upside of AI reviews is that it finds lots
of issues. Downside is that I now get flooded with lots of patch
revisions. Still, I very much appreciate and prefer to get both.

Thanks,
Guenter

> ---
>  Documentation/hwmon/isl68137.rst | 20 ++++++++++++++++++++
>  drivers/hwmon/pmbus/isl68137.c   |  2 ++
>  2 files changed, 22 insertions(+)
> 
> diff --git a/Documentation/hwmon/isl68137.rst b/Documentation/hwmon/isl68137.rst
> index e77f582c2..0ce20d091 100644
> --- a/Documentation/hwmon/isl68137.rst
> +++ b/Documentation/hwmon/isl68137.rst
> @@ -394,6 +394,26 @@ Supported chips:
>  
>        Provided by Renesas upon request and NDA
>  
> +  * Renesas RAA228942
> +
> +    Prefix: 'raa228942'
> +
> +    Addresses scanned: -
> +
> +    Datasheet:
> +
> +      Provided by Renesas upon request and NDA
> +
> +  * Renesas RAA228943
> +
> +    Prefix: 'raa228943'
> +
> +    Addresses scanned: -
> +
> +    Datasheet:
> +
> +      Provided by Renesas upon request and NDA
> +
>    * Renesas RAA229001
>  
>      Prefix: 'raa229001'
> diff --git a/drivers/hwmon/pmbus/isl68137.c b/drivers/hwmon/pmbus/isl68137.c
> index 3346afdf3..03c9adc0e 100644
> --- a/drivers/hwmon/pmbus/isl68137.c
> +++ b/drivers/hwmon/pmbus/isl68137.c
> @@ -432,6 +432,8 @@ static const struct i2c_device_id raa_dmpvr_id[] = {
>  	{"raa228228", raa_dmpvr2_2rail_nontc},
>  	{"raa228244", raa_dmpvr2_2rail_nontc},
>  	{"raa228246", raa_dmpvr2_2rail_nontc},
> +	{"raa228942", raa_dmpvr2_2rail_nontc},
> +	{"raa228943", raa_dmpvr2_2rail_nontc},
>  	{"raa229001", raa_dmpvr2_2rail},
>  	{"raa229004", raa_dmpvr2_2rail},
>  	{"raa229141", raa_dmpvr2_2rail_pmbus},
