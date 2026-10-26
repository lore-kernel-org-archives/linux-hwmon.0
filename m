Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.216.52
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792974787;
	b=uT55jJGj1yhHcxuI+x1tlGuT5OOUa2vgVh7gqtQjiyNRd2cUAzANcyqLHkye2v96iFe1
	 LaeS4XjV8wGpc+HgnZHatOciWtjD0YXreeCfvRTgIA2IL0pZelAflwFRYyVcM+7kHiqsB
	 XcbY6Q+Eal+tEq4KK4isq/3tSI6ZtloAiCWSf8ue84ZJw2oK/Wg3H7Xui2acW6kEc+TPA
	 Kz+da/PH6m0SXB65/zCrrVHX0oyHMYFUl+VRJHvlPx7atPwh87PLwU1zDJ/IMDYCmQ1UY
	 KcFGk4AtAporwA+/GMso5M5mBMzCLAg8WdRJ4XJC6XIMXxjqbEnzSZCY+7uj5VGeBYw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792974787;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Sender:Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To;
	bh=865z0yFfpUqJtRq3suZQ43e544tMOYS8XbQlQ9kez3E=;
	b=fbAQn+IQ/tZM1w/UlNuZz8ygMw+CCgXMdnrDSU+N/N0pR8yLmgic96FyuFrq6+OV9UQ/
	 knmGJ/jyEf+8sSYvmLzccnrxb3apGdwRYbd6bTQee+nPeVauqn7pHPSbp8gczY0GiglCS
	 hGatB0eztIbKZ8bnek631GN47a3AWqqFSotpfoMbQnPg8OeXbO9FtQryWQPuuvPaxepPr
	 1fck4ChCEgt5TAzuKzne4y67tJI6ylrXakAHNstPuK5aryW3xd4AAh04DCITQQ2Hw5IPR
	 gdEe5V9JVfcv9UjJt1Loj8Puq2/xH2hmtTW3RlyLx83dL2Brjw10bYWXNJttqLLsLyg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=roeck-us.net;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=oHp4hYKx;
	arc=none smtp.remote-ip=209.85.216.52
Received: from mail-pj1-f52.google.com (mail-pj1-f52.google.com [209.85.216.52])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7DA0B606A31B
	for <linux-hwmon@vger.kernel.org>; Mon, 26 Oct 2026 00:33:07 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 7DA0B606A31B
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=oHp4hYKx
Received: by mail-pj1-f52.google.com with SMTP id 98e67ed59e1d1-3ae2b7e1e17so58375a91.3
        for <linux-hwmon@vger.kernel.org>; Sun, 25 Oct 2026 17:33:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792974787; x=1793579587; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:sender:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=865z0yFfpUqJtRq3suZQ43e544tMOYS8XbQlQ9kez3E=;
        b=oHp4hYKxkfhpYxLnC1QIblmjj3Z4Z68PhTWQv9nqcC2U3O6PM24iG34RPY/girk2qM
         i9vAYPPdW1Fsi27o0Rf41lUbp4VGRtFQSwyoxut5/Iq307JN2cxT3EBD0JCQh4/Hc//Z
         eYRwuomX9QoTlnOs/MqB2YObNrUEAhq52jhHBY/P5NbdUambApSCFCAuQqrDkor7eE6z
         A1OlzdDVVWIngZbckYoMem0KVQRXlnlSvTH+NFmkQrh+674jvt5OInytB7EQ9lPo8MQh
         fHKZBOzBZRMqSgqUQDImZCd/KE2ty3tlpEN7xdNCbAJwRGXTXoFDkssJv7gr99shRZ2f
         ZdPA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792974787; x=1793579587;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:sender:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=865z0yFfpUqJtRq3suZQ43e544tMOYS8XbQlQ9kez3E=;
        b=PkdH5bqsuQRXiCngCUWCKef29BR7KOed0jJC8WhLM0v/hKZ7EOEsovO47ihnTlUY6l
         nV6niy+0EJAjm4bV8lCRC3z8V33dR9mGToKMWabapeiODZUy5TujdSa3nkcNykokB9Li
         sUHYuQHGXl1Td5KbwWmkAh1RYjKUa7S0Zxn7zkqayLkFcuimuPWyEOd8CEBN2lRZ9Ktf
         E4n1+8HCWAmhnszKzJKYGlVhqMGFf/nTJd3N7JPDY2SxdTl+NdFgv89pNRUtQQhwRTLD
         eo5Mlg56EqF6+0yvBOjz2DqoI8zVXrgUsxOOGIqSnjSJfQGVtuqT4iVmndEXezGM78K5
         Xrew==
