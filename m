Received: from mail-pj2-f13.google.com (mail-pj2-f13.google.com [74.125.227.141])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 935D035C6A9
	for <linux-hwmon@vger.kernel.org>; Wed, 16 Sep 2026 14:56:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.227.141
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789570589; cv=none; b=QRIXv3I/Wht1FqSpscGJxqYX98pRLEBaQdj0eplMC02Wn5z6SfTdZygzIKUIbiqZxxfF9CYEEUOeTsaF1X23+PppHFAUlIDKn/R/lMaGCi1/xFToKuizkFwP/KhWMCIBLRZDItlYndBySb6yngudCkTJrYYuNbs4SsIy7IBzgaM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789570589; c=relaxed/simple;
	bh=w5hmfYQd5qS6jmp5if4MTfMkG4gKJAqCpM+ctVlrJx8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=WRMGE5DH2m8DblVR0BOAOYSXquYVRGZp7U7CYAyV6Q74sLhYgWXlkATeRktiYXDzB7udRvz+LLTsNIb0OcovTMwqjoena2DNHj+nfGDe7Z9QOq1xtuAggSssoHlUOzvuh62JP3UUfjerqGq+1aVbjApkVPYDf6GbDJgasjWiIcE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=gpsB+0pX; arc=none smtp.client-ip=74.125.227.141
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="gpsB+0pX"
Received: by mail-pj2-f13.google.com with SMTP id d9443c01a7336-2db1ca06a25so7164065ad.2
        for <linux-hwmon@vger.kernel.org>; Wed, 16 Sep 2026 07:56:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789570587; x=1790175387; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:sender:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=fOtt4epAjEgetEW4Rf7UpxEkjN1u8RJ270fhKCbRhRQ=;
        b=gpsB+0pXhV5Fpk8oz8ZAIm1e0F4oG/SJmYb8KutcgEoeU5P5gRBEKrOTTOmuVSszWx
         /sgU9r4nBZP6Ne3OZjTW0ZJNsMaGgR3HYblsJ8JyO9V/bcATeox1PrPLWL6XihGJ12Xo
         U0gemKPW3fIh5pvfnbrYk9orM+IzDKn3hN/2A8Luoc73QZpAITuQ/U+Lyp6AghAt13P9
         323JOe8rt8BB0Q+5IpCDQnnVOJFFN83tHNSt4D2xayA7VQCOxZOiMEpijOypzwSjrMRu
         CV0YVG+9j8Y507nBIm4Hp1LmqNh9sKlMnulMvMb1wWKZlzj0Bhg/MU8TkUgHnkhDvyYw
         YQpg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789570587; x=1790175387;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:sender:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=fOtt4epAjEgetEW4Rf7UpxEkjN1u8RJ270fhKCbRhRQ=;
        b=BDaaWWpfEMe6eh9SQ1m1eqfJ23TmmEa6H3TwrfGHfSYSzl683PwNE0BJfhPLlJwVGQ
         bRt47dvD+aKeZUMxvgmoUFxvhaAOsI0XpKPm8kzW6EecDiyZQEpm5HuEDpI/LlTHgeuL
         5HXHDYPWhnsMGVFlBMBtm0GpzD/ivoTKyXY74sTcrqf4DrOuZtk1kVbplebUu6dm8fX5
         1+myCkyL9+V+Ywl4vdOp/OGSWusZ7FIJxV8s0C3GXQrJsNkJipNdpyXglTd9baYT6A9k
         rXcO/znGLOKGjsNbG6Bb1g+APfDRKpIoZiIcabFLhcZBpojUrQW11YkElrZ+560O3BTk
         RuGQ==
X-Forwarded-Encrypted: i=1; AKwUvByf49KWFBUuRl1f0pmfqq+uAZ0ZuJBpNThQvyS2rag5PxzrrrisPAEe+Ye6v0T6/J7I6PUbnIqvoV8aag==@vger.kernel.org
X-Gm-Message-State: AFuF++mSxDvXkORh+TT69n3CzWoi28ZcOtCvWk4q/h1LX3LmkS3oWFPp
	CtdJVobX/z9upCvKDKcpMvdpmz6XH6/cCfsuQq7auKFDIAxVi8QAd6ni
