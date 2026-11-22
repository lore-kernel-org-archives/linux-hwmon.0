Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795310862;
	b=IU/TgIkLFhDDOQcRtUsVb7SpqDHcDRdXD0JXx5qiHEqMGMz5a0boqnaqLBisHdZl6utT
	 LIdvc+fA9ZmdrOnGXLCUOkYzgB/lQjp24wvsngNZBCyUTO8y4CXbJiHrjljWJixaDjmnv
	 uBNsv4UKW173+ruWFdkobr+Nllha8T5z8m4Eu2ldj1yNUeU5tX+Q0QHQx0yYqw2IXXAWO
	 RUfnPehkRb7J/Bu9wT9AVE0e9lv7jhmK5k3127jFBmzPjmfxWUKb0ilTLyPxm7ft5saPb
	 omLpS0pMg+yVD8KHHIqVgYN3ZnxfBq5TQjuA4ephnnBn2hFV2hCLyU7W1b6fnqeGQ9g==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795310862;
	h=Received:DKIM-Signature:Message-ID:From:Subject:Reply-To:To:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date;
	bh=+yuAQ/uBbk/BS5MfyA3WpPYGlOjTa0jY7K2EMw/RKXY=;
	b=QFe3pQFqfVA9zXVQp9Z+l2QWbS+dplOi6GYK3PP0bm60aaAEU22kdBw3ZMa6196HfO1w
	 CCI77bRkgDPMhOolV2og9xe6YlNGA0NL4YqQvUnp3PFFxjJ+3Js9WrHkK7R1ebW9p7f5A
	 0d837fiJfg/fAZ62c4kC3ZxEa47jVVHL8AiK9AXaeXXkW5ko0Lg2vWeJ3Hzx6m/PiVxgL
	 f4v3Ip9B/zVwqVvKL1ps28vA+IMvVXf3joEK3KPnWngIfr1PiUgQ6a19nSkVqbBoM6hyk
	 DmdPKIWtZkJo+b7RqeCxYJDUM169/yUWCX+FVSZbLOkvmuLiAMRkRLklCaKGvC26W8A==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=ZmZ2vLPT;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E4592606A32A
	for <linux-hwmon@vger.kernel.org>; Sun, 22 Nov 2026 01:27:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=ZmZ2vLPT
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 59BCF1F000C6;
	Sun, 22 Nov 2026 01:27:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795310861;
	bh=+yuAQ/uBbk/BS5MfyA3WpPYGlOjTa0jY7K2EMw/RKXY=;
	h=From:Subject:Reply-To:To:In-Reply-To:References:Date;
	b=ZmZ2vLPTcKajMJoJEiXSmfwknVASm8fcW536It6XSE73KduoojKHSUGvZYxKqd3+n
	 g920nJrCXXCXsdiB2N8WbAxMUhIrJ+2pxx9mqSuo6OlJigpZgbmz3JWRzvfZ3tdBCQ
	 3oR7279p4Ul7LfOvQ0HeCYQYY6B/RqlKtT2ckaB8jAxr3eQqtM9mqmvJLisVxHpKo8
	 7bj6ppb3vTkp1I84CGttlrZi5TTJrwKNlkJxFoqBWdLmgAQId8zZ1+aEmkwFIyz3k5
	 x3QFOMHa0/ShU/zMrXEVec2+ZE/HH2oALgL2UI/UqOzF/5WFFBFmpIgNLrPkvHXLYL
	 WVfi01Q6BASPw==
Message-ID: <sashiko-outbox-227610@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH] hwmon: (aquacomputer_d5next) Fix collection check for
 Aquaero devices
Reply-To: sashiko-reviews@lists.linux.dev
To: "Guenter Roeck" <linux@roeck-us.net>, "Hardware Monitoring" <linux-hwmon@vger.kernel.org>
In-Reply-To: <20261122012528.881538-1-linux@roeck-us.net>
References: <20261122012528.881538-1-linux@roeck-us.net>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Sun, 22 Nov 2026 01:27:40 +0000
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Post: <mailto:linux-hwmon@vger.kernel.org>
List-Help: <mailto:linux-hwmon+help@vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-hwmon+owner@vger.kernel.org>
Precedence: list

> Commit b7743c6dbe3a ("hwmon: (aquacomputer_d5next) Check maxcollection
> when probing AQUAERO devices") added a check rejecting devices with
> hdev->maxcollection < 2 before inspecting hdev->collection[1].type in
> aqc_probe().
>=20
> Aquacomputer Aquaero 5 (0c70:f001) exposes three HID interfaces under
> the same product ID: "keyboard/mouse" (3 collections, with
> collection[1].type =3D=3D 1), "System Control" (2 collections, with
> collection[1].type =3D=3D 1), and "aquaero Device", which is the sensor
> interface the driver binds to and only presents a single vendor-defined
> top-level collection (maxcollection =3D=3D 1).
>=20
> Prior to that commit, probing "aquaero Device" worked because the HID
> core allocates HID_DEFAULT_NUM_COLLECTIONS (16) zero-filled entries for
> hdev->collection, so hdev->collection[1].type read as 0. Rejecting
> [ ... ]
> Fixes: b7743c6dbe3a ("hwmon: (aquacomputer_d5next) Check maxcollection wh=
en probing AQUAERO devices")
> Reported-by: Nandor Lieszkovszky <spoon3r73@googlemail.com>
> Link: https://lore.kernel.org/linux-hwmon/3b6ce200-ae89-4629-a05b-bcdc503=
871d3@gmail.com/
> Suggested-by: Nandor Lieszkovszky <spoon3r73@googlemail.com>
> Signed-off-by: Guenter Roeck <linux@roeck-us.net>

Sashiko has reviewed this patch and found no issues.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261122012528.8815=
38-1-linux@roeck-us.net?part=3D1
