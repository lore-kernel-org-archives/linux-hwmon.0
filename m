Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=185.203.200.13
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1794826837;
	b=qq3f5MJgrJMgFAh40FanS6FbiP/rQW/oKqKUG3Iw5H5dLeKM8rKC3u9ywI020p0pUbYR
	 HdXo2Y5vdI9+xlunpJvK8u0Qh8oGRjFltmJ3LHmycc32+cKr1kxr34BBvsFQciVaTVM3R
	 j+VZrivP2hsulhDbTcKRjn/KqJfLl6+MafeprPU+mU/TcBXqzvYdZEeLsKRawg7GxQLON
	 rlM4Y+pH7npGoqY1TsyC5DU01E1AxR5wzB3GYN7+ToZ024uWX3dZiucXzXTefFYGLyfDH
	 pnkWxk29WciBSXPmyJ5zEyVasEidpW9dCJC4IihIeMXMxMWnr4KPfxiIBVB1EPRMIag==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794826837;
	h=DMARC-Filter:Received:DKIM-Signature:Message-ID:Subject:From:To:Cc:
	 Date:In-Reply-To:References:Content-Type:Content-Transfer-Encoding:
	 User-Agent:MIME-Version;
	bh=aJM0dawyH8gXbWmqX0nGo7HUQ8+upl7nxWuHmU22MH8=;
	b=A4z4gfoWnyPcqRofcFbqERUNlsFJGWnxO6T6KP0468A1Q4GC2cigz7GULcrqkpbXfkT0
	 EsSHeztOWHxoAtFF5+QofrJVj6q6fa4jcvM5oduwqGW2auswPsH0NEjQOCVLuaJi1eIZr
	 Ae1J6aXj02dJBwo8juCZEzjlOr7FzxYQNeGc1SYbVLkFl8YWKcV9Cda13SWeZt6BJ8/xS
	 GLTCeV1lG40OTk6f6e+5EeCSc8fgD3IIgmUas2oif4PgLK4ph/p+uzVI0Z5n/LV4zRCJ2
	 GUAfVZ1D6eAtP+Wsq0ff5isKkkMJm2IBkbd5JIFwHMwf9gLVPKoZk5odfbVi1SByt9Q==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=none header.from=pengutronix.de;
	spf=pass smtp.mailfrom=pengutronix.de;
	dkim=pass header.d=pengutronix.de header.i=@pengutronix.de header.a=rsa-sha256 header.s=20260414 header.b="NY9/si+Y";
	arc=pass header.oldest-pass=0 smtp.remote-ip=185.203.200.13
Received: from mx1.white.stw.pengutronix.de (mx1.white.stw.pengutronix.de [185.203.200.13])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8E6D0606A323;
	Mon, 16 Nov 2026 11:00:35 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 8E6D0606A323
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=pengutronix.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=pengutronix.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=pengutronix.de header.i=@pengutronix.de header.a=rsa-sha256 header.s=20260414 header.b=NY9/si+Y
Received: from [IPv6:2a0a:edc0:0:900:1d::4e] (lupine.office.stw.pengutronix.de [IPv6:2a0a:edc0:0:900:1d::4e])
	(Authenticated sender: pza@pengutronix.de)
	by mx1.white.stw.pengutronix.de (Postfix) with ESMTPSA id 64BE82001E8;
	Mon, 16 Nov 2026 12:00:32 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=pengutronix.de;
	s=20260414; t=1794826832;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=aJM0dawyH8gXbWmqX0nGo7HUQ8+upl7nxWuHmU22MH8=;
	b=NY9/si+YW84m+SS5J42fHf5A73xFx/MS++ISlMVs/Lmy84ooe4ApSUZeHakT61dxlJs7mM
	0yoYDEteEAFt29328JOeis8SVgQkzh+tvl9uc8WUxX7JRPVDQ+hQ8VSUTfdCxEH0u87Nex
	otO10oTjG2j5YhzMbQ/MOlCaIfJadzxiAPzPtYPc8n4OKsM4MiJI3ENmUH+VkKLlyXa7gz
	xfmg7hVf8ijp014JSRExXacJX8XnpfGVpGoOZxIRIk8n/08Tidchzt1Xz8R7b1swO1pSlT
	SDxhDAOClBHo2heTAWwennxo3khY3exT9p/VpkL8u75hfG3LOPY64VWuqefBYg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=pengutronix.de;
	s=20260414; t=1794826832;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=aJM0dawyH8gXbWmqX0nGo7HUQ8+upl7nxWuHmU22MH8=;
	b=BpsYkN0qtdfxnjyNg0TugXXbCP0r18Y2MTiFvJQ8bzJ/gw0J2NVBu2X1NoOxGVd8qPgsxj
	ibKMkFfhU29tax2fbPe4PzW/UbjZdYIdEH7cVMDuZ9S+1TBeTLataNXn0sqb4j0w0HoY1P
	VFm0Lf//UPvGoG3CfTIlTPFqhCSr19L2xJqmBUd0181CimoJr/UdPIiBQRYs9tnt5paQAl
	ibiH0jn8aQTt5UCb3oNaYQFm78D8+QAPL/eS+fVpGr+3olICBRsSwabA575BZzWZXJkuBB
	xNNzN6FrpqVZpQgzb8kR1VBWY+4g8m2ZhTB7N1IRntIkmwNIKXfawwWRSt+9Tg==
