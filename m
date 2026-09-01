Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 085AE37BE63
	for <linux-hwmon@vger.kernel.org>; Tue,  1 Sep 2026 21:23:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788297784; cv=none; b=ZyV8WDX/EWK4WVrPGZkVymYj74bqq8BMNXfuyOX7IP6XNBxERUHnFOzKhfTCW8nwGGNdgcd/bRloJyXCIC18OGZOFFFqShjwkJ0tmO8Z+ho86FjmmWbMgQT7Ey+hcUJFpKz1g9GnB4h+jWczqmEgxokBcgN/9xFIPj5y3zezYfY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788297784; c=relaxed/simple;
	bh=/QW+uyT3xKbjmsFpCYUEUwLarFJ6OUwmenz3Vw6om/M=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=VQ+uXDL98NKNRXj8rj4LAeqNxS78IQMMFbraR3Or2ikhrTZLanDkqALHNxzfrHqS+a3EwUEgfCnd8YwH7uuMEJEdMS++X/v5S1riJ7+pKTYXM55GBxFlsAB3vXmS/4EGH7+lNTjbbH2j871mAcOPBXPfUpvoyh0ifWaqfOwD7A0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=nLxZIvZP; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="nLxZIvZP"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 81DBD1F00A3A;
	Tue,  1 Sep 2026 21:23:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1788297782;
	bh=/QW+uyT3xKbjmsFpCYUEUwLarFJ6OUwmenz3Vw6om/M=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=nLxZIvZPm1vkyL8q1l6K+Bduc4TvXx4j9JKMbw+MlDA5O5Xzm9K62MrUsduZuc5LH
	 n8pC629fPXQQNOiWvroyRkS/ZERuQwSRV7nAiv2IYNzI3Adj8pIVU3oPJd9Iirb2fi
	 Bnr1dsv4uuXHfEi2hqOvEoPF+4S7rMFYAT9Itz8XbWd7nsZUii1LvYwUY7StJGTJ5q
	 errvy1NQHtEV6+Au/6xwbVsTeeS8TsuZ0Pu08bgIqxFKUiTrYeftjT6+nXREOtxP8X
	 C632KIkZDCegsyAjKKnZnLQqwhcxLrfzqbe6nGtOlqGngOhX8nUVYBB7oAu2rXl7ze
	 QzT/oeafEnJyA==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH net-next v2 1/6] eth: fbnic: move sensor read logic out
 of fbnic_mac
Reply-To: sashiko-reviews@lists.linux.dev
To: "Zinc Lim" <limzhineng2@gmail.com>
Cc: linux-hwmon@vger.kernel.org
In-Reply-To: <20260831212234.1212971-2-limzhineng2@gmail.com>
References: <20260831212234.1212971-1-limzhineng2@gmail.com>
 <20260831212234.1212971-2-limzhineng2@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Tue, 01 Sep 2026 21:23:02 +0000
Message-Id: <20260901212302.81DBD1F00A3A@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>

> The sensor read lived behind the fbnic_mac get_sensor op, but it is only
> ever used by the hwmon subsystem. Move the read into fbnic_hwmon.c and
> call it directly there, closer to where it is used, and drop the
> now-unused get_sensor op from struct fbnic_mac. No functional change.
>=20
> Signed-off-by: Zinc Lim <limzhineng2@gmail.com>

Sashiko has reviewed this patch and found no issues. It looks great!

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260831212234.1212=
971-1-limzhineng2@gmail.com?part=3D1

