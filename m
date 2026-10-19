Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3E8A53033E1
	for <linux-hwmon@vger.kernel.org>; Mon, 19 Oct 2026 11:49:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792410576; cv=none; b=GfhRhbTW6SmdbEOrcOPY+wU5PJYGY786FlTeSV8APFupsR0pbQD9RtJCYEH68l3keX1fCHw08vHz0aMML2Bua0jwfdN4fheHaZNkFz8xTCFTorpw0O9lD/p0HLVCGzjwasM8B4MYEBPj5UVu0HJiOX2I5HXb9pk2YdyQw6KA0lQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792410576; c=relaxed/simple;
	bh=UGWkKXprlOqyaslkZ5Yy1ktq+6iLf1WB0fGjHrFw73o=;
	h=Message-ID:From:Subject:To:Cc:In-Reply-To:References:Content-Type:
	 Date; b=s9axqfIPaCa7BuFHUVuqW4C1tLAc1T4BBq2rlQf1SS9Xj4pJsHlt75+vFmaBg3TqLUGSvCf7jByqnmaUEFfv8EW3oaus/p5qTUqbafo9Q7mSYPgKA7dXra4e+Vj51PpFuPEr1bXib/Z1CFqqrO6fHgGw7mVrc1btSBnUv42O3fU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=e6it4kKD; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="e6it4kKD"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id AE7011F000C4;
	Mon, 19 Oct 2026 11:49:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1792410574;
	bh=UGWkKXprlOqyaslkZ5Yy1ktq+6iLf1WB0fGjHrFw73o=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=e6it4kKD8gkwVRwuIGyPZDtDkF0DZdS9jk1uLitON/n3pDOyQ27//9Yp25dkqZiN+
	 rHugVkdoL8HKaOs2+mjT58Sh+uhKlUsP/xLufi5BojC/jDv3EvjosrhYNcJr/KSz/2
	 A4Oxy4LSSpnr68Od5tebgBA84vlq/wbEdlCADDHjK4k5iouWLL3ITSMhsBxCB5vJvO
	 EgPZfD6gkm3GFIao7JfkpBVdWte4DuTUFdvsTQrENGRYWWIJcmoQ+L2gQoQQzc1Hu7
	 vsvmYmON2KCPPCkvLIU+G5mE/LivruXG2uU8OwTwhhNyWwGJ/U0kK+tujO78G0Db+d
	 21DigJ5Ts+rXg==
Message-ID: <sashiko-outbox-177053@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v4 4/6] peci: cpu: Add Intel Granite Rapids support
Reply-To: sashiko-reviews@lists.linux.dev
To: "Changhuang Liang" <changhuang.liang@starfivetech.com>
Cc: linux-hwmon@vger.kernel.org
In-Reply-To: <20261019114502.55307-5-changhuang.liang@starfivetech.com>
References: <20261019114502.55307-1-changhuang.liang@starfivetech.com>
 <20261019114502.55307-5-changhuang.liang@starfivetech.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Mon, 19 Oct 2026 11:49:34 +0000
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>

> Add support for detection of Intel Granite Rapids processor based on
> CPU model.
>=20
> Granite Rapids processors with the model set to INTEL_GRANITERAPIDS_X.
> The data field for this entry is "gnr".
>=20
> Tested on JHB100 BMC with Intel Granite Rapids processors.
>=20
> Signed-off-by: Changhuang Liang <changhuang.liang@starfivetech.com>

Sashiko has reviewed this patch and found no issues.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261019114502.5530=
7-1-changhuang.liang@starfivetech.com?part=3D4

