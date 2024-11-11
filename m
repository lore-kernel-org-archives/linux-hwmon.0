Received: from mail-pl1-f177.google.com (mail-pl1-f177.google.com [209.85.214.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B620B1AB6E6;
	Mon, 11 Nov 2024 19:32:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.177
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1731353540; cv=none; b=onRaf6FMbJXtP3ZV65fkCLrEqgIAnAOhHyul3KJDI8WtGu0hzoIF9nXf+7UPpRE7c0NkjZqoDcIYmPhrwnHwmklmP+MvigMwKXW7pQ/jIA76bQr5wn/c6X+B/e0c5SNmOyvM4r7Pp6ImxTFW1OYpZDiOl2s3erC/XDUUZJUonRQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1731353540; c=relaxed/simple;
	bh=FrUbdVoOLBu7nebxd/Fm4MXxSUtoIkGwy33uXzfApKo=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=snoUsua23PpNfkUkEpcmK1O6okV4Yli+EzNPohNC+t9hrLCxyRGOy+2XpiS7HUhU1lDTq6P9B8pdOztxiRT/P/tRWBQW61tz1EX6fbUTbWMOw0iwqHrtAJrucdHH1pVPseeOuJix4Ym2S+1ZdovBg5POyDgZS3Od7GbMAhZHzJQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=VLWqoeO6; arc=none smtp.client-ip=209.85.214.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="VLWqoeO6"
Received: by mail-pl1-f177.google.com with SMTP id d9443c01a7336-20cb7139d9dso44705465ad.1;
        Mon, 11 Nov 2024 11:32:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1731353538; x=1731958338; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:sender:from:to:cc:subject:date:message-id
         :reply-to;
        bh=sUGrslVlG4qG18Wp+uQ/Za/lzfs7LZhHC0YpFJ/sO78=;
        b=VLWqoeO6XHl3uV3iCX0vSuYvr7kCR1mX3JjPQQ/gJ7EnckTBJfVbfy8Vbfy31FY8ln
         QRvyUsxvh81lRfe0nRPE8uO7MEA6HGvBrDNxL2RlbpH/cMhtpYBfkiyPeO6q0GXEv6P2
         cB7MvUoj0171Z9kySIEgeimMXmlxdsdm6kOtxptN2ktwtAIMDHEQkuA56848mIdcfNm7
         6tJ14Sj285TpXfQ4lLBjiHL4jK8dAJLJKTrVaaGADMP/KWs1s0hZJVGnkT0UAbAWvi8c
         jRKAy+crVNjb1iUJAiO6vZGYqXJSwrpizJ7edaIrsA76Oa4ua+oOxKj1DYwZflPBdrH+
         2Vsg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1731353538; x=1731958338;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:sender:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=sUGrslVlG4qG18Wp+uQ/Za/lzfs7LZhHC0YpFJ/sO78=;
        b=nO/UWeM1ITnCbuQmzl7kZ9tz/sLKUv/ub3vYTpLDdm9NxBZ+iENk17N64C3wQsYsAI
         EpGcLSigNddvdi25Hq8PE9c4uF3dniV26flmuR7ku2VPidwKzToAB2qB14ocRr2EbnHY
         ho3o/N7t3ftIKATd+VecRdsDGroi+TDCGvuHGfplt/qV8+Tf0Ou2HKtWYAiaYwgDtLQN
         bNKYtIXKii0CQ4ku+2ef+AjvDnwHGQCMQxsW0Hp15dsN9uy+8Bx0S+PtfwFj5PFLBeHY
         dumN37MyodvuD2UTNIvG39Q/P9sFtN2nlENHJwJRX09PprnSBtN/eyuzDjbHOWEoQUxx
         veLQ==
X-Forwarded-Encrypted: i=1; AJvYcCX6hTvLCL0S7cyw/E4i4Er/hpU+Wt2Qxo6Q8O7EyEnCMKJh0LR82NUN9xWnRQEajHPS4hv4siffjUrL@vger.kernel.org
X-Gm-Message-State: AOJu0YxUIHLGKrgvtvOQpkolzfLTdcHXPGGEGFf5K6Dj/ezYjkaDB3vQ
	uSPWA8yRVAg0dKWaxUEwiQZdWUXyG6fdLfrWMjyUNmp7V5i/oyOa
X-Google-Smtp-Source: AGHT+IExs/+IHuv1ud56eQgfZVzXrveAzwV6uINoFDUkGASzBu5PJt+E1H2YOwuZWE08mzLd+IjlPw==
X-Received: by 2002:a17:903:2c7:b0:20c:b810:13a5 with SMTP id d9443c01a7336-21183d3788dmr175588425ad.21.1731353537839;
        Mon, 11 Nov 2024 11:32:17 -0800 (PST)
Received: from server.roeck-us.net ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-21177e58e4fsm77772665ad.203.2024.11.11.11.32.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 11 Nov 2024 11:32:16 -0800 (PST)
Sender: Guenter Roeck <groeck7@gmail.com>
Date: Mon, 11 Nov 2024 11:32:15 -0800
From: Guenter Roeck <linux@roeck-us.net>
To: Marek Vasut <marex@denx.de>
Cc: linux-hwmon@vger.kernel.org, Conor Dooley <conor+dt@kernel.org>,
	Jean Delvare <jdelvare@suse.com>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Rob Herring <robh@kernel.org>, devicetree@vger.kernel.org
Subject: Re: [PATCH v3 1/2] dt-bindings: hwmon: pwm-fan: Document start from
 stopped state properties
Message-ID: <4799061e-603c-4fd2-bbf7-43205ea22846@roeck-us.net>
References: <20241106185925.223736-1-marex@denx.de>
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241106185925.223736-1-marex@denx.de>

On Wed, Nov 06, 2024 at 07:59:04PM +0100, Marek Vasut wrote:
> Delta AFC0612DB-F00 fan has to be set to at least 30% PWM duty cycle
> to spin up from a stopped state, and can be afterward throttled down to
> lower PWM duty cycle. Introduce support for operating such fans which
> need to start at higher PWM duty cycle first and can slow down next.
> 
> Document two new DT properties, "fan-stop-to-start-percent" and
> "fan-stop-to-start-usec". The former describes the minimum percent
> of fan RPM at which it will surely spin up from stopped state. This
> value can be found in the fan datasheet and can be converted to PWM
> duty cycle easily. The "fan-stop-to-start-usec" describes the minimum
> time in microseconds for which the fan has to be set to stopped state
> start RPM for the fan to surely spin up.
> 
> Signed-off-by: Marek Vasut <marex@denx.de>
> Acked-by: Conor Dooley <conor.dooley@microchip.com>

Applied.

Thanks,
Guenter
