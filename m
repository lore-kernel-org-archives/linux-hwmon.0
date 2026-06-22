Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DB4003A9D9D;
	Mon, 22 Jun 2026 12:32:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782131527; cv=none; b=aD7pKfXgSRrGIpSmTvqGoPu9aGYmfmu9bLk/slQRHfgHthfpGx4nN+9UDilFwVUvZU2EqsFAhxtIMJ4YjhQBVRHNc/jpH0uT28V7ffDDzOjY4F4+59qKdXKPJfqZZ3FbPpFA19HMaTQ9j3fjtoop87KCvpYCtCl+rkCPmPGbSho=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782131527; c=relaxed/simple;
	bh=04evc0QY9MwjCJ8HE6hm4vp8J6NmEVAwZvA5kdbf5yc=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=Mtd4hYVRsxecbyugRZQKKLHm2rg9FbDzLzlHxf49W9t9vc5V8idyRIQIgJ99qCZnD/DbAb4n0Mt4QkRBPAHQcM8UlUYRKTg1SIgN6aq0BeRwlpMa+hPMuUGfAZOf/80hYMpqtPV9EawkV0ShbX3En184mg4bvKNJKE2O+hJxSUo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=NhZRkgmx; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="NhZRkgmx"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 593E41F000E9;
	Mon, 22 Jun 2026 12:32:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1782131526;
	bh=VbXpqg6+W1jS9mSu1VviztJS3nelMMwwn4jOuQsl9X0=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=NhZRkgmxG28kGyX5qyDp5ah5N9Q1T93ga5VsltxM7742cWEF50SyIuaoUNQPrCdij
	 Wx9811afR1lsM7jScfBrhx7NCYtoRfmMYtpBl4rfwnvuyTGQhNHe8T98dESFDDHpSN
	 DRaYRsiavfFF7IzGJsgQ5olFqRA8vfWtnn3ywDsgRpkLIz5jfoB2joteuTI0EPm6VU
	 m8P5LJsCioBhM6zTim73tvB4MdPGHTgBwb3CpjpAAnXSwQ/FJJcnGmr6TLZyPc/uUZ
	 qmwIuJYYZIGae8/oEDY7/XrTh3O7YPt1vULEtK42XS1dEZXZE8IMjnKUDDss4Zw476
	 wYNMUb2RBfMyw==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH 1/2] dt-bindings: hwmon: chipcap2: Add label property
Reply-To: sashiko-reviews@lists.linux.dev
To: "Flaviu Nistor" <flaviu.nistor@gmail.com>
Cc: robh@kernel.org, conor+dt@kernel.org, devicetree@vger.kernel.org, linux-hwmon@vger.kernel.org
In-Reply-To: <20260622122200.14245-1-flaviu.nistor@gmail.com>
References: <20260622122200.14245-1-flaviu.nistor@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Mon, 22 Jun 2026 12:32:05 +0000
Message-Id: <20260622123206.593E41F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 2 potential issue(=
s) to consider:

New issues:
- [Low] The 'label' property description incorrectly refers to 'this channe=
l', but the property is applied to the top-level device node.

Pre-existing issues:
- [High] Threaded interrupt handlers modify shared state without holding an=
y locks, violating hwmon subsystem guidelines and causing potential loss of=
 alarm events.
--

commit 6b42d122bc193119c40ff5ee9be18fcec09fc567
Author: Flaviu Nistor <flaviu.nistor@gmail.com>

dt-bindings: hwmon: chipcap2: Add label property

Add support for an optional label property similar to other hwmon devices.
This allows, in case of boards with multiple CHIPCAP2 sensors, to assign
distinct names to each instance.

> diff --git a/Documentation/devicetree/bindings/hwmon/amphenol,chipcap2.ya=
ml b/Documentation/devicetree/bindings/hwmon/amphenol,chipcap2.yaml
> index 17351fdbefce6..f00b5a4b14ddd 100644
> --- a/Documentation/devicetree/bindings/hwmon/amphenol,chipcap2.yaml
> +++ b/Documentation/devicetree/bindings/hwmon/amphenol,chipcap2.yaml
> @@ -33,6 +33,10 @@ properties:
>    reg:
>      maxItems: 1
> =20
> +  label:
> +    description:
> +      A descriptive name for this channel, like "ambient" or "psu".

[Severity: Low]
Is this description accurate? The label property is being added to the
root node, so it applies to the entire device/instance rather than a single
channel.

The chipcap2 sensor provides multiple channels via a single device
node. Could the description be updated to clarify it names the entire sensor
rather than a single channel?

> +
>    interrupts:
>      items:
>        - description: measurement ready indicator

[Severity: High]
This is a pre-existing issue, but does drivers/hwmon/chipcap2.c lack
locking between the threaded interrupt handlers and the sysfs paths, which
could lead to lost alarm events?

The threaded interrupt handlers modify shared state without holding any
locks, which violates hwmon subsystem guidelines.

If an interrupt fires between the sysfs read and write:

CPU1 in drivers/hwmon/chipcap2.c:cc2_humidity_min_alarm_status() {
	...
	if (data->rh_alarm.low_alarm) {
		*val =3D (measurement < min_hyst) ? 1 : 0;

CPU2 in drivers/hwmon/chipcap2.c:cc2_low_interrupt() {
		cc2->rh_alarm.low_alarm =3D true;
}

CPU1 continues:
		data->rh_alarm.low_alarm =3D *val;
	} else {
		*val =3D 0;
	}
	...
}

The interrupt's update will be overwritten with 0 and permanently lost. The
hwmon subsystem guidelines require drivers to implement locking for interru=
pt
handling and sysfs attributes, recommending the use of hwmon_lock() and
hwmon_unlock().

Could this concurrent access to data->rh_alarm.low_alarm be protected?

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260622122200.1424=
5-1-flaviu.nistor@gmail.com?part=3D1
