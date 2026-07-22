Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D253831326A
	for <linux-hwmon@vger.kernel.org>; Wed, 22 Jul 2026 22:17:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784758680; cv=none; b=AgOgLALODal1hpR5J6L9/eU2IoTRf5GJeCHRXNt+sG5ngGJEzP8yCSiN8EjmQQ3lsvOo9wK3gv7fvPprbSHBEa6FMP7AhNGzi+yXV63cNjrSgy+xJVbJxiojIY1HtBFRkdaJSyxe7yR6J9unmRq9/IvWHS8uHIkifYyb5Xr2PZg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784758680; c=relaxed/simple;
	bh=KiRo7lJxsnrErgcjT1uYB3Qp9s2y8WQ5KNnnTTY1ilQ=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=D9QSdxGyLEeRxGOs9eGTkZKCTNpgGMbX0YKxmT1NFSFwV5QQdS9QceX2rJR0eWe0Rygzhybo83+Xv3gAliLpl5Q8vLKfPGfWhi7vA2qu0CXmET/oql8yzALo1d8LkPeUFUxk0rwtkFXSYsx4eywdsUHAmlr+UZANJ6xaDWVeHCw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=hRMMZMG5; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="hRMMZMG5"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8EAAE1F00A3A;
	Wed, 22 Jul 2026 22:17:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1784758679;
	bh=zzkaKAq9wCTszHARwKUNZkT8lExOBdeuntFLVFH2LNU=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=hRMMZMG5gtyl9vOs8fdFxaQSl73C2Mhr2cfeQxZiXoUjR4QzQXRZn2id5P/gd1ogd
	 ibSK6WyeTh3FVj++nJB+Dt5yr+2eCoN7aQ8w3eAFAktyKlIscJMF1UWFkL8M0ZTh1u
	 W2cSo3yIPOcJnQSKbinkRwS4PCNreGBnTLKSQCyTQXcvWDP84Ioh/qi4qcJbxTB/Tn
	 gqS9AJVkisMXQ8a35FkHxDpMwQAj0STauvyrfbV5v9Y1U4+EH4zG6dFdrQdQt8D2mU
	 rspv5sE1nQ5mX7Z07OXhKGb5tdJAmoo9i6qlQ65LuBYg3ukfQSbw+DduNvkfNhn6+o
	 0JH9oTTMvcOPQ==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH net-next 1/6] eth: fbnic: move sensor read logic out of
 fbnic_mac
Reply-To: sashiko-reviews@lists.linux.dev
To: "Zinc Lim" <limzhineng2@gmail.com>
Cc: linux-hwmon@vger.kernel.org
In-Reply-To: <20260721221540.648272-2-limzhineng2@gmail.com>
References: <20260721221540.648272-1-limzhineng2@gmail.com>
 <20260721221540.648272-2-limzhineng2@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Wed, 22 Jul 2026 22:17:59 +0000
Message-Id: <20260722221759.8EAAE1F00A3A@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 2 potential issue(=
s) to consider:

Pre-existing issues:
- [High] A positive firmware error code causes `fbnic_hwmon_sensor_read` to=
 return a positive value to the hwmon core, which treats it as success and =
leaks an uninitialized stack variable.
- [High] Mailbox completions lack transaction IDs, allowing late firmware r=
esponses from timed-out requests to erroneously complete subsequent request=
s.
--

--- Patch [1]: [PATCH net-next 1/6] eth: fbnic: move sensor read logic out =
of fbnic_mac ---
commit 3d23a98846b8fe29f6da2d75356fdb3ad9559179
Author: Zinc Lim <limzhineng2@gmail.com>

eth: fbnic: move sensor read logic out of fbnic_mac

The sensor read lived behind the fbnic_mac get_sensor op, but it is only
ever used by the hwmon subsystem. Move the read into fbnic_hwmon.c and
call it directly there, closer to where it is used, and drop the
now-unused get_sensor op from struct fbnic_mac. No functional change.

> diff --git a/drivers/net/ethernet/meta/fbnic/fbnic_hwmon.c b/drivers/net/=
ethernet/meta/fbnic/fbnic_hwmon.c
> index def8598aceecf..6c8c66ab86c13 100644
> --- a/drivers/net/ethernet/meta/fbnic/fbnic_hwmon.c
> +++ b/drivers/net/ethernet/meta/fbnic/fbnic_hwmon.c
> @@ -28,15 +28,67 @@ static umode_t fbnic_hwmon_is_visible(const void *drv=
data,

[ ... ]

> +	err =3D fbnic_fw_xmit_tsene_read_msg(fbd, fw_cmpl);
> +	if (err) {
> +		dev_err(fbd->dev,
> +			"Failed to transmit TSENE read msg, err %d\n",
> +			err);
> +		goto exit_free;
> +	}
> +
> +	if (!wait_for_completion_timeout(&fw_cmpl->done, 10 * HZ)) {
> +		dev_err(fbd->dev, "Timed out waiting for TSENE read\n");
> +		err =3D -ETIMEDOUT;
> +		goto exit_cleanup;
> +	}

[Severity: High]
This is a pre-existing issue, but does timing out and clearing the completi=
on
slot expose the driver to late responses matching the next request?

If wait_for_completion_timeout() times out, the mailbox slot is cleared. Si=
nce
the matching logic in fbnic_fw_get_cmpl_by_type() uses only the message typ=
e:

	if (fbd->cmpl_data[i] &&
	    fbd->cmpl_data[i]->msg_type =3D=3D msg_type) {

Will a delayed response to this request erroneously complete a subsequent
request of the same type?

> +
> +	/* Handle error returned by firmware */
> +	if (fw_cmpl->result) {
> +		err =3D fw_cmpl->result;
> +		dev_err(fbd->dev, "%s: Firmware returned error %d\n",
> +			__func__, err);
> +		goto exit_cleanup;
> +	}

[Severity: High]
This isn't a bug introduced by this patch, but what happens if the firmware
returns a positive error code in fw_cmpl->result?

Since this error code is propagated back to the hwmon core, and the hwmon
core only checks for negative error codes, will it treat a positive value
as success and leak an uninitialized stack variable (val) to userspace?

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260721221540.6482=
72-1-limzhineng2@gmail.com?part=3D1
