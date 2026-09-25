Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 63FD5367B9B
	for <linux-hwmon@vger.kernel.org>; Fri, 25 Sep 2026 02:29:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790303396; cv=none; b=QoNGDnoF/+Ase9MTxahmBHxyl40Y8FCMUcAe96WW+UiVjdaPmkffkwRjuukIGxQ30mjZ7meLMPLvDSnkR0ZQO3R5LYDlLSGgkvxpJiXOTZZePwRfOPFZNwjrWVhB7YIAebM2lVJAAfxFaO3t/n0/aFdMwfZRNRjTE3rQ93jCqxU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790303396; c=relaxed/simple;
	bh=OWLYrAecLpVgIhgQeG1fISfkQ7UMLwhdbY/s9gNz0bU=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=osa16E8Ejf7a4UZ4LGszNX167cfG9GSpYc7QPx7UPrhkFpJZWU4ZPMdj5giZ3X1PK9+pwDIbLdCYPJSUZ3ZdEfGSiRu0niRox3xuYFwG2bSyJwGRbE6yPn2xE/inyA/uSu3fmD0aLSKKOT38AktxVFF2NYuvbyPAk7f/JL2arO4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=HnKelhU5; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="HnKelhU5"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id F063B1F000FF;
	Fri, 25 Sep 2026 02:29:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1790303395;
	bh=OWLYrAecLpVgIhgQeG1fISfkQ7UMLwhdbY/s9gNz0bU=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=HnKelhU5oUabr3I3FRdrgHQGwV6lofj/6TEyui174xIgx2z0abo2LdVNqJfrnVxZm
	 YUZH/o5rj4HsxkP2CMbwPycILN4u0IR5QcOg8rh/TGdQ+Uz1tBUpth2UjAZxMYv0J5
	 CJRWBggUio1DafZMz7D9mRMiJJ67b0OBPrDLQdjH0l8ZtAQ4oYBTWmE7AWOH+B9SJC
	 fXm2PzOwKpRswwKhaGd5csUVh9Sglx3l2Sg+Ai64vMnkagUnJNtz0toomtpaUBv/vr
	 xbwE1BEwWMcNO+rZ28Nx+kTpTVnpafjFpbs4w18PHW09e8fYwunFGX08D8JJYwQIO8
	 6iqN5rPdjKfnQ==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH 2/3] hwmon: (coretemp) Read TjMax only when refreshing
 the temperature
Reply-To: sashiko-reviews@lists.linux.dev
To: "Ricardo Neri" <ricardo.neri-calderon@linux.intel.com>
Cc: linux-hwmon@vger.kernel.org
In-Reply-To: <20260924-coretemp-temp-fault-v1-2-1884f0ff97d5@linux.intel.com>
References: <20260924-coretemp-temp-fault-v1-0-1884f0ff97d5@linux.intel.com>
 <20260924-coretemp-temp-fault-v1-2-1884f0ff97d5@linux.intel.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Fri, 25 Sep 2026 02:29:54 +0000
Message-Id: <20260925022954.F063B1F000FF@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>

> show_temp() reads TjMax before checking whether the cached temperature is
> still fresh, but consumes it only when recomputing that temperature. On a
> cache hit the value is discarded.
>=20
> Discarding it is not free. On CPUs that report TjMax in
> MSR_IA32_TEMPERATURE_TARGET, get_tjmax() returns the value it just read
> without storing it in tdata->tjmax, so every call reads the MSR again.
> That is a cross-CPU call whenever the CPU owning the sensor is not the
> current one, and it is made while holding tdata->update_lock.
>=20
> Read TjMax where it is used. The value cannot go stale in the meantime:
> bits 23:16 of MSR_IA32_TEMPERATURE_TARGET are read-only, and the register
> is package-scoped, so every CPU of the package reads the same value.
>=20
> The temperature reported to userspace does not change.
>=20
> Signed-off-by: Ricardo Neri <ricardo.neri-calderon@linux.intel.com>

Sashiko has reviewed this patch and found no issues. It looks great!

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260924-coretemp-t=
emp-fault-v1-0-1884f0ff97d5@linux.intel.com?part=3D2

