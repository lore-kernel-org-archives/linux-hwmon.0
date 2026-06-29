Received: from mail-dy1-f177.google.com (mail-dy1-f177.google.com [74.125.82.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 404253A83AC
	for <linux-hwmon@vger.kernel.org>; Mon, 29 Jun 2026 20:56:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.82.177
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782766586; cv=none; b=M4BFEtQxmSBom8A5zFQWctVNO6OS76OKNvU8L/VFrikBa98pLO4UFS606X2x1f2KJJudhDAORMwmfAhE+DnfYpGESA4Bfod9NufdGTbLZcbVvVi0vTcAhe19yy1XBZWun8OJB6OAwTIt3Tm16ysuqJxq1gWoOXSdMSQlUagSXew=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782766586; c=relaxed/simple;
	bh=hOjA7jyxnCOr2nR/iV5EM553jiCr0R6uUQ7dUhFldgk=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=NpYR55zKUeULjW1LH837Y06issrcDpqgARNZbJtzK/cqJuCOB7VyUSQ08LOu2Ins3jeUz4DxARz9blUDlJEWy3v/6RKzGDVL6fJnOIuUUkWAK2s8fcToutfJIydzN2vPhSmeaQm1GfrEWMMra3y10f6CPx4WLrSiKn85RE1rBI4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=tCyy0+Ek; arc=none smtp.client-ip=74.125.82.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="tCyy0+Ek"
Received: by mail-dy1-f177.google.com with SMTP id 5a478bee46e88-30eac9abd79so2883413eec.1
        for <linux-hwmon@vger.kernel.org>; Mon, 29 Jun 2026 13:56:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1782766582; x=1783371382; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:sender:from:to:cc:subject:date:message-id
         :reply-to;
        bh=KUIpMiKwcHQA8nQw5M6D2Ujl90hrTvX4L+5YziVwAGA=;
        b=tCyy0+EkYc4eYY1TlhVukkRRUYhzDE6rf0LeSGOStApRRiChrbISOIM7LY/8yh0c7C
         0v/th3IJXs1ovn+OuYJjUCKmOGJzKXpyndQzFMd0K8ukdCJ+41em1RxZFd2OZiJQvjtA
         mZXrh22ZX78xgnKMjoeOyNdsxTUy+nRZuk+jOMFF8IowbpwEr6lC/kpKcCuPL6Q05MoE
         dAK3fA6pZakp0C7zx4176ISguU1WhAPneVCSpz8tO0rzPGfjtgXtTsSG6IQAHuZL2h7K
         vGxwgMqxs/uWVYQw7kUOPkwawM8aPgNe4RLXvVhmROt10mK9+0xBDgAq1S1n3WDd4B3U
         CEeQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782766582; x=1783371382;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:sender:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=KUIpMiKwcHQA8nQw5M6D2Ujl90hrTvX4L+5YziVwAGA=;
        b=kKpAqugEzurnFHwzSEP8v7KHK4Sz+qsrw7gVG+VYzEyVRwxckr+/Mbzxtc1SpK5DOl
         JYpuIr8cUm4cJ6cEWnjh1A+OsSsl1E3ORidtzJWgf4xDmqcT3ydXVIPp5VB+mK6tyK/V
         wof0s4JsyCM6cjVnU10eBuS6EFU0gz+6L2tG/6GppwpWh1QdgFE6krz5YE/6/GHo5z2U
         d7XvQ3/NsLn1vUb2AIM0zCWDg6Pg1bQnPaW8V4g5LRaBISH0yQISY787TumSYMzMCoGW
         H2XgAdm0SiD1/qEXw7XJ5fD6iCGSf6aSw6GL7UGS50x0pjibWMCe5foi6baJYZbBkdLT
         VORw==
X-Forwarded-Encrypted: i=1; AHgh+RphwcNSlYUFNg7ZEZZcgWYo2RntCZnGzDqrPcs1JJpVpA7FmbzPYxlojPsUetCYT07anlkkuseZd88w0g==@vger.kernel.org
X-Gm-Message-State: AOJu0YxtJxrLt/Fo5aRQ84p0H8PyB7QE/+owiKV9e4dgdIw/JpS90Nn1
	YrmpPVvc1P5pODJNDX1DKm3+P2a1aoqJ++4dpVGfsRki6P0Asydz8dN7
X-Gm-Gg: AfdE7cnyPoKw6p8A10YeRNl4LM/lI5Bsl79xck1IjVy4fcFxuuLU9QQkwdcL2svt8sc
	wjENGpQLbF5jTM+k7YzXqm5dx5VtWNIB8c/XMLSgms5TWi2UWB+1nYQcEl5JV69lFJYRSDxEhwd
	UrM0/avQqrVlqzlWSvHZ+KjT+MwGxTKOZSi5QvBRqICrJWRhiIsXlE8hbx8qs3WOt/xgsFyn89P
	9Ih+doHP0w/C5Jsyewc13djHs2i6gMxtvVJhAe0hDowArxZlCvXuL3E7TTfdU2fX9vaVA64WFi5
	QM+CQbw0+PT+hjjd0WMeQcYJVrzg0fCQXJzRasMedplu6hymdD8Sc4ZleJM1OkP3/ClavT+kwwh
	KOqTEqTLxRITQ/3Py14Oulqz3/2z2T8jk+1AEDzz5Trx/t0RedM+mLEjlDt3BfgEq0ArpzU1zIe
	fX9cX7AnqgAJYNCeaIDAaS6/zP5Q==
X-Received: by 2002:a05:693c:25c1:b0:30c:ab97:d7ac with SMTP id 5a478bee46e88-30ee13e74a1mr681617eec.38.1782766581779;
        Mon, 29 Jun 2026 13:56:21 -0700 (PDT)
Received: from server.roeck-us.net ([2600:1700:e321:62f0:da43:aeff:fecc:bfd5])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-30ee317095dsm1083869eec.15.2026.06.29.13.56.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 29 Jun 2026 13:56:21 -0700 (PDT)
Sender: Guenter Roeck <groeck7@gmail.com>
Date: Mon, 29 Jun 2026 13:56:20 -0700
From: Guenter Roeck <linux@roeck-us.net>
To: Matti Vaittinen <mazziesaccount@gmail.com>
Cc: Matti Vaittinen <matti.vaittinen@fi.rohmeurope.com>,
	Matti Vaittinen <matti.vaittinen@linux.dev>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Jonathan Corbet <corbet@lwn.net>,
	Shuah Khan <skhan@linuxfoundation.org>,
	Wensheng Wang <wenswang@yeah.net>,
	Ashish Yadav <ashish.yadav@infineon.com>,
	Vasileios Amoiridis <vasileios.amoiridis@cern.ch>,
	Kim Seer Paller <kimseer.paller@analog.com>,
	ChiShih Tsai <tomtsai764@gmail.com>,
	Chris Packham <chris.packham@alliedtelesis.co.nz>,
	Robert Coulson <robert.coulson@ericsson.com>,
	linux-hwmon@vger.kernel.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-doc@vger.kernel.org
Subject: Re: [PATCH v2 8/9] doc: adm1275: Add ROHM BD12790
Message-ID: <819714dc-0193-4667-9885-67f30b4b0bff@roeck-us.net>
References: <cover.1782458224.git.mazziesaccount@gmail.com>
 <9bafcfe37190b5a3925e8dcfa3b59f8d240234ba.1782458224.git.mazziesaccount@gmail.com>
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <9bafcfe37190b5a3925e8dcfa3b59f8d240234ba.1782458224.git.mazziesaccount@gmail.com>

On Fri, Jun 26, 2026 at 10:25:33AM +0300, Matti Vaittinen wrote:
> From: Matti Vaittinen <mazziesaccount@gmail.com>
> 
> Add the ROHM BD12790 to the list of the ICs supported by the adm1275
> driver.
> 
> Signed-off-by: Matti Vaittinen <mazziesaccount@gmail.com>

Applied.

Thanks,
Guenter
