Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7F2D5328B7F
	for <linux-hwmon@vger.kernel.org>; Thu, 10 Sep 2026 07:09:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789024173; cv=none; b=PwDc/NwzbhESh7pg1AdP/2tRxF5fMxOnDfkM8GQAq9JdTEKMdBTIhavoWVtVU/otBPUyAShrhHPUMnQ3FaQyAHIZ9LKglQQOEzxXvEv4FchEIKq8NmnxCkXDZVk4Olxhjs4HXiagccs2PQCkyd93JTfFrPxLAfmdbPFGyY+saMw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789024173; c=relaxed/simple;
	bh=8JAVQCbNA0KWRAXwlxcCZnOOkVwWCwJsYCKJeRFL5PE=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=bUkDV3hqL7wSlOozucu4AlCoMjKn4ERxJYxaVfkQiFZrwJ9lsrWYewfYTCGdcbmrX8GDA0M1p7vjixDUxmFeEdzpgd58/B7oq0XcW0VjwFq1Km7HyV1y9zq0QGY4ZpBNTm6drNAv20e4BNZgFsOeOPyNtsMz8h7gSEh0WtHKxb4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=i8XdVRXS; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="i8XdVRXS"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DFCC51F000FF;
	Thu, 10 Sep 2026 07:09:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1789024172;
	bh=8JAVQCbNA0KWRAXwlxcCZnOOkVwWCwJsYCKJeRFL5PE=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=i8XdVRXSx+x9k1quLJLwUlqtYcMswt1Af8hEE+tRwfUn6QQJSu2QFHpZl84M7bgKK
	 onejDqzDhyAql1XqoE9VqDf2nIZ/ZQLI6hS/ob2PZJ3Ogk/biIlR43HMe7hMx9HgWs
	 hj2qM+9E5lMuHQadUVJv1ITxRxhr6vAhEXZGiTNjSOSh8b0UB7XKiFBj/JslggyKmj
	 +eh34LjsVyTm16Yw//li7Rk4+jz6lNcz0poEh4y8VDLUDIS/sZlPqWf/wu36r+d1AB
	 z7nybnD3IIhAFzTanDVF+fCMuviJODClsELOdfnVj+9BqszgdR092g45XBA7y+Fm1C
	 H6MH2VMJa+EKg==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v2 1/3] Documentation: hwmon: (nct6775) Document
 NCT6116D/NCT6122D/NCT6126D support
Reply-To: sashiko-reviews@lists.linux.dev
To: "Paul Louvel" <paul.louvel@bootlin.com>
Cc: linux-hwmon@vger.kernel.org
In-Reply-To: <20260910-bootlin-hwmon-nct6126-v2-1-ee629ab35e49@bootlin.com>
References: <20260910-bootlin-hwmon-nct6126-v2-0-ee629ab35e49@bootlin.com>
 <20260910-bootlin-hwmon-nct6126-v2-1-ee629ab35e49@bootlin.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Thu, 10 Sep 2026 07:09:31 +0000
Message-Id: <20260910070931.DFCC51F000FF@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>

> The NCT6112D/NCT6114D/NCT6116D family has been supported by the driver
> since commit 29c7cb485b32 ("hwmon: (nct6775) Integrate new model
> nct6116"), but was never added to the list of supported chips in the
> driver documentation.
>=20
> Also add the NCT6122D/NCT6126D.
>=20
> Assisted-by: opencode:z-ai/glm-5.3-flash
> Signed-off-by: Paul Louvel <paul.louvel@bootlin.com>

Sashiko has reviewed this patch and found no issues. It looks great!

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260910-bootlin-hw=
mon-nct6126-v2-0-ee629ab35e49@bootlin.com?part=3D1

