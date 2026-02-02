Received: from mail-pg1-f177.google.com (mail-pg1-f177.google.com [209.85.215.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AC0B51FC8
	for <linux-hwmon@vger.kernel.org>; Mon,  2 Feb 2026 00:06:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.177
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769990811; cv=none; b=pGQvWjglXN/Jkcyc/YJx9NmZJpJZ18X5A6onbt03LC/4egi9LxTSqjGt+VMM2CiifQ78NYifnk9PpTWVAcbU6yTVoE+gZFaLbiMabh1Q/BZbgfnT79ikAspGskyqOC/veciDYWoQqViAFL9k+SmcZqXIylemitcGkKuV6TBxrqc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769990811; c=relaxed/simple;
	bh=CAR4B78NPLyukVGqEqnXua+RYuL9ObG5iL+ISo/TjQo=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=VnGrQl75tTS+0DU/llgy2y9cO0VB0cPQrNGW3vJ2K28ncxIqKkuya6mKsR+DvmprynR720nWc8j8sn8dPR9A2Fq/3VmWI10h8KKoVQzvz8ChKIRFp0PRQCSm76ymRPHJpyIlp9iquiaF3VIM8Vpgkt1sG68NIQJZ2mXt4ZevFxI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=HpJ8Knil; arc=none smtp.client-ip=209.85.215.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="HpJ8Knil"
Received: by mail-pg1-f177.google.com with SMTP id 41be03b00d2f7-c2af7d09533so2598703a12.1
        for <linux-hwmon@vger.kernel.org>; Sun, 01 Feb 2026 16:06:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1769990810; x=1770595610; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:sender
         :from:to:cc:subject:date:message-id:reply-to;
        bh=VlfFwGUkGSA6/cX9KVEAN9mdtO46Nfgn+UTitEX4c8k=;
        b=HpJ8Knilj/qaG3Ba8NzuDIWtFNmhA9T8mWfsm2gjYRDQZeo8rRIXvtKwuXrcxNKMiK
         QNGM5eZasrw/8fwoEMW/T2YA3iuYw0f4h3DBu8Gk5X0xvOySXg9TsU0nH5H4QRf11yjA
         XWqRLf07LekptCtKAfLLdMMG7GI6lzvnmKKGZHjNbpsDTfUl5Bt7Ohd1l8ytpbfynbnv
         MuitqzKLDnYC0uJnb31Ce/34MYfCU+f3ZyQhSaaxreGSUGNtWbknCb4KmhNiOvXV5xQU
         L9p1YDmfXJsIu9GCry3/xET0CX/0zFkDATFsxIEAj7bMTLKFKL4DnFq13P3NtXYTEU5Q
         dBWg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769990810; x=1770595610;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:sender
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=VlfFwGUkGSA6/cX9KVEAN9mdtO46Nfgn+UTitEX4c8k=;
        b=svxWttZZ6Lck6lu05Arr3kTySTZUD8jMjpA+oAYWqnkQmf14bpZ4Ab/jmyn+NWi6wc
         Mu/Iv87M8MZb+Ut9FAG6CnjEFSdL/j8OiP3EAoV1BNFM0Yyvil9N4bVhxXG2MdocqbCP
         T4i97wPE6FCPGuzHZUm4B+E5RicIODgqJlglYXoATzg5oLX959hmZ1jU+np0zZz0Dgug
         eNVgxC9jDijrjNeJlCj9M9H5CtBMM6OaREaOc1XW7qJGfv9mKnxOZKo61br/cBt1TFee
         Wwu5/e+i/DzJ2nj2OZFRtjlqazJfjqdeGo7RcD70qd3tDZfdAM+O47BJMIHxdfrLcTV3
         4tdA==
X-Gm-Message-State: AOJu0YzpP9ROMWFt+k72xLv9gM8DUtjQPGfJLvobSAWjjF75rwaKlA57
	NVNgC2KzBVrRIyBPRLj2xMB3J3448vo091SHtjvPIlo+Bgop0AAqw/Md
X-Gm-Gg: AZuq6aI397MTe7XyKv8UIoo2afuzYvstZowol5rAXdYZNDQsJBzfjs1rLKTCw8SyuZ0
	yFQZIrAaMaA1c9hiGgsmOg2SOQ+mxf5R242Dnnozn/LJ8H+g7pjLV7Hywwagen/GZJV2nOtTdyl
	PYoetOdyjlC3W2WHotFmWFCk20E567tiWMSizamYFdocEtNfx3kEOkucD/VB+bytreIFFOFCMcO
	tE+rXTSdzEOH4jTDuCp84/M6X6NoWfpqzxf6bPs0Cp3Pwk8xPyiNluH3/k9zOP19F3iwISP+yTP
	d6KGyIctfib/8CKh4pegzQ9ZIgIQ1KQb4tdEdxDwkb2uu43rkgzGcgH6zLUlUZzo/6knvbISRe/
	IZoUQ0SxT+Ch+RVnlloQ76qQB8xo/vtOu+oS2A1RytFEyE+JIqIkGRvdo0vi3uXM2Stx9xa0Qun
	iJQ3AW48YWGv9z16ezVP2wwiGbizSu0UQ4onQ=
X-Received: by 2002:a05:6a21:33a9:b0:36b:38e0:4bf5 with SMTP id adf61e73a8af0-392e0115c81mr9719575637.51.1769990809996;
        Sun, 01 Feb 2026 16:06:49 -0800 (PST)
Received: from server.roeck-us.net ([2600:1700:e321:62f0:da43:aeff:fecc:bfd5])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2a88b417394sm126133325ad.42.2026.02.01.16.06.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 01 Feb 2026 16:06:49 -0800 (PST)
Sender: Guenter Roeck <groeck7@gmail.com>
Date: Sun, 1 Feb 2026 16:06:48 -0800
From: Guenter Roeck <linux@roeck-us.net>
To: Filippo =?iso-8859-1?Q?Muscher=E0?= <filippo.muschera@gmail.com>
Cc: linux-hwmon@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] hwmon: (nct6775) use sysfs_emit instead of sprintf
Message-ID: <9744e7e3-d26b-42a7-8cff-d0d14f2d51cf@roeck-us.net>
References: <20260201202721.3871-1-filippo.muschera@gmail.com>
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20260201202721.3871-1-filippo.muschera@gmail.com>

On Sun, Feb 01, 2026 at 09:27:21PM +0100, Filippo Muscherà wrote:
> Replace sprintf() with sysfs_emit() in sysfs 'show' functions.
> sysfs_emit() is preferred because it automatically handles the
> buffer size and PAGE_SIZE boundary checks, preventing potential
> buffer overflows.
> 
> This aligns the legacy code with the new functions in the driver
> that already utilize sysfs_emit.
> 
> Signed-off-by: Filippo Muscherà <filippo.muschera@gmail.com>

Applied.

Thanks,
Guenter
