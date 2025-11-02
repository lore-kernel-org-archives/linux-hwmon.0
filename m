Received: from mail-pj1-f42.google.com (mail-pj1-f42.google.com [209.85.216.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 67DB6EACD
	for <linux-hwmon@vger.kernel.org>; Sun,  2 Nov 2025 19:08:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762110516; cv=none; b=Ehg6kBj8qLCZ9SCsIAvpXJcDxhGLRtQMSPGMIoIj0tX4IIKi2mNMswKxnDQN6lnv3fUQvuYAg8E1h1tC5NPzBqpeN5WoMqqhEhLk7FJzNH1H6sjjWQ+9+zAtqH242lq8BAAvM8wsbTdvZxtaxJlWmcUPxZhUGFC+mkQNA4Elvi0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762110516; c=relaxed/simple;
	bh=xL0+0fqs5yDODEbAwb1kuJnyeaQuLpSps6L/qmcOFZU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=HpM8NlcWRX+mw7+XRq/uE1y6NvMotbqIquQJN/j9YBL6mnVIKB9tZsHohppms3e0ddizBy0o2TcIuRg+dS/H0T9TUCIGajkrEP7yCaV6p42ksT/SqeO7bQHO9XUOTmRZ8TZLQBjGg5YthDGh+4hkrWOdM2ZGdQBi7J3hWs7rx2Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=haNWGGGQ; arc=none smtp.client-ip=209.85.216.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="haNWGGGQ"
Received: by mail-pj1-f42.google.com with SMTP id 98e67ed59e1d1-339d7c4039aso3682992a91.0
        for <linux-hwmon@vger.kernel.org>; Sun, 02 Nov 2025 11:08:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1762110513; x=1762715313; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:sender:from:to:cc:subject:date:message-id
         :reply-to;
        bh=A8rb6E7vJv0wdgQZQe1lYWjk3hPHSFp/A5kkbljewGg=;
        b=haNWGGGQPXxRW8GvkFYJSczbiJu1s5rAsF6jFD28SkG2e8KTktOYALvORupn4PoXK1
         xjie/bZXVnK5eOrh97eZ+4LV/QWYtqTsX+2c4iW7FHetJbIvKVg07/sVW+NxFtMIi8xC
         97+bWCnMMJxwq9OLwdzkvJcwuDJM1X5H9enh79jn29adgyB8fcpBpObyjlJ3MGZxaz4t
         fcwTohVz4RtDLh0NJSfuwDB68mfI/08X3Wulaw7gh97o0sr2DtEAfWAHc1SP2zgi0Kge
         r163mxYoSZG51Hg32l2p7IgjPNIRdGHOasOGC5x5iSLRaHER3yLbAESsolSV4ILSgtbq
         /ecg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1762110513; x=1762715313;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:sender:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=A8rb6E7vJv0wdgQZQe1lYWjk3hPHSFp/A5kkbljewGg=;
        b=JI0hMPbbfxSlPEaX8JmOwSOx/NykO+cEF4MoJaHyVw6By8CYw+PdKMs9A2m8gpEiRi
         HLq51yCsLEZtepEpA9nArg2D+lEA6YRfQcIgkXKBFxc4tRt1poxl2Bha5pLr7ixDXF+K
         5ZOTW/QjfzFFZmXrHlAaESTrVceCaCM8o0krveIKQTeDU9HdOY+gSgiAroVssbjoOBx8
         Tf92/QRMGsaZ8zaZe7JyWUhnaVNpCKEcwbCik5hTFkrFo75QZzPrBjTqHwVaZHRTObwo
         oxEjA5EdP4lhO9u7biY80nFNt0dfHCx7Os7v6Wvj6EytsJ/bfWUGpb5Hy9ejTKZW4QHi
         oq6w==
X-Gm-Message-State: AOJu0Yz/SVQb2l3XqIvB70uNoeBKeTiuIYszwIGh+dTaShe3hotw7YfY
	XWIECF/6kNt9gVYafVXDiqCFd2jD8EDaJEqNROKCyLq40SgD5rxmuKgL
X-Gm-Gg: ASbGncvPczn/D/sRJ6KDhxSBkwSKgiu24av9W/2OEpA3xNslheciwHwFAlw0RA7ofwv
	HN8LuKCEUvyvckhN5r6ong3NX+npVe+SinJ0DUw9l+hF0IlzQbcMxUcy4aTvngRi5Z8sDEsg1XC
	JUlCzIbfLBKhWfIuOcPZbZFWiv/qhLhs8GJ+VMXPpYDpuR5AaW0nsofujBytJo2BCGMwOaMzO+h
	Y1yBx0kWjbTfaqwUikCUxqiAJmVPEC1xVOg7YHZyNNXSfhk11N61gyLHkjsOYMr+iO+TqydhEzM
	/G6aBT8KYEL1fcrEgnPPlaSqQn92ysIY0fUtgoy4lpRLq7aedztankdDCYyM0411gdT7MAa+9Qy
	BvYb6G5J506hVVkqXNtVZ96/7Q81bIwMD7skKnCoKUg+uX3dX3a7psVr/hddga7oTI0rupZ/PX2
	C8Y39dUcZOJ5y6vidEdlgI6bY=
X-Google-Smtp-Source: AGHT+IFJT5BZUNr2n9mLnPHEaAFZFvgfxudFvf1695PqfpPWQnLXpDGuuzR4qckE6/SBOiHCas2PXA==
X-Received: by 2002:a17:90b:1807:b0:341:c89:73d2 with SMTP id 98e67ed59e1d1-3410c897455mr2210378a91.22.1762110513492;
        Sun, 02 Nov 2025 11:08:33 -0800 (PST)
Received: from server.roeck-us.net ([2600:1700:e321:62f0:da43:aeff:fecc:bfd5])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-b93be4f8cccsm7963373a12.30.2025.11.02.11.08.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 02 Nov 2025 11:08:33 -0800 (PST)
Sender: Guenter Roeck <groeck7@gmail.com>
Date: Sun, 2 Nov 2025 11:08:32 -0800
From: Guenter Roeck <linux@roeck-us.net>
To: Cryolitia PukNgae <cryolitia@uniontech.com>
Cc: linux-hwmon@vger.kernel.org, linux-kernel@vger.kernel.org,
	niecheng1@uniontech.com, zhanjun@uniontech.com,
	kylon <3252255+kylon@users.noreply.github.com>
Subject: Re: [PATCH] hwmon: (gpd-fan) initialize EC on driver load for Win 4
Message-ID: <b68d88b8-0eaf-4f9a-a847-befd95659c5c@roeck-us.net>
References: <20251030-win4-v1-1-c374dcb86985@uniontech.com>
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251030-win4-v1-1-c374dcb86985@uniontech.com>

On Thu, Oct 30, 2025 at 10:30:06PM +0800, Cryolitia PukNgae wrote:
> From: Cryolitia PukNgae <cryolitia@uniontech.com>
> 
> The original implement will re-init the EC when it reports a zero
> value, and it's a workaround for the black box buggy firmware.
> 
> Now a contributer test and report that, the bug is that, the firmware
> won't initialize the EC on boot, so the EC ramains in unusable status.
> And it won't need to re-init it during runtime. The original implement
> is not perfect, any write command will be ignored until we first read
> it. Just re-init it unconditionally when the driver load could work.
> 
> Fixes: 0ab88e239439 ("hwmon: add GPD devices sensor driver")
> Co-developed-by: kylon <3252255+kylon@users.noreply.github.com>
> Signed-off-by: kylon <3252255+kylon@users.noreply.github.com>
> Link: https://github.com/Cryolitia/gpd-fan-driver/pull/20
> Signed-off-by: Cryolitia PukNgae <cryolitia@uniontech.com>

Applied.

Thanks,
Guenter
