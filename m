Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=156.67.10.101
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793637399;
	b=Pn2kQ+xq9KKC3v/hQTr56L1Wdd19tno84Xra0s3x72YK8WApYn25c7GtvJEik0N421AX
	 oioCvPfEzjpbdZw0q1gq6VKw0G1uZK0dWeBsu48q9fRI/MDSR2a1J1qgCCkbF1KYHiOgS
	 9wCv69aV9n5FwzQ02Hx9vZBoFuG413v0i3nc3+xjGjWJfNftRD/xrdDd7Pel1dsK9dG/O
	 eEgbKJdJaOZtpLActhFRIgCyq/Ht4CHizbsPPGwZf+7RxPEZfpx2vj4dRU2xUcudB/hVB
	 64D1khtL+NMu2qKmnXKKEXj1b7Y0S7ED1zDmEc93Y4tg1xx+JNvMsgRLc41x8DfQMNA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793637399;
	h=DMARC-Filter:DKIM-Signature:Received:Date:From:To:Cc:Subject:
	 Message-ID:References:MIME-Version:Content-Type:Content-Disposition:
	 In-Reply-To;
	bh=up80y3aLZUYQS9c1FW8eeNAicDXg19M0Djm1fQd47+E=;
	b=ww6nl4/oIz5gThp7dQlGK913q3pU11y0OtptqYj5lDBkf3x2F5S2UxKaaAgvQqwF/I6j
	 48RgNrHMN8TAWhUD+1icCbAz7S/q7TJ7xmPzLAANVmZ6uFMHwpGvVaycjoXfHE5EdLbhf
	 W0H4VGP3issxf30OBYxETT1/KI0IcnC4yba2bcWdmXOv9Ff7d93251hR2T0XY065JYtqD
	 JLFzVrt0vgGvBL6/7fznJ3U/RpDKYhSjhosZccVJhIMIU2PkdvXPH7MDcY8IFlRTSQ4l7
	 XiUXpl7MYu9hSbwoW91cU5B++pusuFvQZi0ZMvjUI61KHyVZFhCxD6rpToVY3eqrHug==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=lunn.ch;
	spf=pass smtp.mailfrom=lunn.ch;
	dkim=pass header.d=lunn.ch header.i=@lunn.ch header.a=rsa-sha256 header.s=20171124 header.b=gKuGdMN+;
	arc=none smtp.remote-ip=156.67.10.101
Received: from vps0.lunn.ch (vps0.lunn.ch [156.67.10.101])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 91FC6606B0FF;
	Mon,  2 Nov 2026 16:36:38 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 91FC6606B0FF
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=lunn.ch
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=lunn.ch
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=lunn.ch header.i=@lunn.ch header.a=rsa-sha256 header.s=20171124 header.b=gKuGdMN+
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=lunn.ch;
	s=20171124; h=In-Reply-To:Content-Disposition:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:From:Sender:Reply-To:Subject:
	Date:Message-ID:To:Cc:MIME-Version:Content-Type:Content-Transfer-Encoding:
	Content-ID:Content-Description:Content-Disposition:In-Reply-To:References;
	bh=up80y3aLZUYQS9c1FW8eeNAicDXg19M0Djm1fQd47+E=; b=gKuGdMN+qGwhUn6TshH29+x/j4
	inOJ0c5vurI1sybimS/X0MQM7d3IawJb4x/G7it4+UzPIOvIDGBSSnXPvJxDRyczDmSI4lgEz3qeO
	XsNZWMy88n9Dw7s6OLBrU1pKvknudzmjgRKtG7XFRHH4o5ijK6fWIMBbVbr19VOlzIko=;
Received: from andrew by vps0.lunn.ch with local (Exim 4.94.2)
	(envelope-from <andrew@lunn.ch>)
	id 1xNv1H-00DpWX-Sf; Mon, 02 Nov 2026 17:36:27 +0100
Date: Mon, 2 Nov 2026 17:36:27 +0100
From: Andrew Lunn <andrew@lunn.ch>
To: Kory Maincent <kory.maincent@bootlin.com>
Cc: Guenter Roeck <linux@roeck-us.net>, Roman Kuzmitskii <roman@damex.org>,
	linux-hwmon@vger.kernel.org, netdev@vger.kernel.org,
	robert.marko@sartura.hr, luka.perkov@sartura.hr,
	o.rempel@pengutronix.de
Subject: Re: [RFC] hwmon: (tps23861) PSE-PD support, extend hwmon driver or
 move to pse-pd?
Message-ID: <e422d6e8-3385-43f2-bcd3-1c5060a5b45e@lunn.ch>
References: <03055ffd-d015-4810-8b8a-678821fa6dcc@damex.org>
 <92e3383e-26f8-4bed-b487-1c52f6c4f420@roeck-us.net>
 <8cd41211-b026-4158-8e18-454a9ac0bae4@damex.org>
 <4d12314e-56db-412c-a558-e4026cd03528@roeck-us.net>
 <d126b3d3-33b9-405c-9839-db492d874ece@lunn.ch>
 <9bac0a84-f03d-4fd1-8092-9922c65010bf@bootlin.com>
 <57516add-01bf-492b-9fd9-2bcb762e3041@roeck-us.net>
 <1219dc2f-0f96-40db-8268-1a8eb009b152@bootlin.com>
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
In-Reply-To: <1219dc2f-0f96-40db-8268-1a8eb009b152@bootlin.com>

> I am not using at all the hwmon framework in that development.
> But as the binding tps23861 is already reserved for hwmon I use a new
> "tps23861-poe" compatible name binding.
> To me, I agree to remove the hwmon driver but this will break backward
> compatibility. I am not a hwmon maintainer so it's not my decision to take.

Is the hwmon code applicable to the tps238XX range of devices?

Can that hwmon code by merged into the PoE driver? Without API
changes, apart from dropping the API abuse case? The compatible can
then be transplanted into the PoE driver?

     Andrew
