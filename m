Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 48B0437BE6C;
	Tue,  9 Jun 2026 07:29:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780990158; cv=none; b=b10eqa7ZH8DYR6HyLyDbqP8Cynnl/A+iDHel0y7jUy77fe20tsA8nzS3foiyY4ZVXE13Yw144zWb9eyuGc+2kA+CRPvSBE65oyMoIioFVNsyY/mEC/xdvKld/wThxcUQOtXjGZwD6i91lA6dKxQ6MNi/kkIdTPbrGwswiNSnM+M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780990158; c=relaxed/simple;
	bh=xJNeymZSqfhYwhe8PQ6QvLRPb7IktUZX0Tsmq3QDNoU=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=UV8TlX5AF3sQiOljR8zBS7cDMUdBmuBVwko6vWqm0tQh/53fxlfClp5SBzVe0XvJ+a49XFTfDI9/dEZ771aK8NNVW1cc9lloFOz4iGr6kRhQVwJs21paNO6XDM4BBeOR+2XB0slqBJhQZ6hkXhGDL1JBbAt7MWNIdtGATOPhpas=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=iJwmYZoX; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="iJwmYZoX"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9611D1F00893;
	Tue,  9 Jun 2026 07:29:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1780990157;
	bh=xJNeymZSqfhYwhe8PQ6QvLRPb7IktUZX0Tsmq3QDNoU=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=iJwmYZoXIoCejzoJEc1gMi0ysRlRRKm+fV0ge2QY4QoRt/Gp3rTWlqtJbblKBb961
	 CZu0vulrYImuBWowH7ul+2456Qx1khAt5T6F1KJtTw+bQBsJTHAN4T0Af5iBNOnE3n
	 oso1CYxvJvuuvc9QApBpj2jV80m1FJ7UTFr8iBEmLc91sYR8Nv6s7gFTxJq+6Be0re
	 5SsQtB5yduR7H9tpUIQ9E8MhCwqi/ze+iipk3QqFSNT2tpoPudYFvWvhPQ/QgL6YpA
	 caKagK2dxFnQSd6f+jFS74jXWSEA3tUu7uyWvdMMh15oeKM0XSoT3JCk8q8TIXQjDe
	 1nvxzt2AKlXKw==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v5 3/3] hwmon:(pmbus/xdp720) Fix driver issues
 xdp720/730
Reply-To: sashiko-reviews@lists.linux.dev
To: "ASHISH YADAV" <ashishyadav78@gmail.com>
Cc: conor+dt@kernel.org, robh@kernel.org, linux-hwmon@vger.kernel.org, devicetree@vger.kernel.org
In-Reply-To: <20260609072231.15486-4-Ashish.Yadav@infineon.com>
References: <20260609072231.15486-4-Ashish.Yadav@infineon.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Tue, 09 Jun 2026 07:29:16 +0000
Message-Id: <20260609072916.9611D1F00893@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>

> From: Ashish Yadav <ashish.yadav@infineon.com>
>=20
> Fix driver issues:
> - Adds the missing regulator and property files in include
> - Declares XDP720_DEFAULT_RIMON as unsigned constant
> - Declares struct pmbus_driver_info xdp720_info as constant
>=20
> Signed-off-by: Ashish Yadav <ashish.yadav@infineon.com>

Sashiko has reviewed this patch and found no issues. It looks great!

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260609072231.1548=
6-1-Ashish.Yadav@infineon.com?part=3D3

