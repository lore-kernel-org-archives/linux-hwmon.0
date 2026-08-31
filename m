Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 72B7E3A9871
	for <linux-hwmon@vger.kernel.org>; Mon, 31 Aug 2026 18:17:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788200256; cv=none; b=uHN92TaSu+Ni1MA4rDp51OyG8aXIE+oGCpP8oH4F3jsXs1l+5awIDHnVsKHmHgd86LqnQHtr3O/7gwn5alY0DFZ90om7lvLaNubIlFiFXdrZZUE5me6IlFJO6YKzZFq1msgdkpxdmbEDCL3oGxTxjFX97tlhxZXBtAIEDUpkWmQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788200256; c=relaxed/simple;
	bh=mZVkrlK7Wbii84A3g2AiWskKNBFAWa+5iuce69K3aLY=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=P8YHLdJ/EbGEFReeH2nPLuEbN9tHydekUdSTJL1OdVXOjwNuvRCJDDD1xcAzNqD+fgTyYRI8JOdKZnIghL3BhqrvaHb3W6GwH2aPwCzWNEk/zf6RVePqjsemcjke9RnXmMIr7dHI1cFCCQ9DMI2DzP7ccI+b7/rL4JfjBZLGQmY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=KVd0pyCP; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="KVd0pyCP"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0AD551F00A3D;
	Mon, 31 Aug 2026 18:17:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1788200255;
	bh=lAiAHMuER91FIyUrsw2TBZA2hAZKadUkMp1FkjliJS8=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=KVd0pyCPQ3WZv2sxh+2MvqgY8NUglfRLGBYvTnByYRpyc+TTZhXSt6YlI8q31xMby
	 hMIY5GIAhEN5Nn98SS/lJSy5O30vOEARQ0V0nNtqcZsUHbPrqdTU95zsCOOwRjsmXv
	 0AtzLe08DvUehwU8QWSUCs8hYcD1wDPVWqyj1xK88d5eCUgeLYzw7VtK4rF9fasi9T
	 KtYuFrHorxeC5RK2c/qsJ3FTlW1jbTbyqcYQhUG+qukBZs/xHUF1dgvkpVUd45pFYi
	 I1HUaY80HPTobJEAE3OYjFdWXU09NDd5rg0L8Hg7l+ag0poa8q3kooAcZh4kbblO0w
	 q2hs7Yk7Ed+xA==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH 1/2] platform: arm64: Add Radxa SVC GLINK driver
Reply-To: sashiko-reviews@lists.linux.dev
To: "Xilin Wu" <sophon@radxa.com>
Cc: linux-hwmon@vger.kernel.org
In-Reply-To: <20260831-radxa-svc-v1-1-7c028de6a387@radxa.com>
References: <20260831-radxa-svc-v1-0-7c028de6a387@radxa.com>
 <20260831-radxa-svc-v1-1-7c028de6a387@radxa.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Mon, 31 Aug 2026 18:17:34 +0000
Message-Id: <20260831181735.0AD551F00A3D@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 5 potential issue(=
s) to consider:
- [High] The rpmsg callback can be invoked before driver probe initializes =
data, leading to a NULL pointer dereference.
- [Medium] A spurious completion from a timed-out request can incorrectly f=
ulfill a subsequent request due to `complete()` being called outside `rsp_l=
ock`.
- [Medium] Strict response size checking rejects valid larger responses fro=
m newer firmware, breaking forward compatibility.
- [Low] The driver is placed in `drivers/platform/arm64/` instead of `drive=
rs/hwmon/` despite its primary function being hardware monitoring.
- [Low] Redundant custom locking used for hwmon sysfs attributes.
--

commit 5b64da1a0118d30a0e8b618d6109d99215fbbd93
Author: Xilin Wu <sophon@radxa.com>

platform: arm64: Add Radxa SVC GLINK driver

This commit adds an rpmsg client driver for the RADXA_SVC_ADSP_APPS firmwar=
e=20
service on Radxa boards with Qualcomm SoCs. It exposes fan control=20
functionality via the standard hwmon interface.

> diff --git a/drivers/platform/arm64/Kconfig b/drivers/platform/arm64/Kcon=
fig
> index e32e01b2a9bdd..60c1e541fe899 100644
> --- a/drivers/platform/arm64/Kconfig
> +++ b/drivers/platform/arm64/Kconfig
[ ... ]
> +config RADXA_SVC_GLINK
> +	tristate "Radxa SVC GLINK driver"
> +	depends on ARCH_QCOM || COMPILE_TEST

[Severity: Low]
Should this driver be located in drivers/hwmon/ instead? HWMON guidelines
mandate that drivers whose primary functionality is hardware monitoring must
reside in drivers/hwmon/. Placing it in the platform directory bypasses
proper maintainer review and violates subsystem layering, given that this
driver exclusively registers a hardware monitoring device for fan control.

> +	depends on RPMSG
> +	depends on HWMON

