Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794158976;
	b=ZMNxzyxuRcBiEY+Fz1qeUggS7tySp6Sdo4xrMa5BkJkWO/cBH5Df/0GiKyQH/Q7lZnME
	 52voXf8TMgQnmZ0bNC+4hjy8xBGVHpoGZdiPPfYSPp6J0CaMRh9lFSwHFGE0pld7ozNen
	 Dpf+5KayIFW+Z0OilhkRqBvR/BQIqVAU8lJAL8SLNnO23NISKqKo4HRQyO/9TRHMNKqAY
	 Ua3BgolV7eqHkbfn92FuZtOQ3DDfBp+E4tGTDLaa9HubbuQsU9NHiNg5Py/DU256Wk+zz
	 ZxeV3gG5bjUt4j0pyqrHlc795rBvaQFf3/aezawks2hI9USckOyc1yzyCJBMrFMwMzA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794158976;
	h=Received:DKIM-Signature:Message-ID:From:Subject:Reply-To:To:Cc:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date;
	bh=Dei/31ry9/uK5l8CWBUz92dXo/f21rO/PhkRBkHlqTw=;
	b=RB3JUAF/4pL5dX5TERPEG6bSmrI6XRrIiN8kV1Z5a8uTyEgkVc/CI83lUb962WyyVIdp
	 LZ4hZrXg3GTve5N7iD2i+UfSA+URkJhjcGCSjroXzJ2AsQkQzZqrcnLVsHSN3Y7CB8rYB
	 985eCbQl5yMEFtE8+0b3FXUzDCfMhQwwh99TvX0SNL/Fk2ytKYfQXs1nxr8Vh1Z5o++y4
	 bZOGQF4pk3gcR7qat7xujin73iBxIJglMVd/4n1wNiwVsxT43DgiVaXty3Pq+jKoY6LE3
	 KH0MqAEQMHgn2RiS7BJ7v11hUWIWn2s49tfOdshTCViD+9y2TL0kvo7mIMnIA+0W0KQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=UyybC+bj;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B204F606A31C
	for <linux-hwmon@vger.kernel.org>; Sun,  8 Nov 2026 17:29:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=UyybC+bj
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6914A1F0089F;
	Sun,  8 Nov 2026 17:29:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794158975;
	bh=Dei/31ry9/uK5l8CWBUz92dXo/f21rO/PhkRBkHlqTw=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=UyybC+bjEhIXIPXuq1bZRsqV07rPPUTxjWHtPPozZmTK+D0hvMwY0ZirctaZwyxPF
	 RW2FDVtHS6RP14ot48kDYKkl89LmnanEwC/vVJ18M3VClohBUhjISh5m3gSV8TcRUx
	 uW1ahudnHfhnmySdMMG6Oq9pweYl1kXv/fFw+mhVjsG0EE5U29UxiVkl2SvOs+rbSB
	 6DLovdrGEZ403z42p42IBtDxEfgGVW2XvbQZo9vYqrGMt0euZb0LUonXzgxdInbGJz
	 DnrjzZVtLd6Kgb55L0fPmEHSeA6eFSzbuTdYKViISbRAzKFw80xu2Yj3aWHihlw1vw
	 ouF+iYihp0LWQ==
Message-ID: <sashiko-outbox-203889@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH] hwmon: (aht10) Fix update_interval overflow on 64-bit
Reply-To: sashiko-reviews@lists.linux.dev
To: "Rupesh Majhi" <zoone.rupert@gmail.com>
Cc: linux-hwmon@vger.kernel.org
In-Reply-To: <20261108172651.220121-1-zoone.rupert@gmail.com>
References: <20261108172651.220121-1-zoone.rupert@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Sun, 08 Nov 2026 17:29:35 +0000
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Post: <mailto:linux-hwmon@vger.kernel.org>
List-Help: <mailto:linux-hwmon+help@vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-hwmon+owner@vger.kernel.org>
Precedence: list

> On 64-bit, update_interval writes are clamped to LONG_MAX ms, but
> ms_to_ktime() overflows above 9223372036854 ms and the interval wraps.
> LONG_MAX becomes -1 ms, so every read starts a new measurement and
> update_interval reads back -1.
>=20
> Clamp to INT_MAX like sht4x, so the limit is the same on all platforms.
>=20
> Fixes: 8c78f0dee437 ("hwmon: Add AHT10 Temperature and Humidity Sensor Dr=
iver")
> Signed-off-by: Rupesh Majhi <zoone.rupert@gmail.com>

Sashiko has reviewed this patch and found no issues.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261108172651.2201=
21-1-zoone.rupert@gmail.com?part=3D1

