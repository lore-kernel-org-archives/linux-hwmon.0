Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.179
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792443223;
	b=KtH9l0w/tly0wkJ7hXpA6m1rcvlO5J0XfNn3t4TkQW5mGrGWGm0KZA2vZcR/Int5VMFZ
	 dzk6Auy3FJI3XEEJ7dleIqm1x7xDbXtk9krxlQzoWqan2vMgyp3HuiuOBDwEF+ESbrTuj
	 tHohB1NMiiFKqnOopqolOUGdMMG7X+ZRSd19gDhhhiClXeNQTX6g3+rZkT9o2SHN+fOqJ
	 THUOtSVPldr4kwFJmiRwX2tXGkI2xJUPYKZP31cMVR1BO8xg+znQ1vnZOX4RXojQWVM1W
	 NTamPwuxdHClP098AxuSC/jfsWHbn6bGFgr9P32HCWAWPAfTc35lq3/q9hDQPmKllrA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792443223;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Sender:Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To;
	bh=eQ7btiBcp3eDTgLhx/ibMINfBWMqVGu1dC3mx3tEGz0=;
	b=bCAvcoZDp+pIdqfIw0Gfm8NVt/mGT9f0jJts5SjuVaIZ4IOKXpF3tMeSD232SF0DnNXh
	 sIy/XNga6MzP9IwZnWhXSiwKZ6ge7yIfYapGN78nxJi4aBskZACnwnbt2x5bF5J9F4bwB
	 qjijP3cNPFK5ihmVvrPemksqm2i4ySmSBOWLSE66meyA9PHsdOfj3O5DAmx4XLXI7SBhU
	 WLjPW/iB1m8q/MypFWUgeDefjzk23RFiVx5EvK7QDUKGsRVcnoamDhblO13ZYChVsPdj1
	 9s0JKvtLW0KV8RmIVw5tOn3VzRJ8sTTicZCluq0GzASS37FK+R7MIfP7SYbosV45QSQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=roeck-us.net;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=sVlY+y6s;
	arc=none smtp.remote-ip=74.125.82.179
Received: from mail-dy1-f179.google.com (mail-dy1-f179.google.com [74.125.82.179])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BD493606A31A
	for <linux-hwmon@vger.kernel.org>; Mon, 19 Oct 2026 20:53:42 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org BD493606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=sVlY+y6s
Received: by mail-dy1-f179.google.com with SMTP id 5a478bee46e88-35943f55c06so121395eec.0
        for <linux-hwmon@vger.kernel.org>; Mon, 19 Oct 2026 13:53:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792443222; x=1793048022; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:sender:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=eQ7btiBcp3eDTgLhx/ibMINfBWMqVGu1dC3mx3tEGz0=;
        b=sVlY+y6snCjEyok2OxXlhW7JqE2aCHv2dt9r24qcl3pkp92skH2ZPKNiRTXiX8C2bM
         4EnafOF/sbC4VBWTaqIck6qCxbJfLRnV66YW/KiWKMd294EK9vAGk4Iarj+TQPCnuNce
         tlgg8d5EQIieck8VBH6mfEkG1DuWBpgfVw4VnutAdbGqQWA6Kdd3Woq+iABFPNYMtiBg
         sDydMlLl/n6tajuYoyMnMCEsKsFjhSzHG4bqtDYarcnPc51nXYyTjSdfLF+BDM7FOMS+
         Yv2QkohREQUVSy1gg1pYcPZ+SG27bfvaF/MT1TY0++/5k36jtPX75Hx4CQ2gCwGvSJps
         gvIA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792443222; x=1793048022;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:sender:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=eQ7btiBcp3eDTgLhx/ibMINfBWMqVGu1dC3mx3tEGz0=;
        b=DiSFwkV1BVy0M4MWbQymPEeGYjHIJZVwTl+9tNmcwyblrayCEY/lMJGZKQUMWOk6C/
         Bt8NDNL7KogWfPQBtV5ZihR0163e8K+3DOf6IADCCWRfxuqDAXcuclZso4a66kdGheYC
         GoN6YxgNhrRjlg1coVqLazmfTHnTGIDDGzD3RspOglqFnsxWLLpsmpdr2Z3DOmOl6ONN
         OIOUfP6OYjClHAJWXotZ/Lx+YT3/BbuTYSsyglt3z+RrzWm9xYZtkW71hr9sk4TiDkR/
         jw0c8S/BP/bQoVsS9ZfsZtQ7XzGy4riZfEybU/Rhdv17q0SbrgbTmC1ZVOCsjJRD2GLD
         vv9A==
