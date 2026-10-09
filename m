Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3C76B4E4320;
	Fri,  9 Oct 2026 12:02:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791547340; cv=none; b=BNjE7V3V4U1bfpTbDbs6w2WmRaks+gF7wf4HlqZo5CoL+4WGDYuXQMCHXlF7HGkJBOSFmNCSIg76YWZ01/DsMp2pS4/O87SnORFOLxwDEYPE9jwQFaqzA1KgJlHSe51HmVb1++0fljhygVZk68p2yhE5IVDgXqkO15AwOqDd7gE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791547340; c=relaxed/simple;
	bh=a5qiRNAjV/V5oy9f2vAIV6/+cZAWljz91uLjRONX6c4=;
	h=Message-ID:From:Subject:To:Cc:In-Reply-To:References:Content-Type:
	 Date; b=cXdkBrH9gSjhyVECbbb2hs8vPZqgUCq/jNWx87Rrv7T5fFY1sZmEbjxgrHSxjfwEYOURJZyqzXfxeoikQgbhYfEqUxCWS/PmaMGikpx0AkjBpmQrjQPjF7P8p0IwLncTGjztZkKVhS3YJJIAG5JTa6NRa9A+gCaouTfqzJ6q26w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Ez4J1OPn; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Ez4J1OPn"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E66E71F000FF;
	Fri,  9 Oct 2026 12:02:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1791547334;
	bh=a5qiRNAjV/V5oy9f2vAIV6/+cZAWljz91uLjRONX6c4=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=Ez4J1OPnTDCHTveWya+j/6iFbC70134C/F8PfKe0j4MSkh2ddDgSHfBdjiWuomu4V
	 px5ekntmz8Q83DIpn2P30WX/fYVfVURAdE06PDiaqfpogGpHaZhSoGSG7ESSCsQJuI
	 EaJjkOZ2MWjNFv6Zca/vNW93SkEf/09Q3FyRs1b1GIMW9oR1LSnrwcl1iGartGwhLV
	 zwKbWJBa+Tz9+LalB49JAzedxEBagE4GY802ZFZ1SxEIQfB+hNCTLidT5Rti0tR1EW
	 oR6Abn8GQOghpffso6W9lxDaPQwhCm4xj1b5HuTndm7FvvU6Ogwapbx9o4MDXoIObR
	 fMi1DubmhPeAQ==
Message-ID: <sashiko-outbox-165466@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v3 2/3] hwmon: (lm75) add MAX31875 documentation
Reply-To: sashiko-reviews@lists.linux.dev
To: "John Erasmus Mari Geronimo" <johnerasmusmari.geronimo@analog.com>
Cc: linux-hwmon@vger.kernel.org, devicetree@vger.kernel.org, conor+dt@kernel.org, robh@kernel.org
In-Reply-To: <20261009115617.1976-3-johnerasmusmari.geronimo@analog.com>
References: <20261009115617.1976-1-johnerasmusmari.geronimo@analog.com>
 <20261009115617.1976-3-johnerasmusmari.geronimo@analog.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Fri, 09 Oct 2026 12:02:13 +0000
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>

> Document the Maxim MAX31875 I2C temperature sensor as a supported
> chip in the lm75 driver documentation.
>=20
> Signed-off-by: John Erasmus Mari Geronimo <johnerasmusmari.geronimo@analo=
g.com>

Sashiko has reviewed this patch and found no issues. It looks great!

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261009115617.1976=
-1-johnerasmusmari.geronimo@analog.com?part=3D2

