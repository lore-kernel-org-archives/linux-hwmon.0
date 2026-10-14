Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 430A1550DA4
	for <linux-hwmon@vger.kernel.org>; Wed, 14 Oct 2026 18:38:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792003085; cv=none; b=Thq7JU2GqKv10G8MrtIcdRKMlfn6ZMsQgNaaLd7O7AoemxUHULm+l07jo5OWVEpDtyphdCfKIzMLezJ37vVSas25xyS+sJwJnBaNqmxLpVT4fUtNzKWQzCr7OdSuqhh4PMov8qR+VKbMu6oTbeAOS49wjyddroAnAQob5bM+8dY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792003085; c=relaxed/simple;
	bh=i1o+IxQYl/n8PdBCdWuRP8nMglL8QY1HVUGr+Y/4QAQ=;
	h=Message-ID:From:Subject:To:Cc:In-Reply-To:References:Content-Type:
	 Date; b=hfF23zslcbGu70tIBdqkrCXAC6xvRtu2afGD5M3mGHmUAGY004q46TIdXGoi+MwJ9+Oyly7/IoZLfl63aHXkPOS89pUR+93BL1XHSafFmCYvx+Yiw9iM8tT55Y++7iTdhS/wPjvZ1Mw/y7eiSKa6ud8LHuJTNffh1J7DDmmOGR4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=cNFKpsmf; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="cNFKpsmf"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9408C1F000C4;
	Wed, 14 Oct 2026 18:38:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1792003083;
	bh=zEHS6shS26meezRpjCUwX264evdFI3zf9naQOVkwrS8=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=cNFKpsmfa4QLuBzXe/LzPzFWqe196cryRctD+t464NfN6MjDcOk3SsuP26IpmuSoV
	 0sVSaPmbvfDatm9eUfyVKUbXVkwB3cG2p7g2Knn3E1CIiNc7uOaUuy/poStZdOfXC/
	 ByJ8XfITBe0qQw3oyN2AWUZScljfSRdIkpz6X+YYf2MxzAC1qs1dNge3bl7TLVi4fE
	 OcNsvIgF5vpNVIivGhfNLc7A1FAZQbxUKkOWGjByjnlHV96i45rknWKR9mtvJ99Py3
	 idn4ARsI4Wck1SZzu2IpXcopYN2546tNaesbxEepQ75Usau3mUAZq6dDEusb87P9AH
	 vYSpBkSXj064Q==
Message-ID: <sashiko-outbox-171716@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v3 08/11] hwmon: chipcap2: balance regulator state
Reply-To: sashiko-reviews@lists.linux.dev
To: "Javier Carrasco" <javier.carrasco.cruz@gmail.com>
Cc: linux-hwmon@vger.kernel.org
In-Reply-To: <20261014-chipcap2_locks-v3-8-27ebfc2c5b9e@gmail.com>
References: <20261014-chipcap2_locks-v3-0-27ebfc2c5b9e@gmail.com>
 <20261014-chipcap2_locks-v3-8-27ebfc2c5b9e@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Wed, 14 Oct 2026 18:38:03 +0000
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [High] hwmon: permanent timeout when regulator is always-on
--

commit 5c82eb519f9635342c52ec29776d87d3ed1c197e
Author: Javier Carrasco <javier.carrasco.cruz@gmail.com>
Subject: hwmon: chipcap2: balance regulator state

This commit adds a regulator_enabled flag to track the regulator state
within the driver, ensuring balanced calls to regulator_enable() and
regulator_disable(). This addresses issues where regulator_is_enabled()
might return unexpected values or when the regulator is configured as
always-on in the device tree.

[Severity: High]
Could this cause a permanent timeout when reading measurements if the device
is connected to an always-on regulator?

In drivers/hwmon/chipcap2.c around line 407, cc2_measurement() expects the
device to automatically start a measurement upon being enabled:

cc2_measurement()
    ret =3D cc2_enable(data);

If the regulator is marked as always-on in the device tree, the earlier
call to cc2_disable() will successfully drop the regulator reference, but it
will not physically remove power from the chip.

When cc2_enable() is called again, it will see data->regulator_enabled is
false, enable the regulator reference, and return successfully. Because the
chip was never physically power-cycled, it will not initiate an automatic
measurement upon power-on reset.

Since the driver does not explicitly send a measurement command in
cc2_measurement(), the device will never produce new data or fire the ready
interrupt. This appears to cause the wait_for_completion_timeout() call in
cc2_read_measurement() (around line 389) to permanently time out:

    ret =3D wait_for_completion_timeout(&data->complete, timeout);
    if (!ret)
        return -ETIMEDOUT;

Is there a need to explicitly trigger a measurement command if the regulator
was not actually toggled, or to verify if a power-on reset physically
occurred?

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261014-chipcap2_l=
ocks-v3-0-27ebfc2c5b9e@gmail.com?part=3D8