X-Forwarded-Encrypted: i=1; AKwUvBziF2fBcVAMBp19POMnsiT4J3us5A2ZaGa/Gza+zf5Geiz89BKWw45dwY5Rf2Ml9ezpFZVTOs/r7cqL5w==@vger.kernel.org
X-Gm-Message-State: AFq9FYLBLZzrdeu+jEYO2eO58JLvH+e+0ShQTtQVnZD6nIic+D0HHCag
	bzp74jOAkvTnFiWUkGrGSwHJE4R2GD3cbse9HXnmg5Gixbdxz2GqX+EF
X-Gm-Gg: AYBFou1dBRRtZHrlfVfFU8JRs8uGuvUJxiwWej/sJG6AAw+ax5WO3/MAyhr8J150aX0
	oBg33Pj3hE3YmoGEFdQvuldnYc3V9aRGjB7j9emWvZTNj+CLMnR9m4dvL8wmGXk+KkR7hV6/4mq
	neqxCPeUYT2IRWvAOi21enTCSyWSAEpe/2vxO/eFmX/sgxYroNNCDO9lS8V6S4UvmUQ0rgn979C
	BdzOD7VgiRaBguAFtA2lUN4E2M+Pbto54ZmuiFrQiBJXQf7DoaSPLHuW6Sl+TW3G/4t9muvyBPG
	z0CgjDK9byKi2/6x4SO16ZO1lGKvRvc/NLHjhEWorJe6YzDsQranf1v0ACb5c/61qK2/zPDyYH6
	TCftQFqY1ShESrgh0XRh3YbTBaVKK4a7HMQTnTXg3TAl0qiogk27p02R0p6LvSNiDfjGF9om8gK
	BHXBnlVfcp6MFcv7zXxt5TW96vlfsofXgXwU8hWBZqal95SCAe/HqjsP+bhTX5Ip3yYBbX2G1+c
	tW2HzfEX5f1
X-Received: by 2002:a05:7300:f193:b0:351:2f0a:cb2a with SMTP id 5a478bee46e88-365f829953cmr487552eec.2.1792443221795;
        Mon, 19 Oct 2026 13:53:41 -0700 (PDT)
Received: from server.roeck-us.net ([2600:1700:e321:62f0:da43:aeff:fecc:bfd5])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-36081bafa7asm33939258eec.14.2026.10.19.13.53.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 19 Oct 2026 13:53:41 -0700 (PDT)
Sender: Guenter Roeck <groeck7@gmail.com>
Date: Mon, 19 Oct 2026 13:53:36 -0700
From: Guenter Roeck <linux@roeck-us.net>
To: Armin Wolf <W_Armin@gmx.de>
Cc: github@firefishy.com, linux-hwmon@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] hwmon: (acpi_power_meter) Fix 18.45 TW bug
Message-ID: <86b3c644-544d-4c23-8e7a-4478f4094058@roeck-us.net>
References: <20261006234618.10943-1-W_Armin@gmx.de>
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Post: <mailto:linux-hwmon@vger.kernel.org>
List-Help: <mailto:linux-hwmon+help@vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-hwmon+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20261006234618.10943-1-W_Armin@gmx.de>

On Wed, Oct 07, 2026 at 01:45:34AM +0200, Armin Wolf wrote:
> The ACPI specification says:
> 
> "If an error occurs while obtaining the meter reading or if the value
> is not available then an Integer with all bits set is returned"
> 
> This integer can also be 64-bit wide on ACPI 2.0 and later systems,
> so we have to check for that too.
> 
> Compile-tested only.
> 
> Reported-by: Grant Slater <github@firefishy.com>
> Closes: https://github.com/lm-sensors/lm-sensors/issues/460
> Fixes: 1fefca6c57fb ("hwmon: (acpi_power_meter) Fix 4.29 MW bug")
> Signed-off-by: Armin Wolf <W_Armin@gmx.de>

Applied.

Thanks,
Guenter
