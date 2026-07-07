Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 621953F7A98;
	Tue,  7 Jul 2026 12:36:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783427796; cv=none; b=UUfh4Vchv8vrq8jF/R6Cwoee9dfUmmsuSxwE1Vwf8T+xjWRH+Jbneyv+Dc4HeAzTzNY2zFSRhRyyAWzVllFGWbFwHvFRgsbnkvYxe781EU1ljxRu5QxvnUXKe0BxIF72s8D7tyWMzkkHNMVllYzvIXTsp3LEseqt06kSePYVgi0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783427796; c=relaxed/simple;
	bh=IT/XnY6Wha6i2nMoO1cglXroXgw7yuvYrpPs/FCVwg4=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=RVp8KJFL2yoDH5hLNCBo3wvVr+68ECCZM6/ciBDyf1lYIM7A2xIpjKD6fLeaQZ5/K9r/PfBlx9NXgt7rxOD/+F69d5KsGNQXQdVVKPnRlfLzCI6lCT7S0WOoA6QH2SRKIIeEz4v1TItD5mauhXsDTd8uEwohp+w7bD/azi44sF4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=C3hk+sq3; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="C3hk+sq3"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9C6861F000E9;
	Tue,  7 Jul 2026 12:36:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1783427795;
	bh=IT/XnY6Wha6i2nMoO1cglXroXgw7yuvYrpPs/FCVwg4=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=C3hk+sq3+UHHB+fBWsOqU85221O3j8Hua+eWkpX3n3WQrIEN3biFb0FJeL/0FX9Oi
	 cAN2s0yP8DrPw4nTGlgnF4b8k0jkMK60PqOy/n2IPkPNwz3c3kroK5L1ZR+SR8ZJYL
	 tHEGYyRFmnKA3l3X3A/EFhODujI7wzSToIO4gswcLkGzghJHy6GL/FwxA2xWP6CvtN
	 igf3QpCYl75aW5rlViktVwJRilRs/OxKK2UT0f+hLY1w5e5pLnO20fnggh3Rk6A4/u
	 GVxw1cAEJMmNQ4pEBTsu+MERih8fThKQbxv+DdELHFWzdQ7Y6R3Dkz3Q0BApbmANxM
	 RqXmZN2WKkGbA==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH 2/2] hwmon: (pmbus) Add driver for Analog Devices
 MAX20912 and MAX20916
Reply-To: sashiko-reviews@lists.linux.dev
To: "Fred Chen" <fredchen.openbmc@gmail.com>
Cc: robh@kernel.org, conor+dt@kernel.org, linux-hwmon@vger.kernel.org, devicetree@vger.kernel.org
In-Reply-To: <20260707122701.751878-3-fredchen.openbmc@gmail.com>
References: <20260707122701.751878-1-fredchen.openbmc@gmail.com>
 <20260707122701.751878-3-fredchen.openbmc@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Tue, 07 Jul 2026 12:36:34 +0000
Message-Id: <20260707123634.9C6861F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>

> Add support for the Analog Devices MAX20912 and MAX20916 dual-output
> multiphase voltage regulators with PMBus interfaces.
>=20
> Signed-off-by: Fred Chen <fredchen.openbmc@gmail.com>

Sashiko has reviewed this patch and found no issues. It looks great!

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260707122701.7518=
78-1-fredchen.openbmc@gmail.com?part=3D2

