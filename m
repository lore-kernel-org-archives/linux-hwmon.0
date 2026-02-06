Received: from mail-pl1-f172.google.com (mail-pl1-f172.google.com [209.85.214.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 19BDF199E94
	for <linux-hwmon@vger.kernel.org>; Fri,  6 Feb 2026 06:46:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770360392; cv=none; b=PtWlpacNdCDTLnKALDmmDoBT3ZTD4SNtP+zoKU8wep/bF8BH37AYx59gDFsxx4Y9n6xoHBxo8R18oZniZUXC12yKEhl7Hy/7yExQ6F1CC3K7ii8s8b4n2mfdjsiZaSY7QszrpRrKmiIDYfjN16aL8Xdn4HASe+B3MKExdiuEXY0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770360392; c=relaxed/simple;
	bh=WiVCL2N7W7Z83sa4da1RkbscoHvjHZG2CD9WHgQ1Oe8=;
	h=From:Date:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=e8SSZZnGROY6xI1dCMxILYW1/JzqQrKd0L8Ue2yOzjKK3umUQBC2mEQWROWTlQEbBekpuUUDVtdRehn5FBeauvp1MET6jr9SSf2FGnoB83I9cZNgMQBo5cq5pfYDcZmLFtsirwfmJF1k6IelS8wfwNdEREJb2KmTaObkH6WmK/w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=J8boQzC0; arc=none smtp.client-ip=209.85.214.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="J8boQzC0"
Received: by mail-pl1-f172.google.com with SMTP id d9443c01a7336-2a929245b6aso3366885ad.0
        for <linux-hwmon@vger.kernel.org>; Thu, 05 Feb 2026 22:46:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1770360391; x=1770965191; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:date:from:from:to:cc:subject:date:message-id:reply-to;
        bh=xFavTOM5Ob1Mhf/gDvrOoo/QZ0J69oHZtkL9VA2e+uw=;
        b=J8boQzC01eLJNaBXu3gkKRoDjtQSxetodoACWsKefCaJwYMCE21zLrYeHw84e1PWvt
         8J3wnM7gJ81w+12H7at5NytIUjKznCAZwbgvLucxoBcHmt1bDRGAoYohzWDd345z+7ln
         htt7ogkHl4UQdY1mSU6C0pGcv5h8d6CEi8pXZcMy2Fqyi+SBzl83pq9oWGX8tbVRo/Ov
         a1Z+HwNE5sfvQjxzQNKSCKNAFsqBrmHIVknHgZus0IyZrEXLaGWiskWNmFPTLGkL5ONX
         lSNaafVoYs+nURBYHwSmMUSzfLkvSsPD63tR1pcMxvrVC78qmL7OIsU5pfEYWXuqInTf
         e2YA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770360391; x=1770965191;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:date:from:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=xFavTOM5Ob1Mhf/gDvrOoo/QZ0J69oHZtkL9VA2e+uw=;
        b=SjBuShHIeoCXYsxuR8oCKX/tAtScQR9yWjYK7lyKeChByduh/EsC3+JezKcSmvHcwC
         ELNncPtGpeENfH2nb7aBqurPuJ2VFstdhvh13Ict2CxCX0PDjj/aG3DBaXzo5p8a6ARy
         auVcmY4tzqWdNFx4Y0LxnsGCyohBs0DsiVeWsHiWEXMfKJ1hPbuRHo1akIRWqrJbuvQN
         cu/M5tV8oItJ4zSLWM5ivggba9xnw6uzelv+fllCD1kRORV/DAePv8rfbSUEkYjXYuMi
         TqFu3JEtnwFBUJVv8KEanR7/oY6FWyZdrEjuKrmJMP24wsSyubAU0UCB4Xit4m2YNn7v
         Z44A==
X-Forwarded-Encrypted: i=1; AJvYcCUcRKOJR2ELKmHJYm4Cf0JZECvxNqAOomMO9MZu5+lgX4fnmMtfJN53kjlN24FbdIfX6hkIF94FoCYaQQ==@vger.kernel.org
X-Gm-Message-State: AOJu0YziDHMEUUdzfLfjHyhlcDKcIDIf8+Mtb89VQ55SPLiutjpDJR/6
	0YLWLGs73SU7SM9t0kYL4LnkceHoS5L29GYLtmVHEOfpSh3G26Ed/gH4
X-Gm-Gg: AZuq6aKbncjmBfYKtgrBQu3erb3QVyV5DDg91i6Tzj+oFGtyYjxiTYoYFUD1ofZIngp
	Mr1uB94Jv6qG1QsC6ydb3VOcx046UDXsfYGNmVNzjk+sCQ8aXj+cYwEx1aBBy4SoqVsSO9ySEeP
	/3Q681EezfatV5ufHcTGueRLp2aFYV77f3zwYf4yUtT4Ko6pIb/AhXHtB4MSbRMHHcrYPV28jm4
	KDDIXunEXolj42FS/ooA/+wmWdtLXed/mGIDL8QDZTCEXjQ6on2n+XidDFUsMiYxoQSuuS9K3BE
	s1OG0fXhbe0zTOePsX4qvSwSGaEMdbdwr0ULuAhV5XRkc/ep1I2COmx0Qug5Ppgw4i5AxACkw59
	Uc9eGg0YEUqEUMWPuY/id11jt+exDiPUKkgRSNGiGm5yh+CnVJTPiz72RkXIarp/HDAs7RPUrum
	u1Lvme/h3bYpRN
X-Received: by 2002:a17:902:ea06:b0:2a9:4cab:f4f5 with SMTP id d9443c01a7336-2a95192a995mr20043405ad.38.1770360391460;
        Thu, 05 Feb 2026 22:46:31 -0800 (PST)
Received: from localhost ([218.32.81.133])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2a9521b8d79sm13229505ad.61.2026.02.05.22.46.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 05 Feb 2026 22:46:30 -0800 (PST)
From: Carl Lee <qq1145099@gmail.com>
X-Google-Original-From: Carl Lee <carl.lee@amd.com>
Date: Fri, 6 Feb 2026 14:46:28 +0800
To: Guenter Roeck <linux@roeck-us.net>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Charles Hsu <ythsu0511@gmail.com>, linux-hwmon@vger.kernel.org,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	peter.shen@amd.com, colin.huang2@amd.com
Subject: Re: [PATCH v2 1/3] dt-bindings: hwmon: pmbus: mpq8785: add MPQ8786
 support
Message-ID: <aYWORPv2goAEfIgt@carl-amd>
References: <20260205-dt-bindings-hwmon-pmbus-mpq8785-add-mpq8786-support-v2-0-3744cd9b2850@amd.com>
 <20260205-dt-bindings-hwmon-pmbus-mpq8785-add-mpq8786-support-v2-1-3744cd9b2850@amd.com>
 <20260205-cordial-warping-pronghorn-aeebe7@quoll>
 <79a6a2bc-4894-4ff9-8a11-5ed71195cf09@roeck-us.net>
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <79a6a2bc-4894-4ff9-8a11-5ed71195cf09@roeck-us.net>

On Thu, Feb 05, 2026 at 08:17:07AM -0800, Guenter Roeck wrote:
> On Thu, Feb 05, 2026 at 02:46:29PM +0100, Krzysztof Kozlowski wrote:
> > On Thu, Feb 05, 2026 at 06:01:37PM +0800, Carl Lee wrote:
> > > Add device type support for MPQ8786
> > > 
> > > Signed-off-by: Carl Lee <carl.lee@amd.com>
> > > ---
> > >  Documentation/devicetree/bindings/hwmon/pmbus/mps,mpq8785.yaml | 5 ++++-
> > >  1 file changed, 4 insertions(+), 1 deletion(-)
> > > 
> > > diff --git a/Documentation/devicetree/bindings/hwmon/pmbus/mps,mpq8785.yaml b/Documentation/devicetree/bindings/hwmon/pmbus/mps,mpq8785.yaml
> > > index 90970a0433e9..aec7397a29f9 100644
> > > --- a/Documentation/devicetree/bindings/hwmon/pmbus/mps,mpq8785.yaml
> > > +++ b/Documentation/devicetree/bindings/hwmon/pmbus/mps,mpq8785.yaml
> > > @@ -19,6 +19,7 @@ properties:
> > >        - mps,mpm3695-25
> > >        - mps,mpm82504
> > >        - mps,mpq8785
> > > +      - mps,mpq8786
> > 
> > Your driver code says they are the same, so compatible. Express it with
> > fallback or provide real rationale in commit msg.
> > 
> 
> Agreed. The mpq8785 datasheet is public, but the mpq8786 datasheet isn't.
> That makes it all but impossible to determine if there are indeed no
> notable differences between the chips.
> 
> Guenter

There is no chip-specific difference in the driver code to justify
separate MPQ8786 support. 
Therefore, Therefore, I will use MPQ8785 for support.

