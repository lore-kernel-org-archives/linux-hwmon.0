Received: from mail-pj1-f41.google.com (mail-pj1-f41.google.com [209.85.216.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 76D863F86EA
	for <linux-hwmon@vger.kernel.org>; Mon, 10 Aug 2026 16:25:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786379110; cv=none; b=PavN7YREqulb9B5dG1C9dzZHgK9Rk1o62uiz/xh/v8w+arCc2YFetZUVj2VTHeNpw5hR21mjQvEFL9+8t+r+Qejs4XQ/NVXapPgvFCJzMMzDpAmOUrv0Dev6ZAqqu/WqvzHl97qYVp0sm5xECXLoPb9HA89I0PCNHaNAkVZO+ek=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786379110; c=relaxed/simple;
	bh=eueGAj8oGaM4kLErdKA/dG4Vvkc38iQ6SdZdskMAKH4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=l60PsOgEwT27R3Wr4WJQl6mcvqz9qcGRgFPd1xEVSr6vQ+iag2CVuNJshcoekMJ/r+lpGyVmQTebLJ8NHdkUvQAlQa++A0LzSYfgZ6JLwpa45oUUsp06lAqlhW/2oAB31DCqQ3ieGUiccitkSZqsQxEqNUhd1p0LzzbP1hECGP8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=LRYEdOJo; arc=none smtp.client-ip=209.85.216.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="LRYEdOJo"
Received: by mail-pj1-f41.google.com with SMTP id 98e67ed59e1d1-38e08baf860so2002836a91.2
        for <linux-hwmon@vger.kernel.org>; Mon, 10 Aug 2026 09:25:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1786379109; x=1786983909; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:sender:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=fwrUhGiqFfBO/bQRRK3RvNMgcT0RQUx4H8uPR9x4Qp4=;
        b=LRYEdOJo7+loBOEy70i9mAg37sr0YDRtLyytMLL82/24H1hGL8BGoWfc3OMsujMKpO
         Wy6g3WjpcY/PmcYfXQRI/4vdq6v1/xVqWnRnoJ2rLU7EzuCNX5MNYqkEi/FsYiD2PEKb
         V+GRgZm2ukabYEwCqCUrZ7KitVIYJ9xBOsr9fepxy2uOSoC33dsIgu9baj1oVm5G4pAS
         3CvQ80UDQTPDuU8WxXu7c44EXMLOaFyTNYHn1njYYz2ZwduInyeXDZeeDxREwa7X8tJd
         Be4waaK4wt7pmMCkJZZJoFcR0oY9H6P0rtdC48vmC6+yS6RusiQ96A13zFTrVwj7Nh/P
         w6oA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786379109; x=1786983909;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:sender:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=fwrUhGiqFfBO/bQRRK3RvNMgcT0RQUx4H8uPR9x4Qp4=;
        b=tFXXH3GFSB+cHR5Op1+MY/056/9vMhm65osDtAfY9+giiPkD/Yei0jbyfbuIYYZKwO
         cjJa1T53AObSr9AskqSkLgWnqVPsaH8mCwEvG5KFyjnMERxEnLp0QsgdhPfU8RFaFs3e
         sB5wcilWg5jx8qfvHwQxeQaywuD1/kqQqSXQsrh4X5a4vr2ckcuJRxxAiMJcyWge0mIk
         zXl6fMdNth+mz9qsuqt4SXOUyAmpR1eFvEsKeeMPLYjLLJ3Xe2TrS1npstlgPCiR3cCJ
         Ua+hWXJ56nZXHQnmZC6S7lUivnn2TdS+khDDDG/WWTTaEEUUQ/auuRkD7vWmFIoH3ZBt
         53pg==
X-Forwarded-Encrypted: i=1; AHgh+Ro4Bud/dpjKsiE+fOblnPMO0p7+dqN8/k9umt9myaZPsBJ6PFbsc6CAnp3BHUcMUVAm9QG2v5n4SUFf9Q==@vger.kernel.org
X-Gm-Message-State: AOJu0YypxqCiZumuOXLQtkivDx/t0OWXb5rnvqYtsOigPUKqkposa8t3
	nlgZT5OoE5kTbkCldj0V7zdnak0b1PRPQr7SfezztyEcvBEdHQK7mDKy
X-Gm-Gg: AR+sD13zNMkdfALRwTbVAA+3fHbirLoBYbyJvl1RG+hIdAtQRJKQ/7mrdPUzXqiwqIy
	Id6XvMi2x7vcwpQtj7D1mIEm2HyCqHQdmJfejbNWeawqznHjwAaSspVbi9U3Ksso8lVEkwZQG/o
	tKsOwBVSH0hgHgEXnAiF3B6ywqraxuhk0sVPjJse9Pr31h1K55oddbFXusQBgkCiCAtz8Xn3Btt
	KtNJa1Z883Ut8F//Ug8NTyGn4N7R0Ygp9ivFPScyWIEAc4UTfQIhBz64tl3E3oqeZAdwBcigq5h
	e+3xxWAOjW6vhn+eav2M9Q3ZyUkMwOc8zf6pEctvZpGOyl5mfC15mZRnli3oZnpUwh2yaBwC3Ty
	ZJIllyHQSFHzEXs7S7/VEF17bvntlzHyR6oNJc2WcE65+hRRz+AlNq6dw0dwqMYl/cyhvn6JeyY
	y6/Js5RHKct0HkcTPLph9Cvy2+H2wZkTPzsCLFmn9E8fyGN0/iD6lcmIbK9cixfVQ9EhNKlhIkf
	A==
X-Received: by 2002:a17:90b:554d:b0:38f:23d6:b4a9 with SMTP id 98e67ed59e1d1-392cca737c4mr2724462a91.21.1786379108861;
        Mon, 10 Aug 2026 09:25:08 -0700 (PDT)
Received: from server.roeck-us.net ([2600:1700:e321:62f0:da43:aeff:fecc:bfd5])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-390b330f89dsm6192516a91.2.2026.08.10.09.25.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 10 Aug 2026 09:25:08 -0700 (PDT)
Sender: Guenter Roeck <groeck7@gmail.com>
Date: Mon, 10 Aug 2026 09:25:07 -0700
From: Guenter Roeck <linux@roeck-us.net>
To: Cong Nguyen <congnt264@gmail.com>
Cc: Vadim Pasternak <vadimp@mellanox.com>, linux-hwmon@vger.kernel.org,
	linux-kernel@vger.kernel.org, stable@vger.kernel.org
Subject: Re: [PATCH v2 1/2] hwmon: (max6621) fix temperature clamp range
Message-ID: <374f630a-b4a2-4599-8435-4a5951b6a6fc@roeck-us.net>
References: <9d3a4f1895a47794bb359a2a32fb1ccd6a15812c.1786334038.git.congnt264@gmail.com>
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <9d3a4f1895a47794bb359a2a32fb1ccd6a15812c.1786334038.git.congnt264@gmail.com>

On Mon, Aug 10, 2026 at 11:27:54AM +0700, Cong Nguyen wrote:
> MAX6621_TEMP_INPUT_MIN and MAX6621_TEMP_INPUT_MAX are used to clamp the
> writable offset and critical thresholds. They are defined as -127000 and
> 128000.
> 
> The driver decodes the temperature through an s8 and its own comment in
> max6621_read() documents an 8-bit two's complement value, whose range is
> -128 to +127 degrees C. The current limits therefore reject the valid
> -128 degrees C and accept +128 degrees C, which does not fit the 8-bit
> range.
> 
> Correct the limits to -128000 and 127000.
> 
> Fixes: 92b64580f14b ("hwmon: (max6621) Add support for Maxim MAX6621 temperature sensor")
> Cc: stable@vger.kernel.org
> Assisted-by: Claude:claude-opus-4
> Signed-off-by: Cong Nguyen <congnt264@gmail.com>

Applied.

Thanks,
Guenter
