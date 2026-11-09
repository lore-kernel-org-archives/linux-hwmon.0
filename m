Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=212.27.42.3
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794216509;
	b=RStlSkVn/FUkw7f4uaOLF+ERNSFTRAlKaltNPayu/TlJouuE8OR9gBc+JBV0uYGXqAQq
	 QfQVoHgwvKoDV/I8ASAQORBog6TUXSygDDuZ6zvxbvm2ZREgqdDtn13PjvT7VpVJfZQvJ
	 NLUahqSDItjFHO/ysiKer4gc4BjlzXPQ9sw+oWyQnbbCq+g8ILNTfrRxqmcH/GcHs7pRy
	 W87zaGiSxjyu4XIPPxs8Ow7FOvSXYKL4uVbC4IRk1kmJ+Tfd+XX9yW32NP0ScJ9ub2y20
	 YryNI4JDtF733iDdp/sxkQ2+MDo0u9RB3E5J673G07GrauZyEFXM4tMTs09GsOssbGA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794216509;
	h=DMARC-Filter:Received:DKIM-Signature:Date:From:To:Cc:Subject:
	 Message-ID:References:MIME-Version:Content-Type:Content-Disposition:
	 In-Reply-To;
	bh=MdyvStRhNcZ3odBb65Zd5iSmOZj9CPzeuSfIV0RyGFI=;
	b=1/vaxilF1h3C87GDreHKfohBIpR3L74Tht58BWjlwsWDBQzlfowrKLkiidMT50FO6WNA
	 8DIvSMHb2iLVnqtxioRq7cFCX+FHxSv7hgKIOJqwhQXc/434R5l1hkEPayhJvZvNovwOC
	 rP5SAa/D6GXOfJrSi0/1+BaZJZrqJijAVF5uygmfFoTjSpY+12YQDEJZ5cSniAJXsXLMC
	 4FMe91dgz0ksTELJaHYWe+wBFMDG/I7pUu9Th9HAJwojJEEGHAUjnHtBThZBumblBfAcS
	 meC6iI9q5KAcqf2TL8uL9dKwjb13Ueo5aNdK4eXfyHTjeDJE0ZYUw4fQjVRqJ7ss2zw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=free.fr;
	spf=pass smtp.mailfrom=free.fr;
	dkim=pass header.d=free.fr header.i=@free.fr header.a=rsa-sha256 header.s=smtp-20201208 header.b=WIZ0bUfA;
	arc=none smtp.remote-ip=212.27.42.3
Received: from smtp3-g21.free.fr (smtp3-g21.free.fr [212.27.42.3])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E91C7606A31C;
	Mon,  9 Nov 2026 09:28:28 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org E91C7606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=free.fr
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=free.fr
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr header.a=rsa-sha256 header.s=smtp-20201208 header.b=WIZ0bUfA
Received: from L30177.local (unknown [82.65.104.223])
	(Authenticated sender: vjardin@free.fr)
	by smtp3-g21.free.fr (Postfix) with ESMTPSA id A301513F8B5;
	Mon,  9 Nov 2026 10:28:24 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=free.fr;
	s=smtp-20201208; t=1794216507;
	bh=Ds5SmVmRjMfOY1rnayl3QEZlv/yBTZYBWn0h/U+PhPY=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=WIZ0bUfAuSdoELz+HnU9buNNEgkklV7SpwHgrq8lHMxeerBdN7ntsvDjnX0/uiW22
	 FC7ze3fp1q7xEgaT4YMYeg29yfEclLCpZvgMCLYQy/Lx5rhSqgWs29nnr2dKXREexi
	 OWHSCBjAV8i4XNBYTok5qxY8q4ALgVFO0L1ooGq9++CXpsRjwQ1lh1s2lDKbaIzRqG
	 HdlIrY5uL9SPnZ7H/FK/7In3INhRokre03BIcHlP79+V/+TYe8j9owvqeeP6tQiOmy
	 PbJ5dPyux11UOxcZYDDy0VIMx53jYjksL5FOOYZXFfEggqG60UTHRWcFF8xR8MSXit
	 nl/Ynrgv64Fmw==
Date: Mon, 9 Nov 2026 10:28:23 +0100
From: Vincent Jardin <vjardin@free.fr>
To: Guenter Roeck <linux@roeck-us.net>
Cc: linux-hwmon@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] hwmon: (pmbus/core) Add a vout_command debugfs entry
Message-ID: <avGSN8Z95JXYKBbE@L30177.local>
References: <20261108-for-upstream-pmbus-vout-command-debugfs-v1-v1-1-c7a063efb91c@free.fr>
 <7ad9c540-ef80-4dc5-9a36-ddc9de07f957@roeck-us.net>
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Post: <mailto:linux-hwmon@vger.kernel.org>
List-Help: <mailto:linux-hwmon+help@vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-hwmon+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <7ad9c540-ef80-4dc5-9a36-ddc9de07f957@roeck-us.net>

Hi Guenter,

> Why not use the already existing pmbus_vout_command_mv() ?

Thanks, I did include your feedback into the v2, Sashiko is ok:
  https://lore.kernel.org/all/sashiko-outbox-204002@kernel.org/ 

Best regards,
  Vincent