X-Gm-Gg: AYBFou16oDjd1rg3ubwSfHEPdeCDZ0DHtp3VuR2UXbDmnDrM6OvPEPH1IR2MKidIpek
	tOSJ+DpMyE+kXgXZKcV6FOkNS1Buo826Bafyl8EbPWuBeqaoOTqZQEmGeZHFuO7j2pqIUQ5hsZI
	kU+DNreLWT5f9VJ5uG7t1zTlyU3AGFdptrvtqBxGv0ahCPgtmf1kQAhenMSJKmBq50oxE2GOGC3
	axbcUE3F8jyEDQdWGgEkdUD92rkSJXPg12I8UUaPBjPikWxqgSRflo4Fb/IhM0wcb8K+yIIIs2c
	ycDQFZQOiRfWNcU63hAGKTU1gNjjo/rbGCb1GuI4mWAEfJMgi+oG+WW5rQ3FJD4K0+p3mfJM2Cn
	E7ouZFP6h8k+hgY3tJqFvBlbBGWvnYN0H79qed9YCcNDx/HTOBK420Qt9FwQbjOwEw4uPfjX6hE
	LYYUfNM6p6GNCNz+3AS0Q7PSDpAhXsfYBQG8AozfmcGpvj+grYHOIFRK+z9YBg0/MLsPINHIT/8
	dNFXzRbKpqc
X-Received: by 2002:a17:902:d588:b0:2dd:7593:8634 with SMTP id d9443c01a7336-2dd8e412565mr65993445ad.13.1789570586585;
        Wed, 16 Sep 2026 07:56:26 -0700 (PDT)
Received: from server.roeck-us.net ([2600:1700:e321:62f0:da43:aeff:fecc:bfd5])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2dd89d8fe00sm13413325ad.12.2026.09.16.07.56.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 16 Sep 2026 07:56:26 -0700 (PDT)
Sender: Guenter Roeck <groeck7@gmail.com>
Date: Wed, 16 Sep 2026 07:56:25 -0700
From: Guenter Roeck <linux@roeck-us.net>
To: "Pradhan, Sanman" <sanman.pradhan@hpe.com>
Cc: Jonathan Corbet <corbet@lwn.net>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	"linux-hwmon@vger.kernel.org" <linux-hwmon@vger.kernel.org>,
	"devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
	"linux-doc@vger.kernel.org" <linux-doc@vger.kernel.org>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
	Sanman Pradhan <psanman@juniper.net>,
	"stable@vger.kernel.org" <stable@vger.kernel.org>
Subject: Re: [PATCH v2 1/3] hwmon: (pmbus/tps53679) Fix TPS53676 phase page
 decoding
Message-ID: <c0a3c877-eeab-4cff-ab2a-bb567f0dc3d1@roeck-us.net>
References: <20260915164823.160977-1-sanman.pradhan@hpe.com>
 <20260915164823.160977-2-sanman.pradhan@hpe.com>
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260915164823.160977-2-sanman.pradhan@hpe.com>

On Tue, Sep 15, 2026 at 04:48:35PM +0000, Pradhan, Sanman wrote:
> From: Sanman Pradhan <psanman@juniper.net>
> 
> tps53676_identify() reads the USER_DATA_03 phase configuration to count
> the phases assigned to each channel and derive the number of PMBus pages.
> In each 16-bit phase descriptor the channel (PAGE) is encoded in bit 4 and
> the firing order in bits 3:0, but the code tested bit 3 (0x08), which is
> part of the firing-order field.
> 
> TPS53676 supports up to seven phases, so firing-order bit 3 is never set.
> As a result the existing test classifies every enabled phase as channel A.
> On a dual-channel configuration the phases assigned to channel B are
> therefore miscounted as channel A and page 1 is not exposed.
> 
> Test the PAGE field (bit 4) instead.
> 
> Fixes: cb3d37b59012 ("hwmon: (pmbus/tps53679) Add support for TI TPS53676")
> Cc: stable@vger.kernel.org
> Signed-off-by: Sanman Pradhan <psanman@juniper.net>

Applied.

I'll fix the other problem separately.

Thanks,
Guenter
