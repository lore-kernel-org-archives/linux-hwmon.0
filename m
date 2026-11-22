Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795333697;
	b=rJVJ8gRKFCLuRXjwc05IBp81qYuJP/ZAvWQBq3nD8UBdlOfwX96domt4SkVl6AVjQ892
	 4k0bkATR5AUW/F96eakMfuLtx2IbXWX420oADAYseRIIjmBazlGKQyFq1KavIoPxhZLom
	 PQ41Uxgqk6xEWKVuSjuhE86X8qGRxy9e1jGX/3vrEGYqJRA93OJ38qs+sZZCmW1wJR3CP
	 rh0X6Vpwif3nqKvt0Mxi5ATMigVUXQdQ7nk2USRP9USPeasRbNwn8juG080pXsm1ZT8k0
	 mCzZ2SSuW0NgMKOOfW8xTbNErh5t/1RcOiYklYMjMbkVOrdIDrEqpz4NvDFw78tIbQA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795333697;
	h=Received:DKIM-Signature:Message-ID:From:Subject:Reply-To:To:Cc:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date;
	bh=A1/pSccYvIP5551Tflk5EvkJV6Cs26aN6snGC9zL98E=;
	b=jjlZXA8Qbe6aDIWQ2Vz5eE0jivWp0fE7PmicmBQgFvcOD5QuBaC8MDYMysmXXA7L5kJ3
	 HgFh0uz6U++BmJbouetbdkDEfoTk1C8qVBn3XfSk39HG/PmE8cK8euxivMnvCCtRt+Q4Q
	 kwsc8ajVfvO17rYUJMsxRY2Zh6lvumqdj3wQmGtsbV7akWCQWBpz1i0htMgxY+U/plxln
	 0puXIucyliDaoAoYYYDOF1ES+fcUVLfZnGyo5Lb2YkPR4gdQaRAnicktGaevnPTmn9iSA
	 pI3fluxtq/OUwNpSXXMN//V4TJbgIO6ceXLVTGlP+/FC1CiXb0TUF5GA4IJto3ZSJZg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=YD++eDns;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DB4BA606A320
	for <linux-hwmon@vger.kernel.org>; Sun, 22 Nov 2026 07:48:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=YD++eDns
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5738C1F000C0;
	Sun, 22 Nov 2026 07:48:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795333697;
	bh=A1/pSccYvIP5551Tflk5EvkJV6Cs26aN6snGC9zL98E=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=YD++eDnsMll98A/eZdd3O+bBrvobuEa0DjGLRs3hXR+YJEXd3XcT2OL0myU2oxec9
	 zL5foSyV4kJDyt8UH2I/pBr2L7pC5W46IO1RZbpbC4uCKcGdDqd+vRkZc5IWCi7f1q
	 MOI5bf+9tt8bUHl08EbRJE4sp8VmkxpsuXEzBfRh/tgYR4uAvFVN4oUpcAGhk4J+OT
	 0rjpkwkJbPKmQGsuzw6ODbQTA8VCvmx1OaNmU+zGPLnj40xy7Byd/Av9vn3+24HLpT
	 ZyWOEPEEWCVIfIcayR6kuDkgKoHjlxL9b8gQG+1Yb1xLx6jLQJbinJSlASok2Lw4PE
	 AOQ0UCCowfmYg==
Message-ID: <sashiko-outbox-227794@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH 1/3] hwmon: (pmbus/core) Invalidate cached page and
 phase on failed change
Reply-To: sashiko-reviews@lists.linux.dev
To: "Felix Radensky" <fradensky@nvidia.com>
Cc: linux-hwmon@vger.kernel.org
In-Reply-To: <20261122073322.1712843-2-fradensky@nvidia.com>
References: <20261122073322.1712843-1-fradensky@nvidia.com>
 <20261122073322.1712843-2-fradensky@nvidia.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Sun, 22 Nov 2026 07:48:16 +0000
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Post: <mailto:linux-hwmon@vger.kernel.org>
List-Help: <mailto:linux-hwmon+help@vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-hwmon+owner@vger.kernel.org>
Precedence: list

Thank you for your contribution! Sashiko AI review found 1 potential
issue to consider:
- [Medium] hwmon: (pmbus/core) pmbus_set_page() updates cache outside
  conditional blocks
--

commit 03751a48b86432f4503eb9a4970150b29ef4ab2c
Author: Felix Radensky <fradensky@nvidia.com>

hwmon: (pmbus/core) Invalidate cached page and phase on failed change

This commit resets data->currpage and data->currphase to -1 in
pmbus_set_page() before issuing PMBUS_PAGE and PMBUS_PHASE commands so
that a failed transfer forces a retry on the next access.

> diff --git a/drivers/hwmon/pmbus/pmbus_core.c b/drivers/hwmon/pmbus/pmbus=
_core.c
> index 82dac2c6c579f..dae56e2e6f21f 100644
> --- a/drivers/hwmon/pmbus/pmbus_core.c
> +++ b/drivers/hwmon/pmbus/pmbus_core.c
> @@ -227,6 +227,9 @@ int pmbus_set_page(struct i2c_client *client, int pag=
e, int phase)
> =20
>  	if (!(data->info->func[page] & PMBUS_PAGE_VIRTUAL) &&
>  	    data->info->pages > 1 && page !=3D data->currpage) {
> +		/* A failed page change can leave the chip on any page */
> +		data->currpage =3D -1;
> +
>  		pmbus_wait(client);
>  		rv =3D i2c_smbus_write_byte_data(client, PMBUS_PAGE, page);
>  		pmbus_update_ts(client, PMBUS_OP_WRITE | PMBUS_OP_PAGE_CHANGE);
> @@ -246,6 +249,9 @@ int pmbus_set_page(struct i2c_client *client, int pag=
e, int phase)
> =20
>  	if (data->info->phases[page] && data->currphase !=3D phase &&
>  	    !(data->info->func[page] & PMBUS_PHASE_VIRTUAL)) {
> +		/* A failed phase change can leave the chip on any phase */
> +		data->currphase =3D -1;
> +
>  		pmbus_wait(client);
>  		rv =3D i2c_smbus_write_byte_data(client, PMBUS_PHASE,
>  					       phase);

[Severity: Medium]
Should data->currpage =3D page and data->currphase =3D phase be moved inside
their respective conditional blocks?

Because both assignments remain outside the if blocks:

drivers/hwmon/pmbus/pmbus_core.c:pmbus_set_page() {
	...
	data->currpage =3D page;

	if (data->info->phases[page] && data->currphase !=3D phase &&
	    !(data->info->func[page] & PMBUS_PHASE_VIRTUAL)) {
		...
	}
	data->currphase =3D phase;
}

any call that skips the SMBus write still overwrites the cached value
(including an invalidated -1) without programming the chip.  For example,
on a multi-page device where page 0 has phases and page 1 has
info->phases[1] =3D=3D 0 (such as tps53681), if a phase change to 0xff on p=
age
0 fails (leaving currphase =3D=3D -1), an access to page 1 with phase 0xff
skips the PMBUS_PHASE write but sets currphase =3D 0xff.  A subsequent acce=
ss
to page 0 with phase 0xff then sees currphase =3D=3D phase and skips sending
PMBUS_PHASE, accessing the wrong phase on the chip.  The same happens for
currpage when accessing a page with PMBUS_PAGE_VIRTUAL set.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261122073322.1712=
843-1-fradensky@nvidia.com?part=3D1
