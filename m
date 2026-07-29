Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BA87240681D;
	Wed, 29 Jul 2026 22:07:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785362829; cv=none; b=LkyT8Ggg7ilXHWtaGllOGOKUajflIaNov6fESoI1oo+Ly4NqIX6j7QkHTgcWK13Ibm0FbiE7K7gHyzU4F4flX36UGq23FBgMCJWf+CNcV0+LWsIsw8vZ8kYD2I1Ex5NkSXkhl0ZjA8Zn8ko4HUxDoEygWl2YeByjdfSh1KpSIVU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785362829; c=relaxed/simple;
	bh=5Bc6bmCb+M2krUQ8iuQsrVLPsnQRzlhc4Je6kdeKHWA=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=SMCnyB2k/CzPn1n11Aw/7WOeg3natRu27SgIbxtZbZ9fulXui010DlFVskoV5F3GwxqUXkv4KmR4qpgGK2YU+CjVaE1b04TCcKoap1D9MgR78Tqrxk1ls/0vekuCB5ODLBE4/hhthCsq4VBQB9xwr9Z92mHNbXr3D5r/Jad9miA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=HoSwLQx+; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="HoSwLQx+"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 978B61F000E9;
	Wed, 29 Jul 2026 22:07:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1785362825;
	bh=hCJuMqfwrG2rpL40gyXp8yV6X0k0t3yZFs++EHofY84=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=HoSwLQx+G4w2g/3sGkNoXpPOebnJMTcfi48vhnews3O9iHCazF5k+O6QHmxi8cLl7
	 pz5W1iBvbKkmt/PAaQlrJJbLGuJBMtM1tYHjWF1KTPWcr15HBKTg1zOwyqjF7/JatC
	 qQrAMJuKAu+CQSKgsVQvAfT76ABtnShClbJMPHsjKMtX9mN3iQGgrHWx/ohpoNBoHC
	 IRJGDLAhlNzJnnxr3jjY+SAX1WSRDdKUZ59V66uQAsWI6rDo32VJwtSwStOzLwUnQ/
	 ubEZ59EuaVHoUOG9QROuB3OBKOsdEFPQiQOrpQtWkEQ5HJaJEvJBSA7pQgBWcctuTN
	 mYc35OnD0A24Q==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v6 4/4] hwmon: pmbus: mpq8646: gate the writes
Reply-To: sashiko-reviews@lists.linux.dev
To: "Vincent Jardin" <vjardin@free.fr>
Cc: conor+dt@kernel.org, robh@kernel.org, devicetree@vger.kernel.org, linux-hwmon@vger.kernel.org
In-Reply-To: <20260729-mpq8646_v0-v6-4-98848151cdb4@free.fr>
References: <20260729-mpq8646_v0-v6-0-98848151cdb4@free.fr>
 <20260729-mpq8646_v0-v6-4-98848151cdb4@free.fr>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Wed, 29 Jul 2026 22:07:05 +0000
Message-Id: <20260729220705.978B61F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 3 potential issue(=
s) to consider:
- [High] Debugfs attributes perform I2C accesses without acquiring necessar=
y locks, risking race conditions and bypassing hardware write protection.
- [Medium] Mixing goto-based error handling with guard() declarations in th=
e same function.
- [Medium] Debugfs write functions mask negative error codes by returning 0=
 (success) on hardware failure.
--

--- Patch [4]: [PATCH v6 4/4] hwmon: pmbus: mpq8646: gate the writes ---
commit ec4599677b214a57f0796000d18d9f3b6e5d4fb5
Author: Vincent Jardin <vjardin@free.fr>

hwmon: pmbus: mpq8646: gate the writes

This commit adds unsafe debugfs provisioning and benchmarking helpers
to write specific registers. These operations are restricted due to the
risk of browning out the board or persisting bad setpoints.

> diff --git a/drivers/hwmon/pmbus/mpq8646.c b/drivers/hwmon/pmbus/mpq8646.c
> index 1fd41d89e5bef..0034cf5919345 100644
> --- a/drivers/hwmon/pmbus/mpq8646.c
> +++ b/drivers/hwmon/pmbus/mpq8646.c
[ ... ]
> +static int mpq8646_dbg_clear_protection_last(void *data, u64 val)
> +{
[ ... ]
> +	scoped_guard(mutex, &priv->mps_lock)
> +		rc =3D i2c_smbus_write_byte(priv->client, MPS_CLEAR_LAST_FAULT);
> +	if (rc < 0)
> +		dev_warn(&priv->client->dev,
> +			 "clear_protection_last: CLEAR_LAST_FAULT write failed (%d)\n",
> +			 rc);
> +	return 0;
> +}