X-Forwarded-Encrypted: i=1; AKwUvBwCl2ahzr9DFwwQTbCGGGy6uvSkXRNUCm6bv/fXCA/8ibgwtP5U7WCaR5oPF+3Vscvwy84zl4OxgWpN/Q==@vger.kernel.org
X-Gm-Message-State: AFq9FYK3HOfxyiSB5yvTkuE8MO/mgi8pInOiQ4qSnVAuzEs9XcTgPpE2
	++PXgu2TIpcIjRGjecB90h78t0DN6dt21dKvqTsEEf56BAVS515IesGP
X-Gm-Gg: AYBFou08tafrupxXM1pvFq7n74xV6R6Hjuc+OjRlG5cRr1B8W/OGg+lecYBvAVm/9IQ
	fZpPCrupLXfG91B4CbOb6cFOuauWHm7b0Dcm1sjdFfzhP+UPutV9m5JZTM88+QrD388YiDMzIIc
	RYGinAe7n84fc07juhkZ2FOei5zn/yR2wYAkjc9Nka9M0NJnoNM9wT/TmYfO4ypixEdOedanBoC
	gfysDclIdiSxaJQpntCldoSocerCxfOyfrmRWW6YoHIoUbHjFCqFBTPfGwNPkIR6FN0ipPw2RJN
	32Urd0/ThhXTFdR2Lg91J4jhA1Vb5N7rjA74OV8sZkOLg734vn23JYWQvrSi0tTmSguG5BysJg/
	kndieu+VUE7yuIGPOtvHkoIShELfjO0huVBv2Slmx3E61n7PM2avW7uklt7IoEMYyxrEyPELKJF
	Trx1X/7b6QlQXEZsBz5nHX/h3yCFlHKulmA3mfrgbSIPk2Rc1qmcoG39m3ngIJ59EJzAO30Xd/l
	VWzlRszngbonCZ3anwyZnQaTXY4NYh6kioEQKTPDeR8S+u+bVd1qYQVMMPIel0u53n1aQ==
X-Received: by 2002:a17:90b:3a08:b0:3ac:dd28:4621 with SMTP id 98e67ed59e1d1-3adeaf9b65cmr4564839a91.51.1792974786804;
        Sun, 25 Oct 2026 17:33:06 -0700 (PDT)
Received: from server.roeck-us.net ([2600:1700:e321:62f0:da43:aeff:fecc:bfd5])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3adebadfa96sm6123240a91.7.2026.10.25.17.33.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 25 Oct 2026 17:33:06 -0700 (PDT)
Sender: Guenter Roeck <groeck7@gmail.com>
Date: Sun, 25 Oct 2026 17:33:05 -0700
From: Guenter Roeck <linux@roeck-us.net>
To: "Baek Kyu, Kim" <pocj8ur4in@gmail.com>
Cc: mail@mariuszachmann.de, linux-hwmon@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] hwmon: (corsair-cpro) Cache fan target only after a
 successful command
Message-ID: <40aa68b7-5809-4d19-98da-a2ec101e11f3@roeck-us.net>
References: <20261020160941.36787-1-pocj8ur4in@gmail.com>
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
In-Reply-To: <20261020160941.36787-1-pocj8ur4in@gmail.com>

On Wed, Oct 21, 2026 at 01:09:41AM +0900, Baek Kyu, Kim wrote:
> set_target() updates the cached fan target before sending the command.
> If the command fails, subsequent fanN_target reads report the failed
> request instead of the previous value. For example, after successfully
> setting 1200 RPM, a rejected request for 1800 RPM returns an error but
> leaves fanN_target reporting 1800. A failed request also replaces
> -ENODATA when no target has been successfully set.
> 
> Update the target cache under the existing mutex only after
> send_usb_cmd() succeeds, as set_pwm() already does when invalidating
> the target. Preserve the previous cached value and return the original
> error on failure.
> 
> Fixes: 40c3a4454225 ("hwmon: add Corsair Commander Pro driver")
> Signed-off-by: Baek Kyu, Kim <pocj8ur4in@gmail.com>

Applied.

Thanks,
Guenter
