Received: from mail-pf1-f182.google.com (mail-pf1-f182.google.com [209.85.210.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AC7AD17BA6
	for <linux-hwmon@vger.kernel.org>; Wed, 24 Sep 2025 14:49:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758725351; cv=none; b=E9yL1Hc/3EdK2cjPHi20GZyhv7q9CSQ5c+k7CnaB9A4HP+84r+Pbl2NkxG9YCAt4NT2Mn6ZoxMnx+F1yAePZheEcQj4+TV65VS7BpmDW3uENodzHr1++RmFGoRgMbmQEkFvnwo/xYBrLCLIVpMK52mMyHd2S56u2HgwIQOcJFIA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758725351; c=relaxed/simple;
	bh=Ne3PQvFuXYtDil7myRTwQQ61xiDQTxe02MSNqQTq5D4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=NBNhVsEg75Z86zoOZyM0OXVn7Di/Em76b7LmQOGJkJ2c9Ve9AhEe9rKSGqkrTwI/NykLIAmq0QEufo9QlnpJsp77+CvkoHig59m5KSDjk51V1kJpyIpIcnbu3vK8OUW4sHnmWa/xQBi+C0cay92uT4sVccpc4xIoEC/sUw0zEyU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=F0SJUo4s; arc=none smtp.client-ip=209.85.210.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="F0SJUo4s"
Received: by mail-pf1-f182.google.com with SMTP id d2e1a72fcca58-77f1f8a114bso1034292b3a.0
        for <linux-hwmon@vger.kernel.org>; Wed, 24 Sep 2025 07:49:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1758725349; x=1759330149; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:sender:from:to:cc:subject:date:message-id
         :reply-to;
        bh=XTcoa6Zz9kvrOd/56qsfvcd4iv+T5ivIw8BtHV3xup0=;
        b=F0SJUo4sWzkP+5cN5TEHBExEjCJaMM6mLt6fk/j7pASMaVYEv+aPLb/M6PdGdI4CD2
         y/eQ1TKf7p0rUUGbuChZLPziVe7KXN1c7X6ps8XqW5ClUaWIyRo7GdJQDL+IaHEdGjK1
         /XCWWIQOJG46NOTd/XAfNg7dJLxSI2EycxBydJkZ6yRNaoG+tH+NGMumn0Kk2rkUCIYe
         8l3tpKjbZveLjxaQ5ggJRjD8Tfcocwtn8wnukrt8xcB9a07h/6TUmz/lcXH22f9bzhQ5
         GyEb2/90qJC7Wd7a4iuTOvTCgvOvudxkEe3Xmz2U4wWGi/J8FT61PtM5422YWo7rLkh3
         Lo4w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1758725349; x=1759330149;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:sender:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=XTcoa6Zz9kvrOd/56qsfvcd4iv+T5ivIw8BtHV3xup0=;
        b=tBsoJv06PViW47Ap2Jt/C76AawDb0JzkawpnoT68xgx2Uie8yizobulUcvG8mdlyGp
         bQEruDK2NQ2bpD70fpeq6kpurrbDHjwk1lq2tfIYNvgS8TBZQk99Vthl2a5n3+dq0SK7
         bIORU53Va8tgneiEJWinyINjPabzkb5ooNq754wLD+va4PQRvWW8h5RdZVugLDMsvM73
         gruwV6TOhcdWrGZdI4PdT994h/dkbZGlT5d9Mm4O2fC8KHgkwwUyaXCrqurBosyUN8OH
         0+1uNeNkF11p7iYofXy7OI6bq1iEOGXX38q3mtaj5KIyayIg+XpjQhZxG0j5fYcrJzJg
         fJtQ==
X-Gm-Message-State: AOJu0YyyJJjj9vJ2C4lcp/TS09fib8m8L3hkd6U/OJIpQNxRgZyKJ1cp
	kqrrL9KMLu+Inf8eH+S+azlijZjM33m3B9b1/xIwIINF/R5lyl5G0CRLu8CkIM3L
X-Gm-Gg: ASbGncsTVFvgcc5cEYZ+W3IB1RGBRj1OcuEk60PHO+H/SpwsAe6m94K4LpJ0qumVLNI
	fdArLwIPzHo8+dgmARWcoFEDFvlYyllvIf2TVTZ2DHS4NRqI10lxZgDC7CpQnAsYifsQHAiPdI/
	8JmLv3EXsZ5/qxXuA7LwfO/duPDehlCvEZEPGsXMbOQltt9gSEFJh5gJOAQGkQpf14XmnYRNKE1
	+5LYfAG41W224dB7gI5vj4KprgCBFORBJxC6PqTw6pGO3OsRLyQEhxqlPCDcZtMYUxczSWXF0cp
	YU6SefBwTQ4mR0MtvoGZIe9kapMDNxPGssB+15Xy0QV9evJVfpOJbTI4H9aosxMoRPWHlwIykKO
	g2DRLlB/scKoHgsHtArK/4BAg9U3YWBYAqrt44u9IQ4dLAg==
X-Google-Smtp-Source: AGHT+IE3H65r5seFjizDOCCsJIiCdUp7VyrXHd8niwx/uUBuHdurOAYlr+ucwqg/Q6jxd0cGQwOd9A==
X-Received: by 2002:a05:6a00:1490:b0:771:f071:28fd with SMTP id d2e1a72fcca58-77f6983579fmr2710893b3a.14.1758725348826;
        Wed, 24 Sep 2025 07:49:08 -0700 (PDT)
Received: from server.roeck-us.net ([2600:1700:e321:62f0:da43:aeff:fecc:bfd5])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-7805ca5f7c4sm1821991b3a.81.2025.09.24.07.49.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 24 Sep 2025 07:49:08 -0700 (PDT)
Sender: Guenter Roeck <groeck7@gmail.com>
Date: Wed, 24 Sep 2025 07:49:07 -0700
From: Guenter Roeck <linux@roeck-us.net>
To: Cryolitia PukNgae <cryolitia@uniontech.com>
Cc: linux-hwmon@vger.kernel.org, linux-kernel@vger.kernel.org,
	zhanjun@uniontech.com, niecheng1@uniontech.com,
	kernel test robot <lkp@intel.com>
Subject: Re: [PATCH] hwmon: (gpd-fan) complete Kconfig dependencies
Message-ID: <7db7fb9e-fc02-4d76-aed8-c32d59d51f4f@roeck-us.net>
References: <20250924-hwmon2-v1-1-fc529865a325@uniontech.com>
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250924-hwmon2-v1-1-fc529865a325@uniontech.com>

On Wed, Sep 24, 2025 at 03:48:38PM +0800, Cryolitia PukNgae wrote:
> From: Cryolitia PukNgae <cryolitia@uniontech.com>
> 
> DMI and HAS_IOPORT is also needed
> 
> Reported-by: kernel test robot <lkp@intel.com>
> Closes: https://lore.kernel.org/oe-kbuild-all/202509200214.i2QX7iwD-lkp@intel.com/
> Signed-off-by: Cryolitia PukNgae <cryolitia@uniontech.com>

Applied.

Guenter
