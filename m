Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 614FB399345
	for <linux-hwmon@vger.kernel.org>; Thu, 14 May 2026 09:43:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778751795; cv=none; b=fpbpar3UOnnOL0Q7qbhhSgKeFu/WK/1t6xg+lgVotpAFE7pCF3f0zp5QuKxLKcbebfawxi+w1NVdL5dsrbrUqbA2LExjsyiWTm2Qjj04/68aoyUD8TG8nVc8+0yQKao8Ve5rwiEt7+GIdDMdYq183+UfqAqrCGIQY/xRQtlCHQk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778751795; c=relaxed/simple;
	bh=h73cplhBvHtb82YILK2O5vrB+IkArKG/pVF4VU/Aofc=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=PnW7Ccypqe4pmdErVqE4iqB3oIfd2hwY5ZRI9lW/2WyeEareoIgPpgfxYlng/vpyFAAo/c6r15lRcD87QBw7J5GTS9LqNPqc16oU7o38y3BIAKJMZBsR6VtJf80fp7Qx567e18nsXKo4Q9dBibVfxpAtHxdFQOqecYAAkYtci60=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=LEMxDJOH; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="LEMxDJOH"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E2BABC2BCB3;
	Thu, 14 May 2026 09:43:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1778751795;
	bh=h73cplhBvHtb82YILK2O5vrB+IkArKG/pVF4VU/Aofc=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date:From;
	b=LEMxDJOHIf0Pq+uvupci/BtHKR1nfd9XyZd94NggWgcIwgU/9AIrseF66tSCvfKUR
	 n/D9nPA+7A2liHryjgn9slejnadQcAljX8kZxM7q8mRCErwzSl45NWeBkEMdEI6HSk
	 sIj8VmlMaMEHx5CG7B3JAGDUPF3x6rMTjGhXXQgoM/FchDeZMOi4RbGnzrXazOXu81
	 ImxQGvMCekajvU5I50nsNu2nIXlZZdCKB3JwdUlWp3+2Y41N0/m5jpfLo6zutpr4CK
	 ZD3EF/IZyHBF9CaXcYTM8XF+BIw8Eap/d/M9Y0SJa3x8L+PgrcrSfeNFrOSG+Rpaq/
	 blb1xwqpG0BWA==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v2 4/5] reset: reset-scmi: Log number of reset domains
Reply-To: sashiko-reviews@lists.linux.dev
To: "Alex Tran" <alex.tran@oss.qualcomm.com>
Cc: linux-hwmon@vger.kernel.org
In-Reply-To: <20260513-scmi-client-probe-log-v2-4-36607e9dd540@oss.qualcomm.com>
References: <20260513-scmi-client-probe-log-v2-4-36607e9dd540@oss.qualcomm.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Thu, 14 May 2026 09:43:14 +0000
Message-Id: <20260514094314.E2BABC2BCB3@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [Low] The dev_dbg() statement uses the '%d' format specifier to log `data=
->rcdev.nr_resets`, which is defined as an `unsigned int` in `struct reset_=
controller_dev`. The correct format specifier should be '%u'.
--

commit 7bce3db3196b0adcbf2826ecbc55698c8ce2e8f5
Author: Alex Tran <alex.tran@oss.qualcomm.com>

reset: reset-scmi: Log number of reset domains

This commit updates the SCMI reset driver to log the number of reset domains
discovered from firmware during probe.

> diff --git a/drivers/reset/reset-scmi.c b/drivers/reset/reset-scmi.c
> index 4335811e0cfaa..114470c12931f 100644
> --- a/drivers/reset/reset-scmi.c
> +++ b/drivers/reset/reset-scmi.c

[ ... ]

> @@ -111,7 +112,12 @@ static int scmi_reset_probe(struct scmi_device *sdev)
>  	data->rcdev.nr_resets =3D reset_ops->num_domains_get(ph);
>  	data->ph =3D ph;
> =20
> -	return devm_reset_controller_register(dev, &data->rcdev);
> +	ret =3D devm_reset_controller_register(dev, &data->rcdev);
> +	if (ret)
> +		return ret;
> +
> +	dev_dbg(dev, "Initialized %d reset domains\n", data->rcdev.nr_resets);

This isn't a bug, but does this dev_dbg() statement use the wrong format
specifier?

The nr_resets field in struct reset_controller_dev is an unsigned int, so
should it use %u instead of %d?

> +	return 0;
>  }

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260513-scmi-clien=
t-probe-log-v2-0-36607e9dd540@oss.qualcomm.com?part=3D4
