Received: from mail-dy1-f178.google.com (mail-dy1-f178.google.com [74.125.82.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3EEAE38F928
	for <linux-hwmon@vger.kernel.org>; Mon, 29 Jun 2026 20:50:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.82.178
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782766227; cv=none; b=GEa5sGSdtCRr9ExdgTqkI9N0c65BuQmrhrsksv0RGlckDUK9PZ9N+46l5ODV0w3/boTlK0Y0krR1jin0MnGSIZgebymc8VfygAy9GwK+o8BLLf8tL/ai5JfUrSp5Pvj2tmEg1FJpQyji23dM03r7YKvGaKkb4rEOMwgNtkvIVi8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782766227; c=relaxed/simple;
	bh=8fYnHWOjIGDoEVW4QUcUqte5TlJTJSzKFqD+rg6fWjI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=hAv4Et0/ptDVy0JH6TRhCXAsBn9gz/1U2BkNhZsaKX2PZhssMHeLlxtXygAISfPtX6qFloXSXLcPK+xW2S6eDWokBqa6KKillV94uzIEiiq7izHGGbVPEiODYlgacfnveCzFQxS+Lj6M85vH2vfsANCUeUoIM/lNXDEng/hnJRg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=QkkAA582; arc=none smtp.client-ip=74.125.82.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="QkkAA582"
Received: by mail-dy1-f178.google.com with SMTP id 5a478bee46e88-30c965eab27so7266360eec.0
        for <linux-hwmon@vger.kernel.org>; Mon, 29 Jun 2026 13:50:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1782766225; x=1783371025; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:sender:from:to:cc:subject:date:message-id
         :reply-to;
        bh=m1XNSxJ4D6J3s4BjsJOYsu9zhwn3BzANnpB/97fW3CM=;
        b=QkkAA582JQh/rWEAe4hHNa+XGYD+5hRbUqcjYKmwhRLSdunt/znGiIrqCPX93YStR3
         s2lE4ZiQJK6KQRVt2WCpwGLxA2FKXjv2jxqMlVis7bGoLLIas0LvhqSN7UmECP6DGPwz
         dfjla/VDCZegdvnVxHDEvVP+iuaQLcUGQJaruIpHzHa9EIXsRKMBno1DkgCUZ2VONl1f
         RjFgQ357fHgCgVqcNAIOs6vExT9UZqknYBIznq2/7Bau4TyQVSyY9n9aXfU6JxMsiqdM
         h2KDA2Q4FMciRT27zMXVE1IuYGfH2IXs618SEuQyy+sbCjyKacJALRU7NUQqIjLutTB5
         W+FQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782766225; x=1783371025;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:sender:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=m1XNSxJ4D6J3s4BjsJOYsu9zhwn3BzANnpB/97fW3CM=;
        b=PfpVhxpt12Qlnf/1uYYAi0c2LqFE2Hp3uhs/NHMoyj2IRZ9e5Bmv2NMMAnOaiXRh8P
         Mn5lsULVYUDueLNMaiCOYBtNDXHw7dddBth3bYbCUVxLA961Ta9OizQmxUb4xbLyXbyK
         q1axPASHuxTacsYJQwrbIs04HVsw8nce3mtYHIehO07mPraeAtfxYGvq+SMEu6j3EMz5
         LXkGyw7YvvLXWsahIup4Me2Hp3ePFNy32LR0g2fiT3Xr01eW0Y3UG46f4257jK+rINnR
         rx2pH4e8eaK+nJn2JpODnfQzXfmQ73a3JtPlIyFho4g6ZguNVgr8BYp2PVUCOBSmW8is
         eDMQ==
X-Forwarded-Encrypted: i=1; AHgh+RrLzekwDozI6+j1EIdas/EtOcsFvcKi1F3XvoGz19YlTwcf7ACJ80ITqu9kM3jEdRu2R2cbGGkS+VqnXw==@vger.kernel.org
X-Gm-Message-State: AOJu0YzoSrSH09nYed57IP27E73l6TsC+563EqnpkiQ8pZr2T0KJMxrQ
	lxt7QlpvjMZcTiNxf+tjaLXxhoRO8yNOYQ9Z6mgtoG5tPWQKG2bk76BC
X-Gm-Gg: AfdE7cl63meayKMPO4IlPS1TCaTakmVaF3TO6/xzbZXhu+ST2a5tP2CcIj1RyXyjAe8
	fnOpmWov+QqdBJgNb2SiDSx/cD2Mk3hWtb1OfBe3Lq6kRRCnF00nkawc3FsrWm3zy3zeTL/8Djc
	mktL1ZSEj3aKBskFiK6dHAL1A2gxU/n+hWOrpr7/KhkjO3wWXYu8yRsHbqtgt8Kh2CRDCuSFgO+
	zRvkSitmhOVAgt+YojsJ+MNr8eZagn0b3//6SVAnO/FY5GgoQN6SFKrSX1z6/RCPPhPQSLlm9D7
	XevbuS9L4ovaHBKX2qlleWbxzgw3rZFCBDLv00TmDU9kCKdHK7wuEGYEYDwqcdY7RoiN9V2cvQz
	AqZUTbQIWyG0po/YQ4+ieTnaWf/xLARxWb/wuad0p0YeKTGa8CzHRpnQvcVKuw34um+5nXfKhte
	mhD7P3zCxplpCu2tDQ5m1HOOxneg==
X-Received: by 2002:a05:7300:2150:b0:30c:57ff:454e with SMTP id 5a478bee46e88-30ee126ec69mr669952eec.18.1782766225159;
        Mon, 29 Jun 2026 13:50:25 -0700 (PDT)
Received: from server.roeck-us.net ([2600:1700:e321:62f0:da43:aeff:fecc:bfd5])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-30ee32519aesm768589eec.27.2026.06.29.13.50.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 29 Jun 2026 13:50:24 -0700 (PDT)
Sender: Guenter Roeck <groeck7@gmail.com>
Date: Mon, 29 Jun 2026 13:50:23 -0700
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
Subject: Re: [PATCH v2 5/9] doc: Add ROHM BD12780 and BD12780A
Message-ID: <dcacd00f-a976-4699-b8a3-28c775baed8d@roeck-us.net>
References: <cover.1782458224.git.mazziesaccount@gmail.com>
 <5ff4a4a7a939cd642522fde407b5c9fa123a7089.1782458224.git.mazziesaccount@gmail.com>
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <5ff4a4a7a939cd642522fde407b5c9fa123a7089.1782458224.git.mazziesaccount@gmail.com>

On Fri, Jun 26, 2026 at 10:24:38AM +0300, Matti Vaittinen wrote:
> From: Matti Vaittinen <mazziesaccount@gmail.com>
> 
> Add the ROHM BD12780 and the BD12780A to the list of the ICs supported by
> the adm1275 driver.
> 
> Signed-off-by: Matti Vaittinen <mazziesaccount@gmail.com>

Applied.

Thanks,
Guenter
