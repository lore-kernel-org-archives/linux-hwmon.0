Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ECA6E3B27C4
	for <linux-hwmon@vger.kernel.org>; Thu, 14 May 2026 07:36:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778744200; cv=none; b=BzzterFp1ypnTQz/aAaqDFPcyniCv7XURdPschTcqU1YC5Vlj3BTQ2n0LcX76Jw8eeF6i9ZrGxVIXebiEKFQ8ZO63nrvyOA6IoAEML3Sd5M1VJEZFm8r5Y7io64yVU0ZE3zPMePB8If4UMaLC0N20zS6BPrbH90pd26izkKjkOg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778744200; c=relaxed/simple;
	bh=UI04wNFPPT3rrlI91nuUxUQH70vXEvo8Dkab3K6b6e0=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=VZYLjTVwZAox5QOem6arwOlWIOmuzbpHVENPm/KfQRq0g00y8fkl8w9PsF5j5Tu9YZKxtr9wdpBK/Clzo9cFtFjK0sJwzaUp5yg7+l5Q+NqIcChO6lloeR9tc+GKiSnWPnraW+qTykgodFmVNhpKYuhgDz5h2yLd84iqLoHZHvM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=j2P4sbY+; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="j2P4sbY+"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 997DDC2BCB7;
	Thu, 14 May 2026 07:36:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1778744199;
	bh=UI04wNFPPT3rrlI91nuUxUQH70vXEvo8Dkab3K6b6e0=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date:From;
	b=j2P4sbY+NomtdQ1fQoYxgaa8eB0Zlqs9WjhupgmCE4hJcmdqtZFingZylEFIRCydx
	 ANm0aiK8JOz/iV3FETaPF37RunNKWTx5FPZjNs8F6sMSBfC8Ue9+8Jz7jblDH8des/
	 cdMmCqe1KRr2W7C8sVzfpfKFDPswtwEon7iWCjhaRR8Ty5VIoWier4iykN5GMwQn6y
	 lwJjXOp5zkWX1uXI7uKhyb4v5s98S6nL9Kh01L0uGqJyaxtn/t5OUCDum6D9DYyOOS
	 uZhrOKFW0LsmwkU0F6CQjUf8/fwctcl86wmIzcFKwfQ51NVBpm9IY0SVL45S3VAN9l
	 sLRczjZ8Q/x9A==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH 1/5] powercap: arm_scmi_powercap: Log number of powercap
 domains
Reply-To: sashiko-reviews@lists.linux.dev
To: "Alex Tran" <alex.tran@oss.qualcomm.com>
Cc: linux-hwmon@vger.kernel.org
In-Reply-To: <20260513-scmi-client-probe-log-v1-1-00b47b1be009@oss.qualcomm.com>
References: <20260513-scmi-client-probe-log-v1-1-00b47b1be009@oss.qualcomm.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Thu, 14 May 2026 07:36:39 +0000
Message-Id: <20260514073639.997DDC2BCB7@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 2 potential issue(=
s) to consider:
- [Medium] Misleading and redundant log message introduced during probe.
- [Low] Incorrect format specifier used for an unsigned integer.
--

commit bbe520bfc76fbb3ccbb1f090461778e8837406ba
Author: Alex Tran <alex.tran@oss.qualcomm.com>

powercap: arm_scmi_powercap: Log number of powercap domains

The SCMI powercap driver does not currently report how many powercap
domains were discovered from firmware during probe. This commit adds a log
message indicating the powercap domain count after a successful probe.

> diff --git a/drivers/powercap/arm_scmi_powercap.c b/drivers/powercap/arm_=
scmi_powercap.c
> index ab66e9a3b1e2c..48d721385f946 100644
> --- a/drivers/powercap/arm_scmi_powercap.c
> +++ b/drivers/powercap/arm_scmi_powercap.c
> @@ -496,6 +496,7 @@ static int scmi_powercap_probe(struct scmi_device *sd=
ev)
>  		return ret;
> =20
>  	dev_set_drvdata(dev, pr);
> +	dev_info(dev, "Initialized %d powercap domains\n", pr->num_zones);

Before this line, scmi_zones_register() is called, which already logs the
number of successfully registered domains:

    dev_info(dev, "Registered %d SCMI Powercap domains !\n", reg_zones);

Does this new dev_info() call create redundant and potentially conflicting
output in the kernel ring buffer?

Additionally, scmi_powercap_probe() explicitly skips domains with abstract
power scales earlier in the function:

    if (!spz->info->powercap_scale_uw &&
        !spz->info->powercap_scale_mw) {
        dev_warn(dev,
                 "Abstract power scale not supported. Skip %s.\n",
                 spz->info->name);
        spz->invalid =3D true;
        continue;
    }

Because pr->num_zones represents the total discovered domains rather than
the number actually initialized, could the count in the new log message be
misleading?

Finally, pr->num_zones is defined as an unsigned int in
struct scmi_powercap_root. Should the format specifier be %u instead of %d
to ensure type correctness?

> =20
>  	return ret;
>  }

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260513-scmi-clien=
t-probe-log-v1-0-00b47b1be009@oss.qualcomm.com?part=3D1
