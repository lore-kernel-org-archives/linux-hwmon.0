Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794831326;
	b=WwzNZrxTFesQRMRrxpr+y7FbTyq+zkfQH211j0kGS/hJiEtcITQJxQEeAwxO73rUd81a
	 LZFk8LN1Z/dIrenbGWGWdKZoBFjTLzM7ZVpLcVNpmmRPmr0KYIwkO0NsVNsNY8/DmbpUb
	 aX/nhCckpGf/OCVaRcMiy4udTHWiBjRK1ihJVn74t9ojVctCBpQgsMegX9d/mtUBUSQzn
	 dOq6LpaP5P6zHkvhDz/qVFrF7GgtDSW33gz4+SsSm6nCZTarShD+EY1kvpvmDzYFlhKYZ
	 7Wji/uRakeVWm7zdH0bkUz6ZhsPIZVsYSxD0/6jaUe6zyP0oPC/WJJyRSmzwoBemCTA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794831326;
	h=Received:DKIM-Signature:Message-ID:From:Subject:Reply-To:To:Cc:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date;
	bh=6T1ROy5re6COjGY5P8EtvnStyhyk9kiy6G/drms1Fv4=;
	b=qcOnDy3ON6uJY1fkOuPXSwLA5dIwY9DO2Sjp2PgsX3UWU/LOxhVXnQP91t4BOAxxJOGE
	 76UqjEnAf8yVhQx29EyK1YHqSsJPJ5Flgvsyk5SAU6E81DQVH+TPTn3Yl0HN87L0ClAq1
	 Sf+TN7r7Gh0j8EM+5wru77zUzKKcgIffXADZ3DMWsZ2LSQkG1rFpKqwEI0kk0bf4Fyrv6
	 1b3xacX1VQ91t7T1u3AcPR2wQBo3kEZpAYnwoHI4r8+d5EtiSgB4KF62hJwXCmDHW0iDN
	 emkMCU2+6JCF2twwEFKi11L2+uHnLeCxwFlRzH3icblf+RSEh2i14gcLg8k5rb04UJA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=TLiMkqVv;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ADF95606A31C;
	Mon, 16 Nov 2026 12:15:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=TLiMkqVv
Received: by smtp.kernel.org (Postfix) with ESMTPSA id F294E1F000C4;
	Mon, 16 Nov 2026 12:15:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794831326;
	bh=6T1ROy5re6COjGY5P8EtvnStyhyk9kiy6G/drms1Fv4=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=TLiMkqVvo0kyW/SSVkpwwDufQ+dr0pnJoDduwZvyha874HK6J24hWEY17bdpTfYhk
	 nWO+6w0bs0H/KByTCgnhRmKVZGcKdmcy9y9uLBDtalh+O4DjWShS4Jqhe9WKoheSmw
	 u+sC30dXREsrLNxk7YBtAzMe6qcu9oHxkNAoGjFh7EdFOKXFlzAlE4Ql/TN/4O2G8O
	 j1efaYcWro46d0IXSxW1Ubmipe3/92EZdsZfbrOPE+MlR25vmx0Pd1OzjQQ8NNrF3J
	 omD94H4/XdP3po/SAsNFnroDZto9Ntz41nrvV4tjn9o4Pyg6+6l6WJXMhs1nKUxE0r
	 7hlcQ4XuPxIwQ==
Message-ID: <sashiko-outbox-217000@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v1 1/4] misc: amd-sbi: use guard() for data->lock mutex
Reply-To: sashiko-reviews@lists.linux.dev
To: "Akshay Gupta" <Akshay.Gupta@amd.com>, linux-hwmon@vger.kernel.org, devicetree@vger.kernel.org
Cc: robh@kernel.org, conor+dt@kernel.org
In-Reply-To: <20261116120228.865196-2-Akshay.Gupta@amd.com>
References: <20261116120228.865196-1-Akshay.Gupta@amd.com>
 <20261116120228.865196-2-Akshay.Gupta@amd.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Mon, 16 Nov 2026 12:15:25 +0000
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Post: <mailto:linux-hwmon@vger.kernel.org>
List-Help: <mailto:linux-hwmon+help@vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-hwmon+owner@vger.kernel.org>
Precedence: list

Thank you for your contribution! Sashiko AI review found no new issues
in this patch, but noticed 1 related pre-existing issue it does not
introduce:
- [High] misc: amd-sbi: uninitialized ec and error overwrite in
  rmi_mailbox_xfer() [1]
