Received: from mail-dy1-f169.google.com (mail-dy1-f169.google.com [74.125.82.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F1BAD341077
	for <linux-hwmon@vger.kernel.org>; Mon, 12 Jan 2026 21:27:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.82.169
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768253247; cv=none; b=ghff9ZUM+HL2AIbCi2zU3KdHiNkPH2gdZH54jzChZ4g6pAMfdLsqGBemkpqeD0o/gwD/k/M1hXDlAEWt7JwRBJrWON+Irynn+8puTVbN/Rb0JSdZH30eo4uYEXu6jQDZLoKcGP0FY30mSoSdDRYs9bcTOmtYPCOiwJPFyQPnRiE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768253247; c=relaxed/simple;
	bh=iEYXQa/uFzhZKmDZnLQMrU5U5NpaPL4jB/ga8V1x8Ds=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=izhFKvnOvejIbwscLJjtzm/b7meI4Y5XYaoDVUf1cCYGiIf60CtqKPT/CjhYLSE5QdRgdDM4J9KqdOQ7ifBnKsQ5aRWcAoGWKTmjMF9k6DfWOhfvkgqIfV3wsPW37fMG+Y0FMZZ0wcfLIgoui77UmX3A8UFnqu1eJ2UgZUmvrAE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=KTaY+m/p; arc=none smtp.client-ip=74.125.82.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="KTaY+m/p"
Received: by mail-dy1-f169.google.com with SMTP id 5a478bee46e88-2b0ea1edf11so17260967eec.0
        for <linux-hwmon@vger.kernel.org>; Mon, 12 Jan 2026 13:27:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1768253245; x=1768858045; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:sender:from:to:cc:subject:date:message-id
         :reply-to;
        bh=5ByAaqBsgF6eZ2+ueBCh831IHyM7yfbUtB/5PEJSmQs=;
        b=KTaY+m/pIVPS5C1ejc/tCBTGrpd+1yerCkIMw8w7mS2bSYHZJsXHP7s9I4XfdNsMYq
         FRO8fUjVxmGW5+8pLwP5TTZ7qRlOodPkzizPzRepAvi3kfp4jhr5I6EOjBnR+urvijer
         SgaI63S5VMJZBc/9MFi90HNi9jQSmk+bmgd1bL36nrN3o2vxinmvxhdVdIv493NFepIx
         mTk1sHFHdXfU+GNkW9kEC6oESiO5LAIryXAyh4jxGjsH5r/r1wfl0v9VqOEeXbauKGV9
         /KdWsmOBE8iBiA3Eaqgip18sb3s/HnC10MrX7P+P9f283KZwMxKaiFUSamz5WZOh+hUg
         /30Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768253245; x=1768858045;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:sender:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=5ByAaqBsgF6eZ2+ueBCh831IHyM7yfbUtB/5PEJSmQs=;
        b=CrK4T7SGhl60yVa0vjeRnna6GpGvQ7hTQ+dihh9wO7kW0la3BJAbSvO6/MouzbKRv7
         Lm/UQ9UZjFq4+Vx6Vh46N+Guxu41lkr9juu9d9guRu9XTTjwULbUwJUVn739uRcGgl2l
         dV/mq2Q1RbMNWzDBdMUPkfD1/sNVJ6eLKmUNU+1u1ZLQVxkEJtQgd20WEaZo2wmEGjF2
         No39X5Ri9S8fs6aXZW73EXypU8uwOwNiaEto/VCauRY/LXZkcRk4oWba/Mo9DTX/GITe
         HH/J/zU3RFwAfedz9RQXEU7g8QOR2NkyjrEo69u+Mi05zUpyT+spGLRCK6BKTSU6fLPq
         WyCA==
X-Gm-Message-State: AOJu0YxKSnYN6aGEcRpxikzFqxD9KltnrMBrYntxLM9orN5ebZuemweq
	WZXqVBfFhruHUgFrPMhEo7GGXkZm1JgiSjJJq4eKwIZSuwYhLW79gw4u
X-Gm-Gg: AY/fxX53IuPkG6Pc1lzgd/SbYr4AkKRPvaRLuOVJLQSl1qrm/qCh9t4cSrysMYz5DNm
	RtELhWeuF7IxY8QfW6IO6okvUv/OBBZxU3k/vcIJlT5q4cmU5JDU7aOmFoqmF8/1UL+gh2grVS1
	anrIlYOsR/xbaA4yW7YcOoMOJtEmmyeYAJ0EUR+uvMUc696bNj9tpl2U210ZZyazrUgnjl6vD2H
	hMYelP4jCp93lWdxPgsma18yHEnb+t+Xl1oCBZVhPH6FEUsd6VHzqPI2P/nXvqonHTZ3Atdfq52
	7Ger9iiRI57q0etNwEqVa6KcJkfRgEuix2pfjygE+vm9sFaXK+qGUNEVo4HygiTl9543T7wTm1T
	E/rBTbEJ9W0ddAqUokYw0SLWikVnQ41PUOugYoqmuYDSKrJx1nBanhTNfW/6MJy+SEEaKIcH1d2
	xHiFGdQrZljR7d0qYPKdQhRjS9
X-Google-Smtp-Source: AGHT+IF6Mgpc1fxryTAg/8eAFf5DWfyuLM5gpRNxLmED2q99QmJ8aucsrTO+1t7MrvuTSoyC1ro0Gw==
X-Received: by 2002:a05:7022:a8d:b0:11b:d4a8:d24d with SMTP id a92af1059eb24-121f8ad8096mr19402508c88.12.1768253244911;
        Mon, 12 Jan 2026 13:27:24 -0800 (PST)
Received: from server.roeck-us.net ([2600:1700:e321:62f0:da43:aeff:fecc:bfd5])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-12316f2db84sm6772799c88.14.2026.01.12.13.27.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 12 Jan 2026 13:27:24 -0800 (PST)
Sender: Guenter Roeck <groeck7@gmail.com>
Date: Mon, 12 Jan 2026 13:27:23 -0800
From: Guenter Roeck <linux@roeck-us.net>
To: Szymon Wilczek <szymonwilczek@gmx.com>
Cc: linux-hwmon@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] hwmon: (acpi_power_meter) Replace deprecated strcpy()
 with strscpy()
Message-ID: <6bf23d51-7b71-4055-b6c5-a75a6d000b26@roeck-us.net>
References: <20251220173041.377376-1-szymonwilczek@gmx.com>
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251220173041.377376-1-szymonwilczek@gmx.com>

On Sat, Dec 20, 2025 at 06:30:41PM +0100, Szymon Wilczek wrote:
> strcpy() performs no bounds checking on the destination buffer, which
> could result in linear overflows beyond the end of the buffer. Although
> the source strings here are compile-time constants that fit within the
> destination buffers, using strscpy() is the preferred approach as it
> provides bounds checking and aligns with the kernel's deprecated API
> guidelines.
> 
> This change converts the remaining strcpy() calls to strscpy(), matching
> the pattern already used throughout other ACPI drivers in
> drivers/acpi/*.c.
> 
> Link: https://www.kernel.org/doc/html/latest/process/deprecated.html#strcpy
> Signed-off-by: Szymon Wilczek <szymonwilczek@gmx.com>
> Reviewed-by: lihuisong@huawei.com

Applied.

Thanks,
Guenter
