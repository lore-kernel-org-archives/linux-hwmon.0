Received: from mail-pf1-f176.google.com (mail-pf1-f176.google.com [209.85.210.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BF3BC1A9FB5
	for <linux-hwmon@vger.kernel.org>; Thu,  2 Oct 2025 21:34:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.176
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1759440859; cv=none; b=YQaEEYTQRMlXvssOQyo25avtcb1l6K73dVjkWIPMDI0v65C7d1ImypoILOocKmy8oeut39PuPPgdvyfj1LW/wl+eF4VvBuJFKFhJcqk6H8Gsgjbca3NarFMyvZ7whQbQn7XMIjbWbyVnLKlPDcylyuMHEXkyiqEO3qPgzgJPQcc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1759440859; c=relaxed/simple;
	bh=7iSxhUwFdayMNkBWqhX/46UeqkWg3MxAUcCsOEZ/TwI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=UXCX4VMUeddUMTW+OlqWkjTHVrvb2ckP8lw8MRl5npsDXSe7eTVBlPwhhnYmeT5U92BUQ2J2hvjjmCMGeL8+mhKK3ziPQZT5MOE4WHPAzGMkMXd3/mK/IJKNveAdAcMqP9KyFZLcTcDKLteKyLkpfm8vQtrjfInqYEuvj7yhUmo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=lfcQQzeR; arc=none smtp.client-ip=209.85.210.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="lfcQQzeR"
Received: by mail-pf1-f176.google.com with SMTP id d2e1a72fcca58-76e2ea933b7so1298522b3a.1
        for <linux-hwmon@vger.kernel.org>; Thu, 02 Oct 2025 14:34:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1759440855; x=1760045655; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:sender:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Z1PrJRpi1vH5GxKwZlWbhM3YXHmClyIGjsFkroyXTL4=;
        b=lfcQQzeRu9CjFTaBbxpvB2eeRykW50cBni0HeRqgq+J8HSKgDX03wzcv4IsarnycsE
         whmNkCvsEVA317ilzRdgwvOXrq0YhLzxV0joclNiQY707arzlnA11ilIJZKt9/4p3v/K
         VrHLWT26LpVTKC9j132SSYYacvpQqNN7Cukx7M3dG/LchHdcEJo/OtZneRbQJPDBS3E1
         2KCOJnU3Jg1HkwpWb835Ort4Qx9v/jFSmMwylEBEeIW9TnX7Yb4Kz7PY6pLGho6mnP1m
         YXdisIX7KARxsVHSUnSSLRlfvOCqGRgPK2VKJOS0cIyMOUVPEtzA1NrDJVSgT7DJYWTL
         OHDw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1759440855; x=1760045655;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:sender:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Z1PrJRpi1vH5GxKwZlWbhM3YXHmClyIGjsFkroyXTL4=;
        b=HeiEm+pW3rHWV5NIrMXGsPC+de65HfnvPIi6puIuwVwSceOsuNJWIOaZ4RBUKDQXYV
         17RYejTK1LMOb2HUo8yLfh9T7GMMBmvJwr3nIvUw3tXHlrFjmwPT4DZvswoe5K/GcZH2
         xL6raIHUpz85nfgie9M8r1qdVDCDYaxHwIYSSQbm8tUYagd7w/Olw9xZy2jVGvgDyOly
         n4SmZG6mEuohuhRdHRx6Fw27rIUIFcmnZL9miL0cgrFQiHCWo9mnmNCJ0xcQLYW7umU6
         hRmaDuKk1KsAAsHcnHVu4Un3NhM9bkCRe+Uz7sVPH8WSSKgqv7R+qcXm5kU93PNLhFe9
         T+0Q==
X-Forwarded-Encrypted: i=1; AJvYcCVaxzY73KgYz4xok2nD4tX9h+J00fkJuKxFYLH5yVOvAM2HHpa99UZaz8P7ncsdo6TjaKsbGZHElbmPzA==@vger.kernel.org
X-Gm-Message-State: AOJu0YzmxGx4qe58skNzm5T2iM/pGNGfxeFDu8ju065dW6ojwzuDo27d
	Cu+aAS8plsDlVNIMYXvP8N0uxXaXIChAFQcd2OmXafzrConu4GTHB/Hv
X-Gm-Gg: ASbGncvT+RT9psGxEMUysbFiHLu+2geBCOdVevrk8AljXaMLxyt2IsAxXawexTRZKaO
	Qg0fUpzncacV/2V0MOTi7I36Y2dOLF299VEAnYABvwf88tfu3LIZBcodELB6VzfCFQMmIDauHMN
	l6UZTjXo6M/adCWS6pYiJ/QIAJCddLwdrkJqtVlwpEcrPNidCm8LBQpOiNDPUWVGhMLcRdEnyMv
	sS3eqXH8LGPk9nTTamyCmEFPmKO1EeNQXsvJ1oTsO7PA0vs8/q5/oWrUXyhWS9ycKLrhQ2pz8Rf
	hjaW/hhWx2pXzsPdcYyfumwS+KsNB2TJjovrRDC1yED0E0tA3PvxU8LkfdhwpcH3fsowEUTKiYn
	/rI2unSnc/uSg129P1SNYqhgxW8dTt9JfI2B6dbgRDfTyRTq9MetqJHbYx1U=
X-Google-Smtp-Source: AGHT+IEeOUf9stYiH4A1VxaI8NkZFOnx8BChpkifOeNgOd1G+kYcSz65i3l+MHbiV/bwjRo4Ir5TvA==
X-Received: by 2002:a05:6a20:72a6:b0:327:957:f915 with SMTP id adf61e73a8af0-32b61d9daa6mr932098637.24.1759440854923;
        Thu, 02 Oct 2025 14:34:14 -0700 (PDT)
Received: from server.roeck-us.net ([2600:1700:e321:62f0:da43:aeff:fecc:bfd5])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-78b01f9daffsm2947915b3a.17.2025.10.02.14.34.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 02 Oct 2025 14:34:14 -0700 (PDT)
Sender: Guenter Roeck <groeck7@gmail.com>
Date: Thu, 2 Oct 2025 14:34:08 -0700
From: Guenter Roeck <linux@roeck-us.net>
To: Sascha Hauer <s.hauer@pengutronix.de>
Cc: Jean Delvare <jdelvare@suse.com>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Linus Walleij <linus.walleij@linaro.org>,
	linux-hwmon@vger.kernel.org, linux-kernel@vger.kernel.org,
	devicetree@vger.kernel.org
Subject: Re: [PATCH 2/2] dt-bindings: hwmon: ntc-thermistor: Add Murata
 ncp18wm474 NTC
Message-ID: <f33219df-2b2c-4edb-bcb6-bad189c25348@roeck-us.net>
References: <20251001-ntc-thermistor-ncp18wm474-v1-0-2c64b9b509ff@pengutronix.de>
 <20251001-ntc-thermistor-ncp18wm474-v1-2-2c64b9b509ff@pengutronix.de>
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251001-ntc-thermistor-ncp18wm474-v1-2-2c64b9b509ff@pengutronix.de>

On Wed, Oct 01, 2025 at 01:45:28PM +0200, Sascha Hauer wrote:
> Add Murata ncp18wm474 [1] NTC to the ntc-thermistor binding.
> 
> [1] https://www.murata.com/en-eu/api/pdfdownloadapi?cate=&partno=NCP18WM474E03RB
> 
> Signed-off-by: Sascha Hauer <s.hauer@pengutronix.de>
> Acked-by: Conor Dooley <conor.dooley@microchip.com>

Applied to hwmon-next.

Thanks,
Guenter
