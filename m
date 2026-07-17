Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0F9A6378803;
	Fri, 17 Jul 2026 21:10:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784322648; cv=none; b=bEMTF9yJB2jtYqXlQtnPq7ISmnjCU0iDLJLIzhxrQx73IsFi3MIhAMfUYvj1NmgjFwViBbhDIM3KOgdEpJf9eYcUDvQ1mQHrRCT9fIuzhn7aX34oeK5si6g1+0JvSLKA/uhcbue8zJzdMyDcUHUo1KnV79hJryPBm/UllNDQPOo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784322648; c=relaxed/simple;
	bh=JorrneG5oh3a9fGkQcHBSgWSryCd3CJIN987ts1dWck=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=lkWvjrJ+HxgOsykZlzepmW6nlchOcSNMgnHJJZlj0daHl8Tt/h3jlFnKK5wMohoK84KG7QGumkEt3biX33zceI3h0imEqAPO1up/gCKVSM4YiHdeaqAp5MJBbNc74/zNUCOTz3ASPvdCtE67LuGo7JnHGftFgti8099RvHdXXe8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=f29hH5BN; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="f29hH5BN"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 66B001F000E9;
	Fri, 17 Jul 2026 21:10:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1784322646;
	bh=MZlK4Y94xmYzPIkCIWlrnL8jVlSE72yQG+ZbCNJ8v74=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=f29hH5BN5KfVXA/r4mST0/WMAulMH2xZtYGgX7JBonfMeJSvJHjTwnxizkr1ji5C5
	 8Or7hDLZVihivtCCNbFffqASA3JXeq+7hjVvOgnCkwSP11ApMyQRD5hgHnTw/UFtqM
	 OFR1+ZvmYinJo3ZTIeoWGoLQSt6BF4VasCjsAtsRh2gFnzRwB3PKLJFg2ZrFEs4X0Q
	 mXBxgOYZa3235PSmatfehh33F9meaWGGCTNFIDrC/Q/PNAoGvCxy/afjoOt7sACgeq
	 BA2bwMTIFOdTyv+rJcZ1q940B3M1eH0ker23FpBp1oCeywRC+kuPxuLVLDGFeCAdTM
	 VOm+jQR/hg1MQ==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v2 2/6] hwmon: (adt7470) Fix fans stuck in manual mode
 on I2C errors
Reply-To: sashiko-reviews@lists.linux.dev
To: "Luiz Angelo Daros de Luca" <luizluca@gmail.com>
Cc: robh@kernel.org, conor+dt@kernel.org, linux-hwmon@vger.kernel.org, devicetree@vger.kernel.org
In-Reply-To: <20260717-adt7470_thermalzone-v2-2-a55147958fad@gmail.com>
References: <20260717-adt7470_thermalzone-v2-0-a55147958fad@gmail.com>
 <20260717-adt7470_thermalzone-v2-2-a55147958fad@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Fri, 17 Jul 2026 21:10:45 +0000
Message-Id: <20260717211046.66B001F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:

Pre-existing issues:
- [High] This problem wasn't introduced by this patch, but the driver viola=
tes hwmon subsystem guidelines by using a private mutex `data->lock` for sy=
sfs attributes instead of the standard `hwmon_lock()` API.
--

--- Patch [2]: [PATCH v2 2/6] hwmon: (adt7470) Fix fans stuck in manual mod=
e on I2C errors ---
commit f5bf8b0ee6f2d048580f6d00a71e61df362fa4c6
Author: Luiz Angelo Daros de Luca <luizluca@gmail.com>

hwmon: (adt7470) Fix fans stuck in manual mode on I2C errors

This commit introduces a recovery path in adt7470_read_temperatures() to en=
sure
that original PWM configuration registers are restored if an I2C operation
fails after temporarily switching the fans to manual mode.

Closes: https://lore.kernel.org/r/20260716213252.EACA71F000E9@smtp.kernel.o=
rg

> diff --git a/drivers/hwmon/adt7470.c b/drivers/hwmon/adt7470.c
> index 664349756dc2b..481d51617f4be 100644
> --- a/drivers/hwmon/adt7470.c
> +++ b/drivers/hwmon/adt7470.c
> @@ -205,11 +205,12 @@ static inline int adt7470_write_word_data(struct ad=
t7470_data *data, unsigned in
>  /* Probe for temperature sensors.  Assumes lock is held */
>  static int adt7470_read_temperatures(struct adt7470_data *data)
>  {

[Severity: High]
This isn't a bug introduced by this patch, but this driver appears to use a
private mutex (data->lock) for internal synchronization instead of the
standard hwmon_lock() API.

For example, it uses mutex_init(&data->lock) in adt7470_probe() and locks it
with mutex_lock(&data->lock) in sysfs attribute operations like
pwm_auto_temp_store().

Does this bypass the centralized hwmon core serialization mechanism and risk
logical race conditions with the thermal subsystem? Should this be updated
to follow the hwmon subsystem guidelines which mandate using hwmon_lock()
and hwmon_unlock() for attributes not registered via the info parameter?

[ ... ]

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260717-adt7470_th=
ermalzone-v2-0-a55147958fad@gmail.com?part=3D2
