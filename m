Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 74F5A40A945;
	Tue,  7 Jul 2026 12:32:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783427549; cv=none; b=EkmbBYXb1zlXGlj91GJmJ0ttHeLeryTP5gOmqdukCssAdbw8Byqu/M/i0jFON1XYJBlMYhgUNjwFlvfhe8PAI04SP+hjAEOgGEfz0W+JXTp+DMmk+S7gyphZem7DxtXDCRPUXums8r9a8perGzbgZb/6v987XTdFdi9xko0KE9U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783427549; c=relaxed/simple;
	bh=HV2SsxHq+6tgEa9oZO51D7/aOQp1bEf2QodElJmBEQ0=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=FoigfcJDK2GB/4hU8UBS88r4YFW89xCbuahpzTEuSrGVZSoDfl8QgDThkDQ9hsvXErB3FqUeGTGMm7r+G3RgcY9T7JTIuXZFZAAKJGnsisMmzl/OxZ4L6grr6S4M4ZomitRwH88KdhZktA4/ImC8Ci2Eb039AgW9YllEIUEC+3s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=QMBbYqke; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="QMBbYqke"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B820E1F000E9;
	Tue,  7 Jul 2026 12:32:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1783427548;
	bh=HV2SsxHq+6tgEa9oZO51D7/aOQp1bEf2QodElJmBEQ0=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=QMBbYqkevkm0rMcPe84z5FWEwaeE2VC47/5triC7F3gmE26YkkOeoa6r23GDBNgA9
	 +Hk0s3YHdjsA8b5lAE+MMAZNgytNwzrutha0QJ2w1VSwESk5Z3r2bQVk5ealUJ3ET1
	 94e7HUujQRmcGF1P4m5hzPTkrzkUsmiJ7H8lBd3flyABr1fS+oyA8kVcW3o/vNS1PI
	 NzeYm3Eu1JWA7Cb783TPgdPkdiX0wdiB+SBcEBoIrLvMopVKl+WmtrTojy9PM3Y2Pj
	 5UwiY9uUQ4VL4itz6BzrU46Ww0p7uD5Q75mVLGtTwt5OL5wJxjsYsqSa7Vf+Xr6Aif
	 5QjCw+ZzRmeUw==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH 1/2] dt-bindings: trivial-devices: Add adi max20912 and
 max20916
Reply-To: sashiko-reviews@lists.linux.dev
To: "Fred Chen" <fredchen.openbmc@gmail.com>
Cc: robh@kernel.org, linux-hwmon@vger.kernel.org, devicetree@vger.kernel.org, conor+dt@kernel.org
In-Reply-To: <20260707122701.751878-2-fredchen.openbmc@gmail.com>
References: <20260707122701.751878-1-fredchen.openbmc@gmail.com>
 <20260707122701.751878-2-fredchen.openbmc@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Tue, 07 Jul 2026 12:32:27 +0000
Message-Id: <20260707123227.B820E1F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>

> Add device tree bindings for Analog Devices MAX20912 and MAX20916
> Dual-Output Voltage Regulator.
>=20
> Signed-off-by: Fred Chen <fredchen.openbmc@gmail.com>

Sashiko has reviewed this patch and found no issues. It looks great!

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260707122701.7518=
78-1-fredchen.openbmc@gmail.com?part=3D1

