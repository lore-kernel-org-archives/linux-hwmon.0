Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.51
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793122368;
	b=K16zJrI7AwKoTGf4VR4pj1++XRNlfkIGS7vHT9nXHlvvQRpyenc+7TTKhrfqGNzODuPX
	 VNepQtTfQfzodN3BHmkfBnK7EaF3IM/VWo92z7XMdvjFDIXlhI55A5K9Yg8rV82a62hlV
	 jF2IzCE9NtDNHkFfMkCHYZHcFJ0EX+8DN4BSKkqLTtj5yKVQq59ksasthHFzHw+VHothe
	 CH0snqGkOAuvRfBASOb3yVl3Yk4dHRP+1zvODKKhHrUWJ0eSnOr9+SfRm6nk+DXVZeGjE
	 PNTumJ+ZJH/Jgwbsecc/gBCK8F6nfkGGjz+h/CxphjBj1qNC5My5gK+CuWBOo+SiczA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793122368;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:X-Google-Original-From:Date:To:Cc:Subject:Message-ID:References:
	 MIME-Version:Content-Type:Content-Disposition:
	 Content-Transfer-Encoding:In-Reply-To;
	bh=T7vpIX2c6I0fdln2Veyf9JYdJ3RICzbnThdpI2zJVAY=;
	b=S3AoZmtImUobSF5oc+PPOE6djH/cWuop9tcJh5PK/zp5yBeYo/m9SHgC34USwbYqlkZb
	 fMbmR1IDRUY/lxx6z5BHdHtvJWTEfYhjTdbNUyB8fOroSeoyRXhHNCHt5O8jhl/cxxKm3
	 s9yiKA6slDZW68bBkZK6f3P/lw3WAxdKqzOFF0vsf5hNdJBo0AXfHDbFQce2gv5XIAEXa
	 SMD6IdWVOAkgoWAymZNRpTvlR/DCEQEbVp8Feo+XSGpgJz52qwkFFc93WOYQfBF7lRBUk
	 tALOX64BlZpjQ0ZUEqvVT0m/qxltC7f9XXdeJVHZnu3jX6qFCweYTyOHMJGQaCxS1cw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=suse.com;
	spf=pass smtp.mailfrom=suse.com;
	dkim=pass header.d=suse.com header.i=@suse.com header.a=rsa-sha256 header.s=google header.b=IERQJ8SK;
	arc=none smtp.remote-ip=209.85.128.51
Received: from mail-wm1-f51.google.com (mail-wm1-f51.google.com [209.85.128.51])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 35DBB606A321
	for <linux-hwmon@vger.kernel.org>; Tue, 27 Oct 2026 17:32:48 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 35DBB606A321
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=suse.com header.i=@suse.com header.a=rsa-sha256 header.s=google header.b=IERQJ8SK
Received: by mail-wm1-f51.google.com with SMTP id 5b1f17b1804b1-4a207b02a2cso797785e9.1
        for <linux-hwmon@vger.kernel.org>; Tue, 27 Oct 2026 10:32:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1793122366; x=1793727166; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :content-type:mime-version:references:message-id:subject:cc:to:date
         :from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=T7vpIX2c6I0fdln2Veyf9JYdJ3RICzbnThdpI2zJVAY=;
        b=IERQJ8SKVi7acDhRQssNKz1tac/IbKaQ1f3zM2O6OFxp7pR62BajqEQCEG9JaHuJ0M
         nQcwhrNTXW9RxyhteLIPA9LNKH3J8QG6lRhv0OL4TUC+apZBNfnCpD+BF0HWr/VmHLKj
         QLLQFq36t5Dn2Lbi3bALdp6V6iWGR0HV+f1uumVypHlLGv2yedaXHJ1JnI/oj9ZLGnjq
         QVjST8/BTNTCaXMtA8cSAV1xFORYJbiv1UzZNmsysoTn46/NG8HHUwfmp1BBp1TrWO6S
         RsL0VSK+XetFWxWIQrF+txjov/HPcyrMrdiw0sWqufM1K3ER+n4eY4ikpmfRoDWv53YC
         TSLw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793122366; x=1793727166;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :content-type:mime-version:references:message-id:subject:cc:to:date
         :from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=T7vpIX2c6I0fdln2Veyf9JYdJ3RICzbnThdpI2zJVAY=;
        b=pcuiSLcX8JsoxE7XWbUVLAgMGmuGr34G2T6vmIaRpBtKjZQfbtWSfH8ofOQCrTDI2i
         E+vW1MfkEpqkHhtFzLdf6yBUSoAJTdxC3pGt781zvmbr7UIUennALL+oOO0+HKyxdHiU
         ViJ/ZoJ85kt6EKWlhgwpHUzatqRtU9PFEOnePf9zS4ZhauJR2MmutAoI/r99V7XjHNAO
         oj6AL68YMoJ/Kb43vrU77v7r4K2ckMs51D0CHMnoZBzXY3vtH8al2CvCZY5x5FKJtzyb
         A9zK6wAbBpG2NDsAjGK+Esl6LDtg/aU5qypwzv3qNHQ2U/a0sQ0kElu8zKrRu5JmZtI0
         TDBA==
