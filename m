Received: from mail-pl1-f174.google.com (mail-pl1-f174.google.com [209.85.214.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9740130C625
	for <linux-hwmon@vger.kernel.org>; Wed, 26 Nov 2025 15:49:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764172169; cv=none; b=kcMecs/FduJxomJSV/DYS2ww497WzTEr7LtCgKcd/VIyuEf/2+fXxcjmgUG+UID+baUnEINuV3+Od/my4f+xgXw2b6WMFp2SbzEtv/PW0040opufSAZ2wujp09un9CYrIwln2NdyzLjYWa4utydd2HnPeuLKAfk+HyWessI6JTc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764172169; c=relaxed/simple;
	bh=4GVFHLoAHgs9rsX9ZMywLC+qYDsOEUKsWqhZ7te0eBY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=gGDbXOTylMBnqepooH4M0ZQrFQ2s83eGbDIdw4oV8DZGKml4KjHc4+i3Ps0bVkTyAqSvwBHtmmNGKqA0CI54pglK+LdBsjzQE/RkAPq0IQ++YTmS4nMJF4IZuVcWsH+70GDfkz0jWM6cP943hT4g8RTuceU4JXcsjzI3xnzeYd0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=KlN5aqI+; arc=none smtp.client-ip=209.85.214.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="KlN5aqI+"
Received: by mail-pl1-f174.google.com with SMTP id d9443c01a7336-297d4a56f97so101807495ad.1
        for <linux-hwmon@vger.kernel.org>; Wed, 26 Nov 2025 07:49:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1764172168; x=1764776968; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:sender:from:to:cc:subject:date:message-id
         :reply-to;
        bh=KTSzEBiWnVkWMLP/Pta1p+lhqPak7D5x7y8I/Sv2GO0=;
        b=KlN5aqI+OEPyiTyei1ZDeJ2GvV/9SdR11ftFx+Rsd/a8yQzJPj18DtnK0LBCTe4/VA
         AiAGJcfiEoO20+7tiqHz023USjMIeW526GAPktju5PAS5bhvbJ5UnKoassaSXqvRS3tS
         wSx+DjtWvWdv0s1ez/rmwpY9yFMuuJyYKSiDuLzl2VnOlWPEYAcBO32t99iJ3D9rZ9nB
         EEXRCIX0szzsiF9zTQX8dy9HdN/bzhc/evp4Nh9OYNWWnhqzjobJWlik8ch7dCKhDe3A
         aemUfiALJA+ZOJDelxw0lIG3Oynlnp2tnNmPuPeLtJwmnlnI0+tvSfrDZYGlCONkgyQ+
         w1UA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1764172168; x=1764776968;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:sender:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=KTSzEBiWnVkWMLP/Pta1p+lhqPak7D5x7y8I/Sv2GO0=;
        b=i2dY+VjEV1hMwRzin6nqkqu/5XWzTvdiNU0WaRDe+SH1OJ6S4VaF6gkxxZTju+TZDK
         HZt9dEXdlQKygh87gSCeMvetDIeZphlpqCVgGWjG00KniI9e2rRPTkR/CZ28clRanN6P
         E/1ngfU9+knDoNmie4dxTqhyZaB7O4oVZF+76YrbHv3qw6pbdg3KcAuOkAHd2UNu+nRa
         KY5p9QPiNhyAdpHB/skEx/P98J9CVcoxc0ujZgV8/oI9GyV7D22kMoZt/BUP+lPl4J4X
         QiZ1tqZcXC+CxREdZjg3GPdpZ/DqbkJAPdtz01PbT7cZIDAqy41fLAbI1PsUHnoNEhbY
         DDvA==
X-Forwarded-Encrypted: i=1; AJvYcCXEeutEzZpg0wYQ2CKv2RsP7PRbvRTMjItviarKpOluTS17oY3Djb66J3Nda8JyifDSLzbSYmLfzi7IlQ==@vger.kernel.org
X-Gm-Message-State: AOJu0Yy8KuX6rz+4J/85B55w+RiCnxDD8MqNU08eJ4iIqmODg9UCIdLp
	unzTBbY/7JUfQof7RVSKuH9AAiCBK7nHOufGF/z89dFeiKA8x4e7fknP
X-Gm-Gg: ASbGncu9E7qoNrzqs/gkP9R5uQU9yNHYhH7FlglGHCU5in2pmf3q8s17mZLGmgxf6Iz
	9Q5mL6OX6ejWnPSFFOufA03AanEJIUEIU/De+rOUpscQlX0J3PATZvfoflw2e7nunqnsIwp0Obr
	fx6MkN5JXckiIwJ5BQ8N6yU0c6gqrzMiDVInNy3kz2KNrTnu/rxx0osDf3LazXphvJPaIhwZ6/y
	5wy3CAXH19tHrgoCxXGbwbxcSOZFjgM5bCCfcHszSO5Jf6Taa3gpPJ/KYGxNA77jB5/tnB4VBqp
	Kn0/2lih6CBpWtUZg8cjGu3iGz2mrZ4FnRyNoxzqsALHtbjlW8onsSWKfb2g3xsM87ZXh1dQ5FA
	RXWHi/UXZqs8EndTR0yZktaq/dJGCugyXEP1MRvF/DQ2p3Syxo8CjV33Zr0E8i7eaRGj4NVT5gp
	1bKoHaPMkz7rpU8+tdOS8p39Y=
X-Google-Smtp-Source: AGHT+IHYFjIDV/z55sW8a45nlG90/yBb3iRhJaKhnR2pDK8ly55VFv/+bdfCYR+J4U5v4jz7A+StaQ==
X-Received: by 2002:a05:7301:4616:b0:2a4:50ca:9234 with SMTP id 5a478bee46e88-2a719d7d25cmr9779908eec.26.1764172167554;
        Wed, 26 Nov 2025 07:49:27 -0800 (PST)
Received: from server.roeck-us.net ([2600:1700:e321:62f0:da43:aeff:fecc:bfd5])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-2a6fc3d0bb6sm104571765eec.2.2025.11.26.07.49.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 26 Nov 2025 07:49:26 -0800 (PST)
Sender: Guenter Roeck <groeck7@gmail.com>
Date: Wed, 26 Nov 2025 07:49:26 -0800
From: Guenter Roeck <linux@roeck-us.net>
To: Gui-Dong Han <hanguidong02@gmail.com>
Cc: clabbe.montjoie@gmail.com, linux-hwmon@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] hwmon: (adm1029) Add locking to avoid TOCTOU
Message-ID: <1783a38c-f4ff-4564-8c76-fc5613707c5f@roeck-us.net>
References: <20251126114047.10039-1-hanguidong02@gmail.com>
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251126114047.10039-1-hanguidong02@gmail.com>

On Wed, Nov 26, 2025 at 07:40:46PM +0800, Gui-Dong Han wrote:
> The function fan_show checks shared data for zero or invalid values
> before using it as a divisor. These accesses are currently lockless. If
> the data changes to zero between the check and the division, it causes a
> divide-by-zero error.
> 
> Explicitly acquire the update lock around these checks and calculations
> to ensure the data remains stable, preventing Time-of-Check to
> Time-of-Use (TOCTOU) race conditions.
> 
> Link: https://lore.kernel.org/all/CALbr=LYJ_ehtp53HXEVkSpYoub+XYSTU8Rg=o1xxMJ8=5z8B-g@mail.gmail.com/
> Signed-off-by: Gui-Dong Han <hanguidong02@gmail.com>

Applied.

Thanks,
Guenter
