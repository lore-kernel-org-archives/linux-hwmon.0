Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9CF3E38888B
	for <linux-hwmon@vger.kernel.org>; Sun,  7 Jun 2026 11:10:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780830637; cv=none; b=hnBTPq6eGMUioK7hXgMbsz4wvlBqfh7DyVIlGum/nuEso8PyDK0EoksRAPFqQlIcCAg6kHkN5yKUVaV+sYm+xLNdeXET+nQGsWPXJb1jdjS+hvcVm2YHaacMPLFLpAsVQSCUHkh/zFD5raNYg9WRGRrTbT5iaJswNiJEalMKW7U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780830637; c=relaxed/simple;
	bh=t85Gij5X5NWVLqXBC4QutyNJDEjYVv4nkSRvTlXLe+A=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=VKAsntN6YK9its9xQ6Vc0ouPgKN7FGF+UN8Dnc47GhbBkQK0Ty94CSE3YpMbQKFW6DM3CQXwptZnZKdHddEEsmqVajMEs/AVhWmQ5u2XtgRdAhxAkQF7PaiEvn66AN7tYvYocITtOWtBkzuDvr1Pma4FlHCnjhFLZYZf0fgemb8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=kgcdNa8T; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="kgcdNa8T"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 44C9B1F00893;
	Sun,  7 Jun 2026 11:10:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1780830635;
	bh=t85Gij5X5NWVLqXBC4QutyNJDEjYVv4nkSRvTlXLe+A=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=kgcdNa8TZe12tkpdEg1UPmW5lUL6gWviLOf43esTUPZc09j6p58dqqSZeg+XyyNln
	 fse4wR0oOZ7N7YRDe9h3C1Md0XjL3D9lPcvnrCDBa2+oIGZ0ZGoEvQS0KgQ2fC/xOr
	 6eJ9AB1jwlh4l0CGZcP3GqWm0QFR30lgyVJ93JTa0GD+4B/AzoRb0eXCxkL3a513bo
	 yOZaHdkdc00tIcezfo+kz9rRIRg6NHS5Ke4AdbYskCtoG7VzlRagk6NbaWfkGhkATc
	 ZF30+PN1tJjhbufwkZ3jc8R/HgfZQ5JOGUzxRSmPQ9Osou5Yuo8zRs4xvyN7v0KahQ
	 InvZQHSEGiwSw==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v2 1/1] hwmon: (asus-ec-sensors) add ROG STRIX B650E-E
 GAMING WIFI
Reply-To: sashiko-reviews@lists.linux.dev
To: "Eugene Shalygin" <eugene.shalygin@gmail.com>
Cc: linux-hwmon@vger.kernel.org
In-Reply-To: <20260607110702.84599-2-eugene.shalygin@gmail.com>
References: <20260607110702.84599-2-eugene.shalygin@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Sun, 07 Jun 2026 11:10:34 +0000
Message-Id: <20260607111035.44C9B1F00893@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>

> From: Veronika Kossmann <nanodesuu@gmail.com>
>=20
> Add support for ROG STRIX B650E-E GAMING WIFI
>=20
> Signed-off-by: Veronika Kossmann <nanodesuu@gmail.com>
> Co-developed-by: Oleg Tsvetkov <oleg-tsv@yandex.ru>
> Signed-off-by: Oleg Tsvetkov <oleg-tsv@yandex.ru>
> Signed-off-by: Eugene Shalygin <eugene.shalygin@gmail.com>

Sashiko has reviewed this patch and found no issues. It looks great!

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260607110702.8459=
9-2-eugene.shalygin@gmail.com?part=3D1

