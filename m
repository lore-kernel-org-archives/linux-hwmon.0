Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.176
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793042079;
	b=nEgduA7drjIm7FmX6V6LG108EDjIBJiJ1yYOrU86Rto8nQ8m95toprsMUApICuh3boE2
	 gQN67slw33+Qr6e9d2LQa/3ZZgYlATMTDU4bd8yc9QaNgi6FkERvM3fUNc6llArUbw4HI
	 XMoElz0D8MLCb14+Jah6a3KXELX+/Hi8/BLuD9UefabR/F9TTELYRdll9FL1cMuvmiYJ1
	 aDezLEuVdSWszTyR4PQQpxIfvPggKWTcRQz5PD6yPlxqprOw1F49nPE0N/8wOuJ6l83Bd
	 kWkhOvyXBHlQ4jlGtuKvIar51yvNYYAjFt3rLERLk6OOUR96zGM9Z3VXACsZ/iQoUWg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793042079;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:Sender:Date:From:To:Cc:
	 Subject:Message-ID:References:MIME-Version:Content-Type:
	 Content-Disposition:In-Reply-To;
	bh=xYd1AfKqcl+9tRJkqB8FFaIjzuEdllawIMWqWesHJnA=;
	b=qXRZjOLyYtt0MJb6i+5Jg9tW85SvfBy9LB9vVb+F4WG5qZ7OIeVVNPFXsr7kDyJU+pfm
	 bcSqg48BnUE/m5J0CFFL2r/Kl4q6CjrgECkURbiBirBcg5m3YLB4UMYsCPAMrmkzFxtY4
	 Us6V5u6eD6Yl4qz3VxvxnYzahPMmcrEVHwgm3VtLrZQ9Q6jNAnAuBVEmv5ss5hnX2vWqK
	 eBkC1c1c6ygp7zyFbQfSmfjwMik0M4usbv4ZW5dhcUZ+wlz1z8RbQPYi0tT8t+6w/7txO
	 85Fr9MiYE61Ga0Fc0PtAwoYH3VR7xrOUbelWKQq3rUACiskf/DihRpZFAkZWm7Fuj8Q==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=roeck-us.net;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=k8IAvO4R;
	arc=none smtp.remote-ip=74.125.82.176
Received: from mail-dy1-f176.google.com (mail-dy1-f176.google.com [74.125.82.176])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9ACE8606A31A
	for <linux-hwmon@vger.kernel.org>; Mon, 26 Oct 2026 19:14:38 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 9ACE8606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=k8IAvO4R
Received: by mail-dy1-f176.google.com with SMTP id 5a478bee46e88-3535bf8b3e0so5491545eec.0
        for <linux-hwmon@vger.kernel.org>; Mon, 26 Oct 2026 12:14:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1793042077; x=1793646877; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:sender:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=xYd1AfKqcl+9tRJkqB8FFaIjzuEdllawIMWqWesHJnA=;
        b=k8IAvO4RvXOI4qstAapQi7ZztKLiZvS5iYhzCyqZlUyegpcJPXdEfn3HNC+IByLvLo
         2QcUsv/9AeemW48Rkcen+gEew6+zLRnsIbBaegLEy9Rxwah1P/GDv79WiHPZVHk5uwyx
         qtGVsofaF0s+TydBCzoU1UNRIWJ2lpzvJTRjr01tOZvUyylQGRuTcNxRJkLQlitgj942
         sPBxSxAlG1A4LssCZ+83sn+WhxGBbVc+Rg8+XA5OLbvAkOn9gaYCSMyVAvW1gV5R4/Nq
         UD0VZzxhPTODb3Fsle4SoH0Q0z+H6H7hpnNjWJiBSQNZkYEedPYZHlCz0P3Mi2ndcGB9
         K5ng==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793042077; x=1793646877;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:sender:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=xYd1AfKqcl+9tRJkqB8FFaIjzuEdllawIMWqWesHJnA=;
        b=gmYhqtW7mRf4VX5hj6+pskSvKRpeA/fko1gU+OuYMeC6EFAVeU0qNb/kSfOBP/5QW0
         S/GsRBoJWko3kJhj6jQFCsp4TZ+OjmITP51BTKjLIkr6WuMVRHCKaU392nLe2Azs/JH8
         rYvxgK6vCEh4IXv513UhLQLW/QWYxLiSULYsV8OekcIg14T+IZ9Kwihgfd1Zqr9MRwOW
         wSWopY8zdq9zoSOZRXJKWWw0wEqe4mJT8+Sk9jC3ZRHvDAWPd3ZpVgntWldRwNG+WQc0
         IWGnfI3IBEYLZC45Wr/X9mBlrl3nMVvnyfHLn695LBHVTPOgZzvA32LzTXSE4vbCsYaT
         eMKQ==
