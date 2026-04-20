Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 718C62D0C7B
	for <linux-hwmon@vger.kernel.org>; Mon, 20 Apr 2026 18:32:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776709952; cv=none; b=MV4TRhmbMQU0L1bhfUgB9XqfR6EC2f9qrUD8pP5mNlixsMls7DJkSbVBTFXYTqMXRQepV76pPwMXtBwiEp4zwUMCysnKWaWPaM6eDld4o4ibyFqGBdDUx0Mn30IGOQNhHU/oZ/1TEeworlSfNMgkyHodb3Tjr+byfq/w5StsRx8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776709952; c=relaxed/simple;
	bh=1Nh1AHZB3jUyuCulcnQLcI1OPn9qD7DzyEUnCIeIxxE=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=SCJM2pYoTt+av09cFN+k6vo6aIIAagnAxwPp64fh3YLrWtgdQywlFDJRNvAcRu0SQ98YglncsHVA9Xj3aOtECO6zrxzgDPjCa1S8D/T7c9h/lMXcmK59+AHqWl7mnbvKzLlYF5O72IGCkMETRvueouVcspvL0FAkT2c5JxAiZvU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=HwaGHHlF; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="HwaGHHlF"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E532DC19425;
	Mon, 20 Apr 2026 18:32:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1776709952;
	bh=1Nh1AHZB3jUyuCulcnQLcI1OPn9qD7DzyEUnCIeIxxE=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date:From;
	b=HwaGHHlF/Kc4jG9nyjKexQJeR81uZ5xIGQ0kRnO38+SFfKbNNOKmvIqbz4IjRiKkd
	 0LkJjST0wvjIjMyz1g4AeNMJW3ppudOQ6Njk/xJM2AdXcx1EhxOUhk3LQDU92PED5u
	 JCoF+UInz18jd9CKACGSlIIa7vEkV7prLcMxDTOV4hCKx5G+XjJb8xGkZq4CuFrB8B
	 2oDFSyOaUWTcmMuSHxufumiqIkHeqGR5bY1lEJHa1spW0CLq9qwHZk/wcX3KNzGPGh
	 LnrYXjtZil+nqQVyu80HG8WSkyoejOT3Shaep5yjw56T4WZlEPHDol0unoL8IkfxMf
	 Q39v4+L7pWSyQ==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH AUTOSEL 7.0-6.18] hwmon: (pmbus/isl68137) Add support
 for Renesas RAA228942 and RAA228943
Reply-To: sashiko@lists.linux.dev
To: "Sasha Levin" <sashal@kernel.org>
Cc: linux-hwmon@vger.kernel.org
In-Reply-To: <20260420131539.986432-72-sashal@kernel.org>
References: <20260420131539.986432-72-sashal@kernel.org>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Mon, 20 Apr 2026 18:32:31 +0000
Message-Id: <20260420183231.E532DC19425@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>

Sashiko AI review found 1 potential issue(s):
- [High] Unchecked dereference of `i2c_match_id()` in probe function causes=
 a kernel panic when using Device Tree fallback compatibles, forcing unnece=
ssary driver updates.
--

commit b782f8e0961d8ebf5fabe49f49ad99e6bb11a058
Author: Dawei Liu <dawei.liu.jy@renesas.com>

hwmon: (pmbus/isl68137) Add support for Renesas RAA228942 and RAA228943

This commit adds I2C device IDs for the Renesas RAA228942 and RAA228943
chips. The commit message notes that devicetree will use fallback
compatibles and no dedicated OF match entries are needed.

Link: https://lore.kernel.org/r/20260325090208.857-3-dawei.liu.jy@renesas.c=
om

> At the Linux PMBus hwmon interface level currently supported by this
> driver, these devices are compatible with the existing 2-rail non-TC
> controllers, so devicetree will use fallback compatibles and no
> dedicated OF match entries are needed.

If no dedicated OF match entries are needed and fallback compatibles are
used, does this addition to the I2C device ID table serve as a workaround
for a NULL pointer dereference during probe?

Looking at isl68137_probe():

drivers/hwmon/pmbus/isl68137.c:isl68137_probe() {
    ...
    switch (i2c_match_id(raa_dmpvr_id, client)->driver_data) {
    case raa_dmpvr1_2rail:
    ...
}

If a device is probed via a fallback compatible and its exact name isn't
present in the raa_dmpvr_id table, wouldn't i2c_match_id() return NULL
and cause a kernel panic when dereferencing ->driver_data?

> diff --git a/drivers/hwmon/pmbus/isl68137.c b/drivers/hwmon/pmbus/isl6813=
7.c
> index 3e3a887aad050..c8930f2d54237 100644
> --- a/drivers/hwmon/pmbus/isl68137.c
> +++ b/drivers/hwmon/pmbus/isl68137.c
> @@ -498,6 +498,8 @@ static const struct i2c_device_id raa_dmpvr_id[] =3D {
>  	{"raa228228", raa_dmpvr2_2rail_nontc},
>  	{"raa228244", raa_dmpvr2_2rail_nontc},
>  	{"raa228246", raa_dmpvr2_2rail_nontc},
> +	{"raa228942", raa_dmpvr2_2rail_nontc},
> +	{"raa228943", raa_dmpvr2_2rail_nontc},
>  	{"raa229001", raa_dmpvr2_2rail},
>  	{"raa229004", raa_dmpvr2_2rail},

Could isl68137_probe() be updated to use i2c_get_match_data() instead?

This would extract match data directly from the OF fallback node without
panicking, making the raa_dmpvr_id additions unnecessary.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260420131539.9864=
32-72-sashal@kernel.org?part=3D1
