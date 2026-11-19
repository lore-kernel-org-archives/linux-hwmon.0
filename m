Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795054131;
	b=ofPRz2aU43y9Rfncs4PO9+vNkz24LJX+iu0BWgVshzZY4lAGP4mrNbx+2sVxrVcMzNn5
	 4d/I+uqxvrqV+dTFA+035azjk97FOOAXE5mBzAq8pFQCLvPrzRo+NSQ9hDtItqWAH2ysc
	 YWHuZici2DQh1LoRic9RawT7z88rLPocvjj/BrGQgtG0NHTORvbvyUysIblEWCrR3LjCB
	 QqU7DnaXUc7xBrVUA+LYWo9UhlVdgCULJ1OwBV4dexNQPV+Ow5m1dKqr61L3LwgGJ5ETe
	 0eZwksbze/LSM8vXBOtDQ0RXY8NPgsD/dZzYVMFsI7XnL51CcZJdBo1oPLguTNkXRdQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795054131;
	h=Received:DKIM-Signature:Message-ID:From:Subject:Reply-To:To:Cc:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date;
	bh=nLr79HMvILUGIWy0ppn+l+HXnIG3tFCw1QQX3UxjZxw=;
	b=fTMMY1FDNtQ6mDyrV8yQqn+zxM0oTN9xpN+C9glgLYoBKDE5f3bUg6H9jdo8RmzH3EjS
	 bEN/Uxg5RTT+pW8AdOWXIwvbN3j2nTn6gCKnn5nXh5wKFvF+EJua9t+H8UUhcFvAuusMe
	 frpOrOV6A0tTif+qnhQgzjYOEUJsWZYmsMMo7u5JwEfKfbzKkKT/Xf8IsJtbyi6LZqeVz
	 u9Vi51MSQngZyAi+VM6QwKSlpqVN3ABmguveW/vMkx7uAzc33Sm7ocEXTSYJhfy9UR/c1
	 45IrcFGYUk8H9NnRx9K5CigDfnC7YcHjbhdU+aIFnUloJefL8sfaKZXuQRQuaJ4YcWw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=W2cOECQs;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B1854606A325
	for <linux-hwmon@vger.kernel.org>; Thu, 19 Nov 2026 02:08:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=W2cOECQs
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 506BD1F000C5;
	Thu, 19 Nov 2026 02:08:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795054131;
	bh=nLr79HMvILUGIWy0ppn+l+HXnIG3tFCw1QQX3UxjZxw=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=W2cOECQsDw0Cy6VrsIsVLNtzQNzL7vxcxnYTqKBP/lCGcKyetdSHbTFVK/GdaHoS8
	 GBWZ5t25X4AQQylf/0th70FC4FZMk+lJFUfKPvpJ60QNPCwZQX+YjfsgQDEVwjbg48
	 5AvJ2ps8R4f4KAB0nspVrOqoIoh1RWnAz5QDqSJ0LFKVP5bxa2SHyZs4sBid/f4Ckz
	 3i08sXcseleYRC/zUkkUsMVurBEuFNpwsnG/30//5T7ShUZHscpfIOjqtpclQbvV9W
	 83bgGHLrjAvMoIJmenvFjYaoO3n29LUmfncH5UHQtsRfs8It/64RbSyN7+GEhwAEn+
	 dgS3rEz95r2AQ==
Message-ID: <sashiko-outbox-222316@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v2] hwmon: (pmbus) Clear only CML invalid command fault
 during probe
Reply-To: sashiko-reviews@lists.linux.dev
To: "Arthur Korn" <akorn@google.com>
Cc: linux-hwmon@vger.kernel.org
In-Reply-To: <20261119013208.4089480-1-akorn@google.com>
References: <20261119013208.4089480-1-akorn@google.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Thu, 19 Nov 2026 02:08:50 +0000
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Post: <mailto:linux-hwmon@vger.kernel.org>
List-Help: <mailto:linux-hwmon+help@vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-hwmon+owner@vger.kernel.org>
Precedence: list

Thank you for your contribution! Sashiko AI review found 3 potential
issues to consider:
- [Medium] hwmon: (pmbus) pmbus_write_smbalert_mask() clears all faults
  on probe
- [Medium] hwmon: (pmbus) pmbus_clear_cml_fault() leaves INVALID_DATA
  fault latched
- [Medium] hwmon: (pmbus) pmbus_clear_cml_fault() bypasses driver
  write_byte() hooks
--

commit 94d47b10140ba57df41cbee449647587f625d5f3
Author: Arthur Korn <akorn@google.com>

hwmon: (pmbus) Clear only CML invalid command fault during probe

This commit introduces pmbus_clear_cml_fault() and pmbus_clear_cml_faults()
to clear only PB_CML_FAULT_INVALID_COMMAND in PMBUS_STATUS_CML during probe
on PMBus 1.2+ devices instead of sending PMBUS_CLEAR_FAULTS.

