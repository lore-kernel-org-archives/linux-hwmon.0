Received: from mail-dy1-f174.google.com (mail-dy1-f174.google.com [74.125.82.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 409D6382288
	for <linux-hwmon@vger.kernel.org>; Sat,  2 May 2026 18:23:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.82.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777746230; cv=none; b=Vbx+9rG+09/c6voMRCdKMooF0FV50m+NfCJEyQDtwKiwxi0JbWne0fNMh6Evfl0YzCNrksfEpXYoWoFGGeo1Pa1KU6NrDuagOmbo1wl7HVonE84EOIfotLF/xNtXpyTIOc76fIdYLbuN/jolzPaj4u8XMNrYZIZ0zOMJWwRsJEc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777746230; c=relaxed/simple;
	bh=/JZ7X4T/h0NnmjWz65EBKYU2mQrWeemJS0en2zcpv2Q=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=USO9HTIFsaBwZrjyx1xRAMUkPUI7pgtXBn9g5sZlKO5MM77DsxHuKKbhMp/FpM1dmJnpz27x0BQVgxRCuFbXpaBs6OdS0qaL/gQdui+La9aQzj24vUxArrKheyRVoDreUHwk/31DlZ2YuKKTJEwaNNBsCdfo8m5AliHztQ4Ez74=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=KdPKMSt6; arc=none smtp.client-ip=74.125.82.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="KdPKMSt6"
Received: by mail-dy1-f174.google.com with SMTP id 5a478bee46e88-2b4520f6b32so4409309eec.0
        for <linux-hwmon@vger.kernel.org>; Sat, 02 May 2026 11:23:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1777746228; x=1778351028; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:sender:from:to:cc:subject:date:message-id
         :reply-to;
        bh=niqmaPYrIRL6pEqOUUxVRD/ACd/HcNml6ARMk/pYX9s=;
        b=KdPKMSt6us3ThNa3DoJvIKRMCalsrlm3rgS2FgIqi1fja/a2sCrR8/SFWNRxOMsQPt
         Gw0tqqNt86WcstP16lkYuECT8Vgh41+6yI9jZhTDTip9PmrFGx6c7kqnaSyZEAy4sIJi
         BpyIULPh0KeSmz/tAI27fW0LxS6QAuatMdJ8QX0c+oZwJuHGisg/1MoZBRyISKQmLCje
         dh6oO8yCFGHFKHylnyPe4g7HSgqlvpbdcTKhPQ/52EiMO03CkJQ1NFSrXDfv5gWXT5Jq
         VIJlbqnAwkZQERHTsv4sOI5kDqvHls//ktLUZwoyqWm80Egy/OQmN7U7weVViIVmpwRd
         N2Mg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777746228; x=1778351028;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:sender:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=niqmaPYrIRL6pEqOUUxVRD/ACd/HcNml6ARMk/pYX9s=;
        b=R264fCKv9laRUFjWQo345vzqIIq6zq4kXmfEDHQD9FidzV1kHzz1aMV4IVIBERWXiY
         IzQf39KU408wfNUYy4z+mh4q6RfLPrDU4lOkaNpa6gh88b+iqlf65VciQSdK4N2lWHRY
         4v4Mr5LZaUzGwT/n3qpYw8aOzJHTZrWfcwq81Ys1Jh8ZERyxg0Zd9Tf31TnyAWA8FEpV
         WVP4NLlwZr5L/GswgFrt7oIAhp/GQxHM3M2ypu+UgOgHV6chmOMuMW7jGlAuhjNKqf7d
         HPr3AEZLfmkaKx+nrfCNH3lpGLcZI9xzaRg8szTsvcHEwyOFBANs9MDaKUvBX3sLbx0M
         eMBg==
X-Gm-Message-State: AOJu0YyMl+9urm+XxSchUbTajsQbCK5GaYEoz4f83cYxhe/zgXCYdgDr
	TSMK93bjFzYiGVbnMP23A/Hxk7x93oC1CKF50DrcVn+WPNm76FqyoO+S
X-Gm-Gg: AeBDies7rUzrYAI0kLMJTPWm/VYlHFJtxDdQklk5Sznt3ICPfQOS7awB6vrKPUaMaqc
	3h8XZ89SrO4QMGGbHchDY9dMC48kT45s7gtIGSUFOfflQmacWwbQRBJzx3fbJsZniRLSQAg0mWT
	N+3Ma7B3CHMurNZi3EhztGvLUt4i2ecXY9tJBjzMRCLWosaXY7gAXlBUZ30eAxTZu6h+Qv7W85d
	MffS8eATbkI8mpkGR0E91QVkpJIAYPKoO8KEfc2gQLAlQ/pGJn8lsGzAwSlWg0Cs4CQXUGDn45t
	2w0LCNEO+Juw61d1xqStfia5KnhU6L8tHjrwTujhPDuPzBYsN9aKl6iAXyHQAMM/uwaer4pKGYl
	VskESUd1UE/TkiW0WHj70jwADX/N6yeoVxugi5l/A9gomBDmLXDU1avQOp6u7aECMTW5TTm2SQO
	gYcHH5Uni/UI3mfSShLJWg6WS9pDlHkC4iwAgZsd+zBR6JVvM=
X-Received: by 2002:a05:7301:6786:b0:2c8:7172:3b88 with SMTP id 5a478bee46e88-2efba5b3e9dmr1728972eec.28.1777746228364;
        Sat, 02 May 2026 11:23:48 -0700 (PDT)
Received: from server.roeck-us.net ([2600:1700:e321:62f0:da43:aeff:fecc:bfd5])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-2ee38e71cedsm10971844eec.9.2026.05.02.11.23.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 02 May 2026 11:23:47 -0700 (PDT)
Sender: Guenter Roeck <groeck7@gmail.com>
Date: Sat, 2 May 2026 11:23:47 -0700
From: Guenter Roeck <linux@roeck-us.net>
To: Tabrez Ahmed <tabreztalks@gmail.com>
Cc: linux-hwmon@vger.kernel.org, linux-kernel@vger.kernel.org,
	david.laight.linux@gmail.com, me@brighamcampbell.com,
	shuah@kernel.org
Subject: Re: [PATCH v6 3/3] hwmon: (ads7871) Use DMA-safe buffer for SPI
 writes
Message-ID: <8f4363a4-b05a-4e42-8868-e7b611fd0dda@roeck-us.net>
References: <20260502020844.110038-1-tabreztalks@gmail.com>
 <20260502020844.110038-4-tabreztalks@gmail.com>
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260502020844.110038-4-tabreztalks@gmail.com>

On Sat, May 02, 2026 at 07:38:44AM +0530, Tabrez Ahmed wrote:
> The driver currently passes a stack-allocated buffer to spi_write(),
> which is incompatible with DMA on systems with CONFIG_VMAP_STACK
> enabled.
> 
> Move the transfer buffer into the driver's private data structure
> to ensure it is DMA-safe. Since this shared buffer now requires
> serialization, this change depends on the previous commit which
> migrated the driver to the hwmon 'with_info' API.
> 
> While moving the logic, also:
> - Corrected the sign extension for 14-bit data by casting to s16.
> - Scaled the output to millivolts (2500mV full scale
> ) to comply with the hwmon ABI.
> 
> Signed-off-by: Tabrez Ahmed <tabreztalks@gmail.com>

Applied.

Thanks,
Guenter
