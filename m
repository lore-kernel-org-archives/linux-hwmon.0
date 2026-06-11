Received: from mail-dl1-f51.google.com (mail-dl1-f51.google.com [74.125.82.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CC8E43E6DF4
	for <linux-hwmon@vger.kernel.org>; Thu, 11 Jun 2026 11:30:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.82.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781177452; cv=none; b=q7HbY65ce7gozZtoO0FX7KzjIV/rvy7dAad4DCdy2GAvxJNI157pRjT5J4+U/DrB1Zzv9XuYM5MLkQmN6meossCG9ywgDdV9e8buQMJzOvmhcXVM2k4vdlW2vhNg9Frn6YPxF2SIhiu0Lv4cMRhactrhm3dE/Bb3THkrQfg4R9k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781177452; c=relaxed/simple;
	bh=+ZhNOVLruR0M0mTHrO9GLNDrZvneFHLHmhER8H2zKNA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=YZPaHP/CkXynAIti9vyzqSskRQFCkf4iXXHPyhzhmejV89C0+6Rw+TbEswQ7j0nH+W43sKLUGMRNUo3OeEx3NjYO6ZqJzf1TnaDcT2e18MeceRc+vZDVszoQQhwd9fttF7qB7gbTbqfO7FQXqL3jAwpt/wK69MSt8NgiXwXyZXM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=prdBi3tZ; arc=none smtp.client-ip=74.125.82.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="prdBi3tZ"
Received: by mail-dl1-f51.google.com with SMTP id a92af1059eb24-137335bc3caso10046242c88.0
        for <linux-hwmon@vger.kernel.org>; Thu, 11 Jun 2026 04:30:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1781177450; x=1781782250; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:sender:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Gt1P0is49RL6xipZvRdGAPlsRQ5LygLoU9uhWeqmWIE=;
        b=prdBi3tZqsTr8UlTgfB5pRrhA2G7EWtQKysjr1FFIN+ZaMIFYRzkwi7V/qFDql03ZB
         /0G6zEqoG/2yHp3U4xfH1fjgCi6ZSQg/OHo4E24VUz84Mvkh0A9dSbcCTpYVTNmr6pAC
         P+AwhCUmN4ygQ4wNNgKLZXkwMDH02FAm2tazmThRMLkHS+Jrvc4WcYBTkRZhP9PQLxUJ
         bhyvyCipDQfyn6VnSEszAbrC0f3dmdwHcECYlBaou5/734BR/UJzJJasGOAb8YSeeKtn
         1TDjniPPis6ScSrOOffpEXch1NGvpoxZjXZMpQH+WI9QzcgSJ7Z0/iaWUX4Bo5DY4aoK
         +b7A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781177450; x=1781782250;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:sender:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=Gt1P0is49RL6xipZvRdGAPlsRQ5LygLoU9uhWeqmWIE=;
        b=SSh5rTGBxwosJV7zXyfljBOoc3+yJ0ePmQV1vIw8j06LJ+r1GvzPo/WlD3F7F0FUib
         RmqHfyUdgjfPHYH/bE2IfZc8SD3vQ5ApJmnYfK53r2gSraZaIO9pCNWGj9GbTJ+wRw3T
         sgumPpVAYF2Hc5HYJOh2G4AJDRribZGxoealrrVAoeMfcUCNrAo4fkyhhbhSQAnI5Yx/
         9gMKiGs6KEOJRMucObGdxhPpCp2XwetLdLWqO0p5AUh9A8ya87apEQv7Gp/tOGhOUjaQ
         3G+YeB4TOtENJnw2JnrfFJeslb1Q3f2XhOsL5Y86S8AX0LyHhMcyDCHsCCKywoT9Nlh2
         7ljg==
X-Forwarded-Encrypted: i=1; AFNElJ8jxci0pdKm6xS4OAXO8PUAPp8EvXOiExQtcKQicwMxmAmJrJSL+rm6Quh+A2LX8bg7LO5Qws4GfaJaEg==@vger.kernel.org
X-Gm-Message-State: AOJu0YzmzSe+K+iuDDsQR9ZVhc2ErfDyAy4buX8iRvj6FcCDIFlBgXZH
	rMxYUAnk7WdNJzeezLPZ63BjpXrIpxTOGuG2Z0gh5A/fMD8IFxxy3iBG
X-Gm-Gg: Acq92OGWsuRWBM9XKvrdKDgmzmpW8BVXiDKSQTD5LIwT4KDM+q2cq5pkhqkPmORxrWo
	ecwUEthw0rwY8HXsKP+1GQ63KKtGKGWf/SsDRJ4WIEX+tiA/NwtmTTxZ3MJ5K1VZBCT2ktnBD+7
	c0W4W+ctQEr7dMJzMu0DMpD1FBvtdUeJBdqwSZQ9MSAMLyUvW3vHoBVlDxGt0nGBT3tNX5P6EiY
	noPzxxyS7jnwD4MqsHHlWAm0e8VC1PM4FPYAlAsygfnSNbrooNVmXt2EPfMsCuCOj8wEBBlrhjI
	xXtnGYlGgJh01uaAxoxBmabsflyAmFaH15BQ3+XJ47+9kD+Xexxxm9bcxpHh5cIfn7rNO7oylnF
	d3KyS4oBt/ntdSbAKA5n+RsnHY/ouxyIGI+fiUgDADg6bh7+XyZ50AQE+FYDzAlTNJecWK1ucIv
	2hLpSUKdOaVQSK1iE0PQCfT+hnJO/gEYvVhA1ENhsEjHmjf6RBaL2umFxTRg==
X-Received: by 2002:a05:701b:4183:20b0:136:b370:64c5 with SMTP id a92af1059eb24-138422d9798mr1007059c88.30.1781177449785;
        Thu, 11 Jun 2026 04:30:49 -0700 (PDT)
Received: from server.roeck-us.net ([2600:1700:e321:62f0:da43:aeff:fecc:bfd5])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-30806c2f0acsm2167278eec.1.2026.06.11.04.30.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 11 Jun 2026 04:30:49 -0700 (PDT)
Sender: Guenter Roeck <groeck7@gmail.com>
Date: Thu, 11 Jun 2026 04:30:48 -0700
From: Guenter Roeck <linux@roeck-us.net>
To: Potin Lai <potin.lai.pt@gmail.com>
Cc: Patrick Williams <patrick@stwcx.xyz>, linux-hwmon@vger.kernel.org,
	linux-kernel@vger.kernel.org, Cosmo Chou <cosmo.chou@quantatw.com>,
	Mike Hsieh <Mike_Hsieh@quantatw.com>,
	Potin Lai <potin.lai@qunatatw.com>
Subject: Re: [PATCH v3] hwmon: (pmbus/lm25066) Fix PMBus coefficients for
 LM5064/5066/5066i
Message-ID: <030e2e3e-7e37-4944-b901-c0c6faf6b063@roeck-us.net>
References: <20260611-lm25066-driver-fix-v3-1-9d7d4b4e253d@gmail.com>
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260611-lm25066-driver-fix-v3-1-9d7d4b4e253d@gmail.com>

On Thu, Jun 11, 2026 at 01:46:18PM +0800, Potin Lai wrote:
> Swap the high setting and low setting coefficients in the lm25066_coeff
> table for LM5064, LM5066, and LM5066i. The coefficients were previously
> mapped incorrectly, resulting in inverted current and power scaling.
> 
> Additionally, dynamically assign the exponent (R) registers inside the
> probe's LM25066_DEV_SETUP_CL check. This ensures that the proper
> exponent is applied (e.g., for LM25056, high setting power exponent
> is -4, but low setting power exponent is -3).
> 
> Signed-off-by: Potin Lai <potin.lai.pt@gmail.com>

Applied.

Thanks,
Guenter
