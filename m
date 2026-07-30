Received: from mout.web.de (mout.web.de [217.72.192.78])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CC2E03932F1;
	Thu, 30 Jul 2026 18:40:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.72.192.78
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785436863; cv=none; b=NQHtifELdrDvpH7xNXuMDLTGtv9Rcaf1So9B8Vk9y31l/1KVsEtkwQNFhq5lGwRZUTHkPYv+xGsjo4sYAlGxTKNOe7AWAplxqyCk1j726lKKoXAZSJZbPpk+Z57sBOWZV2fVF/JUJVhjB4rP7nkA2sYCXs5bSdmz1yqkyi349Uc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785436863; c=relaxed/simple;
	bh=ZpQHDmH9rXmyeXhESVOiGIPUfSJvj0yPqc+2Ah3ZBYk=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=PantVBudtjGJfwd/0yBmFvp8eGN4rwnUlblBzyjqp0iEnjWvXqMgrdRmnPMOYItGdTf/cqFoLojaKUC9cnba4lGyMETwg/tWzUTCb7jWRXe8WKDnqlx3Epcv9Zc3Il1f1Ty188G9Adz5Ae44E/2sXAdWWQHOqSQGTKDR/OrUCLI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=web.de; spf=pass smtp.mailfrom=web.de; dkim=pass (2048-bit key) header.d=web.de header.i=markus.elfring@web.de header.b=OU+XL1Vi; arc=none smtp.client-ip=217.72.192.78
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=web.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=web.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=web.de header.i=markus.elfring@web.de header.b="OU+XL1Vi"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=web.de;
	s=s29768273; t=1785436837; x=1786041637; i=markus.elfring@web.de;
	bh=ZpQHDmH9rXmyeXhESVOiGIPUfSJvj0yPqc+2Ah3ZBYk=;
	h=X-UI-Sender-Class:Message-ID:Date:MIME-Version:Subject:To:Cc:
	 References:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:cc:content-transfer-encoding:
	 content-type:date:from:message-id:mime-version:reply-to:subject:
	 to;
	b=OU+XL1Vip738GAC8BKwKO7NGaEKfO9Eds0YmY3Indp54TDL+hY/Jl5cRKKRvi4DC
	 JjNL5cSlJz+rXs0IYApjLcrlzn4T4Dfg2awEmm8Oi4j269UYwzdyC6fxm9vNDeBJt
	 ngllr0BbktJCqdytrkQ9InPimxEYhtx1iHgqn6nFH4Yl9Oe0Rhh2KbJhe4xMnPj3a
	 mbKF8qn+Eoe9gz1PuX4SvBPDlHDppmszGYDXWaRK1VEpVcoWe/4NqqW8In+le3zyu
	 a/FpswIZQeTo0bIUW0mWnmiGP395jIDGKuWZyJ3//jC7e/4UcCF+JgCOIKOXjbsHZ
	 vzw0OEqtd8Zch4+NOw==
X-UI-Sender-Class: 814a7b36-bfc1-4dae-8640-3722d8ec6cd6
Received: from client.hidden.invalid by smtp.web.de (mrweb106
 [213.165.67.124]) with ESMTPSA (Nemesis) id 1Mcpuy-1xO19b0wVO-00nQh2; Thu, 30
 Jul 2026 20:40:37 +0200
Message-ID: <8c0d6285-11d6-4158-8f46-450c9b36eb17@web.de>
Date: Thu, 30 Jul 2026 20:40:27 +0200
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v7 4/4] hwmon: pmbus: mpq8646: gate the writes
To: Vincent Jardin <vjardin@free.fr>, linux-hwmon@vger.kernel.org,
 devicetree@vger.kernel.org, Charles Hsu <ythsu0511@gmail.com>,
 Conor Dooley <conor+dt@kernel.org>, =?UTF-8?B?R8O8bnRlciBSw7Zjaw==?=
 <linux@roeck-us.net>, Jonathan Corbet <corbet@lwn.net>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Rob Herring <robh@kernel.org>,
 Shuah Khan <skhan@linuxfoundation.org>
Cc: linux-doc@vger.kernel.org, LKML <linux-kernel@vger.kernel.org>
References: <20260730-mpq8646_v0-v7-0-e7c7ad768d5d@free.fr>
 <20260730-mpq8646_v0-v7-4-e7c7ad768d5d@free.fr>
Content-Language: en-GB, de-DE
From: Markus Elfring <Markus.Elfring@web.de>
In-Reply-To: <20260730-mpq8646_v0-v7-4-e7c7ad768d5d@free.fr>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:S2pqLGTZBhlEbjzh/mjivDgfPdSBpTPlfR1x1fudffcxkG2N3Vz
 5ZoOzI4iqVIpLsVNmn7dEV8W/ECVtUIytgWxF25g2B1xZDW6cj7hYx5Ird/0pYpnOcz9LYp
 i/cWL4+AnPcguNGDSKLM9GDKRqGyaliwN6/Cu8WSxU5O+uzMTPQhxRYUe10X8tzNZ89c45h
 oV6/LPHojRh8gopnlFvHQ==
X-Spam-Flag: NO
UI-OutboundReport: notjunk:1;M01:P0:A0KDXmDADP0=;t+fbjGXeb8aev5vU53ln79wjH1r
 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
 Yjw

> The write cases of debugfs entries are provisioning and bench
> helpers. By designs the MPQ8646 powers the CPU core rail,
> so a wrong write can brown out the board or persist a bad
> setpoint into finite-cycle NVM.
> Said differently: some wrong register writes can and likely
> will physically damage or destroy the chip and/or the board.
>=20
> To be safe, it is disabled by default behind a
> CONFIG_SENSORS_MPQ8646_DEBUG_UNSAFE and we print an explicit warning
> banner at probe time when they are built in.

See also once more:
* https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/tree/=
Documentation/process/submitting-patches.rst?h=3Dv7.2-rc5#n94

* https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/tree/=
Documentation/process/submitting-patches.rst?h=3Dv7.2-rc5#n669


What did hinder you to take linked wording requirements better into accoun=
t?

Regards,
Markus
