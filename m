Received: from mail-wm1-f48.google.com (mail-wm1-f48.google.com [209.85.128.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D69383C8724
	for <linux-hwmon@vger.kernel.org>; Tue, 30 Jun 2026 16:49:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782838188; cv=none; b=Gk61G2KDx2p8Hd2Ldd/mDWQGXYIMRU0jev3ZbrcZzbdtfsepdwrlJGZwJ5a8MKSWIA27nwitDDFkCcOsbWkvMFyhqu732j6UCpDss4P18VEVI5N0e2sRrz7aNwfSTm+b/Mtn/cg8lxtI0n1JODATvHhvyZXCFZCB323Gl7rIcxE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782838188; c=relaxed/simple;
	bh=rtMdkV9IwEXLbkkLP094U8i8H2CiP0u09H3hvlPY6tA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=psEGMYN6587l6ETNdMF2PyeCKlDuxFL8e8IZlnIaPcRNpl6BsJGlUYvY2RXpKSTM/PUVA01yzck3GoIIlEFW/vqgaSf3W3XTFUP4j1qrLiTa8TVsqCyDfRo+rTbJuszzcIFTXtHgxFNa5xIIHtXGNW0ljqYoxZjSpGmoq6pV9OM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com; spf=pass smtp.mailfrom=baylibre.com; dkim=pass (2048-bit key) header.d=baylibre.com header.i=@baylibre.com header.b=l7vaE8A4; arc=none smtp.client-ip=209.85.128.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre.com header.i=@baylibre.com header.b="l7vaE8A4"
Received: by mail-wm1-f48.google.com with SMTP id 5b1f17b1804b1-4926f8e02e8so29290385e9.0
        for <linux-hwmon@vger.kernel.org>; Tue, 30 Jun 2026 09:49:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre.com; s=google; t=1782838185; x=1783442985; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=G4j65jgi9OyXPyz5lY7LXj8iIi4kSLf/fC5SZxsJGCg=;
        b=l7vaE8A4t/08NB6gf+bLCUyG2GWR6hcnl5qExBYXmGsf8u603WUNSjkWXfR+NRTKFz
         cv4yGXh8t2d/er2pvWzH8NB1jJZiOvqLGjmBZIRwBGzudqSNJqOibunxYH5GzMegXmVe
         b5FF+L9RhNLfM9SNUYwuuRx/avKjiLQPtozorW5yrnurbwqoUyN77QY7Zrws9YJf7z5p
         I1x3cIIf/Xab90c6u0i5GOgC+e5poLSgyncOvwY3Ufi+2GGkBuOqn6vsZ+/e057Ve2cZ
         useRmjpuM28xKeevQQ0Oy8QuwtBvjWEkAhQAgV3O/jacR3HuVu40bp2uFR1pt2KUOPyK
         xq6A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782838185; x=1783442985;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=G4j65jgi9OyXPyz5lY7LXj8iIi4kSLf/fC5SZxsJGCg=;
        b=OODMqN8JNTYrEaFQvD8b76XN74Pi7aL92DJclksgxuXHHLB+6DeqKqtPC/D0wYSlnh
         hvxhZgPkN9gMy1ii1PxRPFTvgWT8rgCo0kWnridIE8cPdf3OElo3CQvGOpnKTO/PZ4n8
         HH1kaoSSDzhG7wbmr0QsEshPT3+3Ehq1D+EN0Vu3UTZzMO3KKFm0jAV8+dIk9oficCzX
         1fyjO491nU3iodsLDxcGu4PFR5rtnBSPi01R94YwiAnC5OCma0ony+dcN2v/Vkh3RaYy
         eH7JKqImUwpp2KNyfdUW0I3qkaYAAwxP26F1n5gr4Ov7IGfUQFQrXhB+Q7grKg7a1IMt
         I0JA==
X-Forwarded-Encrypted: i=1; AFNElJ94HUzSOCAjma98pJXZrkIvsiB7mh4ZW7JOzWQ8stE3U+o+RP8ucg9F/uEv17nmgnb0pg+c7d4DM5vndg==@vger.kernel.org
X-Gm-Message-State: AOJu0YwQ4SqobhLDncOout7JuRmPsxE48LsH/9sqDNZcISLa3Cz3bEW8
	CnfXh3MfdeNZQFPSLMSIjH9dvXXd3Svx7e8tjk6YmO2G0CQTBuxm0EcdCtPApnmi7mw=
X-Gm-Gg: AfdE7ckKf5YqY6thv5fE4Sh84l3qXN8j9Lk3zm5qmRwnB0Cp/D626kbWkrzL9+TE49t
	eEg5nz+Fd0yaN4On1WfUXFEy1G7F7VDO5/LhV012DM+mjl+kdl3sOtUqH+W/Iq6Vx8VUDQqMI88
	tZjfnE1twD2TxWEtXFdDhhdtVMMyO31mHgH4g9LQyo6y/ICKjgquWjyscYVHHhVLvB72O7BTnc0
	3VFxYBxu/4F573fWD7oNNWyEQOxyZ++N6OiGDdeLLcNFpY08d1ekLvGYeKLHYP1OEJR+xj1J2ml
	4iktvuifiT2YMnldN+i1600cM2ehmitiv6PDt3o61H89v1tHzpuQMsNzH1MSxqGW1k6tHC4cSnS
	QjuBy4VGK1WVxeS4gWlRlpG+sbr1JpansBpZdeM0ck3P03aXcmdHqw5ZAkW2yonp5/HrgwbqZVl
	NOl7iwAnxTShVXAtw/hsfw7aH7+Bm1mR63f10XtLh3UGBT23LFQYLIHs1vaPavCZGdblzofUJ1Z
	/gW
X-Received: by 2002:a05:600c:c4a8:b0:493:b163:42e8 with SMTP id 5b1f17b1804b1-493bda6fdb5mr20931735e9.21.1782838185304;
        Tue, 30 Jun 2026 09:49:45 -0700 (PDT)
Received: from localhost (p200300f65f47db042a9b551def0a6b94.dip0.t-ipconnect.de. [2003:f6:5f47:db04:2a9b:551d:ef0a:6b94])
        by smtp.gmail.com with UTF8SMTPSA id ffacd0b85a97d-47563d19573sm8888485f8f.4.2026.06.30.09.49.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 30 Jun 2026 09:49:44 -0700 (PDT)
Date: Tue, 30 Jun 2026 18:49:43 +0200
From: Uwe =?utf-8?Q?Kleine-K=C3=B6nig?= <u.kleine-koenig@baylibre.com>
To: Selvamani.Rajagopal@onsemi.com
Cc: Guenter Roeck <linux@roeck-us.net>, Jonathan Corbet <corbet@lwn.net>, 
	Shuah Khan <skhan@linuxfoundation.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, linux-hwmon@vger.kernel.org, 
	linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org, devicetree@vger.kernel.org
Subject: Re: [PATCH 3/3] hwmon: (pmbus/fd5121): Add support FD5121, FD5123
 and FD5125
Message-ID: <akPy0zCESKoGgsF1@monoceros>
References: <20260622-support-fd5121-from-onsemi-v1-0-b31767689c65@onsemi.com>
 <20260622-support-fd5121-from-onsemi-v1-3-b31767689c65@onsemi.com>
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="u6m33inkfsihecrv"
Content-Disposition: inline
In-Reply-To: <20260622-support-fd5121-from-onsemi-v1-3-b31767689c65@onsemi.com>


--u6m33inkfsihecrv
Content-Type: text/plain; protected-headers=v1; charset=us-ascii
Content-Disposition: inline
Subject: Re: [PATCH 3/3] hwmon: (pmbus/fd5121): Add support FD5121, FD5123
 and FD5125
MIME-Version: 1.0

Hello,

On Mon, Jun 22, 2026 at 10:55:39PM -0700, Selvamani Rajagopal via B4 Relay wrote:
> +static const struct i2c_device_id fd5121_id[] = {
> +	{ "fd5121", chip_fd5121 },
> +	{ "fd5123", chip_fd5123 },
> +	{ "fd5125", chip_fd5125 },
> +	{ }
> +};
> +MODULE_DEVICE_TABLE(i2c, fd5121_id);

Please make this:

	static const struct i2c_device_id fd5121_id[] = {
		{ .name = "fd5121", .driver_data = chip_fd5121 },
		{ .name = "fd5123", .driver_data = chip_fd5123 },
		{ .name = "fd5125", .driver_data = chip_fd5125 },
		{ }
	};
	MODULE_DEVICE_TABLE(i2c, fd5121_id);

See e.g.
https://lore.kernel.org/lkml/20260515103150.164887-2-u.kleine-koenig@baylibre.com/
for the rationale.

Best regards
Uwe

--u6m33inkfsihecrv
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEP4GsaTp6HlmJrf7Tj4D7WH0S/k4FAmpD86MACgkQj4D7WH0S
/k5bLAf/c8DmOIdxOv/xejVDjCK5jLy3cR+Vqq+WWDgS3Rz3ZhpAEklzEkWMqJqh
kklRmY2QqyiXyqGXD0SUZCOWg7WDqimHZTemuz1jpyxGrjoL8BTjbonwh/RH2vhv
dTOKPu9R9QCpbNJZSBHPWs2ayh+eB1cwYFDWQD059rIaF7c+6CA/CwrXhCUt4nrH
K3UQjBiKdQjAiZCAqH4AuMbAFuyaxBKb0qpCR2p/UDSPLt4Y/ESPvtL91ujnRPIC
FANUpF+dJ+8clrwjrIRB15yCZecr72SV61k3oSjw2poBZge33gvyY0F6fzXyJejv
C0fYoQWddbxnvIKJlLT6Z3+Qh4NKLQ==
=Q4zi
-----END PGP SIGNATURE-----

--u6m33inkfsihecrv--
