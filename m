Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 70801390CA9
	for <linux-hwmon@vger.kernel.org>; Mon, 20 Jul 2026 06:42:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784529776; cv=none; b=gsYhGf5280TH7GTC+FH61npzxIUqT9maGHH1UoCJw9ztZm+M9jVvY02KLpK2IXgNPZTIn9FlrVnSqcFAHbGTmuaduYvkBVT4E2wnis4V3BijxmmD902DDBvePVt8hBiIHF4EFhOfmlZVrLr2e6MzgsWqWqYhpk70gjehGTHZ2M4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784529776; c=relaxed/simple;
	bh=TjH07eqFZLrUN+Ih6+c3WSieuP1aIHGZ9hRk8fzmspA=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=kOucXYjRqVpxDH5HJOjzXwLHeUKXDfB5sgqICRlXtOJ4gQvUheZYfvYnf0D6g3RSgVRg9WsbLqmm3rdO5vKrfUM+D0luZmlLLCcwIrCY3kfq0obBD+WyOTAB5E+Uz2olMFjfCxd2/y0WDxjsqFZ65jIgpGKyxj4eaWwYq4zFR+Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=KCIKhgjm; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="KCIKhgjm"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CDA891F000E9;
	Mon, 20 Jul 2026 06:42:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1784529774;
	bh=TjH07eqFZLrUN+Ih6+c3WSieuP1aIHGZ9hRk8fzmspA=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=KCIKhgjmE+s3rh82UGrgwGdu3w08fWYKScFe4uEnU/lHmc6uwDehJJVUyvVCtW4gK
	 PqwNg7LDthiZf6LF7fdFr4TueDdcR0kprkqzYEE/or1qHXKd4G245rw+G+mGfZJPjr
	 eMPru+F5Kq46H8ofjrrzRX/lWBv/IKkX6nOYhRagFU9hCQTIY7jcBHNR3cx4Irx870
	 1B6ZXIyKXJEIQSnn016ZaKJ7KpKpF5LqDtgHX3s6s0iivCGHJ2gB9SdUCsFzP9ywPK
	 v9nDcQIC7LpCEU9zoOHSs2gv+94n/NAzDpmUOllMEygMps67RTWMrm+4pUkzlYG4Ds
	 CnB+l7ZG636Wg==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v2 3/7] hwmon: (lm90) Remove redundant dev_err()
Reply-To: sashiko-reviews@lists.linux.dev
To: "Pan Chuang" <panchuang@vivo.com>
Cc: linux-hwmon@vger.kernel.org
In-Reply-To: <20260720063745.309331-4-panchuang@vivo.com>
References: <20260720063745.309331-1-panchuang@vivo.com>
 <20260720063745.309331-4-panchuang@vivo.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Mon, 20 Jul 2026 06:42:53 +0000
Message-Id: <20260720064253.CDA891F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>

> Since commit 55b48e23f5c4 ("genirq/devres: Add error handling in
> devm_request_*_irq()"), devm_request_threaded_irq() automatically logs
> detailed error messages on failure. Remove the now-redundant
> driver-specific dev_err() call.
>=20
> Signed-off-by: Pan Chuang <panchuang@vivo.com>

Sashiko has reviewed this patch and found no issues. It looks great!

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260720063745.3093=
31-1-panchuang@vivo.com?part=3D3

