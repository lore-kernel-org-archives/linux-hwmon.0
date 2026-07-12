Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ABDD8373C04
	for <linux-hwmon@vger.kernel.org>; Sun, 12 Jul 2026 08:14:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783844053; cv=none; b=aZk9PADweFoQjOcmaNZhGi1QtMlxDT3Hsa0l3K9Ij4hvKuLeJp2qdEuh/kTdOZoOWZ3cnclEr0FT53kr6vOi5Q6iJyMarpEPQlhdgE6SJQmZRlsWstBcHOCdSo7k8/SOz8XHUAhPjWte1+nEOJrj4O5xhQI3wpL4eI78QpvoKVA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783844053; c=relaxed/simple;
	bh=NhteXlmxAua0vyYYGTooKx5/AUjQGVz2B/1cQqFVs9s=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=jCFWl57oZp5PPa0PWuTRXr+s3qhhV3AAu/+UvLGvmy60bbolmARyoyCpFTGENrtKRNV9JbT5zHteaHtBmFxSHsBRLvzYBqbVjDxbVhCDnDyZNc4/9QsRVou/ImC0ZzErFJ75RnxKScsecx/nupoAcRr3Xq9fboHBBNWUKIb8drk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=D7ASgVWz; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="D7ASgVWz"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 20EC81F000E9;
	Sun, 12 Jul 2026 08:14:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1783844052;
	bh=QH+oHUMX0CkkKhNQr6VMwI0fQrTENyckS/9dJFrllTU=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=D7ASgVWzAS11OzMc0+4hi+8+BY6Z60I7VVMnh9ldwbKX9Rma0wefCx+/ILa5W07GH
	 YNEcHn8tdF5D0uY7LRhRMuPXBqF/2T6XfiHjDPsMJCZ/z4o7aOaqDRLYCcqc35MdJD
	 JpeBR+DCpYPHjXwczkGl1C6s4wNIyV7e+RnASbjNiXNYltwWfyuM/pTkSzM1rOU3ZW
	 irl/vH+VjtF4pu+tjQ0k8CmYMD7td2ZmSOsJDkxDIyKgMiBxPIJp0NxFpCemDWnQqr
	 6ionwDCqZ16yz1Xu9K1DiT/tNg7jpVu41beT2bTRe+0KhDsObC7Vi2VlKev7Ulidq5
	 E3+rgnPRDld1w==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH] hwmon: (peci) Fix kernel-doc parameter names in
 common.h
Reply-To: sashiko-reviews@lists.linux.dev
To: "Babanpreet Singh" <bbnpreetsingh@gmail.com>
Cc: linux-hwmon@vger.kernel.org
In-Reply-To: <20260712081258.7-1-bbnpreetsingh@gmail.com>
References: <20260712081258.7-1-bbnpreetsingh@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Sun, 12 Jul 2026 08:14:11 +0000
Message-Id: <20260712081412.20EC81F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>

> scripts/kernel-doc -Wall -none reports:
>=20
>   Warning: drivers/hwmon/peci/common.h:39 function parameter 'state' not
>   described in 'peci_sensor_need_update'
>   Warning: drivers/hwmon/peci/common.h:39 Excess function parameter
>   'sensor' description in 'peci_sensor_need_update'
>   Warning: drivers/hwmon/peci/common.h:49 function parameter 'state' not
>   described in 'peci_sensor_mark_updated'
>   Warning: drivers/hwmon/peci/common.h:49 Excess function parameter
>   'sensor' description in 'peci_sensor_mark_updated'
>=20
> Both peci_sensor_need_update() and peci_sensor_mark_updated() take a
> pointer to struct peci_sensor_state named 'state', but their kernel-doc
> comments document a parameter named 'sensor' and describe it as a
> pointer to the sensor data struct. The comments have been out of sync
> with the code since the file was added by commit bf3608f338e9 ("hwmon:
> peci: Add cputemp driver").
>=20
> Update the kernel-doc comments to document the 'state' parameter.
>=20
> No functional change.
>=20
> Assisted-by: Claude:claude-sonnet-5
> Signed-off-by: Babanpreet Singh <bbnpreetsingh@gmail.com>

Sashiko has reviewed this patch and found no issues. It looks great!

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260712081258.7-1-=
bbnpreetsingh@gmail.com?part=3D1

