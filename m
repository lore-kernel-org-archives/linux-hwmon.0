Received: from mail-dy1-f171.google.com (mail-dy1-f171.google.com [74.125.82.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 539DF3002A9
	for <linux-hwmon@vger.kernel.org>; Tue, 17 Mar 2026 16:09:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.82.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773763791; cv=none; b=gcXVwvOmws8vBeuJd3pdsgVNkRv2Taya8oXh8zvG8mmK41jCEvOsJ3ySAKEtuaUKL2CuFCbv0PR02AOqS+8ZZ3YsYoy9aSLAAyuPwvuWmKZQ/g7IrHzzSj9/5dxV5I8v/do0VFtLLYy2dc2hpg5UtHKnGcn5KOT3l08BnAF9EWA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773763791; c=relaxed/simple;
	bh=KfxAxrWoSnyJ9JxmiWOKeeY5t325K2e00BkTx5mGFVk=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=pjMrkreb+Kh+Ait2bZkeQu3JF0Gg7pOPofTHkQeQz2xT23YNziV4/oeD1murGWBkmQdJpG1rkiXkazGfdjDDNXxwlejLHZb03xEo1qcpb6FpKhRfrtq5mngSRVcLIfeXg2c+ncefxV8pvUcxNUxu0L4dKDd2qapaZWcYTITeTqg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=UV9ZPfm+; arc=none smtp.client-ip=74.125.82.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="UV9ZPfm+"
Received: by mail-dy1-f171.google.com with SMTP id 5a478bee46e88-2c0bdf1988cso4382334eec.1
        for <linux-hwmon@vger.kernel.org>; Tue, 17 Mar 2026 09:09:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1773763789; x=1774368589; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:sender:from:to:cc:subject:date:message-id
         :reply-to;
        bh=+Gw+x5Qb9eLAbEGBt1jb5KwNISLZbopbdBKpU2whhWY=;
        b=UV9ZPfm+dxyW6h2c+EuVF1lTQNWlIiDBLEaL6BjqDcnsKK8RqjaK8LfD3zzhkW5lHu
         yhMbAkZYmBDXrvGZni9b1eV9yJN625ybic6fnTMYavKpxqKRwN9Zrb6l8NCC7QZdRPTX
         YkPmzTAdUtRF1C16OLWKFdhwUXZ/xjnqTumk6Cby0xfZy2zx/G5Y3DGmWCxMIm4oecje
         R/y35P2H+54WGhh3f4oeXDWVIp1Ck6jPrduRCYyuM/CmCBcpXw1Aueb2HyN88M3TEGD4
         //lW0e7RJWKF1+n1kccpQA3cVMb05ZR+Q7q5a4ZklGpk5e3S51B1yZgB/InaR9DdHdgK
         NMlg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1773763789; x=1774368589;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:sender:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=+Gw+x5Qb9eLAbEGBt1jb5KwNISLZbopbdBKpU2whhWY=;
        b=ZrHZU+apm50fRZup2dbICSA4ezkDA+KXaLYywgdwZRPMl33XO56S56gzcUvpNW9OkY
         XyeK83irKQzEcddDgR8Bjy1kzlooVoC+v7iBhhNYh8jG4N8uRcXTOqQKkOUNtQsQgKKu
         mtYIeiQTNiKgEm1tkiZmvDoFghCcdX+LG5p7F4S7oC7yP0U6htA9l8pXeybt7UOj60Ap
         m3MTHDw7ZdMaREueA7jN3n2EBeewv+WGUmrxa3qlPICw5PD49slh/gOvUboJT+68yU4N
         2hG2Y1AbOWP32LgnH9hJqTENZVCuFPKAEjeCffn2f4hEOlJucUO/AAgmmLqLD6QhYoCZ
         kjqQ==
X-Gm-Message-State: AOJu0Yx+ZZ15xym92byYqDAYX3JdMUVQtcBHwa2FuwU/7P071BWsx0YB
	nstqbU6Zw5O5RMa4r1uv3a5V08I4I5MNZus8MT218L9DZJhaPwULPVBa5Kl1gA==
X-Gm-Gg: ATEYQzxlTb4vbg7ASa+TNrKI/e7Od1CkGhrp/N6CQipDa28hJP5fVEl/i+CVQz1Lsx0
	yVBTn/e10kYf4pW9loBeOR/YkR95t3jdhRxB4wxLe7PBOLZE8JOH2Da2m5/MLCCFw2I90hHchqy
	hQGhye+ZTqvn8xzEJ5m3CAShG4ALjQdHCSUjHpHnZMP9YLj6Z6hR0ix14xHqmETvF1+55cI3Rqt
	jFn0yKW8UnyVC8UWCuk2Yi1W9Ei3LcSeIzCnN+yNQ1cmnatJHs91R1ed15oykxt8qdPj2DnWdgV
	ISp2bp9WRD3LjH3jyD7HTvKqTszL7uD+q4Y9/VBzxXTFI7ikFnsC1qJOUaKgrBDdptbog6FeOxf
	ekC8ByS9tYkP2eOSspMJow6KKYebF8BZwHmMgJ/WOH7MR8LmZG6nu50agRQ4i3mrhUKeTFmp0O7
	EHiPpIa+dyYfSVBTAJGrBkDfnpisInTkKtW23+
X-Received: by 2002:a05:7300:e7a3:b0:2be:9d3:c8c5 with SMTP id 5a478bee46e88-2bea55e60e9mr8698448eec.34.1773763789341;
        Tue, 17 Mar 2026 09:09:49 -0700 (PDT)
Received: from server.roeck-us.net ([2600:1700:e321:62f0:da43:aeff:fecc:bfd5])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-2c0c6921055sm10033559eec.6.2026.03.17.09.09.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 17 Mar 2026 09:09:46 -0700 (PDT)
Sender: Guenter Roeck <groeck7@gmail.com>
Date: Tue, 17 Mar 2026 09:09:46 -0700
From: Guenter Roeck <linux@roeck-us.net>
To: Markus Hoffmann <markus@thehoffs.at>
Cc: linux-hwmon@vger.kernel.org
Subject: Re: [PATCH] hwmon: (it87) Add support for IT8689E
Message-ID: <b89fca87-448b-4144-ad44-320b5eb3a5e3@roeck-us.net>
References: <20260309223103.175443-1-markus@thehoffs.at>
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260309223103.175443-1-markus@thehoffs.at>

On Mon, Mar 09, 2026 at 10:31:03PM +0000, Markus Hoffmann wrote:
> Add support for the ITE IT8689E Super I/O chip. The IT8689E supports
> newer autopwm, 12mV ADC, 16-bit fans, six fans, six PWM channels,
> PWM frequency 2, six temperature inputs, and AVCC3.
> 
> Signed-off-by: Markus Hoffmann <markus@thehoffs.at>

This was sent twice, triggering a second AI review here:

https://sashiko.dev/#/patchset/20260309221602.167882-2-markus%40thehoffs.at

Please take a look.

Thanks,
Guenter
