Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D5B1C345EDF
	for <linux-hwmon@vger.kernel.org>; Tue, 25 Aug 2026 17:51:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787680286; cv=none; b=H9D2+BAVjD+4MX1CLP5mwhY6R1tm1/posqCoZZ67j/l4/4ZXfEReE/bpe1BURn7WJ0KnsAaoxAMAl5qPu6vIhVyVM5JY1pZjs5PJ5bxWZTM2nk/9w/o8g3AQ1oU8fDC5TlXlWMeSGLT8ibTE5xfm9/fVAgvZ3wP9eQM82FKyaNc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787680286; c=relaxed/simple;
	bh=sGaT8+C63usno/qhsNE5jFg5rrc5vxoN1vfw80Oxurc=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=j/jsVCufRSm87jvfaOI6P34oYqJmjuL5Kk5d/+rar04qQRe0klio/VzA+RhV8/M0WQ88wYoqrFT6vdwF0410FqHGD+amKfIa9vkGWF+vJLSJyPGVsq1pOwhUdmn33zkbwtlUUceWfWK1KjIr3YLolZKX6sWZHBeqG6NI6VY48T0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=W47m6nlH; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="W47m6nlH"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9D0271F00A3D;
	Tue, 25 Aug 2026 17:51:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1787680284;
	bh=zAVCdVsh5OVhKrxWkPuRc9unqbbU+/cm1HdyNhIMMew=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=W47m6nlHOfWz9a8G0UpauUethTGYZGgW+3uCLU/2J4hGZFurH0pV9/qN0bZyX5yJN
	 MjwBvcc2nKVG4gZ+CFz/fhpD+khdr/6MVfBAatV6pd675QWGyKFKh8aWKrL7AaVBwP
	 UUz6MLvS8/AnvRuZEyjbz+Z4E4pOewOUzcxoYxgjvlKC4xLTDir8puT6sjbdUdOpcn
	 mn5lhDU9wl67UfFeV2vOz8Y0QIc0VMNje18Y5wadr913JcZydZJ1SgmDKO9eRQr2Mu
	 gf5lB4sGlPsdEubsHFQghN4T4WiV1V9HD9gsgHydBQmbmdthSuf7myuy3coHEYjp4f
	 uVReqtee+sJxg==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH net-next v2 5/6] eth: fbnic: report temperature and
 voltage alarms via hwmon
Reply-To: sashiko-reviews@lists.linux.dev
To: "Zinc Lim" <limzhineng2@gmail.com>
Cc: linux-hwmon@vger.kernel.org
In-Reply-To: <20260824175059.2485048-6-limzhineng2@gmail.com>
References: <20260824175059.2485048-1-limzhineng2@gmail.com>
 <20260824175059.2485048-6-limzhineng2@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Tue, 25 Aug 2026 17:51:24 +0000
Message-Id: <20260825175124.9D0271F00A3D@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:

Pre-existing issues:
- [Medium] Hardware monitoring functionality is implemented directly within=
 the network driver directory instead of using the auxiliary device framewo=
rk to place it in drivers/hwmon/.
--

--- Patch [5]: [PATCH net-next v2 5/6] eth: fbnic: report temperature and v=
oltage alarms via hwmon ---
commit ce6680b733799ddad39ba8fc00bdbf073f5793f7
Author: Zinc Lim <limzhineng2@gmail.com>

eth: fbnic: report temperature and voltage alarms via hwmon

This commit exposes temperature and voltage alarm attributes through the hw=
mon
interface based on static thresholds stored in fbnic_fw_cap. The alarms are
computed dynamically by taking live sensor readings and comparing them agai=
nst
these thresholds.

> diff --git a/drivers/net/ethernet/meta/fbnic/fbnic_hwmon.c b/drivers/net/=
ethernet/meta/fbnic/fbnic_hwmon.c
> index 4938f7b391402..c5cddd9cef124 100644
> --- a/drivers/net/ethernet/meta/fbnic/fbnic_hwmon.c
> +++ b/drivers/net/ethernet/meta/fbnic/fbnic_hwmon.c

[ ... ]

[Severity: Medium]
This is a pre-existing issue, but I noticed an architectural violation in h=
ow
the hardware monitoring functionality is registered in this file:

drivers/net/ethernet/meta/fbnic/fbnic_hwmon.c:fbnic_hwmon_register() {
    ...
	fbd->hwmon =3D hwmon_device_register_with_info(fbd->dev, "fbnic",
						     fbd, &fbnic_chip_info,
						     NULL);
    ...
}

Is it appropriate to register this hardware monitoring device directly from
the network driver directory?

According to the hwmon subsystem guidelines, if the main functionality of a
chip is not hardware monitoring, its hardware monitoring functionality shou=
ld
be implemented as an auxiliary device driver residing in drivers/hwmon/.

Could this direct registration bypass the required layering and maintainer
review for hardware monitoring devices?

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260824175059.2485=
048-1-limzhineng2@gmail.com?part=3D5
