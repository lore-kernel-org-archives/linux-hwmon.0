Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794305932;
	b=Ms+x5MlS5rq+qBsDUUp/GvEZsiGIjlo8vpgUwpIrf6cLzJo03DVUzRlU9pyWr7Rb6p2l
	 EFgtoEnN6xcEeAie+IdPfq+gtDL6q/CJrrshuAw6uG7ZhtmDNrPZXCOUZGHI3Mp+ejnx2
	 apKkphYA+yIdBD3wbCjoZ1+Xm4EqL2oa84wcG1f5Z2X9gZj9YOuwcw09888HQhQ8tWE0n
	 H2S5LwZFa4569uSnPMTJIiNQ0UFy2646PoCvtEAdNJzgD3iDygHUGPLHmspRVIlcQB64o
	 G1u8NTsECBNsEWqsWZ+iBxuEgK2L9FdEZAZcr3AJoajbkI8FGXo4lY94M02qSsvYt1g==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794305932;
	h=Received:DKIM-Signature:Message-ID:From:Subject:Reply-To:To:Cc:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date;
	bh=tpcnqFTRx2UThiLG6HJw0Vcw3EyWj9EmM+hCUQg862Q=;
	b=QhVMLxxaIRJ5e7tRbVgLTXA1Q+WhB+tZ09NGp/VSTJgRBYDzx/xONsh7K9kAs7k13NZg
	 Yh7n/88YMLm+AtRM6Uo+u2YixYN7LKd66zdlmZS0lCHMvRA5yyzRFFP1sEz5kaRcFxqwC
	 nYF3VveDD9gU553Xcs+ZXRSV72frcFHXuW9oVJM8TXGX91I3r0dLPVkda3024cW1ZVnBp
	 0y7IRlWcsBPVuAR2KpZdAvVPRunqkM9MTZophV7IiI7IU+z6aXTS1ZdzE3FI7hw/sgDJv
	 BPRBlxY06KKDNG/t5QwDVICJuiJKJlWGxOy/26dCMJcTbmEe5IbndlOYTgpdS25kfvQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=PD231Q0K;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 13555606A31C
	for <linux-hwmon@vger.kernel.org>; Tue, 10 Nov 2026 10:18:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=PD231Q0K
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7FA031F008A1;
	Tue, 10 Nov 2026 10:18:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794305931;
	bh=tpcnqFTRx2UThiLG6HJw0Vcw3EyWj9EmM+hCUQg862Q=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=PD231Q0KqE/rBRKDXQ5sGLuqELT8ugvEKk2KnCqKuWGIltv8Q5NE8qbw08nv9t9EU
	 Eyvvw6GGAO7moVjKKe+pLoA8G9+sBi63t12UCwdfKV7neu8iVV0A8mqxxDYK1V9qgr
	 IpjeaXw6OV1FhZp2h3j+xhcGtTjA370RkMCWMXS8MZhreupldfpZQ7OEW9CTvC3OLc
	 eq307qb32F3uqwGUajD6HWj9Issq3kNn9v+DmTqIm3fT5apdPG1D3onYNmBBPVomhM
	 7BzClaQA+D0tjfnCo96qgn8N/2pj6H+KPVJNtHIqJAGx7fjQVIPeNsZ8XLfsqiEK0M
	 lyoNgexcQoeow==
Message-ID: <sashiko-outbox-206855@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v2 4/4] hwmon: ltc2978: Remove LT7170 and LT7171 from
 curr1 iin documentation
Reply-To: sashiko-reviews@lists.linux.dev
To: "Christopher de Guzman" <christopher.deguzman@analog.com>
Cc: linux-hwmon@vger.kernel.org
In-Reply-To: <20261110-upstream-lt7175-lt7176p-v2-4-dd60d28383bf@analog.com>
References: <20261110-upstream-lt7175-lt7176p-v2-0-dd60d28383bf@analog.com>
 <20261110-upstream-lt7175-lt7176p-v2-4-dd60d28383bf@analog.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Tue, 10 Nov 2026 10:18:51 +0000
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Post: <mailto:linux-hwmon@vger.kernel.org>
List-Help: <mailto:linux-hwmon+help@vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-hwmon+owner@vger.kernel.org>
Precedence: list

> LT7170 and LT7171 do not set PMBUS_HAVE_IIN, so curr1 reports the
> output current ("iout1") rather than the input current. Remove them
> from the list of chips with an "iin" curr1_label.
>=20
> Signed-off-by: Christopher de Guzman <christopher.deguzman@analog.com>

Sashiko has reviewed this patch and found no issues.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261110-upstream-l=
t7175-lt7176p-v2-0-dd60d28383bf@analog.com?part=3D4

