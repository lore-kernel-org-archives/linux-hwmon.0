Received: from mail-pf1-f176.google.com (mail-pf1-f176.google.com [209.85.210.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6286D220F2C
	for <linux-hwmon@vger.kernel.org>; Fri, 28 Nov 2025 16:30:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.176
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764347441; cv=none; b=aAw0BqtP/WkBDSlM+Eorw8gMFzPEITyfRJQI8iwv5vJfwbKtXRIeezx+ezqlMxxnhJsR7ARSVmwHisv/guWjGV0ZeF7VKVb7Nn/75+BBZhT9x/0zdEMn+jOhBLiW9K9iPE0jhvGGA+2r3yODMZ9xWA3K9nDpBPLARTa4jnRaeiI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764347441; c=relaxed/simple;
	bh=XnsAGt/K8t48mxSClqWIxlzwe7yWwxHAIh7zgQNrVdY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=EnmarnuodlICiLScmgr9rtu+u6fnwcW1cR0ATozS78BPx/rO7iGj6/nOqbQ0EBYpqLLzR/pcS+AfXXR1XQkUpyf1A+T+QgtD3VUZXmwB+BDg+iHXtjbSmz7zBE2x6B15PMjdaOFxj0omjCwl/BgmIbXIzc7iE5XAgXu0MV1DtNk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=mBUzgcrw; arc=none smtp.client-ip=209.85.210.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="mBUzgcrw"
Received: by mail-pf1-f176.google.com with SMTP id d2e1a72fcca58-7ba55660769so1761186b3a.1
        for <linux-hwmon@vger.kernel.org>; Fri, 28 Nov 2025 08:30:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1764347440; x=1764952240; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:sender:from:to:cc:subject:date:message-id
         :reply-to;
        bh=bnJSFmXIzcu6m8f2k6bb5zTTnIroco3rAnnd5ePbVg8=;
        b=mBUzgcrw10whZBouZFSWgtcY77tzDKtd1gbNWRBGG4XCOSd5rr/HSM9xBdPLDie9mS
         FexyYQOcMHIPro7wVrvyCjwHWzCdtQBj/5oqCjq66uz8H51W9mFVRh6iwfVf/3+bcnbw
         JRlbRqfOy/u9PY2aLyRIr3YDkfecxDiTKCpvz9lciBIfFfBLD39OWoOlxm1RiN5tKkEn
         ysjBjtOmQRhXaUC4j/hucWKzvrFnlGdM34eeJJ1hrM2xtv2dIQMdU4LXK/qchUZzbS/c
         IWMcJhOwvGucAx9U8F7cF0kRsB82bargKn81VvgxSa2b2VxV4QvqqVYR23W7iE/3b5b1
         4Iww==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1764347440; x=1764952240;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:sender:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=bnJSFmXIzcu6m8f2k6bb5zTTnIroco3rAnnd5ePbVg8=;
        b=HL//Jd7bXpkhpaHAtIHIoZto3uqQWNn95obKQHyDyj5kYX7AsGtYnpGY++EuDFsKyo
         Bc3hW+HzTd6OT7hM0xzVdT35zSWPJuibFdcVIvgru7ZBqu3dSHwP1WUpdm2OAzepVwWU
         waqeAucVOVRbLxW3gtsSd9Brs10oBGGN26DtkgxE8PGeICQ06usjZsJbGo9ZDAvCvdVD
         IWDTcMYh44A+rZrtXSZ9Bg2jF801Y94/NvTsHpOCr3LSaxCVgrH9O+f7flaIy4QrRAtR
         KydEa1aKSXJnPogkpzGVi6Vjs3QHKZdRCuc5HmdiALoJzt/E/jymyHoDjfs8hokvOgC9
         +qQw==
X-Gm-Message-State: AOJu0YxuOPA0zwuJG+iZ7QzOF6NXlg9DiFcl6H93EEKDrqKsqVSm8VKS
	7Xksks01Yvd3ksoV0cZ+GwhhEwvKTvXaD6fIrhxkCMDpt/jmg8lloNyq
X-Gm-Gg: ASbGncu5aQjallfFBJGGgpXSG4Jguek65XyNfj2qCgqTW9/2BMd9J+33aVCn0V28tg3
	34ksMVdvgolqJDCLH9HZm3ks6m49QFwLtI272dg5vM34rh/2lTml7GRmPt9n0+JCB4MBbLC7ChU
	MTQyfFh/xLei+rii128LOGALW6jlxjojtsbTl/tfiYKo/UWPPmy+0WymQczdOioHTQOBrlHtPR7
	NTGvu4f5fnpjmpgrgP/HkXUa13jO0mRIulZ/daMMf/3PVzX/X1AQDO74Mm0eDr4Ye3PaJKEs/BW
	xRXjTAWlNSZsAkibLKpV2TxUVX8NwaJvaJOb23GvRlIuO27JtYtwLWLF8I/Bka11kZDrf5h372p
	x/4UZBdQCE25xLRtDtPzofR3nKzp9xaBRo6+FXE6eVL6tiXhElVFLq71zuADzlGSJbxhsecfwi8
	kjHkEDS0JnCIoHxeJcSy1XGoQ=
X-Google-Smtp-Source: AGHT+IFOQUFqcyf8Z/GfA3QnB9AfAAqcIZA/UlGBc772GKHTlSMoVyFyjFr6O20exxh0wIxbOSubzg==
X-Received: by 2002:a05:7022:f509:b0:11b:a36d:a7e8 with SMTP id a92af1059eb24-11c9d812b80mr11166033c88.13.1764347439320;
        Fri, 28 Nov 2025 08:30:39 -0800 (PST)
Received: from server.roeck-us.net ([2600:1700:e321:62f0:da43:aeff:fecc:bfd5])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-11dcb04a07bsm19837274c88.7.2025.11.28.08.30.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 28 Nov 2025 08:30:38 -0800 (PST)
Sender: Guenter Roeck <groeck7@gmail.com>
Date: Fri, 28 Nov 2025 08:30:37 -0800
From: Guenter Roeck <linux@roeck-us.net>
To: Gui-Dong Han <hanguidong02@gmail.com>
Cc: linux-hwmon@vger.kernel.org, linux-kernel@vger.kernel.org,
	baijiaju1990@gmail.com, stable@vger.kernel.org
Subject: Re: [PATCH] hwmon: (w83l786ng) Convert macros to functions to avoid
 TOCTOU
Message-ID: <554af5b8-4a52-40ce-aeb4-59285977cfe2@roeck-us.net>
References: <20251128123816.3670-1-hanguidong02@gmail.com>
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251128123816.3670-1-hanguidong02@gmail.com>

On Fri, Nov 28, 2025 at 08:38:16PM +0800, Gui-Dong Han wrote:
> The macros FAN_FROM_REG and TEMP_FROM_REG evaluate their arguments
> multiple times. When used in lockless contexts involving shared driver
> data, this causes Time-of-Check to Time-of-Use (TOCTOU) race
> conditions.
> 
> Convert the macros to static functions. This guarantees that arguments
> are evaluated only once (pass-by-value), preventing the race
> conditions.
> 
> Adhere to the principle of minimal changes by only converting macros
> that evaluate arguments multiple times and are used in lockless
> contexts.
> 
> Link: https://lore.kernel.org/all/CALbr=LYJ_ehtp53HXEVkSpYoub+XYSTU8Rg=o1xxMJ8=5z8B-g@mail.gmail.com/
> Fixes: 85f03bccd6e0 ("hwmon: Add support for Winbond W83L786NG/NR")
> Cc: stable@vger.kernel.org
> Signed-off-by: Gui-Dong Han <hanguidong02@gmail.com>
> ---

Applied.

Thanks,
Guenter
