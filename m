Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 54EBA3B7B9E
	for <linux-hwmon@vger.kernel.org>; Wed, 13 May 2026 23:31:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778715107; cv=none; b=UJh6qQtJCgSXR43E+hpsoYJHFesvd1N3AJOP1lGraul/bz8XBFqKq56PtHrleAj/mQtxJehXMtvQkgBqyNOweVXY8tlXyaXcsCSQYkY9aLbqY0pqgrwhZjUW2szuk1768A5bnpD4FX/5q9ifu/YbQVYG43pAdyVY84KZXB7w3Oo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778715107; c=relaxed/simple;
	bh=kRp4TCYNCS/Q4nrRpzwe2wmUMTiUcCod5lQ2tHCQWZU=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=JeW1NmOPGZremHRXshoVQKwbuRv8rZCfvzeOdXA/izQTbDtPFqoMIngooOqPcYRxbLqnDN1nTAsuYOFC0GsuGrDM+oVGc1oYg+Pif+BUmqPnL8GekXRn7+YgnQiZEypafdPi+eZuJXHswWggE68oVWj9YBShCcJg4uLK/UpFTSA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=uGakN2mA; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="uGakN2mA"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CBAC5C2BCB3;
	Wed, 13 May 2026 23:31:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1778715106;
	bh=kRp4TCYNCS/Q4nrRpzwe2wmUMTiUcCod5lQ2tHCQWZU=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date:From;
	b=uGakN2mAjzXOZhXVE2F1VjGXgSxxqd08RHnmmo8xf194z8hnBSXISuRdktF1x7QmC
	 zcXSrnOasOaQ5a9KQn5topzdGZNkB1P5g9DGhgMI8pKxSNDhBALLpiOeC2nonj0wrk
	 asXVvVzMBpnmZxiHwM1GsWcX+pYOsxV/NIWnRcs5jtmzHyTrScxTcld6RtEooughBU
	 N5Y5YPNYi+lrH7rHw0qHwgi+0DlAza7q2EuiTSvaaJCk2ILtvtJpuIsdORagut+aPC
	 ayJdoz013FgZrx0vgxT5wu+LDUvpoG8/vTzxA0h2gp1nj4sWTPcDyrr2iXwNEsCrpf
	 P/PVJDqwtRaHg==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH] hwmon: (nct7802) Add time step attributes for tweaking
 responsiveness
Reply-To: sashiko-reviews@lists.linux.dev
To: "Ronan Dalton" <ronan.dalton@alliedtelesis.co.nz>
Cc: linux-hwmon@vger.kernel.org
In-Reply-To: <20260512041607.988078-2-ronan.dalton@alliedtelesis.co.nz>
References: <20260512041607.988078-2-ronan.dalton@alliedtelesis.co.nz>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Wed, 13 May 2026 23:31:46 +0000
Message-Id: <20260513233146.CBAC5C2BCB3@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [Low] kstrtoul is called with base 0 for a time interval, allowing uninte=
nded octal parsing.
--

commit 3cecff14f185e191b2b2e66dc9e9e9cb80c25244
Author: Ronan Dalton <ronan.dalton@alliedtelesis.co.nz>

hwmon: (nct7802) Add time step attributes for tweaking responsiveness

This commit adds sysfs attributes to configure the step up and step down
time intervals for the Smart Fan mode on the nct7802 chip. The user-facing
values are specified in milliseconds and clamped to valid ranges.

> diff --git a/drivers/hwmon/nct7802.c b/drivers/hwmon/nct7802.c
> index 8c9351da12c6e..f30123fd908cd 100644
> --- a/drivers/hwmon/nct7802.c
> +++ b/drivers/hwmon/nct7802.c
[ ... ]
> +static ssize_t step_time_store(struct device *dev,
> +			       struct device_attribute *attr, const char *buf,
> +			       size_t count, bool step_up)
> +{
> +	struct nct7802_data *data =3D dev_get_drvdata(dev);
> +	unsigned long val;
> +	unsigned int reg;
> +	int ret;
> +
> +	ret =3D kstrtoul(buf, 0, &val);

Does this allow unintended octal parsing?

Using base 0 means that a zero-padded string written from a userspace script
(e.g., echo 0150 > step_up_time) will be parsed as an octal number rather
than decimal.

Should this use base 10 instead to prevent surprising behavior and match
other standard sysfs attribute parsers in this driver?

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260512041607.9880=
78-2-ronan.dalton@alliedtelesis.co.nz?part=3D1
