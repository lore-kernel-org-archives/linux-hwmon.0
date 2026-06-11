Received: from mail-dl1-f47.google.com (mail-dl1-f47.google.com [74.125.82.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F351E3624D4
	for <linux-hwmon@vger.kernel.org>; Thu, 11 Jun 2026 05:07:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.82.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781154461; cv=none; b=MwcqKjKVun4Koke/O03v1kEFwZGQi9ox2P1+ZhpKCLyd0HTqJswFNG7ksvg3lZkP6ZUBfntCt6zCLKvS+ut8MxoTomDznzEXf7v7fNqtv9SCvterwZKz6sHlfqWt2K8Qg6DS1K7hkZKTQAWwaOy+x/78E7Robsn13avKIPo4nHI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781154461; c=relaxed/simple;
	bh=RpCJqOkiv1DLPrXO2op820j5d34x1aL3ItTtqyK2uIM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Rq4O+Tmx9KzZBArwVwfzKX3BMQqmmN9CqfTII7tnNPJyCxi+OY67EMmDBAXu6NTT1dbLWU59oBUjXP0mlmd4zLAEOFUM+DHy8N3F+1mBKhf85Z0Tw7ugaZKru/GxonIfbjdCX7th21zx7haGmwnSHbjTPY908MsrN89kYkziP2A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Iy8JRuwF; arc=none smtp.client-ip=74.125.82.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Iy8JRuwF"
Received: by mail-dl1-f47.google.com with SMTP id a92af1059eb24-13807d2f898so7003743c88.0
        for <linux-hwmon@vger.kernel.org>; Wed, 10 Jun 2026 22:07:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1781154456; x=1781759256; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:sender:from:to:cc:subject:date:message-id
         :reply-to;
        bh=k8/LBM2ge9TbM3J9QaUuiG08J7fVuFMBLdE+TcGBJNo=;
        b=Iy8JRuwFqsg8yTOS7vqP4Gl+ND4fTjbd3T6KMRl+RGnFrIx1EWT8jmZtUVpYSspr2g
         J+0HYgNjk+VQonCSi0HW0NhXmurSWoHMRYvLKtzND7e5AaL8mpGIgQG1dj4ZsqEbnX5i
         AeekVfZ6TmQFvKkUGcON58vC9TOv/NpcrtuPiF2dWvpPxn2nR+nHhGYLMs+2X+YfHSuY
         VO18pFcgBdnp/yMItLJgeGnzAqHpWBrTSxQT7FJCgeQYmRgP7QvRR91gUGrjKNtzwtXX
         Dn9CFoxFePPUTMyHCRezSuc297WWqEhE4SI+E73KexYCUGdUygV8CG3hpb1Z8RVrADcL
         Gshw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781154456; x=1781759256;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:sender:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=k8/LBM2ge9TbM3J9QaUuiG08J7fVuFMBLdE+TcGBJNo=;
        b=iQY0hDRQQp+cma5xL2XfFQltsjj2nmltfoOOGWrwr96m4QxaogUYOq5Yi29QizAuDL
         p02F4C745+uhPUyBUIDPdsXYnK3ZDDDFSvRxlsJc9yxuZ7CjbmSXx9ImLeqM/0NtD0Ul
         4gtg2dc8BRtXWiOTYKGcPdR2ZyF7NDkIgbOM1xFLeiX17shf1qmahzWiKtFCaZIH/L+8
         XpASSQQm91Xpcpig91ScnFDJUqY+ysBGTlLtcywwKU2COR1+SAJnzYSz5dZ5lPznlMcB
         UdCcjJW5K/29cXs36ilpMMMOWKBr7l5o5fL9nZz8L2GZ7jL/htygDyFTmKG+mlHwM/e1
         fZug==
X-Gm-Message-State: AOJu0YzzW49qIVheFbNemk924Ao6O9FJIoFSYC0GJFHWQDRzD7vsNmtk
	RCKN4KUaxwRhPM2SzmrXDPJnf2oSE0Hruc3RUfZjizB334oZ23v/IFSGPG+ewu48
X-Gm-Gg: Acq92OEogFqmDkq/hwAgpkL/T14Ru9o28U6ixHQIo3p4Wp5nqZwkuZXWKi74gL1vcMh
	dce0QjfpKWzBZ1nawGSy3FnVwP+O7UOJ+1p7T/bvB4kFHnEYrD/BTqb5EAopLudh6630iY2RmH9
	5xzwFS5RaNO7QvmaGg26mJESNj18HVEG2Y3Gqdjsmm+LraKjZmWCqzmBP20GaXrFePC5423+5Hk
	gX6MkSAc7BQ0x0D63vK5UVQbrLIqr8Z5F+cqif8bjhSkvbPSU3Xf0iQPCaXudbabz73baJQWGcG
	PJJGMTUt7UbzAALq5T2RINWkeiLGPx0FakLx2SZ42xqSAXTqcpsEN9fMFa5kj1y6APm2ikrJPmG
	3ZViFtLDECR55o0YZEU/HoNEsux02W3BN6wa1X0cPyumV3aijEy0NGpA6W+TTVtVH5fyl1p2Nvc
	DDlzOMvsNwCSu4VzgRM/gLgRFm1FiOrl3vi7eEnN/URTAbAcI=
X-Received: by 2002:a05:693c:83d4:20b0:304:e6f8:7cc6 with SMTP id 5a478bee46e88-30804a0efeamr564147eec.19.1781154455677;
        Wed, 10 Jun 2026 22:07:35 -0700 (PDT)
Received: from server.roeck-us.net ([2600:1700:e321:62f0:da43:aeff:fecc:bfd5])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-30806c48b52sm736666eec.12.2026.06.10.22.07.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 10 Jun 2026 22:07:35 -0700 (PDT)
Sender: Guenter Roeck <groeck7@gmail.com>
Date: Wed, 10 Jun 2026 22:07:34 -0700
From: Guenter Roeck <linux@roeck-us.net>
To: Pei Xiao <xiaopei01@kylinos.cn>
Cc: linux-hwmon@vger.kernel.org, linux-kernel@vger.kernel.org,
	cryolitia@uniontech.com
Subject: Re: [PATCH v2] hwmon: (gpd-fan) Reject EC PWM value 0 as invalid
Message-ID: <aff6de7e-498f-4cb2-8928-3e82978d83a8@roeck-us.net>
References: <1c2ffa0d832ae3a74f6d4ffa7cc7b7e6cced69e3.1781138459.git.xiaopei01@kylinos.cn>
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1c2ffa0d832ae3a74f6d4ffa7cc7b7e6cced69e3.1781138459.git.xiaopei01@kylinos.cn>

On Thu, Jun 11, 2026 at 08:44:14AM +0800, Pei Xiao wrote:
> The EC firmware is expected to return values in [1, pwm_max]. A read of 0
> is illegal and would cause underflow in the conversion formula. Explicitly
> check for 0 and return -EIO.
> 
> Signed-off-by: Pei Xiao <xiaopei01@kylinos.cn>

Applied.

Thanks,
Guenter
