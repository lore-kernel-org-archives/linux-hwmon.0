Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 10A7E3264EF;
	Wed, 10 Jun 2026 15:24:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781105056; cv=none; b=rnfnVT9/X9Iky8tzBP3NxvKfg7K8VVbfwm5AMEErP/BYm6mNQuIR4bDkNSrMW01zv+3gDzne+197MSUzNEX7j/QEhDOprMdK9t8L6cks/t4POU/PoX9bvwnX7mKWrvvNNxpFESdCV3MW+yjEjV4uzdH2jz/aHSBFKUWk2KLIFhs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781105056; c=relaxed/simple;
	bh=BJuK9kwni8qBU6p6SXRoQgD1FOCWkZNkazcw1n718sA=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=f896HBjOVD8UOGEKBVCVNMOOFAdlp1rGsdzhVUxKp1aVQLFJmiH1Ep6OpdoIoRGdg0WUIhrTS3EI9M+Q03pdpNk38IyHi3Qnncl4DlR3LoWTh7R5nRWtXuVeS5dSmk8TJgkleLWdbDJQzLS4P+fVOGY1zfL3d/R5/MZ47/mFIAE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=bv9l36Or; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="bv9l36Or"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B502F1F00893;
	Wed, 10 Jun 2026 15:24:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1781105054;
	bh=NGrCtNcthl7bLbYvYkyeOQLb1Gq5xm78jI9bMuqILvc=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=bv9l36Or4x6/+rKllVdhxBLz5RkQCQNQizuO30uNsSsaA6ijkMdegbPYTSbt0wnNP
	 JbmzKTeQfQaExi4EAME6VcZdHf2nNcT0AyTBccOlu3P5cM//eLAN4ZBkZAt0kZOzBf
	 /y/tlRa+FrAxJnMDCipsxqYUcz2VScsfXz/zq2E79kRvCvRp2kKqCvfLKY3ZyclC3r
	 qUFpF7fIcf1/78Rv+3xjIkL9KMOY7FWtWuGX1g4ZN5fkCkWQsyxX+0SZtRmflE18PE
	 71IGtA1pl+12SwhK9FT30svby3nwH2agLX3+XBpo6cUiz6xBmhAdausD3R9aEFUq6K
	 CrgyeLqGjWXjg==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v11 1/2] dt-bindings: hwmon: temperature: add support
 for EMC1812
Reply-To: sashiko-reviews@lists.linux.dev
To: "Marius Cristea" <marius.cristea@microchip.com>
Cc: robh@kernel.org, linux-hwmon@vger.kernel.org, devicetree@vger.kernel.org, conor+dt@kernel.org
In-Reply-To: <20260610-hw_mon-emc1812-v11-1-cef809af5c19@microchip.com>
References: <20260610-hw_mon-emc1812-v11-1-cef809af5c19@microchip.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Wed, 10 Jun 2026 15:24:13 +0000
Message-Id: <20260610152413.B502F1F00893@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>

> This is the devicetree schema for Microchip EMC1812/13/14/15/33
> Multichannel Low-Voltage Remote Diode Sensor Family. It also
> updates the MAINTAINERS file to include the new driver.
>=20
> EMC1812 has one external remote temperature monitoring channel.
> EMC1813 has two external remote temperature monitoring channels.
> EMC1814 has three external remote temperature monitoring channels and
> channels 2 and 3 support anti parallel diode.
> EMC1815 has four external remote temperature monitoring channels and
> channels 1/2  and 3/4 support anti parallel diode.
> EMC1833 has two external remote temperature monitoring channels and
> channels 1 and 2 support anti parallel diode.
> Resistance Error Correction is supported on channels 1/2 and 3/4.
>=20
> Signed-off-by: Marius Cristea <marius.cristea@microchip.com>

Sashiko has reviewed this patch and found no issues. It looks great!

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260610-hw_mon-emc=
1812-v11-0-cef809af5c19@microchip.com?part=3D1

