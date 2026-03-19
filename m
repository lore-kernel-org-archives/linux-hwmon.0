Received: from cross.elm.relay.mailchannels.net (cross.elm.relay.mailchannels.net [23.83.212.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 558E33793A8
	for <linux-hwmon@vger.kernel.org>; Thu, 19 Mar 2026 09:50:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=23.83.212.46
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773913863; cv=pass; b=ox1M2a+eIsq53KBJgWXweJbXwSqGIRUQulIuUWA+I+rDpYUI3lV6QUH8KLymdrFOGKr3Z67JvnkD/i6tByjA/FnnS+EIZPVrV415G2m4xN/tx+kbiucWHWHZVHwwkJvNkXZw8OwjUDu93nTALF7rgyECQN8Q2LlHxflGtwGUNjc=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773913863; c=relaxed/simple;
	bh=btpBgchiILvxjBUu+Kq2ZBAN5HrQRF1Xk5Ja1p1V8R4=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=luf6OS5gt/lPOGUj+dY2/o3HLYlPTBXsNNL3Zid6qBzr0KGzL9W0Zxq6m0kSQy4ln39DscbisqYH2x09PxoYFhELrPiMm8KAdKhh06LZAs5McBGeGBeq0JHgo7xxmdkzCY60x+AbjBg0dhHBgaLsCYn7Y0d5HbQYxSUfNd7Xk/Q=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=guyboldon.com; spf=fail smtp.mailfrom=guyboldon.com; dkim=pass (2048-bit key) header.d=guyboldon.com header.i=@guyboldon.com header.b=dYdArXV0; arc=pass smtp.client-ip=23.83.212.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=guyboldon.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=guyboldon.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=guyboldon.com header.i=@guyboldon.com header.b="dYdArXV0"
X-Sender-Id: a2hosting|x-authuser|gb@guyboldon.com
Received: from relay.mailchannels.net (localhost [127.0.0.1])
	by relay.mailchannels.net (Postfix) with ESMTP id 2DC4F762720
	for <linux-hwmon@vger.kernel.org>; Thu, 19 Mar 2026 09:50:58 +0000 (UTC)
Received: from nl1-sr2.supercp.com (100-114-25-135.trex-nlb.outbound.svc.cluster.local [100.114.25.135])
	(Authenticated sender: a2hosting)
	by relay.mailchannels.net (Postfix) with ESMTPA id 2CFA5762810
	for <linux-hwmon@vger.kernel.org>; Thu, 19 Mar 2026 09:50:57 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; d=mailchannels.net; s=arc-2022; cv=none;
	t=1773913857;
	b=5zzLjHa0KUwohCj1clMOuqRLVYUsT3KcnrdVQPqlWPJYkKELUE2m9lJ3Ueg5AtFFuRkdZt
	y5r2DPCoKzO9Na4S1rpR5TMLVFwLoFnO1IwLNVOYjzWo3sSq+KJeNmxpQKx0wVaQE/Lm0l
	824QQUqykD22t76sXjUn/IVc+rVZv156UO5J+XcCkqZ01v4SZ752/2G2NsRhKNpf2yoR/9
	Lv2IwSBkrkQrSb58m2iwHzbXoI5u2i93jJxmWaNCP1nTXSs28q9ZSkAVCag+o4rdsoXHIi
	R/Vwc60q05Ko5ziN1dACd9D1EdcAxoB6Rs4ObhFmGHmbwG7uuX3G5/InHDSL+w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mailchannels.net;
	s=arc-2022; t=1773913857;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:dkim-signature;
	bh=btpBgchiILvxjBUu+Kq2ZBAN5HrQRF1Xk5Ja1p1V8R4=;
	b=4+Fvef/C3Lkb/IALn/xPxE92wNiEqL71xd9bEfyGeGrRo4hoCQkHZEu5Qx9+XoYa8j+pII
	7htK4zN2hn6bmWHwxtmTTsmSNYufFF9eSN8fhOdaYiNWkdzkq3IrGlBHn0MNBGNWycReoV
	Sj1MTPATr99EjWTbyQGdfQ7Y/BIREiaTwPFXl5EP6t+4bfiEioLlKTm4tX2kn+HMQymKcL
	ZVG1yAwy7uAZO2MS998IaNEcYxp7hivbLDZd6y8oy/CerZgz++CWa7PxrwP6z5qqyfYRkm
	krbSF+iZ+uvek/5Niso4+YQbhIckFvP6/n5Mgpl0e9sMALHJcAZYvh5JXAvnxg==
ARC-Authentication-Results: i=1;
	rspamd-7f98bb5847-b9j5n;
	auth=pass smtp.auth=a2hosting smtp.mailfrom=gb@guyboldon.com
X-Sender-Id: a2hosting|x-authuser|gb@guyboldon.com
X-MC-Relay: Neutral
X-MailChannels-SenderId: a2hosting|x-authuser|gb@guyboldon.com
X-MailChannels-Auth-Id: a2hosting
X-Invention-Wiry: 660261802084f9a0_1773913858082_1509734687
X-MC-Loop-Signature: 1773913858082:471687623
X-MC-Ingress-Time: 1773913858082
Received: from nl1-sr2.supercp.com (nl1-sr2.supercp.com [68.66.248.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384)
	by 100.114.25.135 (trex/7.1.3);
	Thu, 19 Mar 2026 09:50:57 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=guyboldon.com; s=default; h=Content-Transfer-Encoding:MIME-Version:
	References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:
	Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:
	List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=btpBgchiILvxjBUu+Kq2ZBAN5HrQRF1Xk5Ja1p1V8R4=; b=dYdArXV0MPcDVSYWDDkhMsy0Wu
	ERkxW0/vET/Zaae5Ahw/9jd7m6yiLqxNP0XIJd89Yzb3C9oXaDjHdjh/8t4fTyKYHVYxR7jixvMBB
	7W+5WkujmzT0JDni6T9iQv99Yzj6WuSCm9Z0qVkN9NLseunscczAkqFvxIDnW5AeT57H4xw4Tref8
	To8bl8KJnEQXIg9dLc0DbSvc7vPzYEmR/WHz8+UcozEVBZ6X0lLJ3Kvpay9XnCL66+7jfsSdKMQmZ
	fI3GvGes/sPlVmD0BA64HbNh9wAwYdClGNAoNTKcNUj+t/HG5y2b8FaIGOystJSNhRlYXbCa3CZ04
	diXXwt1A==;
Received: from mailnull by nl1-sr2.supercp.com with spam-scanner (Exim 4.99.1)
	(envelope-from <gb@guyboldon.com>)
	id 1w3A1m-000000001Zv-3OJY
	for linux-hwmon@vger.kernel.org;
	Thu, 19 Mar 2026 10:50:54 +0100
X-ImunifyEmail-Filter-Action: no action
X-ImunifyEmail-Filter-Info: UkNWRF9UTFNfQUxMIEJBWUVTX0hBTSBBU04gSUVfVkxfQUdFX0FDQ09
 	VTlRfMlcgSUVfVkxfQUdFX0RPTUFJTl8yVyBJRV9WTF9BR0VfRU1BSU
 	xfMlcgUl9NSVNTSU5HX0NIQVJTRVQgRlJPTV9IQVNfRE4gVE9fRE5fT
 	k9ORSBNSURfQ09OVEFJTlNfRlJPTSBWRVJJTE9DS19DQiBGUk9NX0VR
 	X0VOVkZST00gTUlNRV9VTktOT1dOIFJDVkRfQ09VTlRfT05FIFRPX01
 	BVENIX0VOVlJDUFRfU09NRSBNSU1FX1RSQUNFIF9EUlVHU19NTV9NQU
 	xFIEFSQ19OQSBSQ1ZEX1ZJQV9TTVRQX0FVVEggUkNQVF9DT1VOVF9GS
 	VZF
X-ImunifyEmail-Filter-Score: 2.40
X-ImunifyEmail-Filter-Version: 3.8.21/202603171242
Received: from [88.134.72.191] (port=47494 helo=Gedora.lan)
	by nl1-sr2.supercp.com with esmtpsa  (TLS1.2) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.99.1)
	(envelope-from <gb@guyboldon.com>)
	id 1w3A1l-000000001Ru-1UAu;
	Thu, 19 Mar 2026 10:50:54 +0100
From: Guy Boldon <gb@guyboldon.com>
To: linux-hwmon@vger.kernel.org
Cc: gb@guyboldon.com,
	W_Armin@gmx.de,
	linux@roeck-us.net,
	jan.claussen10@web.de
Subject: Re: Weird Dell SMM bug since 6.18
Date: Thu, 19 Mar 2026 10:49:41 +0100
Message-ID: <20260319094944.239871-1-gb@guyboldon.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <fd277150-af4b-4bd5-af7e-868c9678eb1e@gmx.de>
References: <b476fdf2-1ce6-46ca-8c98-13e0ae1613b3@web.de> <97b6c751-0115-4d00-b212-352f37e5914d@roeck-us.net> <DH1W16PFES8U.3MBLJIJPV48JQ@web.de> <f9bcdb69-6ad7-409a-afc3-bb5f277ef0ba@gmx.de> <02d1330f-1439-4291-bbb2-289122eedd7c@roeck-us.net> <DH4H9QQI4OQ9.30PQ935ZJERT0@web.de> <62d86acf-6a3f-4bb2-9d81-cf47bd1461e9@roeck-us.net> <fd277150-af4b-4bd5-af7e-868c9678eb1e@gmx.de>
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-AuthUser: gb@guyboldon.com

From: gb@guyboldon.com

Hi, I'm the CoolerControl maintainer, a few notes from the userspace side.

On Mon, Mar 16, 2026 at 17:55:01 -0700, Guenter Roeck wrote:
> Not really. -ENODATA seems to be the correct response if the current pwm
> value is not readable. Returning 0 or any other number would be misleading
> and trigger other problems (such as some userspace code believing that it
> can write the value back with no impact, which would be worse).

For context: thinkpad_acpi has long returned 255 as a dummy value for pwmX
when in auto mode (pwmX_enable=2), since it similarly cannot retrieve the
real PWM value during BIOS control. This was likely motivated by fancontrol
compatibility, which AFAIR requires a readable pwmX. CoolerControl reads pwmX to
confirm a channel is functional and to track data values over time, hence why we
need it readable. We can however adapt our handling for -ENODATA.

On the write concern: several drivers I'm familiar with (e.g. nct67xx, it87,
thinkpad_acpi) do not implicitly switch to manual mode on a pwmX write.
Writing pwmX having no effect when pwmX_enable != 1 is expected, normal
behavior from our perspective.

On Tue, Mar 17, 2026 at 02:29:39 +0100, Armin Wolf wrote:
> I suspect that the successful reads happen after the pwmX attribute has
> been set manually using "cat". The driver will enter manual fan control
> mode automatically in such a case to keep compatibility with legacy
> userspace applications.

That makes sense. Might be worth noting in the docs either way.

As a related point: gpd_fan returns -EOPNOTSUPP rather than -ENODATA
when in auto mode, and documents that behavior in the kernel docs. The
inconsistency between drivers, different errors for the same condition,
means userspace ends up needing per-driver handling for the same use case.
Not ideal, but at least documentation helps.

Thanks,
Guy