> diff --git a/drivers/hwmon/pmbus/pmbus.c b/drivers/hwmon/pmbus/pmbus.c
> index 28889fb743b3e..e2e49fdd54841 100644
> --- a/drivers/hwmon/pmbus/pmbus.c
> +++ b/drivers/hwmon/pmbus/pmbus.c
> @@ -113,7 +113,7 @@ static int pmbus_identify(struct i2c_client *client,
>  			info->pages =3D 1;
>  		}
> =20
> -		pmbus_clear_faults(client);
> +		pmbus_clear_cml_faults(client);
>  	}
> =20
>  	if (pmbus_check_byte_register(client, 0, PMBUS_VOUT_MODE)) {

[Severity: Medium]
Does pmbus_clear_cml_faults() leave PB_CML_FAULT_INVALID_DATA latched
after page auto-detection?

When PMBUS_PAGE is supported, the loop right above probes page numbers
with pmbus_set_page() until writing an out-of-range page index to the
valid PMBUS_PAGE command fails, which latches PB_CML_FAULT_INVALID_DATA
in PMBUS_STATUS_CML.  Because pmbus_clear_cml_fault() only writes
PB_CML_FAULT_INVALID_COMMAND, PB_CML_FAULT_INVALID_DATA and PB_STATUS_CML
remain latched after probe.

> diff --git a/drivers/hwmon/pmbus/pmbus_core.c b/drivers/hwmon/pmbus/pmbus=
_core.c
> index 82dac2c6c579f..74fc8d7481689 100644
> --- a/drivers/hwmon/pmbus/pmbus_core.c
> +++ b/drivers/hwmon/pmbus/pmbus_core.c
> @@ -713,6 +713,26 @@ void pmbus_clear_faults(struct i2c_client *client)
>  }
>  EXPORT_SYMBOL_NS_GPL(pmbus_clear_faults, "PMBUS");
> =20
> +static void pmbus_clear_cml_fault(struct i2c_client *client, int page)
> +{
> +	struct pmbus_data *data =3D i2c_get_clientdata(client);
> +
> +	if (data->revision < PMBUS_REV_12 ||
> +	    _pmbus_write_byte_data(client, page, PMBUS_STATUS_CML,
> +				   PB_CML_FAULT_INVALID_COMMAND) < 0)
> +		pmbus_clear_fault_page(client, page);
> +}

[Severity: Medium]
Does calling _pmbus_write_byte_data() here bypass driver info->write_byte
callbacks that intercept or block fault clearing?

Previously, probe-time fault clearing always went through
pmbus_clear_fault_page() -> _pmbus_write_byte(client, page,
PMBUS_CLEAR_FAULTS).  Several drivers hook write_byte without
implementing write_byte_data: for example, max16601_write_byte() routes
page 2 (PMBUS_PAGE_VIRTUAL) PMBUS_CLEAR_FAULTS to a separate I2C client
(data->vsa), so _pmbus_write_byte_data() writes PMBUS_STATUS_CML to
client (page 0) instead and leaves CML faults on data->vsa uncleared.
Similarly, delta-ahe50dc-fan and max31785 block fault-clearing writes in
write_byte(), and mpq8646 blocks unsupported PMBUS_STATUS_CML reads in
read_byte_data(), none of which implement write_byte_data().

> +
> +void pmbus_clear_cml_faults(struct i2c_client *client)
> +{
> +	struct pmbus_data *data =3D i2c_get_clientdata(client);
> +	int i;
> +
> +	for (i =3D 0; i < data->info->pages; i++)
> +		pmbus_clear_cml_fault(client, i);
> +}
> +EXPORT_SYMBOL_NS_GPL(pmbus_clear_cml_faults, "PMBUS");
> +
>  static int pmbus_check_status_cml(struct i2c_client *client)
>  {
>  	struct pmbus_data *data =3D i2c_get_clientdata(client);

[ ... ]

> @@ -2978,9 +2998,9 @@ static int pmbus_init_common(struct i2c_client *cli=
ent, struct pmbus_data *data,
>  	}
> =20
>  	if (data->info->pages)
> -		pmbus_clear_faults(client);
> +		pmbus_clear_cml_faults(client);
>  	else
> -		pmbus_clear_fault_page(client, -1);
> +		pmbus_clear_cml_fault(client, -1);

[Severity: Medium]
Should pmbus_write_smbalert_mask() also use pmbus_clear_cml_fault()
instead of pmbus_clear_fault_page()?

When client->irq is set, pmbus_do_probe() -> pmbus_irq_setup() calls
pmbus_write_smbalert_mask() across every page:

drivers/hwmon/pmbus/pmbus_core.c:pmbus_write_smbalert_mask() {
    ...
	ret =3D _pmbus_write_word_data(client, page, PMBUS_SMBALERT_MASK,
				     reg | (val << 8));
	/*
	 * Clear fault systematically in case writing PMBUS_SMBALERT_MASK
	 * is not supported by the chip.
	 */
	pmbus_clear_fault_page(client, page);

	return ret;
}

On any IRQ-enabled PMBus device, this still sends PMBUS_CLEAR_FAULTS on
all pages during probe and erases the latched fault registers that this
patch aims to preserve.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261119013208.4089=
480-1-akorn@google.com?part=3D1
