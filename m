Received: from mail-yx2-f13.google.com (mail-yx2-f13.google.com [74.125.224.141])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 78E4E3C13F1
	for <linux-hwmon@vger.kernel.org>; Tue, 15 Sep 2026 15:26:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.224.141
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789485980; cv=pass; b=Bcx18pX94O/hvv3AEo/6IR3kibBZH89/v7281CBUli5fDpH8T/96PrJdLeryvTZilwV0ZpCt7Fcz2oCfO4gThrvlBLnF7MbShi5JVdyK6860hga8hhVFqvEKrqN8WLWB4wp1XBNKRWcYrCjkq4pkRDYBtFCanSCgyz659mqcdV8=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789485980; c=relaxed/simple;
	bh=04fmncXiznmgA07ISCSGYRT/QDNH7yTRBIsIsR+2C0A=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=ijZMlOWRJpeGYIDeuq/7e0dyXpFq14IaSgxuTlyR++ZGk5eaogbIrktrxHzHsDTMeyPfYtMSWkoAwB8hJ/VDf6MVyx1WheV+YTDteh2F2VFeHm/7we3u8+JJqGICNKCbvOFD50T8akWxkeH1ZBLZecZ99VhWQq2zcun/HEuh+wU=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=thegoodpenguin.co.uk; spf=pass smtp.mailfrom=thegoodpenguin.co.uk; dkim=pass (2048-bit key) header.d=thegoodpenguin-co-uk.20251104.gappssmtp.com header.i=@thegoodpenguin-co-uk.20251104.gappssmtp.com header.b=fVzWip/A; arc=pass smtp.client-ip=74.125.224.141
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=thegoodpenguin.co.uk
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=thegoodpenguin.co.uk
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=thegoodpenguin-co-uk.20251104.gappssmtp.com header.i=@thegoodpenguin-co-uk.20251104.gappssmtp.com header.b="fVzWip/A"
Received: by mail-yx2-f13.google.com with SMTP id 956f58d0204a3-66e56a1fe83so570418d50.2
        for <linux-hwmon@vger.kernel.org>; Tue, 15 Sep 2026 08:26:18 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1789485977; cv=none;
        d=google.com; s=arc-20260327;
        b=feDCLxo06JDyWbCBV4Goa7PSwtqRQ4rxDxVu2M9oBIrn2uDNtbyXIYi13jmmPPjGmv
         R78bEinUe8FJ7khcM9QuO7G0lyIjofo7VS2goOXQyuuw0csj63LpnESZLDp0bOw7IK4A
         uMY0UXkHbv3kM0EG+5s2nuJ5TRJHNodPp89rJX05hQpf4KfD0RkzGAnphQ7xHK7rKYv8
         Yaf5ksSv8seekNm9ZTX9WxRaFypZMZJkdadr6lXRy9PxPg5TRI2U8TERGLYM8KmHTpYF
         JkDUtphFvAOniAbCp4+ghtwA53X6Pj2wBMtq6P39KwkeNsqEPJPxcgQCwMMltfbuGDjR
         yaCw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=04fmncXiznmgA07ISCSGYRT/QDNH7yTRBIsIsR+2C0A=;
        fh=IURmWszfKoLdJ9XVyqyKtV6UaY2SEgfbqVvk6z0TXlY=;
        b=l3Fl66+xUD6KXNo6JIGHeMXd9v8YloxzX7xchkcFmJrR0WukGDURx6OMldRPkKX4jW
         iR0LsYFemye5XQL3cXNO6/9Lr40s2m/7xEOj0U+oGK9sFdiStNS6yGkDi926rtjrN/NB
         VDcYLa2PTRrDw58m+nzJiQ67ZV1+6/hO9rSG1ZBztwVLA7WHZ+S7ettXlKAVL2t4XCH6
         0ORB5VrXGqDVY7ut1GX2/q807Y7AEQvDlHaERPYBaLf3nSOVAiBMU0GzHn3Vy2dHDQ2f
         UF8a53ZYvuXTUoxsNtW+e5uRAK7IDsySDn/P+UnGleHfIqBDrwxsJsZVwPhka4u8UNAB
         qVWw==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=thegoodpenguin-co-uk.20251104.gappssmtp.com; s=20251104; t=1789485977; x=1790090777; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=04fmncXiznmgA07ISCSGYRT/QDNH7yTRBIsIsR+2C0A=;
        b=fVzWip/A9A29Lwb0WfhEil/jenlbIiyfeMhAbWKqKB5Q9YsYMZa8nHu8CNa+g/yVtv
         sBhrt9wnvlKHFmfLrPOK4s+0WFj2EhZ6T5wuTizV4sUQaRnxJvZER/Ky90iNz7AQZqUj
         WXC6LgKWcwiFFsxh5FHkSovi29ex3eN7mZ9Uva0xOAHHUtwHBv+DKnGIYIazYwiQkzi6
         20Y2iBEvmbTER8KMcyPOlMFH5SMsVWKO/8POvhn77Iav/HIQ2FXIUwuXhZ2vuPdbwG4p
         XPSr6Jxu2IYBo5dB8ijG0wpXeUwwAuC6gCjstySmDsk3GKandQZFK6JtKB1blz88c9g5
         R59Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789485977; x=1790090777;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=04fmncXiznmgA07ISCSGYRT/QDNH7yTRBIsIsR+2C0A=;
        b=WcHcNSK4lkW6ZeFBiMLFbnJ62+eg2BNUb3yKS03Ca/JK0UzW7PcgaHw/OrEgzlR9A0
         JyGt57vqOF/uzUEDmG4SxYh6gHN0nPsqcBZm1nX3/gNMFikoLaVSagSi93HfyTziLoy8
         MQQ6i7XDSWDlmV/OyxfPj3bHoRK0Hj6sx9joToDfipIX90mgpuiNULsdcfS/AUB0mhwV
         SoOULrDDh7R8A7SDcW+h9B4Ryut9W3X0+0FkQKsoHgkARrLvSVT/AoaS49wgHFrNOo5b
         RNuBQb2UU0YCvjSFDltFLD5sjJZGR6fqV7bRQ7hkMiqUEWsoTTjHg/pcvgCD2FzzdHe7
         w41A==
