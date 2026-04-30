Received: from mail-pl1-f172.google.com (mail-pl1-f172.google.com [209.85.214.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7CEA3477992
	for <linux-hwmon@vger.kernel.org>; Thu, 30 Apr 2026 17:26:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777569982; cv=none; b=N/Yu5n2jnRAJybE9WMzr9TVMh9UjGWJqh4kn9HgchlJ1XwLfbTQMTFXPA9n2uv174YpGOIKqAnTDTUSyl85xjEOb7D8PnB6IBZV7rtj1jqmmxr9qsxD2SFMDZ5RSxsNaiRT8V4I8ZHUeMGkX+aycSpoxVJPk9tu7EsS9gyB09o0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777569982; c=relaxed/simple;
	bh=p3/8v7rfWr1oC79FR638siiBFA5stQpRGXuy0w7u03Q=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=QvSiI1/ZZmq3VN+34m1ZpE3ZkG2NDScJqR2OB8gMWW1bf/ExGMKnCivP5qXCWyghhGSRCuE20TTfj8kDP3sQgvSzJjKuZxtXHKjvShtyyB2mapHDxwAOHgF3VrHeA2oBrHOBJCXaYS55yHVtVc2a5LQByHNsRJJp14+ZJjgerN8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=KsYDPixo; arc=none smtp.client-ip=209.85.214.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="KsYDPixo"
Received: by mail-pl1-f172.google.com with SMTP id d9443c01a7336-2ab232cc803so5821735ad.3
        for <linux-hwmon@vger.kernel.org>; Thu, 30 Apr 2026 10:26:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1777569979; x=1778174779; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:sender:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Se3AJTdhyJJ/0aYmfXtRV9Pj0lz/F2PvRY+kJoyMliY=;
        b=KsYDPixoyxKOe2eYNgJP5ZN7qc66xojp2jhiSVDwgln19BaSEgEkkb9b/AcrNvXSaQ
         OczkBWoMcpq4l3xCS9Nam77lH5/X7jaSaMpZOjnZXb9DXaMzVgGPp1z0JU/YKmjN+JzU
         kuWGbSPpOwHCo7ahj1GoRf3MgmqIZCv6zBxNicoOuTn+QSRM3HLsmU3PkiNsWLsQWhQW
         3x8Oh01EbyOJyY67XWFD9CMLN1Yr8kjrkmUyPpFYfxM5yhmjDW8biMpRGOhy2n2+HU+h
         P37lzs+nhsYQFyArSZv/2XTeFAfWMkJLdr88TiLn1hkfuJgEGdK5f4BBwqD13lUiHIGk
         YDsw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777569979; x=1778174779;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:sender:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=Se3AJTdhyJJ/0aYmfXtRV9Pj0lz/F2PvRY+kJoyMliY=;
        b=eYjdF5gl7nfN3vE5Ed4BglaAhrqwn1vYtxx7grPv+G1GFpguFPcF8cSc/g/ke8ao6A
         s26y3o9zn+I/go1OXaGLqhwWH0YQH0Qmy71uXPFAV7/x5E73LFTmS+w5EpobjJ89xEHd
         4cEqSzPOmgxkG5kJbMA62dV4ZP9SSqnIdEFh38a3CFIhclnPI/rxnnn5Al9RM48OJWAP
         jkKDHc+9ca7/n4MEwUIVPxFnEnsBl69IlqbcG8dli0t7U4sfxX7YVDwXo94ECKWIOf9B
         FfQxHIj1pYpcVd2zh9RqmfvoQ5dbtA/JvxOnEfv5C4FNv4ld2WlYl9JwxQlZVmVLhb+8
         9qXg==
X-Forwarded-Encrypted: i=1; AFNElJ+AFWvGFXynK7o6+MLxYJi5afMW3B3RdwNRnbH4KUM+G0vO+//cI8CW/81cm0hMdHKIKo/Iywu1WAXMTQ==@vger.kernel.org
X-Gm-Message-State: AOJu0YzPKDemLrUmXPbiv4af5k0mMVsgXAJP3XG9Tyb2HBdEx5K4akFe
	WJaajZr3P1DM+U8mAH9YTdj6XCPLRKoyoWts0bMaNL12y2Qcn149t2S62Epxxw==
X-Gm-Gg: AeBDieuwA20y2DE+6YCKouA2QvBwVrLNtwP/LXr1VJot7cMa+X671/BeKv6sNHJQkR6
	qHKi4pMcUFGSeNIwbUeQfo6bCPJND1CQPq63kTVSr2BNEr57zf/Jm2/z7bRchcijRalaI/sB14b
	H1dXR2CQoGWbj73Vi8SaEQ9Kdgr71iRCzWlnI7VNU7mzFcSVPIhkpAm/6MIRR8ank+SgUGb0ZOD
	xlcpuYNXfKjARjyT37pW2DbgKL0byXYpRPc0rg0j5cKJfIOHyoORANuIqeUievX8z9Clh2Eo0Oa
	9Ke5pdGuDFXKnF3wWBfXyhmgNx7pwgixnInnHqcS3umrypM/Bk38VrmdbD8TRMYpB1t/1/Uva8C
	DKvvaGC1PKfYxr+cbLNrCJ1Og988Y4uXtvZuCBbyplESsGluNKpa8NSRcgNA219Dl1Vzje9n9Z3
	cmgKVTmVWluuauajHDOlkiBRi75kG4IIKQUnC3B2tVy+NAJ10=
X-Received: by 2002:a17:903:3c6b:b0:2b2:45b7:3078 with SMTP id d9443c01a7336-2b9a22f7293mr42007715ad.3.1777569979273;
        Thu, 30 Apr 2026 10:26:19 -0700 (PDT)
Received: from server.roeck-us.net ([2600:1700:e321:62f0:da43:aeff:fecc:bfd5])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2b9cae1e293sm1726475ad.45.2026.04.30.10.26.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 30 Apr 2026 10:26:18 -0700 (PDT)
Sender: Guenter Roeck <groeck7@gmail.com>
Date: Thu, 30 Apr 2026 10:26:18 -0700
From: Guenter Roeck <linux@roeck-us.net>
To: Flaviu Nistor <flaviu.nistor@gmail.com>
Cc: Jonathan Corbet <corbet@lwn.net>,
	Shuah Khan <skhan@linuxfoundation.org>, linux-hwmon@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] docs: hwmon: (lm75) Add section for sysfs interface
Message-ID: <f3764699-0013-465e-ad03-a41e5294c434@roeck-us.net>
References: <20260417054511.5432-1-flaviu.nistor@gmail.com>
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260417054511.5432-1-flaviu.nistor@gmail.com>

On Fri, Apr 17, 2026 at 08:45:11AM +0300, Flaviu Nistor wrote:
> Similar to other HWMON sensors add a section in the
> documentation describing the sysfs attributes, their
> permissions and a short description.
> 
> Signed-off-by: Flaviu Nistor <flaviu.nistor@gmail.com>

Applied, after removing the trailing ":" in attribute names.

Guenter

> ---
>  Documentation/hwmon/lm75.rst | 16 ++++++++++++++++
>  1 file changed, 16 insertions(+)
> 
> diff --git a/Documentation/hwmon/lm75.rst b/Documentation/hwmon/lm75.rst
> index 4269da04508e..288cf8485ea6 100644
> --- a/Documentation/hwmon/lm75.rst
> +++ b/Documentation/hwmon/lm75.rst
> @@ -181,3 +181,19 @@ is supported by this driver, other specific enhancements are not.
>  
>  The LM77 is not supported, contrary to what we pretended for a long time.
>  Both chips are simply not compatible, value encoding differs.
> +
> +sysfs-Interface
> +---------------
> +
> +The following list includes the sysfs attributes that the driver provides, their
> +permissions and a short description:
> +
> +=============================== ======= ===========================================
> +Name                            Perm    Description
> +=============================== ======= ===========================================
> +temp1_input:                    RO      Temperature input
> +temp1_label:                    RO      Descriptive name for the sensor
> +temp1_max:                      RW      Maximum temperature
> +temp1_max_hyst:                 RW      Maximum hysteresis temperature
> +update_interval                 RW      Update conversions interval in milliseconds
> +=============================== ======= ===========================================
