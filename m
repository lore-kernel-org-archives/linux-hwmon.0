Received: from mail-dl1-f44.google.com (mail-dl1-f44.google.com [74.125.82.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 547C3298CAB
	for <linux-hwmon@vger.kernel.org>; Thu,  5 Feb 2026 16:58:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.82.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770310720; cv=none; b=AUMZquvv5xHO3WOH+1I+hQ8tK+P+HAiYQ2ML4lN4DPf+o+zs6m9nff/mGC+SK4JtED4Rcasjbw5AhVUN7CS8DJcSfcaG2uGuigk1aHcjDQ7OIP03nGPWxvn47dOqtove37Ygqkm3uWzbFVXWkcY/J1g4fQbDa/xZp2hpUqISEiA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770310720; c=relaxed/simple;
	bh=9T36liE3vZeu4Kv34os7tzR0zDi/0YMbTrV01HUXDok=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=stZZP5dCVi3tkwuB9lFXhZAg668Mn6Geoa5XeTGIdoQ+WixuWAQrv6/KFuM4iDnp17Rk3u4zzFBe9dmnMRCd/ahDKfuc6VnNN5Uj5/E5Cb6jSD7WYN1j5FLm0ZNxSE0BJMM354FmlhliUBA9JzG6x7ZTsc4F6epZuLoYthuW/OM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=nAjG+cM5; arc=none smtp.client-ip=74.125.82.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="nAjG+cM5"
Received: by mail-dl1-f44.google.com with SMTP id a92af1059eb24-12339e2e2c1so692784c88.1
        for <linux-hwmon@vger.kernel.org>; Thu, 05 Feb 2026 08:58:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1770310719; x=1770915519; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:sender:from:to:cc:subject:date:message-id
         :reply-to;
        bh=2ExBShuvUs79IPImbMG3qy+Lfwt67zT0KnoLfQrrB88=;
        b=nAjG+cM5oJhAfhWkd3Y5eaIjDUgcn8wUNFfrsHLo7qf0lH8o0Le/eZHlR4kRCGLx34
         0PuSl7OaxD/6sgeAb4xqn/uNZ0H9CAxX6TVlYYu5v3EPOupKHPf9t4qxLAs9x+MxWePP
         CAGUDrc5nnQKwHZZ+tWy7brhJt6FNdLTxN6qSUD1ORAbWocYj8rys/laAW3zpG6t1hVC
         en/ygSyuxI8pjbitGacHup0XmekXd/twUqdgzS8a8G4nia46pK7/EtgpT5ppsDP4wIQh
         RX/Nv5u3EVX1YxTJkB72Y4SvFh1Rzv4dUHl5ddmiBJReqZTbpwmXNJ7Kg7343HELhMJa
         jLHQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770310719; x=1770915519;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:sender:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=2ExBShuvUs79IPImbMG3qy+Lfwt67zT0KnoLfQrrB88=;
        b=PT6h456LqMCL65SNgTJ1m+rf8FKl6zIEGT3WlhgBeAo6OvcLOI7TVK6AIA1X1VBlmo
         vRiPDLFvg4UBovltpz2IBHRhBa2AWNvKeJJoL9rHVF2+FKG2xp6NBa5/kPuIyJG0OiuE
         SFmjJTuvP8yzdNFiN/GQteEWg7u0c9ut6qFhASCU0fjAyXLoVwy8yuAfshFnOfp8y9pl
         pZsEmWVpz0PNZWjSpf5S9uXjk4CA3Uo3xCfA1lOfbZmxGVSgCK/sF4Juxpe0jKqM/ic4
         O3y+41eiTny7+ZNNXvDjm1BXotAbzN3g8hZeyc79+y+1URelKwlFVvyOWkIxcUFu1lHM
         6Hug==
X-Forwarded-Encrypted: i=1; AJvYcCW27ukjHQq7Re3x7m4QjgQX2XDCUbvPOXHIMCN7a8izFrWofVDzh9N6M308GABRx3+OdalrN8xsOlEttw==@vger.kernel.org
X-Gm-Message-State: AOJu0Ywr09YzXBmIBnVCJuuZYZ94beLLQ+SmnmSRx0Yg8DcUOSHgUZCD
	/cWza8iwKvD2uAx9MsoDze/0tjIRcn2dvBvRKv/O6YBFA1+44y/3w+6i
X-Gm-Gg: AZuq6aLMk1fuWIZ8pxNcAlUg2ikel60DwwjGoFZ3eerwRGJCg1xVEFUnBhtu2AwrO9+
	HvPkdJ28nqipP5wD7FHtcLPsxI2+lGXqmhZB9VquTfDmLCAdkB1oHe+Qostw2u+4rH6nSNHxgxV
	0jtgp21YWN38NMgtfHZSEU9yf/r+Q28NttIKDsPtoWagu+lfgT+xsIlabGWfa7m74bLUmOr+pth
	1SpeZVdJxOQsCPS6s1Lmt5Xe5a34CDM2HJnI+/DuGIOfi4Z7fPzd4EtiHGHvC0OovcK2ly0GX1V
	hQPp9shMPVAkIDC5M0mWPqlQgL4Whry1pw2rLIXjsISr3TMOma+7QfIKT9faCiFEAaPGwLaffel
	Tn1wOwhxE3CKg7xIrRUU3BCEskSce4p2cPT6bhDHaxDyaT3At4yvqDGc7lA5+XwcyjWVt6LNgMC
	eEgccOhiXmh/+WgleKwUgYl2p/
X-Received: by 2002:a05:7022:2491:b0:119:e569:f86c with SMTP id a92af1059eb24-126fc2cea3cmr1708334c88.9.1770310719421;
        Thu, 05 Feb 2026 08:58:39 -0800 (PST)
Received: from server.roeck-us.net ([2600:1700:e321:62f0:da43:aeff:fecc:bfd5])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-2b832e4d18fsm3449639eec.13.2026.02.05.08.58.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 05 Feb 2026 08:58:38 -0800 (PST)
Sender: Guenter Roeck <groeck7@gmail.com>
Date: Thu, 5 Feb 2026 08:58:37 -0800
From: Guenter Roeck <linux@roeck-us.net>
To: carl.lee@amd.com
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Charles Hsu <ythsu0511@gmail.com>, linux-hwmon@vger.kernel.org,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	peter.shen@amd.com, colin.huang2@amd.com
Subject: Re: [PATCH v2 3/3] hwmon: pmbus: mpq8785: force direct mode for VID
 VOUT on MPQ8785/MPQ8786
Message-ID: <07c39c3e-f82d-4ec0-b7fc-6ca9721d246d@roeck-us.net>
References: <20260205-dt-bindings-hwmon-pmbus-mpq8785-add-mpq8786-support-v2-0-3744cd9b2850@amd.com>
 <20260205-dt-bindings-hwmon-pmbus-mpq8785-add-mpq8786-support-v2-3-3744cd9b2850@amd.com>
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260205-dt-bindings-hwmon-pmbus-mpq8785-add-mpq8786-support-v2-3-3744cd9b2850@amd.com>

On Thu, Feb 05, 2026 at 06:01:39PM +0800, Carl Lee via B4 Relay wrote:
> From: Carl Lee <carl.lee@amd.com>
> 
> According to MPQ8785/MPQ8786 datasheet, VID mode configuration is
> the same as direct mode configuration. Therefore, when VOUT is
> reported in VID mode, it must be forced to use direct format.
> 

Why "must" ? Yes, the LSB is the same, at least for MPQ8785,
but that doesn't mean that the mode _must_ be overwritten. Maybe
I am missing it, but as far as I can see the datasheet doesn't
say that the VID mode configuration is the same as direct mode
configuration. It says that the _LSB_ is the same for both modes.

I _think_ the problem may be that the output voltages are not really
reported as VID values but as raw voltages, but the datasheet is a bit
vague in that regard. It talks about LSB values but doesn't exactly
say how voltages are reported, and for READ_VIN it is most definitely
wrong ("This bit is in VID mode with 25mv/LSB" doesn't make any sense).

Thanks,
Guenter

> Signed-off-by: Carl Lee <carl.lee@amd.com>
> ---
>  drivers/hwmon/pmbus/mpq8785.c | 20 ++++++++++++++++++++
>  1 file changed, 20 insertions(+)
> 
> diff --git a/drivers/hwmon/pmbus/mpq8785.c b/drivers/hwmon/pmbus/mpq8785.c
> index f35534836cb8..d6624af076c3 100644
> --- a/drivers/hwmon/pmbus/mpq8785.c
> +++ b/drivers/hwmon/pmbus/mpq8785.c
> @@ -48,6 +48,25 @@ static int mpq8785_identify(struct i2c_client *client,
>  	return 0;
>  };
>  
> +static int mpq8785_read_byte_data(struct i2c_client *client, int page, int reg)
> +{
> +	int ret;
> +
> +	switch (reg) {
> +	case PMBUS_VOUT_MODE:
> +		ret = pmbus_read_byte_data(client, page, reg);
> +		if (ret < 0)
> +			return ret;
> +
> +		if ((ret >> 5) == 1)
> +			return PB_VOUT_MODE_DIRECT;
> +	default:
> +		return -ENODATA;
> +	}
> +
> +	return ret;
> +}
> +
>  static int mpm82504_read_word_data(struct i2c_client *client, int page,
>  				   int phase, int reg)
>  {
> @@ -133,6 +152,7 @@ static int mpq8785_probe(struct i2c_client *client)
>  	case mpq8785:
>  	case mpq8786:
>  		info->identify = mpq8785_identify;
> +		info->read_byte_data = mpq8785_read_byte_data;
>  		break;
>  	default:
>  		return -ENODEV;
> 
> -- 
> 2.34.1
> 
> 
