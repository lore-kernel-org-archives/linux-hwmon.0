Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F1E5C45C6EA
	for <linux-hwmon@vger.kernel.org>; Fri, 21 Aug 2026 12:01:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787313710; cv=none; b=tVTB8cIUbpWMFvJ2X3qN+eU2gHe/gsCnQOfjVh5AMWbd868hG5YrtnVQ6xX07BV+vyn4iQQhfkqu8bMjmhpSjcGSgFL22UYAne+6ECTvcOFiMjE3MoiN2/slTW3fTGDdVageelTzwOH6hrrFqzdPbejQFXzZPvOBRs+nWmid2f8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787313710; c=relaxed/simple;
	bh=O+S4VKeBW7OGb/k30wvLGHhDGBYLin98X2Tu0GszZEs=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=ZdStELj7LwqItNE0n6E008MfwJPKYkGPwX6mnv+Jp+LFh1dCIPP/S/+roWeJE9P9frfNzl0UpMI/VG+Dkc3/1fJ+EH+kIVih+uIjy9ToAB+ZKPQ/YRv4wEtUIFTaG+YXyZ9A3RyWXuBNCmJy+DKdV7xiidriqL1eHOBNHKgheGQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=oOIM3iCP; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="oOIM3iCP"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 80A671F000E9;
	Fri, 21 Aug 2026 12:01:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1787313706;
	bh=/RzNGwSH/AngSF+2ZE7UAijMKAOs3VLeFWFjialdmCU=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=oOIM3iCPvEa21BO2G+heP5P1ADZGBe43TSpARkW5EjhCxKhJ7v5EawCQUpinVnjzo
	 QoUxJESyYEE+1fHGAgOM+RTwo16qgxlUz+kfywCF0CxcqVvd8/VlYCEeD4fM1WsOTx
	 MdNjbuN2NGh68hG9twlfXEK2InOQPtGjTrY/o7RqXl5T3w32cBW9Ehh4kDISQjGGib
	 XDJKttKugs7UOVdFs7afYY1XXTDV7jIlgWHepRPE19HHiV0hL3WdPLXytx/e20wwZD
	 t9EN/2fsu763hRZiCg5qIMRniEQXJgHZb+A3MsmEjtuBsLJYaS/HVE84vZD8YwXHKK
	 23AAXdl5Od+hw==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH] hwmon: (yogafan) fix non-kernel-doc comment
Reply-To: sashiko-reviews@lists.linux.dev
To: hanzhijian <hanzhijian1991@gmail.com>
Cc: linux-hwmon@vger.kernel.org
In-Reply-To: <20260821115720.2017516-1-hanzhijian1991@gmail.com>
References: <20260821115720.2017516-1-hanzhijian1991@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Fri, 21 Aug 2026 12:01:45 +0000
Message-Id: <20260821120146.80A671F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>

> The file description comment starts with "/**" which is reserved for
> kernel-doc comments, triggering a kernel-doc checker warning.  Change
> it to a plain "/*" comment since it does not document any function or
> struct.
>=20
> Signed-off-by: hanzhijian <hanzhijian1991@gmail.com>

Sashiko has reviewed this patch and found no issues. It looks great!

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260821115720.2017=
516-1-hanzhijian1991@gmail.com?part=3D1

