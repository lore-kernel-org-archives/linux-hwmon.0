Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3401F35E1A9
	for <linux-hwmon@vger.kernel.org>; Fri, 15 May 2026 22:56:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778885803; cv=none; b=eMhUf8LIw+uRLJ+a9zHkBgOXINDlOq58g1o324PCGZtACV/zeqp5OsBzVxBLCz6cu0iHlaqhA9G+T3TyApmj0O5gWPyNLUeW3r8WjdT1NlLZ5ZWnQiJ4tgn5nbBujztahs3I0gXp4KWWEVT4pK+U6c2KdZADYW2j01zRqb7d0LE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778885803; c=relaxed/simple;
	bh=oySFxAxC6Vodpe3LDZWU5UJFGzscbYG5HZgnGATxYTA=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=G5yyoxMebCQn2rXrtcLBbmumgM5apgN2TFmSfNc/tcHPLTzoVqkT81et477Dki4z2OoW6P/fvdPATBnJZsh0WLWMlfbZyoDuVxoG2IYqlYYNL8n8aHMYNa3UOwhhYtO2e8DFDGCta9viNjRLZDrxwMgXVd7tTSGXIR3TDJ7LUMo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=b6MVW4Uv; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="b6MVW4Uv"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id AF626C2BCB0;
	Fri, 15 May 2026 22:56:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1778885802;
	bh=oySFxAxC6Vodpe3LDZWU5UJFGzscbYG5HZgnGATxYTA=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date:From;
	b=b6MVW4UvNBXc//4l3EYY4jo2Ah8oZM0188Gk6lQDZZS2A6HbreUPdkzVaHHWSaItM
	 QqXZzckkLXQDigwF4kKrnssDyUKZrArfI0N+677XOusW4Okf0JK29jfxkVz3MVtjbu
	 wGoe/b4w31gIb+w+4prIFTrkqCQLje0Zl2x1NJk6no7kQewH/UPevOdK4m7gYbnJfc
	 SLD0S3QTd38gsqKKPOdcaKmJvGkJ1yAMh9Zcc/+6tirkoqlNFsqgz4zpPyR/u53Q8b
	 HgYHe/A5HgBLKsbM7PJS2v1ULTKD7aYqFSmUBXImxAPaN6X4aieH6sj0PDygi4UdTM
	 OqH1K4D8wulMw==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH 2/5] hwmon: (pmbus/adm1266) widen blackbox-info buffer
 to I2C_SMBUS_BLOCK_MAX
Reply-To: sashiko-reviews@lists.linux.dev
To: "Abdurrahman Hussain" <abdurrahman@nexthop.ai>
Cc: linux-hwmon@vger.kernel.org
In-Reply-To: <20260515-adm1266-fixes-v1-2-1c1ea1349cfe@nexthop.ai>
References: <20260515-adm1266-fixes-v1-2-1c1ea1349cfe@nexthop.ai>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Fri, 15 May 2026 22:56:41 +0000
Message-Id: <20260515225642.AF626C2BCB0@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [High] Unsynchronized concurrent access to the shared `data->dev_mem` buf=
fer in NVMEM read callback violates subsystem locking guidelines.
--

commit ad17d73bcc6d34ca2a117a7fde443e8a2ce1dda7
Author: Abdurrahman Hussain <abdurrahman@nexthop.ai>
Subject: hwmon: (pmbus/adm1266) widen blackbox-info buffer to I2C_SMBUS_BLO=
CK_MAX

adm1266_nvmem_read_blackbox() declares a 5-byte stack buffer and passes it
to i2c_smbus_read_block_data(). This patch widens the local buffer to
I2C_SMBUS_BLOCK_MAX so the helper has room for any well-formed SMBus block
response, avoiding stack buffer overflow. Note that other buffer overflow
issues are fixed in subsequent commits in this series.

> diff --git a/drivers/hwmon/pmbus/adm1266.c b/drivers/hwmon/pmbus/adm1266.c
> index a86666c73a5e9..94691dec13599 100644
> --- a/drivers/hwmon/pmbus/adm1266.c
> +++ b/drivers/hwmon/pmbus/adm1266.c
> @@ -349,7 +349,7 @@ static int adm1266_nvmem_read_blackbox(struct adm1266=
_data *data, u8 *read_buff)

This isn't a regression introduced by this patch, but does the nvmem read
callback that populates read_buff need locking?

The hardware monitoring subsystem guidelines state that drivers must implem=
ent
locking for attributes registered by other means (like nvmem) and should use
hwmon_lock() and hwmon_unlock().

Since the nvmem core does not serialize reg_read operations, can concurrent
reads from userspace via sysfs cause data races?

For example, in adm1266_nvmem_read():

	if (offset =3D=3D 0) {
		memset(data->dev_mem, 0, data->nvmem_config.size);

		ret =3D adm1266_nvmem_read_blackbox(data, data->dev_mem);
	...
	}
	memcpy(val, data->dev_mem + offset, bytes);

If one thread executes memset() or multi-block I2C reads via
adm1266_nvmem_read_blackbox() while another thread copies partially written
data via memcpy(), could this result in memory corruption of the shared buf=
fer
and incorrectly interlaced I2C hardware interactions?

>  {
>  	int record_count;
>  	char index;
> -	u8 buf[5];
> +	u8 buf[I2C_SMBUS_BLOCK_MAX];
>  	int ret;
> =20
>  	ret =3D i2c_smbus_read_block_data(data->client, ADM1266_BLACKBOX_INFO, =
buf);

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260515-adm1266-fi=
xes-v1-0-1c1ea1349cfe@nexthop.ai?part=3D2
