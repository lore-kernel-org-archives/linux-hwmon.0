Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0E4594A2A63
	for <linux-hwmon@vger.kernel.org>; Thu, 24 Sep 2026 15:22:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790263384; cv=none; b=DF5FkSxkOEfsk+TPoIPj8lbrpdL3nKRT0pWBhO9kZVTH2YdCJxevQNpVv2NJh3jw+VMQn9PtYqtAJTJHrb6GYce3Rd/C3eyUXAOPJ/p5zMdDGc3cTUvIxpigsMviWSIh8imG09AutUamyVO1VYbt5icD5SS96TNi0FJ8e0EmCz8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790263384; c=relaxed/simple;
	bh=xyg788+agpTodjqHNagfF1mC+T0Fu0zdkK97Okx2UdU=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=eiTRYHXz4Xv1pILZFR/UV3n1ZSBeXP1TX2ThpCk2I1xwp2S3saeWV2nLtLk/caRqyZPqyagk3KdNa8as18Gq5EcEbApZvjHOGWqhdtiVsI2gzyaZ1cuckykexiKC4Rf6CmvEiRKr0HWMp4CoODamJ0mTNZwZ5VOfW0XkBQH1nx4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=jubu+K+J; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="jubu+K+J"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C540A1F000FF;
	Thu, 24 Sep 2026 15:22:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1790263377;
	bh=1M3kEUsehoNq02PAtPeXN7wxJ0xPXd9GjidI8vQNkeo=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=jubu+K+JKkNd35XXiwxdB8wFo1ABQ5dYOTKnKZ9VT6YdfgLyVKGKfO2Ujq588/rAp
	 Ty57uN19bl+S+/gqoP5/BSBh4+Liy/392PqojHNRcOiehqqEUR9yj0PKUsfR1ont/M
	 wzufCaftARNRe1rZoAmWWWI7nHWP162hqc4bx4670ymOe8fC/MgY0yHZaeYAnfyqtr
	 CXzAcGVnPjOUfQI9nVyi8AbBsjeko0TbgLRj9am9RPfiuYlP2KL4gUeJ/n2aFJaAXd
	 5spNIDtbzR6lS6HntZvb55kMVwJWQ42t4gPoAvUy+p4FkseGI9xyPM1s0fwMlVfVOS
	 OOkM4Ttvl1MbQ==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH] hwmon: (aquacomputer_d5next) reject short status
 reports
Reply-To: sashiko-reviews@lists.linux.dev
To: "Jiale Yao" <yaojiale02@163.com>
Cc: linux-hwmon@vger.kernel.org
In-Reply-To: <20260924151121.1233666-1-yaojiale02@163.com>
References: <20260924151121.1233666-1-yaojiale02@163.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Thu, 24 Sep 2026 15:22:57 +0000
Message-Id: <20260924152257.C540A1F000FF@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>

> The HID driver raw_event callback runs before HID core validates the
> received report length.  aqc_raw_event() reads device-specific status
> fields at fixed offsets, including multi-byte values, without checking
> that the received buffer contains the complete report.  A truncated status
> report can therefore cause out-of-bounds reads and update hwmon state with
> data beyond the received report.
>=20
> Reject status reports shorter than the length derived from their report
> descriptor before accessing any fields.  Commit 47669bec44fe ("HID: asus:
> refactor the two workqueues and init sequence") added equivalent raw-event
> length validation to hid-asus.
>=20
> Fixes: 0e35f63f7f4e ("hwmon: add driver for Aquacomputer D5 Next")
> Cc: stable@vger.kernel.org
> Signed-off-by: Jiale Yao <yaojiale02@163.com>

Sashiko has reviewed this patch and found no issues. It looks great!

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260924151121.1233=
666-1-yaojiale02@163.com?part=3D1

