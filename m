Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6723F4A3D4C
	for <linux-hwmon@vger.kernel.org>; Thu, 15 Oct 2026 22:22:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792102971; cv=none; b=kiwdFIIubixb6oOlItQQO5UZUuPkbAVsndIAJBHMT92EbqUEUsa8Io7/h0+qM8V/hn4LGNpX3nWJjvFZYI5YfRXldLw0wWhNREwhXkQrd2fREyqHhA047OpsTBI7gxH9gX08Lo1tc5UdpCerL1RzfFZKJwRYJoMCmt+fR138044=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792102971; c=relaxed/simple;
	bh=JFnmVaoTfFJAiK0v9lbYNnxX+RlMkGpXfqsxrmruPlI=;
	h=Message-ID:From:Subject:To:Cc:In-Reply-To:References:Content-Type:
	 Date; b=BQK8EOu6bzGWj+OvRkK9DGJB4umCtZd/DD23dUIHVHZ+ufafFb7gqMkcn950xcoIi2vHfEERdx8vY4F8MiWYD5D7v3goBe5QXAdEj1RAgrd4+TNymzEyHpoNIWAybyQFvYqfarOdaFc3YupcYVgHLIt8bIiMCOO9gZc2MdeGZS0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=bPd/05TS; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="bPd/05TS"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8EA4F1F000C6;
	Thu, 15 Oct 2026 22:22:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1792102968;
	bh=Snckx951cU8HrYZEuP11ZWDcinC9U3/Wht4QNFRt0N8=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=bPd/05TS3+FSo0mELALZJ6gX89BYSRkmY+BM1ZZq+D5o48oHxwI7dcAMwnED5R0A9
	 8fSI+ZgfVnhs0vPawPFfVqXns+W4uv/g6w1IZflGVUA/76oIW98ed0ilHpjajcCsOt
	 qJJ+r5+kN9xr7xC1fYjGjW/PLyfgVINpS44HKs0oLXDc8wFL8oJkIGgqmNzXp+30C5
	 mD9+RZLcZJ35NEzqVMTs2JSQ/VNFj5gxWFE9IfbXSaAeYCYUrkqpJysplHIsO0cXIc
	 bsS7lL0gVWGl4l+vjlo8m1CpuxzIvzIcYNQAOmtHNUBWyrDj4OUHYi+giwHzWUwkbc
	 uKybRs+g8A/5A==
Message-ID: <sashiko-outbox-173446@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH net-next v4 3/6] eth: fbnic: report temperature and
 voltage thresholds via hwmon
Reply-To: sashiko-reviews@lists.linux.dev
To: "Zinc Lim" <limzhineng2@gmail.com>
Cc: linux-hwmon@vger.kernel.org
In-Reply-To: <20261014222225.2803660-4-limzhineng2@gmail.com>
References: <20261014222225.2803660-1-limzhineng2@gmail.com>
 <20261014222225.2803660-4-limzhineng2@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Thu, 15 Oct 2026 22:22:48 +0000
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [Medium] fbnic: data race in lockless hwmon threshold reads
--

commit 9e534754533bccab7e48537807cfa9b4798362f0
Author: Zinc Lim <limzhineng2@gmail.com>

    eth: fbnic: report temperature and voltage thresholds via hwmon
   =20
    The firmware capability response carries per-board temperature
    (min/max/crit) and voltage (min/max) thresholds. Parse and store them in
    fbnic_fw_cap, and expose them through the hwmon interface as
    temp1_{min,max,crit} and in0_{min,max}.

