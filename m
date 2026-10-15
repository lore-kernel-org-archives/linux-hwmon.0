Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 80D294A2E11
	for <linux-hwmon@vger.kernel.org>; Thu, 15 Oct 2026 09:01:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792054882; cv=none; b=UMVoEjGzl1r3pU161DG0aK5ULvadL65nZiExpk1a8l9Y0YpBUdmkL4xh1VW34kktru8AzKQtQo7qCRn26jr2a3WkOW1xzhN82apfzcMzy/tEKeP9J18k08fpdJwLKBmjIwgCrAJl7cczMaDA9dC7f4Iw2/e4UMMaV/A4Ed77qDw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792054882; c=relaxed/simple;
	bh=bBqDU8HF1aYkg9qwsFOXyHKXHTT1JC26cUA+1AvnAS8=;
	h=Message-ID:From:Subject:To:Cc:In-Reply-To:References:Content-Type:
	 Date; b=djRENTQMRXOrI/5HOTGr0QG/t/yE00Pu/Hx0HvMOp0yh9OM7cRWWgsFNXQO5OrKzrwv0rl4sqSpISieSdLj/OagmF5hocyxUJ8eo6CCFYIIp61LeYgcPQfmg2EJK0UECGAeQVtQ6JfPJQBlsK9Isu5dlBN2KPKzRVT/cupZUYLQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=GaQwn71N; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="GaQwn71N"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C28201F000C4;
	Thu, 15 Oct 2026 09:01:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1792054878;
	bh=bBqDU8HF1aYkg9qwsFOXyHKXHTT1JC26cUA+1AvnAS8=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=GaQwn71NpR5VPR+Cq6D1T4G5PeGrP21UPmHladDAKxGZvYIxjnNepxKkqLwWA9tND
	 kpYuB8SXwXxZv5TPF8rfL4Wa/jR2Y5pzHpzL9SLzv7rGyPQpE+WrF+F3UJBrMWL9ej
	 dtnnn5+DHEM13ppDJwd8JqDRyKg0INb4geix0zUcI4usnpK9nEieDq9K1JlnwHwHGx
	 nKABC2/1Q87y5r4aPSTHOYaBCMm5qR73fKFi/oMpr6FFRtnPE1posc/uvemkN70V4x
	 ly3c8hkkAq7nmlh4BpbhBjmVxBWXgxue3t/t4xUC+7m9z7aYOcO1XfFtQZ0EZ7cIx/
	 RXfeV/SNEP8FA==
Message-ID: <sashiko-outbox-172534@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v4 3/4] arm64: dts: qcom: glymur-zenbook-a16: Add
 Embedded Controller
Reply-To: sashiko-reviews@lists.linux.dev
To: "Konrad Dybcio" <konradybcio@kernel.org>
Cc: linux-hwmon@vger.kernel.org
In-Reply-To: <20261015-topic-asus_ec-v4-3-af6305ffcb10@oss.qualcomm.com>
References: <20261015-topic-asus_ec-v4-0-af6305ffcb10@oss.qualcomm.com>
 <20261015-topic-asus_ec-v4-3-af6305ffcb10@oss.qualcomm.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Thu, 15 Oct 2026 09:01:18 +0000
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>

> From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
>=20
> The Glymur-based Zenbook A16 features an Embedded Controller running
> custom ASUS firmware (which is loosely based on the reference Qualcomm
> Hamoa EC one with a lot of modifications). It provides keyboard
> backlight control, additional temperature sensor readouts, fan speed
> monitoring and a number of miscellaneous functions.
>=20
> Describe it.
>=20
> Reviewed-by: Abel Vesa <abel.vesa@oss.qualcomm.com>
> Signed-off-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Sashiko has reviewed this patch and found no issues. It looks great!

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261015-topic-asus=
_ec-v4-0-af6305ffcb10@oss.qualcomm.com?part=3D3

