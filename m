Received: from mail-pl1-f182.google.com (mail-pl1-f182.google.com [209.85.214.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 968B43655CD
	for <linux-hwmon@vger.kernel.org>; Sun, 19 Jul 2026 14:12:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784470354; cv=none; b=TZvBIyvhfdSmiLKyKMuNuZRNX37y8v3EHtKXrFaIMT5vpY5t3uGEjI8XdVLbUG+0KSms0H8/YZtypbEn9AbGioInSpnOuk6vOATZT8hi/mrzajMQVVA0kfCJppi0f9Sy6SiPXe/Wpw+MubRq69AFoi5zSUY6JU1TvezvKTz517U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784470354; c=relaxed/simple;
	bh=sDSdx3XJR4qp69qXEUrD0m6Ioa+1JwUMB3cqHtaKJNo=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=H+kpqeYp1D0AQK8wE87hoHt8EU2sMKRQyRi1UdU1IwhRFvFFDMIOa/NLd+Rb2jpXnvPhn6G9FKZ4PsgZUcu2SQqqKQIOo8WNsp/ToQtvhb9Itxv118Nc0LQ84KavfmjyLnYB+kR9KHzZw7+MrV4adYtAP3Q4MtG/n7XkNCqtxeo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=bBI0wbRB; arc=none smtp.client-ip=209.85.214.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="bBI0wbRB"
Received: by mail-pl1-f182.google.com with SMTP id d9443c01a7336-2caced6038eso41344135ad.0
        for <linux-hwmon@vger.kernel.org>; Sun, 19 Jul 2026 07:12:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1784470351; x=1785075151; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:sender:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=c62E6UXPF1b+TwtrsQRXYpEFv8CJ8R4spLnj/H2F9+g=;
        b=bBI0wbRBOeUs0l4xuTbk0J9gFyho7eIqTkx/Hjn7lNLxTHvb2DFKIKp9qfnSf3cx7M
         DxGPKWagGqSicfWUrA52vW+AANUOWtDsx4MWuLreQS59g56GGy4zIViiXYou15I4ASFI
         Vi8M43b6JQ7PQ7y5p3thCu02vNUUpMl8i1nBmBCW4IOsPyqNssYDDcOOpsexMu9PVorh
         J40t4SwI1EQl79pScZCJiAp5g5rHWU/JVfDEvGUv9WzpgwYIVSVerFovU7oyJ0mQbe9j
         BlayuFBkJjDoMfJSZ8BHNKOUtWLDhbGMJjQQVT/tyhHCVGu7XAFiwfi5lWaKY9Etz6Bw
         nqkQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784470351; x=1785075151;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:sender:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=c62E6UXPF1b+TwtrsQRXYpEFv8CJ8R4spLnj/H2F9+g=;
        b=qSnDjQuVrgpIxHKCfQ2SHWfPNpXSqq5Qw9NouFd+9AixuT1EuLOyJxY8hBAwyUfW10
         doXPtHtedzAOkIBTh9WPAWmxkvFvwMexc7xcPUIqTnu1MA7s7W/DLytL/EOX4wwf2xEe
         9ugPf7SPcaNaTQvLkasfYYHDFqchUJ574iqkddjYffILdErYYFR0hwapM98JmVvys9Hn
         L9WTpQgh+LEskmRztWrd4VidEfZXvhsUWb+6VmRat0h0fg/g4Cpqso+/l8lP+0SNqMEk
         6/8F0GVBQQs0XRR5WepoyaffMRUGGkXR31JYGhxnK/cWQwp/DJZqWSC63fCPAa5kVBJp
         8sWQ==
X-Gm-Message-State: AOJu0YyMP/cA4FeUL6/IwTeUDC46TiJz1mH5DovRdFCWIltlPI9ZYUrd
	8nmK8Jx6YEZ3eSKOxlwZ1KlC4wjh3meuOXqJ/cHKcFgZDOtKz1UOKjLY
X-Gm-Gg: AfdE7cli+AOBZ46SGpy2zhn6XWWonPTvrzN1CtwfsSEFm7ZVbhwxsM7zlAcnWB0jr8J
	DYFyLcSRScPhYXVnxCwMA2neG8PZ5ZYdS6lhjrGjkJAJBWse9HMXXSW5UplnyGBFUcCe9orKSaf
	fSZwPavRNxkp5yFi0fksgWUSQiOiLVT0P6YNutOC1unpMUXYtgTWF1payFoV7/UCjWm7ifeu6Xw
	Q06tndnP4sm/bQ3cQ5SPaL6NygyU68k/8HldGh2W+stvNW7TDn8isMmPU8HTYk2/DvxxKbnpFEB
	qfBuxBGWTGY3V1sdJafohYDC2t0MTB0GM2YZZHTENdnwmcekF05dUYZvjm0fQPv1uIZ9qLQ8vPV
	Po0jCma6GKjmgWRiW5yWSnTc5jqxwL6INHPTmza78pNEvysyApqBVooVc8XLr9WboyCXu+hAj2x
	BP9BvttlbXXqTUjGw=
X-Received: by 2002:a17:903:903:b0:2c9:b2c1:1401 with SMTP id d9443c01a7336-2cf1f255e8cmr186133675ad.5.1784470351413;
        Sun, 19 Jul 2026 07:12:31 -0700 (PDT)
Received: from server.roeck-us.net ([2600:1700:e321:62f0:da43:aeff:fecc:bfd5])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2cf3448f73esm40446275ad.16.2026.07.19.07.12.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 19 Jul 2026 07:12:30 -0700 (PDT)
Sender: Guenter Roeck <groeck7@gmail.com>
Date: Sun, 19 Jul 2026 07:12:30 -0700
From: Guenter Roeck <linux@roeck-us.net>
To: Eugene Shalygin <eugene.shalygin@gmail.com>
Cc: "open list:ASUS EC HARDWARE MONITOR DRIVER" <linux-hwmon@vger.kernel.org>,
	open list <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH v3 1/1] hwmon: (asus-ec-sensors) detect unconnected
 physical sensors
Message-ID: <2e54d44d-96ef-4683-b752-adf04a9f7b6e@roeck-us.net>
References: <20260711122937.594989-1-eugene.shalygin@gmail.com>
 <20260711122937.594989-2-eugene.shalygin@gmail.com>
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260711122937.594989-2-eugene.shalygin@gmail.com>

On Sat, Jul 11, 2026 at 02:26:44PM +0200, Eugene Shalygin wrote:
> When there is no physical sensor connected to the motherboard
> socket,reading EC register returns one of the special values
> (-62, -60, -40). Test for them  and return -ENODATA to hwmon.
> 
> Signed-off-by: Eugene Shalygin <eugene.shalygin@gmail.com>

Applied.

Thanks,
Guenter