ARC-Seal: i=1; s=20260414; d=pengutronix.de; t=1794826832; a=rsa-sha256;
	cv=none;
	b=UxgYkZY4wxVdPW+p/h6wNa0wjVq9umd2QZCZv8vk2kdpWbJ7FYICcKYVx7AwmkD8P69tih
	SNzftfgQF1tyKan4mPdS+7KsB3T9Hc4JulJ/aPfaPE1aUlwqeP3SAy5ukgomcdka2Tk9/F
	CuX0/c7S2botvYurBUK39Z4fSI5ZqeG1vKAXeJmMHQviBYapzmYLPMTXkMkufj/+W0f7eg
	2mseE8l66fgG39F+I4MKtczsIGCBCpWrWJTfWImzJ2PiOdk08nwsvk0sgFNsBXUw4qPmJ+
	ajxmmQSpVq/eu8dSve8qDT0kIes//7CEPOGlMcfL0S/+Wb3feydjz5ccsLiLlg==
ARC-Authentication-Results: i=1;
	ORIGINATING;
	auth=pass smtp.auth=pza@pengutronix.de smtp.mailfrom=p.zabel@pengutronix.de
Message-ID: <1b6620f4c2cbed3124e5521f18585132d2e8dca2.camel@pengutronix.de>
Subject: Re: [PATCH] hwmon: (aspeed-g6-pwm-tach) Use
 devm_reset_control_get_exclusive_deasserted() in aspeed_pwm_tach_probe()
From: Philipp Zabel <p.zabel@pengutronix.de>
To: Markus Elfring <Markus.Elfring@web.de>, linux-aspeed@lists.ozlabs.org, 
	linux-hwmon@vger.kernel.org, linux-arm-kernel@lists.infradead.org, Andrew
 Jeffery <andrew@codeconstruct.com.au>, Billy Tsai
 <billy_tsai@aspeedtech.com>,  =?ISO-8859-1?Q?G=FCnter_R=F6ck?=	
 <linux@roeck-us.net>, Joel Stanley <joel@jms.id.au>, Ryan Chen	
 <ryan_chen@aspeedtech.com>, Tan Siewert <tan.siewert@9elements.com>
Cc: LKML <linux-kernel@vger.kernel.org>, kernel-janitors@vger.kernel.org, 
 Felix Gu <ustc.gu@gmail.com>
Date: Mon, 16 Nov 2026 12:00:32 +0100
In-Reply-To: <bbbc7228-cf98-437d-b240-ad29ee7fb4ac@web.de>
References: <bbbc7228-cf98-437d-b240-ad29ee7fb4ac@web.de>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.56.2-0+deb13u1 
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Post: <mailto:linux-hwmon@vger.kernel.org>
List-Help: <mailto:linux-hwmon+help@vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-hwmon+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0

On Sa, 2026-11-14 at 17:28 +0100, Markus Elfring wrote:
> From: Markus Elfring <elfring@users.sourceforge.net>
> Date: Sat, 14 Nov 2026 17:11:34 +0100
>=20
> Use devm_reset_control_get_exclusive_deasserted() to replace the
> explicit reset acquisition, deassertion, and cleanup action registered
> with devm_add_action_or_reset().
> Simplify reset handling and remove the custom reset assertion callback
> while preserving reset assertion during cleanup.
>=20
> The source code was transformed by using the Coccinelle software.
>=20
> Signed-off-by: Markus Elfring <elfring@users.sourceforge.net>

It looks like the reset_control doesn't have to be stored in
aspeed_pwm_tach_data, it could be a local variable. That is a
preexisting issue though.

Reviewed-by: Philipp Zabel <p.zabel@pengutronix.de>

regards
Philipp
