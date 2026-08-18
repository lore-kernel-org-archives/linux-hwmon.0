Received: from mail-pj1-f44.google.com (mail-pj1-f44.google.com [209.85.216.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 600FD37C924
	for <linux-hwmon@vger.kernel.org>; Tue, 18 Aug 2026 23:37:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787096233; cv=none; b=grXD552X6YuvSP7vIcW+1oH1CoSfBHWcjmZPB1EKHC0bR3ZCOkQCco7snPD1emWPLqAzvuQQjsOWr5uo5G0U1cH+/y+YUp3p42XWiv22Vg0wY+NZ+grtGZYKie3H9UfQ5FIHRIdpWHtRKR4uoimBx63L2ArSEjn8Pg69Qf/rolA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787096233; c=relaxed/simple;
	bh=zO5mT6oWpqELdaeWSbBSQLyWiB2W8y/nhFWMCKOQKHg=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=YYjCfSbl1vMFFoaI0JvaoUBAUdi46gTaKR0a7mwWzSLiUGZJDvuznibtxf8811S35b8GiRoZVV4HL10orxxaP2BsJckg0OaF/IfivunYglqZl9n28Vu3QkyP3hCzJpMYxx1uIpB4CxZfJZYDoaSn1K7DmCGrEcU27udjkSAV6a8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=TcM2pwmc; arc=none smtp.client-ip=209.85.216.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="TcM2pwmc"
Received: by mail-pj1-f44.google.com with SMTP id 98e67ed59e1d1-38e42560ebcso478538a91.1
        for <linux-hwmon@vger.kernel.org>; Tue, 18 Aug 2026 16:37:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1787096232; x=1787701032; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:sender:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=spsLyqllbdv8uoHDIT8SHj6pVVShs8FwTfZLnA7RIu8=;
        b=TcM2pwmcrxOn/kVAafraZhHLAiM3wJR9QthSqMhHTB5xikRxzJYkIeHCGlr93aZ/om
         bqunCi/QtUnkxJDGkS9vCGCZdrjiOTrY12XW1T+fi9zwbnQ7Sm58uT/JOkl8Nfi7ok/I
         e5iAsm3YJrPoZtYk1cAwpEkg1zGvcR9w5Q9pbZDD5TbqG6iiYvVh0lArqi/AFGrvIZNF
         zEeoO9XCDkUWy6ZWIDPsn4XS6RHRXE2ZZbuE5JOoZwHM/l/fRNYyuJjHl/z8qpgshaLp
         yZ4MLN0cmwcUMg/TmQZb9bjIA2gg8V3rcEpK40GWRBTSPDUjuBaCEQor747KleMfy+d/
         zPug==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787096232; x=1787701032;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:sender:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=spsLyqllbdv8uoHDIT8SHj6pVVShs8FwTfZLnA7RIu8=;
        b=Az1VEJlOK8ZCAUneH5fnnVkJ4VTT+Ajgls0OfK/4Y8q/+7NfzIaWYzyxCEWOzms30y
         YtQ5epLNMPQm3Pzy3lCS6DNwf5FfXQBy3vRVhGCaMqVSJLFGkXgbVqodOBX6gKyGPCSf
         dOtWNwssoFN33nPzJz1EDfcaCip0ALjZVrS7O/Kh+PG3i/r90b0e9Ph/+lygBP0MfxYT
         kwJrQmox90Vj/I3KA01fpRspEj6/5e2Vy7ihGRI0nBvCv+gaILrd2gXbJiOllIhVVPcQ
         DukWrf7Gl/gXtP6VTcvXN8AxaDcjxz9M+izapZ1Dz2wh2tBXL7694V1J90x4Okl11eOp
         cttw==
X-Forwarded-Encrypted: i=1; AHgh+RoYFjNFh0LVHiAuFzXrPyg2Uk/pVal0zW8ffni+ddPP8fXh9M0Qd3NnKYOs564oMTehqjlAZCm0Rz0f8g==@vger.kernel.org
X-Gm-Message-State: AOJu0YwL6OSuBZJKfsbhX8nhWqCkb0fP+XEFkSBU14P68RT71oY6gaqD
	hhywdspv15pIWR1DY8YdmjQvVCRsY+k82JnmRL0W/zL2ySXrxY7jxhsm
X-Gm-Gg: AR+sD12KHYQO/6/FIt7s06gNQ4b+D6e4+EIcDafjFWnYMFxLZ45ICmxhdAY84kyIR7D
	/FexNjcuQ89bnO5Hn2NSN82f6KuC4a8LWJ2qZFFn/hKsvjJNANB5/gfW68Brme7sKX4M6lZ6wqc
	B+LqcuIph5py4dWFTH8AziYASikLQs44r7LTLQQ7Axmn0Kx/xuCb0NYD+PqNWAVdEAuq58OHrn1
	mklWySwbz8i5qOgVKblUHX+d+HBiizd/Xa54yK/Q4fU11Gl0xRs4oZUM2tVdqyppuBKmq+93o+E
	fLgd57w46MmcSm0+Z86WHYfQGWoHH2QOK5+GyGyMo8AByDJ0VhiJE4ZaJIAavWJdkZlabcwbzNM
	6Mo+4q3z8abv6ZzkkfsX5RxvzBaHg5l1RTsKpQPCte+r43LdGHDccnZC4v8mQzRYgfF+K0RTlio
	PFwUANnjBRWx79DJGSICXZeDjyjfVu526QHJk7GrcsPQ3mpAXHDAktA7lu5pYg09Q7x9nwdsJFR
	HV0BxElR6fq
X-Received: by 2002:a17:90b:4ac5:b0:38f:efed:5445 with SMTP id 98e67ed59e1d1-3958125aff5mr697147a91.4.1787096231751;
        Tue, 18 Aug 2026 16:37:11 -0700 (PDT)
Received: from server.roeck-us.net ([2600:1700:e321:62f0:da43:aeff:fecc:bfd5])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-327bef77bfcsm541284eec.9.2026.08.18.16.37.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 18 Aug 2026 16:37:10 -0700 (PDT)
Sender: Guenter Roeck <groeck7@gmail.com>
Date: Tue, 18 Aug 2026 16:37:10 -0700
From: Guenter Roeck <linux@roeck-us.net>
To: Stoyan Bogdanov <sbogdanov@baylibre.com>
Cc: jbrunet@baylibre.com, robh@kernel.org, krzk+dt@kernel.org,
	conor+dt@kernel.org, corbet@lwn.net, skhan@linuxfoundation.org,
	linux-hwmon@vger.kernel.org, devicetree@vger.kernel.org,
	linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v7 1/3] hwmon: (pmbus/tps25990): Rework driver for
 multi-device support
Message-ID: <01704145-51aa-4d4b-81ec-990bc0da31bd@roeck-us.net>
References: <20260817101455.3526260-1-sbogdanov@baylibre.com>
 <20260817101455.3526260-2-sbogdanov@baylibre.com>
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260817101455.3526260-2-sbogdanov@baylibre.com>

On Mon, Aug 17, 2026 at 01:14:43PM +0300, Stoyan Bogdanov wrote:
> Rework existing implementation to allow adding support for new
> devices to the existing driver. chip_id is used to identify the
> current device and differentiate logic where needed.
> 
> Changes include:
>  - Add an enum listing supported chips
>  - Add a structure to hold per-device m, b, R coefficients
> 
> Signed-off-by: Stoyan Bogdanov <sbogdanov@baylibre.com>

Queued for 7.4.

Thanks,
Guenter