X-Forwarded-Encrypted: i=1; AKwUvByNm9YDSQhXfIkDB2ZpjwdfZ6hTkXXw1ePvZPkh+IVG5n8JTaMYsmkYMkPduwdbDIDmblVf1wErrU2aLA==@vger.kernel.org
X-Gm-Message-State: AFuF++koXnP5mNR1dyR2+W99w3m1q4QJGzf+Ev3634DhaL33yrN3Tq6U
	hfW1Nw89hZdET2V1IYc36on9NhmhI3Qb5BAS+0DYwXJMa994NLYXNYkKGPpNfjUCe+pwezH62CM
	UfIkDI8i1DdI1Sa4i72yKX9vecGQR+HrxEAmnqYoGOQ==
X-Gm-Gg: AYBFou3ZOK3u2KQSaeEvh6tDr0yP4bRZw8Z4J8333EsTdLRFqiO+xD8x0kx+ZZCxTx7
	wwqV9Ml7L9KnLn71vbExcNBNzM1M4c6fe7G/rMShmMpLoVoDa+c0OIhpZT3y7IiUTnVGTQKA/Bd
	3oQVuvUIq/sVLH/9i4tBOH+P0kR2Bh2bmJF5NVDrIMv+AClUSHKw7H5hCyZXLs7Fd9vXYCFIwbk
	/uHqLk5aBWz9DWXQv2N4oZDhrHTL6pyPB+QfCaynrGUe+6ZURUcqpJ/9ieYUNlFfLgaILUnADXH
	+BFw83qHjKL5ZCTcJfeSkGUjtGzL2eQz3zxnQDpsG4HqSWsKiUqgKP2Fz628RClgTknAGDRuaQH
	nwOZhgMbrGNrYmltWmROkBp+o
X-Received: by 2002:a05:690e:bc2:b0:66f:c770:2936 with SMTP id
 956f58d0204a3-6715cbaf3aemr667877d50.58.1789485977258; Tue, 15 Sep 2026
 08:26:17 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260915-acpi-hwmon-v1-1-20747f6fd218@thegoodpenguin.co.uk> <4b314524-c0f9-4528-b86d-645747b59ac9@roeck-us.net>
In-Reply-To: <4b314524-c0f9-4528-b86d-645747b59ac9@roeck-us.net>
From: Pawel Zalewski <pzalewski@thegoodpenguin.co.uk>
Date: Tue, 15 Sep 2026 16:26:06 +0100
X-Gm-Features: AcwNN1XxYX75NCsGDaObHIJqn3mwhz-qjmKssIPNQcXV87DmDaAKScfTBr8_0y0
Message-ID: <CAA6zWZJvWAcwnZaO7F-bBEejf0Qn7gFh1fWHLq598Uzz+zzLzA@mail.gmail.com>
Subject: Re: [PATCH] hwmon: acpi_power_meter: use named initializers for acpi_device_id
To: Guenter Roeck <linux@roeck-us.net>
Cc: Luca Tettamanti <kronos.it@gmail.com>, Cosmo Chou <cosmo.chou@quantatw.com>, 
	linux-hwmon@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

Yeah I know, v2 is already there, messed up the fix up.
