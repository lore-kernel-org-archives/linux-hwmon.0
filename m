Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 589783C0621
	for <linux-hwmon@vger.kernel.org>; Tue, 22 Sep 2026 04:46:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790052410; cv=none; b=rOxYjQlr4S4klPTtGQrkp32j4YnoQ1IfONn4JULMFIbbmIHTOmktBpfNqlWhWSf0mo2JNmGJ/iLWlyK0cs7S80wDRxQsukw5ETzuHeOndFJWCZJoiPgQ19yD75wGU21f0k0eHElrby7onV95HzTMrKqSXHNvUQCtG+c0y0T/Y+c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790052410; c=relaxed/simple;
	bh=ndlPwcLp6f7OHDZSX5ZVa/+47A+PQM8+/qnxVdPHl/E=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=oNG5ZwQxJZStTk8KXEU7nA1sIzEeugefzVqO49Nfs8+tl6c39TcWvzoNwXZdLHpaSgEW0DYSzaXofTNGZ12lGmXihZMcaqHeXG/40xd+psUM7qc/F8ygX5N0NJJLN1oW5NmqC2cZ0h/kjuVFLjMplNaKEz/3+abuJngy4ywf1lI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=JGx6po0O; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="JGx6po0O"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1545D1F000FF;
	Tue, 22 Sep 2026 04:46:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1790052407;
	bh=ndlPwcLp6f7OHDZSX5ZVa/+47A+PQM8+/qnxVdPHl/E=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=JGx6po0OfhMFVl36qK7/sIQf6JUg2WRO0Ez0ZyVgCLllAbzQY4GmJXKPoOuxcpvUc
	 busgeJ2MOBkVc0GuDmXnfNyymbF7/3+gs5esvK8NBeB6OFmnCuchaUUjqODCaupd4F
	 yQcQyW7SSFyNraLmnwGD6cwb0ct2kN+ROgAIyerPhxnh2NTB7qSDPeeFWrf22dWDoI
	 7YCXwM06tvZmIVo5Z0QsPlhx6T1+aF1o9XE5cM+qHTbkPvZXkbNu/20Y4zOoGFl+8/
	 mwegkqz/DCZvNqpUoVN8N7WmMhz7DKWF+QccIdHOpsTsT5PEpnaSxCMtvph6GDOg2s
	 rafzkhUj8l/XA==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v2] drm/nouveau: Fix memory leaks in debugfs and hwmon
 init error paths
Reply-To: sashiko-reviews@lists.linux.dev
To: liupeng <liupeng01@kylinos.cn>
Cc: linux-hwmon@vger.kernel.org, dri-devel@lists.freedesktop.org
In-Reply-To: <20260922044044.21442-1-liupeng01@kylinos.cn>
References: <ff3015a1c4b08088b0638b00670e86d612a27978.camel@redhat.com>
 <20260922044044.21442-1-liupeng01@kylinos.cn>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Tue, 22 Sep 2026 04:46:46 +0000
Message-Id: <20260922044647.1545D1F000FF@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>

> In nouveau_debugfs_init(), if nvif_object_ctor() fails, the previously
> allocated drm->debugfs is leaked because the function returns the
> error code directly.
>=20
> In nouveau_hwmon_init(), if hwmon_device_register_with_info() fails,
> the allocated hwmon structure is leaked because the function returns
> the error code directly.
>=20
> Fix both by freeing the allocated memory and clearing the pointer on
> the error paths.
>=20
> Fixes: b126a200e9db ("drm/nouveau/debugfs: we need a ctrl object for debu=
gfs")
> Fixes: b9ed919f1c8f ("drm/nouveau/drm/pm: remove everything except the hw=
mon interfaces to THERM")
> Cc: stable@vger.kernel.org
> Signed-off-by: liupeng <liupeng01@kylinos.cn>

Sashiko has reviewed this patch and found no issues. It looks great!

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260922044044.2144=
2-1-liupeng01@kylinos.cn?part=3D1

