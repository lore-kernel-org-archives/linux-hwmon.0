Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4432F437465;
	Wed, 29 Jul 2026 22:01:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785362517; cv=none; b=XTtKqxFNuCfWPnRec2ADowef0D+ujyL0w+V5lMD5SYbJmG4M5M3VPC/IK7py4F8GEFy/y0Rjj9SD0d/q9Ig2/CNn4AiNWcXn7ttZBecUYkC9e/BCoxq3j1VeqAyEJjYPh74g+4xxJjxzpw33/O4YT5BiauSCwYywKTRYbyC3Zf8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785362517; c=relaxed/simple;
	bh=6Go96SxZCP8suIy8nJYPUUvPp+dEeUScRBQtGNFKcgY=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=gKwAepXaRWl17YVQsgpSPWasq1fLTrWotgQzwjeHZqh9sDFqjbz7/s3eHqaTEf5x+NLQsayYfONBODjWu+A6I8q1yn2mTyg8tGiKWhWdklcE8hpMuhBXvpfpfEQJIRkEBDN0B0sSOtPf3GXNK6lFMX3eBPniwP2EmEEHVozUZyU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=n6/SGjC7; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="n6/SGjC7"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3B6021F000E9;
	Wed, 29 Jul 2026 22:01:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1785362514;
	bh=CvnC1iozo2RrsdNupPlxmSwZuhi4jzjOEzfvn75Quxg=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=n6/SGjC79Zk7xHT97eGuVYDEDYbJR54UpKY1O5VyFImuyd3bm6uPhNAfrZDgIJ0pd
	 FnMho+3yc28gAcSfztMLNASt1Wu2tJK0Gcm99A79O0N5gZWqlE2fmsSTMD0sSDhTxy
	 l/DZvXCkwcp/2QtKEBSxvckbl3fA49afDGD0Xj2RJMgSSnbDOwyHDaiD2L9IIkwInY
	 EZ/uYBDHep8CbTRag1+4XM+2t5ZmTP46XuFs2a+Y0KZ6Fkj/n9fjBeGl/bzeENUV9v
	 khSnIbXh5Zx0RRkguPKLO980+f9Rk0TuV6sSRm9WGHRZBqLGM2lvKJPKJvHHejc97S
	 wGCG9IZ/Ppgrg==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v6 2/4] dt-bindings: hwmon: pmbus: add MPS MPQ8646
Reply-To: sashiko-reviews@lists.linux.dev
To: "Vincent Jardin" <vjardin@free.fr>
Cc: robh@kernel.org, conor+dt@kernel.org, linux-hwmon@vger.kernel.org, devicetree@vger.kernel.org
In-Reply-To: <20260729-mpq8646_v0-v6-2-98848151cdb4@free.fr>
References: <20260729-mpq8646_v0-v6-0-98848151cdb4@free.fr>
 <20260729-mpq8646_v0-v6-2-98848151cdb4@free.fr>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Wed, 29 Jul 2026 22:01:53 +0000
Message-Id: <20260729220154.3B6021F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [Medium] The newly added compatible string 'mps,mpq8646' lacks driver sup=
port in the mpq8785 PMBus driver.
--

--- Patch [2]: [PATCH v6 2/4] dt-bindings: hwmon: pmbus: add MPS MPQ8646 ---
commit 341628a3dba9f658492690f20d45d96084eb12d5
Author: Vincent Jardin <vjardin@free.fr>

dt-bindings: hwmon: pmbus: add MPS MPQ8646

This commit adds the mps,mpq8646 compatible string to the existing MPQ8785
device tree schema. The MPQ8646 step-down converter shares the same
constraints for the mps,vout-fb-divider-ratio-permille property as the
mpq8785.

> diff --git a/Documentation/devicetree/bindings/hwmon/pmbus/mps,mpq8785.ya=
ml b/Documentation/devicetree/bindings/hwmon/pmbus/mps,mpq8785.yaml
> index 90970a0433e95..d7a32fb3b7af6 100644
> --- a/Documentation/devicetree/bindings/hwmon/pmbus/mps,mpq8785.yaml
> +++ b/Documentation/devicetree/bindings/hwmon/pmbus/mps,mpq8785.yaml
> @@ -18,6 +18,7 @@ properties:
>        - mps,mpm3695
>        - mps,mpm3695-25
>        - mps,mpm82504
> +      - mps,mpq8646

[Severity: Medium]
Should the corresponding driver (drivers/hwmon/pmbus/mpq8785.c) also be
updated to match this new compatible string?

Because the DT schema specifies the compatible string as an enum rather than
allowing a fallback (e.g. to "mps,mpq8785"), it appears the MPQ8646 device=
=20
will fail to probe. The OF match table in mpq8785_of_match currently lacks=
=20
an entry for this new hardware:

static const struct of_device_id __maybe_unused mpq8785_of_match[] =3D {
	{ .compatible =3D "mps,mpm3695", .data =3D (void *)mpm3695 },
	{ .compatible =3D "mps,mpm3695-25", .data =3D (void *)mpm3695_25 },
	{ .compatible =3D "mps,mpm82504", .data =3D (void *)mpm82504 },
	{ .compatible =3D "mps,mpq8785", .data =3D (void *)mpq8785 },
	{ }
};

The I2C ID table in mpq8785_id is similarly missing an "mpq8646" entry.
Without these additions, will a device instantiated via this new standalone
compatible string be completely ignored by the driver?

>        - mps,mpq8785

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260729-mpq8646_v0=
-v6-0-98848151cdb4@free.fr?part=3D2