X-Gm-Message-State: AFq9FYJ9KuoqaumfeTdOPl2A97KNVen53ELuaIwt+xdlPRNLQz4d88qh
	AofhNwGMdiY10FAlMMAH105tBILvpBarI/lxbmSmK52H6wF1owwFMnJ1
X-Gm-Gg: AYBFou3pRMDQEFPfwEp4utp4uKp5fmJ2yyOB1vKKVtS5t6DrXQcyPc9wDJPgfhDDOXA
	AvmqR6b2AFxVEb1rNe9dkbZ+VXFBJTJV0LeiulqehNZgW3nByT6J6BkRd0i78Aa/kjPt42YdBZY
	1/WMPAF4jAq9tyancNARLEZZoFSV1haQZHnJqDxAxkSGN5shGTXZKGyy1KreteMjxIiOX4mDeuj
	0180GAGyLSaKfniJi0CEFwONmLVatK6Xe11uUF/6MTv5cFmv3Zg5qmZOs49vfNLXFGnE7sN4ark
	58Xaa8z1rb3U8ZQaT9DRqbujPqtHmrTXV4VX2WBdU2Z32j4QT1k08FJ/r6AtpIK7ZZk27cwzxSQ
	L8BSPDHiEWURviso5tuAGi672dOSiJAdRr7SAz5ILK9aWB0tOPzkwebSp06rO6HSpCKxcyFCg1Y
	OX/VjBgahK2RFUOZqwUy5BRtgmcmsGcUGaeTcRxx0X5mmZmfb834PbgOrvi6ixC3lmWiRN/BwPK
	3OoO12BQ/159ZhBuIiwb27j8fGhXYpta9yFq9DGmYkHV6e6uQGGYSrpUejYVth+V/MyTA==
X-Received: by 2002:a05:7300:471a:b0:369:e8b0:af85 with SMTP id 5a478bee46e88-369e8b0b5acmr12248693eec.36.1793042077191;
        Mon, 26 Oct 2026 12:14:37 -0700 (PDT)
Received: from server.roeck-us.net ([2600:1700:e321:62f0:da43:aeff:fecc:bfd5])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-369e8afd64fsm31480019eec.0.2026.10.26.12.14.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 26 Oct 2026 12:14:36 -0700 (PDT)
Sender: Guenter Roeck <groeck7@gmail.com>
Date: Mon, 26 Oct 2026 12:14:36 -0700
From: Guenter Roeck <linux@roeck-us.net>
To: Hamza Mahfooz <someguy@effective-light.com>
Cc: linux-hwmon@vger.kernel.org, Jonathan Corbet <corbet@lwn.net>,
	Randy Dunlap <rdunlap@infradead.org>, linux-doc@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH 2/2] hwmon: (nct6683) Add fan control support for MSI
 boards with NCT6687D-R
Message-ID: <c302d22e-6ef4-409c-8f9c-28922afbad59@roeck-us.net>
References: <20261004153250.516730-1-someguy@effective-light.com>
 <20261004153250.516730-3-someguy@effective-light.com>
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Post: <mailto:linux-hwmon@vger.kernel.org>
List-Help: <mailto:linux-hwmon+help@vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-hwmon+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20261004153250.516730-3-someguy@effective-light.com>

On Sun, Oct 04, 2026 at 11:32:50AM -0400, Hamza Mahfooz wrote:
> The fan control registers of the NCT6687D-R used on recent MSI boards
> (customer ID 0x20d) differ from the ones used on Mitac boards, and
> changes must be made in a configuration phase of its fan engine.
> 
> Add fan control support for these boards, based on a reverse engineered
> register map:
> 
> - Manual mode is selected with bit (channel % 8) of register 0xa00
>   (channels 0-7) or 0x80f (channels 8-15). In manual mode, the duty
>   cycle is set with register (0xa28 + channel) (channels 0-7) or
>   (0x260 + channel - 10) (channels 10-15). Otherwise, the fan curve
>   configured by the BIOS is used.
> - A configuration phase is requested by setting bit 7 of register
>   0xa01, and is entered once register 0xcf8 reports that the fan
>   registers are unlocked. It is completed by setting bit 6 of register
>   0xa01, after which the EC checks the new configuration, locks the
>   registers again and reports whether the configuration was accepted.
> 
> Fan control is supported for the CPU (channel 0), pump (channel 1) and
> system fan (channels 10-15) headers. Add pwmN_enable attributes for
> them, with 1 selecting manual and 2 automatic mode, and make pwmN
> writable in manual mode. The behaviour of the driver does not change
> unless pwmN or pwmN_enable is written.
> 
> Signed-off-by: Hamza Mahfooz <someguy@effective-light.com>

Applied.

Thanks,
Guenter
