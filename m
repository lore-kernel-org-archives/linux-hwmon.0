Received: from mail-pf1-f180.google.com (mail-pf1-f180.google.com [209.85.210.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2613426D4C6
	for <linux-hwmon@vger.kernel.org>; Wed, 24 Sep 2025 19:39:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758742786; cv=none; b=dci43locV/FXkr4UM5e5RkBTAy93YyzpGVwIlD1b2Zez42CQAc7l2SAXesi9atRS924hqx0HCHjMZUVTzdwqfOIPR/1hWQg/5XR5RNrbnNxs9FPGxQvzswoEAeMRdoiBlPQc90YB5l7y0YsTEXk6eB+tHT1pqJhE3LSxUknKSNE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758742786; c=relaxed/simple;
	bh=ICPnfFS4kubuSl7pZwGurfth5grcpjlza1eBDyLq3YE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=JriWdDjJB4EMdLVB4MBTStxoJzr+zcTaqoVZU+HE+5pqnEu/shhBQjE9qAZeXinLAxuUYsd9iOrCSvefTIwLIFrjTAjwzAsQUvi1EbHP0PKyuwzT6Inlnn4N4gttnHlY8TyVKdE0TBvKfoMEn+vTwCAB+35GcHb6skWMTaS9Lw0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=NVJfhKd0; arc=none smtp.client-ip=209.85.210.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="NVJfhKd0"
Received: by mail-pf1-f180.google.com with SMTP id d2e1a72fcca58-77f7da24397so226162b3a.2
        for <linux-hwmon@vger.kernel.org>; Wed, 24 Sep 2025 12:39:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1758742784; x=1759347584; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:sender:from:to:cc:subject:date:message-id
         :reply-to;
        bh=aNkLTiT6cm5bH/x/nyhOAChDjIKFbk89k+a2btrwl/Y=;
        b=NVJfhKd0Eu2njnc5C06INiEB9RmU9tD5hTSIJk5zxvAenZs/nmMqHBAFn9oXYdd6uQ
         rZSkp5VHXqbKlSr0kY8/B65mgZixuUOWVNcCQPcWPhhGOFe/ygA3pb4PTr6hRT1qdUE9
         gNXoErAbV+t2vEb3AN9+CEXAo/mf59k/f4Soc73VeweUuTFFBZkjdDgrbAwy/tQ1jUdl
         O0XeNcyKTbmkvcI/MCNuiW4lULNVj3EEyogcKsaiNQ6sLJtOu6OUlXA7RkID1k1xh6sF
         Cz3WjXVh7Bc8dxC/HhpUlLLPnxsWYzkf93VNuOMn9tQbGp8HhtIbDndDaPhpaCiFWhlU
         64rg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1758742784; x=1759347584;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:sender:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=aNkLTiT6cm5bH/x/nyhOAChDjIKFbk89k+a2btrwl/Y=;
        b=Q8GqQhdIJ982U6yIoStZiT2rY/5SJx8Xk4oc8DYHwRhFuJudQ9NZ0IQ1VFttMQTR/K
         Ydqd9q8c/9yTVsqmUdJ7kXV5GWw2kaoBQbuboe7GeekhZKq72o9iDZQYSAJBPANZmltq
         vEZ2PgIjjH+D/gKzV4b/HYjSeJmFEszR2SWtp101q60bovrRt98FZxmgaP2ixMimqiu2
         OLI91GGrRxAhVKgPlyBqLVmZlUx+rrC2lJ7nEgztOgsB0cLg9cOEAbT/bHHhGv0sw2w3
         nvwrnGwg8EF7zFRMKv8jV71laqh/+pSroL94Ww10HgXUC0ZKodPDRf2c7P8X98N4Qw3Y
         vRCg==
X-Gm-Message-State: AOJu0YzwimyKasfnQ9/hYj4NL+WfcCfkwGgrnsL451wKINAiSw/vIPe4
	Yf0hwaYLhntFi2yhoiPVLC1lGVQ0g2RmFWiqu91x3xYeOmDkO9jQp6frfHbpNwBr
X-Gm-Gg: ASbGncsoHo4re4SG1E6Qt6EIbnLCMGpyltjoIRzzWl/2tWEGOdME44zLyytNA4g9cF6
	gosXOjswXOcppxArJCw9Yt6wCENtAxbzAd6//Xb4O9F6vOnqnCB9NL2opWJcpn8e0clEOo60xMz
	XQ7KS36LaIvAZE004iPrHXtlyBHpbr1b1+/kILHPNancublzKIzEaW4EyuP2Rn4UfLFiWYOvzfo
	4089ksJh2i6UJXgiLkHjFIRcXMlkuQqA6ihvKl//FfnXmU9vH/h/KtRtyethkoraf07om34Jhjp
	aGx4rqIModLamLwMWSq8XICQ6DXwt2rsL7l+s15jmWn9rzzIPBd0IsBVeyOF4FvPzPwG92Jl7ED
	1VuGr+G7vUfxKWYtbpibyLtiggkMvsCIoMg8=
X-Google-Smtp-Source: AGHT+IH9xuie3DKY4nR/Jej62LteEsj2LxVsoIJC/eapoSt+rhyLTleGtP5HtEbMfWgw/V4jRyxZQw==
X-Received: by 2002:a05:6a00:2294:b0:77f:3018:c994 with SMTP id d2e1a72fcca58-780fce99a61mr1349554b3a.17.1758742784349;
        Wed, 24 Sep 2025 12:39:44 -0700 (PDT)
Received: from server.roeck-us.net ([2600:1700:e321:62f0:da43:aeff:fecc:bfd5])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-77f097b60e7sm14927463b3a.1.2025.09.24.12.39.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 24 Sep 2025 12:39:43 -0700 (PDT)
Sender: Guenter Roeck <groeck7@gmail.com>
Date: Wed, 24 Sep 2025 12:39:43 -0700
From: Guenter Roeck <linux@roeck-us.net>
To: Vadim Pasternak <vadimp@nvidia.com>
Cc: linux-hwmon@vger.kernel.org
Subject: Re: [PATCH hwmon 2/2] hwmon: (mlxreg-fan) Add support for new
 flavour of capability register
Message-ID: <77289686-52f3-46f9-bff2-25ce7ff77c5a@roeck-us.net>
References: <20250113084859.27064-1-vadimp@nvidia.com>
 <20250113084859.27064-3-vadimp@nvidia.com>
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250113084859.27064-3-vadimp@nvidia.com>

On Mon, Jan 13, 2025 at 10:48:59AM +0200, Vadim Pasternak wrote:
> FAN platform data is common across the various systems, while fan
> driver should be able to apply only the fan instances relevant
> to specific system.
> 
> For example, platform data might contain descriptions for fan1,
> fan2, ..., fan{n}, while some systems equipped with all 'n' fans,
> others with less.
> Also, on some systems fan drawer can be equipped with several
> tachometers and on others only with one.
> 
> For detection of the real number of equipped drawers and tachometers
> special capability registers are used.
> These registers used to indicate presence of drawers and tachometers
> through the bitmap.
> 
> For some new big modular systems this register will provide presence
> data by counter.
> 
> Use slot parameter to distinct whether capability register contains
> bitmask or counter.
> 
> Signed-off-by: Vadim Pasternak <vadimp@nvidia.com>

Again, sorry for the delay. Applied.

Guenter
