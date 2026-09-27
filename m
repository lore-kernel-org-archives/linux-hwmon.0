Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 991C12E2663
	for <linux-hwmon@vger.kernel.org>; Sun, 27 Sep 2026 19:24:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790537059; cv=none; b=kBi8P7BHSa+DvXOu7D7Rx2BzGnSHZ8hURz8Iw/o+SencrzziES7U1ikQ8Sv9A8lSaSZTECxQb82MdXNxEv4qDMSKCdLFKDhTWH8goofwEZFPCkoet0yrLtP58kH+nHzlPbq56Kiqcj8NXa2bmG5QxC+OKyIa1ATH7SNQ8zZnQE0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790537059; c=relaxed/simple;
	bh=hIhycO9FQqJFBrSrVjWuOzYNDBx1Or/KapawBa3TOg0=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=skRPVralg9d5o22MFQDf5wdk6EJpqmMQEu7G255eNtcXHZ/tpKuz1QX6eusaGnFZG1du7QUgPgQGpgNDZfIqT+GfCKBuEdSqCHZaMbBqFdm0wMNYn8Asn1XH9SLqS/igvt9ftXHWA63le+Z5/zvIlsPIW9Rys7ELkviUXh5Uu/g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=cJIpURXO; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="cJIpURXO"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0E4A31F000FF;
	Sun, 27 Sep 2026 19:24:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1790537058;
	bh=hIhycO9FQqJFBrSrVjWuOzYNDBx1Or/KapawBa3TOg0=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=cJIpURXOZQUdul4vJnrbz+D3hTAhNZGAfcVmUCuz/YLsGH0wbwJ+KOFu4BQoZLKEp
	 fLKShAoloeUuK9tUJAaMjyzO84VoYnonWFkbpx54TQ49bHnQiLajYdK+TsJUtot+JU
	 lGVmz1PfQTEAtgdIr1ASxeqSaen6wKEgMchQKYHA1OHtaPwDJVNCuT84aKfywBt1w1
	 7xn+foYlZM6WVhAfpvoydIZJvWAQ56Cds9JyHDs+t3gFy6VuwFcoOdfsWtpBaK0SuL
	 6BP9WzDpdX/vYM5sIFVf+w+8HDqSS94uPcxGL5fcwTvxB+sv7+LATP4sytoD3YrncN
	 Amu/Wu6VBpEUw==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v5 4/5] hwmon: (aquacomputer_d5next) Skip unknown
 firmware version offsets
Reply-To: sashiko-reviews@lists.linux.dev
To: "Vas Zayarskiy" <contact@vasily.cc>
Cc: linux-hwmon@vger.kernel.org
In-Reply-To: <20260927191316.4137752-5-contact@vasily.cc>
References: <20260927191316.4137752-1-contact@vasily.cc>
 <20260927191316.4137752-5-contact@vasily.cc>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Sun, 27 Sep 2026 19:24:17 +0000
Message-Id: <20260927192418.0E4A31F000FF@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>

> Only decode the firmware version when its offset is known, matching the
> condition used to expose the firmware_version debugfs file. This lets a
> device leave the offset at zero without interpreting the report ID and
> following byte as a firmware version.
>=20
> Assisted-by: LLM sparse
> Signed-off-by: Vas Zayarskiy <contact@vasily.cc>

Sashiko has reviewed this patch and found no issues. It looks great!

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260927191316.4137=
752-1-contact@vasily.cc?part=3D4