[ ... ]
> diff --git a/drivers/platform/arm64/radxa_svc_glink.c b/drivers/platform/=
arm64/radxa_svc_glink.c
> new file mode 100644
> index 0000000000000..1c91bfabcd126
> --- /dev/null
> +++ b/drivers/platform/arm64/radxa_svc_glink.c
[ ... ]
> +static int radxa_svc_request(struct radxa_svc_glink *svc, u32 opcode,
> +			     const void *req_payload, size_t req_len,
> +			     void *rsp_payload, size_t *rsp_len)
> +{
[ ... ]
> +	if (req_len)
> +		memcpy(tx_buf + sizeof(*hdr), req_payload, req_len);
> +
> +	reinit_completion(&svc->rsp);
> +
> +	spin_lock_irqsave(&svc->rsp_lock, flags);

[Severity: Medium]
Can this reinit_completion() race with a delayed completion from a previous
timed-out request? If a request times out, radxa_svc_request() cleans up and
returns, but if the rpmsg callback thread had already set do_complete =3D t=
rue
under lock and got preempted before calling complete(), that delayed comple=
te()
will execute shortly after. When a new request starts and calls
reinit_completion(), the delayed complete() from the previous transaction
would incorrectly fulfill this new request with stale payload data.

> +	if (svc->shutting_down) {
> +		spin_unlock_irqrestore(&svc->rsp_lock, flags);
[ ... ]
> +	spin_lock_irqsave(&svc->rsp_lock, flags);
> +	if (svc->shutting_down) {
> +		ret =3D -ENODEV;
> +	} else if (svc->rsp_opcode !=3D opcode) {
> +		ret =3D -EIO;
> +	} else {
> +		ret =3D svc->rsp_status;
> +		if (rsp_payload && rsp_len) {
> +			size_t copy_len =3D min(*rsp_len, svc->rsp_len);
> +
> +			memcpy(rsp_payload, svc->rsp_payload, copy_len);
> +			if (*rsp_len < svc->rsp_len && !ret)
> +				ret =3D -EMSGSIZE;

[Severity: Medium]
Will this strict size check break forward compatibility? If a newer firmware
version appends additional fields to the response, svc->rsp_len will be
greater than *rsp_len. Changing ret to -EMSGSIZE here will cause the driver
to fail rather than safely ignoring the trailing unknown bytes.

> +			*rsp_len =3D svc->rsp_len;
> +		}
> +	}
> +	spin_unlock_irqrestore(&svc->rsp_lock, flags);
[ ... ]
> +static int radxa_svc_rpmsg_callback(struct rpmsg_device *rpdev, void *da=
ta,
> +				    int len, void *priv, u32 addr)
> +{
> +	struct radxa_svc_glink *svc =3D dev_get_drvdata(&rpdev->dev);
> +	const struct radxa_svc_hdr *hdr =3D data;
> +	unsigned long flags;
[ ... ]
> +	seq =3D le32_to_cpu(hdr->seq);
> +
> +	spin_lock_irqsave(&svc->rsp_lock, flags);

[Severity: High]
Could this result in a NULL pointer dereference during early initialization?
Because radxa_svc_rpmsg_driver sets the callback in its definition, the rpm=
sg
core can activate the endpoint and invoke this callback before the driver's
probe function completes. If an unsolicited firmware message arrives before
dev_set_drvdata() is executed in radxa_svc_rpmsg_probe(), dev_get_drvdata()
will return NULL here, causing a crash when dereferencing svc->rsp_lock.

> +	if (svc->pending && seq =3D=3D svc->pending_seq) {
> +		svc->rsp_opcode =3D le32_to_cpu(hdr->opcode);
> +		svc->rsp_status =3D (s32)le32_to_cpu(hdr->status);
> +		svc->rsp_len =3D payload_len;
> +		memcpy(svc->rsp_payload, data + header_size, payload_len);
> +		svc->pending =3D false;
> +		do_complete =3D true;
> +	}
> +	spin_unlock_irqrestore(&svc->rsp_lock, flags);
> +
> +	if (do_complete)
> +		complete(&svc->rsp);

[Severity: Medium]
This isn't a bug in this exact location, but calling complete() outside the
spinlock here allows it to race with the reinit_completion() of a subsequent
request as detailed above.

> +
> +	return 0;
[ ... ]
> +static int radxa_svc_hwmon_read(struct device *dev,
> +				enum hwmon_sensor_types type, u32 attr,
> +				int channel, long *val)
> +{
> +	struct radxa_svc_glink *svc =3D dev_get_drvdata(dev);
> +	struct radxa_svc_fan_state_resp state =3D {};
[ ... ]
> +	case hwmon_pwm_enable:
> +		mutex_lock(&svc->fan_lock);

[Severity: Low]
Is this custom locking redundant? The hardware monitoring subsystem core
automatically serializes sysfs operations for attributes registered via the
info parameter of hwmon_device_register_with_info(). Relying on the hwmon c=
ore
for serialization avoids API layering violations.

> +		ret =3D radxa_svc_fan_get_pwm_mode(svc, val);
> +		mutex_unlock(&svc->fan_lock);
> +
> +		return ret;
> +	default:
> +		return -EOPNOTSUPP;
> +	}
> +}
> +
> +static int radxa_svc_hwmon_write(struct device *dev,
> +				 enum hwmon_sensor_types type, u32 attr,
> +				 int channel, long val)
> +{
> +	struct radxa_svc_glink *svc =3D dev_get_drvdata(dev);
> +	struct radxa_svc_fan_control_resp control =3D {};
> +	int ret;
> +
> +	if (type !=3D hwmon_pwm || channel)
> +		return -EOPNOTSUPP;
> +
> +	mutex_lock(&svc->fan_lock);

[Severity: Low]
Like above, this custom fan_lock is likely redundant since the hwmon core
already serializes sysfs writes.

> +
> +	switch (attr) {
[ ... ]

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260831-radxa-svc-=
v1-0-7c028de6a387@radxa.com?part=3D1
