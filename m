Received: from mail-pg1-f177.google.com (mail-pg1-f177.google.com [209.85.215.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2278048C3FE
	for <linux-hwmon@vger.kernel.org>; Tue,  9 Jun 2026 15:30:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.177
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781019052; cv=none; b=iJl2PC7eXPOe0IqXf8nbflPngjsn3DBNmSPIrcpOF4O+so73x26cdcoUhPb5hyyAuP1YHFeZ7pkpqdcon75hjWx/0ddGmmjCbMZSspc7Gs5GaZNNCw4GvtHxEEeAHGakurCpiO2PjmugVAnydaEBaMmNK7vb7jRRfthrXPpbDXI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781019052; c=relaxed/simple;
	bh=11WhgqEt9zgT+ZWXS7ElY2GogLk4HG1AB68dGIPIaxc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=uO3akO8kL4+98SKgwEIGPWPbGwhB1LEkLxV1hXg68ImEhOAx5vbjI2CAf3LSlmWuISzunlz1dZkZRtARdx4gHRfduHPcRskm1faQgbczMRTe7G1LNg8Y7yaISEbj5AgiAueLZe4WwVKGkv1G8I+Da6NPML8ve6tKSIJBU5EgBXk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Wg0j8zQz; arc=none smtp.client-ip=209.85.215.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Wg0j8zQz"
Received: by mail-pg1-f177.google.com with SMTP id 41be03b00d2f7-c859878eb48so2241618a12.0
        for <linux-hwmon@vger.kernel.org>; Tue, 09 Jun 2026 08:30:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1781019050; x=1781623850; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:sender
         :from:to:cc:subject:date:message-id:reply-to;
        bh=tfoL8NhaievxojnidDqV0SnsthszxSn+iRp8X4DAOXY=;
        b=Wg0j8zQzHW+KSie6yZ/U++pU00g4DfbwbKgfhdhwDo+L8alXDCAoKCDwdR35iNGHd3
         NR9fXMEv+dCP+Ye8xUVd0lPBk0DvAgflS9t4X4JbxNBlitoSjqihqYgL6It5FfZOFVaT
         OzuVWZvpt+IJzRLTUitlgechxgoDbhqVGrpQk+L6fCH/R3/9WI8ojLk7a1aqW1XpLur7
         LvJerYtEkxvA6LhVp6mEp8ZnDdsq6LN4vYbcUnbbSl41KCpiDgPVDbQn7RQ14sO3ke2S
         TdVx1J+/3Vj2xx+YTWx4flEGhJgQEuipu6YUfq9FmOTQY3wB95M/wirg6gH7DgjXTgnC
         rCvw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781019050; x=1781623850;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:sender
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=tfoL8NhaievxojnidDqV0SnsthszxSn+iRp8X4DAOXY=;
        b=oFQQVQLi9WWqSZjPItLXO+PE9+vr89Ux+HEso7cBBC42uf/QHRDWtGiZSWEU7xmTbu
         uJfxa9ixZkbfR5aIWxOABv0gE1YxM2A8l2U9H4/3aJJ3f1cL5kTstj39K977fLD0zcLn
         pMQgMuuIYfwdjy3Eqto0ldEaJe3ccDj3NW+nkGyicqtS+ftgaqisYm0xyjFQTrRtX/1W
         jQM3rpHmsGd8K6+LmPXI/Iftj7Q638bWRKs2lTFtbbMwRrehsa/Gi0wx7dpdTM5yIMCc
         ixt3+I2lkVLeNhOcVowkeBToPojfTEOeb7ZDMhYuHdwoCvdWV5+EdxEfrGkkaiYrASmS
         pACg==
X-Forwarded-Encrypted: i=1; AFNElJ+okfFNM7hSFt2oIfwwfbH5zrlQjdzgVAg1tPWw0tAgC9NdRuk30mJFDyUs/1OwAMDLCHjqv3K+XI7IDw==@vger.kernel.org
X-Gm-Message-State: AOJu0YwJVTT/UJ7D3yku1k/OhGt3xMMx9C7SWlPtc3/2nHHaovbUZ3ou
	8TrkCQyV/qRW/DEaUnKxwpmIV2rfDMiy47qWYWwhDMeMwavi7sn//Xix
X-Gm-Gg: Acq92OFFEqFcmpuB9Bya7ZqBDKRcIGByDuVrmWgZfoUd9gxuy/TCcso16MKSugn0Cro
	BmWn9yJRXqDm+FLud4tFHIGYf8OPZZNXyE2ppX+2wc65J6yEMaw5zMnj9F3RvhnmQG1B4kYRhv4
	mHkPZgjAsdUu9WUoXjb1iyNZ2sU9w5UQh0/n4HUai+F/akOKq6zAoN5gB+2ZsSP2t/nuMu6JjBv
	Ciaqk+XNshv44QLxwGnJn8HlT2oqAUTfTQLHkWMOT3Shsg0roieMXIFah6ghKClgFgC3c5/dgY4
	w8kpWeXK33Gc4tqHiTN/cGsmdY2jIN7aLQTsAz6Voj+pqXyWpQysl6fG3EtdPvpfEVhklB0Mdvy
	BmRG4vd+lnMwVShsLtvsNs5pAeqiDcN3cSBbhF6RHjgsVYdxEmyt0xO0dSDO7h5P82StUXVwFYI
	Bx84FiMimt3xkLeO/YS+xXXojnrU5MBkvzAdPh3JEq+SQOUZw=
X-Received: by 2002:a05:6a00:928a:b0:842:5a8d:3036 with SMTP id d2e1a72fcca58-842b0fb6e13mr21005108b3a.35.1781019050176;
        Tue, 09 Jun 2026 08:30:50 -0700 (PDT)
Received: from server.roeck-us.net ([2600:1700:e321:62f0:da43:aeff:fecc:bfd5])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-8428221c3e4sm22494788b3a.5.2026.06.09.08.30.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 09 Jun 2026 08:30:49 -0700 (PDT)
Sender: Guenter Roeck <groeck7@gmail.com>
Date: Tue, 9 Jun 2026 08:30:48 -0700
From: Guenter Roeck <linux@roeck-us.net>
To: Nuno =?iso-8859-1?Q?S=E1?= <nuno.sa@analog.com>
Cc: linux-gpio@vger.kernel.org, linux-hwmon@vger.kernel.org,
	devicetree@vger.kernel.org, linux-doc@vger.kernel.org,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Jonathan Corbet <corbet@lwn.net>, Linus Walleij <linusw@kernel.org>,
	Bartosz Golaszewski <brgl@kernel.org>
Subject: Re: [PATCH v13 3/3] gpio: gpio-ltc4283: Add support for the LTC4283
 Swap Controller
Message-ID: <6a33cc01-e6a4-4e3b-a629-66fda71d8ef7@roeck-us.net>
References: <20260502-ltc4283-support-v13-0-1c206542e652@analog.com>
 <20260502-ltc4283-support-v13-3-1c206542e652@analog.com>
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20260502-ltc4283-support-v13-3-1c206542e652@analog.com>

On Sat, May 02, 2026 at 10:56:54AM +0100, Nuno Sá wrote:
> From: Nuno Sá <nuno.sa@analog.com>
> 
> The LTC4283 device has up to 8 pins that can be configured as GPIOs.
> 
> Note that PGIO pins are not set as GPIOs by default so if they are
> configured to be used as GPIOs we need to make sure to initialize them
> to a sane default. They are set as inputs by default.
> 
> Acked-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
> Reviewed-by: Linus Walleij <linusw@kernel.org>
> Signed-off-by: Nuno Sá <nuno.sa@analog.com>

Applied.

Thanks,
Guenter
