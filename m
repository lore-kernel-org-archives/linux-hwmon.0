Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 623CD37F32A
	for <linux-hwmon@vger.kernel.org>; Tue,  1 Sep 2026 21:23:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788297786; cv=none; b=moXay/FXw3zr7ZEGLu5aN+FbMlHPGY+w7RFN6ooEEURDFB0btWyg8iiQNvADBMEAE5PfEC+cyE0PsqY6PCwV+U9pIun5reBTCs/+a3oG2tuM/g4mKrb3anFn8gHqqJXj1CVdfRFTmVWiZjKs7kMrihLgl5KQDcnDUzaWvjU87T8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788297786; c=relaxed/simple;
	bh=/m2R7tNg+YBZcG75sBzGjdJNAHNh2VeilWke0rYPD3w=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=ew+HlUban72FcaFCLzO1pOS5rdX2pubP2H3Ha+eZhQSie1hUaDvPvSM7XU7mgq9hcioDB/e/5ROG3x97MjLpQT6kWg+4lW55NW7gqCC4R/2LUqW7Gw5QgNn8ozmscPjmEXNDqJRNXCoDDCu1quNSrniGHocBJzqC0GZMLOKQK8s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=hequ1u7O; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="hequ1u7O"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id EF7891F00A3D;
	Tue,  1 Sep 2026 21:23:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1788297785;
	bh=/m2R7tNg+YBZcG75sBzGjdJNAHNh2VeilWke0rYPD3w=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=hequ1u7OW+I0p9FBhpo9meK2Vx0h1MY9v6y+fhKeJs3S0b3ggO+PtxV6W2e+KPToe
	 sCZWz3IMda+GBE88MGGhJxKTh7fUOrZlsTmheE9n23K8F0VKV0i/hYdCp5YhwnnVgE
	 V3vfYjY18Bn18B9uL7NpTMvxwMuSpFNCc12LC8YtfG7HYSGOtfONvhrURcS5q/eV1h
	 2FV5Z83gEzHWHjcqNfTloWdMWfXmh2nSIhK/ivGZM1NJx8ihe52rUVL6nLzoyr9LH4
	 E33wc6GIOpYW6kKkWwlcynV37MHCTSAixsq7AnyTyp+CF144DLlWd0KsJ212G8ew1L
	 eXAVhMYFQnG8w==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH net-next v2 5/6] eth: fbnic: report temperature and
 voltage alarms via hwmon
Reply-To: sashiko-reviews@lists.linux.dev
To: "Zinc Lim" <limzhineng2@gmail.com>
Cc: linux-hwmon@vger.kernel.org
In-Reply-To: <20260831212234.1212971-6-limzhineng2@gmail.com>
References: <20260831212234.1212971-1-limzhineng2@gmail.com>
 <20260831212234.1212971-6-limzhineng2@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Tue, 01 Sep 2026 21:23:04 +0000
Message-Id: <20260901212304.EF7891F00A3D@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>

> Building on the temperature and voltage thresholds stored in
> fbnic_fw_cap, expose alarm attributes through the hwmon interface:
> temp1_{min,max,crit}_alarm and in0_{min,max}_alarm.
>=20
> Each alarm is computed by taking a live sensor reading and comparing it
> against the corresponding stored threshold. The static thresholds
> (min/max/crit) are returned first straight from fbnic_fw_cap without a
> firmware round-trip, and unsupported attributes are rejected up front, so
> only attributes that actually need a live value fall through to a single
> sensor read that then feeds input and every alarm.
>=20
> A threshold the firmware did not populate reports -ENODATA for both the
> threshold attribute and its alarm.
>=20
> Signed-off-by: Zinc Lim <limzhineng2@gmail.com>

Sashiko has reviewed this patch and found no issues. It looks great!

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260831212234.1212=
971-1-limzhineng2@gmail.com?part=3D5

