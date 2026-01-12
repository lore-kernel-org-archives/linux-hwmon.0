Received: from mail-dl1-f43.google.com (mail-dl1-f43.google.com [74.125.82.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8E04432E6BE
	for <linux-hwmon@vger.kernel.org>; Mon, 12 Jan 2026 21:22:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.82.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768252974; cv=none; b=Ihs8QtWajEDOJbh+zqodpClUZDHCEMUsZEnaQm50K1w+kEF1XZ+FbhQE/7V+FVUDB82qO3vy4UtW1xkoyaPEDjR4OyNSBrP1ufzfFJCtl18fkrSSuR5pVB9XyWVeRHPZKh38jOdNRxvjp5Tiu8I5QYdedV7yYnN6ao1Ykd+0xvs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768252974; c=relaxed/simple;
	bh=SLEvjwA0v6D39hPq+50TRtssqeMq4awCpJZi3c7I44A=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=CB4aazpWUinR4mcq9iYiehZpJeTRaw15sg9dXMgPsNQ48I7BulrZ/iWDO5HAN3RFMK9fY9RlleZIETP4h7PHfmVoQE3wW29M3GGpDV5JMveFSXF2ZZg8SAVQplrfNF8rADixT5JLgZlsjxmRVb85G4R8qmx0G0IYRsBAUMLS5qQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=cyM98zoO; arc=none smtp.client-ip=74.125.82.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="cyM98zoO"
Received: by mail-dl1-f43.google.com with SMTP id a92af1059eb24-11f3a10dcbbso6198351c88.1
        for <linux-hwmon@vger.kernel.org>; Mon, 12 Jan 2026 13:22:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1768252973; x=1768857773; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:sender:from:to:cc:subject:date:message-id
         :reply-to;
        bh=n4tyKJ7t8Ssout1SO1LxBrW7iFS0JcXtO41eSIIG4LU=;
        b=cyM98zoONL+HnLwB3GgpoS3ZRe+UE7K54WMvNyHE30dXGvanf8REJjsncxWAZ5BOO2
         y/MZ3/BqF3mA0iIifQlUBGbYeswDSDFQZxhMYWhT0EtA5XsdD+INY77/A8VJ58t+53ux
         e+9+nSmHPuuy5aPH0RfdMuCekNFBiEdUUxLxKZIrVJJlQWIynFOxbSvVioLsDkYLRVwk
         I5IpNaJzvj5LBTq3PdE8EzKRrzGOlEjIpi+joeZOMCZ2pkQPRJDHlj0oYi8d2Gb/5uod
         WAopSV9qLQhK1E46B/TZzmqf/ikz5MTa9Ig0ZqVMMfd8oDRhmWPc8deHEANZQETmFCUZ
         3OuA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768252973; x=1768857773;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:sender:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=n4tyKJ7t8Ssout1SO1LxBrW7iFS0JcXtO41eSIIG4LU=;
        b=LBytOSX1OuOdP40KFQX3HwJJEiDMH9a11OFrvYPPxGtOoRA220YoNqOZ0MBxv9d9/F
         1sl/TlnCc6VYHh3E2mNOUfkkMk2GgMthBj3VMOLOFW3DrWzgF7eLw30Rp10UyThVRh61
         H6XN3IbUD5S9pbEdk76jDMZYr6zsQ3anwkcPhd7jKgNI81H/b4uMNxWmQ6/CTfwANdfj
         j/eRglHD3IAqYZQvsRbdf+09UvawcvTAWnkSazQMY62nNSXb6eK5LhX5ZuZclEVzV1BQ
         So84HX9G4d7H40SjIL3eplPSlE/ouPZrDXBEiTkkt6J7RowItGuPkbCLam3pHU1baigv
         qf2g==
X-Forwarded-Encrypted: i=1; AJvYcCXnEqabGZFOfr6CTCYCBs4mTK7aVm+L32CDOF12PrfYmf0I1OEWyIpNl8HUKZ/+/cJFIxSfH7rR2nalGA==@vger.kernel.org
X-Gm-Message-State: AOJu0Yy6DN7PxM83nuNjinHCSbtSIlECl7PsFMy97d2n2VxUXiXsehxL
	UdW/QqNKll8fAIip7fk6y91FcJ6RaGte7wrw54GH+NHWwbjzekC5doleK9o1ow==
X-Gm-Gg: AY/fxX6GSoLa7zjSSsZiY9TqbanopToDPCnGLkEpFANsQ/fgyga4Kgq4QzkKCiqLjvZ
	TWHiBIJyCaP/GhNP5sQsxX3wmNK/L/yrmqIRA9wrbX2eDGtLARitCSfKEMpiSHi+6ZWbUeSnaGm
	LugkGIrOJ+MAA4XwctcOtRaQfppK1UmwPSEuaz0P61p3tTlMTTtLRypZ1u/+p7fJgwdEy2oTlot
	vwgiALs959HxHHwfMM6AllL/JAuNdGjM9+hoh/tmElH4qqr8yZIeYFDxLPI/8YgbTGJQYfNX4BC
	oDWQ8x1ms9JShfzDxJaifvnolCLPL1bVUzFSKgQxIW33aE+FRRjsZ9PJDe473k3qWTQGGlvNqum
	Ajy+BJFszJp7IA/Vcyii6S1t/0zSb3Wln+dkro4ooM+Q/EYRsNnHFmNC2cnzMH/64C1SjtdTxzp
	HPbbJklm+u/fxFN0kVm1b6Nrtu
X-Google-Smtp-Source: AGHT+IEtYKEZDF4EvmVMBEyFcMsr8Ckd2pQVxXbAxBQDQW6vxXv6P4xe0DxLFLRr6ae8YzAlnw40PA==
X-Received: by 2002:a05:7022:b82:b0:11f:1500:4e9a with SMTP id a92af1059eb24-121f8b7b07dmr19140123c88.32.1768252972533;
        Mon, 12 Jan 2026 13:22:52 -0800 (PST)
Received: from server.roeck-us.net ([2600:1700:e321:62f0:da43:aeff:fecc:bfd5])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-2b1707b0b2bsm16277287eec.23.2026.01.12.13.22.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 12 Jan 2026 13:22:52 -0800 (PST)
Sender: Guenter Roeck <groeck7@gmail.com>
Date: Mon, 12 Jan 2026 13:22:51 -0800
From: Guenter Roeck <linux@roeck-us.net>
To: Eugene Shalygin <eugene.shalygin@gmail.com>
Cc: Jai Kith <kithfx@gmail.com>, linux-hwmon@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] hwmon: (asus-ec-sensors) add VRM temperature for Pro WS
 WRX90E-SAGE SE
Message-ID: <8bcdb130-c41e-49d0-9269-023d2683d5bf@roeck-us.net>
References: <20260103085740.10644-1-eugene.shalygin@gmail.com>
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260103085740.10644-1-eugene.shalygin@gmail.com>

On Sat, Jan 03, 2026 at 09:57:31AM +0100, Eugene Shalygin wrote:
> From: Jai Kith <kithfx@gmail.com>
> 
> Add VRM_E (0x33) and VRM_W (0x34) temperature sensor definitions to
> sensors_family_amd_wrx_90 and enable them in the board config.
> 
> Signed-off-by: Jai Kith <kithfx@gmail.com>
> Signed-off-by: Eugene Shalygin <eugene.shalygin@gmail.com>

Applied.

Thanks,
Guenter
