Received: from metis.whiteo.stw.pengutronix.de (metis.whiteo.stw.pengutronix.de [185.203.201.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E4E403E8C56
	for <linux-hwmon@vger.kernel.org>; Fri, 27 Feb 2026 10:41:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.203.201.7
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772188890; cv=none; b=g2ge9LIKFuuFatHjcyHNpNEH1jCfkwNryk9KJT614jdwepmWJGEEsNEgGFRTuwPuwjxDGP8+gXxjTlPRBa4ZZ/7YQqOFqnOAOA+hfpI4vxTM6KzeeCRjykJ5iX5Dq2DD2G5FjafKSTPHK0r+tZg/m7ODOs+eqk2hphQmhKXuFHE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772188890; c=relaxed/simple;
	bh=+5TjKl8kKwZaifml2Ywv/XFpEld7c02pnD+PheIwsOA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=on2opj/l0ZraHo5MjKi4apR/RVGTE0jotDmkkN14qgHNAVl84CzgV0SqpAr9qcNfkPyW9inRDYgey8xQKTYB71D5p29M56rGBTnrBiC59ECK4kGta5OkbHO9SpklXGFwcAuUfz7GIIKzINa/+KKuzf/1wNfY5KO2BcBHP95lVO0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=pengutronix.de; spf=pass smtp.mailfrom=pengutronix.de; arc=none smtp.client-ip=185.203.201.7
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=pengutronix.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=pengutronix.de
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
	by metis.whiteo.stw.pengutronix.de with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
	(Exim 4.92)
	(envelope-from <ore@pengutronix.de>)
	id 1vvvHQ-0003rU-Lm; Fri, 27 Feb 2026 11:41:08 +0100
Received: from pty.whiteo.stw.pengutronix.de ([2a0a:edc0:2:b01:1d::c5])
	by drehscheibe.grey.stw.pengutronix.de with esmtps  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.96)
	(envelope-from <ore@pengutronix.de>)
	id 1vvvHO-002sf0-36;
	Fri, 27 Feb 2026 11:41:08 +0100
Received: from ore by pty.whiteo.stw.pengutronix.de with local (Exim 4.98.2)
	(envelope-from <ore@pengutronix.de>)
	id 1vvvHQ-00000008dD4-0mEk;
	Fri, 27 Feb 2026 11:41:08 +0100
Date: Fri, 27 Feb 2026 11:41:08 +0100
From: Oleksij Rempel <o.rempel@pengutronix.de>
To: Linus Walleij <linusw@kernel.org>
Cc: Guenter Roeck <linux@roeck-us.net>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Lee Jones <lee@kernel.org>,
	Peter Rosin <peda@axentia.se>, kernel@pengutronix.de,
	linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
	linux-hwmon@vger.kernel.org, linux-gpio@vger.kernel.org,
	David Jander <david@protonic.nl>
Subject: Re: [PATCH v1 3/8] dt-bindings: pinctrl: add NXP MC33978/MC34978
 pinctrl
Message-ID: <aaF0xNKzz74h0gBA@pengutronix.de>
References: <20260225171545.1980385-1-o.rempel@pengutronix.de>
 <20260225171545.1980385-4-o.rempel@pengutronix.de>
 <CAD++jLnkfcgme27DbAUOKn60HJbJuBghetEqpC8dhGnuMPk=Kw@mail.gmail.com>
 <CAD++jL=PKnAa6CrzGOwPoS_kJJjiHEvztgAFdEoYpHDPj6WT9Q@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAD++jL=PKnAa6CrzGOwPoS_kJJjiHEvztgAFdEoYpHDPj6WT9Q@mail.gmail.com>
X-Sent-From: Pengutronix Hildesheim
X-URL: http://www.pengutronix.de/
X-Accept-Language: de,en
X-Accept-Content-Type: text/plain
X-SA-Exim-Connect-IP: 2a0a:edc0:0:c01:1d::a2
X-SA-Exim-Mail-From: ore@pengutronix.de
X-SA-Exim-Scanned: No (on metis.whiteo.stw.pengutronix.de); SAEximRunCond expanded to false
X-PTX-Original-Recipient: linux-hwmon@vger.kernel.org

On Fri, Feb 27, 2026 at 12:02:53AM +0100, Linus Walleij wrote:
> On Fri, Feb 27, 2026 at 12:00 AM Linus Walleij <linusw@kernel.org> wrote:
> > On Wed, Feb 25, 2026 at 6:16 PM Oleksij Rempel <o.rempel@pengutronix.de> wrote:
> 
> > > +  - Pins 14-21: SP0-SP7 (Programmable inputs, can be SG or SB)
> >
> > What is SB now? Please explain :)

> Oh I see in the driver that this is Switch-to-battery. So document that here
> in the bindings too.
> 
> Also it seems that something configured as switch-to-batter must be
> flagged GPIO_ACTIVE_HIGH.

Actually, the active polarity depends entirely on the external circuit,
especially since these pins can also be used as controllable current
outputs.

For example, we attach LEDs directly to the pins. If an LED is
attached to an SG pin (or an SP pin operating in SG mode), the pin sinks
current to ground to turn the LED on, making it GPIO_ACTIVE_HIGH from
the LED consumer's perspective. 
-- 
Pengutronix e.K.                           |                             |
Steuerwalder Str. 21                       | http://www.pengutronix.de/  |
31137 Hildesheim, Germany                  | Phone: +49-5121-206917-0    |
Amtsgericht Hildesheim, HRA 2686           | Fax:   +49-5121-206917-5555 |