--

commit 8e0c735b23732b6b78100642d3a437c0cd3041c0
Author: Prathima Lk <Prathima.Lk@amd.com>

misc: amd-sbi: use guard() for data->lock mutex

This commit converts manual mutex_lock() and mutex_unlock() calls on
data->lock in drivers/misc/amd-sbi/rmi-core.c to guard() and
scoped_guard(), simplifying the error-return paths.

> diff --git a/drivers/misc/amd-sbi/rmi-core.c b/drivers/misc/amd-sbi/rmi-c=
ore.c
> index 95c9109101b53..277f121409728 100644
> --- a/drivers/misc/amd-sbi/rmi-core.c
> +++ b/drivers/misc/amd-sbi/rmi-core.c

[ ... ]

> @@ -425,29 +425,27 @@ int rmi_mailbox_xfer(struct sbrmi_data *data,
>  	ret =3D regmap_read_poll_timeout(data->regmap, SBRMI_STATUS, sw_status,
>  				       sw_status & SW_ALERT_MASK, 500, 2000000);
>  	if (ret)
> -		goto exit_unlock;
> +		return ret;
> =20
>  	ret =3D regmap_read(data->regmap, SBRMI_OUTBNDMSG7, &ec);
> -	if (ret || ec)
> -		goto exit_clear_alert;
> -
> -	/* Clear the input value before updating the output data */
> -	msg->mb_in_out =3D 0;
> -
> -	/*
> -	 * For a read operation, the initiator (BMC) reads the firmware
> -	 * response Command Data Out[31:0] from SBRMI::OutBndMsg_inst[4:1]
> -	 * {SBRMI_x34(MSB):SBRMI_x31(LSB)}.
> -	 */
> -	for (i =3D 0; i < AMD_SBI_MB_DATA_SIZE; i++) {
> -		ret =3D regmap_read(data->regmap,
> -				  SBRMI_OUTBNDMSG1 + i, &bytes);
> -		if (ret < 0)
> -			break;
> -		msg->mb_in_out |=3D bytes << i * 8;
> +	if (!ret && !ec) {
> +		/* Clear the input value before updating the output data */
> +		msg->mb_in_out =3D 0;
> +
> +		/*
> +		 * For a read operation, the initiator (BMC) reads the firmware
> +		 * response Command Data Out[31:0] from SBRMI::OutBndMsg_inst[4:1]
> +		 * {SBRMI_x34(MSB):SBRMI_x31(LSB)}.
> +		 */
> +		for (i =3D 0; i < AMD_SBI_MB_DATA_SIZE; i++) {
> +			ret =3D regmap_read(data->regmap,
> +					  SBRMI_OUTBNDMSG1 + i, &bytes);
> +			if (ret < 0)
> +				break;
> +			msg->mb_in_out |=3D bytes << i * 8;
> +		}
>  	}
> =20
> -exit_clear_alert:
>  	/*
>  	 * BMC must write 1'b1 to SBRMI::Status[SwAlertSts] to clear the
>  	 * ALERT to initiator
> @@ -458,8 +456,7 @@ int rmi_mailbox_xfer(struct sbrmi_data *data,
>  		ret =3D -EPROTOTYPE;
>  		msg->fw_ret_code =3D ec;
>  	}
> -exit_unlock:
> -	mutex_unlock(&data->lock);
> +
>  	return ret;
>  }

[Severity: High]
This problem wasn't introduced by this patch [1], but what happens
if regmap_read() fails when reading SBRMI_OUTBNDMSG7 or
SBRMI_OUTBNDMSG1..4?

ec is declared on the stack without initialization in rmi_mailbox_xfer().
If reading SBRMI_OUTBNDMSG7 fails, ec remains uninitialized when checked
at "if (ec)" at the end of the function; if it happens to be non-zero, the
uninitialized value is stored into msg->fw_ret_code and copied to
userspace by apml_mailbox_xfer().

In addition, the regmap_write() to SBRMI_STATUS unconditionally overwrites
ret, so a failed read of SBRMI_OUTBNDMSG7 (when ec happens to be 0) or
SBRMI_OUTBNDMSG1..4 returns 0 when clearing the alert succeeds, leaving
callers with stale or partial msg->mb_in_out data.

[1] https://sashiko.dev/#/bug/linux-37f3c6ab-ea0e-4ada-a81e-e6c232558ae3

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261116120228.8651=
96-1-Akshay.Gupta@amd.com?part=3D1