[Severity: Medium]
Should this propagate the negative error code from rc instead of returning =
0?
Returning 0 masks hardware faults and might lead userspace provisioning
scripts to assume the write succeeded.

[ ... ]
> +static int mpq8646_dbg_clear_protection_last_force(void *data, u64 val)
> +{
[ ... ]
> +	guard(pmbus_lock)(priv->client);
> +	guard(mutex)(&priv->mps_lock);
> +
> +	wp_orig =3D i2c_smbus_read_byte_data(priv->client, PMBUS_WRITE_PROTECT);
> +	if (wp_orig < 0) {
> +		dev_warn(&priv->client->dev,
> +			 "clear_protection_last_force: WRITE_PROTECT read failed (%d), aborti=
ng\n",
> +			 wp_orig);
> +		return 0;
> +	}

[Severity: Medium]
Like above, should this return the negative error code in wp_orig so the I2C
read failure is reported to the caller?

[ ... ]
> +	rc =3D i2c_smbus_write_word_data(priv->client, MPS_MFR_CFG_EXT,
> +				       (u16)cfg_orig | MPS_MFR_CFG_EXT_CLR_LAST_EN);
> +	if (rc < 0) {
> +		dev_warn(&priv->client->dev,
> +			 "clear_protection_last_force: gate open failed (%d)\n",
> +			 rc);
> +		goto restore_wp;
> +	}

[Severity: Medium]
Does this mix goto-based error handling with guard() declarations in the
same function?

The cleanup guidelines specify that functions should either use scope-based
cleanup exclusively or not at all, to avoid confusing ownership semantics.

[ ... ]
> +static int mpq8646_dbg_store_all(void *data, u64 val)
> +{
[ ... ]
> +	mpq8646_unsafe_warn_once(priv);
> +	scoped_guard(mutex, &priv->mps_lock)
> +		rc =3D i2c_smbus_write_byte(priv->client, PMBUS_STORE_USER_ALL);

[Severity: High]
Should this also acquire the global pmbus_lock?=20

Issuing STORE_USER_ALL without the pmbus_lock might expose an unprotected
NVM-busy window to PMBus core background polling.

> +	if (rc < 0)
> +		dev_warn(&priv->client->dev,
> +			 "store_all: STORE_USER_ALL (0x15) write failed (%d)\n",
> +			 rc);
> +	return 0;
> +}

[Severity: Medium]
Does this need to return the negative error code in rc instead of 0 on
failure?

[ ... ]
> +static int mpq8646_dbg_restore_all(void *data, u64 val)
> +{
[ ... ]
> +	mpq8646_unsafe_warn_once(priv);
> +	scoped_guard(mutex, &priv->mps_lock)
> +		rc =3D i2c_smbus_write_byte(priv->client, PMBUS_RESTORE_USER_ALL);

[Severity: High]
As with mpq8646_dbg_store_all(), should this also hold pmbus_lock to
prevent NVM-busy window races?

> +	if (rc < 0)
> +		dev_warn(&priv->client->dev,
> +			 "restore_all: RESTORE_USER_ALL (0x16) write failed (%d)\n",
> +			 rc);
> +	return 0;
> +}

[Severity: Medium]
Should this return the negative error code in rc?

[ ... ]
> +static int mpq8646_dbg_reg_set(void *data, u64 val)
> +{
> +	struct mpq8646_dbg_reg_ctx *ctx =3D data;
> +	int rc;
> +
> +	mpq8646_unsafe_warn_once(ctx->priv);
> +	if (ctx->desc->is_word)
> +		rc =3D i2c_smbus_write_word_data(ctx->priv->client,
> +					       ctx->desc->reg, (u16)val);
> +	else
> +		rc =3D i2c_smbus_write_byte_data(ctx->priv->client,
> +					       ctx->desc->reg, (u8)val);

[Severity: High]
Does this need to acquire pmbus_lock or mps_lock before performing the I2C
write?

If another thread concurrently calls mpq8646_dbg_clear_protection_last_forc=
e()
which temporarily lowers the PMBUS_WRITE_PROTECT register, could a direct
write here slip through and bypass the hardware write protection?

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260729-mpq8646_v0=
-v6-0-98848151cdb4@free.fr?part=3D4
