Received: from mail-pj1-f50.google.com (mail-pj1-f50.google.com [209.85.216.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7E7E215624D
	for <linux-hwmon@vger.kernel.org>; Thu, 25 Sep 2025 02:42:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758768174; cv=none; b=h22u2X29WlvE7Dz235wv9qvBWsfSBgjCWj1SoSP057Y7fbHoUivcVIhqags5XcefZC3aX+KYJC9ifrPpIKtQSY7YdjOwFqoGPhw67wTEIOwUCwCo5i5j9+RudmDnkFG5ECIl4y8aeNx9m1IQ3ktLjrLNdv80IFxR782z8GZ/ujI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758768174; c=relaxed/simple;
	bh=6ha9Kr3cHw1wO1FCl7TwD597fRof4tQ/XQ20AsKCc8w=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=tMXDZ9yJM7DHEMuTq7vibvvRt1Io/IXSCrOTyL8AehssaEgTwYQGlLzqZ4D4SIjAfJfHrrRbJPGqN1bDonKEx+9oH3XG0SMiJsTkShKMbWT7t3CtTtyJDBVZ1xpIE5JAzk7VK7opQcEcjupo21KcUwuhEsljAyax9vXz4jOhXx4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=JXtr+l4R; arc=none smtp.client-ip=209.85.216.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="JXtr+l4R"
Received: by mail-pj1-f50.google.com with SMTP id 98e67ed59e1d1-330b0bb4507so394520a91.3
        for <linux-hwmon@vger.kernel.org>; Wed, 24 Sep 2025 19:42:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1758768171; x=1759372971; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:sender:from:to:cc:subject:date:message-id
         :reply-to;
        bh=H2hXuCp7EQSu2VY5F9OuSum1bbz+fDfBhTmNsUc96kw=;
        b=JXtr+l4RpD9JpQLtHRsUf+3yPB/CAR7v1G3esQ24HZqo6FfF3JIyUtKQuVG4Y0eWcg
         OjpR9OyXwSsu3dSnKumU3fkeNDV9yKRAEQm7joxRqHhUKj5lMx0Qx6Rxhd1dzNXWDF5O
         wKZNpte2zmXZkJF5k+zKznjqD5mENwfp+uFhGvv/XusbmgVszwjhQe7mnJIzRjJKm5up
         lFN+5Z/AEUZd6SFgC0ERpmVrGMVgbwHJKujoW8LAtZ6QCkLbjabRUlneGx5tBuDuON1E
         zAeWSJ4jOqZLQEu+QIHPuMPUBLkmGuThxMEq5Z0X+qfGJbZzQ/ZHL6flbHG3lwaLCx4T
         lxqQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1758768171; x=1759372971;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:sender:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=H2hXuCp7EQSu2VY5F9OuSum1bbz+fDfBhTmNsUc96kw=;
        b=vprobOy064JMynkD2D8AWeH8mMqUxtO3F1oz/MRgcqHpU1CmT+E9Uk8tJ/fD1eZYoy
         ejAPT7JOgPCUVRc6MEpdNylvmiriaxqzke+z//eOQdyjsACTpzhwidUIhTdv/ajAzxj/
         noyyXp3zXzX6hzXVrSwx7hUM4N5MjnJ9mkqNLIt1hXbp/ajiR18DWajoKt1tqhaWYUE7
         8sAPPKUxjggQW+glCoizK77u62IWtg+CDShKcGPz6pYxL+TWTsFV8u/mRnVhn9uPw/Dr
         G3wVoplhBtPAcMEip8yX5t+XR/sy0ZbaJ5G/0H5znxbHVbKqLHzhU9BVtB7YXc3dXwt8
         zk7Q==
X-Forwarded-Encrypted: i=1; AJvYcCW/Y4veqCBnsLD/1VRNfpKqn8iOkxtB0yvCoXiqKtu3qidkpQYWvRhuCRb3OGF17NF+r0BjdFHu0DGt8w==@vger.kernel.org
X-Gm-Message-State: AOJu0Yy8IkZzcZUcIddqgH22U9f2d44gEJJ1E/lYhWmSLSWH9Tva1m/K
	tZn5odKkRVjgEvfwO29Ch1j9XsWcT9vqbczcdaw7uenz8bDhGsBrz713
X-Gm-Gg: ASbGncsNQ6qarTaaOmNplVBWUH7E7oS45vosjRy6tL2IVLtROcn2h6Tf0wjziUhJwmH
	l0WjBXqXCxj1IvcGjwIOFhX17RKm+uVDIgt9wSuK+/kWImxaUR4Mqztq3PkyLwmeMjtlY0VqbsG
	A+n47ol3mkUYFN190PvoljjC/LB4MZOuNJ/Sg+6OU3KasjMLp0fszOJFPFMpR/jDP7Ua9E96ejo
	ibtilq245YJ3iiBB9XEyMP0od4mkeoWFmKd98sAVzNASXfulQSNGEIBB1ALOT6hg7lncw1SDZe3
	9l+BfaC2dyGFiYLYG7qVGrTKdsKXlLuHoSRHCgHzeO+ZgpAC6x0eu7H8wJVLMlm7rTa/OYTPkmr
	f63hExr4GulAlwsTzBhZc39avX9Ed+QI4XqI=
X-Google-Smtp-Source: AGHT+IE0G2axEK95LZpQCj1blNLHLFhQYEdYLjR6DblWy6INXdm/D+7lSNoW57qRiV90T5B2V8ID1g==
X-Received: by 2002:a17:90b:380a:b0:32e:5d87:8abc with SMTP id 98e67ed59e1d1-3342a306014mr1784771a91.36.1758768170707;
        Wed, 24 Sep 2025 19:42:50 -0700 (PDT)
Received: from server.roeck-us.net ([2600:1700:e321:62f0:da43:aeff:fecc:bfd5])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-33471d711ecsm525656a91.4.2025.09.24.19.42.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 24 Sep 2025 19:42:50 -0700 (PDT)
Sender: Guenter Roeck <groeck7@gmail.com>
Date: Wed, 24 Sep 2025 19:42:49 -0700
From: Guenter Roeck <linux@roeck-us.net>
To: Stanimir Varbanov <svarbanov@suse.de>
Cc: linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-rpi-kernel@lists.infradead.org,
	Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>,
	linux-hwmon@vger.kernel.org, Jean Delvare <jdelvare@suse.com>,
	Rob Herring <robh@kernel.org>,
	Florian Fainelli <florian.fainelli@broadcom.com>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Andrew Lunn <andrew@lunn.ch>,
	Stefan Wahren <wahrenst@gmx.net>,
	Saenz Julienne <nsaenz@kernel.org>,
	Andrea della Porta <andrea.porta@suse.com>,
	Phil Elwell <phil@raspberrypi.com>,
	Jonathan Bell <jonathan@raspberrypi.com>,
	Dave Stevenson <dave.stevenson@raspberrypi.com>
Subject: Re: [PATCH 2/4] hwmon: adc: rp1: Add Raspberry Pi's RP1 ADC driver
Message-ID: <d07158fc-678e-4ae4-8943-168146a58fe0@roeck-us.net>
References: <20250925000416.2408457-1-svarbanov@suse.de>
 <20250925000416.2408457-3-svarbanov@suse.de>
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250925000416.2408457-3-svarbanov@suse.de>

On Thu, Sep 25, 2025 at 03:04:14AM +0300, Stanimir Varbanov wrote:
> A five-input successive-approximation analogue-to-digital converter
> with 12-bit (effective number of 9.5 bits) resolution at 500kSPS.
> The ADC has four external inputs and one internal temperature sensor.
> 
> Signed-off-by: Phil Elwell <phil@raspberrypi.com>
> Signed-off-by: Jonathan Bell <jonathan@raspberrypi.com>
> Signed-off-by: Stanimir Varbanov <svarbanov@suse.de>

I just realized that there is already a hwmon driver for
Rasperri Pi - drivers/hwmon/raspberrypi-hwmon.c.

Please add this code to that driver.

> ---
>  drivers/hwmon/Kconfig   |  10 ++
>  drivers/hwmon/Makefile  |   1 +
>  drivers/hwmon/rp1-adc.c | 301 ++++++++++++++++++++++++++++++++++++++++

Also, this needs documentation.

Thanks,
Guenter
