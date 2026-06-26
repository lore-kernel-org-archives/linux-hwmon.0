Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E6D3627A92D;
	Fri, 26 Jun 2026 07:31:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782459079; cv=none; b=XcFl64ot7IdZ8/lLwXuqq6obkyWLp0RRkQNF4qXCiFQrll0gkN8aeWARGRuOjK86tzImMf5To+vkbdl0UqskIPRfes1707snOrhadsF7bFfktmfNFo5bt7ZREZStjV8NwB6mQ1YJJ+fVE0ATh9ve5RaCfGqYuvikbZT1Kpjnyso=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782459079; c=relaxed/simple;
	bh=mnErBJ5dHE8l9Dw6ytdCj3rhFuTY6mwXKTbQnHcwve4=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=aPo9aYHQwnF88Ji8nxVS4Z0YzaEyZ8wcD/GCFttjz0R2l7wKUwfa+cVb+PO/jxAlypQ9iGsek59lCHmHSSmHuWEfVzdgnhcfH/yujel8j13Iodl2pgzA//OwuP/Jf0uQgs3wsgWvtGupvuoqTPD+CUmdRlJOBl66ge9lcw4rDA0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=IbWG5EWP; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="IbWG5EWP"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id EC11B1F000E9;
	Fri, 26 Jun 2026 07:31:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1782459076;
	bh=mH9fvCrWEBJqgWTIzKI3gt+q3Cc5y259u+mGgxaB3ug=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=IbWG5EWPR+zLcBFfJoqApSn1JehwRTNwZnOEhiYF/BlpecwaKT1Kxg37K8Kgo5pEt
	 zcoarRU7kmShP9Wd9OjxPItqkZyHX8Hel9psHCle5BjnhUPBkQEg8IJBgmKzZXbSs/
	 l1elXv7l62ncLqxnlRXHSeGDQ2X9E0v+yuZA/EFQsKI214PsLvfL9aACo9lyQyvUgE
	 E5PKXm8Toj2lh5DeXf4UDaQ+YJvIaIcDmHMaK0owQbqFtfWw8M17pzDwDz9sEfgKFV
	 2xxDSnFqgHF8JvI2mFGPmbUqeJ92zcPOXe2iWQN32TxO4PPDhpElpRb8Ryy0MAGqHd
	 hScjrMOwT/TIg==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v2 4/9] hwmon: adm1275: Support module auto-loading
Reply-To: sashiko-reviews@lists.linux.dev
To: "Matti Vaittinen" <matti.vaittinen@linux.dev>
Cc: devicetree@vger.kernel.org, linux-hwmon@vger.kernel.org, conor+dt@kernel.org, robh@kernel.org
In-Reply-To: <9eca6831f9fe2d781bb88337397c39b10e36f5c6.1782458224.git.mazziesaccount@gmail.com>
References: <cover.1782458224.git.mazziesaccount@gmail.com>
 <9eca6831f9fe2d781bb88337397c39b10e36f5c6.1782458224.git.mazziesaccount@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Fri, 26 Jun 2026 07:31:15 +0000
Message-Id: <20260626073115.EC11B1F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>

> From: Matti Vaittinen <mazziesaccount@gmail.com>
>=20
> Populating the i2c_device_id -table is not enough to make the
> driver module automatically load when device-tree node for the
> power-monitor is parsed at boot.
>=20
> Adding the of_device_id tables causes the driver module to be
> automatically load at boot. Testing has been done with rather old Debian
> system.
>=20
> When inspecting the generated module-aliases with the insmod, following
> entries seem to be the difference:
>=20
> alias:          of:N*T*Cadi,adm1075C*
> alias:          of:N*T*Cadi,adm1075
>=20
> I suspect these are required for the module loading to work.
>=20
> Signed-off-by: Matti Vaittinen <mazziesaccount@gmail.com>

Sashiko has reviewed this patch and found no issues. It looks great!

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/cover.1782458224.gi=
t.mazziesaccount@gmail.com?part=3D4

