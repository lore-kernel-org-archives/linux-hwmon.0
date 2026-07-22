Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F16CC4749F4;
	Wed, 22 Jul 2026 16:31:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784737887; cv=none; b=YN5w+teh8T8aMbAUtpiKvAZFFBdKCQczW7y79k5FGwYCfO11oEtlK4T3v1ywvgTy8AzYuVWwDX1tXJEcA8/kzbMm7mujA7VcwjD5in/FMDpK67b/cGkfoccrN7iw7KILxIFIxg7mSrQCOmvWbbvCYjLtX3Kal4GYVSeyrIJTHGg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784737887; c=relaxed/simple;
	bh=A7lRGkMaqzwztaInnFZrgPGas9yPtB9Emz4zK0QAHAk=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=dPUaoqVoWCkYlqKH5zNe4WMjSOmW6pbLIaHoq59bUzQiDYAanZecMUuqF9xc6JS1/NYaqHE3S3r/7ANDYsSK3mFDZguExNVvyrgqQjfpw2CJkmt/RPx5YyroqHkypLTTW7Ax8VM0ugFHnLDYWSJhsaTu3S1wz+2Fh+I7FGzJ5Ps=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=do2H7Ftd; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="do2H7Ftd"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5F07B1F000E9;
	Wed, 22 Jul 2026 16:31:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1784737885;
	bh=A7lRGkMaqzwztaInnFZrgPGas9yPtB9Emz4zK0QAHAk=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=do2H7FtdokKJQDXfiJhy4atXdL7OyrLkdJLczvSjDKAe9zou6Z1GEclkCkKti4hDr
	 ged0XxHdHUoQ7xZ0bv5jxg/XUw/tSw7HLfO5FiJ54LAKL4wejwOF0Q4UEy4eswLALd
	 49O/FKWIJN2chdJkUcHysY/Qr8cb8Jn1aHifkhCgZORot+B9lytoJAdzdNTJ30USpQ
	 BEhsEV5n8Lvv9goCDUGUE27wGhg9h6rOHlaP/qeAdzcMCDn7JxO5y1dSxYEKfvKMWf
	 8L7nnJOxReML5TjYX1QJtFccDtCc1Wimv2F2i1d2jCP+XanNVt2uLLtwBLA3uaP+mZ
	 26tu2R2k1WWWg==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH 2/2] hwmon: (pmbus/vt7505) Add driver for Analog Devices
 MAX16545/MAX16550 and Volterra VT7505
Reply-To: sashiko-reviews@lists.linux.dev
To: =?utf-8?b?UHJhZGhhbiwgU2FubWFu?= <sanman.pradhan@hpe.com>
Cc: conor+dt@kernel.org, robh@kernel.org, devicetree@vger.kernel.org, linux-hwmon@vger.kernel.org
In-Reply-To: <20260722150324.164799-3-sanman.pradhan@hpe.com>
References: <20260722150324.164799-1-sanman.pradhan@hpe.com>
 <20260722150324.164799-3-sanman.pradhan@hpe.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Wed, 22 Jul 2026 16:31:24 +0000
Message-Id: <20260722163125.5F07B1F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>

> From: Georgi Vlaev <gvlaev@juniper.net>
>=20
> Add a PMBus driver for the Analog Devices MAX16545 and MAX16550, and the
> Volterra VT7505 controllers. The driver reports input/output voltage,
> input/output current, input power and temperature over PMBus. All values
> use the direct data format. Peak input voltage, output voltage, output
> current, input power and temperature readings are exposed and can be
> reset.
>=20
> The reported current and power depend on the external current-report
> resistor connected to the ILOAD pin, which can be provided through the
> "adi,rload-ohms" device tree property.
>=20
> Signed-off-by: Georgi Vlaev <gvlaev@juniper.net>
> Co-developed-by: Dhruva Devineni <ddevineni@juniper.net>
> Signed-off-by: Dhruva Devineni <ddevineni@juniper.net>
> Co-developed-by: Debjit Ghosh <dghosh@juniper.net>
> Signed-off-by: Debjit Ghosh <dghosh@juniper.net>
> Co-developed-by: JawaharBalaji Thirumalaisamy <jawaharb@juniper.net>
> Signed-off-by: JawaharBalaji Thirumalaisamy <jawaharb@juniper.net>
> Co-developed-by: Avadhut Naik <avadhutn@juniper.net>
> Signed-off-by: Avadhut Naik <avadhutn@juniper.net>
> Co-developed-by: Santhanakrishnan Balraj <sbalraj@juniper.net>
> Signed-off-by: Santhanakrishnan Balraj <sbalraj@juniper.net>
> Co-developed-by: Brian Mak <makb@juniper.net>
> Signed-off-by: Brian Mak <makb@juniper.net>
> Signed-off-by: Sanman Pradhan <psanman@juniper.net>

Sashiko has reviewed this patch and found no issues. It looks great!

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260722150324.1647=
99-1-sanman.pradhan@hpe.com?part=3D2

