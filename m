Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794593432;
	b=mSbJ070KJhICM4iY6dZHaka/dGhF2LPtzBxrYkSq5H/rEu8QqDdHShpOHcq3RaixWYWn
	 OMxl4jwFD0rVWvilZ4mH1Hjd4D9270O04Foo9J3GRV+eqzBb9R75bZg/oTcuRdE3ALUhk
	 5c4QVpOdoWhTPub/qY3Fn+OCs/ubKWo/gpXwSebml4ijo9r6CeIDeIplqATEuU/R3iEFv
	 8vDNIA5rMo9HnLGjReADD6okl6HsCPJog0CqJglH/taXP3d6lpys9eIGwQekTNcUz2Vc+
	 JkGm+ouEGRKHReMJEo7D1QKdedEoanNV2R5/VvO99XgRs36V1c0JrAc0j6oUHMBtRFA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794593432;
	h=Received:DKIM-Signature:Message-ID:From:Subject:Reply-To:To:Cc:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date;
	bh=F0Bmywe5CKy9Gah8SqQU0g3fjG0UPvtuC7YpNHGWSLQ=;
	b=zD3U20Y8JQbtAcuYhS7DHZMsudjQtktVor/aIRPuP3mtj9iSf7QwnTW1MF5+wSy9TYk7
	 JyOwNen/saUSn5fOjnzB2FN7HRXs5hdJI39iCRZJiL44dtHrcgjgnseNC4C5dIhnEXNah
	 52KRcvGwW0UTkawTd5p6X1c8PtP8eV9yNfrOOMZVBfoxHty7NQ3XCRmXS97cVRdxMeTS4
	 pmiXOPB0DSHKVDnGjsvDKbR9VlWv1XbDC2lJJXz5haxArr/MCYb9TPhXf3W7UerafZGIS
	 Y4q9yBoJ9ASElrk+TF8cvIj8vW7Jx4gpY6PyYLmjZj9N9j+/jVrmJe/IF13OmnQ8I1w==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=Ked5BgAe;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 68D80606A327
	for <linux-hwmon@vger.kernel.org>; Fri, 13 Nov 2026 18:10:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=Ked5BgAe
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DAD981F000C4;
	Fri, 13 Nov 2026 18:10:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794593432;
	bh=F0Bmywe5CKy9Gah8SqQU0g3fjG0UPvtuC7YpNHGWSLQ=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=Ked5BgAep75MMT4l+BzQFKfq4jrN9JPLcjGNWhzkibYONMiR6brTe9qci9xzzehoO
	 EyxD+xg9SCnvez0FQspeKnZSGnONhV+ZWt1+6HWBDl2ES2WCDEGxex17Ge1YZTJhgw
	 eos4xyO2J4Vode8bFwnvzxjWnxtv9jvUpgZEvrFNcA0KmBPLRhOalCFsfE5P2n3/9Y
	 PCXDSGo9Fa8+gJhXeZs6O8GKzJtoA+dT7kR/XdJIYgcraKtZqNdJ4LgA3iceRHNtwS
	 1DoYyI0kGI1sg7l/T65jn4+A5tjY2RXYiO3jsm07hFPDGeOTG/FYPloEmMmWiSK9mq
	 01EMaUevfW2Lg==
Message-ID: <sashiko-outbox-213393@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH RFC 2/2] platform/x86: Add Emdoor Intel EWMI platform
 driver
Reply-To: sashiko-reviews@lists.linux.dev
To: "Ziqiang Xia" <xiazq123666@gmail.com>
Cc: linux-hwmon@vger.kernel.org
In-Reply-To: <20261113-emdoor-intel-wmi-rfc-v1-2-d77ecf23693b@gmail.com>
References: <20261113-emdoor-intel-wmi-rfc-v1-0-d77ecf23693b@gmail.com>
 <20261113-emdoor-intel-wmi-rfc-v1-2-d77ecf23693b@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Fri, 13 Nov 2026 18:10:31 +0000
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Post: <mailto:linux-hwmon@vger.kernel.org>
List-Help: <mailto:linux-hwmon+help@vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-hwmon+owner@vger.kernel.org>
Precedence: list

> From: Ziqiang Xia <xiazq123666@gmail.com>
>=20
> Add support for the Emdoor Intel EWMI (\_SB.EWMI) WMI interface on
> MECHREVO Wujie 14 2026 (WUJIE Series-Lark4-LNL, BIOS EM_LNL326_V1.0.19),
> exposing hwmon fan and EC temperature sensors, platform_profile
> (balanced/performance), Fn/Win lock and touchpad state attributes,
> WMI hotkey sparse keymap events, and AC auto-power-on control.
>=20
> Signed-off-by: Ziqiang Xia <xiazq123666@gmail.com>

Sashiko has reviewed this patch and found no issues.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261113-emdoor-int=
el-wmi-rfc-v1-0-d77ecf23693b@gmail.com?part=3D2

