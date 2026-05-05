Received: from mail-dl1-f50.google.com (mail-dl1-f50.google.com [74.125.82.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 40F2242DFFE
	for <linux-hwmon@vger.kernel.org>; Tue,  5 May 2026 13:25:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.82.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777987511; cv=none; b=ivn5hr5S1EA6pRnQzArbvWyn9p1D4NffIM2/s64iaPq+KozxmfFnOwu/rVD9NAXQroxc2FFrX/OmbxGSAgdh5Qjl9JkOiIZZZkExz3Y869o7mfrO2erI7D8YEnBAoKxWiArRr7bjgKdxEBZ1yEbMncC26vguRYihIYygdNe+3D0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777987511; c=relaxed/simple;
	bh=9jE5BAElNnScnCYcMXYk7RtpDdhMQf5dQC7MoKiMH+8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=G6DXIJFHsJKNQvRzQX4K+QitEkjs16Wnj38hgUWyA+ROs55gVYr5htrbtk1pac0WTm5mHl6uLINjc+Tny/RfnSi5u1iWDPHbCKMQ2ZIla5jh+i1XWZL0JPqKKXL0C0OpLh91/VNJq3+Cu5yJcBQU2Zh3x0bH2WfT9KnFcFhtChk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=cHdp8tDr; arc=none smtp.client-ip=74.125.82.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="cHdp8tDr"
Received: by mail-dl1-f50.google.com with SMTP id a92af1059eb24-12c8ccc7755so7398747c88.0
        for <linux-hwmon@vger.kernel.org>; Tue, 05 May 2026 06:25:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1777987508; x=1778592308; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:sender:from:to:cc:subject:date:message-id
         :reply-to;
        bh=QlKqL2HtAcItt2I5xifrJGPjZhKvbb1ZobgqAWPrJ9Q=;
        b=cHdp8tDrUv7F3QAAdyaFLgi5kKaP5GVojtomOovxh8KmeoJ9jQwik0ayqQG5YrMJ3M
         ad6Gt8FAHD0qGGYL+t8A4YTEO1ZPSMSaXp2KXnyvPqCu05y2FJb4IPeW/HskwL8395be
         xEOMN2lD4fU4KnztRGuESWsjTjM8uZDnrsONDfJoY9OI2eSEDXoHHhGwlEEFoT74zuxo
         Jm7Tybi3kHdi8z5sggETjqfJcvGk3kijX4CXzsAlLo9Vm8+vwrABMSVOrulaJq0sZM97
         5OjZONEM4oXuIBG+6UPVUgcDwsOebBvLjVuk00i2FGJa80rn7vROKIk8tC3aMSDL2sGY
         6pOw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777987508; x=1778592308;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:sender:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=QlKqL2HtAcItt2I5xifrJGPjZhKvbb1ZobgqAWPrJ9Q=;
        b=epCUg/srepnpuK/aSJtGORNdxhYk6KXGhURGF0PYMC5JubAl9GdFyFJ7SmcLjgHuop
         iLdw0F7lQEM6VuTt3Iw9REwgQHgRupNjhMNi9bYdi8FN6CXvaNp4aqzjjuPYE1z3uB1T
         1NZkNhMIkUKBIwBZXx5hfpHdaRcQCo4nXUnBAIDdLSu2Yz8bQ/5S84R78ZpS/RXjbaga
         w/E1tskjfajlSThQt/lXho4CGh9Qug6m645b9L8S0UTjt5+IDQ35L4QMKTMriehn0fRo
         QDxcB7l61tBj+1Zs35VENFlgm1UjCnIqqCLH2VGE007ymxZs87a1HSdNEo6kaEfLNV6k
         a/ow==
X-Forwarded-Encrypted: i=1; AFNElJ/8XV9OIXLsLd8pYocw6oso+PxCQ6UlU1x7hvzyhWB2KiV/lDxm5KlxKBAZEX3TUN775UZy8ReJCKrgCA==@vger.kernel.org
X-Gm-Message-State: AOJu0Yye4s8ZruJ57KdhHi/39m2kjG3wAoMuIH9dfdnq7QAxb41Ol3Mx
	uQOaSiv3TP53k1Fd4Oab68STYYdQCXBBeC6e5Z+x3xX9pU2OSTHY79PX
X-Gm-Gg: AeBDiesTeIgqwh2ppJAdmhKrWQE2zKRhim80hpQLRc8ilK7w/1w5h2VhF5S+HfdG4TB
	lmACgJHLhVLn0iMyqyoic9nBWIWFbM43lN/gWjix+0088Ec2FzpGTCva/QHmfUQXVGMNC4jNC5U
	fH1MMDRbARjmLMD5RXcJ/y8GI+z4wZXSfnz2wk+Ja3Xi48JfW1qfeStyFGZml18MKDQsdbH0k9y
	8UmbaOlfM8hPzwhJ4wWKtZTBwakhvZp36Bxy4Zpis8KB3BdKMlS05F/MoLK5gAml6uEePq+CLP8
	+TxBT1xAF8ve09ely+gBiJjEitMjZn9/pJ4xG8kGSUCgLiKXXj+ZuE4FETAaA5I2dvfZ1lJzmey
	cGX8Ux/jaIRBokN2tHlU1uhphFyTskXYk8a91O/YIT/qBxm9bnKhe65scpEyyXcGzRs/CYb4K+a
	EJPYlFe3g4CFk0rIVnd0GcDM2FkHp+XN7RqT6W1QgpcvWGPeU=
X-Received: by 2002:a05:7022:f8a:b0:12b:ee92:a60e with SMTP id a92af1059eb24-12dfd7ae956mr6378632c88.8.1777987507851;
        Tue, 05 May 2026 06:25:07 -0700 (PDT)
Received: from server.roeck-us.net ([2600:1700:e321:62f0:da43:aeff:fecc:bfd5])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-12df84252c0sm23316498c88.10.2026.05.05.06.25.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 05 May 2026 06:25:07 -0700 (PDT)
Sender: Guenter Roeck <groeck7@gmail.com>
Date: Tue, 5 May 2026 06:25:06 -0700
From: Guenter Roeck <linux@roeck-us.net>
To: Markus Stockhausen <markus.stockhausen@gmx.de>
Cc: robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org,
	jdelvare@suse.com, linux-hwmon@vger.kernel.org,
	devicetree@vger.kernel.org
Subject: Re: [PATCH v3 2/2] hwmon: (lm75) Support active-high alert polarity
Message-ID: <66f6c065-f004-4129-acc0-6a04ba4cdc1f@roeck-us.net>
References: <20260504151020.462342-1-markus.stockhausen@gmx.de>
 <20260504151020.462342-3-markus.stockhausen@gmx.de>
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260504151020.462342-3-markus.stockhausen@gmx.de>

On Mon, May 04, 2026 at 05:10:20PM +0200, Markus Stockhausen wrote:
> LM75 devices supported by this driver support configurable active-high
> alert polarity. This is already documented in the devicetree description.
> Add support for it to the driver.
> 
> Follow documentation and defensively enforce active-low if property is
> not set. This avoids possible inconsistencies for future devices with
> wrong parametrization. No API breakage as all current devices have
> their parameters set to active-low.
> 
> Signed-off-by: Markus Stockhausen <markus.stockhausen@gmx.de>

Applied.

Thanks,
Guenter
