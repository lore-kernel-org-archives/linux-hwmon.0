Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 39C30318B96;
	Fri, 19 Jun 2026 09:49:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781862577; cv=none; b=XO5cbgpq0RM+MQ9z42cs/jjhUd1eZoZHcV45ESNSs9XTe252+l1p+Mg3OGwixKqEme+tK6E1t/gldhIiSEGPK7KQQQblC12Cgi7BTsmOQ1rJRiSv8n0bn3K3O+9YCBdW4L4TzDjYGNpCTsvdfgK8KQYYtkovMLlV8DKL6ziXccs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781862577; c=relaxed/simple;
	bh=YLjFzPTEF9LCv85DmutXDKpOdwBlw9pFxGDhLmA8U+w=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=niKkVz7UdZhZoGIhjDWKxDENIDw3Cn6d7luryBRTlKMcZECCVbo6urBY99CUGBj9FZPkobLBecHd1MO+V793wZvHxMMFL2z6ra4xT0lXy3k037h5UZAVe+uOVgDryM8SjqX4uqcxU6vMqc9BJX+AWyz5114tuvyuqlFX59eAwGM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Wp6+fEtM; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Wp6+fEtM"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 902981F000E9;
	Fri, 19 Jun 2026 09:49:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1781862575;
	bh=iZqf7eFBFgAirw9JlX0+V8FLBiZ3leIya1QCsPtIxE8=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=Wp6+fEtM+inXOIzd25+pHZRvWYp2UNZm6CDx51e7NA0mQKqJEZLZMuXp88NIEMDij
	 PonT8bMP7amsy8AyMG3hevNMt53LeUmKjAPPQyEVQz23Ivd92RuSuwTbMwT3SVoacN
	 t/8aP4u3anvVhMDPtp9DUTBHze5DYG6SpcJNu/571O+1M3mtlO4JKOuoz2RTJFsNt6
	 rS+Be0/BQCVEsU8bvbs/wzqEXpLqVSte/LRJWuBxIB1IPCNu5C/hVfEzh8CKsan+OD
	 TYGjWtAtaxufIXiCKZdCe9im2UoMezlQWR/KZAAWipIZrpKnmMA0OegjJcG5tJDPrf
	 cS3D3mx7pPRpQ==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH 5/5] arm64: dts: socfpga: stratix10: add hwmon node
Reply-To: sashiko-reviews@lists.linux.dev
To: tze.yee.ng@altera.com
Cc: devicetree@vger.kernel.org, linux-hwmon@vger.kernel.org, conor+dt@kernel.org, robh@kernel.org
In-Reply-To: <d62c4188cd936883bc14c95dcd27555ec94df7cf.1781861409.git.tze.yee.ng@altera.com>
References: <cover.1781861409.git.tze.yee.ng@altera.com>
 <d62c4188cd936883bc14c95dcd27555ec94df7cf.1781861409.git.tze.yee.ng@altera.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Fri, 19 Jun 2026 09:49:35 +0000
Message-Id: <20260619094935.902981F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 3 potential issue(=
s) to consider:

Pre-existing issues:
- [High] Hardware monitoring sysfs attributes remain active after the servi=
ce channel is freed during driver removal, leading to a kernel panic.
- [High] Incorrect temperature scaling calculation reports temperatures 100=
0 times too small to the hwmon subsystem.
- [High] Asynchronous sysfs reads are effectively broken and will always bl=
ock for the full 2-second timeout before falling back to manual polling.
--

commit a3baf92605bf6c042e451ccdb74f299304cebf79
Author: Tze Yee Ng <tze.yee.ng@altera.com>

arm64: dts: socfpga: stratix10: add hwmon node
   =20
Add an hwmon child node under the Stratix 10 service layer and describe
the SoCDK voltage and temperature sensors using the altr,stratix10-hwmon
compatible.

> diff --git a/arch/arm64/boot/dts/altera/socfpga_stratix10_socdk.dts b/arc=
h/arm64/boot/dts/altera/socfpga_stratix10_socdk.dts
> index e2a1cea7f3da9..01a8ffe430ed0 100644
> --- a/arch/arm64/boot/dts/altera/socfpga_stratix10_socdk.dts
> +++ b/arch/arm64/boot/dts/altera/socfpga_stratix10_socdk.dts
[ ... ]
> @@ -134,3 +134,36 @@ root: partition@4200000 {
>  		};
>  	};
>  };
> +
> +&temp_volt {
> +	status =3D "okay";

[Severity: High]
This isn't a bug introduced by this patch, but enabling this hwmon node exp=
oses
a pre-existing lifecycle issue during driver removal that can lead to a ker=
nel
panic.

The stratix10-hwmon driver uses devm_hwmon_device_register_with_info() for
registration, meaning the sysfs attributes are only unregistered during dev=
res
cleanup after stratix10_hwmon_remove() returns. However, the remove function
synchronously frees the service channel (stratix10_svc_free_channel), which
sets chan->scl to NULL.

If a userspace process reads a sysfs attribute concurrently, the service th=
read
might unconditionally dereference chan->scl in svc_thread_recv_status_ok():

drivers/firmware/stratix10-svc.c:svc_thread_recv_status_ok() {
    ...
    p_data->chan->scl->receive_cb(p_data->chan->scl, cb_data);
    ...
}

Should the driver manage the service channel lifecycle via
devm_add_action_or_reset() so the channel strictly outlives the sysfs
attributes?

[Severity: High]
This is a pre-existing issue, but enabling this hwmon node exposes an incor=
rect
temperature scaling calculation.

The hwmon subsystem strictly requires temperature attributes to be reported=
 in
millidegrees Celsius. The hardware reports the temperature in Q8.8 format.

In stratix10_hwmon_parse_temp(), the driver shifts the value right by 8 bit=
s,
effectively returning raw degrees Celsius:

drivers/hwmon/stratix10-hwmon.c:stratix10_hwmon_parse_temp() {
    ...
    *val =3D (long)(s32)temperature / STRATIX10_HWMON_TEMP_FRAC_DIV;
    ...
}

Because it fails to multiply the result by 1000, a temperature of 50 degrees
Celsius is reported as 50 instead of 50000. Monitoring tools will mistakenly
display this as 0.050 degrees Celsius.

Could the conversion logic be updated to multiply the result by 1000 to
satisfy the hwmon core requirements?

[Severity: High]
This is a pre-existing issue, but enabling this hwmon node exposes a broken
asynchronous read path that induces a 2-second latency spike per read.

The stratix10_hwmon_async_read() function waits on a completion:

drivers/hwmon/stratix10-hwmon.c:stratix10_hwmon_async_read() {
    ...
    wait_ret =3D wait_for_completion_io_timeout(&completion, HWMON_TIMEOUT);
    ...
}

It expects the callback stored in handle->cb by stratix10_svc_async_send()
to be executed. However, the stratix10-svc driver never actually invokes th=
is
callback anywhere in the service layer.

As a result, the completion is never signaled. Every sysfs read incurs a
mandatory 2-second timeout delay before it falls back to manual polling via
stratix10_svc_async_poll().

Is it possible to either implement the callback invocation in the service l=
ayer,
or adjust the async read approach to avoid this latency?

> +
> +	voltage {
> +		#address-cells =3D <1>;
> +		#size-cells =3D <0>;
> +		input@2 {
> +			label =3D "0.8V VCC";
> +			reg =3D <2>;
> +		};
[ ... ]

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/cover.1781861409.gi=
t.tze.yee.ng@altera.com?part=3D5
