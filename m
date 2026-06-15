Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6FA8F3B2D06
	for <linux-hwmon@vger.kernel.org>; Mon, 15 Jun 2026 07:00:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781506810; cv=none; b=kKZWad5dInIuWgXcSQocZ1wlTXHomSilNhDYhjDiSckLyUzkL9HzQFAjCjcv1uHy+6yu9zmtUW7rWGnp1hycbjUOtoHvbbrKLDtVWaJqgnS3PQ6okkFu9EBU4Nxpas9o/pUBMADJJoZQlkoXKJ/HxWiw1U5XEq/dVQ4LQ6UvEks=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781506810; c=relaxed/simple;
	bh=UbdEVRPvoRMrRDcFPrMcvS3k4JECypYbXMfO6K3yj2s=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=sBo93stBJ9Xlc9a/rO6bxq7JMpilcT3BykzEwOmQqKP0WyThzSrTEZJIge/R+XPQNGXwg9g0Ei5xzF8NrRxn7FxkbhPQbz3Vrok3aU1gOMusJmyGJ9ffSHZihF3EUGhHqeOKyUf2nwxFcPYQavjclVZD/RWxZclucjEeg6Wi8rE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=cgvDtwdz; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="cgvDtwdz"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E797C1F00A3D;
	Mon, 15 Jun 2026 07:00:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1781506808;
	bh=cMDZRX9emGw+9DnSPh0N6XXVVsOFDcUpcBYjftWAJNM=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=cgvDtwdzau6arJizsGjSifLUQGGw+A+BrxNMsPL74ObWy8QYjlg7FficEwcu0TkoZ
	 wh9YmidES+ehbBfWEzbHscWtHdcYZCbwzBLfbogeecugdiReka6+xW/8++9Pd0S9Bv
	 NJiHK0iBcWAu0jBd5HtUaoWTUHmD74gCYkW6qpHVvHxDFr4eF8ZO5cy2sUZ427vkPW
	 XtWj65oDacHDbp2iJ+SKBRfGFggwEbFX1AIexE1BA+/EWx7Ml8U6ATxtji741Iyuda
	 0eSScVnrQ6hUdFaK5NEZdrXXEsmMFYwkmMqacci1K8aDCysQtlCKz54wLzH/H1VrXX
	 IFPf0mANQG0bA==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH] hwmon: (ibmaem) clean up sensors if version sysfs file
 fails
Reply-To: sashiko-reviews@lists.linux.dev
To: "Pengpeng Hou" <pengpeng@iscas.ac.cn>
Cc: linux-hwmon@vger.kernel.org
In-Reply-To: <20260615064636.39215-1-pengpeng@iscas.ac.cn>
References: <20260615064636.39215-1-pengpeng@iscas.ac.cn>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Mon, 15 Jun 2026 07:00:07 +0000
Message-Id: <20260615070007.E797C1F00A3D@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:

Pre-existing issues:
- [High] Potential 32-bit and 64-bit integer overflows in sysfs `show` func=
tions resulting in wildly incorrect hardware monitoring readings.
--

commit 0fde2ac7a1ed37ce0511233683af672cca757cdd
Author: Pengpeng Hou <pengpeng@iscas.ac.cn>

hwmon: (ibmaem) clean up sensors if version sysfs file fails

The aem_register_sensors() function publishes dynamic sensor files and the
name sysfs file before creating the version file. This commit adds error
handling to route a version-file creation failure through the same cleanup
path used by earlier sysfs creation failures, preventing leaked backing sta=
te.

> diff --git a/drivers/hwmon/ibmaem.c b/drivers/hwmon/ibmaem.c
> index 0a9c3a29e6f2d..305c41dd15bb9 100644
> --- a/drivers/hwmon/ibmaem.c
> +++ b/drivers/hwmon/ibmaem.c
> @@ -945,6 +945,9 @@ static int aem_register_sensors(struct aem_data *data,
>  	if (err)
>  		goto error;
>  	err =3D device_create_file(dev, &sensor_dev_attr_version.dev_attr);
> +	if (err)
> +		goto error;
> +
>  	return err;
> =20
>  error:

[Severity: High]
This isn't a bug introduced by this patch, but while reviewing this file, I
noticed a potential 32-bit integer overflow in aem2_show_pcap_value():

drivers/hwmon/ibmaem.c:aem2_show_pcap_value() {
...
	return sprintf(buf, "%u\n", a->pcap[attr->index] * 100000);
}

Does a->pcap[attr->index] * 100000 perform a 32-bit multiplication that eas=
ily
overflows for valid high-end server power caps? Since a->pcap is a u16 in
deciwatts, any value over 21474 dW (2147.4 W) multiplied by 100000 will
overflow a 32-bit signed integer.

[Severity: High]
This is also a pre-existing issue, but I noticed another potential 64-bit
overflow in aem_show_power():

drivers/hwmon/ibmaem.c:aem_show_power() {
...
	delta =3D (after - before) * UJ_PER_MJ;

	return sprintf(buf, "%llu\n",
		(unsigned long long)div64_u64(delta * NSEC_PER_SEC, time));
}

Can delta * NSEC_PER_SEC overflow 64 bits here? Because aem_set_power_perio=
d()
lacks an upper bound check, a user can configure a large polling interval.
For example, a 60-second interval at 1000 W generates an energy delta of
60 billion microjoules. When multiplied by NSEC_PER_SEC (1,000,000,000), th=
is
value overflows a 64-bit unsigned integer, leading to incorrect power usage
reporting.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260615064636.3921=
5-1-pengpeng@iscas.ac.cn?part=3D1
