Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 73B4D4BB7E1
	for <linux-hwmon@vger.kernel.org>; Mon, 31 Aug 2026 16:15:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788192947; cv=none; b=fvHtQE0wT6M2hgpMg8lyO7GoplZ3Nz8/GDZekg0dW6bIUdFWCeTFxBeaH/iH5SEWESKAsCibb3hB/NivkMBNKNPelNzg/iR3BvBXHKQPm74chVp8sWpkZqyuAyEhJuK9ARolHvWiUhfbpo5xWLnv459lIZBmKy4mhwLK4/WdviQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788192947; c=relaxed/simple;
	bh=OkmIyzBbt+F+F17iaU+HdmDdGK6zFar25MdKOmf8U/4=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=M9gY4Oi1c9ZNmU+w1gzfyE1nRtukCJOvIf7TCXMEFBzLh+TpBx4akyHlg4f9i9JEu5hlm8iWp7Y3KwRrEtoOOtj05jo0ZYFteI9s7rgwrITcu/nS2wPCd67kzPyY914DOFN+E+MqaeCEjuqnH+WSnrRgRBc25kAHiBNrwou8fl4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=lmkhGRKA; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="lmkhGRKA"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 241511F00A3E;
	Mon, 31 Aug 2026 16:15:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1788192946;
	bh=OkmIyzBbt+F+F17iaU+HdmDdGK6zFar25MdKOmf8U/4=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=lmkhGRKAn7Mw6J83LE2G3ZqjqT0YWeSyCplEwX5HYA/iAK6MsNPg8j5wASx0w8Qbp
	 v7BJkV+4qu9xxPTIeBdlwhN0uSssV9bcBQWKXUFmZWCNt0UtWW0DF6dw8fAS4tDofm
	 7izhGu64jnBsy1K6qUUCmQRmKOFGzV9Z3OhU3OgBoXPLVzuOU5Vxsyh9YHqe2F6ECM
	 lAjLqFJz3C1l0UQC2zUUDDY4t+RQcWegsLMErB7JtwZxi7WheF4ZpPKInP7xxebdLC
	 PxeNNR1ThuTmJq3OlbRWTXaQDg9KPET+Y79wlyH3/0VuUwQugl6mojJKqk8FmwgUYy
	 GhYlC2KrWNaNw==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH AUTOSEL 6.18] hwmon: (asus-ec-sensors) add ROG STRIX
 B850-E GAMING WIFI
Reply-To: sashiko-reviews@lists.linux.dev
To: "Sasha Levin" <sashal@kernel.org>
Cc: linux-hwmon@vger.kernel.org
In-Reply-To: <20260831133314.4125787-440-sashal@kernel.org>
References: <20260831133314.4125787-1-sashal@kernel.org>
 <20260831133314.4125787-440-sashal@kernel.org>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Mon, 31 Aug 2026 16:15:45 +0000
Message-Id: <20260831161546.241511F00A3E@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>

> From: Eugene Shalygin <eugene.shalygin@gmail.com>
>=20
> [ Upstream commit 5e9f31543515d685cafed33274433b6360c0e1e4 ]
>=20
> The board has a similar sensor configuration to the
> ROG STRIX B850-I GAMING WIFI, but includes an additional
> T-Sensor header. The patch was provided via GitHub [1].
>=20
> [1] https://github.com/zeule/asus-ec-sensors/pull/105
>=20
> Signed-off-by: Eugene Shalygin <eugene.shalygin@gmail.com>
> Link: https://lore.kernel.org/r/20260607123626.100630-1-eugene.shalygin@g=
mail.com
> Signed-off-by: Guenter Roeck <linux@roeck-us.net>
> Signed-off-by: Sasha Levin <sashal@kernel.org>

Sashiko has reviewed this patch and found no issues. It looks great!

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260831133314.4125=
787-440-sashal@kernel.org?part=3D1

