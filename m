Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794421786;
	b=nL3EI34pOEpXbWliZuRAK77jtUSaRlWgVqstBmIQtcA3IuO5TDoQz/17Wx1NcvHOocd7
	 wwfEH0aGScVo4bpK0IbLOAbrVBD4GpGQhJKejj54ZlevvsttJgU4cg/5cS3GVSazREoyX
	 RSUuY738dj1GEqxU7kOhfa6i9AHLW1NSfpikvfhuqJB5fKRvvxcmANtisypsqAelLwm6U
	 1hJUoHgN2LmTfhHzUIAb1g2YAqojabX2NdiVfvmBuXhTE0o09bUDZ+/SEBsn6MOiB50no
	 KfqMhP6Ve3RHwlV0B3sU7BpkZ4waEAK9ddYcBYE1syBgsJQIfN8GPRsiCquZT9qIxeQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794421786;
	h=Received:DKIM-Signature:Message-ID:From:Subject:Reply-To:To:Cc:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date;
	bh=N/eSRa2jecDgrw2o3vOKb2i0ZnHH5Pxu+Lbh0JYmY/4=;
	b=E7kTPHGE5y7cap86kwjwYHdFYaIjJIi2aqy869idGRwcBUubw78JEnPj5r02nSxsLhu4
	 JJzIBBpFSswt6S0QZHi9/FN/qmE6p5iLXqFVFa3ozmTdNEsNR2qxrlIWZassNndr8EVH/
	 nFB+une6vZgguRXy9wpO5HkrEdde8Ewa3HfqOL+0c5cgx7LbuSeU53NyzEM3iFI+pxtQx
	 M+Tr7m3i8UpmI0CJ0kBb84+HzwrmAVHn3UYoqoxJQbLwqhTc7U3otkcXBqYrOCVJ0uj6y
	 XEhZHWt4umjS5spoqrcLNQpHg77XKgDnFxlcqfBoPY7iKp5nPdxSw0QyN/vMQrOQ5vA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=nle9c6nO;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 345F6606A321
	for <linux-hwmon@vger.kernel.org>; Wed, 11 Nov 2026 18:29:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=nle9c6nO
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9E8AE1F00A05;
	Wed, 11 Nov 2026 18:29:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794421785;
	bh=N/eSRa2jecDgrw2o3vOKb2i0ZnHH5Pxu+Lbh0JYmY/4=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=nle9c6nOQV+IMQV9jCb7802MnWyDSmw9lzmQY4om+03riwlkxmQJkEpRLGNTBfAD7
	 MO98Xtv3edxxnTd+oJwR/DoosuDOFs0RuQNe06ryy80Pa4sDBHs9wSk0lW9xstXHA3
	 1VhVmh7EttrQ07d90m46AejQYhq5q1LJ+l7RbEPQdyz4A85O+Inj74uk990foIECCW
	 hjLFoTWxukBQBlMbXqDhPWmXXOLpDxFx1c6YA+ygXyNDXhu/58Na1kj0dMxLvzgPqM
	 cmaWUwP3O7SLXm1zoYGk2qMKcyPT5D0k75rFhK8L9rtjJBECtZElVtg88WNGi11xGC
	 SJ405GW+brlJA==
Message-ID: <sashiko-outbox-209461@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH] hwmon: (emc1403) Fix table name to match driver
Reply-To: sashiko-reviews@lists.linux.dev
To: "Andrew Davis" <afd@ti.com>
Cc: linux-hwmon@vger.kernel.org
In-Reply-To: <20261111181154.445315-1-afd@ti.com>
References: <20261111181154.445315-1-afd@ti.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Wed, 11 Nov 2026 18:29:45 +0000
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Post: <mailto:linux-hwmon@vger.kernel.org>
List-Help: <mailto:linux-hwmon+help@vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-hwmon+owner@vger.kernel.org>
Precedence: list

> The temperature conversion time table is called "ina3221" but this
> driver is "emc1403", this looks to be a copy/paste error. Rename
> the table to match the driver.
>=20
> Signed-off-by: Andrew Davis <afd@ti.com>

Sashiko has reviewed this patch and found no issues.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261111181154.4453=
15-1-afd@ti.com?part=3D1

