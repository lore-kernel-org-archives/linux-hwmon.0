Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BF57646F495;
	Thu,  8 Oct 2026 08:57:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791449846; cv=none; b=NsU9+sg6V35VvwWODucJS0swdyNYsOmIDYwvKqhv89UaUV0iLjBvYLpQjLRvw0J0CyMG4K9xflDuHXVbs5uY34xeFQottLSCLCDCXHLm5aq3qTNp+RbL0MCfBlZ4uVcTuAgRxl7SAC4PHhbcpUDQ14cD7ns5dD/2P5FZ1DITFI4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791449846; c=relaxed/simple;
	bh=BKrlMme0jf+xfg9dcxI3jtFXvlMvoXxK9EQ85wXi9Ew=;
	h=Message-ID:From:Subject:To:Cc:In-Reply-To:References:Content-Type:
	 Date; b=PztkfW3P+l30Zt+3wbkVTSBnK01TV5F8U1ql8zdl0Jzz/AwHyDU/ntzckh4gJRdlJW90EWRULhPNaRj7ZANkEnCYZWKzOQoRZ7EfDEwThym+1AO6fLRjzF52Lg9hTjykPLbLYuGwIG6ysXa4fbcfGt/hzcY0omiLBfpUfKKnPNA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=RGEmd9/1; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="RGEmd9/1"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3DFE01F000FF;
	Thu,  8 Oct 2026 08:57:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1791449845;
	bh=BKrlMme0jf+xfg9dcxI3jtFXvlMvoXxK9EQ85wXi9Ew=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=RGEmd9/1VJI1jT+RwCgGQIvPdgp7c9QpN/C7iONRCjahz6hNd8eKjUn+OZyzkFuTk
	 QMadakbQ2pYJJBcCeZ/PVJCKSqQcArxH6lYrC94YuVywygZ0o0nl6dbG01q8tGYrkb
	 oul+bQ1vHNqeVToNVSlTaUQf6EhFIOlf6ASWUDXqws4TtuhRRPDPNDBqF/+YdbYXTo
	 dGMri2FHQQaqau+EzqGTCMxS+jcIeZpn895z6PHQpSOdpmMzMtKADRZIpX8Sq8UDCW
	 gH5J/QOWLJnjd1G15gFBMSEDPM28cwLWUezDDj8SMbWvVGN04tDjgz2F15rPYV0ueK
	 JhHIeveo2sB3g==
Message-ID: <sashiko-outbox-163866@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v6 1/2] dt-bindings: hwmon: Add starfive,jhb100-pwm-fan
Reply-To: sashiko-reviews@lists.linux.dev
To: "Changhuang Liang" <changhuang.liang@starfivetech.com>
Cc: linux-hwmon@vger.kernel.org, conor+dt@kernel.org, devicetree@vger.kernel.org, robh@kernel.org
In-Reply-To: <20261008071950.4772-2-changhuang.liang@starfivetech.com>
References: <20261008071950.4772-1-changhuang.liang@starfivetech.com>
 <20261008071950.4772-2-changhuang.liang@starfivetech.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Thu, 08 Oct 2026 08:57:24 +0000
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>

> Add a binding for the StarFive JHB100 PWM fan controller. The controller
> has a hardware tachometer block with 16 tachometer inputs, while fan
> speed is controlled through 8 PWM channels supplied by an external PWM
> controller.
>=20
> One PWM channel can drive up to two fans, so each fan-N child node
> references one PWM channel and lists the tachometer inputs wired to the
> fans it drives.
>=20
> Signed-off-by: Changhuang Liang <changhuang.liang@starfivetech.com>

Sashiko has reviewed this patch and found no issues. It looks great!

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261008071950.4772=
-1-changhuang.liang@starfivetech.com?part=3D1

