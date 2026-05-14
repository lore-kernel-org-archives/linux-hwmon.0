Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 621F718872A
	for <linux-hwmon@vger.kernel.org>; Thu, 14 May 2026 08:42:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778748167; cv=none; b=tr4J/zgqYjOIMt0zJO4qPsZ7B8cfZJ8qf0fiupe/PWMqGB8nwdMu+HKUtqvqB/WDrQ4ri71xcPrINjJI8Z1kacM35gEnjQDAQENcKAf7CoQpYyseOieTjFHm6VPljUw5nTqbSBCKKz90mTF9SEbAUuU1Gs/RoDl+/2yX3jhdVcE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778748167; c=relaxed/simple;
	bh=yvCgs0E04ltr9/IOw058XmRnJcTknqZU9zckaXlE+KA=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=Rna8ewpFWA5YJ9dPz5bWdMmc3oORcmdwbMR7/7ES79UNbrhYZASwdVUEukijlypyO2DBfruasZOsx0Z4B9dr1tIMHclJjQiIePcn6C4M8AnOODzYcHJNDZ8chzTgKSsOsUN2fcm+C0TuQUseK2RrPejfEcNyQ+HX6eQD6APO+qY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=lNkNXAcH; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="lNkNXAcH"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id F03A5C2BCB7;
	Thu, 14 May 2026 08:42:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1778748167;
	bh=yvCgs0E04ltr9/IOw058XmRnJcTknqZU9zckaXlE+KA=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date:From;
	b=lNkNXAcHAz0yTUWkZfBwzIP00sX2/no1q4bQkcZ6ATdrM1WZ99JoXzQDEGW666tV0
	 ou3uBifsuZKtj7UIr2A34gHtLickdiZBsI4DenDNLGQN53O5JxyQLViK/lmR76bSX2
	 iTrXcWBT0k6KXtA2qlwnI0ZUcQJrXpXGjtw52uxUxskr2Gx0tjoRXCRw6ypfXqAImx
	 8fxaIv2ZHwyWMXDNyLyOjzS+PStzb8MZ30J8k8pysH5b0ApGL9La61J0g5rZPjMfS8
	 VxmajTUJiaGKfD88nTP5BqpMw8chxfZ46zQvwC8RvoxOXBYEiq44Z154eSZuFFm31J
	 51+xf7rmHdfiQ==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v2 2/5] cpufreq: scmi-cpufreq: Log number of perf
 domains
Reply-To: sashiko-reviews@lists.linux.dev
To: "Alex Tran" <alex.tran@oss.qualcomm.com>
Cc: linux-hwmon@vger.kernel.org
In-Reply-To: <20260513-scmi-client-probe-log-v2-2-36607e9dd540@oss.qualcomm.com>
References: <20260513-scmi-client-probe-log-v2-2-36607e9dd540@oss.qualcomm.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Thu, 14 May 2026 08:42:46 +0000
Message-Id: <20260514084246.F03A5C2BCB7@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [Medium] Misleading debug log message contradicts driver behavior and com=
mit message.
--

commit 1a4bf472420109c67d582c98f4a85ffbf1fdd048
Author: Alex Tran <alex.tran@oss.qualcomm.com>

cpufreq: scmi-cpufreq: Log number of perf domains

This commit adds a debug log to the SCMI cpufreq driver to report the
number of performance domains discovered from firmware.

> diff --git a/drivers/cpufreq/scmi-cpufreq.c b/drivers/cpufreq/scmi-cpufre=
q.c
> index 4edb4f7a8aa97..f4cf59d862c61 100644
> --- a/drivers/cpufreq/scmi-cpufreq.c
> +++ b/drivers/cpufreq/scmi-cpufreq.c
> @@ -468,9 +468,12 @@ static int scmi_cpufreq_probe(struct scmi_device *sd=
ev)

[ ... ]

>  	if (ret) {
>  		dev_err(dev, "%s: registering cpufreq failed, err: %d\n",
>  			__func__, ret);
> +		return ret;
>  	}
> =20
> -	return ret;
> +	dev_dbg(dev, "Initialized %d performance domains\n",
> +		 perf_ops->num_domains_get(ph));

The commit message states the intent is to log the number of domains
"discovered from firmware". Does the wording "Initialized" in this log
message accurately reflect the driver's behavior?

The driver primarily registers the cpufreq driver and does not actually
initialize the SCMI performance domains. Additionally, num_domains_get()
returns the total count of SCMI performance domains exposed by the
firmware, which may also include non-CPU domains like GPUs.

Would a word like "Discovered" be more appropriate here?

> +	return 0;
>  }

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260513-scmi-clien=
t-probe-log-v2-0-36607e9dd540@oss.qualcomm.com?part=3D2
