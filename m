Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F2EEA2C0F93;
	Thu, 11 Jun 2026 14:13:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781187210; cv=none; b=qFiMTB5xKOcB9E4KKrHoJB9p4r18AJZHFl0/Fptu7Roa5e4tvpZwGHWrPt5nCprfVCJx+Ceb7Q6MpnA5xgszClvSuMLD2YB9UfxMKL/QSK8OtS4r2FI2zPs9KXeS/eMfqJrBKbKXquFYQQhkM6b5HcKrpWjgxcOobKlos6BcTzo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781187210; c=relaxed/simple;
	bh=hnGXitECXlwp9XtmvWfh2pp05QNuSAQmZeYC9z4Xp3U=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=e3RTy3VQxajPcLunza6BfLLzdiUiSs/d7AKV7HhJAz6LLMbelDm0zrWvOSge+VmtrxBEysWPTQS7LMDKdcL+JN1bmqn1BfPFRG+Xop5s9L4dznd/twqm2Y7eYQYRMxT2IpslDvrATUAf2ba0GjcAcIvdzADBZqQyYdje6DOD3bY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=MCbGFH1c; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="MCbGFH1c"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 216811F00893;
	Thu, 11 Jun 2026 14:13:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1781187209;
	bh=hnGXitECXlwp9XtmvWfh2pp05QNuSAQmZeYC9z4Xp3U=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=MCbGFH1cYiF+2XxhrZDcscDib4Uzn1n4nTiSVysS9skCHoM5IAYm1xFZCxJqxc9++
	 mQvYYflUlKIHFR/HMEpJUhWfkGihndcY4jKBkk/qB0SLmOYEkxT7DrSGIHg1fPJs8D
	 K43ZXAZdMjsTDyaZgWJVFnzw0ir11fCL9uLd0NznXQutvwWTSIsmM2omE1lZ7McXPD
	 8mpZ6WYG8yEqkHd5iDIszrnm9a6J3Dd0VFD9lGtn/cRO5ITq+EwRXyS8QcEPPRNEnC
	 80ULAZj/ppTjxObvyyygbq17BTG8Mc92QBmEKHE/JcPzjXYfrLp1fYdwKRjsZgYpNs
	 vU4UjGHHUs6bQ==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v2 1/3] dt-bindings: hwmon: ina2xx: add ina232
 compatible
Reply-To: sashiko-reviews@lists.linux.dev
To: "Loic Poulain" <loic.poulain@oss.qualcomm.com>
Cc: robh@kernel.org, conor+dt@kernel.org, linux-hwmon@vger.kernel.org, devicetree@vger.kernel.org
In-Reply-To: <20260611-monza-ina232-v2-1-e4375ce652d0@oss.qualcomm.com>
References: <20260611-monza-ina232-v2-1-e4375ce652d0@oss.qualcomm.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Thu, 11 Jun 2026 14:13:28 +0000
Message-Id: <20260611141329.216811F00893@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>

> From: Martino Facchin <m.facchin@arduino.cc>
>=20
> The INA232 is a current/power monitor from Texas Instruments sharing
> the same register map as the other INA2xx.
>=20
> Signed-off-by: Martino Facchin <m.facchin@arduino.cc>
> Signed-off-by: Loic Poulain <loic.poulain@oss.qualcomm.com>

Sashiko has reviewed this patch and found no issues. It looks great!

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260611-monza-ina2=
32-v2-0-e4375ce652d0@oss.qualcomm.com?part=3D1

