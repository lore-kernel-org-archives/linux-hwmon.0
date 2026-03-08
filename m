Received: from mail-dy1-f174.google.com (mail-dy1-f174.google.com [74.125.82.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AA4581E7C2E
	for <linux-hwmon@vger.kernel.org>; Sun,  8 Mar 2026 01:24:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.82.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772933071; cv=none; b=GKk0sDAVGTvo5T9uXfVxrATMJv4TXt6uiJhc/pK3ef247WETLlaAboZkNcOrnkopw8vtwfC7g6cEPA074UNdvgOVJVpctiZLa+XGZmyU/0aQezqeYu8A9TBxpomYp71xQ03kC+zltczJr7Ap9yNGz+64y6hmXHHafmhFhdXbBCo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772933071; c=relaxed/simple;
	bh=hf/5ZXiEGArucJZbM+PwA7Znqt3CDYwZUxCKA3I3kOk=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=U6k466Jl+CSl+xWawzM+B6Q6B1oAXgQRccbdlYlnFTBEc4ZD34bWZ1QWKECgL6Ad5Q7SzKZDtNAGdzQEphEyc95tevBFSneGxszcQZiDdwjZ9bYoxFYAA7Lc5SxyOSPkkZJ4s4qZTY4OELHAD8VuoFz1hiqxo861gsCmCL4LwBs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=IJH+MclB; arc=none smtp.client-ip=74.125.82.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="IJH+MclB"
Received: by mail-dy1-f174.google.com with SMTP id 5a478bee46e88-2bdfd129c52so7009987eec.0
        for <linux-hwmon@vger.kernel.org>; Sat, 07 Mar 2026 17:24:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1772933070; x=1773537870; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:sender:from:to:cc:subject:date:message-id
         :reply-to;
        bh=yDbXTCChWzz1yLsYxOAif8TvBjt0J98aJbaBR4LR77E=;
        b=IJH+MclBj6xEN0cvykgYaa+k9rI8VT7CrK36IGqCpIdselga3JH/SVBO5+eb3BUyVO
         Ifvq0E+kFk1rcp/PCJ5tlxmrssjj7nvOng9PgQW8zBLCVPpzYNozYc66caEUQBbrC+eZ
         1ujEpHbz4rKg2KTUijxYRYdjONzyiJmzbBkZkT9YCWISvzbuYlKIROJAoSquV9ePCBwF
         k3wT/wXh12GmIqsecMPb7X5KF4TDnn0zSyCY4le7IQ5CQ+WL/lPqny+KrllutcPcEJlz
         R/SspOHguySh4SfgLMcc5G3BE4KRWmvEy+gLGAaOWChxAmC1hdW4Yp1ggFcDAllw/VHx
         aeWQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772933070; x=1773537870;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:sender:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=yDbXTCChWzz1yLsYxOAif8TvBjt0J98aJbaBR4LR77E=;
        b=E7LPl724/e5gqB09JHicrCngQDC0DvMX7IliqNGm9SpFLXOaAo5Vz67+wOyvnldJf5
         0bYakslC4TbJ8ZdTBmUwQ3eZUokjm+RLQpZfVnllKY3yVzGzTfZpxstJ6UDye25YWSF7
         18DtnMH1vhkztRBLMjkkkWBzdgsyHpwKkm7vHUZ76M8H96oBHWZ0oAYqnqxQ0cXNz12W
         4ie5k/tN8f8iGyZezk64sGkwiUVbvgFWnOpFKRCZrsNzQgXrOML9JYZsyvyABqQXh1pm
         fBK7YKMr6axkF2T2AOMOIg+h08Tm1/ZxZKHwLz+mBe2gxEbeJ2d+LeKYm01aOQlXgl/T
         sBvg==
X-Gm-Message-State: AOJu0YxqtFv4XlU+eHUQBCy3cudGe4nX8gR0VWf771cOglcsjIh/SrU9
	IGKuOe94Ki7ac5EAFP2PHKhrV4tDFGXpVfoN0QvjQbY/y8n17HCHu+pW
X-Gm-Gg: ATEYQzy0YdnG1/Gz3DMngCH3TkoM5O1Vr/uXXCxSLozm+vlhydBQGvEey6tk4J9qcH1
	DqWKFuki7S53/BdhJ6TFVhcH2cH/tQmB1TNBgmELsiHH5mBLY+2m6qWRSm5kYiIhV3RUmA6Es/S
	K0vfwJnDbGHB2iwRNS5VzBXxHanv1KoqcWgZ01Xrk19I8K2o/R5uT2R39hjJM5LL+S5jl/ojDlH
	NWg3BZij7PV2VL4xRrHNU5Kg0VQjqEQPYoV4WllKjpfdOCsI8RvFHguPBCaHFuY4rz2wOLdEHSG
	9PRBAJY4Mk437iGmTBmj//5xz3y5FE+rdr0NSlXyR15jTuGCWUlZrfeVPzStCWUeGDE2gQ3aubk
	JZ9+jyGwA3IryhJ52NPhVO6oUyXgEH8JhsMX6UOoJ01DujFGHcmoSZcUftSyuFNScSo5l/P8UUi
	Rh/VxtHKubpx0g2bj84fKOOJpfdNLiSZnQ5Uz8
X-Received: by 2002:a05:693c:2b0a:b0:2b0:48f7:837d with SMTP id 5a478bee46e88-2be4deaed79mr2433262eec.11.1772933069745;
        Sat, 07 Mar 2026 17:24:29 -0800 (PST)
Received: from server.roeck-us.net ([2600:1700:e321:62f0:da43:aeff:fecc:bfd5])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-2be4f82851esm4364890eec.10.2026.03.07.17.24.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 07 Mar 2026 17:24:29 -0800 (PST)
Sender: Guenter Roeck <groeck7@gmail.com>
Date: Sat, 7 Mar 2026 17:24:28 -0800
From: Guenter Roeck <linux@roeck-us.net>
To: Tabrez Ahmed <tabreztalks@gmail.com>
Cc: linux-hwmon@vger.kernel.org, linux-kernel@vger.kernel.org,
	Shuah Khan <shuah@kernel.org>,
	Brigham Campbell <me@brighamcampbell.com>
Subject: Re: [PATCH v2] hwmon: (ads7871) Fix incorrect error code in
 voltage_show
Message-ID: <f97c5486-753f-4add-bb5d-d71e22072f7c@roeck-us.net>
References: <20260307115226.25757-1-tabreztalks@gmail.com>
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260307115226.25757-1-tabreztalks@gmail.com>

On Sat, Mar 07, 2026 at 05:22:26PM +0530, Tabrez Ahmed wrote:
> The voltage_show() function returns -1 when the A/D conversion
> fails to complete within the polling loop. -1 maps to -EPERM
> (operation not permitted), which does not describe the actual
> failure.
> 
> Replace this -1 error code with -ETIMEDOUT to better indicate
> the timeout condition to userspace.
> 
> Drop the else block after return.
> 
> Note: not runtime tested due to lack of hardware.
> 
> Signed-off-by: Tabrez Ahmed <tabreztalks@gmail.com>

Applied.

Thanks,
Guenter
