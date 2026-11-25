Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795585746;
	b=boPRhN4SqlNsd7EYIvqkYNYMbNnShyslT+bRl/Gkknt065bwPgwq3ac9AbMHXbLUc2MG
	 9ZbktbPS715Eq0DkXPyigEcFyyO+vb9FCeFOOsHLzA4SZnom9yNQpGP3L2nnKho5nYheA
	 /G3mDL1fEOImSmvNYMS+fnkuGMpdm+9kf3zq3pR1ans//5+Diwd2H4RpayurEmYsN+KUk
	 p4cqLogis6Yip2s6y28oNBctzdbcz5HlP4jq3bssAjuBHQo9OkuogQ2tmS9Dx/TtcB8lw
	 XrMDO6nTrFmfXcMhqPtbDoy9uorDRsGUJFIPOAw/YDFFGhnDtMbfn/OSLRqEh2xG7Og==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795585746;
	h=Received:DKIM-Signature:Message-ID:From:Subject:Reply-To:To:Cc:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date;
	bh=xmQKUkSWJrjVbLRWL/K8vejQDp1yqljo9EXVUU1GgdQ=;
	b=wfCs1rVwhAKIAUSFLrUjHUuPnTyGPSzlFA18YwO9hLhCIJY4S/gA8J919YXk2cSvwaGk
	 KbBKkrnCXDmCDbhswpgaS/UuTP4coLt9NjFzxqRAZ4FPyAeE+ufOz2nYl+Sd55G4A0F+o
	 ypwNjckbBJJtYewupK8GLV5oTqwhKsNFRxleiRFNNpZaKqqWVZZ8Fk0KXd8LE7pc63Vz5
	 FWY/hEY/8XdLmAgMRnJ8TG4mNqf3viX2vhjXTOLLM/iAvvvpJ9jWRGXrFKUG64X5pDiKk
	 Om/bElqLBk7kuN78bsCywEF+wRmD5WEXnfonMY7kgEsgKwFWmHPbWqTKWgk9mp4+Jww==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=hYx1FH1w;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B17B9606A332
	for <linux-hwmon@vger.kernel.org>; Wed, 25 Nov 2026 05:49:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=hYx1FH1w
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E68121F000D3;
	Wed, 25 Nov 2026 05:49:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795585746;
	bh=xmQKUkSWJrjVbLRWL/K8vejQDp1yqljo9EXVUU1GgdQ=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=hYx1FH1wREcgbhR0iuvMO4DD3u7zycDJyEKcSmydxJme6eLtbzAd1MoCX5UbMsE9T
	 J3VDnl5ZlDRQsHeXE+d6R96NDabeBgSO77/5oZKanrcnSnBuBePoxMBD5fMNQLE3Km
	 12LiBUFz535a0pzKjKFA36VcrpM1phVbllbDXCNgabtYODDxc7k8GeugojltMyu9Hq
	 4Tt1TaQySNj0xgdM4nVk+DKpX0aFKDg+jRHIHIocMPSxkHHNtc7z4OxO92xMMIjpAq
	 RZkrTuhuv2ox4qDiIfWOdG1me+OlUCzyuqm6/uVwP+rDviaT+JtZ1FmUZ5gW9BTF0X
	 X0h6RLBYSrN8Q==
Message-ID: <sashiko-outbox-232631@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH] hwmon: (pmbus) Fall back to CLEAR_FAULTS when
 STATUS_CML is read-only
Reply-To: sashiko-reviews@lists.linux.dev
To: "Arthur Korn" <akorn@google.com>
Cc: linux-hwmon@vger.kernel.org
In-Reply-To: <20261125053711.3098007-1-akorn@google.com>
References: <20261125053711.3098007-1-akorn@google.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Wed, 25 Nov 2026 05:49:05 +0000
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
- [Medium] hwmon: (pmbus) pmbus_clear_cml_fault() disables W1C on
  virtual pages
