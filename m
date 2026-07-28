Received: from mail-pj1-f51.google.com (mail-pj1-f51.google.com [209.85.216.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 279ED23D7DC
	for <linux-hwmon@vger.kernel.org>; Tue, 28 Jul 2026 00:57:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785200226; cv=none; b=dPdSuwWnROkUBWWGPB8zunlCKsYXjGVzwzzrGUbn9BW3p7Rpv+p4EaYfb9sd24uECdQGAiwvL6g71aihj5vjwPkq3DDnJNvvGg1+3LVMD9nykVokWw49R8CmT2WtxZr9SVrI+ULH59ndbfaVcm/TgJJBaR/vrUZkH2EDTaEj5Ss=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785200226; c=relaxed/simple;
	bh=vPXOPAXVhTG/bqsetoHbCSl/RsBxdyGibSkTdfFIyzU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Km0AwKLtUnEasIktPtCHlommY0PKefIHEY9bqjcwsxpaSRMUpJsL4J3mYkpQ5dAB/X26+z5koa7Kn9oj8HohxxvGq5mQYukFmX3DGsoRBSPSEq6BGAlDZ/bDDhKgVraPNeqgGzy79+Jc51Sb3Iz+mz6yU1LQ231odcg7Nhjpk4A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=raOLoJNK; arc=none smtp.client-ip=209.85.216.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="raOLoJNK"
Received: by mail-pj1-f51.google.com with SMTP id 98e67ed59e1d1-383cb94f742so2872681a91.3
        for <linux-hwmon@vger.kernel.org>; Mon, 27 Jul 2026 17:57:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1785200224; x=1785805024; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:sender:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=YNJ5chWsUz3M08Gy0JNoXm0UmHRakM1L4cKjiaWyoik=;
        b=raOLoJNKtMr+BkN2f2QBFOmiJD4bulxBXWOEs0LUMvcNE/vAVAV3jPZwcbr6OydLpd
         joxlpoltsiB+gMof4WahCbktlOb9V0IHMYSeqLG3naJjsmDpT+Dfg8bPimbWXV5jZHUS
         ptdT7L0hexpDfdL9fNCLU71fJxTH7O1fjDLl9MYyMNK+L04OWM0Sg/gUodjFAV1z5RFu
         Wm1AHURwylWrvelbyHtuz6Cy7DACZhiBYxUPAf4RjOkfruDI2ZKZgpmY4YefOOwt1H7u
         VqEXL7x5AJyuDHYDW25Cr15FI9v9qwXngwFj0zQ54P/XzZJaQugHqyhqLgVLr6G0HeUh
         6wLg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785200224; x=1785805024;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:sender:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=YNJ5chWsUz3M08Gy0JNoXm0UmHRakM1L4cKjiaWyoik=;
        b=XwB81bU8jx3dshASguXaN3LTLeYMlKvQso60c/mCrU1lyJhUuTWqR3X4SdNibtI3fT
         5LYHXCx2z55rciShzkmBkDdd7lTwENS4UvvHR9ijDBxteV5Try56uoJV2mn9aqRu2967
         Id36/SqsqaaAfdHn07Z/KRfmxlpX4C9s+5wE9i7gposf89VKhjEObCILW8ZYLOkdBwXR
         lYcvGct5/HrPz6N+K9pluIfCfaxAiJRmx0ynLxGavDXQRgqAjgbcdK8Lt3K4Mqr033Wj
         yW3BPIaEZhJnZ/w0089ssf1O7bV5Eo+GXRzB/IJH0DCJOj6dz7Jal7khLD6MBGnv9F7J
         IiXw==
X-Forwarded-Encrypted: i=1; AHgh+Rpld5nKF/KBrW6zjO/h80mYetFH3265TzJ/3qaUdB4fXvpc4mvVGnN2rNxTr8+Qt7NnuppgFm0QWuz32g==@vger.kernel.org
X-Gm-Message-State: AOJu0Yyz0iusQQmT9/kbF12ON/shw/59EmaSZ+NwA17kqnce+bYx8dXn
	XcDq7pfjdwQ49+99J1eXmgbubCfNum55NVffLd4PQ9BGBgtih5BLuYXH
X-Gm-Gg: AR+sD11ZBEk9vsA2Ou3L+f2/nn09ZSdCjLlN67f4q1TWcOkdDbo9zDl+UWDlram1OiM
	Hi3M1E4lAIWe052DhDi6A1clJoeD8wb1wR6BFx7VzDAhkBIQbHSNjx+056mEVLX9l8pprqHcS1v
	Vw/b+iHaOa9VkbXPxitQgJc/VamJ6n5V2k40QryJWE0gCtyQt9LEf2H4CjO/Dv5cWtsQXAEM30s
	WhQ8Dg5pmW0QEsoI5uKm4w5y+PqMOQkyB3wnSu6zZkkaZPbcYjl3cNp11lcm65t2ZdxZIOwtw9E
	NUMBSfKu2sz5R5/AQKJqmQmQWveQDVhCiSC4Lxwqfy7tAUau0SyTEvnwHohGTbOExkNrTS3jlH6
	dZjxADbNZgwuOinE/696Y0zgAHWdZkgyYxsdrUGeF6659h7JsUMPsOM6k2VFJd/oebK50e6m5wd
	N3i1ffl/olrflgC7Q=
X-Received: by 2002:a17:903:2343:b0:2c9:cf62:6f61 with SMTP id d9443c01a7336-2d015c3d456mr1934905ad.17.1785200224562;
        Mon, 27 Jul 2026 17:57:04 -0700 (PDT)
Received: from server.roeck-us.net ([2600:1700:e321:62f0:da43:aeff:fecc:bfd5])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2cfde59b768sm43659295ad.4.2026.07.27.17.57.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 27 Jul 2026 17:57:04 -0700 (PDT)
Sender: Guenter Roeck <groeck7@gmail.com>
Date: Mon, 27 Jul 2026 17:57:03 -0700
From: Guenter Roeck <linux@roeck-us.net>
To: Luiz Angelo Daros de Luca <luizluca@gmail.com>
Cc: Chris Packham <chris.packham@alliedtelesis.co.nz>,
	Andrew Morton <akpm@linux-foundation.org>,
	"Darrick J. Wong" <djwong@us.ibm.com>,
	"Mark M. Hoffman" <mhoffman@lightlink.com>,
	linux-hwmon@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [hwmon PATCH v2 4/8] hwmon: (adt7470) Fix swapped PWM3 and PWM4
 auto mode masks
Message-ID: <5ce1a42b-91ac-4fba-9153-34dc8de76a04@roeck-us.net>
References: <20260727-adt7470_fixes-v2-0-598e38a46ba6@gmail.com>
 <20260727-adt7470_fixes-v2-4-598e38a46ba6@gmail.com>
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260727-adt7470_fixes-v2-4-598e38a46ba6@gmail.com>

On Mon, Jul 27, 2026 at 09:22:20PM -0300, Luiz Angelo Daros de Luca wrote:
> The ADT7470_PWM3_AUTO_MASK and ADT7470_PWM4_AUTO_MASK macros are
> currently defined with swapped bit values.
> 
> According to Table 22 of the ADT7470 datasheet, the Fan Control Mode
> Configuration for register 0x69 follows the exact same bit position
> layout as register 0x68:
> - 0x68 Bit[7] corresponds to BHVR1 (PWM1) -> 0x80
> - 0x68 Bit[6] corresponds to BHVR2 (PWM2) -> 0x40
> - 0x69 Bit[7] corresponds to BHVR3 (PWM3) -> 0x80
> - 0x69 Bit[6] corresponds to BHVR4 (PWM4) -> 0x40
> 
> Consequently, PWM3 should use mask 0x80 and PWM4 should use 0x40.
> 
> This typo did not cause any functional bugs because these specific
> macros are never referenced in the driver code. Instead, the driver
> correctly applies the configuration by relying on the modulo parity of
> the channel index (e.g., `channel % 2`) to selectively apply either
> ADT7470_PWM1_AUTO_MASK (0x80) or ADT7470_PWM2_AUTO_MASK (0x40).
> Since the bit layout is identical between the two configuration
> registers, the hardware is currently configured correctly.
> 
> Fix the macro definitions to reflect the datasheet accurately and
> prevent future bugs or confusion during code review and refactoring.
> As this is a purely cosmetic fix with no functional impact, a backport
> to stable kernels is not necessary.
> 
> Fixes: 6f9703d0be16 ("hwmon: add support for adt7470")
> Signed-off-by: Luiz Angelo Daros de Luca <luizluca@gmail.com>

Applied.

Thanks,
Guenter
