Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DB3CD3C5526
	for <linux-hwmon@vger.kernel.org>; Thu, 14 May 2026 08:06:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778745969; cv=none; b=sZYeUne24Xo0rRSKeJU2IqP4vy+eM2LlcbqR+eY1MLi3YDpwRodiPzPz8/+wMQxGBhTHKC95YDi6qOTvChvD92k2Rp8D3hUCZe7sKVRbl0UR75cDsCqV2XYKPauqvPbFBGatOKxfC7k/VOrrgDag8CXmnqeSAI5erxEjAzCOAEY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778745969; c=relaxed/simple;
	bh=jolIBn/+iU5iZKy9kw9YqmjjmHVK+AGRoBJizIEfHgE=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=gCrIiJUB20X/vMpHrMbdrqlV/IingdPVq5M6cZEdc3UOwVRA0Vvp4k+78HgWzFcmQL8Mr6RuzpObjE6+B87CDmd0KcneBFyPLeO61/csb1gH8zsSeTmuSq2fpup3kgQFTTkFknWQkt2kFdNGhBNKdgKIkqAgnYOqkKnnOv5/VBU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=qAWj5Ulx; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="qAWj5Ulx"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2DDC3C2BCC6;
	Thu, 14 May 2026 08:06:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1778745969;
	bh=jolIBn/+iU5iZKy9kw9YqmjjmHVK+AGRoBJizIEfHgE=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date:From;
	b=qAWj5UlxrdG3rfeRjnnR6bbGoOwGJnLWW9LuPStxx99h1P0Vs7hY3W9hfSzzrfK2B
	 sfCVBN5qf7yhApe22RDh3rIyXveFsMPtVWGitvQYO7LYiTyt+WXERRDXYHeUfJzdJI
	 6sjQDxBjevl4satxbPH2m4lhdkrwanqi5PSlzskxTp0XDjf6UDTdPFOWaEYOXwMdz+
	 BWGn0lUpDayocFFGI0dQJtDjuoXNx+9fZQKKmWoufuiH+tJcV5NZpflfDRxdFvU3Tl
	 FWJZM1mxIm0WODsZULBub1hsw6hNwut4m1q2qOaQSrGjfpfP5RagmUdtOvkG7w6Isx
	 GT2DO7maIdJ1w==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH 2/5] cpufreq: scmi-cpufreq: Log number of perf domains
Reply-To: sashiko-reviews@lists.linux.dev
To: "Alex Tran" <alex.tran@oss.qualcomm.com>
Cc: linux-hwmon@vger.kernel.org
In-Reply-To: <20260513-scmi-client-probe-log-v1-2-00b47b1be009@oss.qualcomm.com>
References: <20260513-scmi-client-probe-log-v1-2-00b47b1be009@oss.qualcomm.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Thu, 14 May 2026 08:06:08 +0000
Message-Id: <20260514080609.2DDC3C2BCC6@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 2 potential issue(=
s) to consider:
- [Critical] Use-After-Free (UAF) vulnerability due to global state overwri=
te in multi-SCMI configurations.
- [Low] Misleading and factually incorrect log message regarding initialize=
d performance domains.
--

commit 9067d109b9e937b5bfb6e9d3b3c94d2e9b71d9ac
Author: Alex Tran <alex.tran@oss.qualcomm.com>

cpufreq: scmi-cpufreq: Log number of perf domains

This commit adds a log message to the SCMI cpufreq driver probe function
to display the number of performance domains discovered from firmware.
This is intended to align with the existing SCMI client driver logging
pattern.

> diff --git a/drivers/cpufreq/scmi-cpufreq.c b/drivers/cpufreq/scmi-cpufre=
q.c
> index 4edb4f7a8aa97..d5c33eea24773 100644
> --- a/drivers/cpufreq/scmi-cpufreq.c
> +++ b/drivers/cpufreq/scmi-cpufreq.c
> @@ -468,9 +468,12 @@ static int scmi_cpufreq_probe(struct scmi_device *sd=
ev)
>  	if (ret) {
>  		dev_err(dev, "%s: registering cpufreq failed, err: %d\n",
>  			__func__, ret);
> +		return ret;
>  	}
> =20
> -	return ret;
> +	dev_info(dev, "Initialized %d performance domains\n",
> +		 perf_ops->num_domains_get(ph));

Is this log message entirely accurate?

The num_domains_get() function returns the total number of performance
domains exposed by the SCMI firmware, which includes domains for other
devices like GPUs or DSPs.

Since the scmi-cpufreq driver only initializes domains explicitly associated
with CPUs, could this log message be misleading during debugging by claiming
all SCMI performance domains were initialized here?

This isn't a bug introduced by this commit, but does the use of the global
perf_ops and ph variables here expose a use-after-free on systems with
multiple SCMI agents?

When a second device probes, it overwrites the global perf_ops and ph handl=
es
earlier in the function:

    perf_ops =3D handle->devm_protocol_get(sdev, SCMI_PROTOCOL_PERF, &ph);

The second probe then calls cpufreq_register_driver(), which fails with
-EEXIST because a cpufreq driver is already registered.

The probe failure triggers devres cleanup for the second device, which calls
scmi_protocol_release() and frees the protocol instance.

Since the global ph pointer now points to freed memory, will subsequent
frequency transitions for the first device's CPUs dereference a dangling
pointer?

> +	return 0;
>  }
> =20
>  static void scmi_cpufreq_remove(struct scmi_device *sdev)

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260513-scmi-clien=
t-probe-log-v1-0-00b47b1be009@oss.qualcomm.com?part=3D2
