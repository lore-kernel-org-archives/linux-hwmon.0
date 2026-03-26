Received: from mail-dl1-f52.google.com (mail-dl1-f52.google.com [74.125.82.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 05333399006
	for <linux-hwmon@vger.kernel.org>; Thu, 26 Mar 2026 23:41:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.82.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774568515; cv=none; b=EcOZXPMNBtF8+MFcVghmDYrFYjTmE5EjLo1MMaA15Fdw1rEHYaFL4OtHnZEzJfwr/RRkTpXfr/vvbX62f8fADksR5N2LpwdoIEQyyTp1d0kp9iuYfrdoID2BuyipiaK9vlBT1yiCp1q/HhAQ7DKw+n4kvXwT3hCDpndQlr8DcNo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774568515; c=relaxed/simple;
	bh=wLNVqqkgkjpLh02zN69TDkswZC8LrMPcqkNu3Wz8xeM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=MI8kQsGBz8tkL+UpFNpJuw+w3qbyMrhSCoW7oNNGoc3gvzgKVQ/wfNBqd96qGDucVkoYCs+MnKRvHPgPGPRpwelIsaljW5iDy+ldVB7W/Olks61M79aigL3wu+eoPANQqmgQbYTwjSsb1XTYM4Yr/ScLXfXWAboXqN5tyJmHXUY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=TJaR9D3v; arc=none smtp.client-ip=74.125.82.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="TJaR9D3v"
Received: by mail-dl1-f52.google.com with SMTP id a92af1059eb24-12732165d1eso2460499c88.1
        for <linux-hwmon@vger.kernel.org>; Thu, 26 Mar 2026 16:41:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1774568513; x=1775173313; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:sender:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Fjpw0XE1POB2xyzzpU5ngJZ+3VRiymuSVObA/a0MFa8=;
        b=TJaR9D3vgjvzvctMZXbb5KB+MLpbdlX9/bZu6FTVStkC7fmIv390squBP5nrPvzYEG
         iY3hMxSyEpLh4gUoqEQ6Y/48pkIflG4YyJ04Y0jrtYXL4s9aI4bE2CP1M2s0EqkFkKZx
         HQZKBKva0gehn2GMvKuJmQu6ceYjOt20Vws2Pn5wj5LYBWZCawtp2kvnaK5x6pIgIbZG
         WH4mDftWTkBMXEmgjW7Ak2vuJGDtQqBVlQ1RCVQ8QJ1EiGb7UtLC0FhRbyl9IO0qvT2t
         HWYEZrST57BW11udpTcjLItSoa4FL/hc33pZ7Ub17MWRelKYAT1LR3oGn/27nu8R67CC
         0A8A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774568513; x=1775173313;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:sender:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=Fjpw0XE1POB2xyzzpU5ngJZ+3VRiymuSVObA/a0MFa8=;
        b=VZW2/ZALOb+L7tFwkKlSv60hcQUmFdFUMpmG8UepD0Tr8e5LKLNIysS9bNMXIdtHNr
         /uvA+L7iR+pi9vSvUBBrg4Y3I/OoSGhIIrhHo6pMIV9VtM57IyuSu07/HMIdJEKpzRjW
         GYF76qHq+69TG9do6tnK9eIy3TGTDUqA93vQ84kTCJotlw+kUUGbVEFhezgaVZ0eaNWz
         d0c3IB+7hJRSk6xNMUkmuFayvNYvUOy726oYqCwbQEbqtmkVO0sThA5/uuyHUbbJCHnx
         fDYsr+Q3LAKH90335xQIADY2tw8+FmrCbcVZKXybGaQIq6MEa3ZvBBQhtVllhFRPNFu4
         ladg==
X-Forwarded-Encrypted: i=1; AJvYcCXTtLQRG3TvCLgTKLISFmD3IlLGTSlR1D4urnENfa99gK7JSjrTH7Jukw7LqwnZ+PrIx5VqMDI8HX3pnQ==@vger.kernel.org
X-Gm-Message-State: AOJu0Yxwwwmai06XKTGdIWCBny44pVNhc6WT9RkugUBqRxwYL+S3XYyc
	n6PX99rPLfGxDTi/FzcPjUOoYPlK5jtnLroEWqFTNJdw4qZg+nD9rE7M
X-Gm-Gg: ATEYQzz9Yks8uiALFaRgfPqUfTRzRryf+6IPWWq7y74W0hXPZeOP2rHRUfJeyaTgS0g
	ZXfJZZeKV4IN8flBIpPubJAZFXcY843R1+cvlweJDXOir2og9VVFiJV35Q8IuL0JDjJqMJdUhdt
	ukAKFqCd0KelmSCoE9bTaTcnXchqQ2D4ybyy6VSDfFUrwgf6vIPf8dya4o9RPwZFnvxw9gJmRTT
	yk/NFIkBHIB9VQvGVwzzCgYSM/6skcFw4ouDuBjpTS8M25yEwvzoYCVqUsQ86wdW7N+zru6zddU
	rJxaOBbu3S8rKRrqKs4MJWuDFjsaKQCK98Ybv+XNH016xCAjK/Qd/Dzixo79YX75eYZHEAiwW5B
	zVD+H2Oq5mywy5/qlK5ALcH1kXj5t5/8/k2B1ItBfPXvGgMLHUpkkElh3/6WpsZalCGjyLlmU/C
	kLcETqseQErh5MvJ3vhhj4OqQSzhd2k+faPObUsXP4yxJbT9A=
X-Received: by 2002:a05:7022:6706:b0:119:e56b:98b9 with SMTP id a92af1059eb24-12ab28eecc9mr249743c88.32.1774568513055;
        Thu, 26 Mar 2026 16:41:53 -0700 (PDT)
Received: from server.roeck-us.net ([2600:1700:e321:62f0:da43:aeff:fecc:bfd5])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-12aa725108csm3846949c88.6.2026.03.26.16.41.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 26 Mar 2026 16:41:52 -0700 (PDT)
Sender: Guenter Roeck <groeck7@gmail.com>
Date: Thu, 26 Mar 2026 16:41:50 -0700
From: Guenter Roeck <linux@roeck-us.net>
To: Rong Zhang <i@rong.moe>
Cc: Jonathan Corbet <corbet@lwn.net>,
	Shuah Khan <skhan@linuxfoundation.org>, linux-hwmon@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-doc@vger.kernel.org
Subject: Re: [PATCH 1/4] hwmon: Add label support for 64-bit energy attributes
Message-ID: <330ed568-e5c4-4a1b-af18-ae3c79bf16e1@roeck-us.net>
References: <20260327-b4-hwmon-witrn-v1-0-8d2f1896c045@rong.moe>
 <20260327-b4-hwmon-witrn-v1-1-8d2f1896c045@rong.moe>
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260327-b4-hwmon-witrn-v1-1-8d2f1896c045@rong.moe>

On Fri, Mar 27, 2026 at 03:19:50AM +0800, Rong Zhang wrote:
> Since commit 0bcd01f757bc ("hwmon: Introduce 64-bit energy attribute
> support"), devices can report 64-bit energy values by selecting the
> sensor type "energy64". However, such sensors can't report their labels
> since is_string_attr() was not updated to match it.
> 
> Add label support for 64-bit energy attributes by updating
> is_string_attr() to match hwmon_energy64 in addition to hwmon_energy.
> 
> Signed-off-by: Rong Zhang <i@rong.moe>

Applied.

Thanks,
Guenter
