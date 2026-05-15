Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5BB133DA7CF;
	Fri, 15 May 2026 17:43:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778866990; cv=none; b=d73TD/SOUdv4zM28BnfXSbzvsv88QhCegHYwddIN67xYDBBeaP3d7MPQ9FrpjvBNO1fsySa8NX4plsVkJKQiKmUxjTiOMfsK+mHI517fNO9xH0c2dNxRLJi6zh3UDYl/aJPl6G53SpeSXMChOAGqyGGXFNRa723X+4Ja6Ln2A08=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778866990; c=relaxed/simple;
	bh=edM7CSJlHKP7ooFa7YXL8HIbbu7a3p9orIejHN6LJAA=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=crrU98ifXm2QMwYRaUnVp6u1qR21lmeiadTIls5LHT+fd4/icsn0Ya3qaZ2IcCqGeFy5GctItSTvUO3dRc5WuSlA8GAIhia1IsNXIO5af7W87jqItvFJKqZWtC56LSJr7HutcFnll8Whd2K6opRfpv0AwA2+r+yazttRnoYew8Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Sdjrj7Us; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Sdjrj7Us"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B55B4C2BCB0;
	Fri, 15 May 2026 17:43:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1778866990;
	bh=edM7CSJlHKP7ooFa7YXL8HIbbu7a3p9orIejHN6LJAA=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date:From;
	b=Sdjrj7Us7MTR0InMh3wa+HE1r52KqZu0878k8/ixJPULxHUJ4HRL7uEDlmOx7sIkI
	 yYKm9V3j6vXHI9zt++k2VGfcqNnetfron3U+1FPRkdD9x1N/QjXyGqwSRCGCzT+b+6
	 5ZbKGviIEo5QSqRPRIjIt7TvQx+D0q3B1O/3tADQP+48vBowrjZHuo+A0Deu6+9nY7
	 TwmzINUii7vWUTQtkvTK75nvs/I3Pls8+7zMrRVYEZRZCqaHX+0D4CjhaOpIYlIU23
	 IomDKwcAdKknHIroYO51T8rZwiagBrKPnyVClKWq9J8kiCUa9HEoWlvTzZAPsMs6Ai
	 GyS9grqS2k0Gw==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v12 3/6] pinctrl: core: Make pin group callbacks
 optional for pin-only drivers
Reply-To: sashiko-reviews@lists.linux.dev
To: "Oleksij Rempel" <o.rempel@pengutronix.de>
Cc: krzk+dt@kernel.org, robh@kernel.org, linux-hwmon@vger.kernel.org, conor+dt@kernel.org, devicetree@vger.kernel.org
In-Reply-To: <20260515160537.115808-4-o.rempel@pengutronix.de>
References: <20260515160537.115808-4-o.rempel@pengutronix.de>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Fri, 15 May 2026 17:43:09 +0000
Message-Id: <20260515174309.B55B4C2BCB0@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>

> Currently, the pinctrl core strictly requires all drivers to implement
> .get_groups_count and .get_group_name callbacks in their pinctrl_ops.
>=20
> However, for simple pinctrl drivers that act purely as GPIO controllers
> and pin-specific configuration proxies, without any concept of muxing or
> pin groups, this strict requirement forces the implementation of dummy
> callbacks just to satisfy pinctrl_check_ops().
>=20
> Relax this requirement for pin-only drivers by making the group callbacks
> optional when no muxing or group pin configuration support is provided.
> Update the core and debugfs helpers to check for the existence of these
> callbacks before invoking them.
>=20
> Drivers that provide muxing or group pin configuration operations still
> must implement group enumeration and naming callbacks, and are rejected
> at registration time if they do not.
>=20
> Suggested-by: Linus Walleij <linusw@kernel.org>
> Signed-off-by: Oleksij Rempel <o.rempel@pengutronix.de>

Reviewed-by: Sashiko <sashiko-bot@kernel.org>

