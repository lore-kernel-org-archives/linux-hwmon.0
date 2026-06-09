Received: from mail-pj1-f46.google.com (mail-pj1-f46.google.com [209.85.216.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8454741930D
	for <linux-hwmon@vger.kernel.org>; Tue,  9 Jun 2026 13:11:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781010699; cv=none; b=L+1eD+r7ZWJkNBG3Pr0H+gTKSwLKd/ECh0z+hUbChTSy/37iCfxH8lWcjT708ag257bBXDleEY7a3d7v/3S0w9/OMmfY61ndYMCDebeHLBy1ey4ZvEGWfebTEp1XydQ1yxnx7GgmuDdBfxcwjPZ3dJlrgxl5IJ8jgb7E7N8bE3Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781010699; c=relaxed/simple;
	bh=WyAKduLCMGnVe3az+1XfuhfLUA7dhySTaltQNSFgz9c=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=fxcOjiNBjqh47MN/Fr75w/sw7CE27bQkwhDXvbpFLV49SrKu44nyC1azTbR9Enni1TYPQhg1xzNgAtVImOosTIRFUR5Nzyux2+C0lK3AKCj1fD2Mtix8H5jlMqrxJbTqy2Ajx3WuHnfbUMJV15z4m2vPNzb3NMx+U+YD/xhLRdI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=VrsTH6UY; arc=none smtp.client-ip=209.85.216.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="VrsTH6UY"
Received: by mail-pj1-f46.google.com with SMTP id 98e67ed59e1d1-36b903567fdso5526263a91.1
        for <linux-hwmon@vger.kernel.org>; Tue, 09 Jun 2026 06:11:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1781010698; x=1781615498; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:sender:from:to:cc:subject:date:message-id
         :reply-to;
        bh=5xcify0Qdew30KpnZXUI6haw96MR9x54buI9R3b+UtY=;
        b=VrsTH6UYg/jqJKs9uik6YNWvGN5L2oPnf5L0OkjxApecuJjTMdKX4c2kTZ/atn7VND
         5UshTj3heA0Ou+LavsGtUiyOzN/CcKjsYdtQdbH7H0qSlli1b+IbJA783pHzASl+obAc
         n9j2+cKTaXKe2pJ/73Fggszhcwt19v+gAEoDzE/72VQRViVpBI3wMdXOvf/xN2PbUja+
         5DGd/SPF++ZjB6Fh1jiJdg4EZ3gVojNpa6an9VOXeFe8ihvuf+lo7el8thhpBf0lZPZl
         8rIY6VNinec7g5QdCwrxTf7qFbkhoyqTpEx+Xs5mAvjwZ7XrCwaQN1+5OtnXxFyttBI5
         XisQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781010698; x=1781615498;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:sender:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=5xcify0Qdew30KpnZXUI6haw96MR9x54buI9R3b+UtY=;
        b=LKa+PdwSAm3AfI2CoMGzkBgUB3pxAzNGoBi/OPsNHaiGcewx0d58KW/GDEh1KLwlOf
         /WNMnoVz7glKtRe9j2YgqHHXVkSo/hNLwW86v7pWlI76sfhlQ+dkXewmAGqEML5VXG8N
         qjvpTySSw1NzGf0J+8NzQ0gudG71xDr2kaCHV2Eaga9/BIWjyZXRkRuFpXWbKVazxe32
         LnlIJdWZoCr1uEd8yR5VvLlI2jAqVASWBGKIr0VZCuyDHiqvfrgykrXVnTRcyNUjTnji
         ZGHZPECdaehd4X4cnjka57AuW2YOpYVWNQQNyiGU2PlhxJv8YZhXNjTuTbJGwfHrPs5/
         S6YQ==
X-Forwarded-Encrypted: i=1; AFNElJ8oYIv8Gz+jD6pbore5kZH4q84+lwDIzG4PwTas9ukX/vl4r2p8GaiqZigFLOfV//uVhNw7fhISTQbQuQ==@vger.kernel.org
X-Gm-Message-State: AOJu0YwE4/XFpOHAPRyqUnOkyRbp8Yicp9xgDqX+CC8NNQL3ps+6y+KT
	mcB7qqxTPcrKkyFUzmTIF/OgYpClmJLfmzQrIuEMefiJqKHIoP4gTAhR
X-Gm-Gg: Acq92OH8ci/C+IkPTylhQaY873YyMSlEzNrufzQ72wsUbL4OyE6Ymw+elXYjnqEhZqa
	XuAfrBUg4wOadptmkcNB88Ly0XGUDriqFvS8L6G0qEnc08lhatPvQxm/LGgAI4UiZFSfvD3/T08
	EaLmrQHYajmv2Rq48zBXleXwnRwtYrkuVZS6/ZlwXxtW2rfblU/sy0bM2YkblMCVkG2heJTTj/B
	mA7Y4l9rr7kbxlzDeAUQhcQCjxvwG4Mn3JMREm7zSyeUOsPMk9IW/KtaPXZR1jwEjXSvg9wVGoh
	ghe6txgJBB/NEiCxsZocUr6XJ9tnXkws3LBfoQBaXxUqDRsfQIGQ3B6inZ7eQM2inmg3btg7tDi
	BLqWtZfb262/kkMP2DaIjThWm0ja0HvBXeXEOAJ77ghmo8DoOa4DqnfXNbOUgQKZRht4VG3/5sE
	TAFw4J2WZ/NMO5nlzCahH8EgsSb7GozrVxxYB2sA4JYH+EKeE=
X-Received: by 2002:a17:903:291:b0:2c0:c940:dc32 with SMTP id d9443c01a7336-2c1e821dde8mr241031805ad.16.1781010697863;
        Tue, 09 Jun 2026 06:11:37 -0700 (PDT)
Received: from server.roeck-us.net ([2600:1700:e321:62f0:da43:aeff:fecc:bfd5])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2c16609df6esm232985455ad.48.2026.06.09.06.11.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 09 Jun 2026 06:11:37 -0700 (PDT)
Sender: Guenter Roeck <groeck7@gmail.com>
Date: Tue, 9 Jun 2026 06:11:36 -0700
From: Guenter Roeck <linux@roeck-us.net>
To: ASHISH YADAV <ashishyadav78@gmail.com>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, linux-hwmon@vger.kernel.org,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	Ashish Yadav <ashish.yadav@infineon.com>,
	Conor Dooley <conor.dooley@microchip.com>
Subject: Re: [PATCH v5 1/3] dt-bindings: hwmon/pmbus: Add Infineon xdp730
Message-ID: <f55678dd-3979-48d1-8df9-650af1935e37@roeck-us.net>
References: <20260609072231.15486-1-Ashish.Yadav@infineon.com>
 <20260609072231.15486-2-Ashish.Yadav@infineon.com>
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260609072231.15486-2-Ashish.Yadav@infineon.com>

On Tue, Jun 09, 2026 at 12:52:29PM +0530, ASHISH YADAV wrote:
> From: Ashish Yadav <ashish.yadav@infineon.com>
> 
> Add documentation for the device tree binding of the XDP730 eFuse.
> Rename node to efuse to accurately reflect its hardware function.
> 
> Signed-off-by: Ashish Yadav <ashish.yadav@infineon.com>
> Acked-by: Conor Dooley <conor.dooley@microchip.com>

Applied.

Thanks,
Guenter
