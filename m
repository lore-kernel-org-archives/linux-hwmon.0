Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4B7CA568530
	for <linux-hwmon@vger.kernel.org>; Wed, 14 Oct 2026 18:01:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792000890; cv=none; b=IKMgka2u1H83UDWgq3BpkyPq2GS1+5eFyH5FNNbdAbGfW8aIAs8AUVtyLq6KgFPmi2mN9EqKuY0N6xfSoNuMNxSQanqYkcXpvUjVn25nqdWgAP3LrPjV05F1/EV62KflQvkuI0Mra5MQcbIDrMBxWy+lk+mcD08YGaFtnZ/aBBU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792000890; c=relaxed/simple;
	bh=NJJmbGsA4uvBUi8RX/qnRbDvaU2kc5btIJJr6JynBWk=;
	h=Message-ID:From:Subject:To:Cc:In-Reply-To:References:Content-Type:
	 Date; b=XBtBYfDQB6/QGA+pWfQ6w3KlKkd7veg8Rk6jUyuLusj+eIiSlI+dRqXnJuev+hMTJfyk+eHYtntKsUX3mJaqKRC/hR2IjEbWDkyoLBLFbxajYOWMMrve3gb2ISG9Qx6gg+Y6Zv4nQPnVjBlTm/LbcGpiZHJW96DWvPeDrltgVi4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=TBweeRjP; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="TBweeRjP"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 05EC21F000C4;
	Wed, 14 Oct 2026 18:01:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1792000889;
	bh=T1d/cUzPko0VAbaWFiulD/46BbYyMVURmvrNAbU8nc4=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=TBweeRjPg4Y4SWHLULy+g7qFxr2eM43C4R31XXG2KUR0dt7dlk/tZnAAyvDqROIJH
	 jH8vpLLQpN7z81sj/CHZ4HFKG1d8KdtRbCvduGKCVXBkJP1CXtKjTdgcKvVooOpy6h
	 BO54lrAHHBsFI9oWokJj57NMM/WPliNC9gREqJ4joFqKZI0Dfxq8jPZRBLM6zRMjT0
	 CUr+LHEJAvQBr8aV301nIc4zSw+FsTyxomOg7LNjsiaL2SZeYiXYCjC69aeOQ1SD38
	 dZ+PkEN5GTbtczFQBTZ5UwZzdRplA6hyXfyKrvvCnOY7l672SrZNMJYPTQXyPCq6f4
	 htGOGzVcQ8Lfw==
Message-ID: <sashiko-outbox-171645@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v3 02/11] hwmon: chipcap2: fix off-by-one in command
 mode retry loop
Reply-To: sashiko-reviews@lists.linux.dev
To: "Javier Carrasco" <javier.carrasco.cruz@gmail.com>
Cc: linux-hwmon@vger.kernel.org
In-Reply-To: <20261014-chipcap2_locks-v3-2-27ebfc2c5b9e@gmail.com>
References: <20261014-chipcap2_locks-v3-0-27ebfc2c5b9e@gmail.com>
 <20261014-chipcap2_locks-v3-2-27ebfc2c5b9e@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Wed, 14 Oct 2026 18:01:28 +0000
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [High] hwmon: chipcap2: premature timeout due to 1-jiffy wait_for_complet=
ion_timeout
--

commit 529f4f489744495e9cdde8072b4894cc25895048
Author: Javier Carrasco <javier.carrasco.cruz@gmail.com>

hwmon: chipcap2: fix off-by-one in command mode retry loop

i =3D=3D CC2_CM_RETRIES can never be true inside the loop, since it
only runs while i < CC2_CM_RETRIES. Use CC2_CM_RETRIES - 1 so the
last failed retry breaks out immediately instead of doing a useless
disable + 80 ms power-cycle delay before the loop condition ends it
anyway.

> diff --git a/drivers/hwmon/chipcap2.c b/drivers/hwmon/chipcap2.c
> index 8550578928523..8102b6851d3d1 100644
> --- a/drivers/hwmon/chipcap2.c
> +++ b/drivers/hwmon/chipcap2.c
> @@ -226,7 +226,7 @@ static int cc2_command_mode_start(struct cc2_data *da=
ta)
>  				     2 * CC2_RESP_START_CM_US);
>  		}
>  		ret =3D cc2_read_command_status(data->client);
> -		if (ret !=3D -ETIMEDOUT || i =3D=3D CC2_CM_RETRIES)
> +		if (ret !=3D -ETIMEDOUT || i =3D=3D CC2_CM_RETRIES - 1)

[Severity: High]
Can this still cause premature timeouts during device initialization and re=
ads?

Looking at cc2_command_mode_start() just above this check, the timeout
calculation evaluates to exactly 1 jiffy on standard HZ configurations
(e.g., HZ=3D100 or HZ=3D250), because 200 microseconds is significantly less
than one tick:

	timeout =3D usecs_to_jiffies(2 * CC2_RESP_START_CM_US);
	ret =3D wait_for_completion_timeout(&data->complete, timeout);

When a 1-jiffy timeout is passed to wait_for_completion_timeout(), it can
expire almost instantly if the next timer interrupt occurs immediately after
the call.

This can cause the driver to prematurely abort the device initialization
without triggering a retry, returning -ETIMEDOUT sporadically. This leads
to random failures in device communication and user-space reads even if
the device properly signals completion within its 100-microsecond window.

This same 1-jiffy timeout issue also affects the EEPROM read sequence in
cc2_read_reg():

	timeout =3D usecs_to_jiffies(2 * CC2_RESP_EEPROM_R_US);
	ret =3D wait_for_completion_timeout(&data->complete, timeout);

>  			break;
> =20
>  		/* command window missed, prepare for a retry */

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261014-chipcap2_l=
ocks-v3-0-27ebfc2c5b9e@gmail.com?part=3D2
