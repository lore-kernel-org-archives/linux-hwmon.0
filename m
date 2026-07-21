Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C25DE450903;
	Tue, 21 Jul 2026 10:07:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784628461; cv=none; b=DknuB+AuA8Z6ZIsyTcZI4FNhuTIx8gS+wna+qZLsPeVv+4j8bN90gyN+qH07CvT3YRAVhsYYvbH4fRmS/YjzroOuhZokbw5RNtkR86u5ThHfot2NJldbX/7RgzAjGImcPvSvH15hpRdQLtTnpfoR843n4jP6FzQ6FWm9dluTjGQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784628461; c=relaxed/simple;
	bh=nt+sWznLFQg+anJyKF0bKSNe+WPv4aXFBgko/V8wIns=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=SvX0se+lmtkmxuEVUiSwxPVZHfYs7WpwIaKdQ2fq6k1Mjn0sSkiLiymFms1Jpw4qXVWLiOD8K0vNi1KBU1M6G2/mY+tbRMl/cbbLn3FSxxl3KryZEfs7nHp4R2uTVqidk3tF19ExIMO0Un0vDDuPCYoYA8FhuGJQL5FJJ4yvNLg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=i8zX+QHQ; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="i8zX+QHQ"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5E14F1F00A3D;
	Tue, 21 Jul 2026 10:07:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1784628460;
	bh=nt+sWznLFQg+anJyKF0bKSNe+WPv4aXFBgko/V8wIns=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=i8zX+QHQjvsyvg3WU3535h1OmbRpxILvHbgzwHueJFBLxLXdOrlONj4yqrsYebd5i
	 eN6E1Z0kinOtbb6nmCvO/UtvSibKyHwGL1Ltg9lJUq0RK/KhwVXUTZgUHZzCiLKsx5
	 c3EdKrAnTLER3jBxVbrgrMZHBQ2KVSjnAr6UnApgTAjXgzw8Qh8kMg1yIFkvWoEfQf
	 Esl0Jdk9cRMwNYXJTebxBB/Tjo/wTFsYV2AsNtQVOsfHQPNZYOkTUHz4koQ0C2zxjY
	 NKFMMA+bb4m4c4s8pXFHZIsWAyk2bbj3zu5VXfaAKFA7NDSC9v1cX/T7zVjN3xEpZT
	 N8EaFlJX0CsKQ==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v3 3/3] hwmon: (emc1403) Add regulator support
Reply-To: sashiko-reviews@lists.linux.dev
To: "Svyatoslav Ryhel" <clamor95@gmail.com>
Cc: conor+dt@kernel.org, robh@kernel.org, linux-hwmon@vger.kernel.org, devicetree@vger.kernel.org
In-Reply-To: <20260721095935.439174-4-clamor95@gmail.com>
References: <20260721095935.439174-1-clamor95@gmail.com>
 <20260721095935.439174-4-clamor95@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Tue, 21 Jul 2026 10:07:39 +0000
Message-Id: <20260721100740.5E14F1F00A3D@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>

> Add support for VDD power supply for this sensor. It is required on some
> devices for the sensor to start up and work properly.
>=20
> Signed-off-by: Svyatoslav Ryhel <clamor95@gmail.com>

Sashiko has reviewed this patch and found no issues. It looks great!

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260721095935.4391=
74-1-clamor95@gmail.com?part=3D3

