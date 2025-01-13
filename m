Received: from mail-pl1-f179.google.com (mail-pl1-f179.google.com [209.85.214.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 918962297E1;
	Mon, 13 Jan 2025 16:58:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736787524; cv=none; b=BLTGmDx3p1AoGybTx56zSJVKkr4H+zJXdjFxuIm+fim9aqe8C1f9yIheR1LHGoCK/eRGcbUDmnD5dM1yPhRN2+iK602A8F1RgslImAb6M1oRRt9SLiPcPNcbWKlD3McHsiyTRL5y107xL4MXrrR6OMttwOqMAluySgbiWo9CnDo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736787524; c=relaxed/simple;
	bh=2NHEBuBW4BQ62Wpx9z5cBu5QF5aTYKc9Jnb8/mtTFfQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=X5E9wZsOi2WIbssLoBPafLDeWNPF93FmRVDPUOeIIb7CXpC+4JMNLwQ9opGE+O4H0FixYgnErVw9fbQfn0UpfHnF9Ki4gFrBIpgvnPHDa9FnXhpEmSoiOJziHVLmhcXpajLTslfs5G6/ds5WOHpJQHsvYtuFhmn2lTIEEBniZdA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=M20l+NbU; arc=none smtp.client-ip=209.85.214.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="M20l+NbU"
Received: by mail-pl1-f179.google.com with SMTP id d9443c01a7336-21619108a6bso78464355ad.3;
        Mon, 13 Jan 2025 08:58:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1736787522; x=1737392322; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:sender:from:to:cc:subject:date:message-id
         :reply-to;
        bh=wjRuKtNuNdUdZzdut7QyOQJyckleaTOnPl0mAN4klDU=;
        b=M20l+NbUMeOkWu769IImA4J/c9KppEQF2/xM61HSv5YgJHHLZ7WhZbSHwPzq8c8/mj
         NnII7vWrZybr3GTRJKEg0BpR5VUvtEUyzvvn/Uid1bxDCDrGVxXuYXi7u0QwQp5Vl+HA
         +NG/lxSBdsrpu46okau2gF7as4Fmqx1WggWcUeFcJsGQ+cftR9F2OQnz0V8bBg7LR4Db
         3iQ/Lyzi1GgUQDa9D4Kd6D19Vx/YMML2IRpPR5cQiwRc1HaP3pUQrXJhjxo43N+k9NNE
         X/40bDRQSLzOqLwWyh+oaW51i50XyA57M64dY19cOWNh5DZO6T5qcLcuMkJCee6UjuZu
         Z9dw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1736787522; x=1737392322;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:sender:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=wjRuKtNuNdUdZzdut7QyOQJyckleaTOnPl0mAN4klDU=;
        b=N4NMUosZIUqmYZEomlHRwKEgiFB9h326OsL1EiW0Hv34aNVPnZ5VbIcju7IvYcmPJy
         BlGAa22ufXt7AlG0vMMe5qr8/GVPeDWyphHsgXWm0qH1oZ2V4DnR+Ch9O9A3lAJt4uor
         6rW+8sCe/WK0p9SskWTBG/SxL7b97HEuObL1CSXhONXqmbb3Z9Sk5RluiEkb0AWrh8Po
         CW6m9l7elE1Zr0Am01YL5qnSIAzQDw81CaWcHx7Vx9l1GT3bUqGqsZnsVcaOqX+36Y3D
         rbqZp8ZMfiUs4PL7nEKWLOK42/IgFNsStk7tcmk93IQA3PUuGd1Ii6m7ei/0jdVIfuzR
         4cHg==
X-Forwarded-Encrypted: i=1; AJvYcCWH/Q9TXtCCu20ZE4zZP4LVXZ5GzF6CZP8GAh4lAAS2nF0uccg0WFa/5jPWeswRc4Ms8PAy7OCGxOXAag==@vger.kernel.org, AJvYcCXVegXQOlv9podw5MA9uBUYaxIMXAdqmIx1/cD0TLKTxcEN26pAeJ9izK3L7tkDAjS93M9dSl8Mfm3oHJqN@vger.kernel.org
X-Gm-Message-State: AOJu0YwSd3Tk8fDLRYzGETLXqzrW7jbt5IZHsohBxbKkP6bFIx0vt25L
	1+tH0AJrtumaOARDiFFM6oHjX9nuzzUVx9tnohT1II8oRqc9b6RV
X-Gm-Gg: ASbGncvrrStxGQ/fn+Pt7TWvL7twkf2CWk0eo8HFoQbYhMAA2n6Tu7ankXTHWa4/eYi
	0uPsHtUR5oqieKleuqjBq+atZ7XWHauRuAvXwVQ7AIbXHKabdsTj69zuOZmTxP5KiU1tGFq7oLq
	VuBJy0tPaYvX/q3SjkfVK6Af1IIT/+nERfUA9ec+HeI6zmSLgAGNH1NBbCfTdfOKoFRPs6LQFn/
	hTJOL3ab7jIB9UUodpizIjHmwjJe8GQ3SDoI+olx2n/LwV0+1n3TqK2s9+FwDmYmyEVhg==
X-Google-Smtp-Source: AGHT+IHCJUXEDb841TAQStTLzoySZuRvg2Gn5OrZUbfGQXpiB2lbXUs2ySpOoQn0SnUllSFx5Ayqcg==
X-Received: by 2002:a05:6a00:114e:b0:728:f337:a721 with SMTP id d2e1a72fcca58-72d21f29214mr29088406b3a.7.1736787521732;
        Mon, 13 Jan 2025 08:58:41 -0800 (PST)
Received: from server.roeck-us.net ([2600:1700:e321:62f0:da43:aeff:fecc:bfd5])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-72d4059485bsm5991816b3a.83.2025.01.13.08.58.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 13 Jan 2025 08:58:41 -0800 (PST)
Sender: Guenter Roeck <groeck7@gmail.com>
Date: Mon, 13 Jan 2025 08:58:40 -0800
From: Guenter Roeck <linux@roeck-us.net>
To: Denis Kirjanov <kirjanov@gmail.com>
Cc: robert.marko@sartura.hr, jdelvare@suse.com, linux-hwmon@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v4] hwmon: pmbus: dps920ab: Add ability to instantiate
 through i2c
Message-ID: <d7a2f3c9-9e91-48f9-8004-a8c774924eb7@roeck-us.net>
References: <20250113092846.10786-1-kirjanov@gmail.com>
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250113092846.10786-1-kirjanov@gmail.com>

On Mon, Jan 13, 2025 at 12:28:46PM +0300, Denis Kirjanov wrote:
> Add support for instantiating the Delta DPS920AB PSU
> through I2C on systems without devicetree support.
> 
> Signed-off-by: Denis Kirjanov <kirjanov@gmail.com>

Applied, after build testing.

> ---
> changelog:
> v2: add verbose description
> v3: conform to the canonical patch format
> v4: send the proper patch version

FWIW, this is not a useful change log.

Guenter
