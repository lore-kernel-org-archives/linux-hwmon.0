Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 23AA54A384D;
	Wed,  2 Sep 2026 14:38:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788359891; cv=none; b=VK9iLmedGSBzS0C3F4BsXlqCq+bofHOJDXb8tmowGfy6aWZdkcl8e7X3tKWCC75Ei+XaPYnrMJfBkj2lRNFQqV6JAalbqy4awY41THflC++ir9EVSm2ILQxusodhPUYL4a+PbNozPtgnR8xNFa8feRX4qfv/8B4G6SwVUT3slu0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788359891; c=relaxed/simple;
	bh=cXveDt/unrnCrTUfivZLr0rkb0AuaxlZUGujV2FXNnU=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=GZIzIdF6tXi+7AXjeL72skpYt1H2yCPqEBEOayJT9NMKYKLBeyKMKs369Dv4MQbSCX5VbB0jAb6K8UPQBJE5xIqGhGl2ddEy16GBQslQ4CAwp7VY79BufwTldkkZ+lSbAS0KgvDbB2ELaNb0RSKV462xlFqJnBOeMcwjow7AjUY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=JW2EL37M; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="JW2EL37M"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A9A0C1F000E9;
	Wed,  2 Sep 2026 14:38:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1788359890;
	bh=gMee02k0OGJWtpCJdeKTbo30RCCG7qbuoNOg3CitzBk=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=JW2EL37My/sF+1CzbOJBLTz0zgXO3wPfF1lx3i7VgGph7Fz0j2UeXgQnGZ4a1wEjR
	 x0bHdcid2bTEsX61wtAkKkBH4YssTSjtT1YROJM/mOtZNixozXvxNgNQj5OeaSWqME
	 ZDQeYkeyGENfF6de5WN48AknResh93qvM7jrd5NGBZFxSlYW6xBcSu9JuMtH9sKIEX
	 utyq+RyPskOF7rmwxQTDt5FIe4Ne5LVmhI7LGm+lIgnlq039Jpr4Itli12lT/V5w9i
	 SNpMmdWDGgmBnz8FUU3h9lrmOBs6JC2712qBO7R+aZSrL5WwS3XqkE71IuSpe91dQt
	 E/pVYZ6+dz2KA==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v3] dt-bindings: hwmon: ti,tmp401: add
 #thermal-sensor-cells
Reply-To: sashiko-reviews@lists.linux.dev
To: "Vincent Jardin" <vjardin@free.fr>
Cc: robh@kernel.org, linux-hwmon@vger.kernel.org, conor+dt@kernel.org, devicetree@vger.kernel.org
In-Reply-To: <20260902-for-upstream-dt-tmp401-vcc-tsc-v3-1-49c484d2f08b@free.fr>
References: <20260902-for-upstream-dt-tmp401-vcc-tsc-v3-1-49c484d2f08b@free.fr>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Wed, 02 Sep 2026 14:38:09 +0000
Message-Id: <20260902143809.A9A0C1F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>

> From: Vincent Jardin <vjardin@free.fr>
>=20
> Since commit
>   a3b61ba2558e ("hwmon: (tmp401) register with thermal subsystem")
> the driver sets HWMON_C_REGISTER_TZ, so the hwmon core calls
> devm_thermal_of_zone_register() for every temperature channel and the
> device can be referenced as a thermal sensor.
>=20
> Signed-off-by: Vincent Jardin <vjardin@free.fr>

Sashiko has reviewed this patch and found no issues. It looks great!

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260902-for-upstre=
am-dt-tmp401-vcc-tsc-v3-1-49c484d2f08b@free.fr?part=3D1

