Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 81A71373BEE
	for <linux-hwmon@vger.kernel.org>; Thu, 16 Apr 2026 11:44:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776339875; cv=none; b=kWeLLAH0VoEUUEdTcUKHyFMu+4jv5k0dF3rsFI5myVnAnZIxyX1bH2jti2S7lzAJdtGe6A04sLHs3zAAkFZZGtdHVDJNp2wamLNOefnmYe0XVzVMX2oELCjAq/4X1J3Pic7O4HJZX3PO8P9eDM1Y1adPXdrVzQsNISKeGCTOr7c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776339875; c=relaxed/simple;
	bh=s1wef89LZ7VeOQQ48Olol8Cg0u51MYLN96bTiuhIhbg=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=MSuhFLVC9Z2DZI/0gaVkmO0FHx1wB9DxIlXA1AQ4OK/F62jczl3YOFCGMz24fUDlsrnjfZVro2LQT6iqxtZPlxZUZvfvFanEJ9PBctYD8iCSesxQYQCiw7yiu/ZoOf8D/Z9w/h0wkD5Eti5y3deGVMSJVWTH9DcdiEdLMyOSGZk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=p4aMYe3o; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="p4aMYe3o"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 061DFC2BCB3;
	Thu, 16 Apr 2026 11:44:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1776339875;
	bh=s1wef89LZ7VeOQQ48Olol8Cg0u51MYLN96bTiuhIhbg=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date:From;
	b=p4aMYe3oWccbL22sCFnmnl+ELJoHEQHZE4ycggbwhYvLGuwgNUqBBwG9Ovb2Xmm26
	 0IkbdFZkSSW3Skck0xE1cqr1ojWS4d748tVPnM2V+Uu6zWyQP74BpCTfXTIeMYTztr
	 pmNCIpRvywtC0Mq8ATHzS0udGoKRKEKZ/RA2iQ+vmX/E9S+jojeKFFQ/QBg4dZZSa4
	 +TffR+GuA6WGaibfrI/ER+5bKa4CbtvPDV8a7Oj77K+55Vel1KupbSGQVw/pOvJ+jM
	 waDePZ8gNkGDeiC9g/xmZPMfMNeS3iIsBLu5VuAwh6/OX6VUFF1a/hoxL0dA5c0Vel
	 IApr6QaXMAwRA==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH 2/2] hwmon: (lm63) Add locking to avoid TOCTOU
Reply-To: sashiko@lists.linux.dev
To: "Gui-Dong Han" <hanguidong02@gmail.com>
Cc: linux-hwmon@vger.kernel.org
In-Reply-To: <20260416090752.97392-2-hanguidong02@gmail.com>
References: <20260416090752.97392-2-hanguidong02@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Thu, 16 Apr 2026 11:44:34 +0000
Message-Id: <20260416114435.061DFC2BCB3@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>

Sashiko AI review found 3 potential issue(s):
- [High] Pre-existing Torn Read Race Condition in show_fan() causes massive=
 fan speed spikes
- [High] Pre-existing Uninitialized Cache Read in temp2_crit_hyst_store() c=
orrupts hardware thermal limits
- [Medium] Incomplete Fix: Unaddressed TOCTOU Races in temp2_crit_hyst_show=
() and show_lut_temp_hyst()
--

commit 1233dd514546736dfbbf09561bf360360c5933ca
Author: Gui-Dong Han <hanguidong02@gmail.com>

hwmon: (lm63) Add locking to avoid TOCTOU

This commit adds locking to show_pwm1() and show_temp11() to prevent
TOCTOU races when reading multiple cached values. It also states that
other functions in the driver were checked for similar issues.

Link: https://lore.kernel.org/linux-hwmon/CALbr=3DLYJ_ehtp53HXEVkSpYoub+XYS=
TU8Rg=3Do1xxMJ8=3D5z8B-g@mail.gmail.com/

> Check the other functions in the driver as well. Keep them unchanged
> because they either do not access shared cached values multiple times
> or already do so under lock.

Is this description accurate?

Looking at temp2_crit_hyst_show(), it calculates its value by reading
both data->temp8[2] and data->temp2_crit_hyst. Similarly,
show_lut_temp_hyst() reads data->temp8[attr->index] and
data->lut_temp_hyst. Because neither function holds data->update_lock,
can a concurrent cache update cause them to fetch a mixed snapshot (e.g., a
newly updated base temperature but a stale hysteresis offset), resulting in
corrupted absolute hysteresis values returned to userspace?

Also, looking at show_fan(), it accesses data->fan[attr->index] without
holding data->update_lock. In lm63_update_device(), data->fan[0] is
populated via two separate non-atomic assignments. Can show_fan() read the
intermediate torn state where the MSB is still 0, causing the calculation
(5400000 / reg) to report massive, incorrect fan speed spikes?

Finally, in temp2_crit_hyst_store(), data is retrieved via
dev_get_drvdata(dev) without calling lm63_update_device() to populate the
cache. If a user writes to the sysfs node before any sensor read operation
has occurred, data->temp8[2] will be 0. Does this cause the driver to
calculate the relative hysteresis based on a critical temperature of 0
degrees instead of the real thermal limit, corrupting the chip's thermal
protection configuration when written to the hardware register?

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260416090752.9739=
2-1-hanguidong02@gmail.com?part=3D2
