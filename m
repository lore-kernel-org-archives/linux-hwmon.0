Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 962E8368D69;
	Fri, 19 Jun 2026 09:51:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781862715; cv=none; b=ZPO3VzA07R8tNM84Hsp0uWayat0Zax1AOCf20Yn98Rp64ROzZRegMps1T2nCD9f/+Ls8k1wjV5pIf3Yn4jj7LX0y5AUFUP+jvEamX5dVP67U6thqngBj3qLT1Wa1CNsdnVs+ELKL0TJ2/NlezzYvH0u2N5xWx6FG5+YlxVauaSE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781862715; c=relaxed/simple;
	bh=K9V0+es7J6611wdIvhhIxplw2vGBmrbyZnyaR9KHXTo=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=pahA4D7yDxTfXKv0cbnF9wD//m4OqBb+ijVRz5AN/XZRrOr9cfXke2ARxMjvZ2ZbA35fmijY6LAO0J7IXeGRhk0Kzh14i7Esc4b+B+Ldu1LqFazyAFNXFV4AkViVe9YLS1dwKXwPGkgLvmZsHcULZIOVMUUlEjMhADHffzDKizI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=gOl0Gre+; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="gOl0Gre+"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id AB1021F00A3E;
	Fri, 19 Jun 2026 09:51:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1781862709;
	bh=zqS10yjZsSeXUxoZWR076xkJuUUKKUnmT/ArAgwFojE=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=gOl0Gre+0WXOffW1XR++LvcMLJSldHwLyqDt/g+W1lZZEP5BfTY9mGp8DuMY5P129
	 WDWC4vlENOIM0QQfcsvZdxqVglrsr6FLwENsMyWBmUk7KvrfDCw7v19M2sutZwfkGh
	 78O3fIvGKoaO5vAGVucA8ItfT2N7puoc/NUtVSVrF5nQEZCxqhAZf5GOxDslzzA+XN
	 rYmEiqETA3OdxQo22n1MBQ1xmolWlK9SD7Bvx3s0jk0kpp5qXR30MpTuo0TAj8RSof
	 t5KHXgjCy7IeX2qpiEkg1YhrNbIUsb1DxeAbpvIJi+HouFE4/rCMl/3V2CT9rlo0XY
	 M4l2d0AEtyWVA==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH 3/5] firmware: stratix10-svc: add async HWMON read
 commands
Reply-To: sashiko-reviews@lists.linux.dev
To: tze.yee.ng@altera.com
Cc: devicetree@vger.kernel.org, conor+dt@kernel.org, robh@kernel.org, linux-hwmon@vger.kernel.org
In-Reply-To: <69a0f1b93e1dc5b5b8993f8649704c6be60dc1a3.1781861409.git.tze.yee.ng@altera.com>
References: <cover.1781861409.git.tze.yee.ng@altera.com>
 <69a0f1b93e1dc5b5b8993f8649704c6be60dc1a3.1781861409.git.tze.yee.ng@altera.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Fri, 19 Jun 2026 09:51:47 +0000
Message-Id: <20260619095148.AB1021F00A3E@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 2 potential issue(=
s) to consider:

Pre-existing issues:
- [High] Missing cleanup of async client on driver removal causes memory le=
ak and breaks subsequent probes.
- [High] Abandoning async transactions via `stratix10_svc_async_done()` wit=
hout notifying EL3 firmware causes transaction ID desynchronization.
--

commit 6e40e51555b4f357bf75d356699813e67712ecca
Author: Tze Yee Ng <tze.yee.ng@altera.com>

firmware: stratix10-svc: add async HWMON read commands

This commit adds asynchronous Stratix 10 service layer support for hardware
monitor temperature and voltage read commands. It updates the service
layer functions stratix10_svc_async_send() and
stratix10_svc_async_prepare_response() to process the new messages.

> diff --git a/drivers/firmware/stratix10-svc.c b/drivers/firmware/stratix1=
0-svc.c
> index 39eb78f5905b3..ca2e354fc20fe 100644
> --- a/drivers/firmware/stratix10-svc.c
> +++ b/drivers/firmware/stratix10-svc.c
> @@ -1317,6 +1317,14 @@ int stratix10_svc_async_send(struct stratix10_svc_=
chan *chan, void *msg,
>  		args.a0 =3D INTEL_SIP_SMC_ASYNC_RSU_NOTIFY;
>  		args.a2 =3D p_msg->arg[0];
>  		break;
> +	case COMMAND_HWMON_READTEMP:
> +		args.a0 =3D INTEL_SIP_SMC_ASYNC_HWMON_READTEMP;
> +		args.a2 =3D p_msg->arg[0];
> +		break;
> +	case COMMAND_HWMON_READVOLT:
> +		args.a0 =3D INTEL_SIP_SMC_ASYNC_HWMON_READVOLT;
> +		args.a2 =3D p_msg->arg[0];
> +		break;
>  	default:

[Severity: High]
This is a pre-existing issue, but does abandoning asynchronous transactions
via stratix10_svc_async_done() without notifying the EL3 firmware cause a
transaction ID desynchronization?

When an async transaction times out in stratix10_hwmon_async_read() or
rsu_send_async_msg(), the driver abandons the transaction and frees the ID:

drivers/firmware/stratix10-svc.c:stratix10_svc_async_done() {
    ...
	ida_free(&achan->job_id_pool,
		 STRATIX10_GET_JOBID(handle->transaction_id));
	kfree(handle);
}

Since there is no SMC cancellation command sent to the firmware, the firmwa=
re
might still process the timed-out request. If a new command allocates the
same recycled transaction ID, polling the firmware could return the delayed
completion of the original stale transaction.

Will this result in desynchronization between the driver and secure firmwar=
e,
potentially returning stale hwmon sensor readings or incorrect statuses?


[Severity: High]
This is a pre-existing issue, but does the missing cleanup of the async
client on driver removal cause a memory leak and break subsequent probes?

Looking at stratix10_rsu_remove() in drivers/firmware/stratix10-rsu.c:

drivers/firmware/stratix10-rsu.c:stratix10_rsu_remove() {
	struct stratix10_rsu_priv *priv =3D platform_get_drvdata(pdev);

	stratix10_svc_free_channel(priv->chan);
}

It calls stratix10_svc_free_channel() but completely omits calling
stratix10_svc_remove_async_client(). This leaves chan->async_chan
populated on the shared channel array and leaks the asynchronous channel
object and its associated IDA pool.

If the module is unloaded and reloaded, will the next call to
stratix10_svc_add_async_client() inside stratix10_rsu_probe() encounter
a non-NULL async_chan and immediately return -EALREADY?

While the new hwmon driver introduced in this patchset appears to handle
this correctly, it seems the rsu driver remains permanently unable to
probe after a single removal until the system is rebooted.

>  		dev_err(ctrl->dev, "Invalid command ,%d\n", p_msg->command);
>  		ret =3D -EINVAL;
[ ... ]

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/cover.1781861409.gi=
t.tze.yee.ng@altera.com?part=3D3
