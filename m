Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CE1951D5CFB;
	Tue, 21 Jul 2026 04:24:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784607860; cv=none; b=l4VqPsxIkGGdDpXEROP7KtB5bF1CTHlwRsZbPyR1+e6v8jo3EVdWyDAMZS6O4ZqMczmc8RSdPHOhH5H+ld2DM74s2I7Vq6g97Dmmrcf2f1B6jOMh7vvfKZzsnIIbv+YCsXLaFu4Do39uFOkqeR/ZAUKa+zNHyEtaLPbh8pN7uTA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784607860; c=relaxed/simple;
	bh=WasYGhmexEgnl5aaKe6748Lw6o6Wrzs0MLX9MMw3OzE=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=nIzZdliB2Fi9aT8yAbSkR7BpOYxrVJpL64ZI7CaRbGTQMKGkhT75tEI0Y6dWbM41Qx80f/AEBaN2TTF5c0MyHKhmAb/BytMqjGXH+10ldmrBSXfPhTx+wo/+BrvOV9nKRwFJUrRaDDE+oYfaKgs005vdwB85AdaRN/q+GLU2in0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=VioPGtzg; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="VioPGtzg"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0B7431F000E9;
	Tue, 21 Jul 2026 04:24:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1784607859;
	bh=WasYGhmexEgnl5aaKe6748Lw6o6Wrzs0MLX9MMw3OzE=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=VioPGtzgTIO1uL6quwDhEZZieZ1/kPWBGoIFMlY6ylak4quYe1lN0k36+3ochZ8Pv
	 kA4A5oZvtcS8bC72ea5g8ESxOrx2q6P0l5cvtq3C7ik6W6VAYnAqFrY+oh1fZNiJsV
	 lY4yOM90s5oaMOdaFiTxinerFupRxrWPokDy6iM3R7K8QwE8u6HNULpf7jdMi921N+
	 73nIX5bgq99LCtKGYaUb5JJ9TSmk6qE5j2coSLrkkL4oEaqRr9qABTs3aoZ9avph5R
	 xt35D8CGv5pQNA4sGLfxusTo20ZMUD4tZ46ZfZIq7eBSg3irgaYXeb6OIGFFwmIDD7
	 49XhPZK/acOvQ==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v6 07/12] i3c: dw-i3c-master: Add SETAASA as supported
 CCC
Reply-To: sashiko-reviews@lists.linux.dev
To: "Akhil R" <akhilrajeev@nvidia.com>
Cc: linux-hwmon@vger.kernel.org, devicetree@vger.kernel.org, linux-i3c@lists.infradead.org, Frank.Li@kernel.org, "Alexandre
 Belloni" <alexandre.belloni@bootlin.com>, robh@kernel.org, conor+dt@kernel.org
In-Reply-To: <20260721040805.1696503-8-akhilrajeev@nvidia.com>
References: <20260721040805.1696503-1-akhilrajeev@nvidia.com>
 <20260721040805.1696503-8-akhilrajeev@nvidia.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Tue, 21 Jul 2026 04:24:18 +0000
Message-Id: <20260721042419.0B7431F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>

> Add SETAASA and SETHID to the supported list of CCC commands for
> DesignWare I3C host controller.
>=20
> SETAASA is a broadcast command that assigns predefined static addresses
> to all I3C devices on the bus.
>=20
> SETHID is to stop HID bit flipping by the SPD Hub to which the SPD devices
> are connected. It is a prerequisite command to be sent before SETAASA as
> recommended by JESD300-5 and JESD403 sideband bus specifications.
>=20
> Reviewed-by: Frank Li <Frank.Li@nxp.com>
> Signed-off-by: Akhil R <akhilrajeev@nvidia.com>

Sashiko has reviewed this patch and found no issues. It looks great!

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260721040805.1696=
503-1-akhilrajeev@nvidia.com?part=3D7

