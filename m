Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ECF19EED8
	for <linux-hwmon@vger.kernel.org>; Tue, 12 May 2026 00:52:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778547173; cv=none; b=Sr/8ovuokQhsByvrlT130ayNtcMya6O3t+FMiAVGxowjzxAd64GvDJ7fcasDttFrS8NOM0uTdIfbkOc4Tk7ymC4tSRBmlRx4LDKJeBJLBypCECFiOFXTMnNyzKQl+MMp7yQCVO4YM8IPhQpem+Umq/5RyiWXvQkVFS4QYWyLapg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778547173; c=relaxed/simple;
	bh=VSb3cSKH2Ovnmxry1kOAexntxFFPCfCxghPPs8EDdh0=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=Irr+w11ZZhkJCO7AfEoi/p9WipTF/0LTMYDMdJFyacZHL61h07ZxluPoXCUslRqSXWXpRNd37UcOkOuJLv9OeNQgnajZA6sFUnIPAGy1TQvKAD6bzuVyLyyGXOTMCr9PgPKEWIB5gFaLKFeiSBHURMV2K3nZVpvIC4C86z7eIZc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=lIHUEdBx; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="lIHUEdBx"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 763EAC2BCB0;
	Tue, 12 May 2026 00:52:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1778547172;
	bh=VSb3cSKH2Ovnmxry1kOAexntxFFPCfCxghPPs8EDdh0=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date:From;
	b=lIHUEdBxJ8UXSAAKMikSPJIc5Xf6EC57kt+izNylPpeuhk4EgRtUZGXx6gL349SRt
	 h1ZYLQppVb/ylYqLtLPzWWwG+3+97qXYNSzXU9Ic4fHBSJhOcBnrADznKYS5dCdfsX
	 9igBCfzszAv1bpfPEF9dE8M9CEYukc8vgJw5punT1LBZzMaOtArspxOgEC9HWmPiN+
	 R15DV8RUze8Gj8MP2pp5AZqKUCKNozNb3HK9eYeCX3MW2hCIby8IIFRRtglhSUsr+g
	 ueFD5t77uY7sQrrQ22WcUwNcwgzWxIc1xb0JSVKqIZl1+zSUqVWqZ4It/97O8zWyzX
	 4zgZFL0P6hMIg==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH RESEND v2 2/5] hwmon: (pmbus/adm1266) add clear_blackbox
 debugfs entry
Reply-To: sashiko@lists.linux.dev
To: "Abdurrahman Hussain" <abdurrahman@nexthop.ai>
Cc: linux-hwmon@vger.kernel.org
In-Reply-To: <20260511-adm1266-v2-2-7a6d34f0de5d@nexthop.ai>
References: <20260511-adm1266-v2-2-7a6d34f0de5d@nexthop.ai>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Tue, 12 May 2026 00:52:51 +0000
Message-Id: <20260512005252.763EAC2BCB0@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [High] The debugfs write handler `adm1266_clear_blackbox_write` performs =
an I2C transaction without acquiring the required hardware monitoring locks=
, violating hwmon subsystem guidelines.
--

commit ab9c19373562d58415e28511b037545cfd278c2a
Author: Abdurrahman Hussain <abdurrahman@nexthop.ai>
Subject: hwmon: (pmbus/adm1266) add clear_blackbox debugfs entry

This commit adds a debugfs entry to clear the ADM1266 blackbox buffer by
issuing a block-write command to the device. This is needed when the
device operates in single-recording mode to preserve fault history.

> diff --git a/drivers/hwmon/pmbus/adm1266.c b/drivers/hwmon/pmbus/adm1266.c
> index 7b8433226176f..31aefa8fc75f5 100644
> --- a/drivers/hwmon/pmbus/adm1266.c
> +++ b/drivers/hwmon/pmbus/adm1266.c

[ ... ]

> +static ssize_t adm1266_clear_blackbox_write(struct file *file, const cha=
r __user *ubuf,
> +					    size_t count, loff_t *ppos)
> +{
> +	struct i2c_client *client =3D file->private_data;
> +	u8 payload[2] =3D { 0xFE, 0x00 };
> +	int ret;
> +
> +	ret =3D i2c_smbus_write_block_data(client, ADM1266_READ_BLACKBOX,
> +					 sizeof(payload), payload);

Does this I2C block write need to be protected by hwmon_lock() and
hwmon_unlock()?

The hardware monitoring subsystem guidelines require drivers to implement
locking for attributes registered outside of the core registration function=
s,
such as debugfs entries.

Without these locks, could this write operation race with other multi-record
transactions? For example, if this clear command is interleaved while
adm1266_nvmem_read_blackbox() is iterating through multiple records, might
it corrupt the read sequence?

> +	if (ret < 0)
> +		return ret;
> +
> +	return count;
> +}

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260511-adm1266-v2=
-0-7a6d34f0de5d@nexthop.ai?part=3D2
