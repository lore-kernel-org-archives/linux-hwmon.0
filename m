Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0D56F1FBEA6;
	Fri,  9 Oct 2026 00:57:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791507464; cv=none; b=ZBEw9kPCofqcgXPpwb0G57ZGhAdUGmvHC9DRa9LmcI6KgP8QNhUIk5wiB3CF+IUsZ2mw/+g39MRRYWydgQiaZeGeK2pbwsmUsPifpNUW4wXkxm9wNmUBXAM8tNQWKHHTjcKHdbwuTlWs8zfcpfljfnG5oAyfJFvpBuTJk6ehzC4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791507464; c=relaxed/simple;
	bh=SBnGhgzhqfHN6N9r7h5ME58n3Jj8jdZIk3ELNu5beds=;
	h=Message-ID:From:Subject:To:Cc:In-Reply-To:References:Content-Type:
	 Date; b=Y7tk1M/QFhnQI6Us2DzxclsFB6tRXc026RBkPjO3KrAt31QemLXfaKV6C8kU4zwIbrhId7Uk2bxG6JBX/1b1b/JyUMAYJD6CaoP7JK1rfSD/1q5vLm81qdmrnSPrU/+ItNMcxP6BrEMYrXxHDciia7cXZlcJyDkJDcBGbSfQ2uw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=MgOmwHxW; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="MgOmwHxW"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6BDF11F000FF;
	Fri,  9 Oct 2026 00:57:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1791507463;
	bh=SBnGhgzhqfHN6N9r7h5ME58n3Jj8jdZIk3ELNu5beds=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=MgOmwHxWq9/IV0minQKBFEovejkamTdMDI4RuH8+JGUJKmEC34fZtShn0MyMmhMHV
	 1w8dGySxBH4q0Gw98isYkDQvItxoB8eduQjg96ZZzMYTdbwbTCsyusBOBTSrVjBBH0
	 EVOhC/3mmhqZXnj1S9j/dDuPXvPGwYDHusp00EQs6IkluHIHiVPTxKrpv43zBhjP+T
	 8Ba39JtHXIhkgtFRBMjbxyyDsmWiraMWQJVFRv2wzUAigURJ80J5PtTy8iCE5w2xgR
	 A+JpuzkCk2NKBvpAVCjr530As3kD5bNFRLsQIUHXo2XuewbNNq7n22f8q+795lcVuc
	 tHujhJ1371Zlg==
Message-ID: <sashiko-outbox-164690@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH 1/3] dt-bindings: vendor-prefixes: Add TDK Corporation
Reply-To: sashiko-reviews@lists.linux.dev
To: "Abdurrahman Hussain" <abdurrahman@nexthop.ai>
Cc: robh@kernel.org, conor+dt@kernel.org, linux-hwmon@vger.kernel.org, devicetree@vger.kernel.org
In-Reply-To: <20261008-hwmon-pmbus-fs1412-v1-1-0ae7e5ee4e41@nexthop.ai>
References: <20261008-hwmon-pmbus-fs1412-v1-0-0ae7e5ee4e41@nexthop.ai>
 <20261008-hwmon-pmbus-fs1412-v1-1-0ae7e5ee4e41@nexthop.ai>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Fri, 09 Oct 2026 00:57:42 +0000
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>

> Add the vendor prefix for TDK Corporation, the maker of the FS1412
> point-of-load regulator.
>=20
> Signed-off-by: Abdurrahman Hussain <abdurrahman@nexthop.ai>

Sashiko has reviewed this patch and found no issues. It looks great!

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261008-hwmon-pmbu=
s-fs1412-v1-0-0ae7e5ee4e41@nexthop.ai?part=3D1

