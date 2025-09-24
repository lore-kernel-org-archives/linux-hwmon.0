Received: from mail-pg1-f178.google.com (mail-pg1-f178.google.com [209.85.215.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 566332E9EA7
	for <linux-hwmon@vger.kernel.org>; Wed, 24 Sep 2025 16:00:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.178
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758729633; cv=none; b=hwf/WpwaDCfnc3gzBrmzL/jRlZ+32WsRubNcJWOn9KZ7lCg1eFCYn+63VtEI1fDiZLdZabkBSP2sXz6cPLYGt3k4F5oVMYbDZYj8QzYMvr3A8BLlG9Y7MKW9GVwmGRUvCxAuJUVBSw8npABQKc0VfN6VpwPXMUDzM4I2ppv5b7c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758729633; c=relaxed/simple;
	bh=vldrG3DCeNRjE0BlLdRWKYuZIHower+u3hHn+TSIV98=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=q7vZn8xG1Ny0fUXHyTu3K+3qIfV7zPsZVrhimqSzdGH8jrfrhVCsp52WGbGAz60qe5ygWYSVseHRXPlQjC4+oAksjcZ9/z1yO84B2Dep5nge4M8kxTbHLCUjbyXKyqC5qYTc/mkiEblrBfhKtPf/owOowvJ/AmvjWqephp4gTcE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Nl16a+GB; arc=none smtp.client-ip=209.85.215.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Nl16a+GB"
Received: by mail-pg1-f178.google.com with SMTP id 41be03b00d2f7-b551350adfaso5752139a12.3
        for <linux-hwmon@vger.kernel.org>; Wed, 24 Sep 2025 09:00:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1758729631; x=1759334431; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:sender:from:to:cc:subject:date:message-id
         :reply-to;
        bh=j/eQZQr/FlrHFqBmnzi43q5wN7esytT7U9mYDKA0Bws=;
        b=Nl16a+GBe5nIxrowTVguBXGovZeuinGypiJQadH8OBO97ToiNLq1OBnChf9Qi90X9v
         YyZsV/g7ELyU6ykAlJ0haVmY/rJ4nD7dUCKpH0D3fzT52ZwZPgvkRs8OH6v5kAtaGDg3
         iDvJXZ4zTblSptnt6quD8KRVJ9asjEUohc8PddZtnnM8KPdRYTbf381Et5aeA2m8PgxA
         b3aleB9ecDxJgDVPFKpIn4AsDced+fuuaIQZ20DtTXViTfhS+oHj9S5xUSCQsUleF7G5
         Ogrvm+++/htSJMFc+2xm8cz6DrnGXdDJaP+CI9KDiZftgVZi4o13c8WJx2tQ7/I+qTy6
         x70g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1758729631; x=1759334431;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:sender:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=j/eQZQr/FlrHFqBmnzi43q5wN7esytT7U9mYDKA0Bws=;
        b=tfIy9HJexF6MTR97SdUbWx/cVr6Y2EVjuLKl4ju3Gjw54ZE3GKGJQ1ADE6gyyuIAPm
         kK4EQUgWxHyKuyzWkHjc7I3R7wxDGVDltaFxfR7mVHexFf4nZtG97ytzFpFVMLCsi2Kw
         UWJzmbteJ80BpHqVjbC7/C6+xz7V4gM5N+iJ9gdtDvPsnqwcADSJ/w+wT2m43t2zfxRl
         Z5EBxzxw9fTZ9/S1dlJl1TGrj5F3fl/rRX74Vg7tuoVaPGZ1FAakR3fF1s11n6AmSL+b
         afPk/zNk3ymeF9873ScwD+hQ7od1XUXcfNDeXKdaIAu6XMoOLys0nQZIDkEBl0a7dNmB
         jZ5w==
X-Forwarded-Encrypted: i=1; AJvYcCUHLFUKjwxLMmctW3YmtSPgQEaWKpmTU57eQaVXcFy87k0iHxqhtG0UxDawKtXB6uN0XbexuFQLwIAGjg==@vger.kernel.org
X-Gm-Message-State: AOJu0YwSfYbsMvOl1m/RDunWoEBlpfFta7txRQQj6MqLjOafXPBHVQPt
	wzDvmE64bexjcHwFwG+BjWYozOeDzTz5QHL7iyhGAA9t3RHELfTp447a
X-Gm-Gg: ASbGncs+du+2ydmSGD8PvbBIFY/XJqh900urkP3AUsXftm5LRT2wsiXa7zo+iAWTuS6
	4mhOnCL5vrx1zPbKwU/zDAY/IFFhfjJxLt8HDTIpLnfICVKUZ+2/PHz3ZBEKJ82LI0rlu9HksE2
	hgpUovKWlo3xLKeN51sMdfUnRUzyK0yNkCo/EUZYIpVGe5VboL0Z97Cv4W/j4dwafktJRvfrcFq
	QFjPQfwB8ubzcf1UDjeKD/EkAxnkVRtsyVmX2zn+o7uyd1yGBBNFjU7aZiun3Lg3r9HslMm2xOP
	HRG2rB1lQ4XIlsfeMNaxo3XAA6gftK20woehR4xBTecrPCi3AQbr6wQydfXzscPouCSiyuzeO5s
	cZG6tDmKtrop1myr/ZsEFz1nHbzXH+V8b6DI=
X-Google-Smtp-Source: AGHT+IHh6nEKuJB+/U1aI4KfR/nSkf414wZmo0pvYnpISYF821fu02/TzRKwO0iL6xcTPglHzJx6Xw==
X-Received: by 2002:a17:903:1a6f:b0:272:f9c3:31fa with SMTP id d9443c01a7336-27ed49b8e31mr2949535ad.9.1758729629711;
        Wed, 24 Sep 2025 09:00:29 -0700 (PDT)
Received: from server.roeck-us.net ([2600:1700:e321:62f0:da43:aeff:fecc:bfd5])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-26980053201sm196264675ad.17.2025.09.24.09.00.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 24 Sep 2025 09:00:29 -0700 (PDT)
Sender: Guenter Roeck <groeck7@gmail.com>
Date: Wed, 24 Sep 2025 09:00:28 -0700
From: Guenter Roeck <linux@roeck-us.net>
To: Michael Walle <mwalle@kernel.org>
Cc: Nishanth Menon <nm@ti.com>, Vignesh Raghavendra <vigneshr@ti.com>,
	Tero Kristo <kristo@kernel.org>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Jean Delvare <jdelvare@suse.com>, Lee Jones <lee@kernel.org>,
	Srinivas Kandagatla <srini@kernel.org>,
	Wim Van Sebroeck <wim@linux-watchdog.org>,
	linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-hwmon@vger.kernel.org,
	linux-watchdog@vger.kernel.org, Andrew Davis <afd@ti.com>,
	Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Subject: Re: [PATCH v2 4/7] dt-bindings: hwmon: sl28cpld: add sa67mcu
 compatible
Message-ID: <bffc6119-8623-47a7-aa47-40ffeb6ec09a@roeck-us.net>
References: <20250912120745.2295115-1-mwalle@kernel.org>
 <20250912120745.2295115-5-mwalle@kernel.org>
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250912120745.2295115-5-mwalle@kernel.org>

On Fri, Sep 12, 2025 at 02:07:42PM +0200, Michael Walle wrote:
> The Kontron SMARC-sAM67 module features an on-board house keeping uC.
> It is designed to be compatible with the older sl28cpld implementation,
> but has different sensors, like voltage and temperature monitoring. Add
> a new compatible for that board.
> 
> Signed-off-by: Michael Walle <mwalle@kernel.org>
> Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

Applied.

Guenter
