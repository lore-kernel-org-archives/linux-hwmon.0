Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F23983A9636;
	Tue, 23 Jun 2026 05:59:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782194391; cv=none; b=rcEqtDsqPQU3tmaXHwbcJGv3Iqtz+fCUyq/UYb+fOAVuzJvW0PEmYNBnqxNWZyKXFBMuVokrpT3hktB7l9SyOwDseKDBBSE26ijSnaHQ3eRW86HDDswe+mu7rInnF3KqHEJlJGXF22hA/V4HGciKOOii+XMFMA3iOzZ4It02Wx0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782194391; c=relaxed/simple;
	bh=71WNkn5w5AYpdrutHmOeGz1dRyc4Ow6qqbGl1jOcaeE=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=QSJPKilWosmzJHossLGT6xQteZu8SUtr/dC79TvwRA9Pkb1lc7KPS6gyXCrBWGncPE35o5Dpp+hXdiYbXnNN7gP8P0G4JFnFfN3Eyfl3x9k1m/covZgqOzhImKwBXwjR40g6Nr9TtMgByp+nRkFd1gmXn/1DOWqyXUdLyFxtriU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=AsnRcuOS; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="AsnRcuOS"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4B7BF1F000E9;
	Tue, 23 Jun 2026 05:59:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1782194389;
	bh=wwjN/ccaYU511nF1JEwQ9WtxkYJa1rTgn7bbZfDXPuM=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=AsnRcuOSWyeBDcqVEeUEY44Ht3Xt+f13a+tWPP69S8J6WplYJ7hyC9XA1tfoxWEpY
	 1w9hhnTf63Bvi1VPjhYyeOeQC6eJakkkYkhJCWjnJUyuvgf2Cj6+7FEQfK7vbPxyXe
	 2FSdOeoyVnI3AqanfiYdAF3u2rmn+UDsPhGvB97o+YWpkToqsBxFtOHkzQkBX+tjzB
	 fa/yKrth0pTnk8U7v16vuWVWEgahF9XdN98lXml7mKCmrrchwb0Glbg8ANeokMzAVG
	 7MzIqN7JSCAbvy82HT6rRBd+flqXkKgeFOYs6bWXJK3K55v9+ZL8Ys9KodwMatfwj1
	 O42SyPjeu5p5w==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH 1/3] Documentation/hwmon: Add onsemi's FD5121
 controllers' documentation
Reply-To: sashiko-reviews@lists.linux.dev
To: "Selvamani Rajagopal via B4 Relay" <devnull+Selvamani.Rajagopal.onsemi.com@kernel.org>
Cc: robh@kernel.org, devicetree@vger.kernel.org, conor+dt@kernel.org, linux-hwmon@vger.kernel.org
In-Reply-To: <20260622-support-fd5121-from-onsemi-v1-1-b31767689c65@onsemi.com>
References: <20260622-support-fd5121-from-onsemi-v1-0-b31767689c65@onsemi.com>
 <20260622-support-fd5121-from-onsemi-v1-1-b31767689c65@onsemi.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Tue, 23 Jun 2026 05:59:48 +0000
Message-Id: <20260623055949.4B7BF1F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 2 potential issue(=
s) to consider:
- [Low] Sysfs attribute descriptions contain mismatched input/output semant=
ics due to copy-paste errors.
- [Low] Incomplete sentence missing a trailing period.
--

commit 10fc2806e78d641ce1fc7f05d01f0cec8dcccbe0
Author: Selvamani Rajagopal <Selvamani.Rajagopal@onsemi.com>

Documentation/hwmon: Add onsemi's FD5121 controllers' documentation

This commit documents the hardware monitoring support for FD5121, FD5123,
and FD5125 devices. It describes the supported telemetry data exposed via
sysfs, including voltage, current, power, and temperature measurements.

> diff --git a/Documentation/hwmon/fd5121.rst b/Documentation/hwmon/fd5121.=
rst
> new file mode 100644
> index 0000000000000..c279db4641e4a
> --- /dev/null
> +++ b/Documentation/hwmon/fd5121.rst

[ ... ]

> +Usage Notes
> +-----------
> +
> +This driver does not probe for PMBus devices. You will have
> +to instantiate devices explicitly.
> +
> +Example: the following commands will load the driver for the
> +controller at address 0x50 on I2C bus #1::
> +
> +    # modprobe fd5121
> +    # echo fd5121 0x50 > /sys/bus/i2c/devices/i2c-1/new_device
> +
> +It can also be instantiated by declaring in device tree

[Severity: Low]
This isn't a bug, but this sentence ends abruptly without a trailing period.

> +Sysfs attributes
> +----------------
> +
> +The following attributes are supported:
> +
> +=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D  =3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> +curr[1-2]_label		"iin[1-2]"
> +curr[3-4]_label		"iout[1-2]"
> +curr[1-2]_input		Measured input current.
> +curr[3-4]_input		Measured output current.
> +curr[1-4]_crit_alarm	Output current critical high alarm.
> +curr[1-4]_max_alarm	Output current high alarm.

[Severity: Low]
Are the alarm descriptions for curr[1-2] accurate? Since curr[1-2] are labe=
led
as input current, should their alarms be described as input current alarms
instead of output current alarms?

> +
> +in[1-2]_label		"vin[1-2]"
> +in[3-4]_label		"vout[1-2]"
> +in[1-4]_lcrit_alarm	Input voltage critical low alarm.
> +in[1-4]_crit_alarm	Input voltage critical high alarm.

[Severity: Low]
Similarly, are the alarm descriptions for in[3-4] correct? They are labeled=
 as
output voltage, but their alarms are described as input voltage alarms.

> +in[1-2]_max_alarm	Input voltage high alarm.
> +in[1-2]_input           Measured input voltage.
> +in[3-4]_input           Measured output voltage.
> +
> +power[1-2]_label	"pin[1-2]"
> +power[3-4]_label	"pout[1-2]"
> +power[3-4]_crit_alarm	Output power critical high alarm.
> +power[1-2]_max_alarm	Output power high alarm.

[Severity: Low]
Should power[1-2]_max_alarm be described as an input power high alarm, given
that power[1-2] represents input power?

> +power[1-4]_max          Power limit.
> +power[1-4]_input        Measured input power.

[Severity: Low]
Does power[3-4]_input actually measure input power? Given that power[3-4] is
labeled as output power, shouldn't this be described as measured output pow=
er?

> +power[3-4]_crit         Critical maximum output power.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260622-support-fd=
5121-from-onsemi-v1-0-b31767689c65@onsemi.com?part=3D1