X-Forwarded-Encrypted: i=1; AKwUvBzzu/tj1xxeSwTJDAO9K4CRe9h1HZDA4/rqwcG+8Q/wCsYt8e1rsUrpMhD/rNH0d9QKB0bxzi2AFcOplw==@vger.kernel.org
X-Gm-Message-State: AFq9FYJmrOrKNoYf4ebr7H6qY/BKCcw3lYrNN5f/V4b4dI25+F75/zpw
	TypsEpioNpPseo5SZzIJwHLCLrFM5nnYSB2v6O6rJmBy/p2DwW+SaM8boy2T2UXzDOk=
X-Gm-Gg: AYBFou0wZlTBvv7t3B3PRVxX8y6XF86xGVKxSLxBz30gkUesrZbwbKSJN0ceePYiS88
	bVUK3HxV9eIW2gpe9CqiRPADRiNwAOw0eAydquilf25nUcMKWi9TA8J364GxTHzcT7VGqCELXrc
	qYSfLtyc8xUwS9A/sagjr8Qrl/MMbL7R/wPbihq8mMPz5G4zP2ppYhOJAV1C0WrODPoyRQcmfyu
	wW7BIIg6Z6hl1qtHKwmCI3tHL056gl+nsa7skhVOwk09tYJY1w5sApOkep2gbyxn6+yIULyPaVu
	o3DvcdWqO6VTiR8YAmtCVg+emOTa7v1kbdq6USlY8mIS/FWNmtgLMPR9WJF48jislUXzJrqCDEd
	oY5JL+1gWPzhOGEyLF+p4FiI/FQulxqek5mBNYpB9L5ZxG5V0ySg6WxJbBBrN+4381MlcRCn50I
	7VgFnbz0/5o33/tsHaW5EVjH3r4TalSr9Pa7SDu9JysJJKVNYvcLgZHK0y5UbJhUawTOKO04OLh
	SbumPnZvuSZB9rjp+n7hW4R/pL5yXYQ0cEScoPp5ydeij+wlbMR7rA=
X-Received: by 2002:a05:600c:4ece:b0:4a1:fbd2:f689 with SMTP id 5b1f17b1804b1-4a35ac9d100mr198532065e9.7.1793122366508;
        Tue, 27 Oct 2026 10:32:46 -0700 (PDT)
Received: from localhost ([82.192.120.214])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a92b881f90sm5173585e9.11.2026.10.27.10.32.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 27 Oct 2026 10:32:45 -0700 (PDT)
From: Andrea della Porta <andrea.porta@suse.com>
X-Google-Original-From: Andrea della Porta <aporta@suse.de>
Date: Tue, 27 Oct 2026 18:36:37 +0100
To: Uwe =?iso-8859-1?Q?Kleine-K=F6nig?= <ukleinek@kernel.org>
Cc: Andrea della Porta <andrea.porta@suse.com>,
	Guenter Roeck <linux@roeck-us.net>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Florian Fainelli <florian.fainelli@broadcom.com>,
	Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>,
	Jonathan Corbet <corbet@lwn.net>,
	Shuah Khan <skhan@linuxfoundation.org>,
	Randy Dunlap <rdunlap@infradead.org>,
	Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
	Gregor Herburger <gregor.herburger@linutronix.de>,
	Stanimir Varbanov <svarbanov@suse.de>, linux-hwmon@vger.kernel.org,
	devicetree@vger.kernel.org, linux-rpi-kernel@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	linux-doc@vger.kernel.org, linux-pwm@vger.kernel.org,
	Gary Guo <gary@garyguo.net>,
	Christophe JAILLET <christophe.jaillet@wanadoo.fr>
Subject: Re: [PATCH RFC 3/4] hwmon: Add driver for Raspberry Pi RP1 fan
 tachometer
Message-ID: <auDhJbMOQ-qAeBBs@apocalypse>
References: <cover.1792748690.git.andrea.porta@suse.com>
 <0d2249a66732bfce38a2260bee08cd1ba4097e51.1792748690.git.andrea.porta@suse.com>
 <auDRHk8eaYife2zH@monoceros>
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Post: <mailto:linux-hwmon@vger.kernel.org>
List-Help: <mailto:linux-hwmon+help@vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-hwmon+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <auDRHk8eaYife2zH@monoceros>

Hi Uwe,

On 17:32 Tue 27 Oct     , Uwe Kleine-König wrote:
> Hello,
> 
> On Fri, Oct 23, 2026 at 12:15:56PM +0200, Andrea della Porta wrote:
> > Add a hardware monitoring driver to support the fan tachometer on the
> > Raspberry Pi RP1 southbridge, found on the Raspberry Pi 5.
> > 
> > The RP1 PWM controller block contains specific MMIO registers that hold
> > the current fan speed in RPM. These registers are periodically updated by
> > the RP1 internal firmware based on the tachometer pulses.
> > 
> > Since the Linux PWM subsystem does not currently offer a framework for
> > exposing integrated hardware tachometer readings, this driver is
> > implemented as a standalone hwmon device. It parses the
> > 'raspberrypi,pwm-tachometer' DT property to find the supplier PWM device,
> > establishes a device link to ensure proper lifecycle management, and uses
> > RP1-specific PWM functions to retrieve the RPM values.
> 
> I wonder if the tachometer readout should be a counter driver? That
> would allow this driver to not be specific to the RP1 hardware.

I suspect the counter driver won't work with userspace daemons (e.g.
fancontrol) which use hwmon as an interface.
OTOH this driver is indeed specific to the RP1 driver: the fan rpm are
read from the same registers range and hw of teh PWM controller.

Regards,
Andrea 

> 
> Best regards
> Uwe


