Received: from mail-dl1-f48.google.com (mail-dl1-f48.google.com [74.125.82.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 32F5D2C325C
	for <linux-hwmon@vger.kernel.org>; Wed, 20 May 2026 13:35:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.82.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779284107; cv=none; b=dNce+tMgdGoIByEXVp7l6vL8dwolRkfVzYyOQokgZBQlyRKsgWIF5+aTdRxP7XYRoE2TleB51QutuqbS5KdWju4L9jlyDlTgngEL58Cp2gC1pIRpCpiqeqUSu1mqxy2RES9q81gjgehP7dD7IpPRFq5aDaG23FtC6AjEhtApl+Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779284107; c=relaxed/simple;
	bh=bfqcKJwJVsdxU+OsVIOUxblylyC49hP5UPV2edFxfIQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=DSFl6ULIu9pysVCOH7m44dmwrVqCUAk/sdd3bJL2ebR1WSXbxxWU6NM52eTtNFzwKHHC0Cbuyg8+6O3YkZtqcjpoiUIwsnSblwe9qxnsT1s+PrZliOQSc3NGJ07zNJ3q8kN4daIojqRwLawZSB3DRAlflq3Jr8h5kfcyEZbJm4Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Msvu5ilP; arc=none smtp.client-ip=74.125.82.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Msvu5ilP"
Received: by mail-dl1-f48.google.com with SMTP id a92af1059eb24-1332772f6b3so6136192c88.1
        for <linux-hwmon@vger.kernel.org>; Wed, 20 May 2026 06:35:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1779284105; x=1779888905; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:sender:from:to:cc:subject:date:message-id
         :reply-to;
        bh=kJO8l0QRuWP0pFrbvTYkzMC6Ke3KuvPS+wOCBatPTaY=;
        b=Msvu5ilPE+FxELZ1RI4irrTVc5wM3s/dKXqpYL124+GtiMDOtUdxz0om2aVpUuV6Pe
         F38z9W8CI9QAytpkHObnVOiIKU7T5ocV8St1j4k8VpQFAI2m2wxonoE6PrKdiWQH8zLt
         B1ZKhdLixDa6pSPQfnGzxRxdeZKLMnb3reuLyRz2ISFmPFG28v8E2PLAaAZHmZ+qGJrr
         3BjY6ftHFnoG6zWsaJ6b8041CW6X5BCowcQxrCPJFj2dn8RrWPQcylYKPR11A3zLCa9Z
         VUjy9VI03E/afeL+5bzg2uqx/KEqd5Ks0jb6mGftIw07T6cOiiYPH+w9OKrQMRFwW+G+
         BYaw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779284105; x=1779888905;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:sender:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=kJO8l0QRuWP0pFrbvTYkzMC6Ke3KuvPS+wOCBatPTaY=;
        b=RFEr9v80uHhAjazI6xbrXqfZeBSCx3iK/Xuwszf+iDIPSSM5LlfShKzc4/vTgYwcx5
         US62+zfrGsGi5NlZUR+vXE5imeJDq1N+3K+iGQyC0dhbXfDcKTMN7SWvoC+gUF8zj++Z
         ahZHO/JvSqXuIicsFyMlHBv+ryX8bKb/Y3qgV+qTCXT972iDeyUvOGOeEK+ZCNJ7RyGX
         vtYPgQsVktAv07JM38+6H/kZ7V+AG+1WE8Eclk2LO6dBVCJ9hGOr5jYiDPZpoQPccKoB
         5RjEORbtIjbcN31564b6uqj1Ecj8ApKETD2WbctiEbfuYHL24Z1Lh9i3x/oGd8tEw+21
         t6TA==
X-Forwarded-Encrypted: i=1; AFNElJ8E9naZDc1J+w3/0XoNLTEKnvM5+g9EzjqsdV553uzKqPcqGIaC3iWYRKzqUrlUSi9vcyY6OU0SIOTbeA==@vger.kernel.org
X-Gm-Message-State: AOJu0YyxLPnt3dKRI4g057mEnteItMjMlIxvZ4wtNwfkoduNUQQbLw6V
	STGkF0IiiHiQCDnGWArTtNKFqW9AhTA+rJowRbUplfctfcnsVQiZzAh+
X-Gm-Gg: Acq92OH3Gr0N1YnEXV1cBC1BhW0OqH9zoAdhJMNc8+egrUuq2wp1C7AVN+4MTQbARv/
	Vwh/AUhjKu6eVNKSP/GbScCcFXX0YMpsN40cKcZozf8XDDbDbRudzmlEo0duonRueGbqyAbucpT
	2zqKzUrV6nnNMegQqFx6mtpxoQa1/uedVYSCXeoRKuH1N3ggZ+EOyrYmxW807fKX4XRzjdGwayW
	vEUfwLnNkq4swe/dMo3KPD66B+i0qs28/i2DUeRRlvNNRPjJUiUJbqpaquyS3PB/XxdVFu30eD6
	JvNeNt5lafq5sJ9IpTaiY9UsyK8w2Ru9XvGgJoWqZKRc2wcARRJz0eK2e8vBmMRjJL6MuDrDQQD
	BtlTdx6hUEOrnIguO5E1hwa+ILK2FLqn5Z7E8d+s6S2/DQpnzN15Kbp17Y+Kf3ZivzpL1RPN77o
	OAmy3QFoQ0m92IMRbnQuG/Sx9KO4Q2j5pSr387
X-Received: by 2002:a05:701b:270c:b0:135:e312:47a0 with SMTP id a92af1059eb24-135e3124911mr1830342c88.26.1779284105158;
        Wed, 20 May 2026 06:35:05 -0700 (PDT)
Received: from server.roeck-us.net ([2600:1700:e321:62f0:da43:aeff:fecc:bfd5])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-134cc2351c3sm28779710c88.11.2026.05.20.06.35.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 20 May 2026 06:35:04 -0700 (PDT)
Sender: Guenter Roeck <groeck7@gmail.com>
Date: Wed, 20 May 2026 06:35:03 -0700
From: Guenter Roeck <linux@roeck-us.net>
To: Shubham Chakraborty <chakrabortyshubham66@gmail.com>
Cc: Florian Fainelli <florian.fainelli@broadcom.com>,
	Jonathan Corbet <corbet@lwn.net>,
	Shuah Khan <skhan@linuxfoundation.org>,
	Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>,
	Ray Jui <rjui@broadcom.com>, Scott Branden <sbranden@broadcom.com>,
	linux-hwmon@vger.kernel.org, linux-doc@vger.kernel.org,
	linux-rpi-kernel@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v3 1/3] soc: bcm2835: raspberrypi-firmware: Add voltage
 domain IDs
Message-ID: <82f2fae4-0c1b-421c-81e0-dcdc74d0225e@roeck-us.net>
References: <20260516164407.25255-1-chakrabortyshubham66@gmail.com>
 <20260517080445.103962-1-chakrabortyshubham66@gmail.com>
 <20260517080445.103962-2-chakrabortyshubham66@gmail.com>
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260517080445.103962-2-chakrabortyshubham66@gmail.com>

On Sun, May 17, 2026 at 01:34:43PM +0530, Shubham Chakraborty wrote:
> Add Raspberry Pi firmware voltage domain identifiers for the mailbox
> property interface.
> 
> Also add the voltage request structure used with
> RPI_FIRMWARE_GET_VOLTAGE so firmware clients can share the common API
> definition from the firmware header.
> 
> Signed-off-by: Shubham Chakraborty <chakrabortyshubham66@gmail.com>
> Acked-by: Florian Fainelli <florian.fainelli@broadcom.com>

Applied.

Thanks,
Guenter
