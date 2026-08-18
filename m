Received: from mail-pg1-f171.google.com (mail-pg1-f171.google.com [209.85.215.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E3130339714
	for <linux-hwmon@vger.kernel.org>; Tue, 18 Aug 2026 23:37:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787096270; cv=none; b=SZvuxb0MNLjeZlVItgiMmnV8c6AJv5aSgltOwsv9xN0ROHqZFs7nqNKwpx2xt04gHkK4+yo1krSR32xcmNVKt6IPsi3GM7CO5/XjFCopCsmdS1LgvBt7qRZTYWzrN0EF9vGJx5xEOK7l+AWwntGcS++wWGhPUFtadb9GGIDcNxA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787096270; c=relaxed/simple;
	bh=nVfFfY8A659cL7HK7LVOhl16GacAGCOHEahYhLSQ3qQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=OSCkJGg7aRv4BO8Yuue8cpdVCgcXam2dV7rk0ts8Mu1FXU3yC28V7d0+LANJwHghs1EIZHkIEnLn7wYu/OXAKrk542qpKkGZ9DdKE4k23YYzW/VNxjS2z+25yRtw1VCJ4YkdnReOZ/9/FbOqGDSiq90Cec1clciTmakz4y6pOb4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=DUhuZBfu; arc=none smtp.client-ip=209.85.215.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="DUhuZBfu"
Received: by mail-pg1-f171.google.com with SMTP id 41be03b00d2f7-cc11a30a259so330127a12.3
        for <linux-hwmon@vger.kernel.org>; Tue, 18 Aug 2026 16:37:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1787096267; x=1787701067; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:sender:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=/ATRerpanZ/JU36hlqVmHVEOL595+NPyacmWceMRGF0=;
        b=DUhuZBfuO1KiROJdTWTNmGgwG5MngtvtL5pARztVVR1tt641D7L3cvL6mnELvF17qK
         KXKWnnJHas0SKKrVx765e3Yk70HgHF/dM3oMD9L5Mb/n5X/mj3Fz7jL7xYS5sWPLxwSt
         paHR/xHSel+6ZywfzAW0Ss1wW7kN0+OeBlla5PacDp+FMpBg268cLj8PvuKmGmpcMEMT
         rmWCrN4YSii28iTPRwpGMCuG3ZG8fRC/MMYdFxQHgGSjg1S6n4WrUYC+ZMzFEtoX0DSr
         0NVilexx2HTJHvw7s3Old1/rTEpSIYFgqIXHsg8VCMopN+fBNSHXYihebtahtZwHiLYY
         4Waw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787096267; x=1787701067;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:sender:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=/ATRerpanZ/JU36hlqVmHVEOL595+NPyacmWceMRGF0=;
        b=ARgI0umLG/Pr15BF28OQD97J1iRuHZLuVZ/cI0bb3ZkPuovdrDQJK+4Y63h62DoT2U
         IObBHV7B01YTpNznYCsa0NuT0u4YOtau6eQTrmKgYpf2dFHU3BhmfGc20ZH78Awbwmnj
         X7BT8WvaJTlk+KlR/gX+66NKNAgB8oMYrWpacbkFFGxI8iTgmgk+S6jjielP7KPq34SD
         dFqBVYu5TxBKPy0+ikQ4k6rJvYtj/+JovalVS67whyH4ovSrotMV65BYOvXqtqR/9DJP
         CsZVgaJTEjAnthrChgZnrDzPVipjQP9cdSpuyKM8QinVQaY44DPH88zkdtMSdz/UT2wQ
         rFXw==
X-Forwarded-Encrypted: i=1; AHgh+RopFWGXoNptoDZjJPDbRulFBIGPJPg+51eIFhEW4YRbnwLaFX3NmrX+7Xb5Rnl3Hhl9akEF302mC7QzuQ==@vger.kernel.org
X-Gm-Message-State: AOJu0YwvY8iZZ4Qn9ogQsIKFef+iNiXOM+6Bb3tMXT1WUATpVoVpTp5w
	dJKtR3SKNbd5HR/AaYRZt3o8fUv57toByT8hQKNy3F+kUKdEI6gw8fnX
X-Gm-Gg: AR+sD12aPJT6Rtc7wrBzQSOJtw1hzj1jRHCbFq9w2C9mQJy1XBaaHqEe3Zcx49sY4to
	pfQ+Z5fuF/IDbJsVKYRbof0REtbUR0GsI/EWmzd4R3CYeM23kpDoVO8HH0Ko4PBcXY9temkp+Fm
	5QARwAxxCsbwG91VuAKxT1U5npPN3O/+mD4dvBaRBriZpsIOEEKqkE2VaFlHFhrjIJyEBDF/Sm0
	fzTDQaOqihYM0kR3NVZG0GSByA1433D3j1QOUiAdeplEUTxZBqnqutbL6ugRw4su8zmUBWAX/Qc
	wJceBY064XIA1Vu5F6xBv30zNo3C9ZNNNWQaETku1qdMiBI+dM3Ct8jTRDcJs42DVBfK2xF5uvo
	qY6FmUx5RmNyVO6CKCXMfDsa1pD9xvBPnKH3OP9nOqc7kQU9BwLKylkicEgEbxbj7RG5zsYW2MA
	uNIm478b6yvy9OrhvsmGiMHL+37oLfQkabF02BCsd493ilKvTnQ85l/aZP38XcwA9wht4tGI7Eb
	w==
X-Received: by 2002:a17:90b:1804:b0:38f:dec8:f7e9 with SMTP id 98e67ed59e1d1-395810b5a15mr821265a91.12.1787096266837;
        Tue, 18 Aug 2026 16:37:46 -0700 (PDT)
Received: from server.roeck-us.net ([2600:1700:e321:62f0:da43:aeff:fecc:bfd5])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-327bf10b584sm657098eec.16.2026.08.18.16.37.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 18 Aug 2026 16:37:46 -0700 (PDT)
Sender: Guenter Roeck <groeck7@gmail.com>
Date: Tue, 18 Aug 2026 16:37:45 -0700
From: Guenter Roeck <linux@roeck-us.net>
To: Stoyan Bogdanov <sbogdanov@baylibre.com>
Cc: jbrunet@baylibre.com, robh@kernel.org, krzk+dt@kernel.org,
	conor+dt@kernel.org, corbet@lwn.net, skhan@linuxfoundation.org,
	linux-hwmon@vger.kernel.org, devicetree@vger.kernel.org,
	linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org,
	Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Subject: Re: [PATCH v7 2/3] dt-bindings: hwmon: pmbus/tps25990: Add TPS1689
Message-ID: <9cab8512-94ab-4ff8-9921-31d86033ed63@roeck-us.net>
References: <20260817101455.3526260-1-sbogdanov@baylibre.com>
 <20260817101455.3526260-3-sbogdanov@baylibre.com>
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260817101455.3526260-3-sbogdanov@baylibre.com>

On Mon, Aug 17, 2026 at 01:14:44PM +0300, Stoyan Bogdanov wrote:
> Add device compatible support for TPS1689
> 
> Signed-off-by: Stoyan Bogdanov <sbogdanov@baylibre.com>
> Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>

Queued for 7.4.

Thanks,
Guenter
