Received: from mail-pf1-f180.google.com (mail-pf1-f180.google.com [209.85.210.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9EE4378F43
	for <linux-hwmon@vger.kernel.org>; Wed, 24 Sep 2025 14:42:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758724974; cv=none; b=c59pjALogh+2aIuW/AlMEtK9AC4QDWhiXrQLJPzbol+gGkrrvF8m9YYebKH5HLnGee1IUEvrfblHFia7hugi7ywV7rdHFwzMekfiv3awZSEtbAPyPUHLIX6fOI1Y475m6Pv5BMzGvblfRAvQiTtdp1ggOoItVE0CjHTKpI7HE2g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758724974; c=relaxed/simple;
	bh=Qi99wGIzKeaUad3sDiEcjysh7dML+0H6SlWCfVtNMOQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=A9v3ros02gizm6hlOfnYfan3cYTEtXMDVLw/ihPN48ISEGarU2+WsH1yDAqZAbW4ezeNWrCGirOoz6Y+jpvOc+1MTbJmI6gmoHMTCPfxZkSJOlfPWgertLKPv9seW8PaDvo4VZHOmZqbIrcyVub3r2/j9SGQjbebaVW6HaEWDK0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=PTVQnFUU; arc=none smtp.client-ip=209.85.210.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="PTVQnFUU"
Received: by mail-pf1-f180.google.com with SMTP id d2e1a72fcca58-77f1f8a114bso1026828b3a.0
        for <linux-hwmon@vger.kernel.org>; Wed, 24 Sep 2025 07:42:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1758724972; x=1759329772; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:sender:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Qi99wGIzKeaUad3sDiEcjysh7dML+0H6SlWCfVtNMOQ=;
        b=PTVQnFUU79O8vzgqZhmtnLZh5W+Pt0eadQ4Fi8HeB4uItw4NdFzlljwmzYjmsKgXI6
         WTgCJj88wWhKOQ2XbFxeVvb3onp87FKVMSZ+JcSs4IQ6/eQEwlE6bds3Lrl+Kp0SFnmb
         ZMAbEvESwCROzyLqD2AQtWSBg+Op/MaZoIkU3Gp5GSM3aKSuVWm8d8y5nOclV8/gJY+b
         W+C9uQIe3B0tPsjt9gfFcUHUcu5qAtqGyKrAHGUv4SCSQZnFaZ01Qj83wX0Q40DKixif
         l4G5DSXEALcIIL9sdDAsGIWHk8Y7Ot51SDcGMhF/4ElwxCbAg5vrcZOlFNnm6nwIqVBz
         yKdQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1758724972; x=1759329772;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:sender:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Qi99wGIzKeaUad3sDiEcjysh7dML+0H6SlWCfVtNMOQ=;
        b=psQHXAQN72aGty5f0kaGZh1mZi76ogihtobIlpGmgbB9ADTo2WtRhEyMHI4ZARmiE4
         8cP7Bp2mlhL/WVFUfDSHWNZCNxRpoOHN3pce+cutdXRzvVbuBArQ3d9GhKurmrxh4dM+
         TZUNg/D7kOEnK00lG9ICxNT8F7v4vwZSN3xdCj+PAoRSvLtbS3HEQCdM4Nsos7JXnr+3
         vhSQZeGgf+62Uu1G5NbJoqiCVby+hXt3wqrDaK2TTO1foAQqsyCHI2XX4zcaAdWD/9jS
         eiE3RrbWa11vMXOTDfbhGD6T1c5vvovAhd7MHQwp+0C92CNQDqb2N49sgC9tH6Y1Sd9B
         BH3A==
X-Forwarded-Encrypted: i=1; AJvYcCVs5OPlZhOzmTw6EqxTEzsw6JeL2TI4iKS6t3X5ZkHzVzS41VkjGJw4aAzladn0CFgNcrII9Ii+XtHLJA==@vger.kernel.org
X-Gm-Message-State: AOJu0YxuRx7+24Gla2ZJXXp5uDEMnDWoEsHALjiW4PPSuL9XFW8cScw3
	jAqL9H/YnKTFVuMFtalI0VBBW21BxxGiqgl7PL+u676vvSCHxt9zfiEC
X-Gm-Gg: ASbGncs6uMPD7HnbqFQsbLY71arZyiPeXK+qz4Dwa4avdW9gSQW9NtPvhwjWbDFiV0p
	5nxHVL2n9SR7HKpL0onoVMmG9V2JZ6Aev1zYqDi7asYfqQi4girl3CsZtfgEEiL5RklpstmBT7z
	OQyxqscLB0crmDwYSjMfxOUZ+QPf9/aponNbX4EUNJx6CE36O+d6RgctIO9VHrn+18/4EDJeK2d
	5RtZcBwUy8y/fSuImOptFTyJJKkr80SgXeXIMcC7DZj9EUackHWCuK0PBLWsz3nhfup+jhy33Kd
	yJ7Y1tJWcU0JTouRugUxG9NA7D4uo1fNIeKKAiC0raJUp88fU3BpYOOp9dbl8EPkuKmSaGaY06m
	2o2yuxT0daeIco6nY6CJRSzCABJJQZP7pHC4=
X-Google-Smtp-Source: AGHT+IGh3h0E81Q1ukwkM0pUlfPxVBz9FgZBOD0oJJn4La63+Ve2DMvTsoHX/t4ygfBSH0SK7iio+Q==
X-Received: by 2002:a05:6a00:2344:b0:77e:eb28:c59d with SMTP id d2e1a72fcca58-77f697803ecmr2756206b3a.5.1758724971968;
        Wed, 24 Sep 2025 07:42:51 -0700 (PDT)
Received: from server.roeck-us.net ([2600:1700:e321:62f0:da43:aeff:fecc:bfd5])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-77f61ce72ecsm3233549b3a.23.2025.09.24.07.42.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 24 Sep 2025 07:42:51 -0700 (PDT)
Sender: Guenter Roeck <groeck7@gmail.com>
Date: Wed, 24 Sep 2025 07:42:50 -0700
From: Guenter Roeck <linux@roeck-us.net>
To: Yuxi Wang <Yuxi.Wang@monolithicpower.com>
Cc: corbet@lwn.net, jdelvare@suse.com, robh@kernel.org, krzk+dt@kernel.org,
	conor+dt@kernel.org, wyx137120466@gmail.com,
	linux-kernel@vger.kernel.org, linux-doc@vger.kernel.org,
	linux-hwmon@vger.kernel.org, devicetree@vger.kernel.org
Subject: Re: [PATCH 2/2] hwmon: add mp5998 driver
Message-ID: <5f651f3e-202b-4406-b438-421489b874db@roeck-us.net>
References: <20250923090926.619-1-Yuxi.Wang@monolithicpower.com>
 <20250923090926.619-3-Yuxi.Wang@monolithicpower.com>
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250923090926.619-3-Yuxi.Wang@monolithicpower.com>

On Tue, Sep 23, 2025 at 05:09:25PM +0800, Yuxi Wang wrote:
> Add support for MPS mp5998.
> Signed-off-by: Yuxi Wang <Yuxi.Wang@monolithicpower.com>

A separate patch was submitted adding support for this chip
to the mp5990 driver. I applied that patch instead.

Guenter
