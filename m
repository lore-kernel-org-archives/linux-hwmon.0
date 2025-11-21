Received: from mail-pl1-f179.google.com (mail-pl1-f179.google.com [209.85.214.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A511C2E54BD
	for <linux-hwmon@vger.kernel.org>; Fri, 21 Nov 2025 19:20:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763752845; cv=none; b=bi3ZrO2BqOEYu0Jm2nU6mt432CvOHcfa64jgxD2XeoWVAKKH+5COSq5PdW5PnQBr/K+KgxRHUUgsevRyobDc/SWAGiv6Mn+ATSHhzntO47fg1xwC4w2Qukgyli5y7tM0VZwbUFoTsymfvd3AoUZa3I2tFB6gn50fRGNZ26sm+Ek=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763752845; c=relaxed/simple;
	bh=Hvkhvcu/+r/uun+XiTRw/s97qI8wDafnAVnKcQvcEcY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ndelpjfneYX3Je5d7eiKRT06/Ab1p1JVjIdzrWW8VAgg6sj6MbAPuJe0i1fSSg1g7wPMnyO2uFfXUZajM1L5r1naBDT2gcBpvuTEy56Nlh17iNP6/PD8IXOSXJLpfkqMqUgbuBC0GPehCyAY6ALBxMlX9Uuf73dlGidG90Kh7pc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=jyfl8fLU; arc=none smtp.client-ip=209.85.214.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="jyfl8fLU"
Received: by mail-pl1-f179.google.com with SMTP id d9443c01a7336-298145fe27eso36370825ad.1
        for <linux-hwmon@vger.kernel.org>; Fri, 21 Nov 2025 11:20:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1763752843; x=1764357643; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:sender:from:to:cc:subject:date:message-id
         :reply-to;
        bh=DkiySot0JlTeM81NDSJaYwCGtmRwSko9cXTn9FLOklU=;
        b=jyfl8fLUAiD29ptwrihc7I0ieYGm59joV/PcbRo6xTPY+I/8ES9zVLOUlEHcwzUidj
         sct2xvppNuCMEceivQbeQ8jPoW+6WK1mBh4TLThkCohR9FZFzPjVLGJ/4S0WCUwW6Wo6
         aQlUnkDxvmtppsBbKi+x08AP+Xxli8UmlZn31O/V0/S3xo9ZYJLmp+vgT9KFhb5O/+Y5
         K121JeDtTGCgSUMVRCNHhpYco3YCpyOtqDXPlQFV3wTJSaDDUYPjvES9a4czZe2v8AdX
         Y+COMqchecydHs1tm15ag30CsKzAs61/oCephFsfZsnJZlqRszERp8ymtLj9buyImi1N
         LUCw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1763752843; x=1764357643;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:sender:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=DkiySot0JlTeM81NDSJaYwCGtmRwSko9cXTn9FLOklU=;
        b=CctRKZdTO2f8TaL+x4l/aGB89dNpl8sZizqykLGzzBDfEmPuBbz3c4f3aI3GZzRv0g
         3b939tqKSZ3lM8WpJ6VcDjiTlXg5ZseLD0op5M3xvHNkZbO05KhxhhHF8rZv+bRHQGUz
         IrPt8GPFKtIxEzcfl86w5VsqVN3Af2uc9jqe11hPA9peKidJs07sbfmEtX/QgNjmdZ6S
         BxTwTC3rnPgVlJKMPeLwZ78S+A8MH9cAuV6I+v7WWL9Z/dHn2r2rkD+X4qVVByGcia/L
         2ju6JPsBwQR6FoNND7d8KuhWpCvtBl3Ktsu2Nbot9DmyGFRTe76k0lJ1xKKsAGDKeB4Q
         vhNQ==
X-Forwarded-Encrypted: i=1; AJvYcCVz2JVc/c5VgU+NRkFjSGlyZFeinSUEyuCQhE9Adkm9n95WbFKKjOWiPOmppI9WKPdLA7HZaXZNKBLOlA==@vger.kernel.org
X-Gm-Message-State: AOJu0YyEL7/QH7E7jUst6XBAuZBqX/IoqTFa8YNeC1GuwzX0O4xHTKs2
	VmPVBNpw9rdMsZnKkgnWnsLMIUFYK+jP/ScfDvromuLvrCi6KSf+PYxP
X-Gm-Gg: ASbGncsFekFk/ifMyBOUI+lfI1yrlKzqXH5CSwd6xIFuPwYZ2ytVUqJ+hYY/ucL+ZVz
	NBhq7o3CvWXVohXsqqX/xh8Jpni66lx9s2FSYenVDJ/dy7vOyjvDH53qxIlXBBw2okb0sj4INvX
	N2RCDQ+ErCuirJB7/kDls/KydrHy6gi5hoXe5WmA/bpdnExGO60jtkcGoJl6eaSfJwXyABkQEpR
	2XoTPvPQgMYCq9fZbG+JaTx66aiFfsZ031xCGsZeepvY0zPxeTooxhn9VtSJ3PnTYSqAvToe5ll
	sFKexxwyVnTYj3pPqSE+mTuw2Ak6NzS7pXVOL+cBbAx1uNoi09Ruv7gXY8XRCV1O5L9mCSwxMoi
	UrKUD1YAQ+aKAi45WA01Xm7+ne66bi3J5w7QpXRMHzwrVcvy3r57FgJctLuu8u46uyXWw20AYq3
	9LyDlyyjHFwouBaQoJZHCWqFQ=
X-Google-Smtp-Source: AGHT+IFGSMhAaX0qmWupzfxH6SdMnBmmVUzXc6aFgY6Jd8H4M51kLSvwGWZdzl8zwzxLzIH4iUB1jQ==
X-Received: by 2002:a05:7022:793:b0:119:e56b:c746 with SMTP id a92af1059eb24-11c9d711aa6mr1429994c88.11.1763752842786;
        Fri, 21 Nov 2025 11:20:42 -0800 (PST)
Received: from server.roeck-us.net ([2600:1700:e321:62f0:da43:aeff:fecc:bfd5])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-11c93de6d5csm18602216c88.4.2025.11.21.11.20.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 21 Nov 2025 11:20:42 -0800 (PST)
Sender: Guenter Roeck <groeck7@gmail.com>
Date: Fri, 21 Nov 2025 11:20:41 -0800
From: Guenter Roeck <linux@roeck-us.net>
To: Billy Tsai <billy_tsai@aspeedtech.com>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Joel Stanley <joel@jms.id.au>,
	Andrew Jeffery <andrew@codeconstruct.com.au>,
	linux-hwmon@vger.kernel.org, devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org, linux-aspeed@lists.ozlabs.org,
	linux-kernel@vger.kernel.org, BMC-SW@aspeedtech.com
Subject: Re: [PATCH v3 1/2] dt-bindings: hwmon: Add AST2700 compatible
Message-ID: <d47e02aa-5cb3-4ae9-b2c8-896534f27404@roeck-us.net>
References: <20251120-upstream_pwm_tach-v3-0-eaa2f9b300a2@aspeedtech.com>
 <20251120-upstream_pwm_tach-v3-1-eaa2f9b300a2@aspeedtech.com>
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251120-upstream_pwm_tach-v3-1-eaa2f9b300a2@aspeedtech.com>

On Thu, Nov 20, 2025 at 07:12:31PM +0800, Billy Tsai wrote:
> Adds support for the AST2700 PWM/Tach controller by extending the
> compatible string enumeration in the device tree binding.
> 
> The AST2700 PWM/Tach hardware is compatible with the existing binding
> schema and requires no additional properties or modifications beyond
> the new compatible string.
> 
> Signed-off-by: Billy Tsai <billy_tsai@aspeedtech.com>
> Reviewed-by: Krzysztof Kozlowski <krzk@kernel.org>

Applied.

Thanks,
Guenter
