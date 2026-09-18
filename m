Received: from mail-pz2-f42.google.com (mail-pz2-f42.google.com [74.125.228.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5D2014E50DA
	for <linux-hwmon@vger.kernel.org>; Fri, 18 Sep 2026 16:07:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.228.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789747631; cv=none; b=I8fPsKn00sNf4Ca2/rtdATDhyZbORQAr/tRskHaKu/ACXyhdefhkZmrZwE6t4Xrbc1muWw4QIuwrkzGA0fJuvUZk23n/OcG4VG2H+ngQ9bndoHHCnDthi8vcdnybD08sQNk+fkkMb0E+VBg6gP34laQbZ2PSAWiK34p3Ymv8k3g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789747631; c=relaxed/simple;
	bh=+fXFt1wmuGm36I/6m2mLaabGRHYph3PCUFE2O+zRlTA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=HxQ/3hU9/O1u5CZpmMGfYUpPOBS3KP9sVod8kWS9j4TjR7VTXtvxLljUCwP/ivDRofLt5efirBsTMrubEfJdpoWDwKhjsVBt9oFfvHVVcPcypKHAjoAbZztKPe/SvRaQ1Go+L6TlBnGBSu2m8WvArE3dL/x9+7iUx4wevXKb+dA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=oMz9yvFz; arc=none smtp.client-ip=74.125.228.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="oMz9yvFz"
Received: by mail-pz2-f42.google.com with SMTP id 41be03b00d2f7-cc1cea34ef3so851744a12.0
        for <linux-hwmon@vger.kernel.org>; Fri, 18 Sep 2026 09:07:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789747630; x=1790352430; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:sender:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=+a91oW+XEpT6uwd1XGhqfpSXASpWO0V95HM9oxBjsHU=;
        b=oMz9yvFzVJohjoZAp+3wAr4UODJZWG7XDCY6QTsLxsQMUPcI6fb5KI6L508ICcRQEY
         wEAOxHpqxQrDEoNX5pYCniZ3pEp8tkQ5kbMBTtlRBFbj4gdGD0K7Punxoq5Og2DlLKBQ
         WhzGR7PP7FOy/OOqTMoUCsklyCtN261Tcchk0rtquY5REReuy6OSQ4g7cnkc0yjH2ton
         hiI5KrRfQxToUfYWlZ68BQVah39K0TFbAi2NdG9ty7scEd1b4yqeQ4Q604hVi5XGqV6F
         n5PFEePLChw1MFUb9CHiVdzPcBVbHLwrIN3CBZiIXE9ORpFbQMSP3XFgxxT8RuNFfhwY
         a80w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789747630; x=1790352430;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:sender:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=+a91oW+XEpT6uwd1XGhqfpSXASpWO0V95HM9oxBjsHU=;
        b=MFKXpHZlWgC3yarx6e/QUUfYCMtKEKAtMykFDDOMp+OTdjWX0+C0Ew0xHbca/CQd/t
         Rk6AZYBUCj6rpUGJyTLAp9iVokpDH0fys0oYeq2zl60jwNsD+j0RPAviM6P9R7QaJ8eJ
         AyvKJhLZxi4R/ci4LcA5BPtXneYaOpCwE/3DR/Hh8PvH3AarTjWlE+RTrqsk7TYepfRQ
         2/uzS/4XkXBgvZoacthvyH/PAzDPqBi2TbcAN7cULYbotesvfI8bwQQhxhCOP19I0982
         d2KeW+2+11HDACtMe2qEWw9kDegyQNDDAPQpZjiZxKx6FN61zupoJaaPZS26EIkf6zYd
         dgIg==
X-Forwarded-Encrypted: i=1; AKwUvBytUM5qCKxJK5hVCyrx5PGh0Cvpg4FlnivwgffkK8eaWkXaGHY529VgEZRvNytCmH2nDY34EgNP30aC0w==@vger.kernel.org
X-Gm-Message-State: AFuF++mhEVkKT38p6LtXorLNns0hH86pnrrcuIpLmYVvW8pl1mLZ4PGB
	5yeFkLP2dMGD63u3Lk5XreYfyjcutBEcOXyHM+vTevfGWiCg3bHdyMii
X-Gm-Gg: AYBFou0ZtFHOWEL8EBdUqy5WMHw6a5fCuUc5NITFb/6FuStVuMG01osCIvy90/NaSdQ
	gU4FkZu8bbqbFJEfV2ZRlNm316+04ymo4WqIVslSe7XpjQstOh4+OXJT0Tx8cAgL45/vTwBFNmB
	jrtp34Tyw+kPWAHuJFzq0tmaFPXYLYaqIfxRgJj7Dq8ZlwOCrvztP4iBXs80kaI8HifURybAIAS
	4hC9vqgvjljtEcnWnxmCLetXnRvbuZA27LqXct79TL9cNGh4riW49SlAUFMXAnLj5Y+p7tto7BP
	FreptNbiHiLc7kT6uQ+IZVUUt5xoKzbvzBvPBQuKCjPqXMJMVJPf/Ye6fM28XiEpJiyD2RovbIO
	OROpAEAjwnFuIOpX3mPhyz5oQhf0Ejzj3qqFjMW0KHy+roD8MXi15QZMxIc9XyRd+cUxFZ5FqiX
	hxop10aWBPfci413LjyfArHEKU6+O90MsWQDMcWTnJu8OPWmIgEE2p6MTKGnLRfbT51o05R4BUy
	AXk8A1n7wt4
X-Received: by 2002:a17:90b:28c6:b0:39e:6a82:afd2 with SMTP id 98e67ed59e1d1-39e6a82bbccmr686160a91.36.1789747629623;
        Fri, 18 Sep 2026 09:07:09 -0700 (PDT)
Received: from server.roeck-us.net ([2600:1700:e321:62f0:da43:aeff:fecc:bfd5])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-33c32da4960sm39043eec.0.2026.09.18.09.07.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 18 Sep 2026 09:07:09 -0700 (PDT)
Sender: Guenter Roeck <groeck7@gmail.com>
Date: Fri, 18 Sep 2026 09:07:07 -0700
From: Guenter Roeck <linux@roeck-us.net>
To: Quchaosheng <quchaosheng000406@163.com>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Sudeep Holla <sudeep.holla@kernel.org>,
	Liviu Dudau <liviu.dudau@arm.com>,
	Lorenzo Pieralisi <lpieralisi@kernel.org>,
	Jonathan Corbet <corbet@lwn.net>, linux-hwmon@vger.kernel.org,
	devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 1/2] hwmon: vexpress: point the DT binding reference at
 the schema
Message-ID: <93b9a44c-d595-4ba3-afc6-eb6abf0c17c2@roeck-us.net>
References: <20260917115818.540344-1-quchaosheng000406@163.com>
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260917115818.540344-1-quchaosheng000406@163.com>

On Thu, Sep 17, 2026 at 07:58:17PM +0800, Quchaosheng wrote:
> Documentation/hwmon/vexpress.rst points at
> Documentation/devicetree/bindings/hwmon/vexpress.txt for the device tree
> binding of the arm,vexpress-volt, -amp, -temp, -power and -energy sensors.
> 
> That file only restates the compatibles and the label property, which the
> arm/vexpress-config.yaml schema describes now. Point the reference there.
> 
> Assisted-by: LLM
> Signed-off-by: Quchaosheng <quchaosheng000406@163.com>

Applied.

Thanks,
Guenter
