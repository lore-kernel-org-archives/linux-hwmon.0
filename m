Received: from mail-pj1-f48.google.com (mail-pj1-f48.google.com [209.85.216.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9819A3033E6
	for <linux-hwmon@vger.kernel.org>; Fri, 11 Sep 2026 00:59:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789088361; cv=none; b=BxmiwQf4/W28CUb5clr80/nJA7S2uRipNpOlZ/Iwmbfcjmyz2iTVUGjHuFv07FmQ2tBaAKbIdwEsfJxjEyp+SQfdjbbMHpKQfjSZ5KmibhTZmwCgbt8V5bVsyCEW3CtuZIjC2iLmNnHOSKaTeqbcoA0m9ukGoGvCN5g8X2dRiTo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789088361; c=relaxed/simple;
	bh=f20/Wp53I23RUgSZbD0zd9wcyR6oR/u/gbGILrJIOzg=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=PzSoGUVQYdtgtPFIPU4YO+ZYRqjtONX3c2yk4ElfFyCOnruvZfTMIlW36/455Q5FpKkoMC6KzkcfoqxjNd/S/+kKc+x+f8LSWqS2syu27FqAw733kubsETU+hZ09Y2UbD8ErukhOKl3nVb4Fu+3FWpNJNyP3eYbFd2b6A9gLHkc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=O/69KGqe; arc=none smtp.client-ip=209.85.216.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="O/69KGqe"
Received: by mail-pj1-f48.google.com with SMTP id 98e67ed59e1d1-395cf2535acso418626a91.1
        for <linux-hwmon@vger.kernel.org>; Thu, 10 Sep 2026 17:59:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789088360; x=1789693160; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:sender:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=8EyNvUnz5y9qbGWShndnd8dmFCrD0SS+V+jXtGjVwwk=;
        b=O/69KGqeWPWhpsxgqndVAETP16ReDDr9n2FJXXxlcuzNUjN1zSi5AxUtNU2pF3N+kk
         toMNTRHvjtGyBWqKjm3Jbu1KdeTmT+yMnBjQRLsA1B4aoqms1Imuai7dpHfHQ2u/kTE8
         QTHS0KlRD4/9MilUGU9ynn4uBqXPrnvlsxm7vHY/hk58HRMQtUeqcv29X0yd4ZyffihR
         rKkOFR0xPfzCXfiySzqXxh/b0LPjqcArLczkFYpvaKu5QCzLzu/tFMDCrI2TLkG2hx3P
         epunIR48Lw7Y0RPQBJP8JUr2UyPUt1suC1t3aKF3OFdyyfpSSKxhaV8JcTxKbz9FaXIG
         Y41Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789088360; x=1789693160;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:sender:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=8EyNvUnz5y9qbGWShndnd8dmFCrD0SS+V+jXtGjVwwk=;
        b=YbrNZ6Nmjv8XcO9JRYqpbbCEZO4/oV6sEFOFAEkVbnqUChTn7lnDaH9AvZXCwWEVOo
         Qoi1A9gw0k0OBoEKbo3rP805G5JsIgMLsJ+I5LjCpdNUQHVJ9MxIIoy8PAbSIM3yK94y
         vYApeWcdP/oJB7s7GARj7TctHCOd+tCqhLD9X4XtPnZWAf3BylCgbJwGcDfShzT9ceou
         R/cKjGmAGt94/dxlGcGeaL0kwm3DJNf5bq2sSi4ZLRpeea3ymNfaulinMOcBpi8wXBAi
         NFHrUfIj5IJehWBYht2D3deJQGcxO2R9pJKTzKTh7NhxgyEjwzK0JqZkg4Kj7YY0JDU7
         EcFA==
X-Forwarded-Encrypted: i=1; AKwUvBzCThR9uuFQbAfMdimlpTzL+eYr7QrHjK1n9qposLwEsqW/EvxIKODQ6xtvK90xQdCBF7KVzS4RqITCqw==@vger.kernel.org
X-Gm-Message-State: AFuF++nieHY3/heV10//rxyM9L+wvo3f2zl/4NKUXe+n70oHqatUnNek
	vp1U1XO5+HXp7CJbBcfsmlSKW+Nufx1l1JywugqttmEDfqkjOC/RoybW
X-Gm-Gg: AYBFou2cpjnb6nbnm8sNGSvkH4eiMU7LtqWnlFXVzMM+umecAxM3stpe7N89TdUEMPA
	VgOrNJPv9+tr37R+p1Yj70mRN3T7dN2C91XTFfSzbv3c/B4i/MklvKVZzlo8DCWYalIH8VhWh5b
	LelXonam7xSgUIYdVxLbRgJZLG4M0JpwPIaVg5G1VXZMZqWVkcCxcQbcj0beJlAeOyXdodb+tVS
	phsJCu4M8ivPQ2W+pKsIGJ4ml3RlP2Je+T2ONAfcoFzTXpIcaA+Oeho41Un+RnsptJ1bCXm9GKu
	c5Jr72tmRuXI/6SkFQc4dkgXqyXC/3TmKIS+CVaYWeT/7lowMXHuGY1gcPLexAvAVF3qD2ML34f
	BI44dYcqU/NbxeqyY5jCsSITUtAS0h+1sMnaUMDSvoV0Wo+iTBIkOz+1EjLYgpxea7kmDyQOWkQ
	d0+Q13rkltvnGNefYEQ3OxyAVwMwvchZWo5CdFmdQ7MO1DHLAIL01GXffcTHCbA1ZAsEAsRNEez
	7K7ETPvWz2A
X-Received: by 2002:a17:90b:3c4f:b0:38f:cab0:9aa9 with SMTP id 98e67ed59e1d1-39d779b7e27mr10350968a91.13.1789088359785;
        Thu, 10 Sep 2026 17:59:19 -0700 (PDT)
Received: from server.roeck-us.net ([2600:1700:e321:62f0:da43:aeff:fecc:bfd5])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-33ba4e4fb3esm1670277eec.7.2026.09.10.17.59.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 10 Sep 2026 17:59:19 -0700 (PDT)
Sender: Guenter Roeck <groeck7@gmail.com>
Date: Thu, 10 Sep 2026 17:59:18 -0700
From: Guenter Roeck <linux@roeck-us.net>
To: "Thomas Richard (congatec GmbH)" <thomas.richard@bootlin.com>
Cc: Jonathan Corbet <corbet@lwn.net>,
	Shuah Khan <skhan@linuxfoundation.org>,
	Randy Dunlap <rdunlap@infradead.org>,
	Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
	Werner Gartner <Werner.Gartner@congatec.com>,
	linux-hwmon@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-doc@vger.kernel.org, stable@kernel.org
Subject: Re: [PATCH 2/2] hwmon: (cgbc-hwmon): Add some temperature sensors
Message-ID: <43a4ec2e-1303-48e2-82f4-76af3f6a910d@roeck-us.net>
References: <20260910-cgbc-hwmon-fix-and-new-sensors-v1-0-ef13ae2fa147@bootlin.com>
 <20260910-cgbc-hwmon-fix-and-new-sensors-v1-2-ef13ae2fa147@bootlin.com>
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260910-cgbc-hwmon-fix-and-new-sensors-v1-2-ef13ae2fa147@bootlin.com>

On Thu, Sep 10, 2026 at 03:28:22PM +0200, Thomas Richard (congatec GmbH) wrote:
> Add the following temperature sensors:
> - Alternate Board Temperature (temp11_input)
> - Top DIMM 1-7 temperature (temp12_input to temp18_input)
> - Bottom DIMM 1 temperature (temp19_input)
> 
> This fixes the following warning on conga-SA7:
> 
>   Board Controller returned an unknown sensor (bc_type=1, bc_id=11), ignore it
> 
> Also update existing labels to match Congatec documentation.
> 
> Cc: stable@kernel.org
> Fixes: 08ebc9def79f ("hwmon: Add Congatec Board Controller monitoring driver")
> Signed-off-by: Thomas Richard (congatec GmbH) <thomas.richard@bootlin.com>

Applied.

Thanks,
Guenter
