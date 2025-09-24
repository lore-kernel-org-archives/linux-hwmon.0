Received: from mail-pg1-f174.google.com (mail-pg1-f174.google.com [209.85.215.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 00F1126D4C6
	for <linux-hwmon@vger.kernel.org>; Wed, 24 Sep 2025 19:39:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758742751; cv=none; b=O4FHy/7MEZoyTv8C8ulXe3LE0yjmh7YxOmLZ01Murf1mC9SUB4j3RZ3vzur4rDhg7slnW6s+Hr0nWjddgL8WY3DSkfeaPHMhOcn7RDXuLTovdQVTmESRhH4wP44EFFwnTAvtzqH1bRapgz83niqMCSswF5BpTz+GJRmfb4kQNaQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758742751; c=relaxed/simple;
	bh=JiTWQ1lrz5kJGJn5ym5vS/P6oG5RjRjh2GhRCvL0X4U=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Yo73+5lHOtlXGEjSXtCp1/F2ueJxQIzSSxZ1meisXykdGdcdjiSL0Uk9vYQUvN048hSIq5tBEc++9EC15OEQy1pTGt2uuFKndUiAnqyBL7A9KlLHSTOxtqgHReli2Mckz2Gr6fzuaeoRMnyIpAY2me/7MGP9bEdlg3M6Nb9A2fo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=A/hCXfbF; arc=none smtp.client-ip=209.85.215.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="A/hCXfbF"
Received: by mail-pg1-f174.google.com with SMTP id 41be03b00d2f7-b523fb676efso188270a12.3
        for <linux-hwmon@vger.kernel.org>; Wed, 24 Sep 2025 12:39:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1758742749; x=1759347549; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:sender:from:to:cc:subject:date:message-id
         :reply-to;
        bh=DapdYW/8K2njbhPTFHcK+aSt3gtXxOr7Hh6qcpRxAFE=;
        b=A/hCXfbFn3AYpT46H3TdS8pzhwCIIgQPuYwK32lhe5UIdt2e25A80x+5PCgDLUnWr9
         wgHduw0Gi1Y0PljaCp2DKUn1UpBeDdk4uE87+P2cL160p5VJJG2SI9Dj+9hHFciTNBkZ
         6Pua7zlECrgg5c//pxky4Tpf+K4f1Ojm04+fX578RwXqmUkc1FlzwpDkbWLxYavob4MV
         JEmOAQ0JzfmUJ5E+trpvLz++H0LMdrptlRsaxs1AkGkBIoBwsYwp+9ukJHVluclCqHbn
         dNvRxqy9Uesw+NuaoPDPe5H6jLMNWLBeIDf8JQPtTJ0twEmqqYTyX4yIEeT2MjAuHlvG
         3pTw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1758742749; x=1759347549;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:sender:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=DapdYW/8K2njbhPTFHcK+aSt3gtXxOr7Hh6qcpRxAFE=;
        b=LGD3ThTyPKmcBznDF4tuq/tqhXdixTOJduFb7/3YSexDyqNFXL8iajzAM2lLx3prFf
         PqeZGT3mHbYVpYcZaBvlYL8dPnqCqJfbuc+zc7YE7YNF4GK4Rp4Nn5BSdfvztjP4ObyA
         ZY+cfv2ni4OOQzdObRNefQ2RFPIMJupPXkMD/u+MF9lxNbOLff6LBKMVOHT76ZX0IX2R
         8nNW9sQPuVnauWbc9vX/RoRlGMyFpOh9d7SdFqi5z9lccvNuvRy30eRWRWt+3MNSI0aE
         YqcA3Q0pXehLDZWusPWU2lkZ7gEeAnfiHP2MV5CDaOvYpkXIAPt7FDZQ+NZSaA8hCyX3
         Xv/w==
X-Gm-Message-State: AOJu0Yzm8lsvlX57d8tR4+JWNkkoKhW1MGs6SWgkxPTKc6QkVH+uIOBX
	GjeJ72x5MnOnTm2Q12Qt81xU3vO90CULeIyF8zeAMF7u3S0WcyUdcg02KoOERiD1
X-Gm-Gg: ASbGncuSyvwejQCSDSI/rL3K3ShQw+I/eglww9pp0Ljh2+g0I8H5P5B1XJQRJ1W5gMe
	oZdDwXOb3MyK+JIjIgk+tVTCzPrbqKOIcmxslB3pMLy/lG+XDssYzx35eTCwohK13xpZA6CR4i1
	BmRhjViR62yoWumXaSPI1FcG5E49PreT5xBJgBiU6nrhck+iSyrFjmuYUEYiDnCYrwxWYT0B4Ob
	w1egKggwNncDUL8DrRzY7VwEmCJE2sGaJ9MzETUdqcRfMY3BK9/2bm8kfLkQfoQeN+pYelSRZmY
	B9qZGHHcsXOMlqDr9sHORstHVCZfLKXfXkhpyk45jFPTjOveAk2RSI+yNMMAs+3yRe93EMbl+KY
	0rkppmAlnKyTovTcROrovaZLcFqMDjXjUORs=
X-Google-Smtp-Source: AGHT+IHDSToUkQ9pdK+8Vgz93PJidaJ2ziRSXiiYh9IU0U0JvaSs1eKVSZwxqX1hl03W1JBfAsXw/A==
X-Received: by 2002:a17:902:f68d:b0:276:842a:f9a7 with SMTP id d9443c01a7336-27ed4a5aab7mr9471535ad.57.1758742749199;
        Wed, 24 Sep 2025 12:39:09 -0700 (PDT)
Received: from server.roeck-us.net ([2600:1700:e321:62f0:da43:aeff:fecc:bfd5])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-27ed689fa3esm317455ad.98.2025.09.24.12.39.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 24 Sep 2025 12:39:08 -0700 (PDT)
Sender: Guenter Roeck <groeck7@gmail.com>
Date: Wed, 24 Sep 2025 12:39:08 -0700
From: Guenter Roeck <linux@roeck-us.net>
To: Vadim Pasternak <vadimp@nvidia.com>
Cc: linux-hwmon@vger.kernel.org
Subject: Re: [PATCH hwmon 1/2] hwmon: (mlxreg-fan) Separate methods of fan
 setting coming from different subsystems
Message-ID: <1f4a8aba-3704-49e7-9b51-e2e4d34b343d@roeck-us.net>
References: <20250113084859.27064-1-vadimp@nvidia.com>
 <20250113084859.27064-2-vadimp@nvidia.com>
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250113084859.27064-2-vadimp@nvidia.com>

On Mon, Jan 13, 2025 at 10:48:58AM +0200, Vadim Pasternak wrote:
> Distinct between fan speed setting request coming for hwmon and
> thermal subsystems.
> 
> There are fields 'last_hwmon_state' and 'last_thermal_state' in the
> structure 'mlxreg_fan_pwm', which respectively store the cooling state
> set by the 'hwmon' and 'thermal' subsystem.
> The purpose is to make arbitration of fan speed setting. For example, if
> fan speed required to be not lower than some limit, such setting is to
> be performed through 'hwmon' subsystem, thus 'thermal' subsystem will
> not set fan below this limit.
> 
> Currently, the 'last_thermal_state' is also be updated by 'hwmon' causing
> cooling state to never be set to a lower value.
> 
> Eliminate update of 'last_thermal_state', when request is coming from
> 'hwmon' subsystem.
> 
> Fixes: da74944d3a46 ("hwmon: (mlxreg-fan) Use pwm attribute for setting fan speed low limit")
> Signed-off-by: Vadim Pasternak <vadimp@nvidia.com>

Sorry for dropping this. Applied.

Guenter