> diff --git a/drivers/net/ethernet/meta/fbnic/fbnic_fw.c b/drivers/net/eth=
ernet/meta/fbnic/fbnic_fw.c
> index 82307f212f583..d9a00a2ef34da 100644
> --- a/drivers/net/ethernet/meta/fbnic/fbnic_fw.c
> +++ b/drivers/net/ethernet/meta/fbnic/fbnic_fw.c
[ ... ]
> @@ -95,15 +95,25 @@ static void fbnic_mbx_reset_desc_ring(struct fbnic_de=
v *fbd, int mbx_idx)
>  void fbnic_mbx_init(struct fbnic_dev *fbd)
>  {
> +	struct fbnic_fw_cap fw_cap_reset;
>  	int i;
> =20
>  	/* Initialize lock to protect Tx ring */
>  	spin_lock_init(&fbd->fw_tx_lock);
> =20
> -	/* Reset FW Capabilities */
> -	memset(&fbd->fw_cap, 0, sizeof(fbd->fw_cap));
> +	/* Reset FW Capabilities and seed thresholds with sentinel */
> +	memset(&fw_cap_reset, 0, sizeof(fw_cap_reset));
> +	fw_cap_reset.temp =3D fbnic_threshold_no_data;
> +	fw_cap_reset.volt =3D fbnic_threshold_no_data;
> +	fbd->fw_cap =3D fw_cap_reset;
        ^^^^^^^^^^^^^^^^^^^^^^^^^^
[Severity: Medium]
Could this structure assignment result in a data race?

Since fbnic_mbx_init() is invoked during AER recovery, it performs a
non-atomic overwrite of the capability structure. The hwmon device stays
registered, and user-space tasks are not frozen, meaning concurrent sysfs
reads of the thresholds might read partially updated or garbage values.

[ ... ]
> @@ -742,6 +757,22 @@ static int fbnic_fw_parse_cap_resp(void *opaque, str=
uct fbnic_tlv_msg **results)
>  	fbd->fw_cap.anti_rollback_version =3D
>  		fta_get_uint(results, FBNIC_FW_CAP_RESP_ANTI_ROLLBACK_VERSION);
> =20
> +	fbd->fw_cap.temp.min =3D
> +		fbnic_tlv_attr_get_signed(results[FBNIC_FW_CAP_RESP_TEMP_MIN],
> +					  FBNIC_SENSOR_NO_DATA);
        ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^=
^^^
[Severity: Medium]
Similarly, does this lockless update in the NAPI/IRQ handler risk tearing
if it races with lockless hwmon sysfs reads?

> +	fbd->fw_cap.temp.max =3D
> +		fbnic_tlv_attr_get_signed(results[FBNIC_FW_CAP_RESP_TEMP_MAX],
> +					  FBNIC_SENSOR_NO_DATA);
[ ... ]
> diff --git a/drivers/net/ethernet/meta/fbnic/fbnic_hwmon.c b/drivers/net/=
ethernet/meta/fbnic/fbnic_hwmon.c
> index 0c3fe2a372275..4df808f850cf8 100644
> --- a/drivers/net/ethernet/meta/fbnic/fbnic_hwmon.c
> +++ b/drivers/net/ethernet/meta/fbnic/fbnic_hwmon.c
[ ... ]
> @@ -92,14 +111,58 @@ static int fbnic_hwmon_sensor_read(struct fbnic_dev =
*fbd, int id, long *val)
>  	return err;
>  }
> =20
> +static int fbnic_hwmon_read_threshold(long thr, long *val)
> +{
> +	if (thr =3D=3D FBNIC_SENSOR_NO_DATA)
> +		return -ENODATA;
> +
> +	*val =3D thr;
> +	return 0;
> +}
> +
> +static int fbnic_hwmon_temp_read(struct fbnic_dev *fbd, u32 attr, long *=
val)
> +{
> +	switch (attr) {
> +	case hwmon_temp_input:
> +		return fbnic_hwmon_sensor_read(fbd, FBNIC_SENSOR_TEMP, val);
> +	case hwmon_temp_min:
> +		return fbnic_hwmon_read_threshold(fbd->fw_cap.temp.min, val);
                 ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^=
^^^
[Severity: Medium]
Could this lockless read return an inconsistent value to userspace if it
executes concurrently with the struct assignment in fbnic_mbx_init() or
the updates in fbnic_fw_parse_cap_resp()?

> +	case hwmon_temp_max:
> +		return fbnic_hwmon_read_threshold(fbd->fw_cap.temp.max, val);

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261014222225.2803=
660-1-limzhineng2@gmail.com?part=3D3
