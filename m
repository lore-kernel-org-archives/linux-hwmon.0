Received: from mail-pl1-f171.google.com (mail-pl1-f171.google.com [209.85.214.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B127E3033E6
	for <linux-hwmon@vger.kernel.org>; Fri, 11 Sep 2026 00:56:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789088208; cv=none; b=FKa3B0kwdVjxaxN1NhO1anasVbSts8BqFZAZy1HJffgcWMf0rzp7NU5NuwjY1fZnj5w+LBwZyNqvIEMl0kjZwKmSGsPwuXmhCJ5D9V7ATeQGCaLjSVorE4CKaVQrSFOQaZPLgRzPuAnVcj8+s4khcF0ukK+AYQ9iZsHcu0c2hds=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789088208; c=relaxed/simple;
	bh=nKNuesHM0VjAY9kiLoRrBVVAoGMjPhKuxQKlQzK44GY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=EDOZ8P2QPZolcNXKlQaB3HznscWTuvjT+J7I9/0yhSSm/h1049Xzw1HtQSukGTmGwXaqp4MIZHrRmkmXJcjrggVYjkhFK5iYg6OSu2bLcZpxCHDNsJsA2ONfHejpYQyTZZpIThpxZMo5pfdaJguF0gdrAHqvCkSjgHMSOkTVrSU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=rTQrcI7M; arc=none smtp.client-ip=209.85.214.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="rTQrcI7M"
Received: by mail-pl1-f171.google.com with SMTP id d9443c01a7336-2d8f265cbe6so3321915ad.0
        for <linux-hwmon@vger.kernel.org>; Thu, 10 Sep 2026 17:56:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789088206; x=1789693006; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:sender:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=Ogc/WBlD+uYeOl0wYLOQ6BjMKr9zLaEHN9sUG+KrTjY=;
        b=rTQrcI7M4rvzowPDLuCFIewU2aJshRdTX8R4MF1ECs/rm6Q6XUOrKZrwZImHV3c+Wh
         4faHXTrKkFOx3ztHoy6ymFYEHEri+5mCXsMYAV6i6S5spUsSiD2HFYZyrLepdUdXq0YE
         w5X4R/UL1NGgAA5cB/6OwRkw3Fy9mNCuMa+jOKkqEBcew+pPWo1tSpZeW3ckn4fDc8lC
         sU7HGK2sgte3c/3FKK9/yh7OWRuR6Y9rW5dKfAansN0jcHgztpLCQ+hfNG3EpwI95H/D
         7caY4/zY+kheuzxz+1KmuSH9okkRkx8uEOviHDCG91fcX26O20bzA85y9/smNGE9xSFE
         mi4w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789088206; x=1789693006;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:sender:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Ogc/WBlD+uYeOl0wYLOQ6BjMKr9zLaEHN9sUG+KrTjY=;
        b=ZRAlHKXmUBFHlWWlpcRqBL3o9Z0jPR2zboR2PUM/dMSMtioL3Tf5hTveMrgquolvgP
         Wk9uj2EihquveltUOOSXaVTUZvIsi+CZfFE2+sCu/suRoaz7aCcP97Vb7gzO1h5AM2zv
         NpDiPP7FAT500cQWvKHN7LqdnzDR+kDcH5o2ozbkm6MGQadWfJdnOw44nEd1Ml1a8CGb
         wtquZRqLUAZ7fH54zkmicp70KP962wAXRR26ZtAEXekGihLogNj+iAtuxNzqiqJkcxzA
         4y9k+MbLfb6FbO6g5m0k54J96zDEs1E0vNcAJl3yltX/4fRRugCGZzmiinVP/Y+KwZGw
         A3xw==
X-Gm-Message-State: AFuF++knYzEFBXqnqcJcUUy07nMZktoJiPQRfSepmQ4hCF3AiWfX2VBx
	Wu0xXbVxNIg2QCVp377h7U9hH4Bb5TraCTWj1xfjBra96fudee0ZddzMvkfDyPKC
X-Gm-Gg: AYBFou1wggXr9NM+RnRU7Hw7cyOh0VfkiCVtLAJ3xoKJx9ExQYKkZsE0wocZqOk9yUS
	KkNYz52st5XoaHUIuNAgGy2iuqCDSAbX1Jz2NNON1oX6sQrtjv9eGLLXFo7lPJ9J5dfC3oKvJoP
	39VkrV4IOW56M/S05P181Oh58ONby1bPsTO8v6//YAFnbRjkBqP34gP6VQpHPYWngZvf95G/fJA
	pnJozUyKlDO6mkhGH1n9TZ83rzTLO0KXwqRBTtMHK0z6pzsriBvEZ63QjnEL9rtJjtJyM0BxPBe
	J8GBZn4h/unrJsgPpkNjvbU6GqeozbFF4RzRbtsl9U23eG3axK8bZBlnggY1dBOuS5zFvR2U5xg
	WXE39JttsWdKKPXUpSGHvmzDUadOVyNNtTL9+Mg+dzuGjrtqhOQtBNI+nlGRP1OMtg14eZA99yh
	5ZTg/T9ydjpQV1RYs5ilEH3FjnK5rc9zUxtOE6G8aij4cAaLihcDgPOcNgX0N5w9Z36X9SgORWh
	jDmlYV+5Msq
X-Received: by 2002:a17:90b:1d45:b0:398:9be9:ab8f with SMTP id 98e67ed59e1d1-39d9c21cf40mr2318273a91.20.1789088205743;
        Thu, 10 Sep 2026 17:56:45 -0700 (PDT)
Received: from server.roeck-us.net ([2600:1700:e321:62f0:da43:aeff:fecc:bfd5])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-14365bb6ba0sm2006097c88.15.2026.09.10.17.56.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 10 Sep 2026 17:56:45 -0700 (PDT)
Sender: Guenter Roeck <groeck7@gmail.com>
Date: Thu, 10 Sep 2026 17:56:44 -0700
From: Guenter Roeck <linux@roeck-us.net>
To: Aureo Serrano de Souza <aureo.serrano@arctic.de>
Cc: linux-hwmon@vger.kernel.org, linux@weissschuh.net,
	arctic.it.hk@arctic.de, corbet@lwn.net, skhan@linuxfoundation.org,
	rdunlap@infradead.org, linux-doc@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH 2/3] hwmon: arctic_fan_controller: dual-license
 GPL-2.0-or-later OR BSD-2-Clause
Message-ID: <c640dcbc-784e-4847-a5c0-ec6ab42fde49@roeck-us.net>
References: <20260910050401.279868-1-aureo.serrano@arctic.de>
 <20260910050401.279868-3-aureo.serrano@arctic.de>
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260910050401.279868-3-aureo.serrano@arctic.de>

On Thu, Sep 10, 2026 at 01:04:00PM +0800, Aureo Serrano de Souza wrote:
> The in-tree driver is solely authored by ARCTIC. Keep the existing
> GPL-2.0-or-later grant and add BSD-2-Clause so the files may be used
> under either license.
> 
> Signed-off-by: Aureo Serrano de Souza <aureo.serrano@arctic.de>

Applied.

Thanks,
Guenter