--

commit 55aa274a3350ffb5857e7b698b066e9435f264ba
Author: Arthur Korn <akorn@google.com>

hwmon: (pmbus) Fall back to CLEAR_FAULTS when STATUS_CML is read-only

This commit reads back PMBUS_STATUS_CML after attempting to clear CML
faults on non-write-protected devices, disabling STATUS_CML write-1-to-clear
and falling back to CLEAR_FAULTS if the fault bits remain set.

> diff --git a/drivers/hwmon/pmbus/pmbus_core.c b/drivers/hwmon/pmbus/pmbus=
_core.c
> index db5c5f533eb97..af8f589b328df 100644
> --- a/drivers/hwmon/pmbus/pmbus_core.c
> +++ b/drivers/hwmon/pmbus/pmbus_core.c
> @@ -728,15 +728,31 @@ void pmbus_clear_faults(struct i2c_client *client)
>  }
>  EXPORT_SYMBOL_NS_GPL(pmbus_clear_faults, "PMBUS");
> =20
> -static void pmbus_clear_cml_fault(struct i2c_client *client, int page)
> +#define PB_CML_FAULT_CLEAR_MASK	(PB_CML_FAULT_INVALID_COMMAND | \
> +				 PB_CML_FAULT_INVALID_DATA)
> +
> +static void pmbus_clear_cml_fault(struct i2c_client *client, int page,
> +				  bool verify)
>  {
>  	struct pmbus_data *data =3D i2c_get_clientdata(client);
> +	int ret;
> +
> +	if (data->has_status_cml) {
> +		ret =3D _pmbus_write_byte_data(client, page, PMBUS_STATUS_CML,
> +					     PB_CML_FAULT_CLEAR_MASK);
> +		if (ret >=3D 0 && verify &&
> +		    !(data->flags & PMBUS_WRITE_PROTECTED)) {
> +			ret =3D _pmbus_read_byte_data(client, page,
> +						    PMBUS_STATUS_CML);
> +			if (ret >=3D 0 && (ret & PB_CML_FAULT_CLEAR_MASK))
> +				ret =3D -EIO;
> +		}
> +		if (ret >=3D 0)
> +			return;
> +		data->has_status_cml =3D false;
> +	}
> =20
> -	if (!data->has_status_cml ||
> -	    _pmbus_write_byte_data(client, page, PMBUS_STATUS_CML,
> -				   PB_CML_FAULT_INVALID_COMMAND |
> -				   PB_CML_FAULT_INVALID_DATA) < 0)
> -		pmbus_clear_fault_page(client, page);
> +	pmbus_clear_fault_page(client, page);
>  }

[Severity: Medium]
Does clearing data->has_status_cml on any negative return value from
_pmbus_write_byte_data() disable STATUS_CML write-1-to-clear across the
whole device when a driver exposes a read-only virtual page?

During pmbus_init_common(), pmbus_clear_cml_faults() iterates over all
pages.  On multi-page devices such as max16601, virtual page 1 is
read-only while pages 0 (VCORE) and 2 (VSA) support byte writes:

drivers/hwmon/pmbus/max16601.c:max16601_write_byte_data() {
	...
	if (page > 0) {
		if (page =3D=3D 2)	/* VSA */
			return i2c_smbus_write_byte_data(data->vsa, reg, value);
		return -EOPNOTSUPP;
	}
	return -ENODATA;
}

When pmbus_clear_cml_faults() reaches page 1, _pmbus_write_byte_data()
returns -EOPNOTSUPP and sets data->has_status_cml =3D false.  Unlike before,
where only page 1 fell back to pmbus_clear_fault_page(), this regression
disables STATUS_CML write-1-to-clear for page 2 and for all subsequent
register probes on page 0, sending PMBUS_CLEAR_FAULTS and wiping latched
faults on both rails.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261125053711.3098=
007-1-akorn@google.com?part=3D1
