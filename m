Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 07C772D9EDB;
	Mon, 21 Sep 2026 07:01:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789974115; cv=none; b=iksNjZAWjWBmwz3wke6R9VEwmevyIUciBScZdym720ZHnd3j3faE1kJgi+dGzYgVu0ItanwlYEo7gRODsVra1kzd86fIErW6NroaTPxYIij4hFMiXYbWfuWVBgroqIw3mS0vcpHbEUpbqGg9AHEwIsozd9gVKyrack8oeyde1Ag=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789974115; c=relaxed/simple;
	bh=rWRbD3z55xGDflNUoeLTi+MYega6zWHvLBRkRHYNq0Y=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=aTE1jtwjb85ra6X6CuyG5CeC30H9itWgZ4KKjJ4Esoty3dJgvQEdxPc4YHK0IKj06FJ3MG8fO1L/q8fASL11HC89P2B7aJHths0tV7+T1HgT7Yz1af4rnqYmnNgwAgZ04cVtYKIGGE7JoC/7b8Xv19JAwVsxnVVpwsWluWVex0o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=OU5F+kQS; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="OU5F+kQS"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 574AE1F000FF;
	Mon, 21 Sep 2026 07:01:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1789974113;
	bh=rWRbD3z55xGDflNUoeLTi+MYega6zWHvLBRkRHYNq0Y=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=OU5F+kQStRsJK0BjCVhq+6eo/dCytP8iCjthgLpKWmreM9Y9U8zyx+Y3AykSTReFe
	 yso9rhySva6DO9kZ9scMlxdbn4HsxaMdumAL+lPm7DrGeTUvxOSDimb9Z1YEbFdNU/
	 KBKw3gdF3887TM+v+Vvrh4f/zJWhgRzzrpMDIAI6aQtvZCZgKkwd4sBP9YMGf/sQgE
	 fNHUOsNWkBo6mutssY6rNzxOFf/eT5JRrFhWqhhS438a2NdBU6IVk3p8By74lQD7yj
	 smbM6nbMUKw9nCm5nEOPpglO91HuhyIfuRzYLKuUldiVLYIvkAitDGlOk7EehQdltt
	 f3J6A5SgLnrrQ==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH 2/2] hwmon:(pmbus/xdpe1a2g7b) Add support for xdpe1a2g7c
 controller
Reply-To: sashiko-reviews@lists.linux.dev
To: "ASHISH YADAV" <ashishyadav78@gmail.com>
Cc: devicetree@vger.kernel.org, conor+dt@kernel.org, robh@kernel.org, linux-hwmon@vger.kernel.org
In-Reply-To: <20260921065702.93196-3-Ashish.Yadav@infineon.com>
References: <20260921065702.93196-1-Ashish.Yadav@infineon.com>
 <20260921065702.93196-3-Ashish.Yadav@infineon.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Mon, 21 Sep 2026 07:01:52 +0000
Message-Id: <20260921070153.574AE1F000FF@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>

> From: Ashish Yadav <ashish.yadav@infineon.com>
>=20
> Extend xdpe1a2g7b driver to support xdpe1a2g7c model.
>=20
> Signed-off-by: Ashish Yadav <ashish.yadav@infineon.com>

Sashiko has reviewed this patch and found no issues. It looks great!

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260921065702.9319=
6-1-Ashish.Yadav@infineon.com?part=3D2

