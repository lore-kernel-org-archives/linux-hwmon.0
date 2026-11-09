Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794231817;
	b=WW9bB05b3H8na2ZJRfAYornTLZ4f6w8Gp3lyZDYgT5/qUSO4yhv2xXPrA+fKabq+ZHw3
	 HxGIFS3UDTxeqYWmx335VnjV2m/eG5BYkK/GoxlETfwrNzQDtaEeCrXSBSp/TrNR/ZtVl
	 RsQyJ4B99aCAzHG2LGAPDpU3g9ETGmvLZ6e/YK2Tm1Z/zZecZMl6OXOE1SFUp+2qJtchW
	 zj4sfVxEScj8t3mVsbMnbE0a5Tr79nWiTIWgtzneKEiHHwSAfQr2Qpn6kvRU10OSzbSbQ
	 DQD2/1f3ud7T2YRjGMAGDU//gCNW8D4SiKN1dl0Ce+m+Q5X5HO7p3DowjMJRWDSUL0Q==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794231817;
	h=Received:DKIM-Signature:Message-ID:From:Subject:Reply-To:To:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date;
	bh=AVVlQY+/+arLP0TpZdC3nnqwHapEcMEZ3PXmGALW3tk=;
	b=tO536EqAMv1b6Ba5cnW0VZiVZXGZTT9PUZCOq+yGaseBegFMGPGkmfcg5k0sC8b0p13s
	 UbtweHiyoKugpdeM/MlXJcSHli508hjo8lnPzgdWLoKTfQQG0xwTyMBlNYXW8YMwyo8hl
	 lHo8VW8z1CRPUoz8ztx1XSMx3vmBFStW7FUlPXENXAm9M/4EkFlX0dOjBIYjTIJfiAQYK
	 BH8nNKAZg7qmvoXkqmdJYnJ2q3OYAoX16yTad98xFCa1sURUytxi+chtUt6H0wcoF5duY
	 sZJFZUmmyejMtHU9ChJWotUAVfL4hba9xjcnOn3cA9+MIRqkEvL/R0j/xTZMTFnzBHQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=JDr5EMvk;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 33809606A321
	for <linux-hwmon@vger.kernel.org>; Mon,  9 Nov 2026 13:43:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=JDr5EMvk
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A378A1F008A1;
	Mon,  9 Nov 2026 13:43:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794231816;
	bh=AVVlQY+/+arLP0TpZdC3nnqwHapEcMEZ3PXmGALW3tk=;
	h=From:Subject:Reply-To:To:In-Reply-To:References:Date;
	b=JDr5EMvkTzlvhq2trbQdTMGQswfZxY6891TNVz5RAGx31/np5o/vOJ6v8e0YJsHeB
	 9Cy/uWhDaQ7RaELG0VzG9flTqEgoBKQcTMonQkGwj1m9FV5t55gGOzc+MTmUYVj9PJ
	 ncrqf/LjCzmLAldSfqC5mo4Wo7/CZcQBTbY99E3SM8+AjWymbdI/xn5QmpccQ7eVdw
	 MOq6xUH2e6i3ejev7TYuuMnaMYRe0OzNhlFWHC7zrvIVd3Bq06Rp+ktHClDNPTUx2W
	 XDg4dIJTw/y8ERpnj/8FEqnjk7OGe6mxoUJUq+g2idrUV3kaeI967frf+SD5koJJ+a
	 BPaC4iXuxMDpg==
Message-ID: <sashiko-outbox-205021@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v2 5/6] hwmon: sparx5: register LAN969x fan as a cooling
 device
Reply-To: sashiko-reviews@lists.linux.dev
To: "Robert Marko" <robert.marko@sartura.hr>, linux-hwmon@vger.kernel.org
In-Reply-To: <20261109133609.810876-5-robert.marko@sartura.hr>
References: <20261109133609.810876-1-robert.marko@sartura.hr>
 <20261109133609.810876-5-robert.marko@sartura.hr>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Mon, 09 Nov 2026 13:43:36 +0000
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Post: <mailto:linux-hwmon@vger.kernel.org>
List-Help: <mailto:linux-hwmon+help@vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-hwmon+owner@vger.kernel.org>
Precedence: list

> Allow the LAN969x hardware fan controller to be used by thermal-zone
> cooling maps when cooling-levels are provided on the fan child node.
>=20
> Translate cooling states to PWM duty-cycle values and keep the cooling
> state synchronized with direct pwm1 writes. Register the cooling device
> against the fan child so thermal references resolve to the correct node.
>=20
> Signed-off-by: Robert Marko <robert.marko@sartura.hr>

Sashiko has reviewed this patch and found no issues.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261109133609.8108=
76-1-robert.marko@sartura.hr?part=3D5

