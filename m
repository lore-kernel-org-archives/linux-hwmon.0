Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4F8E3395AF8
	for <linux-hwmon@vger.kernel.org>; Wed, 14 Oct 2026 18:38:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792003141; cv=none; b=pVmx9Tealx/acvuyW45rrCaNZf3m/4o43VI2Rx+SPVL1ajBAPaimVrr7PhCIh3BMp2XC2QYNvDbZNL9CcLXW7JabD44TNHb1JjXZ9s9qjsVvrzQp6jyekcBOvrCdHw06XwBZAIWcSbcha3mbZtWuE18jr8zoySfwd7fQnpfHAU4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792003141; c=relaxed/simple;
	bh=vHpmxwzwW16BrAhM+qLo/nXs6eMpYlgtuF4vz/rIXiE=;
	h=Message-ID:From:Subject:To:Cc:In-Reply-To:References:Content-Type:
	 Date; b=UdwmxNmC09SFzZrliN+wRqls2lNSgC2ekA6/26gRbNQSG+GXQkP4QAFzC0KTdTwxGM/DfS3W3vxusAlvVh/4w4o02vgf3xnirwXbfXpkxFgeQgCfTY2Yx3OpOPYBOvtGaAHCMupi0KzCRTdVpCnqDbIaxwdgonf4hZTrDp2uLvs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=bZWFSgmU; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="bZWFSgmU"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B784F1F000C4;
	Wed, 14 Oct 2026 18:38:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1792003139;
	bh=vHpmxwzwW16BrAhM+qLo/nXs6eMpYlgtuF4vz/rIXiE=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=bZWFSgmUakxlb0X5Nenobj1z4EVbQrgeC8hpWu2jC/FgOr51ZmWWTMW/y3IikSSEQ
	 Sy2kZfPpEg3WlwL8mHVRKVmd8Yu88S6rYMkqgjjjFuNEiUVGRsC+Z/olUtLWQz6p7E
	 ZxIdh7oTA1UH5jpPgJkw+E0x6mECJG8yTI9A1aKV08ax6HrRjxdy/Ot1w/mFtzwQ0w
	 r4mLNOISzmaPI8guj/rSUASBzYWhoW212PmNdkAr/UdDKyU0zprs/5xBC4YZuoh4S1
	 KIyWkFv5MYAV64Mx+4Nyi/x+bTEa4+Z01xPqgWQIbyvlIgddfgM6r0jVxYQ7OKBNUz
	 V4Uq31BFBAaQA==
Message-ID: <sashiko-outbox-171717@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v3 09/11] hwmon: chipcap2: do not discard pending alarms
 on disable
Reply-To: sashiko-reviews@lists.linux.dev
To: "Javier Carrasco" <javier.carrasco.cruz@gmail.com>
Cc: linux-hwmon@vger.kernel.org
In-Reply-To: <20261014-chipcap2_locks-v3-9-27ebfc2c5b9e@gmail.com>
References: <20261014-chipcap2_locks-v3-0-27ebfc2c5b9e@gmail.com>
 <20261014-chipcap2_locks-v3-9-27ebfc2c5b9e@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Wed, 14 Oct 2026 18:38:59 +0000
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>

> cc2_disable() stops processing interrupts before the device is powered
> down to ignore the alarms caused by voltage toggling. The handler of an
> alarm raised by the last measurement might not have run at that point,
> and the alarm is discarded when it finally does.
>=20
> The sysfs read that triggered the measurement can then report no alarm
> although the device raised one.
>=20
> Wait for the alarm handlers that have already been raised before the
> interrupt processing is stopped. This covers the case where the handler
> thread has not been scheduled yet; an alarm that has not reached the
> interrupt core at that point is discarded.
>=20
> Fixes: 3af350929e75 ("hwmon: Add support for Amphenol ChipCap 2")
> Cc: stable@vger.kernel.org
> Signed-off-by: Javier Carrasco <javier.carrasco.cruz@gmail.com>

Sashiko has reviewed this patch and found no issues. It looks great!

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261014-chipcap2_l=
ocks-v3-0-27ebfc2c5b9e@gmail.com?part=3D9

