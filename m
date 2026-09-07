Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 907E634B669;
	Mon,  7 Sep 2026 07:06:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788764786; cv=none; b=fuFSaUAFNPobsCkEVjHkD7F21mTxHj4voNooXQ+lxbnWwjvruasgxWLdslZuXIXnr180jsZYUDhrn1T12M5GPht//BR4caHhoG2PQGvXs6VjD8Pt4sr+gdEbI8t5zTOPSriCfUwCt9a1B8LMpRsA6Dn0juITsidwmQm57/FYqgM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788764786; c=relaxed/simple;
	bh=cbclK5rNU8gy/MP+bXTT2PyezKPpEZDpfRVML8NNNrY=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=FofwL1yk/BxAl0Oj0iaVeeqAEih9wVyFA4wadb9h2GKB0M2HQUcBqDlWpk/de1IoFgLW4A76N7SzZbiozfLjQk4vzAVCIqdyPRD/Nk4y8K3S1xNwiQO9itIojoQ25W6Vz6jhm/9z5JE6zPG73qAx6fxy7Jnj7xJSgmJLi83QBcs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Yw6iZgJ0; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Yw6iZgJ0"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CE4061F00A3A;
	Mon,  7 Sep 2026 07:06:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1788764785;
	bh=cbclK5rNU8gy/MP+bXTT2PyezKPpEZDpfRVML8NNNrY=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=Yw6iZgJ0xUBNrn94+U6Nege3D5LLpajsPJLly6t/CunGWqcPtiisMeUjHxhxoient
	 J1/rZGnfC5JkAPvX/M/SXLCep1qD6FBCTSTEChYoacweF+ZdXEzKsRhx550hYGB4sQ
	 wkqN4RXgNRvYzljRsFIq4B4011G+dIHlFkbPmP6VPP9toqWNMDlm8X//Z7lJClzxYy
	 osN58fz4eOinBVLDzDc7IS9Mql8H2EY5o9+j21hmPoefIIxd9vLoSF/Q9ij2fGd1hb
	 HIFWMdu1F7bmyIVPjmxuM7XDGweN7WYlmVjuZyQAbJvBWaBxNx6ExlgkfSAlpgM3hj
	 pgmpha7MisdGQ==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH 2/2] hwmon: (pmbus/isl68137): Add Renesas RAA229639 and
 RAA229640
Reply-To: sashiko-reviews@lists.linux.dev
To: "Colin Huang" <colin.huang2@amd.com>
Cc: devicetree@vger.kernel.org, wsa+renesas@sang-engineering.com, conor+dt@kernel.org, linux-hwmon@vger.kernel.org, robh@kernel.org
In-Reply-To: <20260907-add-raa229639-and-raa229640-v1-2-8f7218cba85d@gmail.com>
References: <20260907-add-raa229639-and-raa229640-v1-0-8f7218cba85d@gmail.com>
 <20260907-add-raa229639-and-raa229640-v1-2-8f7218cba85d@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Mon, 07 Sep 2026 07:06:24 +0000
Message-Id: <20260907070624.CE4061F00A3A@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>

> From: Colin Huang <u8813345@gmail.com>
>=20
> Add support for the Renesas RAA229639 and RAA229640 PMBus
> voltage regulator devices.
>=20
> Both devices are compatible with the existing raa_dmpvr2_2rail
> variant, so no functional changes are required beyond adding
> the corresponding device IDs and OF match entries.
>=20
> Signed-off-by: Colin Huang <u8813345@gmail.com>

Sashiko has reviewed this patch and found no issues. It looks great!

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260907-add-raa229=
639-and-raa229640-v1-0-8f7218cba85d@gmail.com?part=3D2

