Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C9380493D54;
	Fri, 11 Sep 2026 14:00:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789135204; cv=none; b=covhoujufOEfIkJMRUULX9OI9sJ4mwQ5dBpDEwabC1aRqfnU/wYuCRwgculWBeP5fPYeOD5uuBu5H6F7lfKbFf9OCb6KeJMpX+dvewAcbbxueHic4y9V6pryAHeRHW9K2bcAj1uahxZNSeyaxYdMatDoqQjHmCoWL3MAjjPpmBg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789135204; c=relaxed/simple;
	bh=1zdElfbT6fuBB7nVR3A1GsNdFTaIjencuWS04atsJ0Y=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=DJXAw7kC6cn7UM3UadM+muR3EV0k8TSGUTUzufx6+p1LLzSxxneVc4k/a3RgFDwVbIixXGLQ43rUjh92Q9cjcfK+UFaxJJLrnnzNgFzw/4A0bI5P0+IBZn25yw1t2wgBjy93JTvqwT28BgdSfDetM36nvHiKGe1dBOZRxFyX1x4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=YVjWgfDq; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="YVjWgfDq"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 511891F000FF;
	Fri, 11 Sep 2026 14:00:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1789135203;
	bh=1zdElfbT6fuBB7nVR3A1GsNdFTaIjencuWS04atsJ0Y=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=YVjWgfDqb8IsDw4t0SrEm3g/c3YH+58ru9PlJR261ig7RKRDyes/DNWOfp+05FXb9
	 v3Gs2DkA/n9b56Aq4fWd3F7zxw6QhYXg+0jBXsNdwaU+QhYf9U48DIW0YyiKYNusMN
	 2bQGmntpjFRlPd2nGBLi2WuAXPopoqmEoAFU47dq2fdxosKPKwPIeuGo31g2iVCx8f
	 nShes3sywdhKLPuJsCzNLXtQa1bWdPvCsZR3jxbR7yqRrs/uK1nGFV7gJ13bQyyP3N
	 lRM/CabwyT/H9Vqo9o/o6p9smjZwJ4+yqRLLjitu0jtzDq/f5/uZn48yNknOW2EJ5J
	 rE1sPMSVoy2xQ==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v2 3/4] dt-bindings: hwmon/pmbus: Document MAX20826 and
 similar devices
Reply-To: sashiko-reviews@lists.linux.dev
To: =?utf-8?b?TnVubyBTw6E=?= <nuno.sa@analog.com>
Cc: conor+dt@kernel.org, robh@kernel.org, linux-hwmon@vger.kernel.org, devicetree@vger.kernel.org
In-Reply-To: <20260911-hwmon-max20826-support-v2-3-5e30cbd97d84@analog.com>
References: <20260911-hwmon-max20826-support-v2-0-5e30cbd97d84@analog.com>
 <20260911-hwmon-max20826-support-v2-3-5e30cbd97d84@analog.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Fri, 11 Sep 2026 14:00:02 +0000
Message-Id: <20260911140003.511891F000FF@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>

> The MAX20826 IC and similar provide a high-density, flexible and scalable
> dual-loop solution for high current cores for AI applications. These are
> dual loop solutions multiphase voltage regulators. Between Rails A and B,
> MAX20855B and MAX20908 supports up to 8 phases total configurable from
> 8+0 to 4+4 phases, MAX20912 supports up to 12 phases from 12+0 to 6+6,
> and MAX20826 and MAX20916 supports up to 16 phases from 16+0 to 8+8.
>=20
> The output voltage of each rail is controlled either through PMBus or
> through the high-speed processor voltage-control interface (Intel SVID,
> AMD SVI3, Nvidia PWMVID or AVSBus, depending on the device). Which one is
> in use is part of the configuration the device powers up with and is read
> back from it, hence adi,rail-a-high-speed and adi,rail-b-high-speed only
> tell whether the high-speed interface or PMBus controls the output voltage
> of the respective rail.
>=20
> Co-developed-by: Alexis Czezar Torreno <alexisczezar.torreno@analog.com>
> Signed-off-by: Alexis Czezar Torreno <alexisczezar.torreno@analog.com>
> Signed-off-by: Nuno S=C3=A1 <nuno.sa@analog.com>

Sashiko has reviewed this patch and found no issues. It looks great!

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260911-hwmon-max2=
0826-support-v2-0-5e30cbd97d84@analog.com?part=3D3

