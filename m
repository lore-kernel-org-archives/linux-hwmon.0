Received: from mail-pj1-f51.google.com (mail-pj1-f51.google.com [209.85.216.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1288737757A
	for <linux-hwmon@vger.kernel.org>; Thu, 26 Mar 2026 14:12:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774534346; cv=none; b=KQjmJfAVaMCJpkOCdl8aGiKKuQj6T5cL6hXsopsqSYmKP0AUBRwgCL48uFQpRMmzfMc7yRnU8jwd8K7wsVHb88CWWNPVBt01kpAmNOcNyUjD/czvFSEickb6y/RlXH4vJVc1VfBNO6rRWNNUH7Qhr2JRDER5hl74qrR82POJ//g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774534346; c=relaxed/simple;
	bh=6cZ3vxxb0pI4C+y16nBc6h8C4ywhozxBzEV0QFhCG7Q=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=TxNKMv6omfVVPVtBFgiAdZrX9BLU6EOo0RO1cBJz4vvAjPD+nh6v5Hx84WJNoqo0sHAfEWpAxUNNPRT3LYAqVba0sV5Xq1t44hUpqSPOLSNiyKjoxRHvi+8Yplk+MTvcxijFj6glUxHOkfkZn8RmkgjyxnoLnMpQEOEQWBZbsKw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=M8tc/iN/; arc=none smtp.client-ip=209.85.216.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="M8tc/iN/"
Received: by mail-pj1-f51.google.com with SMTP id 98e67ed59e1d1-354a18c48b5so991630a91.1
        for <linux-hwmon@vger.kernel.org>; Thu, 26 Mar 2026 07:12:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1774534338; x=1775139138; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:sender:from:to:cc:subject:date:message-id
         :reply-to;
        bh=WQ6aUbygurrGv5Eht9Bc31IiCSe4V69xfJ6COF2gWAY=;
        b=M8tc/iN/1hd9TaqDFGlWg8lAGk8OTJ0yXdLCkrtgJxru4UJCBkPwXEogu068iB+jsU
         cMPpm05JtXVrbfNa3eAjh5gVvqEbjJ4GPORNbA0FXvtxvaC5lJB1KAXrMRRdpnRdSzPF
         eRgvdI2UcK0w+1AAdG6XhKHQQIAY5er5tKuYFRmj6VZW5FUPGXVSiaYlw8bs97TiSRV1
         cLneCX5tvpoPH6wSSi8qjITmVbCtvfrGzL2TIzoBQt2LoX6F82Cn79/TJy023VpWv0fY
         0pIOPR6rDNHqzNBVbtp/5AB8D2s6T1U6fpwXNhRYzooiJ0rDnxRHwdBVc5rp6nm+UO9g
         1pwQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774534338; x=1775139138;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:sender:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=WQ6aUbygurrGv5Eht9Bc31IiCSe4V69xfJ6COF2gWAY=;
        b=cQeXepNwehDJxVmjsC/pc6p4QkNVZ8LDdgC02/kU0An30HJz/bsY7aZ2UevTEuREdG
         eCfwu1iBhXcq8sBHbagkf8rXkZ6tA1G9mA+FLy+oHAQfdVJgA2V7olPBfxHfqza/B86O
         VExuZgYJpfMjqJusPodwFeAJZfHcrPAdiVcz0Ck2n/ZGUrP54GvESxgpLR5MJNsTJJfG
         DdC4LHReqS14teVsOZki14aGAWKVUNehJLE05lcNfO+WkJPNFxqb6XtvVppETPsrY5E+
         ner6VF754Lg5eMGjB7EhyD+uJEdQ6EXHMshjffGnhFgNA/5WT8pkkG1BnPBx/ORo4ULM
         U+Hg==
X-Forwarded-Encrypted: i=1; AJvYcCUSITsevQvlG20h3Ai2vdKNCGZCEyBZkzFZHh3i01kfA04w2+MT1UgIkD+yay6gOkH+wFegDuIXNn8dmg==@vger.kernel.org
X-Gm-Message-State: AOJu0YzqpytgrXs+wzuPjIRdevBuXJLrSrcfcEbr1afNXqCqDkQXaxb2
	L42m6JMx5i4quEiVp0rtU2JJhmNnJA14NKsZaoQIUksyS9l7CrvHms6Q
X-Gm-Gg: ATEYQzzejiD97xc7fctcGadVrinbIuQ7iq+bABuskNSAr0McApVyxyZY0cs5s5OuLn7
	ZU902qYgBhRPwGwcbm5yiIYpyylp5mPqO6XB4SwvhsSjHl8WgZ8h5hv1OL/Y3PVh9CTBeFVBOlr
	U9yea+hG/p5OsGCoEMIXWHqK4K1r4KP12GUbCvQviJVJ1Vn1XG8hiXPnlA6dWD6Kl1Zwhuq9BIQ
	VROk2KRiANePH0rV26sZkuh4qdZZVMbckp9JQnYum1SBrPkL8SOaaAKQsrKB25K1chRhmB9ZY9K
	o2KzM6Ci13qJtC1SguIw3/e9RXc4TF/VeZwEULoXkdt0gnZsVSJqcQ/iMQ26KlQcUVlQeBE/KEB
	IhqADwoluvtiDN1s5TsuQbOeX8SXkBBGBaKS5YXmkSFUswVD+yQ5hZA+lm0k8gg5i3RG+y2tfye
	KoI1WTsilIpgyS/TsQ4DLSnTGYpiWoyrq7S1lE
X-Received: by 2002:a17:90a:117:b0:35c:f44:c01d with SMTP id 98e67ed59e1d1-35c0f44c0ddmr3937423a91.8.1774534338196;
        Thu, 26 Mar 2026 07:12:18 -0700 (PDT)
Received: from server.roeck-us.net ([2600:1700:e321:62f0:da43:aeff:fecc:bfd5])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-35c22a7b110sm2468500a91.5.2026.03.26.07.12.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 26 Mar 2026 07:12:17 -0700 (PDT)
Sender: Guenter Roeck <groeck7@gmail.com>
Date: Thu, 26 Mar 2026 07:12:16 -0700
From: Guenter Roeck <linux@roeck-us.net>
To: Andy Shevchenko <andriy.shevchenko@intel.com>
Cc: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>,
	Jonathan Cameron <jic23@kernel.org>,
	David Lechner <dlechner@baylibre.com>,
	Nuno =?iso-8859-1?Q?S=E1?= <nuno.sa@analog.com>,
	Andy Shevchenko <andy@kernel.org>, brgl@kernel.org,
	linux-kernel@vger.kernel.org, linux-hwmon@vger.kernel.org,
	linux-iio@vger.kernel.org
Subject: Re: [PATCH] hwmon: (ina2xx) drop unused platform data
Message-ID: <b692b3db-75f2-43d0-8b2e-c5a89b8ff5ca@roeck-us.net>
References: <20260326-drop-ina2xx-pdata-v1-1-c159437bb2df@oss.qualcomm.com>
 <acUJGHrJvWgqHxPw@ashevche-desk.local>
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <acUJGHrJvWgqHxPw@ashevche-desk.local>

On Thu, Mar 26, 2026 at 12:23:20PM +0200, Andy Shevchenko wrote:
> On Thu, Mar 26, 2026 at 10:30:00AM +0100, Bartosz Golaszewski wrote:
> > Nobody defines struct ina2xx_platform_data. Remove platform data support
> > from the drivers which still have it (it's effectively dead code) and
> > remove the header.
> 
> Would be nice to see a follow up to convert to use device properties.
> But again, I already asked this Q: why do we have two drivers for the
> same part? (Probably not to you, Bart)

Because the person introducing the iio driver claimed that they needed
the iio ABI and were unwilling to create a generic hwmon->iio bridge.

Guenter
