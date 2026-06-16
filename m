Received: from mail-pj1-f42.google.com (mail-pj1-f42.google.com [209.85.216.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1665445349C
	for <linux-hwmon@vger.kernel.org>; Tue, 16 Jun 2026 16:07:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781626054; cv=none; b=nxWeTgbErP7AxAyXHLrDIMZT6498+/LXOqIM1oWFUcWXe2mLVbHT1dwJ/klfkppAauz+vM12IOw7HBgrPOAqC6h98iOr/141GVDDhvHaQTaY/PdXImK79E7BtQaEuVBZV/DhVeufavecys27ULAw/ocmt+Nb19xEWh597xNv5cE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781626054; c=relaxed/simple;
	bh=b7FoClwm9N7t4yAIOtvve5Rh0DIMrqeK8iWinQN2qKI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=URBncBqaxRcbtViI4HGXSIM4wh1gdaGqxuKaFP6LFLtT/QD58oErlHmHCyvwFiei3+SpG4IXAG7+dlXLmrXVwY1UMXMJHRuezAHAZJdX1ypF6pZ7OW9EGSRG9H9+c0fTIrfqS5B6f+WyH0kf/Ftb0/hOXoiINxKxsL/ngdhQlaE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=KeaAURAd; arc=none smtp.client-ip=209.85.216.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="KeaAURAd"
Received: by mail-pj1-f42.google.com with SMTP id 98e67ed59e1d1-36ba706ab46so3117949a91.1
        for <linux-hwmon@vger.kernel.org>; Tue, 16 Jun 2026 09:07:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1781626052; x=1782230852; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:sender:from:to:cc:subject:date:message-id
         :reply-to;
        bh=67luUYDo366p2kkhhpeEjBFUIoaqUmLTWLZe7WejNmE=;
        b=KeaAURAdoturNLS+wEDc0m1Kstfn4udhTBCVxJXnqYx8F3xNBT837n9EAg+jEXGhGs
         ImrBJUFC1AsQYYQdhzSvYllyApdIxet/Ub0aBqb5q0Q1gGv5BVcjALUP1e1jIMfxF40U
         DDfMA3wmn+FXZ/hTit4QGsxBZH0GiJymUHsvMge/tmNh2WohhnV7abYRfOl90WcJ16/U
         g7zyMriTwSLFbg5aUWPUXjhKAdSKHchF8GBoj4CSjL/GkIQusnKTzI5aqRt6AKPEQ+tK
         h2vaaDPgVFgMM85RI4bbGbUVqH5Av6Zfh7o6/zqplDq0+v/GTNOx0o8QlnHr+r3uUjfC
         bCOQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781626052; x=1782230852;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:sender:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=67luUYDo366p2kkhhpeEjBFUIoaqUmLTWLZe7WejNmE=;
        b=VpYGGiYX668Ot/OddAuZvkfLdYvF4eknyN/CEofwb88iqruVll3r1tPKEmMbXGUG/l
         VctyHEYIhkJhQCt+ZuEnLB38J0euzjllMD5eREmp19NRgWPMnFEs9XrkZ2G6NJMqIxoE
         V2ofGSca6oX0Ee7jl7znbaRZaOmntksrbeh/dKbQnQxbGqEprYv8nmlpE37H9h1rfiqK
         6v3lcyklDMXh7KPw9CmdHqXxS3HhESjcg67Wfc6SMoWte6SIm+amTQPl3R3r9Uc+rdEO
         GIlq4awGTdSvRoUxDQCcI/M1bB4fGwmVM9FyYYH2XMBAOV8WnpCpRtvuAu722iymg+nK
         NsvA==
X-Forwarded-Encrypted: i=1; AFNElJ82jy4VhBusP78zs+4UqB1BZ6HYiJot74iL3D8kUvaMkJ7yExBHfIRQ4hbzuH1wsP3SXBkLfX2mNiMQjw==@vger.kernel.org
X-Gm-Message-State: AOJu0YwE1d2IPtMsYa3KEmuMLCRg7jPL6+G4pdxDK0NwRT2OfSUh6kjq
	W4BFg/rOueDjXabot5forGBhBNyn2d8ORAxPYI3d2Uq7B+FJ7+61IkIh
X-Gm-Gg: Acq92OFayEjh0HQ2Cplch4BROCh15hECQs+IIC3F89xUrhHp48Mhs1wMXOip5L5R/lX
	pe8WbeBB2kfjqpGn4isVlG6BGTlH3nU41b0J5XJN7zu3OWLweZZ3MSfXdq6pqHqMKVGweTIxsd0
	pGJd3siBp6FeVwGrykAJcWGlQ3RSz9CPN/4PxTnR2Gcem8sfoMux37qdluHN08XsjN5QQndP+hr
	p+k+16edBPPU5piKc7eNDeKlkxJKFQgb2rHKXYEZ3ZCbvuGyVuHM39pNIXPr+nRDtnCjn4gWm0K
	gvAc43f6ytsBU/yvaHiNEdM2i0xOSTsM7YZ8r8+ZRshza03PW1SigvVBVhNCPjsOhhGaCX4QamH
	oFDFTmVR5r0C2+eWirENyFPx2+QGTyKoxEEfqkQpGrWt0fpH884jE6PgOp1Cxq89KgoLhyaN34B
	S0E90/kopIDzEz6P2jxA6MU7SUpL83rVN1F+Ey
X-Received: by 2002:a17:90b:3943:b0:36d:b818:f848 with SMTP id 98e67ed59e1d1-37c92fb7b4cmr154490a91.5.1781626050618;
        Tue, 16 Jun 2026 09:07:30 -0700 (PDT)
Received: from server.roeck-us.net ([2600:1700:e321:62f0:da43:aeff:fecc:bfd5])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-37c953c237csm11132a91.0.2026.06.16.09.07.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 16 Jun 2026 09:07:30 -0700 (PDT)
Sender: Guenter Roeck <groeck7@gmail.com>
Date: Tue, 16 Jun 2026 09:07:29 -0700
From: Guenter Roeck <linux@roeck-us.net>
To: Potin Lai <potin.lai.pt@gmail.com>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Zev Weiss <zev@bewilderbeest.net>, linux-hwmon@vger.kernel.org,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	Cosmo Chou <cosmo.chou@quantatw.com>,
	Mike Hsieh <Mike_Hsieh@quantatw.com>,
	Potin Lai <potin.lai@quantatw.com>
Subject: Re: [PATCH v3 2/2] hwmon: (pmbus/lm25066) add current limit
 configuration support
Message-ID: <09f0ed53-1ebf-4f1f-b597-b0ef5ece6f74@roeck-us.net>
References: <20260615-lm25066-cl-config-v3-0-decb4f5b0b77@gmail.com>
 <20260615-lm25066-cl-config-v3-2-decb4f5b0b77@gmail.com>
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260615-lm25066-cl-config-v3-2-decb4f5b0b77@gmail.com>

On Mon, Jun 15, 2026 at 05:49:17PM +0800, Potin Lai wrote:
> Add support for the 'ti,current-range' devicetree property to configure
> the current limit via the DEVICE_SETUP (0xD9) register, overriding the
> physical CL pin setting.
> 
> This configuration is supported on all chips in this driver (LM25066,
> LM5064, LM5066, LM5066i) except LM25056.
> 
> The property values "low" and "high" map to:
> - LM25066: low = 25 mV, high = 46 mV
> - LM5064, LM5066, LM5066i: low = 26 mV, high = 50 mV
> 
> The Bit 4 mapping to High/Low current limit is handled dynamically on
> probe because it is swapped for LM25066 compared to the other supported
> chips.
> 
> Signed-off-by: Potin Lai <potin.lai.pt@gmail.com>

Applied to hwmon-next.

Thanks,
Guenter
