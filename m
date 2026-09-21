Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 95D704ABBC1;
	Mon, 21 Sep 2026 14:54:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790002489; cv=none; b=aEL+wNE61h0lKk/pUQHr0BsKhnx9twLGpQoh+oFMWxJ0BIYro1MLzx5A+NXL3hWBKMnRUTdxKcBdagGbZ4Esk+a5eKYW3R+x+d+YF/LsKloxohDKY4p4o9J5Sy0ea00tFXUNnUXFjoiDm575GnzgJSh+aOeydVc7UCb5kQbdhHo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790002489; c=relaxed/simple;
	bh=DrmV/G/ib9v5SBGJ8OA/MpPwpFB1ILIA8aNYoXidOl0=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=L4s1CTfQvRz+GvcaNNt4bEb0k9ORFh2KEo6P5zYTiLgHyZ3/eJ+VaBi06By5TmJyqFm/Zm9/e7ZpsGLPrhBjmKX/Fe6k42rguH/GuNO3pBImHHn2vbD/FTFpHRHFZb9M6Ybvqtm/aTL6Ztz7w0GJr/SILv5MZqsHOIUutjT8uY4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=UyCpHhnI; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="UyCpHhnI"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B41781F000FF;
	Mon, 21 Sep 2026 14:54:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1790002488;
	bh=DrmV/G/ib9v5SBGJ8OA/MpPwpFB1ILIA8aNYoXidOl0=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=UyCpHhnILVAGfAsrjK/5a+Gm7U8++jjsCStnXcjOxqfcRHxDqBH2YoENJPTcHkX6W
	 0MSk4M1HOGQUereVv5RtN9WIJsQq8JRZf8V3cY0PsglPLXDfAcDEkvrQdlHtDbvBjH
	 XQRzAoyxSDGVhV5VMkpOr1GMGTu7y3CI4mzG9TQmUleGOlS46d/IKv1rV7mVJLRjW9
	 6CT3rDHwru7SeVfHaKiCobxM0UEM0E1pl2zL+e9NoQOnTc/oj1DOfpP4w6yn1vkfeI
	 d9hMbEcsmSt4ILPqVUZatW9n5E0YooCvw4aHfbPSfCB5FajtuYYFhDz8cIFUV1ROzE
	 c1H0pxkImstmA==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v3 1/3] dt-bindings: embedded-controller: add Lenovo
 Yoga Slim 7x Gen 11 EC
Reply-To: sashiko-reviews@lists.linux.dev
To: "Oleg Keri" <okerixx@gmail.com>
Cc: conor+dt@kernel.org, robh@kernel.org, devicetree@vger.kernel.org, linux-hwmon@vger.kernel.org
In-Reply-To: <20260921144953.15113-2-okerixx@gmail.com>
References: <20260921144953.15113-1-okerixx@gmail.com>
 <20260921144953.15113-2-okerixx@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Mon, 21 Sep 2026 14:54:47 +0000
Message-Id: <20260921145447.B41781F000FF@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>

> Document the Compal embedded controller found on the Lenovo Yoga Slim 7x
> Gen 11, a Qualcomm Snapdragon X2 Elite (glymur) laptop. It sits on I2C at
> address 0x70 and is distinct from the Qualcomm reference EC that the
> reference designs place at 0x76.
>=20
> Signed-off-by: Oleg Keri <okerixx@gmail.com>

Sashiko has reviewed this patch and found no issues. It looks great!

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260921144953.1511=
3-1-okerixx@gmail.com?part=3D1

