Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793461159;
	b=Hw/d7QizDYQjKMrZc5lJfNkRvNYAPMBTjj/M6gAm+Pw+oM1B54FJ1lwcpdM6AlHtki8i
	 67pdXjVDqeJLYRMyT/iaQ3XHOXPipuLZdwih8z4/ooS+NWl+heuQ4ixIAQwAJiYn1g5r5
	 BkPRituImbV7glMpks3fzOiHPeQc/lqVjUDDt4mPm1Tl3Dc0CQ+Y2WxDSQYb+7Bk5F0jP
	 3hxX1prf3VzLg6ongXboGCaqYZmIhpRQTQmzX37QY4CVHypJavG1BFYDtGqf7Tt99//0K
	 qdAwa2tBCU4L0qTmVu0UKxooPmOZdQH9TmhVdL2DHk0lhI2t9QZRwA8AXxJXsj/rODg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793461159;
	h=Received:DKIM-Signature:Message-ID:From:Subject:Reply-To:To:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date;
	bh=UoF/qnP28EqH1yWfS8qCUzClACbWhQQJi2RNTwIubxA=;
	b=rEO7yQWmBjr8ipO2156B1Y1lzzW8eCWirfT5eE4ejgaUj9jrTOAha895Tra6xPZzHpy6
	 7yymS3ueoyDWtmmXf+dErSOCTYt07TogDOVniY6vboY4scm/aPvNgdwolhyVzHUqC53DP
	 3bSWCTKVD+loozx6vYY1l0u3SVl9d5VCzg4+lMgJrsQN2EZXpqr5i7QOQxELzaEgPvLjn
	 05LvXmu+E8B9b6+e0+3kTse7C8azXbG934hUYd/On+2FVd8qKrOL3jRxGlx39ek3UmzAS
	 8ZxdTBT0PUTRfe1Ag5f08imYKNde431H3WAYhGWMEJXYzORFl5nTQcKiKSqAqI21orw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=ZSGQczjZ;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6F65A606A31E
	for <linux-hwmon@vger.kernel.org>; Sat, 31 Oct 2026 15:39:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=ZSGQczjZ
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D3D0A1F000C1;
	Sat, 31 Oct 2026 15:39:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793461159;
	bh=UoF/qnP28EqH1yWfS8qCUzClACbWhQQJi2RNTwIubxA=;
	h=From:Subject:Reply-To:To:In-Reply-To:References:Date;
	b=ZSGQczjZCWWykrZY9jfNNeJsDiKCdZJGHr3hsBC0MPIiNngau81Cva+C/RNSwbXqA
	 i1BDaRzP+gi6lyOs6qSGr7/62U+tZu22yZGT0KZd6EN1Pj0+/d+iEjtMhmxQup8hVW
	 OQ3T8EITUguQHt2Qd7RtafTCxdrp+laN+jy4loR1EAfSGaYLv94HEHTsOAbu5mpx5J
	 F25LQKjYQ57B4DUqiK8KtyfMh6Dp7S9IsuV5ISyLYEghYBak/wD/WKhCLwzE/GmpLl
	 QrJ4+oxnm/7Plbu/aw8PTNm+Eqvt2jQ7nZuJrEB1f/ZCJ1ZjhdJJxfiSbpRWIkk+TQ
	 /51ZzhxNWkHMA==
Message-ID: <sashiko-outbox-192024@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH 2/3] hwmon: (coretemp) Set nr_cores only after core_data
 allocation succeeds
Reply-To: sashiko-reviews@lists.linux.dev
To: "Guenter Roeck" <linux@roeck-us.net>, linux-hwmon@vger.kernel.org
In-Reply-To: <20261031153528.3195123-3-linux@roeck-us.net>
References: <20261031153528.3195123-1-linux@roeck-us.net>
 <20261031153528.3195123-3-linux@roeck-us.net>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Sat, 31 Oct 2026 15:39:18 +0000
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Post: <mailto:linux-hwmon@vger.kernel.org>
List-Help: <mailto:linux-hwmon+help@vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-hwmon+owner@vger.kernel.org>
Precedence: list

> In init_temp_data(), pdata->nr_cores is populated from
> topology_num_cores_per_package() before allocating pdata->core_data. If
> that allocation fails, init_temp_data() returns NULL with
> pdata->core_data still NULL and pdata->nr_cores set to a positive value.
>=20
> coretemp_add_core() logs the error without failing coretemp_cpu_online(),
> so the CPU still comes online with pdata->hwmon_dev registered. When the
> CPU is later taken offline (or the module is unloaded),
> coretemp_cpu_offline() calls get_temp_data(pd, cpu), which loops up to
> pdata->nr_cores and dereferences the NULL pdata->core_data pointer.
>=20
> Store the core count in a local variable and assign pdata->nr_cores only
> after pdata->core_data is allocated, preserving the invariant that
> pdata->nr_cores is zero whenever pdata->core_data is NULL.
>=20
> Reported-by: Sashiko <sashiko-bot@kernel.org>
> Fixes: 1a793caf6f69 ("hwmon: (coretemp) Use dynamic allocated memory for =
core temp_data")
> Signed-off-by: Guenter Roeck <linux@roeck-us.net>

Sashiko has reviewed this patch and found no issues.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261031153528.3195=
123-1-linux@roeck-us.net?part=3D2

